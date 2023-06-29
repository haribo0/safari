package com.ja.safari.dto;

import java.util.Date;

public class RentalReviewDto {
    private int id;
    private int user_id;
    private int rental_id;
    private String rental_review_title;
    private String rental_review_content;
    private int rental_review_rating;
    private int rental_review_views;
    private String rental_reply_review;
    private Date rental_reply_reg_date;
    private Date reg_date;

    public RentalReviewDto() {
    }

    public RentalReviewDto(int id, int user_id, int rental_id, String rental_review_title, String rental_review_content, int rental_review_rating, int rental_review_views, String rental_reply_review, Date rental_reply_reg_date, Date reg_date) {
        this.id = id;
        this.user_id = user_id;
        this.rental_id = rental_id;
        this.rental_review_title = rental_review_title;
        this.rental_review_content = rental_review_content;
        this.rental_review_rating = rental_review_rating;
        this.rental_review_views = rental_review_views;
        this.rental_reply_review = rental_reply_review;
        this.rental_reply_reg_date = rental_reply_reg_date;
        this.reg_date = reg_date;
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

    public int getRental_id() {
        return rental_id;
    }

    public void setRental_id(int rental_id) {
        this.rental_id = rental_id;
    }

    public String getRental_review_title() {
        return rental_review_title;
    }

    public void setRental_review_title(String rental_review_title) {
        this.rental_review_title = rental_review_title;
    }

    public String getRental_review_content() {
        return rental_review_content;
    }

    public void setRental_review_content(String rental_review_content) {
        this.rental_review_content = rental_review_content;
    }

    public int getRental_review_rating() {
        return rental_review_rating;
    }

    public void setRental_review_rating(int rental_review_rating) {
        this.rental_review_rating = rental_review_rating;
    }

    public int getRental_review_views() {
        return rental_review_views;
    }

    public void setRental_review_views(int rental_review_views) {
        this.rental_review_views = rental_review_views;
    }

    public String getRental_reply_review() {
        return rental_reply_review;
    }

    public void setRental_reply_review(String rental_reply_review) {
        this.rental_reply_review = rental_reply_review;
    }

    public Date getRental_reply_reg_date() {
        return rental_reply_reg_date;
    }

    public void setRental_reply_reg_date(Date rental_reply_reg_date) {
        this.rental_reply_reg_date = rental_reply_reg_date;
    }

    public Date getReg_date() {
        return reg_date;
    }

    public void setReg_date(Date reg_date) {
        this.reg_date = reg_date;
    }
}
