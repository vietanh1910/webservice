package org.example.consumer.dto;

import java.util.Date;

public class ReviewDTO {
    private String userName;
    private String userAvatar;
    private int rating;
    private String content;
    private Date date;

    public ReviewDTO(String userName, String userAvatar, int rating, String content, Date date) {
        this.userName = userName;
        this.userAvatar = userAvatar;
        this.rating = rating;
        this.content = content;
        this.date = date;
    }

    public ReviewDTO() {
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserAvatar() {
        return userAvatar;
    }

    public void setUserAvatar(String userAvatar) {
        this.userAvatar = userAvatar;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
// Getters & Setters
}

