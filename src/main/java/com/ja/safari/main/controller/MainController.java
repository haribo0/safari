package com.ja.safari.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main/*")
public class MainController {
	
	// 메인페이지 페이징
	@RequestMapping("mainPage")
	public String mainPage() {
		
		return "/main/mainPage";
	}
}
