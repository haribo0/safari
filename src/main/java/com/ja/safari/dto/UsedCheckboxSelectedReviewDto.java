package com.ja.safari.dto;

public class UsedCheckboxSelectedReviewDto {
	private int id;
	private int product_review_id;
	private int review_checkbox_category_id;
	
	public UsedCheckboxSelectedReviewDto() {
		super();
	}
	public UsedCheckboxSelectedReviewDto(int id, int product_review_id, int review_checkbox_category_id) {
		super();
		this.id = id;
		this.product_review_id = product_review_id;
		this.review_checkbox_category_id = review_checkbox_category_id;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getProduct_review_id() {
		return product_review_id;
	}
	public void setProduct_review_id(int product_review_id) {
		this.product_review_id = product_review_id;
	}
	public int getReview_checkbox_category_id() {
		return review_checkbox_category_id;
	}
	public void setReview_checkbox_category_id(int review_checkbox_category_id) {
		this.review_checkbox_category_id = review_checkbox_category_id;
	}
	
}
