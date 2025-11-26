package br.com.fabreum.AppProdutos.service;

import br.com.fabreum.AppProdutos.model.User;
import br.com.fabreum.AppProdutos.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder; // necessario para salvar o user.getPassword() criptografado

    public User save(User user) {
        String password = user.getPassword();
        user.setPassword(passwordEncoder.encode(password)); //setando password -> criptografado
        return userRepository.save(user);
    }

}
