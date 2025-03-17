package vn.beginner.laptopshop.dto;

import jakarta.persistence.Entity;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.*;
import vn.beginner.laptopshop.service.validator.RegisterChecked;

@RegisterChecked
@Data//toString
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class RegisterDTO {
    @Size(min = 2, max = 10, message = "Họ phải có từ 2 đến 3 ký tự")
    private String firstName;


    private String lastName;

    @Email(message = "Email của bạn không hợp lệ", regexp = "^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$")
    private String email;

//    @NotBlank(message = "Mật khẩu không được để trống")
    @Size(min = 6, max = 20, message = "Mật khẩu phải có từ 6 đến 20 ký tự")
    private String password;

//    @NotBlank(message = "Xác nhận mật khẩu không được để trống")
    private String confirmPassword;


}
