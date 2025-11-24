package br.com.fabreum.AppProdutos.controller;

import br.com.fabreum.AppProdutos.model.AuditLog;
import br.com.fabreum.AppProdutos.repository.AuditLogRepository;
// import br.com.fabreum.AppProdutos.service.dto.AuditLogLogResponseDto;
import br.com.fabreum.AppProdutos.service.dto.AuditLogResponseDto;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequiredArgsConstructor
@RequestMapping("v1/audit")
public class AuditController {
    private final AuditLogRepository auditLogRepository;

    @GetMapping
    public ResponseEntity<List<AuditLogResponseDto>> getAuditLogs(
            @RequestParam(required = false) String entity){
        List<AuditLog> auditLogs;  // lista para armazenar os logs recuperados

        // verifica se foi fornecido um filtro por entidade
        if(entity != null && !entity.trim().isEmpty()){
            // busca por entidade específica
            auditLogs = auditLogRepository.findByEntityTypeOrderByCreatedAtDesc(entity);
        }else{
            // busca todos os logs
            auditLogs = auditLogRepository.findAllByOrderByCreatedAtDesc();
        }

        // converte a lista de entidades para dtos de resposta
        List<AuditLogResponseDto> response = auditLogs.stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());

        return ResponseEntity.ok(response);
    }

    // metodo pra converter entidade AuditLog em Dto de resposta
    private AuditLogResponseDto convertToDTO(AuditLog auditLog) {
        AuditLogResponseDto dto = new AuditLogResponseDto();
        dto.setId(auditLog.getId());
        dto.setEntityType(auditLog.getEntityType());
        dto.setEntityId(auditLog.getEntityId());
        dto.setAction(auditLog.getAction());
        dto.setBeforeJson(auditLog.getBeforeJson());
        dto.setAfterJson(auditLog.getAfterJson());
        dto.setUserId(auditLog.getUserId());
        dto.setUserEmail(auditLog.getUserEmail());
        dto.setCreatedAt(auditLog.getCreatedAt());
        return dto;
    }
}
