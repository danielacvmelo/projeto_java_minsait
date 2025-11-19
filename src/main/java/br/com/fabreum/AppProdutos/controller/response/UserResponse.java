package br.com.fabreum.AppProdutos.controller.response;

import br.com.fabreum.AppProdutos.enums.Role;
import lombok.Builder;

@Builder
public record UserResponse(Long id, String name, String email, Role role) {
}
