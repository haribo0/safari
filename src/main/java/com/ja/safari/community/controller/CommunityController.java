package com.ja.safari.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/community/*")
public class CommunityController {

	
	  // 커뮤니티 메인 페이지
	   @RequestMapping("mainPage")
	   public String main() {
	      
	      return "community/mainPage";
	   }


}