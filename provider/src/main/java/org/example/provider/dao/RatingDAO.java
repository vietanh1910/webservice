package org.example.provider.dao;

import org.example.provider.entity.Rating;
import org.example.provider.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import java.util.List;

public class RatingDAO {

    public boolean addRating(Rating rating) {
        Session session = null;
        Transaction transaction = null;
        boolean success = false;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();

            session.save(rating);
            transaction.commit();
            success = true;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return success;
    }

    public List<Rating> getRatingsByTarget(int targetId) {
        List<Rating> ratings = null;
        Session session = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            String hql = "FROM Rating r WHERE r.targetId = :targetId";
            Query<Rating> query = session.createQuery(hql, Rating.class);
            query.setParameter("targetId", targetId);
            ratings = query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return ratings;
    }

    public Rating getUserRatingForTarget(int userId, int targetId) {
        Rating rating = null;
        Session session = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            String hql = "FROM Rating r WHERE r.userId = :userId AND r.targetId = :targetId";
            Query<Rating> query = session.createQuery(hql, Rating.class);
            query.setParameter("userId", userId);
            query.setParameter("targetId", targetId);
            rating = query.uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return rating;
    }

    public boolean updateRating(Rating rating) {
        Session session = null;
        Transaction transaction = null;
        boolean success = false;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();

            session.update(rating);
            transaction.commit();
            success = true;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return success;
    }

    public Double getAverageRating(int targetId) {
        Double averageRating = null;
        Session session = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            String hql = "SELECT AVG(r.rating) FROM Rating r WHERE r.targetId = :targetId";
            Query<Double> query = session.createQuery(hql, Double.class);
            query.setParameter("targetId", targetId);
            averageRating = query.uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return averageRating;
    }
}

