package br.com.fabreum.AppProdutos.controller;

import br.com.fabreum.AppProdutos.model.Stock;
import br.com.fabreum.AppProdutos.service.StockService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

record StockRequest(Integer quantity) {}

@RestController
@RequestMapping("/v1/inventory")
@RequiredArgsConstructor
public class StockController {

    private final StockService stockService;

    @GetMapping("/{productId}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<Stock> getStock(@PathVariable Long productId) {
        return stockService.getStockByProductId(productId)
                .map(stock -> ResponseEntity.ok(stock))
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping("/{productId}/add")
    //@PreAuthorize("hasRole('ADMIN')")
    @PreAuthorize("hasRole('ADMIN') or hasRole('SELLER')")
    public ResponseEntity<?> addStock(@PathVariable Long productId, @RequestBody StockRequest request) {
        try {
            Stock updatedStock = stockService.addStock(productId, request.quantity());
            return ResponseEntity.ok(updatedStock);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PostMapping("/{productId}/remove")
    //@PreAuthorize("hasRole('ADMIN')")
    @PreAuthorize("hasRole('ADMIN') or hasRole('SELLER')")
    public ResponseEntity<?> removeStock(@PathVariable Long productId, @RequestBody StockRequest request) {
        try {
            Stock updatedStock = stockService.removeStock(productId, request.quantity());
            return ResponseEntity.ok(updatedStock);
        } catch (RuntimeException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }
}