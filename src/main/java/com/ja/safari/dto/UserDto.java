package com.ja.safari.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class UserDto {
	
	private int id;
	private String email;
	private String pw;
	private String nickname;
	private String phone;
	private String gender;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birth;
	private String profile_img_link;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date reg_date;
	
	public UserDto() {
		super();
	}

	public UserDto(int id, String email, String pw, String nickname, String phone, String gender, Date birth,
			String profile_img_link, Date reg_date) {
		super();
		this.id = id;
		this.email = email;
		this.pw = pw;
		this.nickname = nickname;
		this.phone = phone;
		this.gender = gender;
		this.birth = birth;
		this.profile_img_link = profile_img_link;
		this.reg_date = reg_date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getProfile_img_link() {
		return profile_img_link;
	}

	public void setProfile_img_link(String profile_img_link) {
		this.profile_img_link = profile_img_link;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}


}
