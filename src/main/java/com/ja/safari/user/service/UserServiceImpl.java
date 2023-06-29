package com.ja.safari.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.safari.dto.UserDto;
import com.ja.safari.user.mapper.UserSqlMapper;

@Service
public class UserServiceImpl {
	
	@Autowired
	private UserSqlMapper userSqlMapper;
	
	//회원가입
	public void joinUser(UserDto userDto) {
		userSqlMapper.insert(userDto);
	}
	
	//로그인
	public UserDto loginUser(UserDto userDto) {
		UserDto user = userSqlMapper.selectByIdAndPw(userDto);
		return user;
	}

}
