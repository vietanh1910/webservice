package org.example.consumer.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;

@WebServlet("/guide/manage-images")
@MultipartConfig(maxFileSize = 16177215)
public class ManageImagesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String token = (String) session.getAttribute("token");

        if (token == null) {
            response.sendRedirect("/login.jsp");
            return;
        }

        String placeId = request.getParameter("placeId");

        try {
            ImageServiceImplService service = new ImageServiceImplService();
            ImageService imageService = service.getImageServiceImplPort();

            List<PlaceImage> images = imageService.getImagesByPlace(Long.parseLong(placeId), token);

            request.setAttribute("images", images);
            request.setAttribute("placeId", placeId);
            request.getRequestDispatcher("/WEB-INF/views/guide/manage-images.jsp").forward(request, response);

        } catch (Exception e) {
            response.sendRedirect("home?error=Error loading images");
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

        String action = request.getParameter("action");
        String placeId = request.getParameter("placeId");

        try {
            ImageServiceImplService service = new ImageServiceImplService();
            ImageService imageService = service.getImageServiceImplPort();

            if ("add".equals(action)) {
                // Thêm hình ảnh mới
                Part imagePart = request.getPart("image");
                String imageData = null;
                String description = request.getParameter("description");

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

                    boolean success = imageService.addImage(token, Long.parseLong(placeId),
                            imageData, description);

                    if (success) {
                        response.sendRedirect("manage-images?placeId=" + placeId + "&success=Image added");
                    } else {
                        response.sendRedirect("manage-images?placeId=" + placeId + "&error=Cannot add image");
                    }
                }

            } else if ("delete".equals(action)) {
                // Xóa hình ảnh
                String imageId = request.getParameter("imageId");

                boolean success = imageService.deleteImage(token, Long.parseLong(imageId));

                if (success) {
                    response.sendRedirect("manage-images?placeId=" + placeId + "&success=Image deleted");
                } else {
                    response.sendRedirect("manage-images?placeId=" + placeId + "&error=Cannot delete image");
                }
            }

        } catch (Exception e) {
            response.sendRedirect("manage-images?placeId=" + placeId + "&error=Error processing request");
        }
    }
}
