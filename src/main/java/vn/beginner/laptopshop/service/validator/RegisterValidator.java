package vn.beginner.laptopshop.service.validator;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import vn.beginner.laptopshop.dto.RegisterDTO;
import vn.beginner.laptopshop.service.UserService;


public class RegisterValidator implements ConstraintValidator<RegisterChecked, RegisterDTO> {

    private final UserService userService;

    public RegisterValidator(UserService userService) {
        this.userService = userService;
    }

    @Override
    public boolean isValid(RegisterDTO userDto, ConstraintValidatorContext context) {
        boolean valid = true;

        // Check if password fields match
        if (!userDto.getPassword().equals(userDto.getConfirmPassword())) {
            context.buildConstraintViolationWithTemplate("Passwords nhập không chính xác")
                    .addPropertyNode("confirmPassword")
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            valid = false;
        }

        // Additional validations can be added here
        if(this.userService.checkEmailExist(userDto.getEmail()))
        {
            context.buildConstraintViolationWithTemplate("email đã tồn tại")
                    .addPropertyNode("email")
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            valid = false;
        }
        return valid;
    }
}
