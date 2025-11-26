package br.com.fabreum.AppProdutos.config;

import lombok.Builder;

@Builder
public record JWTUserData(Long id, String name, String email, String role) {
}
