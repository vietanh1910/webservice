package org.example.consumer.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Authentication Filter để kiểm tra đăng nhập
 */
@WebFilter
public class AuthenticationFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Khởi tạo filter
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);

        String requestURI = httpRequest.getRequestURI();
        String contextPath = httpRequest.getContextPath();

        // Kiểm tra xem user đã đăng nhập chưa
        boolean isLoggedIn = (session != null && session.getAttribute("token") != null);

        // Các trang yêu cầu đăng nhập
        boolean isProtectedResource = requestURI.contains("/rating") ||
                requestURI.contains("/profile");

        if (isProtectedResource && !isLoggedIn) {
            // Chưa đăng nhập, chuyển về trang login
            httpResponse.sendRedirect(contextPath + "/login");
            return;
        }

        // Tiếp tục xử lý request
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Cleanup
    }
}
