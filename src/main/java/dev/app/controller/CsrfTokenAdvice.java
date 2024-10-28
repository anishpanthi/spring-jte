package dev.app.controller;

import dev.app.jte.CsrfInput;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

/**
 * @author Anish Panthi
 */
@ControllerAdvice
public class CsrfTokenAdvice {

    @ModelAttribute("csrf")
    public CsrfToken csrf(HttpServletRequest request) {
        return (CsrfToken) request.getAttribute(CsrfToken.class.getName());
    }

    @ModelAttribute("csrfInput")
    public CsrfInput csrfInput(HttpServletRequest request) {
        return new CsrfInput(csrf(request));
    }
}
