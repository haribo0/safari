package com.ja.safari.dto;

import java.sql.Date;

public class PurchaseReviewDto {
	private int id;
	private int product_id;
	private int user_id_seller;
	private int user_id_customer;
	private String review_comment;
	private Date reg_date;

	public PurchaseReviewDto() {}

	public PurchaseReviewDto(int id, int product_id, int user_id_seller, int user_id_customer, String review_comment, Date reg_date) {
	    this.id = id;
	    this.product_id = product_id;
	    this.user_id_seller = user_id_seller;
	    this.user_id_customer = user_id_customer;
	    this.review_comment = review_comment;
	    this.reg_date = reg_date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public int getUser_id_seller() {
		return user_id_seller;
	}

	public void setUser_id_seller(int user_id_seller) {
		this.user_id_seller = user_id_seller;
	}

	public int getUser_id_customer() {
		return user_id_customer;
	}

	public void setUser_id_customer(int user_id_customer) {
		this.user_id_customer = user_id_customer;
	}

	public String getReview_comment() {
		return review_comment;
	}

	public void setReview_comment(String review_comment) {
		this.review_comment = review_comment;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	
}
