//package org.example.provider.services;
//
//import org.example.provider.entity.*;
//import java.util.List;
//import javax.jws.WebMethod;
//import javax.jws.WebParam;
//import javax.jws.WebService;
//
//@WebService
//public interface TravellerService {
//
//    @WebMethod
//    User login(@WebParam(name = "username") String username,
//               @WebParam(name = "password") String password);
//
//    @WebMethod
//    boolean register(@WebParam(name = "username") String username,
//                     @WebParam(name = "email") String email,
//                     @WebParam(name = "password") String password,
//                     @WebParam(name = "fullName") String fullName,
//                     @WebParam(name = "userType") String userType);
//
//    @WebMethod
//    List<Place> searchPlaces(@WebParam(name = "keyword") String keyword);
//
//    @WebMethod
//    List<Place> getAllPlaces();
//
//    @WebMethod
//    Place getPlaceById(@WebParam(name = "placeId") int placeId);
//
//    @WebMethod
//    List<PlaceImage> getPlaceImages(@WebParam(name = "placeId") int placeId);
//
//    @WebMethod
//    List<PlaceInformation> getPlaceInformation(@WebParam(name = "placeId") int placeId);
//
//    @WebMethod
//    boolean addRating(@WebParam(name = "userId") int userId,
//                      @WebParam(name = "targetId") int targetId,
//                      @WebParam(name = "rating") int rating);
//
////    @WebMethod
////    boolean addComment(@WebParam(name = "userId") int userId,
////                       @WebParam(name = "targetId") int targetId,
////                       @WebParam(name = "commentText") String commentText);
//
//    @WebMethod
//    List<Rating> getRatingsByTarget(@WebParam(name = "targetId") int targetId);
//
//    @WebMethod
//    List<Comment> getCommentsByTarget(@WebParam(name = "targetId") int targetId);
//
//    @WebMethod
//    double getAverageRating(@WebParam(name = "targetId") int targetId);
//}
