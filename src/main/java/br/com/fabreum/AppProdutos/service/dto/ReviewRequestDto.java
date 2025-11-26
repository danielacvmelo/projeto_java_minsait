package br.com.fabreum.AppProdutos.service.dto;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
public class ReviewRequestDto {
    @NotNull(message = "Product ID é obrigatório")
    private Long productId;

    @NotNull(message = "Order ID é obrigatório")
    private Long orderId;

    @NotNull(message = "Rating é obrigatório")
    @Min(value = 1, message = "O Rating deve ser entre 1 e 5")
    @Max(value = 5, message = "O Rating deve ser entre 1 e 5")
    private Integer rating;

    private String comment;
}