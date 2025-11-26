package br.com.fabreum.AppProdutos.repository;

import br.com.fabreum.AppProdutos.model.CartItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CartItemRepository extends JpaRepository<CartItem, Long> {

}