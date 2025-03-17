package vn.beginner.laptopshop.domain;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Data//toString
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class CartDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private long quantity;
    private double price;
    @ManyToOne
    @JoinColumn(name="cart_id")
    private Cart cart;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;
}
