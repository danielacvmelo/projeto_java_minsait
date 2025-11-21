package br.com.fabreum.AppProdutos.service;

import br.com.fabreum.AppProdutos.config.JWTUserData;
import br.com.fabreum.AppProdutos.enums.Role;
import br.com.fabreum.AppProdutos.model.Product;
import br.com.fabreum.AppProdutos.model.ProductStats;
import br.com.fabreum.AppProdutos.model.Review;
import br.com.fabreum.AppProdutos.model.User;
import br.com.fabreum.AppProdutos.repository.ProductRepository;
import br.com.fabreum.AppProdutos.repository.ProductStatsRepository;
import br.com.fabreum.AppProdutos.repository.ReviewRepository;
import br.com.fabreum.AppProdutos.repository.UserRepository;
import br.com.fabreum.AppProdutos.service.dto.ReviewRequestDto;
import br.com.fabreum.AppProdutos.service.dto.ReviewResponseDto;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ReviewService {
    private final ReviewRepository reviewRepository;
    private final ProductRepository productRepository;
    private final ProductStatsRepository productStatsRepository;
    private final UserRepository userRepository;

    @Transactional
    public ReviewResponseDto createReview(JWTUserData userData, ReviewRequestDto reviewRequest){
        // buscar usuário do BD
        User user = userRepository.findById(userData.id())
                    .orElseThrow(() -> new IllegalArgumentException("Usuário não encontrado"));

        // regra 1: apenas clientes podem avaliar
        if(user.getRole() != Role.USER){
            throw new IllegalArgumentException("Apenas clientes podem avaliar produtos!");
        }

        // regra 2: limite de 1 avaliação por produto pedido
        boolean alreadyReviewed = reviewRepository.countUserByIdAndProductIdAndOrderId(user.getId(),
                                    reviewRequest.getProductId(),reviewRequest.getOrderId()) > 0;

        if(alreadyReviewed){
            throw new IllegalArgumentException("Você já avaliou este produto!");
        }

        // regra 3: apenas quem comprou pode avaliar
        if(!hasUserPurchasedProduct(user.getId(), reviewRequest.getProductId(), reviewRequest.getOrderId())){
            throw new IllegalArgumentException("Apenas usuários que compraram o produto podem avaliá-lo.");
        }

        // buscar produto
        Product product = productRepository.findById(reviewRequest.getProductId())
                            .orElseThrow(() -> new IllegalArgumentException("Produto não encontrado"));

        // criar review
        Review review = new Review();
        review.setProduct(product);
        review.setUser(user);
        review.setOrderId(reviewRequest.getOrderId());
        review.setRating(reviewRequest.getRating());
        review.setComment(reviewRequest.getComment());

        Review savedReview = reviewRepository.save(review);

        // recalcular estatísticas
        updateProductStats(reviewRequest.getProductId());

        return convertToDto(savedReview);
    }

    public List<ReviewResponseDto> getReviewsByProduct(Long productId){
        return reviewRepository.findByProductIdOrderByCreatedAtDesc(productId)
                .stream()
                .map(this::convertToDto)
                .collect(Collectors.toList());
    }

    // atualização das estatísticas
    private void updateProductStats(Long productId){
        Double averageRating = reviewRepository.findAverageRatingByProductId(productId);

        ProductStats stats = productStatsRepository.findByProductId(productId)
                .orElse(createDefaultProductStats(productId));

        if(averageRating != null){
            stats.setAverageRating(BigDecimal.valueOf(averageRating).setScale(2, RoundingMode.HALF_UP));
        }

        stats.setReviewCount(reviewRepository.findByProductIdOrderByCreatedAtDesc(productId).size());
        stats.setRating1((int) reviewRepository.countProductByIdAndRating(productId, 1));
        stats.setRating2((int) reviewRepository.countProductByIdAndRating(productId, 2));
        stats.setRating3((int) reviewRepository.countProductByIdAndRating(productId, 3));
        stats.setRating4((int) reviewRepository.countProductByIdAndRating(productId, 4));
        stats.setRating5((int) reviewRepository.countProductByIdAndRating(productId, 5));

        productStatsRepository.save(stats);
    }

    private ProductStats createDefaultProductStats(Long productId){
        Product product = productRepository.findById(productId)
                .orElseThrow(() -> new IllegalArgumentException("Produto não encontrado."));

        ProductStats stats = new ProductStats();
        stats.setProduct(product);
        return stats;
    }

    // metodo temporário para teste
    private boolean hasUserPurchasedProduct(Long userId, Long productId, Long orderId){
        return true;
    }

    private ReviewResponseDto convertToDto(Review review) {
        ReviewResponseDto dto = new ReviewResponseDto();
        dto.setId(review.getId());
        dto.setProductId(review.getProduct().getId());
        dto.setProductName(review.getProduct().getName());
        dto.setUserId(review.getUser().getId());
        dto.setUserName(review.getUser().getName());
        dto.setUserRole(review.getUser().getRole().name());
        dto.setRating(review.getRating());
        dto.setComment(review.getComment());
        dto.setCreatedAt(review.getCreatedAt());
        return dto;
    }
}