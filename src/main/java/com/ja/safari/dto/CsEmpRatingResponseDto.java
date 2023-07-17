package com.ja.safari.dto;

public class CsEmpRatingResponseDto {
	
	private int emp_id;
	private String name;
	private double avg_rating;
	public CsEmpRatingResponseDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CsEmpRatingResponseDto(int emp_id, String name, double avg_rating) {
		super();
		this.emp_id = emp_id;
		this.name = name;
		this.avg_rating = avg_rating;
	}
	public int getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(int emp_id) {
		this.emp_id = emp_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getAvg_rating() {
		return avg_rating;
	}
	public void setAvg_rating(double avg_rating) {
		this.avg_rating = avg_rating;
	}
	
	

}
