package com.ja.safari.dto;


public class KakaoUserInfo {
	
	private String id;
	private String nickname;
	private String email;
	
	public KakaoUserInfo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public KakaoUserInfo(String id, String nickname, String email) {
		super();
		this.id = id;
		this.nickname = nickname;
		this.email = email;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
		
	
	

}
