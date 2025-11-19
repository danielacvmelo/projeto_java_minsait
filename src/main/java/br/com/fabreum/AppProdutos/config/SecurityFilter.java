package br.com.fabreum.AppProdutos.config;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.apache.logging.log4j.util.Strings;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.util.Optional;

@Component
@RequiredArgsConstructor
public class SecurityFilter extends OncePerRequestFilter {

    private final TokenService tokenService;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {

        String authorizationHeader = request.getHeader("Authorization");

        if (Strings.isNotEmpty(authorizationHeader) && authorizationHeader.startsWith("Bearer ")) {

            String token = authorizationHeader.substring("Bearer ".length()); //token

            Optional<JWTUserData> optionalJWTUserData = tokenService.verifyToken(token);

            //settar quem ta autenticado
            if (optionalJWTUserData.isPresent()) {
                JWTUserData userData = optionalJWTUserData.get();
                // opcional *
                // permite obter informacoes do usuario logado com o 'JWTUserData'
                UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(userData, null, null);
                SecurityContextHolder.getContext().setAuthentication(authenticationToken);
            }
            filterChain.doFilter(request, response); //importante!!! toda a chamada vai dar 200 e nao acontece nada

        } else {
            filterChain.doFilter(request, response);
        }
    }
}
