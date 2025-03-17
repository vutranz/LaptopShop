package vn.beginner.laptopshop.controller.admin;

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
    public String orderPage(Model model)
    {
        List<Order> orders = this.orderService.getAllOrder();
        model.addAttribute("orders",orders);
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
