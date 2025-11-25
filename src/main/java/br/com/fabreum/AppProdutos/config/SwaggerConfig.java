package br.com.fabreum.AppProdutos.config;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.info.Contact;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SwaggerConfig {

    @Bean
    public OpenAPI customOpenAPI() {
        // ADD DESCRICAO
        return new OpenAPI()
                .info(new Info()
                        .title("App Produtos API")
                        .version("1.0")
                        .description("API para gerenciamento de produtos")
                        .contact(new Contact()
                                .name("Seu Nome")
                                .email("seu@email.com")));
    }
}