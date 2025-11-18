package br.com.fabreum.AppProdutos.repository;

import br.com.fabreum.AppProdutos.model.OrderItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderItemRepository extends JpaRepository<OrderItem, Long> {
}