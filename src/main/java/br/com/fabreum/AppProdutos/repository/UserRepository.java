package br.com.fabreum.AppProdutos.repository;

import br.com.fabreum.AppProdutos.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
}
