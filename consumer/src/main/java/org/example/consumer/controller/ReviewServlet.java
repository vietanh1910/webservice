package org.example.consumer.controller;

import org.example.client.generated.*;
import org.example.consumer.dto.ReviewDTO;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/place-reviews")
public class ReviewServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        UserDTO user = (UserDTO) session.getAttribute("user");
        RatingServiceImplService ratingService = new RatingServiceImplService();
        RatingService ratingPort = ratingService.getRatingServiceImplPort();
        CommentServiceImplService commentService = new CommentServiceImplService();
        CommentService commentPort = commentService.getCommentServiceImplPort();

        if (user == null || user.getRole() != 2) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Not allowed");
            return;
        }
        String placeIdParam = request.getParameter("placeId");

        if (placeIdParam == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing place ID");
            return;
        }

        int placeId = Integer.parseInt(placeIdParam);

        List<ReviewDTO> reviews = new ArrayList<>();

        // Lấy comment và rating theo địa điểm
        List<Comment> comments = commentPort.getCommentsByPlace(placeId);
        List<Rating> ratings = ratingPort.getRatingsByPlace(placeId);

        // Ghép comment và rating theo userId
        for (Comment comment : comments) {
            ReviewDTO review = new ReviewDTO();
            review.setContent(comment.getCommentText());
            review.setDate(java.sql.Timestamp.valueOf(comment.getCreatedAt().toString()));

            int userId = comment.getUserId();
            review.setUserName(user.getFullName()); // hoặc userName

            // Tìm rating tương ứng
            for (Rating r : ratings) {
                if (r.getUserId() == userId && r.getTargetId() == placeId) {
                    review.setRating(r.getRating());
                    break;
                }
            }

            reviews.add(review);
        }

        // Truyền sang view
        request.setAttribute("reviews", reviews);
        request.getRequestDispatcher("/place-detail.jsp").forward(request, response);
    }
}

