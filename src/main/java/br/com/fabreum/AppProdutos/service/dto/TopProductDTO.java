package br.com.fabreum.AppProdutos.service.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class TopProductDTO {
    private String productName;
    private Long totalSold;
}
