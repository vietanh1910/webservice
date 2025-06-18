package org.example.provider.services.impl;

import org.example.provider.dao.PlaceDAO;
import org.example.provider.dao.PlaceImageDAO;
import org.example.provider.entity.Place;
import org.example.provider.entity.PlaceImage;
import org.example.provider.services.ImageService;

import javax.jws.WebService;
import java.util.ArrayList;
import java.util.List;

@WebService(endpointInterface = "org.example.provider.services.ImageService")
public class ImageServiceImpl implements ImageService {

    private PlaceImageDAO imageDAO = new PlaceImageDAO();
    private PlaceDAO placeDAO = new PlaceDAO();

    @Override
    public boolean addImage(int placeId, PlaceImage image, int userId) {
        try {
            // Verify place exists and user is the owner guide
            Place place = placeDAO.findById(placeId);
            if (place == null) {
                return false;
            }

            if (place.getGuideId() != userId) {
                return false;
            }

            image.setPlaceId(placeId);
            image.setUploadedBy(userId);

            return imageDAO.addImage(image);
        } catch (Exception e) {
            System.err.println("Database error in addImage: " + e.getMessage());
            return false;
        }
    }

    @Override
    public List<PlaceImage> getImagesByPlace(int placeId) {
        try {
            return imageDAO.getImagesByPlace(placeId);
        } catch (Exception e) {
            System.err.println("Database error in getImagesByPlace: " + e.getMessage());
            return new ArrayList<>();
        }
    }

    @Override
    public boolean deleteImage(int imageId, int userId) {
        try {
            // In a real application, you would check if the user owns the image
            return imageDAO.deleteImage(imageId);
        } catch (Exception e) {
            System.err.println("Database error in deleteImage: " + e.getMessage());
            return false;
        }
    }
}
