package com.ja.safari.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class RecruitDto {
	
	private int id;
	private int user_id;
	private int position_category_id;
	private String title;
	private String content;
	private String phone;
	private String email;
	private int salary;
	private String location;
	private int opening;
	private String gender;
	private int age_limit;
	private int views;
	private String recruit_status;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date end_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date reg_date;
	
	public RecruitDto() {
		super();
	}

	public RecruitDto(int id, int user_id, int position_category_id, String title, String content, String phone,
			String email, int salary, String location, int opening, String gender, int age_limit, int views,
			String recruit_status, Date end_date, Date reg_date) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.position_category_id = position_category_id;
		this.title = title;
		this.content = content;
		this.phone = phone;
		this.email = email;
		this.salary = salary;
		this.location = location;
		this.opening = opening;
		this.gender = gender;
		this.age_limit = age_limit;
		this.views = views;
		this.recruit_status = recruit_status;
		this.end_date = end_date;
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

	public int getPosition_category_id() {
		return position_category_id;
	}

	public void setPosition_category_id(int position_category_id) {
		this.position_category_id = position_category_id;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getSalary() {
		return salary;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getOpening() {
		return opening;
	}

	public void setOpening(int opening) {
		this.opening = opening;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAge_limit() {
		return age_limit;
	}

	public void setAge_limit(int age_limit) {
		this.age_limit = age_limit;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public String getRecruit_status() {
		return recruit_status;
	}

	public void setRecruit_status(String recruit_status) {
		this.recruit_status = recruit_status;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	
	
	
	
}
