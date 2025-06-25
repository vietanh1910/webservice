package org.example.consumer.controller;

import org.example.client.generated.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/guide/home")
public class GuideHomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        UserDTO user = (UserDTO) session.getAttribute("user");

        try {
            // Gọi web service để lấy danh sách địa điểm của guide
            PlaceServiceImplService service = new PlaceServiceImplService();
            PlaceService placeService = service.getPlaceServiceImplPort();

            List<PlaceDTO> places = placeService.getPlacesByGuide(user.getUserId());

            request.setAttribute("places", places);
            request.getRequestDispatcher("/WEB-INF/views/guide/home.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("error", "Cant load place list");
            request.getRequestDispatcher("/WEB-INF/views/guide/home.jsp").forward(request, response);
        }
    }
}
