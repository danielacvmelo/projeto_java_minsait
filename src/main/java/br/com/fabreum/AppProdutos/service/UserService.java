package br.com.fabreum.AppProdutos.service;

import br.com.fabreum.AppProdutos.model.User;
import br.com.fabreum.AppProdutos.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;

    public User save(User user){
        return userRepository.save(user);
    }

}
