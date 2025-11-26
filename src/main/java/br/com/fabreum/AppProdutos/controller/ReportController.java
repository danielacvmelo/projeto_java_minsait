package br.com.fabreum.AppProdutos.controller;

import br.com.fabreum.AppProdutos.service.dto.TopProductDTO;
import br.com.fabreum.AppProdutos.model.Stock;
import br.com.fabreum.AppProdutos.service.ReportService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;
import java.util.List;

@RestController
@RequestMapping("/v1/reports")
@RequiredArgsConstructor
public class ReportController {

    private final ReportService reportService;

    @GetMapping("/low-stock")
    @PreAuthorize("hasRole('ADMIN') or hasRole('SELLER')")
    public ResponseEntity<List<Stock>> getLowStockReport() {
        return ResponseEntity.ok(reportService.getLowStockReport());
    }

    @GetMapping("/sales")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<BigDecimal> getTotalSales() {
        return ResponseEntity.ok(reportService.getTotalSales());
    }

    @GetMapping("/top-products")
    @PreAuthorize("hasRole('ADMIN') or hasRole('SELLER')")
    public ResponseEntity<List<TopProductDTO>> getTopProducts() {
        return ResponseEntity.ok(reportService.getTopProducts());
    }
}