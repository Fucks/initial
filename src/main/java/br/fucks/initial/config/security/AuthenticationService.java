package br.fucks.initial.config.security;

import br.fucks.initial.entity.account.User;
import br.fucks.initial.repository.IAccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

/**
 *
 * @author Wellington Felipe Fucks
 *
 * @version 1.0
 * @since 1.0, 30/10/2015
 */
@Service
public class AuthenticationService implements UserDetailsService {

    @Autowired
    private IAccountRepository accountRepository;

    /**
     *
     * @param string
     * @return
     * @throws UsernameNotFoundException
     */
    @Override
    public UserDetails loadUserByUsername(String string) throws UsernameNotFoundException {
        User authenticationUser = this.accountRepository.findUserByUsername(string);

        if (authenticationUser.getId() == null) {
            throw new UsernameNotFoundException("Usuário não encontrado");
        }

        return authenticationUser;
    }

}
