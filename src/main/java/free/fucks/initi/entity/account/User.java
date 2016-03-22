package free.fucks.initi.entity.account;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import free.fucks.initi.entity.AbstractEntity;
import free.fucks.initi.entity.account.roles.Permissao;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

/**
 *
 * @author Wellington Felipe Fucks
 *
 * @version 1.0
 * @since 1.0, 29/10/2015
 */
@Entity
@JsonIgnoreProperties(ignoreUnknown = true)
@ToString(callSuper = true)
@Table(name = "USUARIO", schema = "public")
@EqualsAndHashCode(callSuper = true)
public class User extends AbstractEntity implements UserDetails {

    @Getter
    @Setter
    @Column(nullable = false)
    private String firstName;

    @Getter
    @Setter
    @Column(nullable = false)
    private String lastName;

    @Getter
    @Setter
    @Column(nullable = false, unique = true)
    private String email;

    @Setter
    @Column(nullable = false)
    private String password;

    @Setter
    @Column(nullable = false, unique = true)
    private String username;

    @Getter
    @Setter
    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    private Profile profile;

    /**
     *
     */
    public User() {

    }

    public User(Long id, String firstName, String lastName, String email, String username) {
        super(id);
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.username = username;
    }

    public User(String firstName, String lastName, String email, String password, String username) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.username = username;
    }

    public User(String firstName, String lastName, String email, String password, String username, Long id) {
        super(id);
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.username = username;
    }

    /*
     USER DETAILS METODOS
     */
    @JsonIgnore
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        final List<Permissao> permissoes = new ArrayList<>();
        for (Permissao grupoPermissao : this.profile.getPermissaos()) {
            for (Permissao permissao : grupoPermissao.getDependencias()) {
                permissoes.addAll(permissao.getDependencias());
            }
            permissoes.add(grupoPermissao);
        }

        return permissoes;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

    @Override
    public String getUsername() {
        return this.username;
    }

    @Override
    public String getPassword() {
        return this.password;
    }
    
    public boolean hasPermission(Permissao permissao){
        return this.profile.getPermissaos().contains(permissao);
    }
}
