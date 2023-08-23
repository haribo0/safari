package com.ja.safari.main.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ja.safari.dto.UserDto;
import com.ja.safari.user.service.UserServiceImpl;

@Controller
@RequestMapping("/main/*")

public class MainController {
	
	@Autowired
	private UserServiceImpl userService;
	
	// 메인페이지 페이징
	@RequestMapping("mainPage")
	public String mainPage() {
		
		return "/main/mainPage";
	}
	// 메인페이지 페이징
	@RequestMapping("mainPage2")
	public String mainPage2() {
		
		return "/main/mainPage2";
	}
	
	// 테스트 로그인
	@RequestMapping("testLogin")
	public String testLogin(HttpSession session, UserDto params, String type) {
		
		params.setEmail("test@482.co.kr");
		params.setPw("hello482!");
		
		session.setAttribute("sessionUser", userService.selectTestUser(params));
		
		
		
		
		return "redirect:/main/mainPage2";
	}
}
