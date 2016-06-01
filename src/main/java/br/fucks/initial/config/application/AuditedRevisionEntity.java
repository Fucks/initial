package br.fucks.initial.config.application;

import br.fucks.initial.entity.IEntity;
import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.envers.RevisionEntity;
import org.hibernate.envers.RevisionNumber;
import org.hibernate.envers.RevisionTimestamp;

/**
 *
 * @author Wellington Felipe Fucks
 *
 * @version 1.0
 * @since 1.0, 27/05/2016
 */
@Entity
@Table(name = "REVISION", schema = "history")
@RevisionEntity(AuditingRevisionListener.class)
public class AuditedRevisionEntity<T extends IEntity<ID>, ID extends Serializable> {

    @Id
    @Getter
    @Setter
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @RevisionNumber
    private Long revision;

    @Getter
    @Setter
    @RevisionTimestamp
    private long timestamp;

    @Getter
    @Setter
    private String userName;

    @Getter
    @Setter
    private Long userId;

    public AuditedRevisionEntity(String userName, Long userId) {
        this.userName = userName;
        this.userId = userId;
    }

    public AuditedRevisionEntity() {
    }

}
