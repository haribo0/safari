package com.ja.safari.dto;

public class UsedReviewCheckboxCategoryDto {
	private int id;
	private int review_rate_category_id;
	private String content;
	
	public UsedReviewCheckboxCategoryDto() {
		super();
	}

	public UsedReviewCheckboxCategoryDto(int id, int review_rate_category_id, String content) {
		super();
		this.id = id;
		this.review_rate_category_id = review_rate_category_id;
		this.content = content;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getReview_rate_category_id() {
		return review_rate_category_id;
	}

	public void setReview_rate_category_id(int review_rate_category_id) {
		this.review_rate_category_id = review_rate_category_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
}
