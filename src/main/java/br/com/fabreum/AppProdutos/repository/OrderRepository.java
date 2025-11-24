package br.com.fabreum.AppProdutos.repository;

import br.com.fabreum.AppProdutos.model.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    @Query("SELECT COALESCE(SUM(o.totalPrice), 0) FROM Order o")
    BigDecimal calculateTotalRevenue();
}