package br.com.fabreum.AppProdutos.repository;

import br.com.fabreum.AppProdutos.model.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
}