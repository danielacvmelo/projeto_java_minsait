package br.com.fabreum.AppProdutos.config;

import jakarta.servlet.DispatcherType;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@Configuration
@EnableWebSecurity // anotacao para habilitar a configuracao de login e senha
@EnableMethodSecurity(prePostEnabled = true) // necessário para @PreAuthorize
@RequiredArgsConstructor
public class SecurityConfig {

    private final SecurityFilter securityFilter;

    @Bean // anotacao p/ o spring gerenciar
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        // lembrar: portas abertas para register e login;
        return http
                .csrf(csrf -> csrf.disable())
                .sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
                .authorizeHttpRequests(authorize -> authorize
                        // PERMITE TRATAMENTO DE ERROS
                        .dispatcherTypeMatchers(DispatcherType.ERROR).permitAll()
                        // SWAGGER
                        .requestMatchers("/swagger-ui/**", "/v3/api-docs/**", "/swagger-ui.html").permitAll()
                        // ROTAS PUBLICAS
                        .requestMatchers(HttpMethod.POST, "/v1/auth/register").permitAll()
                        .requestMatchers(HttpMethod.POST, "/v1/auth/login").permitAll()
                        .requestMatchers(HttpMethod.POST, "/v1/auth/refresh").permitAll()
                        .requestMatchers(HttpMethod.GET, "/v1/reviews/product/**").permitAll()
                        // QUALQUER USUARIO LOGADO
                        .requestMatchers(HttpMethod.GET, "/v1/auth/me").authenticated()
                        // PRODUTOS (configuração específica - fica melhor assim!
                        .requestMatchers(HttpMethod.GET, "/v1/products/**").hasAnyRole("USER", "ADMIN")
                        .requestMatchers(HttpMethod.POST, "/v1/products/**").hasAnyRole("ADMIN", "SELLER")
                        .requestMatchers(HttpMethod.PUT, "/v1/products/**").hasAnyRole("ADMIN", "SELLER")
                        .requestMatchers(HttpMethod.DELETE, "/v1/products/**").hasRole("ADMIN")
                        // ADMIN
                        .requestMatchers("/v1/categories/**").hasRole("ADMIN")
                        .requestMatchers("/v1/promotions").hasRole("ADMIN")
                        .requestMatchers("/v1/reports/sales").hasRole("ADMIN")
                        .requestMatchers("/v1/audit/**").hasRole("ADMIN")
                        // USER -> (CUSTOMER)
                        .requestMatchers("/v1/cart/**").hasRole("USER")
                        .requestMatchers("/v1/order/**").hasRole("USER")
                        .requestMatchers(HttpMethod.POST, "/v1/reviews").hasRole("USER")
                        .requestMatchers(HttpMethod.POST, "/v1/coupons/apply").hasRole("USER")
                        // SELLER
                        .requestMatchers("/v1/inventory/**").hasAnyRole("SELLER", "ADMIN")
                        .requestMatchers("/v1/reports/low-stock").hasAnyRole("SELLER", "ADMIN")
                        .requestMatchers("/v1/reports/top-products").hasAnyRole("SELLER", "ADMIN")
                        // QUALQUER OUTRA REQUISIÇÃO PRECISA SER AUTENTICADA
                        .anyRequest().authenticated()
                )
                .addFilterBefore(securityFilter, UsernamePasswordAuthenticationFilter.class)
                .build();
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration authenticationConfiguration) throws Exception{
        return authenticationConfiguration.getAuthenticationManager();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}