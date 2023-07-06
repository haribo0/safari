package com.ja.safari.dto;

import java.util.Date;

public class CsQnaCombinedDto {
	
	private int id;
	private UserDto userDto;
	private CsCategoryDto categoryDto;
	private CsEmpDto empDto;
	private String qna_title;
	private String qna_content;
	private Date reg_date;
	private String qna_reply;
	private Date reply_date;
	
	public CsQnaCombinedDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public CsQnaCombinedDto(int id, UserDto userDto, CsCategoryDto categoryDto, CsEmpDto empDto,
			String qna_title, String qna_content, Date reg_date, String qna_reply, Date reply_date) {
		super();
		this.id = id;
		this.userDto = userDto;
		this.categoryDto = categoryDto;
		this.empDto = empDto;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
		this.reg_date = reg_date;
		this.qna_reply = qna_reply;
		this.reply_date = reply_date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public UserDto getUserDto() {
		return userDto;
	}

	public void setUserDto(UserDto userDto) {
		this.userDto = userDto;
	}

	public CsCategoryDto getCategoryDto() {
		return categoryDto;
	}

	public void setCategoryDto(CsCategoryDto categoryDto) {
		this.categoryDto = categoryDto;
	}

	public CsEmpDto getEmpDto() {
		return empDto;
	}

	public void setEmpDto(CsEmpDto empDto) {
		this.empDto = empDto;
	}

	public String getQna_title() {
		return qna_title;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public String getQna_reply() {
		return qna_reply;
	}

	public void setQna_reply(String qna_reply) {
		this.qna_reply = qna_reply;
	}

	public Date getReply_date() {
		return reply_date;
	}

	public void setReply_date(Date reply_date) {
		this.reply_date = reply_date;
	}
	
	
	
	

}
