package org.example.consumer.controller;

import com.mycompany.client.generated.AuthService;
import com.mycompany.client.generated.AuthServiceImplService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        AuthServiceImplService service = new AuthServiceImplService();
        AuthService auth = service.getAuthServiceImplPort();

        String result = auth.register(username, password);

        if ("USERNAME_EXISTS".equals(result)) {
            request.setAttribute("error", "Tên người dùng đã tồn tại");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        } else {
            // Chuyển về trang login kèm thông báo
            request.setAttribute("message", "Đăng ký thành công! Vui lòng đăng nhập.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/register.jsp").forward(request, response);
    }
}

