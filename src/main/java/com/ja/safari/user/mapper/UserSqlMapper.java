package com.ja.safari.user.mapper;

import com.ja.safari.dto.UserDto;

public interface UserSqlMapper {

	//회원가입
	public void insert(UserDto uerDto);
	
	//로그인
	public UserDto selectByIdAndPw(UserDto uerDto);
	
	// 유저아이디로 유저 dto 찾아오기
	public UserDto selectUserDtoById(int id);
	
	
	
}
