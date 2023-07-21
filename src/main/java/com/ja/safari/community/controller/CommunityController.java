package com.ja.safari.community.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ja.safari.community.service.PromotionReviewServiceImpl;
import com.ja.safari.dto.UserDto;

@Controller
@RequestMapping("/community/*")
public class CommunityController {

	@Autowired
	private PromotionReviewServiceImpl promotionReviewService;
	
	  // 커뮤니티 메인 페이지
	   @RequestMapping("mainPage")
	   public String main(Model model, HttpSession session) {
		   
//		   UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
//
//			int sessionId = 0;
//
//			if(sessionUser != null) {
//				sessionId = sessionUser.getId();
//			}
		   
	//	   List<Map<String, Object>> promoReviewList = promotionReviewService.getPromotionReviewList(sessionId);		
		   
		   
	//	   model.addAttribute("promoReviewList", promoReviewList);
		   
	      return "community/mainPage";
	   }

}