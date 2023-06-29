package com.ja.safari.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ja.safari.dto.UserDto;
import com.ja.safari.user.service.UserServiceImpl;

@Controller
@RequestMapping("/user/*")
public class UserController {
	
	@Autowired
	private UserServiceImpl userService;

	/*
	 * 페이징처리 
	 */
	
	// sessionIntercepter를 위한 페이징
	@RequestMapping("loginRequired")
	public String loginRequired() {
		return null;
	}
	
	// 회원가입 페이징
	@RequestMapping("joinPage")
	public String joinPage() {
		
		return "/main/joinPage";
	}
	
	// 로그인
	@RequestMapping("loginPage")
	public String loginPage() {
		
		return "/main/loginPage";
	}

	/*
	 * 로직처리 
	 */
	
	// 회원가입 프로세스
	@RequestMapping("userJoinProcess")
	public String userJoinProcess(UserDto userDto) {
		
		userService.joinUser(userDto);
		return "/main/loginPage";
	}
	
	// 로그인 프로세싱
	@RequestMapping("userLoginProcess")
	public String userLoginProcess(HttpSession session, UserDto userDto) {

		UserDto sessionUser = userService.loginUser(userDto);
		
		if(sessionUser == null) { 
			return "main/loginPage"; 
		}else{
			session.setAttribute("sessionUser", sessionUser);
			return "redirect:../main/mainPage";
		 }
		
	}
	
	
	// 로그아웃 
	@RequestMapping("userLogoutProcess")
	public String userLogoutProcess(HttpSession session, UserDto userDto) {
		
		session.invalidate();
		return "redirect:../main/mainPage";
	}
	
	
	
	
	
	
}
