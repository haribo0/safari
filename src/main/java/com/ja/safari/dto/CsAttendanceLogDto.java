package com.ja.safari.dto;

import java.util.Date;

public class CsAttendanceLogDto {
	
	private int id;
	private int emp_id;
	private Date time_in;
	private Date time_out;
	
	public CsAttendanceLogDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public CsAttendanceLogDto(int id, int emp_id, Date time_in, Date time_out) {
		super();
		this.id = id;
		this.emp_id = emp_id;
		this.time_in = time_in;
		this.time_out = time_out;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(int emp_id) {
		this.emp_id = emp_id;
	}
	public Date getTime_in() {
		return time_in;
	}
	public void setTime_in(Date time_in) {
		this.time_in = time_in;
	}
	public Date getTime_out() {
		return time_out;
	}
	public void setTime_out(Date time_out) {
		this.time_out = time_out;
	}
	
	
	

}
