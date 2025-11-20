package br.com.fabreum.AppProdutos.repository;

import br.com.fabreum.AppProdutos.model.OrderItem;
import br.com.fabreum.AppProdutos.service.dto.TopProductDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderItemRepository extends JpaRepository<OrderItem, Long> {
    @Query("SELECT new br.com.fabreum.AppProdutos.dto.TopProductDTO(i.product.name, SUM(i.quantity)) " +
            "FROM OrderItem i " +
            "GROUP BY i.product.name " +
            "ORDER BY SUM(i.quantity) DESC")
    List<TopProductDTO> findTopSellingProducts();
}