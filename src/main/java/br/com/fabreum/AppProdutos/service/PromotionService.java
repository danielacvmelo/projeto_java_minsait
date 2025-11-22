package br.com.fabreum.AppProdutos.service;

import br.com.fabreum.AppProdutos.enums.PromotionScope;
import br.com.fabreum.AppProdutos.enums.PromotionType;
import br.com.fabreum.AppProdutos.model.*;
import br.com.fabreum.AppProdutos.repository.CartRepository;
import br.com.fabreum.AppProdutos.repository.CouponUsageRepository;
import br.com.fabreum.AppProdutos.repository.PromotionRepository;
import br.com.fabreum.AppProdutos.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.math.RoundingMode;

@Service
@RequiredArgsConstructor
public class PromotionService {

    private final PromotionRepository promotionRepository;
    private final CartRepository cartRepository;
    private final CouponUsageRepository couponUsageRepository;
    private final UserRepository userRepository;

    @Transactional
    public Promotion createPromotion(Promotion promotion) {
        promotion.setUsedCount(0);
        return promotionRepository.save(promotion);
    }

    @Transactional
    public Cart applyCoupon(Long cartId, String code) {
        Cart cart = cartRepository.findById(cartId)
                .orElseThrow(() -> new RuntimeException("Carrinho não encontrado"));

        Promotion promotion = promotionRepository.findByCode(code)
                .orElseThrow(() -> new RuntimeException("Cupom inválido"));

        // Validações gerais
        if (!promotion.isValid()) {
            throw new RuntimeException("Cupom expirado ou esgotado");
        }

        // Validação de uso por usuário
        String userEmail = SecurityContextHolder.getContext().getAuthentication().getName();
        User user = (User) userRepository.findUserByEmail(userEmail)
                .orElseThrow(() -> new RuntimeException("Usuário não encontrado"));

        if (couponUsageRepository.existsByUserIdAndPromotionId(user.getId(), promotion.getId())) {
            throw new RuntimeException("Você já utilizou este cupom");
        }

        // Validação de escopo
        BigDecimal applicableAmount = calculateApplicableAmount(cart, promotion);

        if (applicableAmount.compareTo(BigDecimal.ZERO) == 0) {
            throw new RuntimeException("Este cupom não se aplica aos produtos do seu carrinho");
        }

        // Calcular desconto
        BigDecimal discount = calculateDiscount(promotion, applicableAmount, cart.getTotalPrice());

        cart.setAppliedPromotion(promotion);
        cart.setDiscountValue(discount);
        cart.recalculateTotalPrice();

        return cartRepository.save(cart);
    }

    private BigDecimal calculateDiscount(Promotion promotion, BigDecimal applicableAmount, BigDecimal cartTotal) {
        BigDecimal discount;

        if (promotion.getType() == PromotionType.PERCENTAGE) {
            discount = applicableAmount.multiply(promotion.getValue())
                    .divide(BigDecimal.valueOf(100), 2, RoundingMode.HALF_UP);
        } else {
            discount = promotion.getValue();
        }

        // Garante que o desconto não seja maior que o total do carrinho
        if (discount.compareTo(cartTotal) > 0) {
            return cartTotal;
        }
        return discount;
    }

    private BigDecimal calculateApplicableAmount(Cart cart, Promotion promotion) {
        if (promotion.getScope() == PromotionScope.GLOBAL) {
            return cart.getItems().stream()
                    .map(item -> item.getProduct().getPrice().multiply(new BigDecimal(item.getQuantity())))
                    .reduce(BigDecimal.ZERO, BigDecimal::add);
        }

        BigDecimal total = BigDecimal.ZERO;
        for (CartItem item : cart.getItems()) {
            boolean isApplicable = false;
            if (promotion.getScope() == PromotionScope.PRODUCT) {
                isApplicable = item.getProduct().getId().equals(promotion.getTargetId());
            } else if (promotion.getScope() == PromotionScope.CATEGORY) {
                isApplicable = item.getProduct().getCategory().getId().equals(promotion.getTargetId());
            }

            if (isApplicable) {
                total = total.add(item.getProduct().getPrice().multiply(new BigDecimal(item.getQuantity())));
            }
        }
        return total;
    }
}