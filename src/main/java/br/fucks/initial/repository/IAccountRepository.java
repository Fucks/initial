package br.fucks.initial.repository;

import br.fucks.initial.entity.account.User;
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
 * @since 1.0, 29/10/2015
 */
public interface IAccountRepository extends JpaRepository<User, Long>{

    public User findUserByUsername(String username);
    
    /**
     * @param filter
     * @param pageable
     * @return 
     */
    @Query(value = "SELECT new User(user.id, user.fullName, user.email, user.username) "
            + "FROM User user "
            + "WHERE ( (LOWER(user.fullName) LIKE '%' || LOWER(CAST(:filter AS string)) || '%' OR :filter = NULL ) "
            + "OR (LOWER(user.email) LIKE '%' || LOWER(CAST(:filter AS string)) || '%' OR :filter = NULL ) "
            + "OR (LOWER(user.username) LIKE '%' || LOWER(CAST(:filter AS string)) || '%' OR :filter = NULL ) )")
    public Page<User> listByParam(@Param("filter") String filter, Pageable pageable);
}
