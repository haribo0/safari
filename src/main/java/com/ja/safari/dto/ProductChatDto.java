package com.ja.safari.dto;

import java.sql.Date;

public class ProductChatDto {
	private int id;
	private int purchase_request_id;
	private int sender_id;
	private int receiver_id;
	private String content;
	private String read_unread;
	private Date reg_date;
	
	public ProductChatDto() {
		super();
	}

	public ProductChatDto(int id, int purchase_request_id, int sender_id, int receiver_id, String content,
			String read_unread, Date reg_date) {
		super();
		this.id = id;
		this.purchase_request_id = purchase_request_id;
		this.sender_id = sender_id;
		this.receiver_id = receiver_id;
		this.content = content;
		this.read_unread = read_unread;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRead_unread() {
		return read_unread;
	}

	public void setRead_unread(String read_unread) {
		this.read_unread = read_unread;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
}
