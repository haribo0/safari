package com.ja.safari.community.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ja.safari.community.service.PromotionReviewServiceImpl;
import com.ja.safari.dto.PromotionReviewLikeDto;
import com.ja.safari.dto.UserDto;

@RestController
@RequestMapping("/community/*")
public class RestPromotionReviewController {

	@Autowired
	private PromotionReviewServiceImpl promoReviewService;
	
	@RequestMapping("promotion/togglePromotionReviewLike")
	public Map<String, Object> togglePromotionReviewLike(PromotionReviewLikeDto params){
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("result", "success");
		
		return map;
	}
	
	@RequestMapping("promotion/promoReviewIsLiked")
	public Map<String, Object> promoReviewIsLiked(HttpSession session, PromotionReviewLikeDto params) {
		
		Map<String, Object> map = new HashMap<>();
		
		UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");
		
		if (sessionUser == null) {
			
			map.put("result", "fail");
			map.put("reason", "로그인되어있지 않습니다.");
			return map;
		}
		
		params.setUser_id(sessionUser.getId());
		
		map.put("result", "success");
		map.put("data", promoReviewService.promoReviewIsLiked(params));
		
		return map;
	}
	
	
	// total 공감
	@RequestMapping("promotion/getTotalPromoReviewLikeCount")
	public Map<String, Object> getTotalPromoReviewLikeCount (int reviewId){
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("result", "success");
		map.put("count", promoReviewService.getTotalPromoReviewLikeCount(reviewId));
		
		
		return map;
	}
	
	// 로그인 되어있는지 안되어있는지(공감하트)
	@RequestMapping("promotion/getMyId")
	public Map<String, Object> getMyId(HttpSession session){
		Map<String, Object> map = new HashMap<>();
		
		UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");

		if (sessionUser == null) {
			
			map.put("result", "fail");
			map.put("reason", "로그인되어있지 않습니다.");
			return map;
		} else {
			map.put("result", "success");
			map.put("userId", sessionUser.getId());
		}
		
		return map;
	}
}
