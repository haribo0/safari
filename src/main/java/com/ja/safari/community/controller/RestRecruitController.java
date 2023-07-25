package com.ja.safari.community.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ja.safari.community.service.RecruitServiceImpl;
import com.ja.safari.dto.RecruitLikeDto;
import com.ja.safari.dto.UserDto;
//import com.ja.safari.user.service.UserServiceImpl;

@RestController
@RequestMapping("/community/*")
public class RestRecruitController {

	@Autowired
	private RecruitServiceImpl recruitService;
	
	//@Autowired
	//private UserServiceImpl userService;
	
	//구인구직 ajax getMyId
	@RequestMapping("recruit/getMyId") //이거 망해서 안씀 
	public Map<String, Object> getMyId(HttpSession session) {
		
		Map<String,Object> map = new HashMap<>();
		
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		
		if(sessionUser == null) {
			map.put("result", "fail");
			map.put("reason", "로그인되어있지않습니다.");
		}else {
			map.put("result", "success");
			map.put("id", sessionUser.getId());
		}
		
		return map;
	}
	
	//구인구직 ajax 좋아요
	@RequestMapping("recruit/toggleLike")
	public Map<String , Object> toggleLike(HttpSession session, RecruitLikeDto params){
		Map<String , Object> map = new HashMap<>();

		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		params.setUser_id(sessionUser.getId()); //?
		
		recruitService.toggleLike(params);
		
		map.put("result", "success");
		
		return map;
	}
	
	@RequestMapping("recruit/isLiked")
	public Map<String, Object> isLiked(HttpSession session, RecruitLikeDto params){
		Map<String , Object> map = new HashMap<>();
		
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		
		if(sessionUser == null) {
			map.put("result", "fail");
			map.put("reason", "로그인되어있지않습니다.");
			return map;
		}
		
		params.setUser_id(sessionUser.getId());
		
		map.put("result", "success");
		map.put("isLiked", recruitService.isLiked(params));
		
		return map;
	}
	
	
	@RequestMapping("recruit/getTotalLikeCount")
	public Map<String, Object> getTotalLikeCount(int recruit_id){
		
		Map<String , Object> map = new HashMap<>();
		
		map.put("result", "success");
		map.put("count", recruitService.getTotalLike(recruit_id));
		
		return map; 
	}
	
	
	
}
