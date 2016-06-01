package br.fucks.initial.service;

import br.fucks.initial.config.security.securityschema.SystemPermissions;
import br.fucks.initial.entity.account.Profile;
import br.fucks.initial.entity.account.User;
import br.fucks.initial.entity.account.roles.Permissao;
import br.fucks.initial.repository.IAccountRepository;
import br.fucks.initial.repository.IPermissaoRepository;
import br.fucks.initial.repository.IProfileRepository;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Wellington Felipe Fucks
 *
 * @version 1.0
 * @since 1.0, 29/10/2015
 */
@Service
@Transactional
public class AccountService {

    @Autowired
    private IAccountRepository accountRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private IPermissaoRepository permissaoRepository;

    @Autowired
    private IProfileRepository profileRepository;

    /**
     * Users
     */
    /**
     *
     * @param user
     * @return
     */
    @PreAuthorize("hasPermission(#principal,'" + SystemPermissions.USUARIOS_INSERT + "')")
    public User save(User user) {
        String password = this.passwordEncoder.encode(user.getPassword());
        user.setPassword(password);

        return this.accountRepository.save(user);
    }

    public User saveDefault(User user) {
        String password = this.passwordEncoder.encode(user.getPassword());
        user.setPassword(password);

        return this.accountRepository.save(user);
    }

    /**
     *
     * @param user
     * @return
     */
    public User registerNewUser(User user) {
        String password = this.passwordEncoder.encode(user.getPassword());
        user.setPassword(password);

        user.setProfile(this.findProfileByName("Usuário externo registrado"));

        return this.accountRepository.save(user);
    }

    /**
     *
     * @param filter
     * @param page
     * @return
     */
    @PreAuthorize("hasPermission(#principal,'" + SystemPermissions.USUARIOS_LIST + "')")
    @Transactional(readOnly = true)
    public Page<User> listByParams(String filter, Pageable page) {
        return this.accountRepository.listByParam(filter, page);
    }

    /**
     *
     * @return
     */
    @PreAuthorize("hasPermission(#principal,'" + SystemPermissions.USUARIOS_LIST + "')")
    @Transactional(readOnly = true)
    public List<User> listAll() {
        return this.accountRepository.findAll();
    }

    /**
     *
     * @param username
     * @return
     */
    @PreAuthorize("hasPermission(#principal,'" + SystemPermissions.USUARIOS_LIST + "')")
    @Transactional(readOnly = true)
    public User findUserByUsername(String username) {
        return this.accountRepository.findUserByUsername(username);
    }

    /**
     *
     * @param id
     * @return
     */
    @PreAuthorize("hasPermission(#principal,'" + SystemPermissions.USUARIOS_LIST + "')")
    @Transactional(readOnly = true)
    public User findById(Long id) {
        return this.accountRepository.findOne(id);
    }

    /**
     *
     * @param users
     */
    @PreAuthorize("hasPermission(#principal,'" + SystemPermissions.USUARIOS_REMOVE + "')")
    public void delete(List<User> users) {
        for (User user : users) {
            this.accountRepository.delete(user);
        }
    }

    /**
     *
     * @param user
     */
    @PreAuthorize("hasPermission(#principal,'" + SystemPermissions.USUARIOS_REMOVE + "')")
    public void delete(User user) {
        this.accountRepository.delete(user);
    }

    /**
     *
     * @return
     */
    public Long countUsers() {
        return this.accountRepository.count();
    }

    /**
     * Permissões
     */
    /**
     *
     * @param permissao
     * @return
     */
    public Permissao save(Permissao permissao) {
        return this.permissaoRepository.save(permissao);
    }

    /**
     *
     * @return
     */
    @Transactional(readOnly = true)
    public List<Permissao> listAllPermissions() {
        return this.permissaoRepository.findAll();
    }

    /**
     *
     * @param name
     * @return
     */
    public Permissao findPermissaoByName(String name) {
        return this.permissaoRepository.findByName(name);
    }
   /**
    * 
    * @param profile 
    */
    public void deletePerfilDeAcesso(Profile profile) {
        this.profileRepository.delete(profile);
    }

    /**
     * @param permission
     * @return
     * @throws AccessDeniedException
     */
    public boolean hasPermission(String permission)
            throws AccessDeniedException {
        final Authentication authentication = SecurityContextHolder
                .getContext().getAuthentication();
        if (!(authentication.getPrincipal() instanceof User)) {
            return false;
        }

        final User user = (User) authentication.getPrincipal();

        for (Permissao systemRole : user.getProfile().getPermissoes()) {
            if (systemRole.getName().equals(permission)) {
                return true;
            }
        }
        return false;
    }

    /**
     * Perfis de acesso
     */
    /**
     *
     * @param profile
     * @return
     */
    public void save(Profile profile) {
        final List<Permissao> permissoes = new ArrayList<>();

        profile.getPermissoes().stream().forEach((permissao) -> {
            permissoes.add(this.permissaoRepository.findByName(permissao.getName()));
        });
        
        profile.setPermissoes(permissoes);
        
        this.profileRepository.save(profile);
    }

    /**
     *
     * @param name
     * @return
     */
    public Profile findProfileByName(String name) {
        return this.profileRepository.findByName(name);
    }

    /**
     *
     * @param id
     * @return
     */
    public Profile findProfileById(Long id) {
        return this.profileRepository.findOne(id);
    }

    /**
     *
     * @return
     */
    public List<Profile> listaAllProfiles() {
        return this.profileRepository.findAll();
    }

    /**
     *
     * @return
     */
    public Page<Profile> listProfilesByParams(String filter, Pageable pageable) {
        return this.profileRepository.listByParam(filter, pageable);
    }

    /**
     *
     * @return
     */
    public Long countProfiles() {
        return this.profileRepository.count();
    }
}
