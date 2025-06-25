package org.example.provider.dao;

import org.example.provider.dto.PlaceDTO;
import org.example.provider.entity.*;
import org.example.provider.util.HibernateUtil;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import javax.persistence.EntityManager;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class PlaceDAO {
    public List<PlaceDTO> searchPlaces(String keyword) {
        List<PlaceDTO> result = new ArrayList<>();
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            String hql = "FROM Place p WHERE (p.placeName LIKE :keyword OR p.description LIKE :keyword OR p.address LIKE :keyword) AND p.isDeleted = false";
            Query<Place> query = session.createQuery(hql, Place.class);
            query.setParameter("keyword", "%" + keyword + "%");

            List<Place> places = query.getResultList();

            for (Place place : places) {
                Hibernate.initialize(place.getImages());
                Hibernate.initialize(place.getInformation());
                result.add(toDTO(place));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    private PlaceDTO toDTO(Place place) {
        if (place == null) return null;

        PlaceDTO dto = new PlaceDTO();
        dto.setId(place.getPlaceId());
        dto.setPlaceName(place.getPlaceName());
        dto.setAddress(place.getAddress());
        dto.setDescription(place.getDescription());
        dto.setGuideId(place.getGuideId());
        dto.setAverageRating(place.getAverageRating());
        dto.setTotalRatings(place.getTotalRatings());

        // Convert images to base64 or url if needed
        if (place.getImages() != null) {
            List<String> urls = place.getImages().stream()
                    .map(PlaceImage::getImageUrl)
                    .collect(Collectors.toList());
            dto.setImageUrls(urls);
        }

        if (place.getInformation() != null) {
            dto.setPlaceInformation(place.getInformation().getContent()); // tùy vào thông tin bạn cần
        }

        return dto;
    }


    public boolean addPlace(Place place) {
        Session session = null;
        Transaction transaction = null;
        boolean success = false;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();

            session.save(place);
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

    public boolean updatePlace(Place place) {
        Session session = null;
        Transaction transaction = null;
        boolean success = false;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Place existing = session.get(Place.class, place.getPlaceId());
            if (existing != null) {
                existing.setPlaceId(place.getPlaceId());
                existing.setPlaceName(place.getPlaceName());
                existing.setDescription(place.getDescription());
                existing.setAddress(place.getAddress());
                existing.setUpdatedAt(LocalDateTime.now());

                session.update(existing);
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

    public boolean deletePlace(int placeId) {
        Session session = null;
        Transaction transaction = null;
        boolean success = false;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();

            Place place = session.get(Place.class, placeId);
            if (place != null) {
                place.setDeleted(true);
                session.update(place);
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


    public Place findById(int placeId) {
        Place place = null;
        Session session = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            String hql = "FROM Place p WHERE p.placeId = :placeId AND p.isDeleted = false";
            Query<Place> query = session.createQuery(hql, Place.class);
            query.setParameter("placeId", placeId);
            place = query.uniqueResult();
            if (place != null) {
                Hibernate.initialize(place.getImages());
                Hibernate.initialize(place.getInformation());
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return place;
    }

    public List<PlaceDTO> getPlacesByGuide(int guideId) {
        List<PlaceDTO> result = new ArrayList<>();
        Session session = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            String hql = "FROM Place p WHERE p.guideId = :guideId AND p.isDeleted = false ORDER BY p.createdAt DESC";
            Query<Place> query = session.createQuery(hql, Place.class);
            query.setParameter("guideId", guideId);
            List<Place> places = query.getResultList();

            for (Place place : places) {
                // Khởi tạo các quan hệ LAZY trước khi session đóng
                Hibernate.initialize(place.getImages());

                PlaceDTO dto = new PlaceDTO();
                dto.setId(place.getPlaceId());
                dto.setPlaceName(place.getPlaceName());
                dto.setAddress(place.getAddress());
                dto.setDescription(place.getDescription());

                List<String> urls = place.getImages().stream()
                        .map(PlaceImage::getImageUrl)
                        .collect(Collectors.toList());

                dto.setImageUrls(urls);

                result.add(dto);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }

        return result;
    }

    public List<PlaceDTO> getPlacesOutstanding() {
        List<PlaceDTO> result = new ArrayList<>();
        Session session = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            String hql = "FROM Place p " +
                    "WHERE p.isDeleted = false " +
                    "ORDER BY p.averageRating DESC, p.totalRatings DESC";
            Query<Place> query = session.createQuery(hql, Place.class);
            query.setMaxResults(3);
            List<Place> places = query.getResultList();

            for (Place place : places) {
                Hibernate.initialize(place.getImages());

                PlaceDTO dto = new PlaceDTO();
                dto.setId(place.getPlaceId());
                dto.setPlaceName(place.getPlaceName());
                dto.setAddress(place.getAddress());
                dto.setDescription(place.getDescription());

                List<String> urls = place.getImages().stream()
                        .map(PlaceImage::getImageUrl)
                        .collect(Collectors.toList());
                dto.setImageUrls(urls);

                result.add(dto);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }

        return result;
    }


    public List<Place> getAllPlaces() {
        List<Place> places = null;
        Session session = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            String hql = "FROM Place p WHERE p.isDeleted = false";
            Query<Place> query = session.createQuery(hql, Place.class);
            places = query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return places;
    }

    public List<Place> getPlacesWithPagination(int offset, int limit) {
        List<Place> places = null;
        Session session = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            String hql = "FROM Place p WHERE p.isDeleted = false ORDER BY p.createdAt DESC";
            Query<Place> query = session.createQuery(hql, Place.class);
            query.setFirstResult(offset);
            query.setMaxResults(limit);
            places = query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return places;
    }

    public long getTotalPlacesCount() {
        Long count = 0L;
        Session session = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            String hql = "SELECT COUNT(p) FROM Place p WHERE p.isDeleted = false";
            Query<Long> query = session.createQuery(hql, Long.class);
            count = query.uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return count != null ? count : 0L;
    }

    public List<PlaceImage> getPlaceImages(int placeId) {
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            String hql = "FROM PlaceImage pi WHERE pi.placeId = :placeId AND pi.isDeleted = false";
            Query<PlaceImage> query = session.createQuery(hql, PlaceImage.class);
            query.setParameter("placeId", placeId);
            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    public List<PlaceInformation> getPlaceInformation(int placeId) {
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            String hql = "FROM PlaceInformation pi WHERE pi.placeId = :placeId AND pi.isDeleted = false";
            Query<PlaceInformation> query = session.createQuery(hql, PlaceInformation.class);
            query.setParameter("placeId", placeId);
            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }
}