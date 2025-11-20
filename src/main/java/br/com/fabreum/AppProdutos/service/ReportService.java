package br.com.fabreum.AppProdutos.service;

import br.com.fabreum.AppProdutos.service.dto.TopProductDTO;
import br.com.fabreum.AppProdutos.model.Stock;
import br.com.fabreum.AppProdutos.repository.OrderItemRepository;
import br.com.fabreum.AppProdutos.repository.OrderRepository;
import br.com.fabreum.AppProdutos.repository.StockRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ReportService {

    private final StockRepository stockRepository;
    private final OrderRepository orderRepository;
    private final OrderItemRepository orderItemRepository;

    public List<Stock> getLowStockReport() {
        return stockRepository.findByQuantityLessThan(5);
    }

    public BigDecimal getTotalSales() {
        return orderRepository.calculateTotalRevenue();
    }

    public List<TopProductDTO> getTopProducts() {
        return orderItemRepository.findTopSellingProducts();
    }
}