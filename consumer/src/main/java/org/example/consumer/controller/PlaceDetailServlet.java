package org.example.consumer.controller;

import org.example.client.generated.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;;

@WebServlet("/place-detail")
public class PlaceDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        UserDTO user = (UserDTO) session.getAttribute("user");
        String placeIdStr = request.getParameter("id");

        if (placeIdStr == null || placeIdStr.trim().isEmpty()) {
            response.sendRedirect("/home.jsp");
            return;
        }

        if (user == null) {
            response.sendRedirect("/login.jsp");
            return;
        }

        try {
            Integer placeId = Integer.parseInt(placeIdStr);

            // Gọi web service để lấy thông tin chi tiết
            PlaceServiceImplService service = new PlaceServiceImplService();
            PlaceService placeService = service.getPlaceServiceImplPort();

            PlaceDTO place = placeService.getPlace(placeId);

            if (place == null) {
                request.setAttribute("error", "Error when finding place");
                request.getRequestDispatcher("/search.jsp").forward(request, response);
                return;
            }

            // Lấy rating và comments
            RatingServiceImplService ratingService = new RatingServiceImplService();
            RatingService rating = ratingService.getRatingServiceImplPort();

            List<Rating> ratings = rating.getRatingsByPlace(placeId);

            CommentServiceImplService commentService = new CommentServiceImplService();
            CommentService comment = commentService.getCommentServiceImplPort();

            List<Comment> comments = comment.getCommentsByPlace(placeId);

            request.setAttribute("place", place);
            request.setAttribute("images", place.getImageUrls());
            request.setAttribute("infos", place.getPlaceInformation());
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