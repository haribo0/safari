package com.ja.safari.dto;

public class CsLiveChatCountResponseDto {
	
	private int chat_count;
	private int chat_ended_count;
	public CsLiveChatCountResponseDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CsLiveChatCountResponseDto(int chat_count, int chat_ended_count) {
		super();
		this.chat_count = chat_count;
		this.chat_ended_count = chat_ended_count;
	}
	public int getChat_count() {
		return chat_count;
	}
	public void setChat_count(int chat_count) {
		this.chat_count = chat_count;
	}
	public int getChat_ended_count() {
		return chat_ended_count;
	}
	public void setChat_ended_count(int chat_ended_count) {
		this.chat_ended_count = chat_ended_count;
	}
	
	

}
