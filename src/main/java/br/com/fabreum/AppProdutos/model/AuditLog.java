package br.com.fabreum.AppProdutos.model;

import br.com.fabreum.AppProdutos.enums.AuditAction;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "tb_audit_log")
public class AuditLog {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "entity_type", nullable = false)
    private String entityType;   // product, category, user, order

    @Column(name = "entity_id", nullable = false)
    private Long entityId;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private AuditAction action; // create, update, delete

    @Column(name = "before_json", columnDefinition = "TEXT")
    private String beforeJson;  // estado anterior em json

    @Column(name = "after_json", columnDefinition = "TEXT")
    private String afterJson;   // estado posterior em json

    @Column(name = "user_id")
    private Long userId;        // id do usuário que fez ação

    @Column(name = "user_email")
    private String userEmail;

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
    }
}
