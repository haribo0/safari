package com.ja.safari.dto;

public class RentalReviewImgDto {
    private int id;
    private int review_id;
    private String rental_review_img;

    public RentalReviewImgDto() {
    }

    public RentalReviewImgDto(int id, int review_id, String rental_review_img) {
        this.id = id;
        this.review_id = review_id;
        this.rental_review_img = rental_review_img;
    }

    // Getters and Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getReview_id() {
        return review_id;
    }

    public void setReview_id(int review_id) {
        this.review_id = review_id;
    }

    public String getRental_review_img() {
        return rental_review_img;
    }

    public void setRental_review_img(String rental_review_img) {
        this.rental_review_img = rental_review_img;
    }
}
