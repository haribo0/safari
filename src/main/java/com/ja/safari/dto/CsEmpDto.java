package com.ja.safari.dto;

import java.util.Date;

public class CsEmpDto {
	
	private int id;
	private int master;
	private String department;
	private String position;
	private String name;
	private String nickname;
	private String userid;
	private String password;
	private Date reg_date;
	
	public CsEmpDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CsEmpDto(int id, int master, String department, String position, String name, String nickname, String userid,
			String password, Date reg_date) {
		super();
		this.id = id;
		this.master = master;
		this.department = department;
		this.position = position;
		this.name = name;
		this.nickname = nickname;
		this.userid = userid;
		this.password = password;
		this.reg_date = reg_date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getMaster() {
		return master;
	}

	public void setMaster(int master) {
		this.master = master;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	

}
