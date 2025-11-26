package br.com.fabreum.AppProdutos.service;

import br.com.fabreum.AppProdutos.model.Cart;
import br.com.fabreum.AppProdutos.model.CartItem;
import br.com.fabreum.AppProdutos.model.Product;
import br.com.fabreum.AppProdutos.model.Stock;
import br.com.fabreum.AppProdutos.repository.CartItemRepository;
import br.com.fabreum.AppProdutos.repository.CartRepository;
import br.com.fabreum.AppProdutos.repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Service
@RequiredArgsConstructor
public class CartService {

    private final CartRepository cartRepository;
    private final CartItemRepository cartItemRepository;
    private final ProductRepository productRepository;
    private final StockService stockService;

    @Transactional
    public Cart createNewCart() {
        Cart newCart = new Cart();
        return cartRepository.save(newCart);
    }

    @Transactional(readOnly = true)
    public Cart getCartById(Long cartId) {
        return cartRepository.findById(cartId)
                .orElseThrow(() -> new RuntimeException("Carrinho não encontrado! ID: " + cartId));
    }

    @Transactional
    public Cart addProductToCart(Long cartId, Long productId, Integer quantity) {

        Cart cart = getCartById(cartId);
        Product product = productRepository.findById(productId)
                .orElseThrow(() -> new RuntimeException("Produto não encontrado! ID: " + productId));

        Stock stock = stockService.getStockByProductId(productId)
                .orElseThrow(() -> new RuntimeException("Estoque não encontrado para o produto ID: " + productId));

        if (stock.getQuantity() < quantity) {
            throw new RuntimeException("Estoque insuficiente! Disponível: " + stock.getQuantity() + ". Pedido: " + quantity);
        }

        Optional<CartItem> existingItemOpt = cart.getItems().stream()
                .filter(item -> item.getProduct().getId().equals(productId))
                .findFirst();

        if (existingItemOpt.isPresent()) {
            CartItem existingItem = existingItemOpt.get();
            existingItem.setQuantity(existingItem.getQuantity() + quantity);
            cartItemRepository.save(existingItem);
        } else {
            CartItem newItem = new CartItem();
            newItem.setProduct(product);
            newItem.setQuantity(quantity);
            cart.addItem(newItem);
        }

        cart.recalculateTotalPrice();
        return cartRepository.save(cart);
    }

    @Transactional
    public Cart removeProductFromCart(Long cartId, Long cartItemId) {
        Cart cart = getCartById(cartId);

        CartItem itemToRemove = cartItemRepository.findById(cartItemId)
                .orElseThrow(() -> new RuntimeException("Item do carrinho não encontrado! ID: " + cartItemId));

        if (!itemToRemove.getCart().getId().equals(cartId)) {
            throw new SecurityException("Este item não pertence a este carrinho!");
        }

        cart.removeItem(itemToRemove);

        cart.recalculateTotalPrice();
        return cartRepository.save(cart);
    }

    @Transactional
    public Cart updateItemQuantity(Long cartId, Long cartItemId, Integer newQuantity) {
        if (newQuantity <= 0) {
            return removeProductFromCart(cartId, cartItemId);
        }

        Cart cart = getCartById(cartId);

        CartItem itemToUpdate = cartItemRepository.findById(cartItemId)
                .orElseThrow(() -> new RuntimeException("Item do carrinho não encontrado! ID: " + cartItemId));

        if (!itemToUpdate.getCart().getId().equals(cartId)) {
            throw new SecurityException("Este item não pertence a este carrinho!");
        }

        Stock stock = stockService.getStockByProductId(itemToUpdate.getProduct().getId())
                .orElseThrow(() -> new RuntimeException("Estoque não encontrado para este produto!"));

        if (stock.getQuantity() < newQuantity) {
            throw new RuntimeException("Estoque insuficiente! Disponível: " + stock.getQuantity() + ". Pedido: " + newQuantity);
        }

        itemToUpdate.setQuantity(newQuantity);
        cartItemRepository.save(itemToUpdate);

        cart.recalculateTotalPrice();
        return cartRepository.save(cart);
    }



}