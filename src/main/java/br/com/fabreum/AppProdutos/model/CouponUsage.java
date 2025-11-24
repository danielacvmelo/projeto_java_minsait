package br.com.fabreum.AppProdutos.model;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "tb_coupon_usages")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CouponUsage {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "promotion_id")
    private Promotion promotion;

    @ManyToOne
    @JoinColumn(name = "order_id")
    private Order order;

    private LocalDateTime usedAt;
}