package br.com.fabreum.AppProdutos.repository;

import br.com.fabreum.AppProdutos.model.Review;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReviewRepository extends JpaRepository<Review, Long> {
    // busca reviews por id do produto e ordena por data
    List<Review> findByProductIdOrderByCreatedAtDesc(Long productId);

    // verifica se um usuário já avaliou um produto específico de um pedido específico
    @Query("SELECT COUNT(r) FROM Review r WHERE r.user.id = :userId AND r.product.id = :productId AND r.orderId = :orderId")
    long countUserByIdAndProductIdAndOrderId(@Param("userId") Long userId,
                                             @Param("productId") Long productId,
                                             @Param("orderId") Long orderId);

    // média das avaliações
    @Query("SELECT AVG(r.rating) FROM Review r WHERE r.product.id = :productId")
    Double findAverageRatingByProductId(@Param("productId") Long productId);

    // conta quantas reviews um produto tem com uma classificação específica
    @Query("SELECT COUNT(r) FROM Review r WHERE r.product.id = :productId AND r.rating = :rating")
    long CountByProductIdAndRating(@Param("productId") Long productId, @Param("rating") Integer rating);
}