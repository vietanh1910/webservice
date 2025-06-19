package org.example.consumer.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;

@WebServlet("/guide/edit-place")
@MultipartConfig(maxFileSize = 16177215)
public class EditPlaceServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String token = (String) session.getAttribute("token");

        if (token == null) {
            response.sendRedirect("/login.jsp");
            return;
        }

        String placeId = request.getParameter("id");

        try {
            PlaceServiceImplService service = new PlaceServiceImplService();
            PlaceService placeService = service.getPlaceServiceImplPort();

            Place place = placeService.getPlaceById(Long.parseLong(placeId), token);

            if (place != null) {
                request.setAttribute("place", place);
                request.getRequestDispatcher("/WEB-INF/views/guide/edit-place.jsp").forward(request, response);
            } else {
                response.sendRedirect("home?error=Place not found");
            }

        } catch (Exception e) {
            response.sendRedirect("home?error=Error loading place");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String token = (String) session.getAttribute("token");

        if (token == null) {
            response.sendRedirect("/login.jsp");
            return;
        }

        try {
            String placeId = request.getParameter("placeId");
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            String location = request.getParameter("location");
            String category = request.getParameter("category");

            // Xử lý upload hình ảnh mới (nếu có)
            Part imagePart = request.getPart("image");
            String imageData = null;

            if (imagePart != null && imagePart.getSize() > 0) {
                // Convert image to base64
                InputStream imageStream = imagePart.getInputStream();

                ByteArrayOutputStream buffer = new ByteArrayOutputStream();
                int nRead;
                byte[] data = new byte[1024];
                while ((nRead = imageStream.read(data, 0, data.length)) != -1) {
                    buffer.write(data, 0, nRead);
                }
                byte[] imageBytes = buffer.toByteArray();

                imageData = Base64.getEncoder().encodeToString(imageBytes);
                imageStream.close();
            }

            PlaceServiceImplService service = new PlaceServiceImplService();
            PlaceService placeService = service.getPlaceServiceImplPort();

            boolean success = placeService.updatePlace(token, Long.parseLong(placeId),
                    name, description, location, category, imageData);

            if (success) {
                response.sendRedirect("home?success=Place updated successfully");
            } else {
                request.setAttribute("error", "Cant update place");
                request.setAttribute("placeId", placeId);
                doGet(request, response);
            }

        } catch (Exception e) {
            request.setAttribute("error", "Error when update place: " + e.getMessage());
            doGet(request, response);
        }
    }
}
