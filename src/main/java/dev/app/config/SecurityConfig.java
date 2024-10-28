package dev.app.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

/**
 * @author Anish Panthi
 */
@Configuration
@EnableWebSecurity
public class SecurityConfig {

  @Bean
  public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {

    http.authorizeHttpRequests(
        auth -> auth.requestMatchers("/", "/login", "/error").permitAll().anyRequest()
            .authenticated());

    http.formLogin(
        form -> form.loginPage("/login").defaultSuccessUrl("/dashboard", true).permitAll());

    http.oauth2Login(
        oauth2 -> oauth2.loginPage("/login").defaultSuccessUrl("/dashboard", true).permitAll());

    http.logout(logout -> logout.logoutSuccessUrl("/").permitAll());
    return http.build();
  }

  @Bean
  public PasswordEncoder passwordEncoder() {
    return new BCryptPasswordEncoder();
  }

  @Bean
  public UserDetailsService userDetailsService() {
    UserDetails userDetails = User.builder().username("anish@gmail.com")
        .password(passwordEncoder().encode("anish123")).roles("ADMIN").build();
    return new InMemoryUserDetailsManager(userDetails);
  }
}
