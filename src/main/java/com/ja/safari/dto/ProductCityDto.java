package com.ja.safari.dto;

public class ProductCityDto {
	private int id;
	private String product_city_name;
	
	public ProductCityDto() {
		super();
	}
	
	public ProductCityDto(int id, String product_city_name) {
		super();
		this.id = id;
		this.product_city_name = product_city_name;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getProduct_city_name() {
		return product_city_name;
	}
	public void setProduct_city_name(String product_city_name) {
		this.product_city_name = product_city_name;
	}
	
}
