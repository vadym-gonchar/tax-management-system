package gov.taxation.controller;

import gov.taxation.dto.UserDTO;
import gov.taxation.entity.User;
import gov.taxation.service.UserService;
import gov.taxation.service.UserTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.logging.Logger;

@Controller
@RequestMapping("/register")
public class RegistrationController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserTypeService userTypeService;

    private Logger logger = Logger.getLogger(getClass().getName());

    @InitBinder
    public void initBinder(WebDataBinder dataBinder) {

        StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);

        dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
    }

    @GetMapping("/form")
    public String registration(Model model) {

        model.addAttribute("userDTO", new UserDTO());
        model.addAttribute("userTypes", userTypeService.findAll());

        return "registration";
    }

    @PostMapping("/form-process")
    public String register(@Valid @ModelAttribute("userDTO") UserDTO userDTO,
                           BindingResult result,
                           Model model,
                           RedirectAttributes redirectAttributes) {

        model.addAttribute("userTypes", userTypeService.findAll());
        String userName = userDTO.getUserName();
        logger.info("Processing registration form for: " + userName);

        if (result.hasErrors()) {
            logger.warning("Registration form error");
            return "registration";
        }

        User existing = userService.findByUserName(userName);
        if (existing != null) {
            model.addAttribute("userDTO", new UserDTO());
            model.addAttribute("registrationError", new UserDTO());

            logger.warning("User name already exists.");

            return "registration";
        }

        userService.createUser(userDTO);
        redirectAttributes.addFlashAttribute("accountSuccess", new UserDTO());

        logger.info("Successfully created user: " + userName);

        return "redirect:/login";

    }
}