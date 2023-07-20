package com.ja.safari.dto;

public class CsTodayStatsDto {
	
	private int qna_count;
	private int reply_count;
	private int chat_count;
	private int ended_chat_count;
	public CsTodayStatsDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CsTodayStatsDto(int qna_count, int reply_count, int chat_count, int ended_chat_count) {
		super();
		this.qna_count = qna_count;
		this.reply_count = reply_count;
		this.chat_count = chat_count;
		this.ended_chat_count = ended_chat_count;
	}
	public int getQna_count() {
		return qna_count;
	}
	public void setQna_count(int qna_count) {
		this.qna_count = qna_count;
	}
	public int getReply_count() {
		return reply_count;
	}
	public void setReply_count(int reply_count) {
		this.reply_count = reply_count;
	}
	public int getChat_count() {
		return chat_count;
	}
	public void setChat_count(int chat_count) {
		this.chat_count = chat_count;
	}
	public int getEnded_chat_count() {
		return ended_chat_count;
	}
	public void setEnded_chat_count(int ended_chat_count) {
		this.ended_chat_count = ended_chat_count;
	}
	
	


}
