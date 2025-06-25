package org.example.consumer.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Hủy phiên làm việc (session)
        HttpSession session = request.getSession(false); // false để tránh tạo session mới nếu chưa có
        if (session != null) {
            session.invalidate(); // Hủy session
        }

        // Chuyển hướng về trang login
        response.sendRedirect(request.getContextPath() + "/login");
    }

    // Optional: Cho phép POST logout nếu cần
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response); // Dùng chung logic
    }
}
