package com.ja.safari.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class QuestionDto {

	private int id;
	private int user_id;
	private int question_category_id;
	private String title;
	private String content;
	private int views;
	private int points;
	private String status;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date reg_date;
	public QuestionDto() {
		super();
	}
	public QuestionDto(int id, int user_id, int question_category_id, String title, String content, int views,
			int points, String status, Date reg_date) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.question_category_id = question_category_id;
		this.title = title;
		this.content = content;
		this.views = views;
		this.points = points;
		this.status = status;
		this.reg_date = reg_date;
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
	public int getQuestion_category_id() {
		return question_category_id;
	}
	public void setQuestion_category_id(int question_category_id) {
		this.question_category_id = question_category_id;
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
	public int getPoints() {
		return points;
	}
	public void setPoints(int points) {
		this.points = points;
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
