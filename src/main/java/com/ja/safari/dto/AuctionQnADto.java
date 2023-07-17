package com.ja.safari.dto;

import java.util.Date;

public class AuctionQnADto {

	private int inquiryId;
	private int buyer_id;
	private String buyer_nickname;
	private String inquiry_content;
	private Date inquiry_reg_date;
	private int replyId;
	private int seller_id;
	private String seller_nickname;
	private String reply_content;
	private Date reply_reg_date;
	public AuctionQnADto() {
	}
	public AuctionQnADto(int inquiryId, int buyer_id, String buyer_nickname, String inquiry_content,
			Date inquiry_reg_date, int replyId, int seller_id, String seller_nickname, String reply_content,
			Date reply_reg_date) {
		this.inquiryId = inquiryId;
		this.buyer_id = buyer_id;
		this.buyer_nickname = buyer_nickname;
		this.inquiry_content = inquiry_content;
		this.inquiry_reg_date = inquiry_reg_date;
		this.replyId = replyId;
		this.seller_id = seller_id;
		this.seller_nickname = seller_nickname;
		this.reply_content = reply_content;
		this.reply_reg_date = reply_reg_date;
	}
	public int getInquiryId() {
		return inquiryId;
	}
	public void setInquiryId(int inquiryId) {
		this.inquiryId = inquiryId;
	}
	public int getBuyer_id() {
		return buyer_id;
	}
	public void setBuyer_id(int buyer_id) {
		this.buyer_id = buyer_id;
	}
	public String getBuyer_nickname() {
		return buyer_nickname;
	}
	public void setBuyer_nickname(String buyer_nickname) {
		this.buyer_nickname = buyer_nickname;
	}
	public String getInquiry_content() {
		return inquiry_content;
	}
	public void setInquiry_content(String inquiry_content) {
		this.inquiry_content = inquiry_content;
	}
	public Date getInquiry_reg_date() {
		return inquiry_reg_date;
	}
	public void setInquiry_reg_date(Date inquiry_reg_date) {
		this.inquiry_reg_date = inquiry_reg_date;
	}
	public int getReplyId() {
		return replyId;
	}
	public void setReplyId(int replyId) {
		this.replyId = replyId;
	}
	public int getSeller_id() {
		return seller_id;
	}
	public void setSeller_id(int seller_id) {
		this.seller_id = seller_id;
	}
	public String getSeller_nickname() {
		return seller_nickname;
	}
	public void setSeller_nickname(String seller_nickname) {
		this.seller_nickname = seller_nickname;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public Date getReply_reg_date() {
		return reply_reg_date;
	}
	public void setReply_reg_date(Date reply_reg_date) {
		this.reply_reg_date = reply_reg_date;
	}
	

}
