package free.fucks.initi.config.security;

import free.fucks.initi.entity.account.User;
import free.fucks.initi.entity.account.roles.Permissao;
import java.io.Serializable;
import org.springframework.security.access.PermissionEvaluator;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;

/**
 *
 * @author Wellington Felipe Fucks
 *
 * @version 1.0
 * @since 1.0, 19/11/2015
 */
@Component
public class CustomPermissionEvaluator implements PermissionEvaluator {

    @Override
    public boolean hasPermission(Authentication authentication, Object targetDomainObject,
            Object permission) {
        return authentication.getAuthorities().contains(new Permissao((String) permission));
    }

    @Override
    public boolean hasPermission(Authentication authentication, Serializable targetId,
            String targetType, Object permission) {
        return authorize((User) authentication.getPrincipal(), (String) targetId);
    }

    public boolean authorize(User user, String thingId) {
        boolean allowed = false;
        System.out.println("Authorizing " + user.getUsername() + "...");
        return false;
    }

}
