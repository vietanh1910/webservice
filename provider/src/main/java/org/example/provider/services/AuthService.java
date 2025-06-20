package org.example.provider.services;

import org.example.provider.dto.UserDTO;
import org.example.provider.dto.request.LoginRequestDTO;
import org.example.provider.dto.request.RegisterRequestDTO;
import org.example.provider.entity.User;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;

@WebService
public interface AuthService {

    @WebMethod
    UserDTO login(@WebParam(name = "loginRequest") LoginRequestDTO loginRequest);

    @WebMethod
    String register(@WebParam(name = "registerRequest") RegisterRequestDTO registerRequestDTO);

    @WebMethod
    boolean changePassword(@WebParam(name = "username") String username,
                           @WebParam(name = "oldPassword") String oldPassword,
                           @WebParam(name = "newPassword") String newPassword);

    @WebMethod
    boolean verifyToken(@WebParam(name = "token") String token);

    @WebMethod
    User getUserInfo(@WebParam(name = "token") String token);
}
