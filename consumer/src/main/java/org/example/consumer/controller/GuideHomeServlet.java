package org.example.consumer.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/guide/home")
public class GuideHomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String token = (String) session.getAttribute("token");

        if (token == null) {
            response.sendRedirect("/login.jsp");
            return;
        }

        try {
            // Gọi web service để lấy danh sách địa điểm của guide
            PlaceServiceImplService service = new PlaceServiceImplService();
            PlaceService placeService = service.getPlaceServiceImplPort();

            List<Place> places = placeService.getPlacesByGuide(token);

            request.setAttribute("places", places);
            request.getRequestDispatcher("/WEB-INF/views/guide/home.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("error", "Cant load place list");
            request.getRequestDispatcher("/WEB-INF/views/guide/home.jsp").forward(request, response);
        }
    }
}
