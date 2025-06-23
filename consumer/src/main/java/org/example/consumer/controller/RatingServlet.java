//package org.example.consumer.controller;
//
//import org.example.client.generated.RatingService;
//import org.example.client.generated.RatingServiceImplService;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.*;
//import java.io.IOException;;
//
//@WebServlet("/rating")
//public class RatingServlet extends HttpServlet {
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        HttpSession session = request.getSession();
//        String token = (String) session.getAttribute("token");
//
//        if (token == null) {
//            response.sendRedirect("/login.jsp");
//            return;
//        }
//
//        String placeIdStr = request.getParameter("placeId");
//        String imageIdStr = request.getParameter("imageId");
//        String infoIdStr = request.getParameter("infoId");
//        String ratingStr = request.getParameter("rating");
//        String comment = request.getParameter("comment");
//
//        try {
//            RatingServiceImplService service = new RatingServiceImplService();
//            RatingService ratingService = service.getRatingServiceImplPort();
//
//            Integer placeId = Integer.parseInt(placeIdStr);
//            int ratingValue = Integer.parseInt(ratingStr);
//
//            String result;
//
//            if (imageIdStr != null && !imageIdStr.trim().isEmpty()) {
//                // Rating cho image
//                Integer imageId = Integer.parseInt(imageIdStr);
//                result = ratingService.addRating(placeId, imageId, ratingValue);
//            } else if (infoIdStr != null && !infoIdStr.trim().isEmpty()) {
//                // Rating cho info
//                Long infoId = Long.parseLong(infoIdStr);
//                result = ratingService.rateInfo(token, infoId, ratingValue);
//            } else {
//                // Rating cho place
//                result = ratingService.ratePlace(token, placeId, ratingValue);
//            }
//
//            // Thêm comment nếu có
//            if (comment != null && !comment.trim().isEmpty()) {
//                String commentResult = ratingService.addComment(token, placeId, comment);
//                if (!"SUCCESS".equals(commentResult)) {
//                    request.setAttribute("error", "Add Comment Error: " + commentResult);
//                }
//            }
//
//            if ("SUCCESS".equals(result)) {
//                request.setAttribute("success", "Rating Successfully!");
//            } else {
//                request.setAttribute("error", "Rating Error: " + result);
//            }
//
//            // Redirect về place detail
//            response.sendRedirect("place-detail?id=" + placeId);
//
//        } catch (Exception e) {
//            request.setAttribute("error", "System error: " + e.getMessage());
//            response.sendRedirect("place-detail?id=" + request.getParameter("placeId"));
//        }
//    }
//}