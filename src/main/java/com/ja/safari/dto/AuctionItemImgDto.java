package com.ja.safari.dto;

public class AuctionItemImgDto {
	private int id;
	private int auction_item_id;
	private String auction_item_img_link;
	public AuctionItemImgDto() {
	}
	public AuctionItemImgDto(int id, int auction_item_id, String auction_item_img_link) {
		this.id = id;
		this.auction_item_id = auction_item_id;
		this.auction_item_img_link = auction_item_img_link;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getAuction_item_id() {
		return auction_item_id;
	}
	public void setAuction_item_id(int auction_item_id) {
		this.auction_item_id = auction_item_id;
	}
	public String getAuction_item_img_link() {
		return auction_item_img_link;
	}
	public void setAuction_item_img_link(String auction_item_img_link) {
		this.auction_item_img_link = auction_item_img_link;
	}
}
