package org.example.provider.services;

import org.example.provider.entity.Place;
import org.example.provider.entity.PlaceInformation;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;

@WebService
public interface PlaceInformationService {

    @WebMethod
    boolean addInformation(
            @WebParam(name = "placeId") int placeId,
            @WebParam(name = "place") PlaceInformation place,
            @WebParam(name = "userId") int userId
    );
}