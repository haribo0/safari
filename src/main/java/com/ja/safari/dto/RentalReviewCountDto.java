package com.ja.safari.dto;

public class RentalReviewCountDto {
	
	private int total_review_count;
	private int review_count5;
	private int review_count4;
	private int review_count3;
	private int review_count2;
	private int review_count1;
	
	public RentalReviewCountDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public RentalReviewCountDto(int total_review_count, int review_count5, int review_count4, int review_count3,
			int review_count2, int review_count1) {
		super();
		this.total_review_count = total_review_count;
		this.review_count5 = review_count5;
		this.review_count4 = review_count4;
		this.review_count3 = review_count3;
		this.review_count2 = review_count2;
		this.review_count1 = review_count1;
	}
	
	public int getTotal_review_count() {
		return total_review_count;
	}
	public void setTotal_review_count(int total_review_count) {
		this.total_review_count = total_review_count;
	}
	public int getReview_count5() {
		return review_count5;
	}
	public void setReview_count5(int review_count5) {
		this.review_count5 = review_count5;
	}
	public int getReview_count4() {
		return review_count4;
	}
	public void setReview_count4(int review_count4) {
		this.review_count4 = review_count4;
	}
	public int getReview_count3() {
		return review_count3;
	}
	public void setReview_count3(int review_count3) {
		this.review_count3 = review_count3;
	}
	public int getReview_count2() {
		return review_count2;
	}
	public void setReview_count2(int review_count2) {
		this.review_count2 = review_count2;
	}
	public int getReview_count1() {
		return review_count1;
	}
	public void setReview_count1(int review_count1) {
		this.review_count1 = review_count1;
	}
	
	

}
