package org.example.consumer.controller;

import org.example.client.generated.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@WebServlet("/submit-rating")
public class SubmitRatingServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        UserDTO user = (UserDTO) session.getAttribute("user");

        if (user == null || user.getRole() != 2) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Not allowed");
            return;
        }

        try {
            int placeId = Integer.parseInt(request.getParameter("placeId"));
            int ratingValue = Integer.parseInt(request.getParameter("rating"));
            String commentText = request.getParameter("comment");

            // Gọi Web Service
            RatingServiceImplService ratingService = new RatingServiceImplService();
            RatingService ratingPort = ratingService.getRatingServiceImplPort();

            // 1. Tạo Rating
            Rating rating = new Rating();
            rating.setTargetId(placeId);
            rating.setUserId(user.getUserId());
            rating.setRating(ratingValue);

            boolean ratingSuccess = ratingPort.addRating(placeId, rating, user.getUserId());

            CommentServiceImplService commentService = new CommentServiceImplService();
            CommentService commentPort = commentService.getCommentServiceImplPort();

            // 2. Tạo Comment nếu có nội dung
            boolean commentSuccess = true;
            if (commentText != null && !commentText.trim().isEmpty()) {
                Comment comment = new Comment();
                comment.setUserId(user.getUserId());
                comment.setTargetId(placeId);
                comment.setCommentText(commentText);

                commentSuccess = commentPort.addComment(placeId, comment, user.getUserId());
            }

            if (ratingSuccess && commentSuccess) {
                response.setStatus(HttpServletResponse.SC_OK);
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to save rating/comment");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid input");
        }
    }

}
