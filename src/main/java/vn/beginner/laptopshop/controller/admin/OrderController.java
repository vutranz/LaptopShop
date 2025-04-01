package vn.beginner.laptopshop.controller.admin;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import vn.beginner.laptopshop.domain.Order;
import vn.beginner.laptopshop.domain.User;
import vn.beginner.laptopshop.service.OrderService;

import java.util.List;
import java.util.Optional;

@Controller
public class OrderController {

    private  final OrderService orderService;


    public OrderController(OrderService orderService)
    {
        this.orderService=orderService;
    }

    @GetMapping("/admin/order")
    public String orderPage(Model model, @RequestParam(value = "page", defaultValue = "1") String pageStr) {
        int page = 1;
        try {
            page = Integer.parseInt(pageStr);
        } catch (NumberFormatException e) {
            page = 1;
        }

        if (page < 1) {
            page = 1;
        }

        int pageSize = 5; // Số lượng đơn hàng mỗi trang
        Pageable pageable = PageRequest.of(page - 1, pageSize);

        Page<Order> pr = this.orderService.getAllOrder(pageable);

        List<Order> orders = pr.getContent();

        model.addAttribute("orders", orders);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", pr.getTotalPages());

        return "admin/order/show-order";
    }


    @GetMapping("/admin/order/view/{id}")
    public String viewOrderPage(@PathVariable long id, Model model){
        Order order = this.orderService.getOrderById(id);
        model.addAttribute("order",order);
        return "admin/order/detail-order";
    }

    @RequestMapping(value = "/admin/order/update/{id}",method=RequestMethod.GET)
    public String updateOrderPage(Model model, @PathVariable long id){
        Order order = orderService.getOrderById(id);
        model.addAttribute("newOrder", order);
        return "admin/order/order-update";
    }

    @RequestMapping(value = "/admin/order/update", method = RequestMethod.POST)
    public String updateOrder(@ModelAttribute("newOrder") Order updatedOrder) {
        orderService.updateOrder(updatedOrder);

        return "redirect:/admin/order";
    }


    @RequestMapping(value = "/admin/order/delete/{id}", method = RequestMethod.GET)
    public String deleteOrderPage(@PathVariable  long id) {

        this.orderService.deleteOrderById(id);
        return "redirect:/admin/order";
    }

}
