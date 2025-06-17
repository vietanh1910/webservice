package org.example.provider.entity;

import javax.persistence.*;
import javax.xml.bind.annotation.XmlRootElement;
import java.time.LocalDateTime;

@Entity
@Table(name = "ratings")
@XmlRootElement
public class Rating {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "rating_id")
    private int ratingId;

    @Column(name = "user_id", nullable = false)
    private int userId;

    @Column(name = "target_id", nullable = false)
    private int targetId;

    @Column(name = "rating", nullable = false)
    private int rating;

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    // Constructors
    public Rating() {}

    public Rating(int userId, int targetId, int rating) {
        this.userId = userId;
        this.targetId = targetId;
        this.rating = rating;
    }

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
    }

    // Getters and Setters
    public int getRatingId() { return ratingId; }
    public void setRatingId(int ratingId) { this.ratingId = ratingId; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public int getTargetId() { return targetId; }
    public void setTargetId(int targetId) { this.targetId = targetId; }

    public int getRating() { return rating; }
    public void setRating(int rating) { this.rating = rating; }

    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }
}

