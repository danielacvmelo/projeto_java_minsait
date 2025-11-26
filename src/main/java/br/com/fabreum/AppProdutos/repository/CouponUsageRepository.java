package br.com.fabreum.AppProdutos.repository;

import br.com.fabreum.AppProdutos.model.CouponUsage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CouponUsageRepository extends JpaRepository<CouponUsage, Long> {
    boolean existsByUserIdAndPromotionId(Long userId, Long promotionId);
}