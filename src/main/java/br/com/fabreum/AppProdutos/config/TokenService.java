package br.com.fabreum.AppProdutos.config;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.auth0.jwt.interfaces.DecodedJWT;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import br.com.fabreum.AppProdutos.model.User;

import java.time.Instant;
import java.util.Optional;


@Component
public class TokenService {

    @Value("${appprodutos.security.secret}")
    private String secret;

    public String generateToken(User user) {
        Algorithm algorithm = Algorithm.HMAC256(secret);

        //criacao do token
        return JWT.create()
                .withSubject(user.getEmail())
                .withClaim("userId", user.getId()) //id
                .withClaim("name", user.getName()) //nome
                .withClaim("email", user.getEmail())
                .withClaim("role", user.getRole().name()) // role
                .withExpiresAt(Instant.now().plusSeconds(86400))// limite de 24hrs
                .withIssuedAt(Instant.now()) //quando foi gerado
                .withIssuer("AppProdutos") //quem gerou o token
                .sign(algorithm);
    }
    //verificacao do token
    public Optional<JWTUserData> verifyToken(String token) {
        //usar o try catch para evitar bug
        try {

            Algorithm algorithm = Algorithm.HMAC256(secret);

            //criacao do objeto
            DecodedJWT jwt = JWT.require(algorithm)
                    .build()
                    .verify(token);

            return Optional.of(JWTUserData
                    .builder()
                    .id(jwt.getClaim("userId").asLong())
                    .name(jwt.getClaim("name").asString())
                    .email(jwt.getClaim("email").asString())
                    .role(jwt.getClaim("role").asString())
                    .build());


        } catch (JWTVerificationException exception) {

            return Optional.empty();
        }

    }

    // METODO PARA EXTRAIR DADOS DO TOKEN P/ endpoint /auth/refresh
    public String refreshToken(String oldToken) {
        Algorithm algorithm = Algorithm.HMAC256(secret);

        DecodedJWT decoded = JWT.require(algorithm)
                .build()
                .verify(oldToken);

        return JWT.create()
                .withSubject(decoded.getSubject()) // email
                .withClaim("userId", decoded.getClaim("userId").asLong())
                .withClaim("name", decoded.getClaim("name").asString())
                .withClaim("email", decoded.getClaim("email").asString())
                .withClaim("role", decoded.getClaim("role").asString())
                .withIssuedAt(Instant.now())
                .withExpiresAt(Instant.now().plusSeconds(86400))
                .withIssuer("AppProdutos")
                .sign(algorithm);
    }



}
