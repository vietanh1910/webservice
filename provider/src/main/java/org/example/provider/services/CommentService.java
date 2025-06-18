package org.example.provider.services;

import org.example.provider.entity.Comment;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;
import java.util.List;

@WebService
public interface CommentService {

    @WebMethod
    boolean addComment(@WebParam(name = "placeId") int placeId,
                       @WebParam(name = "comment") Comment comment,
                       @WebParam(name = "userId") int userId);

    @WebMethod
    List<Comment> getCommentsByPlace(@WebParam(name = "placeId") int placeId);

    @WebMethod
    boolean updateComment(@WebParam(name = "commentId") int commentId,
                          @WebParam(name = "comment") Comment comment,
                          @WebParam(name = "userId") int userId);
}

