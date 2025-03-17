package vn.beginner.laptopshop.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.*;


import java.util.List;

@Entity
@Data//toString
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name="users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

//    @NotNull
//    @NotEmpty(message = "Email không được để trống")
    @Email(message = "Email của bạn không hợp lệ", regexp = "^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$")
    private String email;

    @NotNull
    @Size(min = 3,message = "mật khẩu phải > 5 ký tự")
    private String password;

    @NotNull
    @Size(min = 5, message = "Tên phải phải > hơn 5 ký tự")
    private String fullName;

    @NotNull
    @Size(min = 5, message = "Địa chỉ không được để trống")
    private String address;

    @NotNull
    @Min(value = 10,message = "SDT chỉ được tối đa 10 số")
    private String phone;

    private String avatar;

    @ManyToOne
    @JoinColumn(name="role_id")
    private  Role role; // nhieu user có cùng role

    @OneToMany( mappedBy ="user")
    List<Order> orders;

    @OneToOne(mappedBy = "user")
    private Cart cart;

}
