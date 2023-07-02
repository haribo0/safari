package com.ja.safari.dto;


public class CsScheduleDto {
	
	private int id;
	private int emp_id;
	private String weekday;
	private int start_time;
	private int end_time;
	
	public CsScheduleDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CsScheduleDto(int id, int emp_id, String weekday, int start_time, int end_time) {
		super();
		this.id = id;
		this.emp_id = emp_id;
		this.weekday = weekday;
		this.start_time = start_time;
		this.end_time = end_time;
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

	public String getDay() {
		return weekday;
	}

	public void setDay(String weekday) {
		this.weekday = weekday;
	}

	public int getStart_time() {
		return start_time;
	}

	public void setStart_time(int start_time) {
		this.start_time = start_time;
	}

	public int getEnd_time() {
		return end_time;
	}

	public void setEnd_time(int end_time) {
		this.end_time = end_time;
	}
	
	
	
	
}
