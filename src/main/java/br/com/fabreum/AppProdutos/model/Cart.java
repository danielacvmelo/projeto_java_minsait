package br.com.fabreum.AppProdutos.model;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "tb_carts")
@Getter
@Setter
public class Cart {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToMany(mappedBy = "cart", cascade = CascadeType.ALL, orphanRemoval = true)
    @JsonManagedReference
    private Set<CartItem> items = new HashSet<>();

    @Column(name = "total_price")
    private BigDecimal totalPrice = BigDecimal.ZERO;

    @ManyToOne
    @JoinColumn(name = "applied_promotion_id")
    private Promotion appliedPromotion;

    @Column(name = "discount_value")
    private BigDecimal discountValue = BigDecimal.ZERO;

    public void addItem(CartItem item) {
        items.add(item);
        item.setCart(this);
        recalculateTotalPrice();
    }

    public void removeItem(CartItem item) {
        items.remove(item);
        item.setCart(null);
        recalculateTotalPrice();
    }

    public void recalculateTotalPrice() {
        BigDecimal subtotal = BigDecimal.ZERO;
        for (CartItem item : items) {
            subtotal = subtotal.add(item.getProduct().getPrice().multiply(new BigDecimal(item.getQuantity())));
        }
        if (this.discountValue != null) {
            this.totalPrice = subtotal.subtract(this.discountValue).max(BigDecimal.ZERO);
        } else {
            this.totalPrice = subtotal;
        }
    }
}