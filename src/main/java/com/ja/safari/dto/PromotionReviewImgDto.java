package com.ja.safari.dto;

public class PromotionReviewImgDto {
	private int id;
	private int promotion_review_id;
	private String rental_review_img;

	public PromotionReviewImgDto() {
		super();
	}

	public PromotionReviewImgDto(int id, int promotion_review_id, String rental_review_img) {
		super();
		this.id = id;
		this.promotion_review_id = promotion_review_id;
		this.rental_review_img = rental_review_img;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPromotion_review_id() {
		return promotion_review_id;
	}

	public void setPromotion_review_id(int promotion_review_id) {
		this.promotion_review_id = promotion_review_id;
	}

	public String getRental_review_img() {
		return rental_review_img;
	}

	public void setRental_review_img(String rental_review_img) {
		this.rental_review_img = rental_review_img;
	}

}
