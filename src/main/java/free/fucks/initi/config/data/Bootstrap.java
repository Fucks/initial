package free.fucks.initi.config.data;

import free.fucks.initi.config.security.securityschema.SystemPermissions;
import free.fucks.initi.entity.account.Profile;
import free.fucks.initi.entity.account.User;
import free.fucks.initi.entity.account.roles.GrupoPermissao;
import free.fucks.initi.entity.account.roles.Permissao;
import free.fucks.initi.service.AccountService;
import java.util.ArrayList;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author Wellington Felipe Fucks
 *
 * @version 1.0
 * @since 1.0, 17/11/2015
 */
public class Bootstrap implements InitializingBean {

    private final Logger LOG = LoggerFactory.getLogger(Bootstrap.class);

    @Autowired
    private AccountService accountService;

    private final List<GrupoPermissao> permissoes = new ArrayList<>();

    /**
     *
     * @throws Exception
     */
    @Override
    public void afterPropertiesSet() throws Exception {
        this.initializingPermissions();
        this.createProfiles();
        this.createUsers();
    }

    /**
     * Salva os grupos de permissão e permissões.
     */
    public void initializingPermissions() {
        LOG.info("Bootstraping permissões -->");

        for (GrupoPermissao grupoPermissao : SystemPermissions.GRUPO_PERMISSOES) {

            for (Permissao permissao : grupoPermissao.getPermissoes()) {
                permissao = this.savePermission(permissao);
            }

            this.permissoes.add(grupoPermissao);
        }

        LOG.info("<-- Permissões salvas");

    }

    /**
     * Salva as permissões recursivamente.
     *
     * @param permissao
     * @return
     */
    public Permissao savePermission(Permissao permissao) {
        if (permissao.getDependencias() != null && !permissao.getDependencias().isEmpty()) {
            for (Permissao dependency : permissao.getDependencias()) {
                final Permissao savedPermission = savePermission(dependency);
                permissao.getDependencias().remove(dependency);
                permissao.getDependencias().add(savedPermission);
            }
        }

        final Permissao dbPermission = this.accountService.findPermissaoByName(permissao.getName());
        if (dbPermission == null || dbPermission.getId() == null) {
            permissao = this.accountService.save(permissao);
        } else {
            permissao = dbPermission;
        }
        return permissao;
    }

    /**
     *
     */
    public void createProfiles() {
        LOG.info("Bootstraping perfis de acesso -->");
        
        if(this.accountService.countProfiles() > 0){
            return;
        }

        Profile admProfile = this.accountService.findProfileByName("Administrador");

        if (admProfile == null) {
            admProfile = new Profile();
            admProfile.setName("Administrador");
        }

        for (GrupoPermissao grupo : this.permissoes) {
            admProfile.setPermissaos(grupo.getPermissoes());
        }

        this.accountService.save(admProfile);

        //Profile default user.
        final Profile userProfile = new Profile();

        userProfile.setName("Usuário externo registrado");
        userProfile.setPermissaos(new ArrayList<Permissao>());

        userProfile.getPermissaos().add(this.accountService.findPermissaoByName(SystemPermissions.USUARIOS_LIST));

        this.accountService.save(userProfile);

        LOG.info("<-- Perfis de acesso criados!");
    }

    /**
     *
     */
    public void createUsers() {
        LOG.info("Bootstraping usuários -->");

        if (this.accountService.countUsers() > 0) {
            return;
        }

        final User user = new User();

        user.setFirstName("Administrador");
        user.setLastName("do Sistema");
        user.setEmail("adm@email.com");
        user.setProfile(new Profile(1L));
        user.setPassword("admin");
        user.setUsername("admin");

        this.accountService.saveDefault(user);

        LOG.info("<-- usuários criados");

    }
}
