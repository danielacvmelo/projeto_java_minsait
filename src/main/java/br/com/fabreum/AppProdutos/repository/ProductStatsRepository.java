package br.com.fabreum.AppProdutos.repository;

import br.com.fabreum.AppProdutos.model.ProductStats;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.Optional;

@Repository
public interface ProductStatsRepository extends JpaRepository<ProductStats, Long> {
    Optional<ProductStats> findByProductId(Long productId);
}
