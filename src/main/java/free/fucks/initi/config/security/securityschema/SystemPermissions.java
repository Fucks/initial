package free.fucks.initi.config.security.securityschema;

import free.fucks.initi.entity.account.roles.GrupoPermissao;
import free.fucks.initi.entity.account.roles.Permissao;
import java.io.Serializable;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.logging.Logger;

/**
 *
 * @author Wellington Felipe Fucks
 *
 * @version 1.0
 * @since 1.0, 17/11/2015
 */
public class SystemPermissions implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = -2762862257064156506L;
    /**
     *
     */
    private static final Logger LOG = Logger.getLogger(SystemPermissions.class.getName());

    /**
     * Armazena uma lista hierarquica de permissões agrupadas por {@link}
     * GrupoPermissao
     */
    public static final List<GrupoPermissao> GRUPO_PERMISSOES = new ArrayList<>();
    /**
     * Armazena um mapa de forma linear, relacionando as permissões e suas
     * dependências
     */
    public static final Map<Permissao, Set<Permissao>> PERMISSOES = new HashMap<>();

    //Carrega todas as permissões no sistema
    static {
        for (Field field : SystemPermissions.class.getDeclaredFields()) {
            //Se o tipo do atributo é uma permission
            if (Modifier.isPublic(field.getModifiers())
                    && Modifier.isStatic(field.getModifiers())
                    && Modifier.isFinal(field.getModifiers())
                    && field.getType().equals(String.class)) {
                try {
                    final PermissionMapping permissionMapping = field.getAnnotation(PermissionMapping.class);

                    //Obtém o nome do grupo via reflection
                    final String groupName = permissionMapping.group();
                    final GrupoPermissao grupoPermissao = new GrupoPermissao(groupName);

                    //Obtém o nome da permissão
                    final Permissao permissao = new Permissao(field.get(null).toString());

                    //Obtém as dependências (se houver) da permissão
                    final String[] dependencies = permissionMapping.dependencies();
                    final Set<Permissao> dependencyPermissao = new HashSet<>();
                    for (String dependency : dependencies) {
                        dependencyPermissao.add(new Permissao(dependency));
                    }
                    permissao.setDependencias(dependencyPermissao);
                    PERMISSOES.put(permissao, dependencyPermissao);

                    //Se já tiver o group na lista, apenas adicionamos a permissão.
                    if (GRUPO_PERMISSOES.contains(grupoPermissao)) {
                        final int index = GRUPO_PERMISSOES.indexOf(grupoPermissao);
                        GRUPO_PERMISSOES.get(index).getPermissoes().add(permissao);
                    } //Caso o grupo não esteja na lista de permissoes, adicionamos o grupo e a permissão.
                    else {
                        grupoPermissao.setPermissoes(new ArrayList<Permissao>());
                        grupoPermissao.getPermissoes().add(permissao);
                        GRUPO_PERMISSOES.add(grupoPermissao);
                    }

                    //Ordena os grupos de permissões por ordem alfabética
//                    Collections.sort(GRUPO_PERMISSOES);

                } catch (Exception e) {
                    //Como ocorrer uma exception na geração das permissoes, é necessário parar a execução
                    LOG.info(e.getMessage());
                    System.exit(0);
                }
            }
        }

        //Adiciona as dependências das dependências de cada permissão como dependência da permissão
        for (Map.Entry<Permissao, Set<Permissao>> permissao : PERMISSOES.entrySet()) {
            Set<Permissao> otherPermissions = new HashSet<>();
            //Para cada dependência
            for (Permissao dependency : permissao.getValue()) {
                //Procura no Map de permissões
                for (Map.Entry<Permissao, Set<Permissao>> p : PERMISSOES.entrySet()) {
                    if (p.getKey().getName().equals(dependency.getName())) {
                        //Adiciona as dependências de p na lista de outras dependências
                        for (Permissao pDependency : p.getValue()) {
                            otherPermissions.add(pDependency);
                        }
                        break;
                    }
                }
            }
            //Adiciona as outras dependências na lista de dependências da permissão
            permissao.getValue().addAll(otherPermissions);
        }
    }

    /**
     * PERMISSÕES
     */
    
    //--- Usuários
    @PermissionMapping(group = "usuarios")
    public static final String USUARIOS_LIST = "usuarios.list";
    @PermissionMapping(group = "usuarios", dependencies = {USUARIOS_LIST})
    public static final String USUARIOS_INSERT = "usuarios.insert";
    @PermissionMapping(group = "usuarios", dependencies = {USUARIOS_LIST})
    public static final String USUARIOS_UPDATE = "usuarios.update";
    @PermissionMapping(group = "usuarios", dependencies = {USUARIOS_LIST})
    public static final String USUARIOS_REMOVE = "usuarios.remove";
    
    //--- Anothers

}
