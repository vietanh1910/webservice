package org.example.consumer.controller;

import org.example.client.generated.PlaceService;
import org.example.client.generated.PlaceServiceImplService;
import org.example.client.generated.User;
import org.example.client.generated.UserDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/guide/delete-place")
public class DeletePlaceServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        UserDTO user = (UserDTO) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("/login.jsp");
            return;
        }

        String exPlaceId = request.getParameter("placeId");
        Integer placeId = null;
        if(exPlaceId != null) {
            try {
                placeId = Integer.parseInt(exPlaceId);
            } catch (NumberFormatException e) {
                response.sendRedirect("home?error=Invalid place ID");
                return;
            }
        }

        try {
            PlaceServiceImplService service = new PlaceServiceImplService();
            PlaceService placeService = service.getPlaceServiceImplPort();

            boolean success = placeService.deletePlace(placeId, user.getUserId());

            if (success) {
                response.sendRedirect("home?success=Place deleted successfully");
            } else {
                response.sendRedirect("home?error=Cannot delete place");
            }

        } catch (Exception e) {
            response.sendRedirect("home?error=Error deleting place");
        }
    }
}
