package br.com.fabreum.AppProdutos.service.dto;

import br.com.fabreum.AppProdutos.enums.AuditAction;
import lombok.Data;

import java.time.LocalDateTime;

@Data
public class AuditLogResponseDto {
    private Long id;
    private String entityType;
    private Long EntityId;
    private AuditAction action;
    private String beforeJson;
    private String afterJson;
    private Long userId;
    private String userEmail;
    private LocalDateTime createdAt;
}
