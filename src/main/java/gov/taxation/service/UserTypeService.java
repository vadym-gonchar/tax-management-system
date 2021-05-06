package gov.taxation.service;

import gov.taxation.entity.UserType;
import gov.taxation.repository.UserTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UserTypeService {

    @Autowired
    private UserTypeRepository userTypeRepository;

    public Iterable<UserType> findAll() {
        return userTypeRepository.findAll();
    }

    public Optional<UserType> findById(Long id) {
        return userTypeRepository.findById(id);
    }

}