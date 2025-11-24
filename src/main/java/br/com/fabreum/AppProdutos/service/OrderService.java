package br.com.fabreum.AppProdutos.service;

import br.com.fabreum.AppProdutos.model.*;
import br.com.fabreum.AppProdutos.repository.CartRepository;
import br.com.fabreum.AppProdutos.repository.OrderRepository;
import br.com.fabreum.AppProdutos.repository.CouponUsageRepository;
import br.com.fabreum.AppProdutos.repository.PromotionRepository;
import br.com.fabreum.AppProdutos.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;

@Service
@RequiredArgsConstructor
public class OrderService {

    private final OrderRepository orderRepository;
    private final CartService cartService;
    private final CartRepository cartRepository;
    private final StockService stockService;
    private final CouponUsageRepository couponUsageRepository;
    private final PromotionRepository promotionRepository;
    private final UserRepository userRepository;

    @Transactional
    public Order checkout(Long cartId) {
        Cart cart = cartService.getCartById(cartId);

        if (cart.getItems().isEmpty()) {
            throw new RuntimeException("Não é possível finalizar um pedido com carrinho vazio!");
        }

        Order order = new Order();
        order.setStatus(OrderStatus.CREATED);
        order.setTotalPrice(cart.getTotalPrice());
        order.setDiscount(cart.getDiscountValue());

        for (CartItem cartItem : cart.getItems()) {
            OrderItem orderItem = new OrderItem();
            orderItem.setOrder(order);
            orderItem.setProduct(cartItem.getProduct());
            orderItem.setQuantity(cartItem.getQuantity());
            orderItem.setPriceAtPurchase(cartItem.getProduct().getPrice());
            order.getItems().add(orderItem);
            stockService.removeStock(cartItem.getProduct().getId(), cartItem.getQuantity());
        }

        Order savedOrder = orderRepository.save(order);

        if (cart.getAppliedPromotion() != null) {
            Promotion promotion = cart.getAppliedPromotion();

            promotion.setUsedCount(promotion.getUsedCount() + 1);
            promotionRepository.save(promotion);

            String userEmail = SecurityContextHolder.getContext().getAuthentication().getName();
            User user = (User) userRepository.findUserByEmail(userEmail).orElseThrow();

            CouponUsage usage = CouponUsage.builder()
                    .user(user)
                    .promotion(promotion)
                    .order(savedOrder)
                    .usedAt(java.time.LocalDateTime.now())
                    .build();
            couponUsageRepository.save(usage);
        }

        cart.getItems().clear();
        cart.setTotalPrice(BigDecimal.ZERO);
        cart.setDiscountValue(BigDecimal.ZERO);
        cart.setAppliedPromotion(null);
        cartRepository.save(cart);

        return savedOrder;
    }
}