package dao;

import model.User;

public class UserDAO extends AbstractEntity<User> {

    public UserDAO() {
        super(User.class);
    }
}
