package org.example.provider.services.impl;

import org.example.provider.dao.*;
import org.example.provider.entity.*;
import org.example.provider.services.TravellerService;
import java.util.List;
import javax.jws.WebService;

@WebService(endpointInterface = "com.travelservice.webservice.TravellerService")
public class TravellerServiceImpl implements TravellerService {

    private UserDAO userDAO = new UserDAO();
    private PlaceDAO placeDAO = new PlaceDAO();
    private RatingDAO ratingDAO = new RatingDAO();
    private CommentDAO commentDAO = new CommentDAO();

    @Override
    public User login(String username, String password) {
        try {
            return userDAO.findByUsernameAndPassword(username, password);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public boolean register(String username, String email, String password, String fullName, String userType) {
        try {
            User user = new User();
            user.setUsername(username);
            user.setEmail(email);
            user.setPassword(password);
            user.setFullName(fullName);
            user.setUserType(User.UserType.valueOf(userType.toUpperCase()));

            return userDAO.insert(user);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public List<Place> searchPlaces(String keyword) {
        try {
            return placeDAO.searchPlaces(keyword);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<Place> getAllPlaces() {
        try {
            return placeDAO.getAllPlaces();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Place getPlaceById(int placeId) {
        try {
            return placeDAO.findById(placeId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<PlaceImage> getPlaceImages(int placeId) {
        try {
            return placeDAO.getPlaceImages(placeId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<PlaceInformation> getPlaceInformation(int placeId) {
        try {
            return placeDAO.getPlaceInformation(placeId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public boolean addRating(int userId, int targetId, int rating) {
        try {
            if (rating < 1 || rating > 5) {
                return false;
            }

            Rating ratingObj = new Rating(userId, targetId, rating);
            return ratingDAO.insertRating(ratingObj);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean addComment(int userId, int targetId, String commentText) {
        try {
            Comment comment = new Comment(userId, targetId, commentText);
            return commentDAO.insertComment(comment);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public List<Rating> getRatingsByTarget(int targetId) {
        try {
            return ratingDAO.getRatingsByTarget(targetId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<Comment> getCommentsByTarget(int targetId) {
        try {
            return commentDAO.getCommentsByTarget(targetId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public double getAverageRating(int targetId) {
        try {
            return ratingDAO.getAverageRating(targetId);
        } catch (Exception e) {
            e.printStackTrace();
            return 0.0;
        }
    }
}
