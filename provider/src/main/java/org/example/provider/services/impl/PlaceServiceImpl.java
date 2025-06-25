package org.example.provider.services.impl;

import org.example.provider.dao.PlaceDAO;
import org.example.provider.dao.PlaceImageDAO;
import org.example.provider.dao.UserDAO;
import org.example.provider.dto.PlaceDTO;
import org.example.provider.entity.Place;
import org.example.provider.entity.User;
import org.example.provider.entity.PlaceImage;
import org.example.provider.services.PlaceService;
import org.hibernate.Hibernate;

import javax.jws.WebService;
import javax.xml.bind.annotation.XmlTransient;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@WebService(endpointInterface = "org.example.provider.services.PlaceService")
public class PlaceServiceImpl implements PlaceService {

    private PlaceDAO placeDAO = new PlaceDAO();
    private PlaceImageDAO imageDAO = new PlaceImageDAO();
    private UserDAO userDAO = new UserDAO();

    @Override
    public List<PlaceDTO> searchPlaces(String keyword) {
        try {
            if (keyword == null || keyword.trim().isEmpty()) {
                return new ArrayList<>();
            }
            return placeDAO.searchPlaces(keyword);
        } catch (Exception e) {
            System.err.println("Database error in searchPlaces: " + e.getMessage());
            return new ArrayList<>();
        }
    }

    @Override
    public int addPlace(Place place, int userId) {
        try {
            // Verify user is a guide
            User user = userDAO.findById(userId);
            if (user == null || user.getRole() == 2) {
                return -1; // User is not a guide
            }

            place.setGuideId(userId);
            boolean result = placeDAO.addPlace(place);
            return result ? place.getPlaceId() : -1;
        } catch (Exception e) {
            System.err.println("Database error in addPlace: " + e.getMessage());
            e.printStackTrace();
            return -1;
        }
    }

    @Override
    public boolean updatePlace(int placeId, Place place, int userId) {
        try {
            Place existingPlace = placeDAO.findById(placeId);
            if (existingPlace == null) {
                return false;
            }

            // Check if user is the owner guide
            if (existingPlace.getGuideId() != userId) {
                return false;
            }

            place.setPlaceId(placeId);
            return placeDAO.updatePlace(place);
        } catch (Exception e) {
            System.err.println("Database error in updatePlace: " + e.getMessage());
            return false;
        }
    }

    @Override
    public boolean deletePlace(int placeId, int userId) {
        try {
            Place place = placeDAO.findById(placeId);
            if (place == null) {
                return false;
            }

            // Check if user is the owner guide
            if (place.getGuideId() != userId) {
                return false;
            }

            return placeDAO.deletePlace(placeId);
        } catch (Exception e) {
            System.err.println("Database error in deletePlace: " + e.getMessage());
            return false;
        }
    }

    @Override
    @XmlTransient
    public PlaceDTO getPlace(int placeId) {
        try {
            Place place = placeDAO.findById(placeId);
            return toDTO(place);
        } catch (Exception e) {
            System.err.println("Database error in getPlace: " + e.getMessage());
            return null;
        }
    }

    @Override
    public List<PlaceDTO> getPlacesByGuide(int guideId) {
        try {
            return placeDAO.getPlacesByGuide(guideId);
        } catch (Exception e) {
            System.err.println("Database error in getPlacesByGuide: " + e.getMessage());
            return new ArrayList<>();
        }
    }

    @Override
    public List<PlaceDTO> getPlacesOutStanding() {
        try {
            return placeDAO.getPlacesOutstanding();
        } catch (Exception e) {
            System.err.println("Database error in getPlacesByGuide: " + e.getMessage());
            return new ArrayList<>();
        }
    }

    public static PlaceDTO toDTO(Place place) {
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

        dto.setPlaceInformation(place.getInformation().getContent());

        return dto;
    }
}