package vn.beginner.laptopshop.controller.client;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import vn.beginner.laptopshop.domain.Product;
import vn.beginner.laptopshop.domain.User;
import vn.beginner.laptopshop.dto.RegisterDTO;
import vn.beginner.laptopshop.service.ProductService;
import vn.beginner.laptopshop.service.UserService;

import java.util.List;

@Controller
public class HomePageController {

    private final ProductService productService;
    private final PasswordEncoder passwordEncoder;
    private final UserService userService;

    public HomePageController(ProductService productService,
                              PasswordEncoder passwordEncoder,
                              UserService userService) {
        this.productService = productService;
        this.passwordEncoder = passwordEncoder;
        this.userService = userService;
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String getHomePage(Model model)
    {
        List<Product> productList = this.productService.getAllProducts();
        model.addAttribute("productList", productList);
        return "client/homepage/show-product";
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String registerPage(Model model)
    {
        model.addAttribute("registerUser", new RegisterDTO());
        return "client/auth/register";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String registerUser(@ModelAttribute("registerUser") @Valid  RegisterDTO registerDTO,
                               BindingResult bindingResult,
                               Model model)
    {
        //List<FieldError> errors = bindingResult.getFieldErrors();
        if(bindingResult.hasErrors())
        {
            return "client/auth/register";
        }

        User user = this.userService.registerDTOtoUser(registerDTO);
        String hashPassword = this.passwordEncoder.encode(user.getPassword());

        user.setPassword(hashPassword);
        user.setRole(userService.getRoleByName("USER"));

        this.userService.saveUser(user);
        return "redirect:login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String getLoginPage(Model model)
    {
        return "client/auth/login";
    }

    @RequestMapping(value = "/access-deny", method = RequestMethod.GET)
    public String getDenyPage(Model model)
    {
        return "client/auth/deny";
    }

}
