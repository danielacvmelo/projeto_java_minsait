package br.com.fabreum.AppProdutos.service.dto;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class ReviewResponseDto {
    private Long id;
    private Long productId;
    private String productName;
    private Long userId;
    private String userName;
    private String userRole;
    private Integer rating;
    private String comment;
    private LocalDateTime createdAt;
}
