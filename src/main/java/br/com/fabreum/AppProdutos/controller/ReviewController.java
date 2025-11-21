package br.com.fabreum.AppProdutos.controller;

import br.com.fabreum.AppProdutos.config.JWTUserData;
import br.com.fabreum.AppProdutos.service.ReviewService;
import br.com.fabreum.AppProdutos.service.dto.ReviewRequestDto;
import br.com.fabreum.AppProdutos.service.dto.ReviewResponseDto;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("v1/reviews")
public class ReviewController {
    private final ReviewService reviewService;

    @PostMapping
    public ResponseEntity<ReviewResponseDto> createReview(
            @AuthenticationPrincipal JWTUserData userData,
            @RequestBody ReviewRequestDto reviewRequest
            ){
        ReviewResponseDto review = reviewService.createReview(userData, reviewRequest);
        return ResponseEntity.ok(review);
    }

    @GetMapping("/product/{productId}")
    public ResponseEntity<List<ReviewResponseDto>> getProductReviews(
            @PathVariable Long productId
    ){
        List<ReviewResponseDto> reviews = reviewService.getReviewsByProduct(productId);
        return ResponseEntity.ok(reviews);
    }
}
