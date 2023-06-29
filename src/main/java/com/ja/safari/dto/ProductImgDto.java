package com.ja.safari.dto;

public class ProductImgDto {
	private int id;
	private int product_id;
	private String product_img_link;

	public ProductImgDto() {}

	public ProductImgDto(int id, int product_id, String product_img_link) {
	    this.id = id;
	    this.product_id = product_id;
	    this.product_img_link = product_img_link;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public String getProduct_img_link() {
		return product_img_link;
	}

	public void setProduct_img_link(String product_img_link) {
		this.product_img_link = product_img_link;
	}

	
}
