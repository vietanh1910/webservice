package org.example.consumer.controller;

import org.example.client.generated.PlaceDTO;
import org.example.client.generated.PlaceService;
import org.example.client.generated.PlaceServiceImplService;
import org.example.client.generated.UserDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/home")
public class TravellerHomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        UserDTO user = (UserDTO) session.getAttribute("user");


        try {
            PlaceServiceImplService service = new PlaceServiceImplService();
            PlaceService placeService = service.getPlaceServiceImplPort();

            List<PlaceDTO> places = placeService.getPlacesOutStanding();

            request.setAttribute("places", places);
            request.getRequestDispatcher("/home.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("error", "Cant load place list");
            request.getRequestDispatcher("/home.jsp").forward(request, response);
        }
    }
}

