package br.fucks.initial.entity.account;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import br.fucks.initial.entity.AbstractEntity;
import br.fucks.initial.entity.account.roles.Permissao;
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
import org.hibernate.envers.Audited;
import org.hibernate.envers.NotAudited;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

/**
 *
 * @author Wellington Felipe Fucks
 *
 * @version 1.0
 * @since 1.0, 29/10/2015
 */
@Entity
@Audited
@JsonIgnoreProperties(ignoreUnknown = true)
@ToString(callSuper = true)
@Table(name = "USUARIO", schema = "public")
@EqualsAndHashCode(callSuper = true)
public class User extends AbstractEntity implements UserDetails {

    @Getter
    @Setter
    @Column(nullable = false)
    private String fullName;

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
    @NotAudited
    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    private Profile profile;

    /**
     *
     */
    public User() {

    }

    /**
     *
     */
    public User(Long id) {
        super(id);
    }

    /**
     * 
     * @param id
     * @param fullName
     * @param email
     * @param username 
     */
    public User(Long id, String fullName, String email, String username) {
        super(id);
        this.fullName = fullName;
        this.email = email;
        this.username = username;
    }

    /**
     *
     * @param id
     * @param fullName
     * @param email
     * @param password
     * @param username
     * @param profile
     */
    public User(Long id, String fullName, String email, String password, String username, Profile profile) {
        this.id = id;
        this.fullName = fullName;
        this.email = email;
        this.password = password;
        this.username = username;
        this.profile = profile;
    }

    /*
     USER DETAILS METODOS
     */
    @JsonIgnore
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        final List<Permissao> permissoes = new ArrayList<>();
        for (Permissao grupoPermissao : this.profile.getPermissoes()) {
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

    public boolean hasPermission(Permissao permissao) {
        return this.profile.getPermissoes().contains(permissao);
    }

    /**
     * Retorna o usuário logado no sistema no momento.
     *
     * @return
     */
    @JsonIgnore
    public static User getAuthenticated() {
        if(SecurityContextHolder.getContext().getAuthentication() != null)
            return (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        
        return new User();
    }
}
