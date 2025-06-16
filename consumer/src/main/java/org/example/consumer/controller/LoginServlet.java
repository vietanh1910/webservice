package org.example.consumer.controller;

import com.mycompany.client.generated.AuthService;
import com.mycompany.client.generated.AuthServiceImplService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        AuthServiceImplService service = new AuthServiceImplService();
        AuthService auth = service.getAuthServiceImplPort();

        String token = auth.login(username, password);

        if ("INVALID_CREDENTIALS".equals(token)) {
            request.setAttribute("error", "Sai tên đăng nhập hoặc mật khẩu");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        } else {
            // Lưu token vào session để dùng sau
            HttpSession session = request.getSession();
            session.setAttribute("token", token);

            // Chuyển đến trang chính
            response.sendRedirect("home.jsp");
        }
    }

    // GET để hiển thị form lần đầu
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }
}
