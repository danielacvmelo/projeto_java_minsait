package br.com.fabreum.AppProdutos.service;

import br.com.fabreum.AppProdutos.model.*;
import br.com.fabreum.AppProdutos.repository.CartRepository;
import br.com.fabreum.AppProdutos.repository.OrderRepository;
import lombok.RequiredArgsConstructor;
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

    @Transactional
    public Order checkout(Long cartId) {
        Cart cart = cartService.getCartById(cartId);

        if (cart.getItems().isEmpty()) {
            throw new RuntimeException("Não é possível finalizar um pedido com carrinho vazio!");
        }

        Order order = new Order();
        order.setStatus(OrderStatus.CREATED);
        order.setTotalPrice(cart.getTotalPrice());

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

        cart.getItems().clear();
        cart.setTotalPrice(BigDecimal.ZERO);
        cartRepository.save(cart);

        return savedOrder;
    }
}