package br.com.fabreum.AppProdutos.controller.request;

import br.com.fabreum.AppProdutos.enums.Role;

public record UserRequest(String name, String email, String password, Role role) {
}
