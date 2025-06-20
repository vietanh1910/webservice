package org.example.provider.services;

import org.example.provider.dto.PlaceDTO;
import org.example.provider.entity.Place;
import org.example.provider.entity.PlaceImage;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;
import java.util.List;

@WebService
public interface PlaceService {

    @WebMethod
    List<Place> searchPlaces(@WebParam(name = "keyword") String keyword);

    @WebMethod
    int addPlace(@WebParam(name = "place") Place place,
                     @WebParam(name = "userId") int userId);

    @WebMethod
    boolean updatePlace(@WebParam(name = "placeId") int placeId,
                        @WebParam(name = "place") Place place,
                        @WebParam(name = "userId") int userId);

    @WebMethod
    boolean deletePlace(@WebParam(name = "placeId") int placeId,
                        @WebParam(name = "userId") int userId);

    @WebMethod
    Place getPlace(@WebParam(name = "placeId") int placeId);

    @WebMethod
    List<PlaceDTO> getPlacesByGuide(@WebParam(name = "guideId") int guideId);
}
