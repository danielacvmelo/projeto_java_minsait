package br.com.fabreum.AppProdutos.controller.response;

import br.com.fabreum.AppProdutos.enums.Role;

public record LoginResponse(Long id, String name, String email, Role role, String token) {
}
