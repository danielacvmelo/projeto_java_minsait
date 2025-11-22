package br.com.fabreum.AppProdutos.config;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import br.com.fabreum.AppProdutos.model.User;

import java.time.Instant;


@Component
public class TokenService {

    @Value("${appprodutos.security.secret}")
    private String secret;

    public String generateToken(User user) {
        Algorithm algorithm = Algorithm.HMAC256(secret);

        return JWT.create()
                .withSubject(user.getEmail())
                .withClaim("userId", user.getId())
                .withClaim("name", user.getName())
                .withExpiresAt(Instant.now().plusSeconds(86400))// limite de 24hrs
                .withIssuedAt(Instant.now()) //quando foi gerado
                .sign(algorithm);

    }


}
