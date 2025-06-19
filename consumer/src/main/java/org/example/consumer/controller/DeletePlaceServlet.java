package org.example.consumer.controller;

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
        String token = (String) session.getAttribute("token");

        if (token == null) {
            response.sendRedirect("/login.jsp");
            return;
        }

        String placeId = request.getParameter("placeId");

        try {
            PlaceServiceImplService service = new PlaceServiceImplService();
            PlaceService placeService = service.getPlaceServiceImplPort();

            boolean success = placeService.deletePlace(token, Long.parseLong(placeId));

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
