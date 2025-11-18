package br.com.fabreum.AppProdutos.repository;

import br.com.fabreum.AppProdutos.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {

    Optional<UserDetails> findUserByEmail(String email);
}
