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
@Table(name="carts")
public class Cart {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private int sum;

    @OneToOne
    @JoinColumn(name="user_id")
    private User user;

    @OneToMany(mappedBy = "cart")
    List<CartDetail> cartDetails;
}
