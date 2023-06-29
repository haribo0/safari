package com.ja.safari.dto;

public class ProductSubCategoryDto {
	private int id;
	private int product_main_category_id;
	private String sub_category_name;

	public ProductSubCategoryDto() {}

	public ProductSubCategoryDto(int id, int product_main_category_id, String sub_category_name) {
	    this.id = id;
	    this.product_main_category_id = product_main_category_id;
	    this.sub_category_name = sub_category_name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getProduct_main_category_id() {
		return product_main_category_id;
	}

	public void setProduct_main_category_id(int product_main_category_id) {
		this.product_main_category_id = product_main_category_id;
	}

	public String getSub_category_name() {
		return sub_category_name;
	}

	public void setSub_category_name(String sub_category_name) {
		this.sub_category_name = sub_category_name;
	}

	
}
