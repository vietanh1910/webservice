package org.example.consumer.controller;

import org.example.client.generated.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;

@WebServlet("/guide/add-place")
@MultipartConfig(maxFileSize = 16177215) // 15MB
public class AddPlaceServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        UserDTO user = (UserDTO) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("/login.jsp");
            return;
        }

        request.getRequestDispatcher("/WEB-INF/views/guide/add-place.jsp").forward(request, response);
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
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            String location = request.getParameter("location");

            // Xử lý upload hình ảnh
            Part imagePart = request.getPart("image");
            String imageData = null;

            if (imagePart != null && imagePart.getSize() > 0) {
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

            // Tạo Place object
            Place place = new Place();
            place.setPlaceName(name);
            place.setDescription(description);
            place.setAddress(location);


            // Gọi web service để thêm địa điểm
            PlaceServiceImplService service = new PlaceServiceImplService();
            PlaceService placeService = service.getPlaceServiceImplPort();

            ImageServiceImplService imageService = new ImageServiceImplService();
            ImageService imageServicePort = imageService.getImageServiceImplPort();

            // Nếu có ảnh, tạo thêm PlaceImage để gửi kèm
            PlaceImage placeImage = null;
            if (imageData != null) {
                placeImage = new PlaceImage();
                placeImage.setImageUrl(imageData);
            }

            // Gọi hàm addPlace mới có thêm ảnh
            int placeId = placeService.addPlace(place, user.getUserId());
            if(placeId <= 0) {
                request.setAttribute("error", "Không thể thêm địa điểm.");
                request.getRequestDispatcher("/WEB-INF/views/guide/add-place.jsp").forward(request, response);
                return;
            }
            boolean successImage = imageServicePort.addImage(placeId, placeImage, user.getUserId());

            if (successImage) {
                response.sendRedirect("home?success=Place added successfully");
            } else {
                request.setAttribute("error", "Không thể thêm địa điểm.");
                request.getRequestDispatcher("/WEB-INF/views/guide/add-place.jsp").forward(request, response);
            }

        } catch (Exception e) {
            request.setAttribute("error", "Lỗi khi thêm địa điểm: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/guide/add-place.jsp").forward(request, response);
        }
    }

}
