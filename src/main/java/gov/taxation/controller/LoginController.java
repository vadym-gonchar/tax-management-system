package gov.taxation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

    @GetMapping("/login")
    public String login() {

        return "login";
    }

    @GetMapping("/access-denied")
    public String showAccessDenied() {

        return "/error/error403";
    }
}