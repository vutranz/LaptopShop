package vn.beginner.laptopshop.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import vn.beginner.laptopshop.domain.Role;
import vn.beginner.laptopshop.domain.User;
import vn.beginner.laptopshop.dto.RegisterDTO;
import vn.beginner.laptopshop.repository.RoleRepository;
import vn.beginner.laptopshop.repository.UserRepository;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    public UserService(UserRepository userRepository,RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    public Page<User> getAllUser(Pageable pageable)
    {
        return this.userRepository.findAll(pageable);
    }

    public User saveUser(User user)
    {
        return this.userRepository.save(user);
    }

    public User getUserById(long id) {
        return userRepository.findById(id).orElse(null);
    }

    public void deleteUser(long id) {
        userRepository.deleteById(id);
    }

    public Role getRoleByName(String name) {
        return this.roleRepository.findByName(name);
    }

    public User registerDTOtoUser(RegisterDTO registerDTO) {
        User user = new User();
        user.setFullName(registerDTO.getFirstName()+""+registerDTO.getLastName());
        user.setEmail(registerDTO.getEmail());
        user.setPassword(registerDTO.getPassword());
        user.setAddress("Default Address");
        user.setPhone("0332218056");
        return user;
    }

    public boolean checkEmailExist(String email)
    {
        return this.userRepository.existsByEmail(email);
    }

    public User getUserByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }

    public int getAllUserCount() {
        List<User> users = this.userRepository.findAll();
        return users.size();
    }
}
