package org.example.consumer.controller;

import org.example.client.generated.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

@WebServlet("/guide/edit-place")
@MultipartConfig(maxFileSize = 16177215)
public class EditPlaceServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserDTO user = (UserDTO) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("/login.jsp");
            return;
        }

        String placeIdStr = request.getParameter("id");
        Integer placeId = null;
        if (placeIdStr != null) {
            placeId = Integer.parseInt(placeIdStr);
        }

        try {
            PlaceServiceImplService service = new PlaceServiceImplService();
            PlaceService placeService = service.getPlaceServiceImplPort();

            Place place = placeService.getPlace(placeId);

            if (place != null) {
                request.setAttribute("place", place);
                request.getRequestDispatcher("/WEB-INF/views/guide/edit-place.jsp").forward(request, response);
            } else {
                response.sendRedirect("home?error=Place not found");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("home?error=Error loading place");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        UserDTO user = (UserDTO) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("/login.jsp");
            return;
        }

        try {
            int placeId = Integer.parseInt(request.getParameter("placeId"));
            String name = request.getParameter("placeName");
            String description = request.getParameter("description");
            String address = request.getParameter("address");

            // Xử lý ảnh
            Part imagePart = request.getPart("image");
            String imageData = null;

            if (imagePart != null && imagePart.getSize() > 0) {
                InputStream imageStream = imagePart.getInputStream();
                ByteArrayOutputStream buffer = new ByteArrayOutputStream();
                byte[] data = new byte[1024];
                int nRead;
                while ((nRead = imageStream.read(data, 0, data.length)) != -1) {
                    buffer.write(data, 0, nRead);
                }
                byte[] imageBytes = buffer.toByteArray();
                imageData = Base64.getEncoder().encodeToString(imageBytes);
                imageStream.close();
            }

            Place place = new Place();
            place.setPlaceId(placeId);
            place.setPlaceName(name);
            place.setDescription(description);
            place.setAddress(address);
            if (imageData != null) {
                List<PlaceImage> images = new ArrayList<>();
                PlaceImage img = new PlaceImage();
                img.setImageUrl(imageData);  // hoặc field tương ứng
                images.add(img);
            }

            // Gọi web service
            PlaceServiceImplService service = new PlaceServiceImplService();
            PlaceService placeService = service.getPlaceServiceImplPort();

            boolean success = placeService.updatePlace(placeId, place, user.getUserId());

            if (success) {
                response.sendRedirect("home?success=Place updated successfully");
            } else {
                request.setAttribute("error", "Không thể cập nhật địa điểm.");
                request.setAttribute("placeId", placeId);
                doGet(request, response);
            }

        } catch (Exception e) {
            request.setAttribute("error", "Lỗi cập nhật địa điểm: " + e.getMessage());
            doGet(request, response);
        }
    }

}
