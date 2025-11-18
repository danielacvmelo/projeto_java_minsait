package br.com.fabreum.AppProdutos.controller;

import br.com.fabreum.AppProdutos.model.Order;
import br.com.fabreum.AppProdutos.service.OrderService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/v1/order")
@RequiredArgsConstructor
public class OrderController {

    private final OrderService orderService;

    @PostMapping("/{cartId}/checkout")
    public ResponseEntity<?> checkout(@PathVariable Long cartId) {
        try {
            Order newOrder = orderService.checkout(cartId);
            return ResponseEntity.status(HttpStatus.CREATED).body(newOrder);
        } catch (RuntimeException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }
}