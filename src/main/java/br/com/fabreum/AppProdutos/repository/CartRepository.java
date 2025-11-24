package br.com.fabreum.AppProdutos.repository;

import br.com.fabreum.AppProdutos.model.Cart;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CartRepository extends JpaRepository<Cart, Long> {

}