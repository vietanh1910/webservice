package org.example.consumer.controller;

import org.example.client.generated.AuthService;
import org.example.client.generated.AuthServiceImplService;
import org.example.client.generated.RegisterRequestDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private AuthService authService;

    @Override
    public void init() throws ServletException {
        AuthServiceImplService service = new AuthServiceImplService();
        authService = service.getAuthServiceImplPort();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Lấy dữ liệu từ form
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String confirmPassword = request.getParameter("confirmPassword");

        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Mật khẩu và xác nhận mật khẩu không khớp");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        // Tạo DTO
        RegisterRequestDTO dto = new RegisterRequestDTO();
        dto.setUsername(username);
        dto.setPassword(password);
        dto.setFullName(fullName);
        dto.setEmail(email);

        // Gọi web service
        String result;
        try {
            result = authService.register(dto);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi hệ thống khi gọi AuthService.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        // Xử lý kết quả
        if ("USERNAME_EXISTS".equals(result)) {
            request.setAttribute("error", "Tên người dùng đã tồn tại");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        } else if ("EMAIL_EXISTS".equals(result)) {
            request.setAttribute("error", "Email đã được sử dụng");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        } else {
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
