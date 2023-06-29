package com.ja.safari.dto;

public class CommunityCategoryDto {

	private int id;
	private int community_category_id;
	public CommunityCategoryDto() {
		super();
	}
	public CommunityCategoryDto(int id, int community_category_id) {
		super();
		this.id = id;
		this.community_category_id = community_category_id;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCommunity_category_id() {
		return community_category_id;
	}
	public void setCommunity_category_id(int community_category_id) {
		this.community_category_id = community_category_id;
	}
	
	
}
