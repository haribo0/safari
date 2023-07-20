package com.ja.safari.dto;

public class ProreviewRentalCategoryDto {
	private String sub_category_name;
	private String main_category_name;
	public ProreviewRentalCategoryDto() {
		super();
	}
	public ProreviewRentalCategoryDto(String sub_category_name, String main_category_name) {
		super();
		this.sub_category_name = sub_category_name;
		this.main_category_name = main_category_name;
	}
	public String getSub_category_name() {
		return sub_category_name;
	}
	public void setSub_category_name(String sub_category_name) {
		this.sub_category_name = sub_category_name;
	}
	public String getMain_category_name() {
		return main_category_name;
	}
	public void setMain_category_name(String main_category_name) {
		this.main_category_name = main_category_name;
	}
	
	
}
