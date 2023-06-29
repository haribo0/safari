package com.ja.safari.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class HelpDto {

	private int id;
	private int user_id;
	private String title;
	private String content;
	private int views;
	private int points;
	private String status;
	private String location;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date reg_date;
	@Override
	public String toString() {
		return "HelpDto [id=" + id + ", user_id=" + user_id + ", title=" + title + ", content=" + content + ", views="
				+ views + ", points=" + points + ", status=" + status + ", location=" + location + ", reg_date="
				+ reg_date + "]";
	}
	public HelpDto() {
		super();
	}
	public HelpDto(int id, int user_id, String title, String content, int views, int points, String status,
			String location, Date reg_date) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.title = title;
		this.content = content;
		this.views = views;
		this.points = points;
		this.status = status;
		this.location = location;
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
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	
	
	
	
	
}
	
