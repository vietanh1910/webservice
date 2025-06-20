package org.example.provider.services;

import org.example.provider.entity.Rating;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;
import java.util.List;

@WebService
public interface RatingService {

    @WebMethod
    boolean addRating(@WebParam(name = "targetId") int targetId,
                      @WebParam(name = "rating") Rating rating,
                      @WebParam(name = "userId") int userId);

    @WebMethod
    List<Rating> getRatingsByPlace(@WebParam(name = "placeId") int placeId);
}