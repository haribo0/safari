package com.ja.safari.dto;

import java.util.Date;

public class PromotionReviewDto {
	private int id;
	private int user_id;
	private int rental_item_id;
	private String promotion_review_title;
	private String promotion_review_content;
	private int promotion_review_rating;
	private int promotion_review_views;
	private Date reg_date;

	public PromotionReviewDto() {
		super();
	}

	public PromotionReviewDto(int id, int rental_item_id, int user_id, String promotion_review_title,
			String promotion_review_content, int promotion_review_rating, int promotion_review_views, Date reg_date) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.rental_item_id = rental_item_id;
		this.promotion_review_title = promotion_review_title;
		this.promotion_review_content = promotion_review_content;
		this.promotion_review_rating = promotion_review_rating;
		this.promotion_review_views = promotion_review_views;
		this.reg_date = reg_date;
	}

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

	public int getRental_item_id() {
		return rental_item_id;
	}

	public void setRental_item_id(int rental_item_id) {
		this.rental_item_id = rental_item_id;
	}

	public String getPromotion_review_title() {
		return promotion_review_title;
	}

	public void setPromotion_review_title(String promotion_review_title) {
		this.promotion_review_title = promotion_review_title;
	}

	public String getPromotion_review_content() {
		return promotion_review_content;
	}

	public void setPromotion_review_content(String promotion_review_content) {
		this.promotion_review_content = promotion_review_content;
	}

	public int getPromotion_review_rating() {
		return promotion_review_rating;
	}

	public void setPromotion_review_rating(int promotion_review_rating) {
		this.promotion_review_rating = promotion_review_rating;
	}

	public int getPromotion_review_views() {
		return promotion_review_views;
	}

	public void setPromotion_review_views(int promotion_review_views) {
		this.promotion_review_views = promotion_review_views;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

}
