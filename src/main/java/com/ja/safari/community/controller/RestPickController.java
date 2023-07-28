package com.ja.safari.community.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ja.safari.community.service.PickServiceImpl;
import com.ja.safari.dto.PickCommentDto;
import com.ja.safari.dto.PickLikeDto;
import com.ja.safari.dto.UserDto;
//import com.ja.safari.user.service.UserServiceImpl;

@RestController
@RequestMapping("/community/*")
public class RestPickController {

	@Autowired
	private PickServiceImpl pickService;
	
	//@Autowired
	//private UserServiceImpl userService;
	
	//골라줘요 ajax getMyId
	@RequestMapping("pick/getMyId") 
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
	
	//골라줘요 ajax 좋아요
	@RequestMapping("pick/toggleLike")
	public Map<String , Object> toggleLike(HttpSession session, PickLikeDto params){
		Map<String , Object> map = new HashMap<>();

		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		params.setUser_id(sessionUser.getId()); //?
		
		pickService.toggleLike(params);
		
		map.put("result", "success");
		
		return map;
	}
	
	@RequestMapping("pick/isLiked")
	public Map<String, Object> isLiked(HttpSession session, PickLikeDto params){
		Map<String , Object> map = new HashMap<>();
		
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		
		if(sessionUser == null) {
			map.put("result", "fail");
			map.put("reason", "로그인되어있지않습니다.");
			return map;
		}
		
		params.setUser_id(sessionUser.getId());
		
		map.put("result", "success");
		map.put("isLiked", pickService.isLiked(params));
		
		return map;
	}
	
	
	@RequestMapping("pick/getTotalLikeCount")
	public Map<String, Object> getTotalLikeCount(int pick_id){
		
		Map<String , Object> map = new HashMap<>();
		
		map.put("result", "success");
		map.put("count", pickService.getTotalLike(pick_id));
		
		return map; 
	}
	
	//AJAX 댓글
	@RequestMapping("pick/registerComment")
	public Map<String, Object> registerComment(HttpSession session, PickCommentDto params){
		Map<String , Object> map = new HashMap<>();
		
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		params.setUser_id(sessionUser.getId());
		
		pickService.registerComment(params);
		
		map.put("result", "success");
		return map;
	}
	
	@RequestMapping("pick/deleteComment")
	public Map<String, Object> deleteComment(int id){
		Map<String , Object> map = new HashMap<>();
		
		pickService.deleteComment(id);
		
		map.put("result", "success");
		return map;
	}
	
	@RequestMapping("pick/updateComment")
	public Map<String, Object> updateComment(PickCommentDto params){
		Map<String , Object> map = new HashMap<>();
		
		pickService.updateComment(params);
		
		map.put("result", "success");
		return map;
	}
	
	@RequestMapping("pick/getCommentList")
	public Map<String, Object> getCommentList(int pick_id){
		Map<String , Object> map = new HashMap<>();
		
		map.put("commentList", pickService.getCommentList(pick_id));
		
		map.put("result", "success");
		return map;
	}
	
}
