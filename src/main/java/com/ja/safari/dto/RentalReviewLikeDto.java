package com.ja.safari.dto;

public class RentalReviewLikeDto {
    private int id;
    private int user_id;
    private int review_id;
    private int review_like;

    public RentalReviewLikeDto() {
    }

    public RentalReviewLikeDto(int id, int user_id, int review_id, int review_like) {
        this.id = id;
        this.user_id = user_id;
        this.review_id = review_id;
        this.review_like = review_like;
    }

    // Getters and Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getReview_id() {
        return review_id;
    }

    public void setReview_id(int review_id) {
        this.review_id = review_id;
    }

    public int getReview_like() {
        return review_like;
    }

    public void setReview_like(int review_like) {
        this.review_like = review_like;
    }
}
