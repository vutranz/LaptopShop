package vn.beginner.laptopshop.controller.admin;

import jakarta.validation.Valid;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import vn.beginner.laptopshop.domain.User;
import vn.beginner.laptopshop.service.UploadService;
import vn.beginner.laptopshop.service.UserService;
import java.util.List;

@Controller
public class UserController {

    private final UserService userService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService,
                          UploadService uploadService,
                          PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
    }

    @RequestMapping(value = "/admin/user", method = RequestMethod.GET)
    public String getHomePage(Model model)
    {
        List<User> listUser = this.userService.getAllUser();
        model.addAttribute("users",listUser);
        return "admin/user/user-list";
    }

    @RequestMapping(value = "/admin/user/create", method = RequestMethod.GET)
    public String createUserPage(Model model){
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    public String createUser(@ModelAttribute("newUser") @Valid User user,
                             BindingResult bindingResult,
                             @RequestParam("hoidanitFile") MultipartFile file
                             )  {
        List<FieldError> errors = bindingResult.getFieldErrors();
        for (FieldError error : errors ) {
            System.out.println (error.getField() + " - " + error.getDefaultMessage());
        }

        if(bindingResult.hasErrors())
        {
            return "admin/user/create";
        }
        String avatar = this.uploadService.handleSavaUploadFile(file,"avatar");
        String hashPassword = this.passwordEncoder.encode(user.getPassword());

        user.setAvatar(avatar);
        user.setPassword(hashPassword);
        user.setRole(userService.getRoleByName(user.getRole().getName()));

        this.userService.saveUser(user);
        return "redirect:/admin/user";
    }

    @RequestMapping(value = "/admin/user/view/{id}",method=RequestMethod.GET)
    public String getUserDetailPage(Model model, @PathVariable long id)
    {
        User user = userService.getUserById(id);
        model.addAttribute("user", user);
        return "admin/user/user-detail";
    }

    @RequestMapping(value = "/admin/user/update/{id}",method=RequestMethod.GET)
    public String updateUserPage(Model model, @PathVariable long id){
        User user = userService.getUserById(id);
        model.addAttribute("newUser", user);
        return "admin/user/user-update";
    }

    @RequestMapping(value = "/admin/user/update",method=RequestMethod.POST)
    public String updateUser(@ModelAttribute("newUser") User user, @RequestParam("hoidanitFile") MultipartFile file){
        User currentUser = this.userService.getUserById(user.getId());

        if(currentUser!=null){
            currentUser.setFullName(user.getFullName());
            currentUser.setPhone(user.getPhone());
            currentUser.setAddress(user.getAddress());
            currentUser.setRole(this.userService.getRoleByName(user.getRole().getName()));
            if (!file.isEmpty()) {
                String avatar = this.uploadService.handleSavaUploadFile(file,"avatar");
                currentUser.setAvatar(avatar);
            }
        }
        this.userService.saveUser(currentUser);

        return "redirect:/admin/user";
    }

    @RequestMapping(value = "/admin/user/delete/{id}", method = RequestMethod.GET)
    public String deleteUser(@PathVariable long id) {
        userService.deleteUser(id); // Xóa user
        return "redirect:/admin/user"; // Chuyển hướng về danh sách user
    }


}
