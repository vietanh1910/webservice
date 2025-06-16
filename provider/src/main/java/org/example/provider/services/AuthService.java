package org.example.provider.services;

import javax.jws.WebMethod;
import javax.jws.WebService;

@WebService
public interface AuthService {

    @WebMethod
    String login(String username, String password);
}
