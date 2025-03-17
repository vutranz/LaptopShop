package vn.beginner.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.beginner.laptopshop.domain.Cart;
import vn.beginner.laptopshop.domain.User;

@Repository
public interface CartRepository extends JpaRepository<Cart,Long> {
    Cart findByUser(User user);
}
