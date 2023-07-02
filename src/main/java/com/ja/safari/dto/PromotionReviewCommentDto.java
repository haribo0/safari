package com.ja.safari.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class PromotionReviewCommentDto {
	private int id;
	private int promotion_review_id;
	private int user_id;
	private String promotion_review_comment;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private boolean private_comment;
	private Date reg_date;

	public PromotionReviewCommentDto() {
		super();
	}

	public PromotionReviewCommentDto(int id, int promotion_review_id, int user_id, String promotion_review_comment,
			boolean private_comment, Date reg_date) {
		super();
		this.id = id;
		this.promotion_review_id = promotion_review_id;
		this.user_id = user_id;
		this.promotion_review_comment = promotion_review_comment;
		this.private_comment = private_comment;
		this.reg_date = reg_date;
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

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getPromotion_review_comment() {
		return promotion_review_comment;
	}

	public void setPromotion_review_comment(String promotion_review_comment) {
		this.promotion_review_comment = promotion_review_comment;
	}

	public boolean isPrivate_comment() {
		return private_comment;
	}

	public void setPrivate_comment(boolean private_comment) {
		this.private_comment = private_comment;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	
}
