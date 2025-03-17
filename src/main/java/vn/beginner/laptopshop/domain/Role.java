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
@Table(name="roles")
public class Role {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String name;
    private String description;
    @OneToMany(mappedBy = "role")
    private List<User> users; // 1 role thuoc ve nhieu user
}
