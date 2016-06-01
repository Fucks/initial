package br.fucks.initial.repository;

import br.fucks.initial.entity.account.roles.Permissao;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author Wellington Felipe Fucks
 *
 * @version 1.0
 * @since 1.0, 17/11/2015
 */
public interface IPermissaoRepository extends JpaRepository<Permissao, Long> {

    public Permissao findByName(String name);
}
