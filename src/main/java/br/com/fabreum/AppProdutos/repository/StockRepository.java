package br.com.fabreum.AppProdutos.repository;

import br.com.fabreum.AppProdutos.model.Stock;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface StockRepository extends JpaRepository<Stock, Long> {

    Optional<Stock> findByProductId(Long productId);

    List<Stock> findByQuantityLessThan(Integer minQuantity);
}