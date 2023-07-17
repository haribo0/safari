package com.ja.safari.dto;

public class PickShowCardDto {
	
	private String title;
	private int price;
	private int likeCount;
	private String product_img_link;
	
	public PickShowCardDto() {
	}

	public PickShowCardDto(String title, int price, int likeCount, String product_img_link) {
		this.title = title;
		this.price = price;
		this.likeCount = likeCount;
		this.product_img_link = product_img_link;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public String getProduct_img_link() {
		return product_img_link;
	}

	public void setProduct_img_link(String product_img_link) {
		this.product_img_link = product_img_link;
	}
	
	

}
