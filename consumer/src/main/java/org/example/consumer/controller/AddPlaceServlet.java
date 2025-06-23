package org.example.consumer.controller;

import org.example.client.generated.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
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
            // Lấy thông tin từ form
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            String location = request.getParameter("location");

            // Xử lý ảnh upload
            Part imagePart = request.getPart("image");
            String imageUrl = null;

            if (imagePart != null && imagePart.getSize() > 0) {
                // Tạo thư mục uploads nếu chưa có
                String uploadPath = getServletContext().getRealPath("") + "uploads";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) uploadDir.mkdir();

                // Tạo tên file duy nhất
                String originalFileName = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();
                String fileExt = originalFileName.substring(originalFileName.lastIndexOf("."));
                String fileName = "place_" + System.currentTimeMillis() + fileExt;

                // Ghi file vào thư mục uploads
                String fullPath = uploadPath + File.separator + fileName;
                imagePart.write(fullPath);

                // Đường dẫn tương đối để lưu DB và hiển thị
                imageUrl = "uploads/" + fileName;
            }

            // Tạo đối tượng Place
            Place place = new Place();
            place.setPlaceName(name);
            place.setDescription(description);
            place.setAddress(location);

            // Gọi web service để lưu place
            PlaceServiceImplService service = new PlaceServiceImplService();
            PlaceService placeService = service.getPlaceServiceImplPort();

            ImageServiceImplService imageService = new ImageServiceImplService();
            ImageService imageServicePort = imageService.getImageServiceImplPort();

            int placeId = placeService.addPlace(place, user.getUserId());
            if (placeId <= 0) {
                request.setAttribute("error", "Không thể thêm địa điểm.");
                request.getRequestDispatcher("/WEB-INF/views/guide/add-place.jsp").forward(request, response);
                return;
            }

            // Nếu có ảnh thì thêm ảnh
            boolean successImage = true;
            if (imageUrl != null) {
                PlaceImage placeImage = new PlaceImage();
                placeImage.setImageUrl(imageUrl);
                placeImage.setUploadedBy(user.getUserId());
                successImage = imageServicePort.addImage(placeId, placeImage, user.getUserId());
            }

            // Điều hướng theo kết quả
            if (successImage) {
                response.sendRedirect("home?success=Place added successfully");
            } else {
                request.setAttribute("error", "Thêm địa điểm thành công nhưng lỗi khi lưu ảnh.");
                request.getRequestDispatcher("/WEB-INF/views/guide/add-place.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi khi thêm địa điểm: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/guide/add-place.jsp").forward(request, response);
        }
    }
}
