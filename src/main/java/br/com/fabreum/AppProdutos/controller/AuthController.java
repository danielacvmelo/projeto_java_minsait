package br.com.fabreum.AppProdutos.controller;

import br.com.fabreum.AppProdutos.config.JWTUserData;
import br.com.fabreum.AppProdutos.config.TokenService;
import br.com.fabreum.AppProdutos.controller.request.LoginRequest;
import br.com.fabreum.AppProdutos.controller.request.UserRequest;
import br.com.fabreum.AppProdutos.controller.response.LoginResponse;
import br.com.fabreum.AppProdutos.controller.response.UserResponse;
import br.com.fabreum.AppProdutos.enums.Role;
import br.com.fabreum.AppProdutos.exception.UsernameOrPasswordInvalidException;
import br.com.fabreum.AppProdutos.mapper.UserMapper;
import br.com.fabreum.AppProdutos.model.User;
import br.com.fabreum.AppProdutos.service.UserService;
import com.auth0.jwt.JWT;
import com.auth0.jwt.interfaces.DecodedJWT;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/v1/auth")
@RequiredArgsConstructor
public class AuthController {

    private final UserService userService;
    private final AuthenticationManager authenticationManager;
    private final TokenService tokenService;

    @PostMapping("/register")
    public ResponseEntity<UserResponse> register(@RequestBody UserRequest request) {
        User savedUser = userService.save(UserMapper.toUser(request));
        return ResponseEntity.status(HttpStatus.CREATED).body(UserMapper.toUserResponse(savedUser));
    }

    @PostMapping("/login")
    public ResponseEntity<LoginResponse> login(@RequestBody LoginRequest request) {

        try {
            var userAndPass = new UsernamePasswordAuthenticationToken(request.email(), request.password());
            var authenticate = authenticationManager.authenticate(userAndPass);

            User user = (User) authenticate.getPrincipal();

            String token = tokenService.generateToken(user);

            return ResponseEntity.ok(
                    new LoginResponse(
                            user.getId(), user.getName(), user.getEmail(), user.getRole(), token));

        } catch (AuthenticationException exception) {
            System.out.println("ERRO NO LOGIN: " + exception.getMessage());
            exception.printStackTrace();

            throw new UsernameOrPasswordInvalidException("Usuário ou senha inválida.");
        }
    }

    @GetMapping("/me")
    public ResponseEntity<LoginResponse> me(Authentication authentication) {

        JWTUserData user = (JWTUserData) authentication.getPrincipal();

        return ResponseEntity.ok(
                new LoginResponse(user.id(), user.name(), user.email(), Role.valueOf(user.role()), null));
    }

    @PostMapping("/refresh")
    public ResponseEntity<LoginResponse> refresh(@RequestHeader("Authorization") String bearer) {

        String oldToken = bearer.replace("Bearer ", "");

        String newToken = tokenService.refreshToken(oldToken);

        DecodedJWT decoded = JWT.decode(newToken);

        return ResponseEntity.ok(
                new LoginResponse(
                        decoded.getClaim("userId").asLong(),
                        decoded.getClaim("name").asString(),
                        decoded.getClaim("email").asString(),
                        Role.valueOf(decoded.getClaim("role").asString()),
                        newToken
                )
        );
    }
}
