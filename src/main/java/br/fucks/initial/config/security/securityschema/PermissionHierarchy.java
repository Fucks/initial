package br.fucks.initial.config.security.securityschema;

import br.fucks.initial.entity.account.roles.Permissao;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.springframework.security.access.hierarchicalroles.RoleHierarchy;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;

/**
 *
 * @author Wellington Felipe Fucks
 *
 * @version 1.0
 * @since 1.0, 17/11/2015
 */
public class PermissionHierarchy implements RoleHierarchy {

    /**
     *
     */
    @Override
    public Collection<GrantedAuthority> getReachableGrantedAuthorities(Collection<? extends GrantedAuthority> authorities) {
        if (authorities == null || authorities.isEmpty()) {
            return AuthorityUtils.NO_AUTHORITIES;
        }

        Set<GrantedAuthority> reachableRoles = new HashSet<GrantedAuthority>();

        for (GrantedAuthority authority : authorities) {
            addReachableRoles(reachableRoles, authority);
            Set<Permissao> additionalReachableRoles = getRolesReachableInOneOrMoreSteps(authority);

            if (additionalReachableRoles != null) {
                reachableRoles.addAll(additionalReachableRoles);
            }
        }

        final List<GrantedAuthority> reachableRoleList = new ArrayList<GrantedAuthority>(reachableRoles.size());
        reachableRoleList.addAll(reachableRoles);

        return reachableRoleList;
    }

    /**
     *
     * @param reachableRoles
     * @param authority
     */
    private void addReachableRoles(Set<GrantedAuthority> reachableRoles, GrantedAuthority authority) {
        for (GrantedAuthority testAuthority : reachableRoles) {
            final String testKey = testAuthority.getAuthority();

            if (testKey != null && testKey.equals(authority.getAuthority())) {
                return;
            }
        }
        reachableRoles.add(authority);
    }

    /**
     *
     * @param authority
     * @return
     */
    private Set<Permissao> getRolesReachableInOneOrMoreSteps(GrantedAuthority authority) {
        if (authority.getAuthority() == null) {
            return null;
        }
        for (Permissao testAuthority : SystemPermissions.PERMISSOES.keySet()) {
            final String testKey = testAuthority.getAuthority();

            if (testKey != null && testKey.equals(authority.getAuthority())) {
                return SystemPermissions.PERMISSOES.get(testAuthority);
            }
        }
        return null;
    }
}