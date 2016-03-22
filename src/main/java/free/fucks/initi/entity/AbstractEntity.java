package free.fucks.initi.entity;

import java.util.Calendar;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author Wellington Felipe Fucks
 *
 * @version 1.0
 * @since 1.0, 29/10/2015
 */
@MappedSuperclass
@ToString(of = {"id"})
@EqualsAndHashCode(of = {"id"})
public abstract class AbstractEntity implements IEntity<Long> {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    protected Long id;

    @Getter
    @Setter
    @Column(nullable = false, updatable = false)
    @Temporal(TemporalType.TIMESTAMP)
    protected Calendar created;

    @Getter
    @Setter
    @Temporal(TemporalType.TIMESTAMP)
    protected Calendar updated;

    /*-------------------------------------------------------------------
     * 		 					CONSTRUCTORS
     *-------------------------------------------------------------------*/
    /**
     *
     */
    public AbstractEntity() {
    }

    /**
     *
     * @param id
     */
    public AbstractEntity(Long id) {
        this.setId(id);
    }

    /**
     *
     */
    @PrePersist
    protected void refreshCreated() {
        if (created == null) {
            this.created = Calendar.getInstance();
        }
    }

    /**
     *
     */
    @PreUpdate
    protected void refreshUpdated() {
        this.refreshCreated();
        this.updated = Calendar.getInstance();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

}
