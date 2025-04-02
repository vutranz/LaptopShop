package vn.beginner.laptopshop.controller.client;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.eclipse.tags.shaded.org.apache.xpath.operations.Mod;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import vn.beginner.laptopshop.domain.*;
import vn.beginner.laptopshop.service.OrderService;
import vn.beginner.laptopshop.service.ProductService;
import vn.beginner.laptopshop.service.UserService;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
public class ItemController {

    private final ProductService productService;
    private final OrderService orderService;
    private final UserService userService;

    public ItemController(ProductService productService,
            OrderService orderService,
            UserService userService) {
        this.productService = productService;
        this.orderService = orderService;
        this.userService = userService;
    }

    @RequestMapping(value = "/product/{id}", method = RequestMethod.GET)
    public String getProductPage(Model model, @PathVariable long id) {
        Product product = productService.getProductById(id);
        model.addAttribute("product", product);
        return "client/product/product-detail";
    }

    @RequestMapping(value = "/add-product-to-cart/{id}", method = RequestMethod.POST)
    public String addProductToCart(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long productId = id;
        String email = (String) session.getAttribute("email");

        this.productService.handleAddProductToCart(email, productId, session);
        return "redirect:/";
    }

    @RequestMapping(value = "/cart", method = RequestMethod.GET)
    public String getCartPage(Model model, HttpServletRequest request) {
        User currentUser = new User();
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);
        Cart cart = this.productService.fetchByUser(currentUser);
        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();
        double totalPrice = 0;
        for (CartDetail cd : cartDetails) {
            totalPrice += cd.getPrice() * cd.getQuantity();
        }

        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);
        return "client/cart/show-cart";
    }

    @RequestMapping(value = "/confirm-checkout", method = RequestMethod.GET)
    public String confirmCheckout(@RequestParam Long cartDetailId, Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        long id = (long) session.getAttribute("id");
        User user = this.userService.getUserById(id);

        Cart cart = productService.findCartById(cartDetailId);

        if (cart == null) {
            return "redirect:/cart";
        }

        double totalPrice = cart.getCartDetails().stream()
                .mapToDouble(cd -> cd.getQuantity() * cd.getPrice())
                .sum();

        model.addAttribute("userId", id);
        model.addAttribute("fullName", user.getFullName());
        model.addAttribute("email", user.getEmail());
        model.addAttribute("phone", user.getPhone());
        model.addAttribute("address", user.getAddress());
        model.addAttribute("cartDetails", cart.getCartDetails());
        model.addAttribute("totalPrice", totalPrice);

        return "client/cart/confirm-cart";
    }

    @RequestMapping(value = "/process-checkout", method = RequestMethod.POST)
    public String processCheckout(HttpServletRequest request) {
        User currentUser = new User();
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);
        this.productService.handlePlaceOrder(currentUser, session);

        return "client/cart/thankyou";
    }

    @RequestMapping(value = "/products", method = RequestMethod.GET)
    public String getProductPage(Model model,
            @RequestParam(value = "page", required = false) Optional<String> pageOptional,
            @RequestParam(value = "name", required = false) Optional<String> nameOptional,
            @RequestParam(value = "min-price", required = false) Optional<String> minOptional,
            @RequestParam(value = "max-price", required = false) Optional<String> maxOptional,
            @RequestParam(value = "factory", required = false) Optional<String> factoryOptional) {

        int page = 1;
        try {
            page = Integer.parseInt(pageOptional.orElse("1"));
        } catch (NumberFormatException e) {
            page = 1;
        }
        if (page < 1) {
            page = 1;
        }

        int pageSize = 5;
        Pageable pageable = PageRequest.of(page - 1, pageSize);

        String queryName = nameOptional.orElse("");
        String factory = factoryOptional.orElse("");

        Double minPrice = minOptional.map(Double::parseDouble).orElse(null);
        Double maxPrice = maxOptional.map(Double::parseDouble).orElse(null);

        Page<Product> pr = productService.getAllProductsWithSpec(pageable, queryName, minPrice, maxPrice, factory);
        List<Product> productList = pr.getContent();

        model.addAttribute("productList", productList);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", pr.getTotalPages());

        return "client/homepage/products";
    }

}
