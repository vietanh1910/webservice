package org.example.provider.services.impl;


import org.example.provider.dao.UserDAO;
import org.example.provider.entity.User;
import org.example.provider.security.JwtUtil;
import org.example.provider.services.AuthService;

import javax.jws.WebService;

@WebService(
        endpointInterface = "org.example.provider.services.AuthService")
public class AuthServiceImpl implements AuthService {

    private final UserDAO userDAO = new UserDAO();

    @Override
    public String login(String username, String password) {
        User user = userDAO.findByUsername(username);

        if (user == null || !user.getPassword().equals(password)) {
            return "INVALID_CREDENTIALS";
        }

        return JwtUtil.generateToken(username);
    }
}
