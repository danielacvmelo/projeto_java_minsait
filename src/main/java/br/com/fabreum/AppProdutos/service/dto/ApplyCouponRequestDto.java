package br.com.fabreum.AppProdutos.service.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Builder;

@Builder
public record ApplyCouponRequestDto(
        @NotNull(message = "ID do carrinho é obrigatório")
        Long cartId,

        @NotBlank(message = "Código do cupom é obrigatório")
        String code
) {}