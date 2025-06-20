package org.example.consumer.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;;

@WebServlet("/place-detail")
public class PlaceDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String placeIdStr = request.getParameter("id");

        if (placeIdStr == null || placeIdStr.trim().isEmpty()) {
            response.sendRedirect("search");
            return;
        }

        try {
            Long placeId = Long.parseLong(placeIdStr);

            // Gọi web service để lấy thông tin chi tiết
            PlaceServiceImplService service = new PlaceServiceImplService();
            PlaceService placeService = service.getPlaceServiceImplPort();

            Place place = placeService.getPlaceById(placeId);
            List<PlaceImage> images = placeService.getPlaceImages(placeId);
            List<PlaceInfo> infos = placeService.getPlaceInfos(placeId);

            if (place == null) {
                request.setAttribute("error", "Error when finding place");
                request.getRequestDispatcher("/search.jsp").forward(request, response);
                return;
            }

            // Lấy rating và comments
            RatingServiceImplService ratingService = new RatingServiceImplService();
            RatingService rating = ratingService.getRatingServiceImplPort();

            List<Rating> ratings = rating.getRatingsByPlace(placeId);
            List<Comment> comments = rating.getCommentsByPlace(placeId);

            request.setAttribute("place", place);
            request.setAttribute("images", images);
            request.setAttribute("infos", infos);
            request.setAttribute("ratings", ratings);
            request.setAttribute("comments", comments);

            request.getRequestDispatcher("/place-detail.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendRedirect("search");
        } catch (Exception e) {
            request.setAttribute("error", "Error when loading information: " + e.getMessage());
            request.getRequestDispatcher("/search.jsp").forward(request, response);
        }
    }
}
