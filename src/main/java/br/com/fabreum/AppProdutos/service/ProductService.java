package br.com.fabreum.AppProdutos.service;

import br.com.fabreum.AppProdutos.model.Product;
import br.com.fabreum.AppProdutos.repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@RequiredArgsConstructor
@Slf4j
public class ProductService {

    private final ProductRepository productRepository;

    public Optional<Product> updateProduct(Product product) {
        log.info("Atualizando produto: {}", product);
        final var existingProduct = productRepository.findById(product.getId());
        existingProduct.ifPresent(p -> {
            product.setBarcode(p.getBarcode());
            product.setName(p.getName());
            product.setPrice(p.getPrice());
            productRepository.saveAndFlush(product);
        });
        return existingProduct;
    }

}
