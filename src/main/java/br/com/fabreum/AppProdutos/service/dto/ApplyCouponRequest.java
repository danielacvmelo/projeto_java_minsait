package br.com.fabreum.AppProdutos.service.dto;

import lombok.Builder;

@Builder
public record ApplyCouponRequest(Long cartId, String code) {
}