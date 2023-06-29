package com.ja.safari.dto;

public class ReviewRateOptionDto {
	private int id;
	private int productReviewId;
	private String content;

	public ReviewRateOptionDto() {}

	public ReviewRateOptionDto(int id, int productReviewId, String content) {
	    this.id = id;
	    this.productReviewId = productReviewId;
	    this.content = content;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	
}
