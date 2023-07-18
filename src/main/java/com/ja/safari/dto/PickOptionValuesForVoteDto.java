package com.ja.safari.dto;

public class PickOptionValuesForVoteDto {

	private int pick_id;
	private int option_id;
	private int product_id;
	private String title;
	private int price;
	private int vote_cnt;
	private String img;
	private int product_zzim_count;
	public PickOptionValuesForVoteDto() {
	}
	public PickOptionValuesForVoteDto(int pick_id, int option_id, int product_id, String title, int price, int vote_cnt,
			String img, int product_zzim_count) {
		this.pick_id = pick_id;
		this.option_id = option_id;
		this.product_id = product_id;
		this.title = title;
		this.price = price;
		this.vote_cnt = vote_cnt;
		this.img = img;
		this.product_zzim_count = product_zzim_count;
	}
	public int getPick_id() {
		return pick_id;
	}
	public void setPick_id(int pick_id) {
		this.pick_id = pick_id;
	}
	public int getOption_id() {
		return option_id;
	}
	public void setOption_id(int option_id) {
		this.option_id = option_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
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
	public int getVote_cnt() {
		return vote_cnt;
	}
	public void setVote_cnt(int vote_cnt) {
		this.vote_cnt = vote_cnt;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getProduct_zzim_count() {
		return product_zzim_count;
	}
	public void setProduct_zzim_count(int product_zzim_count) {
		this.product_zzim_count = product_zzim_count;
	}
	
	
}
