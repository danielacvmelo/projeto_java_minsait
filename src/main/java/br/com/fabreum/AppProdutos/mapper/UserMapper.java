package br.com.fabreum.AppProdutos.mapper;

import br.com.fabreum.AppProdutos.controller.request.UserRequest;
import br.com.fabreum.AppProdutos.controller.response.UserResponse;
import br.com.fabreum.AppProdutos.model.User;
import lombok.experimental.UtilityClass;

@UtilityClass
public class UserMapper {

    public static User toUser(UserRequest request) {
        return User.builder()
                .name(request.name())
                .email(request.email())
                .password(request.password())
                .build();
    }

    public static UserResponse toUserResponse(User user) {
        return UserResponse.builder()
                .id(user.getId())
                .name(user.getName())
                .email(user.getEmail())
                .build();
    }
}
