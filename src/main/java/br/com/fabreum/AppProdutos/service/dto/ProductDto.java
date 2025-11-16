package br.com.fabreum.AppProdutos.service.dto;

import lombok.Builder;

import java.math.BigDecimal;

@Builder
public record ProductDto(Long id, String barcode, String name, BigDecimal price) {
}
