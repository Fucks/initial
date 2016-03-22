package free.fucks.initi.entity.account;

import free.fucks.initi.entity.AbstractEntity;
import free.fucks.initi.entity.account.roles.Permissao;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author Wellington Felipe Fucks
 *
 * @version 1.0
 * @since 1.0, 30/10/2015
 */
@Entity
@Table(name = "PERFIL_DE_ACESSO", schema = "public")
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
public class Profile extends AbstractEntity {

    @Getter
    @Setter
    @Column(nullable = false, unique = true)
    private String name;

    @Getter
    @Setter
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "PROFILE_PERMISSION")
    private List<Permissao> permissaos;

    /**
     *
     */
    public Profile() {

    }

    public Profile(Long id) {
        super(id);
    }
}
