package com.ja.safari.used.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/used/*")
public class UsedController {
	
	// 중고 메인 페이지
	@RequestMapping("mainPage")
	public String main() {
		
		return "/used/mainPage";
	}

}
