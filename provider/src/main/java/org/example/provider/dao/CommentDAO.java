package org.example.provider.dao;

import org.example.provider.entity.Comment;
import org.example.provider.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import java.util.List;

public class CommentDAO {

    public boolean addComment(Comment comment) {
        Session session = null;
        Transaction transaction = null;
        boolean success = false;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();

            session.save(comment);
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

    public List<Comment> getCommentsByTarget(int targetId) {
        List<Comment> comments = null;
        Session session = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            String hql = "FROM Comment c WHERE c.targetId = :targetId ORDER BY c.createdAt DESC";
            Query<Comment> query = session.createQuery(hql, Comment.class);
            query.setParameter("targetId", targetId);
            comments = query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return comments;
    }

    public boolean updateComment(Comment comment) {
        Session session = null;
        Transaction transaction = null;
        boolean success = false;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();

            session.update(comment);
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

    public boolean deleteComment(int commentId) {
        Session session = null;
        Transaction transaction = null;
        boolean success = false;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();

            Comment comment = session.get(Comment.class, commentId);
            if (comment != null) {
                session.delete(comment);
                transaction.commit();
                success = true;
            }
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

    public Comment findById(int commentId) {
        Comment comment = null;
        Session session = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            comment = session.get(Comment.class, commentId);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return comment;
    }

    public List<Comment> getCommentsByUser(int userId) {
        List<Comment> comments = null;
        Session session = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            String hql = "FROM Comment c WHERE c.userId = :userId ORDER BY c.createdAt DESC";
            Query<Comment> query = session.createQuery(hql, Comment.class);
            query.setParameter("userId", userId);
            comments = query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return comments;
    }

    public boolean insertComment(Comment comment) {
        Session session = null;
        Transaction transaction = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.save(comment);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
            return false;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }
}