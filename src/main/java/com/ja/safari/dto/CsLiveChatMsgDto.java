package com.ja.safari.dto;

import java.util.Date;

public class CsLiveChatMsgDto {
	
	private int id;
	private int chat_id;
	private int sender;
	private String msg;
	private Date reg_date;
	private int is_read;
	
	public CsLiveChatMsgDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public CsLiveChatMsgDto(int id, int chat_id, int sender, String msg, Date reg_date, int is_read) {
		super();
		this.id = id;
		this.chat_id = chat_id;
		this.sender = sender;
		this.msg = msg;
		this.reg_date = reg_date;
		this.is_read = is_read;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getChat_id() {
		return chat_id;
	}
	public void setChat_id(int chat_id) {
		this.chat_id = chat_id;
	}
	public int getSender() {
		return sender;
	}
	public void setSender(int sender) {
		this.sender = sender;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getIs_read() {
		return is_read;
	}
	public void setIs_read(int is_read) {
		this.is_read = is_read;
	}
	
	
	
	
}
