package br.com.fabreum.AppProdutos.repository;

import br.com.fabreum.AppProdutos.model.AuditLog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AuditLogRepository extends JpaRepository<AuditLog, Long>{
    // busca logs por tipo de entidade
    List<AuditLog> findByEntityTypeOrderByCreatedAtDesc(String EntityType);

    // busca logs por tipo de entidade e id específico
    List<AuditLog> findByEntityTypeAndEntityIdOrderByCreatedAtDesc(String entityType, Long entityId);

    // busca todos os logs (ordenados por data)
    @Query("SELECT a FROM AuditLog a ORDER BY a.createdAt DESC")
    List<AuditLog> findAllByOrderByCreatedAtDesc();
}