package com.ja.safari.dto;

public class ReviewCheckboxDto {
	private int id;
	private int productReviewId;
	private int reviewRateOptionId;

	public ReviewCheckboxDto() {}

	public ReviewCheckboxDto(int id, int productReviewId, int reviewRateOptionId) {
	    this.id = id;
	    this.productReviewId = productReviewId;
	    this.reviewRateOptionId = reviewRateOptionId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getProductReviewId() {
		return productReviewId;
	}

	public void setProductReviewId(int productReviewId) {
		this.productReviewId = productReviewId;
	}

	public int getReviewRateOptionId() {
		return reviewRateOptionId;
	}

	public void setReviewRateOptionId(int reviewRateOptionId) {
		this.reviewRateOptionId = reviewRateOptionId;
	}

	
}
