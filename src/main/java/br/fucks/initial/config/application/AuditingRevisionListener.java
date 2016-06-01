package br.fucks.initial.config.application;

import br.fucks.initial.entity.account.User;
import javax.persistence.PrePersist;
import javax.persistence.PreRemove;
import javax.persistence.PreUpdate;
import org.hibernate.envers.RevisionListener;
import org.springframework.context.annotation.Configuration;

/**
 * Classe responsável por criar a revisão das entidades a cada iteração com o
 * banco.
 *
 * @author Wellington Felipe Fucks
 *
 * @version 1.0
 * @since 1.0, 27/05/2016
 */
@Configuration
public class AuditingRevisionListener implements RevisionListener {

    /**
     * Cria uma nova revisão
     *
     * @param revisionEntity
     */
    @PrePersist
    @PreUpdate
    @PreRemove
    @Override
    public void newRevision(Object revisionEntity) {
        final AuditedRevisionEntity auditedRevisionEntity = (AuditedRevisionEntity) revisionEntity;

        final User authenticated = User.getAuthenticated();

        auditedRevisionEntity.setUserName(authenticated.getFullName());
        auditedRevisionEntity.setUserId(authenticated.getId());

    }
}
