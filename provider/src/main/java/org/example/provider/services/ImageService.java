package org.example.provider.services;

import org.example.provider.entity.PlaceImage;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;
import java.util.List;

@WebService
public interface ImageService {

    @WebMethod
    boolean addImage(@WebParam(name = "placeId") int placeId,
                     @WebParam(name = "image") PlaceImage image,
                     @WebParam(name = "userId") int userId);

    @WebMethod
    List<PlaceImage> getImagesByPlace(@WebParam(name = "placeId") int placeId);

    @WebMethod
    boolean deleteImage(@WebParam(name = "imageId") int imageId,
                        @WebParam(name = "userId") int userId);
}

