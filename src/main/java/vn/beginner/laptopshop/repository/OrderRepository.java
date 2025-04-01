package vn.beginner.laptopshop.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import vn.beginner.laptopshop.domain.Order;
import vn.beginner.laptopshop.domain.Product;

import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {

    @Query("SELECT COUNT(o) FROM Order o WHERE o.status = 'Canceled'")
    int countCanceledOrders();

    @Query("SELECT DISTINCT o FROM Order o LEFT JOIN FETCH o.orderDetails WHERE o.user.id = :userId")
    List<Order> findOrdersWithDetailsByUserId(@Param("userId") Long userId);

    Page<Order> findAll(Pageable pageable);
}
