package com.ja.safari.dto;

public class ProductMainCategoryDto {
	private int id;
	private String main_category_name;

	public ProductMainCategoryDto() {}

	public ProductMainCategoryDto(int id, String main_category_name) {
	    this.id = id;
	    this.main_category_name = main_category_name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMain_category_name() {
		return main_category_name;
	}

	public void setMain_category_name(String main_category_name) {
		this.main_category_name = main_category_name;
	}

	

}
