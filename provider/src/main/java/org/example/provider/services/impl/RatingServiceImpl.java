package org.example.provider.services.impl;

import org.example.provider.dao.RatingDAO;
import org.example.provider.entity.Rating;
import org.example.provider.services.RatingService;

import javax.jws.WebService;
import java.util.ArrayList;
import java.util.List;

@WebService(endpointInterface = "org.example.provider.services.RatingService")
public class RatingServiceImpl implements RatingService {

    private RatingDAO ratingDAO = new RatingDAO();

    @Override
    public boolean addRating(int targetId, Rating rating, int userId) {
        try {
            // Validate rating value
            if (rating.getRating() < 1 || rating.getRating() > 5) {
                return false;
            }

            rating.setUserId(userId);
            rating.setTargetId(targetId);

            return ratingDAO.addRating(rating);
        } catch (Exception e) {
            System.err.println("Database error in addRating: " + e.getMessage());
            return false;
        }
    }

    @Override
    public List<Rating> getRatingsByPlace(int placeId) {
        try {
            return ratingDAO.getRatingsByTarget(placeId);
        } catch (Exception e) {
            System.err.println("Database error in getRatingsByPlace: " + e.getMessage());
            return new ArrayList<>();
        }
    }
}
