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
                        .dispatcherTypeMatchers(DispatcherType.ERROR).permitAll()
                        // PUBLICO
                        .requestMatchers(HttpMethod.POST, "/v1/auth/register").permitAll()
                        .requestMatchers(HttpMethod.POST, "/v1/auth/login").permitAll()
                        .requestMatchers(HttpMethod.POST, "/v1/auth/refresh").permitAll()
                        //QUALQUER USUARIO LOGADO
                        .requestMatchers(HttpMethod.GET, "/v1/auth/me").authenticated()
                        // ADMIN -> pode `tudo`
//                        .requestMatchers(HttpMethod.POST, "/v1/products/**").hasRole("ADMIN")
//                        .requestMatchers(HttpMethod.PUT, "/v1/products/**").hasRole("ADMIN")
//                        .requestMatchers(HttpMethod.DELETE, "/v1/products/**").hasRole("ADMIN")
                        // USER
                        // ler produtos
                        //.requestMatchers(HttpMethod.GET, "/v1/products/**").hasAnyRole("USER", "ADMIN", "SELLER")
                        //carrinho → restrito ao USER
                        // .requestMatchers("/v1/cart/**").hasRole("USER")
                        // SELLER
                        //
                        .anyRequest().authenticated() //qualquer outra chamada precisa ser autenticada
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
