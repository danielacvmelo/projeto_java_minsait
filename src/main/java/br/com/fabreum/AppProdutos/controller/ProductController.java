package br.com.fabreum.AppProdutos.controller;

import br.com.fabreum.AppProdutos.model.Product;
import br.com.fabreum.AppProdutos.repository.ProductRepository;
import br.com.fabreum.AppProdutos.service.ProductService;
import br.com.fabreum.AppProdutos.service.dto.ProductDto;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

@RestController
@RequiredArgsConstructor
@RequestMapping("v1/products/")
public class ProductController {

    private final ProductRepository productRepository;
    private final ProductService productService;

    @PostMapping("product")
    public ResponseEntity<Product> createProduct(@RequestBody Product product) {
        Product saved = productRepository.save(product);
        return ResponseEntity.ok(saved);
    }

    @GetMapping
    public ResponseEntity<List<Product>> listProducts() {
        List<Product> products = productRepository.findAll();
        return ResponseEntity.ok(products);
    }

    @GetMapping("{id}")
    public ResponseEntity<Product> listProductById(@PathVariable Long id) {
        Product product = productRepository.findById(id).orElseThrow();
        return ResponseEntity.ok(product);
    }

    /**
     * Exemplo de retorno de um Record.
     * @param id
     * @return
     */
    @GetMapping("/dto/{id}")
    public ResponseEntity<ProductDto> listProductDtoById(@PathVariable Long id) {
        ProductDto productDto = productRepository.findByIdDto(id);

        final var product = new Product();
        product.setName(productDto.name());
        product.setPrice(productDto.price());
        product.setBarcode(productDto.barcode());
        productRepository.saveAndFlush(product);

        return ResponseEntity.ok(productDto);
    }

    @PutMapping("update")
    public ResponseEntity<Optional<Product>> updateProduct(@RequestBody Product product) {
        final var existingProduct = productService.updateProduct(product);
        return ResponseEntity.ok(existingProduct);
    }

    @DeleteMapping("{id}")
    public ResponseEntity<Void> deleteProduct(@PathVariable Long id) {
        //Exemplo construindo Record
        final var p = new ProductDto(1L, "dfs", "sdfa", new BigDecimal("25.6"));
        //Exemplo construindo Builder do record
        final var p2 = ProductDto.builder()
                .id(1L)
                .barcode("dfs")
                .name("sdfa")
                .price(new BigDecimal("25.6"))
                .build();
        productRepository.deleteById(id);
        return ResponseEntity.noContent().build();
    }

}
