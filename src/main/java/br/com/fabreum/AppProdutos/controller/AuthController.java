package br.com.fabreum.AppProdutos.controller;

import br.com.fabreum.AppProdutos.controller.request.UserRequest;
import br.com.fabreum.AppProdutos.controller.response.UserResponse;
import br.com.fabreum.AppProdutos.mapper.UserMapper;
import br.com.fabreum.AppProdutos.model.User;
import br.com.fabreum.AppProdutos.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("v1/auth")
@RequiredArgsConstructor
public class AuthController {

    private final UserService userService;

    @PostMapping("/register")
    public ResponseEntity<UserResponse> register(@RequestBody UserRequest request){
        User savedUser = userService.save(UserMapper.toUser(request));
        return ResponseEntity.status(HttpStatus.CREATED).body(UserMapper.toUserResponse(savedUser));
    }
}
