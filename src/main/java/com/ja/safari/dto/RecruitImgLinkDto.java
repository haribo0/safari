package com.ja.safari.dto;

public class RecruitImgLinkDto {
	
	private int id;
	private int recruit_id;
	private String img_name;
	private String img_link;
	
	public RecruitImgLinkDto() {
		super();
	}

	public RecruitImgLinkDto(int id, int recruit_id, String img_name, String img_link) {
		super();
		this.id = id;
		this.recruit_id = recruit_id;
		this.img_name = img_name;
		this.img_link = img_link;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getRecruit_id() {
		return recruit_id;
	}

	public void setRecruit_id(int recruit_id) {
		this.recruit_id = recruit_id;
	}

	public String getImg_name() {
		return img_name;
	}

	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}

	public String getImg_link() {
		return img_link;
	}

	public void setImg_link(String img_link) {
		this.img_link = img_link;
	}

	@Override
	public String toString() {
		return "RecruitImgLinkDto [id=" + id + ", recruit_id=" + recruit_id + ", img_name=" + img_name + ", img_link="
				+ img_link + "]";
	}

	
	
	
}
