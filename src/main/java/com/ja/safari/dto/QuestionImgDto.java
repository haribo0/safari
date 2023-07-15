package com.ja.safari.dto;

public class QuestionImgDto {

	private int id;
	private int question_id;
	private String question_img_link;
	private String question_original_filename;
	public QuestionImgDto() {
		super();
	}
	public QuestionImgDto(int id, int question_id, String question_img_link, String question_original_filename) {
		super();
		this.id = id;
		this.question_id = question_id;
		this.question_img_link = question_img_link;
		this.question_original_filename = question_original_filename;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getQuestion_id() {
		return question_id;
	}
	public void setQuestion_id(int question_id) {
		this.question_id = question_id;
	}
	public String getQuestion_img_link() {
		return question_img_link;
	}
	public void setQuestion_img_link(String question_img_link) {
		this.question_img_link = question_img_link;
	}
	public String getQuestion_original_filename() {
		return question_original_filename;
	}
	public void setQuestion_original_filename(String question_original_filename) {
		this.question_original_filename = question_original_filename;
	}
	
	
}
