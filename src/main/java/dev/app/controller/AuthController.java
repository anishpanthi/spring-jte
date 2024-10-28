package dev.app.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Anish Panthi
 */
@RestController
public class AuthController {

  @GetMapping("/login")
  public String login() {
    return "pages/login";
  }

  @GetMapping("/home")
  public String home() {
    return "pages/home";
  }
}
