package com.ja.safari.dto;

public class UsedReviewRateCategoryDto {
	private int id;
	private String content;
	private String question;
	private String img_title;
	private String textarea_content;
	
	public UsedReviewRateCategoryDto() {
		super();
	}

	public UsedReviewRateCategoryDto(int id, String content, String question, String img_title, String textarea_content) {
		super();
		this.id = id;
		this.content = content;
		this.question = question;
		this.img_title = img_title;
		this.textarea_content = textarea_content;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getImg_title() {
		return img_title;
	}

	public void setImg_title(String img_title) {
		this.img_title = img_title;
	}

	public String getTextarea_content() {
		return textarea_content;
	}

	public void setTextarea_content(String textarea_content) {
		this.textarea_content = textarea_content;
	}
	
	
	
}
