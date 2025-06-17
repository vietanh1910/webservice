package org.example.provider.dao;

import org.example.provider.entity.PlaceInformation;
import org.example.provider.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import java.util.List;

public class PlaceInformationDAO {

    public boolean addInformation(PlaceInformation information) {
        Session session = null;
        Transaction transaction = null;
        boolean success = false;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();

            session.save(information);
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

    public List<PlaceInformation> getInformationByPlace(int placeId) {
        List<PlaceInformation> informationList = null;
        Session session = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            String hql = "FROM PlaceInformation pi WHERE pi.placeId = :placeId AND pi.isDeleted = false";
            Query<PlaceInformation> query = session.createQuery(hql, PlaceInformation.class);
            query.setParameter("placeId", placeId);
            informationList = query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return informationList;
    }

    public boolean updateInformation(PlaceInformation information) {
        Session session = null;
        Transaction transaction = null;
        boolean success = false;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();

            session.update(information);
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

    public boolean deleteInformation(int infoId) {
        Session session = null;
        Transaction transaction = null;
        boolean success = false;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();

            PlaceInformation information = session.get(PlaceInformation.class, infoId);
            if (information != null) {
                information.setDeleted(true);
                session.update(information);
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

    public PlaceInformation findById(int infoId) {
        PlaceInformation information = null;
        Session session = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            String hql = "FROM PlaceInformation pi WHERE pi.infoId = :infoId AND pi.isDeleted = false";
            Query<PlaceInformation> query = session.createQuery(hql, PlaceInformation.class);
            query.setParameter("infoId", infoId);
            information = query.uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return information;
    }
}
