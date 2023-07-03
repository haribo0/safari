package com.ja.safari.dto;

public class CsCategoryDto {
	
	private int id;
	private String category;
	
	public CsCategoryDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CsCategoryDto(int id, String category) {
		super();
		this.id = id;
		this.category = category;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	

}
