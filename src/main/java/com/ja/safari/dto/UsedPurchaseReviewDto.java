package com.ja.safari.dto;

import java.sql.Date;

public class UsedPurchaseReviewDto {
	private int id;
	private int purchase_request_id;
	private int sender_id;
	private int receiver_id;
	private String review_comment;
	private String review_img_link;
	private Date reg_date;
	
	public UsedPurchaseReviewDto() {
		super();
	}

	public UsedPurchaseReviewDto(int id, int purchase_request_id, int sender_id, int receiver_id,
			String review_comment, String review_img_link, Date reg_date) {
		super();
		this.id = id;
		this.purchase_request_id = purchase_request_id;
		this.sender_id = sender_id;
		this.receiver_id = receiver_id;
		this.review_comment = review_comment;
		this.review_img_link = review_img_link;
		this.reg_date = reg_date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	
	public int getPurchase_request_id() {
		return purchase_request_id;
	}

	public void setPurchase_request_id(int purchase_request_id) {
		this.purchase_request_id = purchase_request_id;
	}
	
	public int getSender_id() {
		return sender_id;
	}

	public void setSender_id(int sender_id) {
		this.sender_id = sender_id;
	}

	public int getReceiver_id() {
		return receiver_id;
	}

	public void setReceiver_id(int receiver_id) {
		this.receiver_id = receiver_id;
	}

	public String getReview_comment() {
		return review_comment;
	}

	public void setReview_comment(String review_comment) {
		this.review_comment = review_comment;
	}

	public String getReview_img_link() {
		return review_img_link;
	}

	public void setReview_img_link(String review_img_link) {
		this.review_img_link = review_img_link;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	
}
