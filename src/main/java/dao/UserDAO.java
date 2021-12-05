package dao;



import jpautils.JpaUtils;
import model.User;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import java.util.List;

public class UserDAO extends AbstractEntity<User> {

    public UserDAO() {
        super(User.class);
    };
}
