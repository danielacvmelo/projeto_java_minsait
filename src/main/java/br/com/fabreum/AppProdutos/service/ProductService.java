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

//    correcao de bug, antes estava retornando o antigo valor, apos a atualizacao;
//    agora retorna o valor atualizado!

    private final ProductRepository productRepository;

    public Optional<Product> updateProduct(Product product) {
        log.info("Atualizando produto: {}", product);

        if (product.getId() == null) {
            log.warn("Tentativa de atualizar produto sem ID");
            return Optional.empty();
        }

        return productRepository.findById(product.getId())
                .map(existing -> {
                    // COPIA os novos valores para o registro existente
                    existing.setName(product.getName());
                    existing.setPrice(product.getPrice());
                    existing.setBarcode(product.getBarcode());

                    // SALVA o registro atualizado
                    Product saved = productRepository.saveAndFlush(existing);

                    log.info("Produto atualizado: {}", saved);
                    return saved;
                });
    }
}
//
//    private final ProductRepository productRepository;
//
//    public Optional<Product> updateProduct(Product product) {
//        log.info("Atualizando produto: {}", product);
//        final var existingProduct = productRepository.findById(product.getId());
//        existingProduct.ifPresent(p -> {
//            product.setBarcode(p.getBarcode());
//            product.setName(p.getName());
//            product.setPrice(p.getPrice());
//            productRepository.saveAndFlush(product);
//        });
//        return existingProduct;
//    }
// }


