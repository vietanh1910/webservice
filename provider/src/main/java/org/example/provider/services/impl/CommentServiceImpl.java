package org.example.provider.services.impl;

import org.example.provider.dao.CommentDAO;
import org.example.provider.entity.Comment;
import org.example.provider.services.CommentService;

import javax.jws.WebService;
import java.util.ArrayList;
import java.util.List;

@WebService(endpointInterface = "org.example.provider.services.CommentService")
public class CommentServiceImpl implements CommentService {

    private CommentDAO commentDAO = new CommentDAO();

    @Override
    public boolean addComment(int targetId, Comment comment, int userId) {
        try {
            comment.setUserId(userId);
            comment.setTargetId(targetId);

            return commentDAO.addComment(comment);
        } catch (Exception e) {
            System.err.println("Database error in addComment: " + e.getMessage());
            return false;
        }
    }

    @Override
    public List<Comment> getCommentsByPlace(int placeId) {
        try {
            return commentDAO.getCommentsByTarget(placeId);
        } catch (Exception e) {
            System.err.println("Database error in getCommentsByPlace: " + e.getMessage());
            return new ArrayList<>();
        }
    }

    @Override
    public boolean updateComment(int commentId, Comment comment, int userId) {
        try {
            comment.setCommentId(commentId);
            comment.setUserId(userId);

            return commentDAO.updateComment(comment);
        } catch (Exception e) {
            System.err.println("Database error in updateComment: " + e.getMessage());
            return false;
        }
    }
}
