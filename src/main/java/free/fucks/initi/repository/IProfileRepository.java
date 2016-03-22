package free.fucks.initi.repository;

import free.fucks.initi.entity.account.Profile;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author Wellington Felipe Fucks
 *
 * @version 1.0
 * @since 1.0, 17/11/2015
 */
public interface IProfileRepository extends JpaRepository<Profile, Long>{

    public Profile findByName(String name);
}
