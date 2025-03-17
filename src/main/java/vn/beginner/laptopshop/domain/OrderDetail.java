package vn.beginner.laptopshop.domain;

import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@Entity
@Data//toString
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name="order_detal")
public class OrderDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private long quantity;
    private double price;

    @ManyToOne
    @JoinColumn(name = "order_id")
    private Order order;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;

}
