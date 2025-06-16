package org.example.provider.dao;

import org.example.provider.entity.User;
import org.example.provider.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.query.Query;

public class UserDAO {

    public User findByUsername(String username) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            String sql = "FROM User WHERE username = :username";
            Query<User> query = session.createQuery(sql, User.class);
            query.setParameter("username", username);
            return query.uniqueResult();
        }
    }
}
