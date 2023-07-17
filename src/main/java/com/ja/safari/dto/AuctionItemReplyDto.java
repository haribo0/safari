package com.ja.safari.dto;

import java.util.Date;

public class AuctionItemReplyDto {

	private int id;
	private int auction_item_inquiry_id;
	private int user_seller_id;
	private String content;
	private Date reg_date;
	
	public AuctionItemReplyDto() {
	}

	public AuctionItemReplyDto(int id, int auction_item_inquiry_id, int user_seller_id, String content, Date reg_date) {
		this.id = id;
		this.auction_item_inquiry_id = auction_item_inquiry_id;
		this.user_seller_id = user_seller_id;
		this.content = content;
		this.reg_date = reg_date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getAuction_item_inquiry_id() {
		return auction_item_inquiry_id;
	}

	public void setAuction_item_inquiry_id(int auction_item_inquiry_id) {
		this.auction_item_inquiry_id = auction_item_inquiry_id;
	}

	public int getUser_seller_id() {
		return user_seller_id;
	}

	public void setUser_seller_id(int user_seller_id) {
		this.user_seller_id = user_seller_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	

}
