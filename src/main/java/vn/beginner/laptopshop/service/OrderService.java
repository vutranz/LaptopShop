package vn.beginner.laptopshop.service;

import jakarta.transaction.Transactional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import vn.beginner.laptopshop.domain.*;
import vn.beginner.laptopshop.repository.*;

import java.util.List;
import java.util.Optional;

@Service
public class OrderService {

    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    public OrderService(OrderRepository orderRepository,
                        OrderDetailRepository orderDetailRepository){
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
    }

    public Page<Order> getAllOrder(Pageable pageable){
        return this.orderRepository.findAll(pageable);
    }

    public Order getOrderById(long id) {
        return this.orderRepository.findById(id).orElse(null);
    }

    public void updateOrder(Order updatedOrder) {
        Optional<Order> existingOrderOptional = orderRepository.findById(updatedOrder.getId());

        if (existingOrderOptional.isPresent()) {
            Order existingOrder = existingOrderOptional.get();

            existingOrder.setStatus(updatedOrder.getStatus());

            existingOrder.setUser(existingOrder.getUser());

            orderRepository.save(existingOrder);
        }
    }

    public void deleteOrderById(long id) {
        Optional<Order> order = this.orderRepository.findById(id);
        if(order.isPresent()) {
            Order orderToDelete = order.get();
            List<OrderDetail> orderDetails = orderToDelete.getOrderDetails();
            for(OrderDetail orderDetail : orderDetails) {
               this.orderDetailRepository.deleteById(orderDetail.getId());
            }
        }
        this.orderRepository.deleteById(id);
    }

    public int getAllOrderCount()
    {
        List<Order> orders = this.orderRepository.findAll();
        return orders.size();
    }

    public int getAllOrderCountCancel()
    {
       return this.orderRepository.countCanceledOrders();
    }

    public List<Order> fetchOrdersWithDetails(User user){
        return this.orderRepository.findOrdersWithDetailsByUserId(user.getId());
    }
}

