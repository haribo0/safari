package com.ja.safari.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class CommunityQuestionDto {

	private int id;
	private int question_category_id;
	private int community_id;
	private String title;
	private String content;
	private int views;
	private String status;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date reg_date;
	public CommunityQuestionDto() {
		super();
	}
	public CommunityQuestionDto(int id, int question_category_id, int community_id, String title, String content,
			int views, String status, Date reg_date) {
		super();
		this.id = id;
		this.question_category_id = question_category_id;
		this.community_id = community_id;
		this.title = title;
		this.content = content;
		this.views = views;
		this.status = status;
		this.reg_date = reg_date;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getQuestion_category_id() {
		return question_category_id;
	}
	public void setQuestion_category_id(int question_category_id) {
		this.question_category_id = question_category_id;
	}
	public int getCommunity_id() {
		return community_id;
	}
	public void setCommunity_id(int community_id) {
		this.community_id = community_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
}
