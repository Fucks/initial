package br.fucks.initial.entity.account.roles;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.util.List;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author Wellington Felipe Fucks
 *
 * @version 1.0
 * @since 1.0, 17/11/2015
 */
@ToString()
@EqualsAndHashCode( of = {"name"})
@JsonIgnoreProperties(ignoreUnknown = true)
public class GrupoPermissao {

    @Getter
    @Setter
    private String name;

    @Getter
    @Setter
    private List<Permissao> permissoes;

    /**
     *
     */
    public GrupoPermissao() {

    }

    public GrupoPermissao(String name) {
        this.name = name;
    }
}
