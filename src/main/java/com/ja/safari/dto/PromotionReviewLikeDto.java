package com.ja.safari.dto;

import java.util.Date;

public class PromotionReviewLikeDto {

	private int id;
	private int review_id;
	private int user_id;
	private Date review_like_date;

	public PromotionReviewLikeDto() {
		super();
	}

	public PromotionReviewLikeDto(int id, int review_id, int user_id, Date review_like_date) {
		super();
		this.id = id;
		this.review_id = review_id;
		this.user_id = user_id;
		this.review_like_date = review_like_date;
	}

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

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public Date getReview_like_date() {
		return review_like_date;
	}

	public void setReview_like_date(Date review_like_date) {
		this.review_like_date = review_like_date;
	}

}
