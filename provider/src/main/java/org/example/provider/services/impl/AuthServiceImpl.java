package org.example.provider.services.impl;


import org.example.provider.dao.UserDAO;
import org.example.provider.dto.UserDTO;
import org.example.provider.dto.request.LoginRequestDTO;
import org.example.provider.dto.request.RegisterRequestDTO;
import org.example.provider.entity.User;
import org.example.provider.security.JwtUtil;
import org.example.provider.services.AuthService;
import org.mindrot.jbcrypt.BCrypt;

import javax.jws.WebService;

@WebService(
        endpointInterface = "org.example.provider.services.AuthService")
public class AuthServiceImpl implements AuthService {

    private final UserDAO userDAO = new UserDAO();

    @Override
    public String login(LoginRequestDTO dto) {
        User user = userDAO.findByUsername(dto.getUsername());
        if (user == null || !BCrypt.checkpw(dto.getPassword(), user.getPassword())) {
            return "INVALID_CREDENTIALS";
        }
        return JwtUtil.generateToken(dto.getUsername());
    }

    @Override
    public String register(RegisterRequestDTO dto) {
        if (userDAO.existsByUsername(dto.getUsername())) {
            return "USERNAME_EXISTS";
        }
        if (userDAO.existsByEmail(dto.getEmail())) {
            return "EMAIL_EXISTS";
        }
        User user = new User();
        user.setUsername(dto.getUsername());
        user.setEmail(dto.getEmail());
        user.setFullName(dto.getFullName());
        user.setRole(2);
        user.setPassword(BCrypt.hashpw(dto.getPassword(), BCrypt.gensalt()));
        user.setActived(true);
        user.setDeleted(false);
        userDAO.createUser(user);

        return JwtUtil.generateToken(user.getUsername());
    }

    @Override
    public boolean changePassword(String username, String oldPassword, String newPassword) {
        User user = userDAO.findByUsername(username);
        if (user == null || !user.getPassword().equals(oldPassword)) {
            return false;
        }

        user.setPassword(newPassword);
        userDAO.updateUser(user);
        return true;
    }

    @Override
    public boolean verifyToken(String token) {
        return JwtUtil.validateToken(token);
    }

    @Override
    public User getUserInfo(String token) {
        if (!JwtUtil.validateToken(token)) return null;
        String username = JwtUtil.getUsernameFromToken(token);
        return userDAO.findByUsername(username);
    }
}
