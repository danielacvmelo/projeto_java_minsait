package br.com.fabreum.AppProdutos.service;

import br.com.fabreum.AppProdutos.model.Product;
import br.com.fabreum.AppProdutos.model.Stock;
import br.com.fabreum.AppProdutos.repository.ProductRepository;
import br.com.fabreum.AppProdutos.repository.StockRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Service
@RequiredArgsConstructor
public class StockService {

    private final StockRepository stockRepository;
    private final ProductRepository productRepository;


    @Transactional(readOnly = true)
    public Optional<Stock> getStockByProductId(Long productId) {
        return stockRepository.findByProductId(productId);
    }

    @Transactional
    public Stock addStock(Long productId, Integer quantityToAdd) {
        if (quantityToAdd <= 0) {
            throw new IllegalArgumentException("Quantidade deve ser positiva.");
        }

        Product product = productRepository.findById(productId)
                .orElseThrow(() -> new RuntimeException("Produto não encontrado!"));

        Stock stock = stockRepository.findByProductId(product.getId())
                .orElseGet(() -> {
                    Stock newStock = new Stock();
                    newStock.setProduct(product);
                    newStock.setQuantity(0);
                    return newStock;
                });

        stock.setQuantity(stock.getQuantity() + quantityToAdd);

        return stockRepository.save(stock);
    }

    @Transactional
    public Stock removeStock(Long productId, Integer quantityToRemove) {
        if (quantityToRemove <= 0) {
            throw new IllegalArgumentException("Quantidade deve ser positiva.");
        }

        Product product = productRepository.findById(productId)
                .orElseThrow(() -> new RuntimeException("Produto não encontrado!"));

        Stock stock = stockRepository.findByProductId(product.getId())
                .orElseThrow(() -> new RuntimeException("Estoque não encontrado para este produto!"));

        if (stock.getQuantity() < quantityToRemove) {
            throw new RuntimeException("Estoque insuficiente! Disponível: " + stock.getQuantity());
        }

        stock.setQuantity(stock.getQuantity() - quantityToRemove);
        return stockRepository.save(stock);
    }
}