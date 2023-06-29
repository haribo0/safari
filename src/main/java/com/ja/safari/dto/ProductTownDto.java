package com.ja.safari.dto;

public class ProductTownDto {
	private int id;
	private int product_city_id;
	private String product_town_name;
	
	public ProductTownDto() {
		super();
	}
	
	public ProductTownDto(int id, int product_city_id, String product_town_name) {
		super();
		this.id = id;
		this.product_city_id = product_city_id;
		this.product_town_name = product_town_name;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getProduct_city_id() {
		return product_city_id;
	}
	public void setProduct_city_id(int product_city_id) {
		this.product_city_id = product_city_id;
	}
	public String getProduct_town_name() {
		return product_town_name;
	}
	public void setProduct_town_name(String product_town_name) {
		this.product_town_name = product_town_name;
	}
	
}
