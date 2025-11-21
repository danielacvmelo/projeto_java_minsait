package br.com.fabreum.AppProdutos.model;

import br.com.fabreum.AppProdutos.enums.PromotionScope;
import br.com.fabreum.AppProdutos.enums.PromotionType;
import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "tb_promotions")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Promotion {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true, nullable = false)
    private String code;

    @Enumerated(EnumType.STRING)
    private PromotionType type;

    @Column(nullable = false)
    private BigDecimal value;

    @Enumerated(EnumType.STRING)
    private PromotionScope scope;

    @Column(name = "target_id")
    private Long targetId;

    private LocalDateTime validFrom;
    private LocalDateTime validTo;

    private Integer usageLimit;
    private Integer usedCount;

    public boolean isValid() {
        LocalDateTime now = LocalDateTime.now();
        boolean dateValid = (validFrom == null || !now.isBefore(validFrom)) &&
                (validTo == null || !now.isAfter(validTo));
        boolean limitValid = usageLimit == null || usedCount < usageLimit;

        return dateValid && limitValid;
    }
}