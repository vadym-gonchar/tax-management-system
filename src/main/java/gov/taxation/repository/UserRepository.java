package gov.taxation.repository;

import gov.taxation.entity.Role;
import gov.taxation.entity.User;
import gov.taxation.entity.UserType;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    User findByUserName(String userName);

    Page<User> findAllByRoleIsNot(Role role, Pageable pageable);

}