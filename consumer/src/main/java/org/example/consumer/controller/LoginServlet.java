package org.example.consumer.controller;

import org.example.client.generated.AuthService;
import org.example.client.generated.AuthServiceImplService;
import org.example.client.generated.LoginRequestDTO;
import org.example.client.generated.UserDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private AuthService authService;

    @Override
    public void init() throws ServletException {
        AuthServiceImplService service = new AuthServiceImplService();
        authService = service.getAuthServiceImplPort();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username == null || password == null || username.isEmpty() || password.isEmpty()) {
            request.setAttribute("error", "Vui lòng nhập đầy đủ thông tin.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        LoginRequestDTO dto = new LoginRequestDTO();
        dto.setUsername(username);
        dto.setPassword(password);

        UserDTO result;
        try {
            result = authService.login(dto);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi hệ thống, vui lòng thử lại sau.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }


        if ("INVALID_CREDENTIALS".equals(result)) {
            request.setAttribute("error", "Sai tên đăng nhập hoặc mật khẩu.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("user", result);
            response.sendRedirect(request.getContextPath() + "/guide/home");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }
}
