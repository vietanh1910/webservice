package org.example.provider.dao;

import org.example.provider.entity.PlaceImage;
import org.example.provider.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import java.util.List;

public class PlaceImageDAO {

    public boolean addImage(PlaceImage image) {
        Session session = null;
        Transaction transaction = null;
        boolean success = false;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();

            session.save(image);
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

    public List<PlaceImage> getImagesByPlace(int placeId) {
        List<PlaceImage> images = null;
        Session session = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            String hql = "FROM PlaceImage pi WHERE pi.placeId = :placeId AND pi.isDeleted = false";
            Query<PlaceImage> query = session.createQuery(hql, PlaceImage.class);
            query.setParameter("placeId", placeId);
            images = query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return images;
    }

    public boolean deleteImage(int imageId) {
        Session session = null;
        Transaction transaction = null;
        boolean success = false;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();

            PlaceImage image = session.get(PlaceImage.class, imageId);
            if (image != null) {
                image.setDeleted(true);
                session.update(image);
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

    public PlaceImage findById(int imageId) {
        PlaceImage image = null;
        Session session = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            String hql = "FROM PlaceImage pi WHERE pi.imageId = :imageId AND pi.isDeleted = false";
            Query<PlaceImage> query = session.createQuery(hql, PlaceImage.class);
            query.setParameter("imageId", imageId);
            image = query.uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return image;
    }

    public boolean updateImage(PlaceImage image) {
        Session session = null;
        Transaction transaction = null;
        boolean success = false;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();

            session.update(image);
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

    public List<PlaceImage> getAllImages() {
        List<PlaceImage> images = null;
        Session session = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            String hql = "FROM PlaceImage pi WHERE pi.isDeleted = false ORDER BY pi.createdAt DESC";
            Query<PlaceImage> query = session.createQuery(hql, PlaceImage.class);
            images = query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return images;
    }

    public List<PlaceImage> getImagesByUploader(int uploaderId) {
        List<PlaceImage> images = null;
        Session session = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            String hql = "FROM PlaceImage pi WHERE pi.uploadedBy = :uploaderId AND pi.isDeleted = false";
            Query<PlaceImage> query = session.createQuery(hql, PlaceImage.class);
            query.setParameter("uploaderId", uploaderId);
            images = query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return images;
    }
}


