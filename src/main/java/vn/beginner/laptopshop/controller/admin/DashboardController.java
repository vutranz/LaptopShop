package vn.beginner.laptopshop.controller.admin;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import vn.beginner.laptopshop.domain.Order;
import vn.beginner.laptopshop.domain.OrderDetail;
import vn.beginner.laptopshop.domain.User;
import vn.beginner.laptopshop.service.OrderService;
import vn.beginner.laptopshop.service.ProductService;
import vn.beginner.laptopshop.service.UserService;

import java.util.List;

@Controller
public class DashboardController {

    private final UserService userService;
    private final ProductService productService;
    private final OrderService orderService;


    public DashboardController(UserService userService,
                               ProductService productService,
                               OrderService orderService) {
        this.userService = userService;
        this.productService = productService;
        this.orderService = orderService;
    }

    @GetMapping("/admin")
    public String dashboardPage(Model model)
    {
        model.addAttribute("countUser",this.userService.getAllUserCount());
        model.addAttribute("countProduct",this.productService.getAllProductCount());
        model.addAttribute("countOrder",this.orderService.getAllOrderCount());
        model.addAttribute("countOrderCancel",this.orderService.getAllOrderCountCancel());
        return "admin/dashboard/show";
    }

    @GetMapping("/history-order")
    public String getHistoryOrder(Model model, HttpServletRequest request){
        User currentUser = new User();
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        List<Order> orders = orderService.fetchOrdersWithDetails(currentUser);
        model.addAttribute("orders", orders);


        return "client/homepage/history-order";
    }

}
