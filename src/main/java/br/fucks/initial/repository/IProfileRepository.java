package br.fucks.initial.repository;

import br.fucks.initial.entity.account.Profile;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 *
 * @author Wellington Felipe Fucks
 *
 * @version 1.0
 * @since 1.0, 17/11/2015
 */
public interface IProfileRepository extends JpaRepository<Profile, Long> {

    public Profile findByName(String name);

    @Query(value = "SELECT profile "
            + "FROM Profile profile "
            + "WHERE ( LOWER(profile.name) LIKE '%' || LOWER(CAST(:filter AS string))  || '%' OR :filter = NULL)")
    public Page<Profile> listByParam(@Param("filter") String filter, Pageable pageable);
}
