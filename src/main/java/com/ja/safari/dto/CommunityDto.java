package com.ja.safari.dto;

public class CommunityDto {
	
	private int id;
	private int user_id;
	private int community_category_id;
	public CommunityDto() {
		super();
	}
	
	
	public CommunityDto(int id, int user_id, int community_category_id) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.community_category_id = community_category_id;
	}


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getCommunity_category_id() {
		return community_category_id;
	}
	public void setCommunity_category_id(int community_category_id) {
		this.community_category_id = community_category_id;
	}
	
	
}
