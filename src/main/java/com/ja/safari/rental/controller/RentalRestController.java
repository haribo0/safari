package com.ja.safari.rental.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ja.safari.dto.RentalItemDto;
import com.ja.safari.dto.RentalItemLikeDto;
import com.ja.safari.dto.UserDto;
import com.ja.safari.rental.service.RentalServiceImpl;

@RestController
@RequestMapping("/rental/*")
public class RentalRestController {
	
	@Autowired
	RentalServiceImpl rentalService;
	
	@RequestMapping("isUserIdTaken")
	public Map<String, Object> isUserIdTaken(String userId) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("result", "success");
		map.put("isUserIdTaken", rentalService.isUserIdTaken(userId));
		
		return map;
	}
	
	// 렌탈 상품 아이템 좋아요
	@RequestMapping("toggleRentalItemLike")
	public Map<String, Object> toggleRentalItemLike(HttpSession session, RentalItemLikeDto params){
		Map<String, Object> map = new HashMap<>();
		
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		params.setUser_id(sessionUser.getId());
		rentalService.toggleRentalItemLike(params);
		
		map.put("result", "success");
		return map;
	}
	
	// 렌탈 상품 아이템 좋아요 다른 이용자 누른 갯수
	@RequestMapping("getTotalLikeCount")
	public Map<String, Object> getTotalLikeCount(int id) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("result", "success");
		map.put("count", rentalService.getTotalLike(id));
		return map;
	}
	
	// 로그인한 사용자가 좋아요 누름 리프레시
	@RequestMapping("isLiked")
	public Map<String, Object> isLiked(HttpSession session, RentalItemLikeDto params) {
		Map<String, Object> map = new HashMap<String, Object>();

		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		
		 if(sessionUser == null) {
			map.put("result", "fail");
			map.put("reason", "로그인 되어 있지 않습니다.");
			return map;
		 }
		 
		 params.setUser_id(sessionUser.getId());
		 
		 map.put("result", "success");
		 map.put("isLiked", rentalService.isLiked(params));
		return map;
	}
	
}
