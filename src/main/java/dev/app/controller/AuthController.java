package dev.app.controller;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @author Anish Panthi
 */
@Controller
public class AuthController {

  @GetMapping("/login")
  public String login(HttpServletRequest request, Model model, String error, String logout) {
    if (error != null) {
      model.addAttribute("error", true);
      model.addAttribute("errorMessage", "Your username and password is invalid.");
    }
    return "pages/login";
  }

  @GetMapping("/")
  public String home() {
    return "pages/home";
  }
}
