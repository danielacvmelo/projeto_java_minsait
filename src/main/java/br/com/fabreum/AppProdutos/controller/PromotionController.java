package br.com.fabreum.AppProdutos.controller;

import br.com.fabreum.AppProdutos.model.Cart;
import br.com.fabreum.AppProdutos.model.Promotion;
import br.com.fabreum.AppProdutos.service.PromotionService;
import br.com.fabreum.AppProdutos.service.dto.ApplyCouponRequestDto;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/v1")
@RequiredArgsConstructor
public class PromotionController {

    private final PromotionService promotionService;

    @PostMapping("/promotions")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<Promotion> createPromotion(@RequestBody Promotion promotion) {
        return ResponseEntity.ok(promotionService.createPromotion(promotion));
    }

    @PostMapping("/coupons/apply")
    public ResponseEntity<?> applyCoupon(@Valid @RequestBody ApplyCouponRequestDto request) {
        try {
            Cart updatedCart = promotionService.applyCoupon(request.cartId(), request.code());
            return ResponseEntity.ok(updatedCart);
        } catch (RuntimeException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }
}