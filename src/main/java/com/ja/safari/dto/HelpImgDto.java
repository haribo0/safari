package com.ja.safari.dto;

public class HelpImgDto {

	private int id;
	private int help_id;
	private String help_img_link;
	private String help_original_filename;
	public HelpImgDto() {
		super();
	}
	public HelpImgDto(int id, int help_id, String help_img_link, String help_original_filename) {
		super();
		this.id = id;
		this.help_id = help_id;
		this.help_img_link = help_img_link;
		this.help_original_filename = help_original_filename;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getHelp_id() {
		return help_id;
	}
	public void setHelp_id(int help_id) {
		this.help_id = help_id;
	}
	public String getHelp_img_link() {
		return help_img_link;
	}
	public void setHelp_img_link(String help_img_link) {
		this.help_img_link = help_img_link;
	}
	public String getHelp_original_filename() {
		return help_original_filename;
	}
	public void setHelp_original_filename(String help_original_filename) {
		this.help_original_filename = help_original_filename;
	}
	
	
}
