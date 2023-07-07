package com.ja.safari.dto;

public class ReviewRateSelectDto {
	private int id;
	private String content;
	private String question;

	public ReviewRateSelectDto() {}

	public ReviewRateSelectDto(int id, String content, String question) {
	    this.id = id;
	    this.content = content;
	    this.question = question;
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
}
