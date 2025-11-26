package br.com.fabreum.AppProdutos.repository;

import br.com.fabreum.AppProdutos.model.Product;
import br.com.fabreum.AppProdutos.service.dto.ProductDto;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

    //Projection
    @Query(nativeQuery = true, value = """
            SELECT p.id, 
            p.barcode AS barcode, 
            p.name AS name, 
            p.price AS price
            FROM tb_products p 
            WHERE p.id = :id
            """)
    ProductDto findByIdDto(long id);
}

