package br.com.fabreum.AppProdutos.controller;

import br.com.fabreum.AppProdutos.model.Cart;
import br.com.fabreum.AppProdutos.service.CartService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import java.lang.SecurityException;

record AddItemRequest(Long productId, Integer quantity) {}
record UpdateQuantityRequest(Integer newQuantity) {}

@RestController
@RequestMapping("/v1/cart")
@RequiredArgsConstructor
public class CartController {

    private final CartService cartService;

    @PostMapping
    @PreAuthorize("hasRole('USER')")
    public ResponseEntity<Cart> createCart() {
        Cart newCart = cartService.createNewCart();
        return ResponseEntity.status(HttpStatus.CREATED).body(newCart);
    }

    @GetMapping("/{cartId}")
    @PreAuthorize("hasRole('USER')")
    public ResponseEntity<?> getCart(@PathVariable Long cartId) {
        try {
            Cart cart = cartService.getCartById(cartId);
            return ResponseEntity.ok(cart);
        } catch (RuntimeException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
        }
    }

    @PostMapping("/{cartId}/items")
    @PreAuthorize("hasRole('USER')")
    public ResponseEntity<?> addItemToCart(@PathVariable Long cartId, @RequestBody AddItemRequest request) {
        try {
            Cart updatedCart = cartService.addProductToCart(cartId, request.productId(), request.quantity());
            return ResponseEntity.ok(updatedCart);
        } catch (RuntimeException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }

    @PutMapping("/{cartId}/items/{cartItemId}")
    @PreAuthorize("hasRole('USER')")
    public ResponseEntity<?> updateItemQuantity(@PathVariable Long cartId,
                                                @PathVariable Long cartItemId,
                                                @RequestBody UpdateQuantityRequest request) {
        try {
            Cart updatedCart = cartService.updateItemQuantity(cartId, cartItemId, request.newQuantity());
            return ResponseEntity.ok(updatedCart);
        } catch (SecurityException e) {
            return ResponseEntity.status(HttpStatus.FORBIDDEN).body(e.getMessage());
        } catch (RuntimeException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }

    @DeleteMapping("/{cartId}/items/{cartItemId}")
    @PreAuthorize("hasRole('USER')")
    public ResponseEntity<?> removeItemFromCart(@PathVariable Long cartId, @PathVariable Long cartItemId) {
        try {
            Cart updatedCart = cartService.removeProductFromCart(cartId, cartItemId);
            return ResponseEntity.ok(updatedCart);
        } catch (SecurityException e) {
            return ResponseEntity.status(HttpStatus.FORBIDDEN).body(e.getMessage());
        } catch (RuntimeException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
        }
    }
}