package br.fucks.initial.web.controller;

import br.fucks.initial.config.ApplicationConfig;
import br.fucks.initial.config.security.securityschema.SystemPermissions;
import br.fucks.initial.entity.account.Profile;
import br.fucks.initial.entity.account.User;
import br.fucks.initial.entity.account.roles.GrupoPermissao;
import br.fucks.initial.service.AccountService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Wellington Felipe Fucks
 *
 * @version 1.0
 * @since 1.0, 30/10/2015
 */
@RestController
@RequestMapping("user")
public class UserController {

    @Autowired
    private AccountService accountService;

    /**
     *
     * @param user
     * @throws Exception
     */
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String createUser(@RequestBody User user) throws Exception {
        this.accountService.save(user);

        return String.format(ApplicationConfig.DEFAULT_MSG_RETURN, "Usuário cadastrado!");
    }

    /**
     *
     * @param user
     * @throws Exception
     */
    @PreAuthorize("hasRole('" + SystemPermissions.USUARIOS_UPDATE + "')")
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String updateUser(@RequestBody User user) throws Exception {
        this.accountService.save(user);

        return String.format(ApplicationConfig.DEFAULT_MSG_RETURN, "Usuário atualizado!");
    }

    /**
     *
     *
     * @param user
     * @throws Exception
     */
    @RequestMapping(value = "/account/update", method = RequestMethod.POST)
    public String updateProfile(@RequestBody User user) throws Exception {
        if (User.getAuthenticated().getId().equals(user.getId())) {
            user.setPassword("admin");
            this.accountService.save(user);
        }

        return String.format(ApplicationConfig.DEFAULT_MSG_RETURN, "Perfil atualizado!");
    }

    /**
     *
     * @param user
     */
    @RequestMapping(value = "/delete", method = RequestMethod.DELETE)
    @ResponseStatus(HttpStatus.OK)
    public String remove(@RequestBody User user) {
        this.accountService.delete(user);

        return String.format(ApplicationConfig.DEFAULT_MSG_RETURN, "Usuário removido!");
    }

    /**
     *
     * @param filter
     * @param page
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public @ResponseBody
    Page<User> listUsersByParams(@RequestParam("filter") String filter, Pageable page) {
        return this.accountService.listByParams(filter, page);
    }

    /**
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/find", method = RequestMethod.GET)
    public @ResponseBody
    User findUser(@RequestParam("id") Long id) {
        return this.accountService.findById(id);
    }

    /**
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/authenticated", method = RequestMethod.GET)
    public @ResponseBody
    User getAuthenticatedUser() {
        return (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    }

    /*
    * PROFILES
     */
    /**
     *
     * @return
     */
    @RequestMapping(value = "/profiles", method = RequestMethod.GET)
    public @ResponseBody
    List<Profile> getProfiles() {
        return this.accountService.listaAllProfiles();
    }

    /**
     *
     * @return
     */
    @RequestMapping(value = "/perfil-de-acesso/find", method = RequestMethod.GET)
    public @ResponseBody Profile findProfileById(@RequestParam Long id) {
        return this.accountService.findProfileById(id);
    }

    /**
     *
     * @return
     */
    @RequestMapping(value = "/perfil-de-acesso/update", method = RequestMethod.POST)
    public String updateProfile(@RequestBody Profile profile) {
        this.accountService.save(profile);
        
        return String.format(ApplicationConfig.DEFAULT_MSG_RETURN, "Perfil de acesso atualizado!");
    }

    /**
     *
     * @return
     */
    @RequestMapping(value = "/perfil-de-acesso/remove", method = RequestMethod.DELETE)
    public String removeProfile(@RequestBody Profile profile) {
        this.accountService.deletePerfilDeAcesso(profile);
        
        return String.format(ApplicationConfig.DEFAULT_MSG_RETURN, "Perfil de acesso removido!");
    }

    /**
     *
     * @param filter
     * @param page
     * @return
     */
    @RequestMapping(value = "/list-profiles", method = RequestMethod.GET)
    public @ResponseBody
    Page<Profile> listByParams(@RequestParam("filter") String filter, Pageable page) {
        return this.accountService.listProfilesByParams(filter, page);
    }

    /**
     *
     * @return
     */
    @RequestMapping(value = "/all-permissions-grouped", method = RequestMethod.GET)
    public @ResponseBody
    List<GrupoPermissao> getAllPermissions() {
        return SystemPermissions.GRUPO_PERMISSOES;
    }

}
