package org.example.consumer.controller;

import org.example.client.generated.Place;
import org.example.client.generated.PlaceDTO;
import org.example.client.generated.PlaceService;
import org.example.client.generated.PlaceServiceImplService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;;

@WebServlet("/search")
public class SearchPlaceServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String keyword = request.getParameter("keyword");
        if( keyword == null) {
            keyword = "";
        }

        if (keyword == null || keyword.trim().isEmpty()) {
            // Hiển thị form search
            request.getRequestDispatcher("/search.jsp").forward(request, response);
            return;
        }

        try {
            // Gọi web service để tìm kiếm
            PlaceServiceImplService service = new PlaceServiceImplService();
            PlaceService placeService = service.getPlaceServiceImplPort();

            List<PlaceDTO> places = placeService.searchPlaces(keyword);

            request.setAttribute("places", places);
            request.setAttribute("keyword", keyword);

            request.getRequestDispatcher("/search-results.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("error", "Search error: " + e.getMessage());
            request.getRequestDispatcher("/search.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}