package br.com.fabreum.AppProdutos.service;

import br.com.fabreum.AppProdutos.config.JWTUserData;
import br.com.fabreum.AppProdutos.enums.AuditAction;
import br.com.fabreum.AppProdutos.model.AuditLog;
import br.com.fabreum.AppProdutos.repository.AuditLogRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AuditLogService {
    private final AuditLogRepository auditLogRepository;
    private final ObjectMapper objectMapper;

    // registra quando uma entidade é criada
    public void logCreate(String entityType, Long entityId, Object afterEntity){
        logAction(entityType, entityId, AuditAction.CREATE, null, afterEntity);
    }

    // regitra as alterações (estados anterior e posterior)
    public void logUpdate(String entityType, Long entityId, Object beforeEntity, Object afterEntity){
        logAction(entityType, entityId, AuditAction.UPDATE, beforeEntity, afterEntity);
    }

    // registra as exclusões
    public void logDelete(String entityType, Long entityId, Object beforeEntity){
        logAction(entityType, entityId, AuditAction.DELETE, beforeEntity, null);
    }

    private void logAction(String entityType, Long entityId, AuditAction action,
                           Object beforeEntity, Object afterEntity) {
        try {
            AuditLog auditLog = new AuditLog();
            auditLog.setEntityType(entityType);
            auditLog.setEntityId(entityId);
            auditLog.setAction(action);

            // serializa estados para json
            if (beforeEntity != null) {
                auditLog.setBeforeJson(objectMapper.writeValueAsString(beforeEntity));
            }
            if (afterEntity != null) {
                auditLog.setAfterJson(objectMapper.writeValueAsString(afterEntity));
            }

            // obtém usuário autenticado
            Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            if (principal instanceof JWTUserData) {
                JWTUserData userData = (JWTUserData) principal;
                auditLog.setUserId(userData.id());
                auditLog.setUserEmail(userData.email());
            }

            auditLogRepository.save(auditLog);

        } catch (JsonProcessingException e) {
            throw new RuntimeException("Erro ao serializar entidade para auditoria", e);
        }
    }
}
