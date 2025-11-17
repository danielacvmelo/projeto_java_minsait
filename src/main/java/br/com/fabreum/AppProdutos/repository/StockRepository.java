package br.com.fabreum.AppProdutos.repository;

import br.com.fabreum.AppProdutos.model.Product;
import br.com.fabreum.AppProdutos.model.Stock;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface StockRepository extends JpaRepository<Stock, Long> {
    Optional<Stock> findByProductId(Long productId);
}
