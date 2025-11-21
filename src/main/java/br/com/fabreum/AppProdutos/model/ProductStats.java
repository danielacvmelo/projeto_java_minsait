package br.com.fabreum.AppProdutos.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "tb_product_stats")
public class ProductStats {
    @Id
    private Long id;

    @OneToOne
    @MapsId
    @JoinColumn(name = "product_id")
    private Product product;

    // média das avaliações
    @Column(name = "average_rating", precision = 3, scale = 2)
    private BigDecimal averageRating = BigDecimal.ZERO;

    // total de avaliações
    @Column(name = "review_count")
    private Integer reviewCount = 0;

    // contadores individuais para cada estrela de avaliação
    @Column(name = "rating_1")
    private Integer rating1 = 0;

    @Column(name = "rating_2")
    private Integer rating2 = 0;

    @Column(name = "rating_3")
    private Integer rating3 = 0;

    @Column(name = "rating_4")
    private Integer rating4 = 0;

    @Column(name = "rating_5")
    private Integer rating5 = 0;
}
