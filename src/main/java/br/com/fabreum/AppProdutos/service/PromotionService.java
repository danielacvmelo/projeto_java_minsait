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
        Cart cart = findCartById(cartId);
        Promotion promotion = findPromotionByCode(code);

        validatePromotionIsActive(promotion);
        validateCartNotEmpty(cart);
        validateNoExistingPromotion(cart);

        User currentUser = getCurrentAuthenticatedUser();
        validateCouponNotUsedByUser(currentUser, promotion);

        BigDecimal applicableAmount = calculateApplicableAmount(cart, promotion);
        validateCouponApplicableToCart(applicableAmount);

        BigDecimal discount = calculateDiscount(promotion, applicableAmount, cart.getTotalPrice());

        cart.setAppliedPromotion(promotion);
        cart.setDiscountValue(discount);
        cart.recalculateTotalPrice();

        return cartRepository.save(cart);
    }

    private Cart findCartById(Long cartId) {
        return cartRepository.findById(cartId)
                .orElseThrow(() -> new RuntimeException("Carrinho não encontrado"));
    }

    private Promotion findPromotionByCode(String code) {
        return promotionRepository.findByCode(code)
                .orElseThrow(() -> new RuntimeException("Cupom inválido"));
    }

    private void validatePromotionIsActive(Promotion promotion) {
        if (!promotion.isValid()) {
            throw new RuntimeException("Cupom expirado ou esgotado");
        }
    }

    private void validateCartNotEmpty(Cart cart) {
        if (cart.getItems().isEmpty()) {
            throw new RuntimeException("Não é possível aplicar cupom em carrinho vazio");
        }
    }

    private void validateNoExistingPromotion(Cart cart) {
        if (cart.getAppliedPromotion() != null) {
            throw new RuntimeException("Já existe um cupom aplicado neste carrinho");
        }
    }

    private User getCurrentAuthenticatedUser() {
        String userEmail = SecurityContextHolder.getContext().getAuthentication().getName();
        return (User) userRepository.findUserByEmail(userEmail)
                .orElseThrow(() -> new RuntimeException("Usuário não encontrado"));
    }

    private void validateCouponNotUsedByUser(User user, Promotion promotion) {
        if (couponUsageRepository.existsByUserIdAndPromotionId(user.getId(), promotion.getId())) {
            throw new RuntimeException("Você já utilizou este cupom");
        }
    }

    private void validateCouponApplicableToCart(BigDecimal applicableAmount) {
        if (applicableAmount.compareTo(BigDecimal.ZERO) == 0) {
            throw new RuntimeException("Este cupom não se aplica aos produtos do seu carrinho");
        }
    }

    private BigDecimal calculateDiscount(Promotion promotion, BigDecimal applicableAmount, BigDecimal cartTotal) {
        BigDecimal calculatedDiscount;

        if (promotion.getType() == PromotionType.PERCENTAGE) {
            calculatedDiscount = applicableAmount.multiply(promotion.getValue())
                    .divide(BigDecimal.valueOf(100), 2, RoundingMode.HALF_UP);
        } else {
            calculatedDiscount = promotion.getValue();
        }

        return calculatedDiscount.min(cartTotal);
    }

    private BigDecimal calculateApplicableAmount(Cart cart, Promotion promotion) {
        if (promotion.getScope() == PromotionScope.GLOBAL) {
            return calculateGlobalApplicableAmount(cart);
        }

        return calculateTargetedApplicableAmount(cart, promotion);
    }

    private BigDecimal calculateGlobalApplicableAmount(Cart cart) {
        return cart.getItems().stream()
                .map(this::calculateItemSubtotal)
                .reduce(BigDecimal.ZERO, BigDecimal::add);
    }

    private BigDecimal calculateTargetedApplicableAmount(Cart cart, Promotion promotion) {
        BigDecimal total = BigDecimal.ZERO;

        for (CartItem item : cart.getItems()) {
            if (isItemApplicableForPromotion(item, promotion)) {
                total = total.add(calculateItemSubtotal(item));
            }
        }

        return total;
    }

    private boolean isItemApplicableForPromotion(CartItem item, Promotion promotion) {
        if (promotion.getScope() == PromotionScope.PRODUCT) {
            return item.getProduct().getId().equals(promotion.getTargetId());
        } else if (promotion.getScope() == PromotionScope.CATEGORY) {
            return item.getProduct().getCategory().getId().equals(promotion.getTargetId());
        }
        return false;
    }

    private BigDecimal calculateItemSubtotal(CartItem item) {
        BigDecimal price = item.getProduct().getPrice();
        BigDecimal quantity = new BigDecimal(item.getQuantity());
        return price.multiply(quantity);
    }
}