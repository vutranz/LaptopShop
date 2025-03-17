package vn.beginner.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import vn.beginner.laptopshop.domain.Role;

public interface RoleRepository extends JpaRepository<Role, Long> {
    Role findByName(String name);
}
