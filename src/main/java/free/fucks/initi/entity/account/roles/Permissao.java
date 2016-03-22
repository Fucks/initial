package free.fucks.initi.entity.account.roles;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import free.fucks.initi.entity.AbstractEntity;
import java.util.Set;
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
import org.springframework.security.core.GrantedAuthority;

/**
 *
 * @author Wellington Felipe Fucks
 *
 * @version 1.0
 * @since 1.0, 17/11/2015
 */
@Entity
@Table(name = "PERMISSION")
@ToString(of = {"name"})
@EqualsAndHashCode(of = {"name"})
@JsonIgnoreProperties(ignoreUnknown = true)
public class Permissao extends AbstractEntity implements GrantedAuthority {

    @Getter
    @Setter
    @Column(nullable = false, unique = true)
    private String name;

    @Getter
    @Setter
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "PERMISSION_DEPENDENCY")
    private Set<Permissao> dependencias;

    @Override
    public String getAuthority() {
        return this.name;
    }

    public Permissao() {
        super();
    }

    public Permissao(String name) {
        this.name = name;
    }

    public Permissao(String name, Long id) {
        super(id);
        this.name = name;
    }
}
