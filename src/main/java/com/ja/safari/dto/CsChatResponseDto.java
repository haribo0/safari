package com.ja.safari.dto;

import java.util.Date;
import java.util.List;

public class CsChatResponseDto {
	
	private int id;
	private int user_id;
	private int emp_id;
	private String nickname;
	private String category;
	private List<CsLiveChatMsgDto> chatMsg;
	private Date reg_date;
	private Date end_date;
	
	public CsChatResponseDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CsChatResponseDto(int id, int user_id, int emp_id, String nickname, String category,
			List<CsLiveChatMsgDto> chatMsg, Date reg_date, Date end_date) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.emp_id = emp_id;
		this.nickname = nickname;
		this.category = category;
		this.chatMsg = chatMsg;
		this.reg_date = reg_date;
		this.end_date = end_date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(int emp_id) {
		this.emp_id = emp_id;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public List<CsLiveChatMsgDto> getChatMsg() {
		return chatMsg;
	}

	public void setChatMsg(List<CsLiveChatMsgDto> chatMsg) {
		this.chatMsg = chatMsg;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	
	

}
