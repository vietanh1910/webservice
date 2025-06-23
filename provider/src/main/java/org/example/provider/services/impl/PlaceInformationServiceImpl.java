package org.example.provider.services.impl;

import org.example.provider.dao.PlaceDAO;
import org.example.provider.dao.PlaceInformationDAO;
import org.example.provider.dao.UserDAO;
import org.example.provider.entity.Place;
import org.example.provider.entity.PlaceInformation;
import org.example.provider.entity.User;
import org.example.provider.services.PlaceInformationService;

import javax.jws.WebService;
import java.time.LocalDateTime;

@WebService(endpointInterface = "org.example.provider.services.PlaceInformationService")
public class PlaceInformationServiceImpl implements PlaceInformationService {
    private PlaceInformationDAO placeInformationDAO = new PlaceInformationDAO();
    private UserDAO userDAO = new UserDAO();
    private PlaceDAO placeDAO = new PlaceDAO();
    @Override
    public boolean addInformation(int placeId, PlaceInformation placeInformation, int userId) {
        try {
            // Verify user is a guide
            Place place = placeDAO.findById(placeId);
            if (place == null) {
                return false;
            }

            if (place.getGuideId() != userId) {
                return false;
            }

            placeInformation.setPlace(place);
            placeInformation.setTitle(place.getPlaceName());
            placeInformation.setCreatedBy(userId);
            placeInformation.setCreatedAt(LocalDateTime.now());

            return placeInformationDAO.addInformation(placeInformation);
        } catch (Exception e) {
            System.err.println("Database error in addPlace: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
}