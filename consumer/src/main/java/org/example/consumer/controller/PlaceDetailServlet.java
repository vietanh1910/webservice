package org.example.consumer.controller;

import org.example.client.generated.*;
import org.example.consumer.dto.ReviewDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Timestamp;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
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

        try {
            Integer placeId = Integer.parseInt(placeIdStr);

            // 1. Lấy PlaceDTO từ web service
            PlaceServiceImplService service = new PlaceServiceImplService();
            PlaceService placeService = service.getPlaceServiceImplPort();
            PlaceDTO place = placeService.getPlace(placeId);

            if (place == null) {
                request.setAttribute("error", "Error when finding place");
                request.getRequestDispatcher("/search.jsp").forward(request, response);
                return;
            }

            // 2. Lấy Ratings & Comments
            RatingServiceImplService ratingService = new RatingServiceImplService();
            RatingService ratingPort = ratingService.getRatingServiceImplPort();
            List<Rating> ratings = ratingPort.getRatingsByPlace(placeId);

            CommentServiceImplService commentService = new CommentServiceImplService();
            CommentService commentPort = commentService.getCommentServiceImplPort();
            List<Comment> comments = commentPort.getCommentsByPlace(placeId);

            // 3. Ghép ReviewDTO
            List<ReviewDTO> reviews = new ArrayList<>();
            for (Comment comment : comments) {
                ReviewDTO review = new ReviewDTO();
                review.setContent(comment.getCommentText());
//                LocalDateTime localDateTime = comment.getCreatedAt();
//                ZoneId zoneId = ZoneId.systemDefault(); // Hoặc ZoneId.of("Asia/Ho_Chi_Minh")
//                Date date = Date.from(localDateTime.atZone(zoneId).toInstant());
//
//                review.setDate(date);

                // Nếu có thông tin user từ session
                if (user != null && user.getUserId() == comment.getUserId()) {
                    review.setUserName(user.getFullName());
                } else {
                    // TODO: Nếu cần lấy user từ service/webservice thì gọi thêm tại đây
                    review.setUserName("Anonymous"); // hoặc placeholder
                    review.setUserAvatar(null);
                }

                // Ghép rating
                for (Rating r : ratings) {
                    if (r.getUserId() == comment.getUserId() && r.getTargetId() == placeId) {
                        review.setRating(r.getRating());
                        break;
                    }
                }

                reviews.add(review);
            }

            // 4. Set attributes cho JSP
            request.setAttribute("place", place);
            request.setAttribute("images", place.getImageUrls());
            request.setAttribute("infos", place.getPlaceInformation());
            request.setAttribute("ratings", ratings);
            request.setAttribute("comments", comments);
            request.setAttribute("reviews", reviews); // Review tổng hợp dùng cho giao diện

            // 5. Forward đến JSP
            request.getRequestDispatcher("/place-detail.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendRedirect("search");
        } catch (Exception e) {
            request.setAttribute("error", "Error when loading information: " + e.getMessage());
            request.getRequestDispatcher("/search.jsp").forward(request, response);
        }
    }
}
