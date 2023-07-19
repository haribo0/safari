package com.ja.safari.community.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ja.safari.community.service.QuestionServiceImpl;
import com.ja.safari.dto.QuestionLikeDto;
import com.ja.safari.dto.UserDto;

@RestController
@RequestMapping("/question/*")
public class RestQuestionController {

	@Autowired
	private QuestionServiceImpl questionService;
	
	//궁금해요 좋아요 통합
	@RequestMapping("toggleQuestionLike")
	public Map<String, Object> toggleQuestionLike(HttpSession session, QuestionLikeDto params){
		
	Map<String, Object> map = new HashMap<>();
	
	UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
	params.setUser_id(sessionUser.getId());
	
	questionService.toggleQuestionLike(params);
	
	map.put("result", "success");
	
	return map;
	}
	
	//궁금해요 좋아요 통합
	@RequestMapping("isQuestionLiked")
	public Map<String, Object> isQuestionLiked(HttpSession session, QuestionLikeDto params){
		
		Map<String, Object> map = new HashMap<>();
		
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		
		if(sessionUser == null) {
			
			return map;
		}
		
		params.setUser_id(sessionUser.getId());
		
		
		map.put("isQuestionLiked", questionService.isQuestionLiked(params));
		
		map.put("result", "success");
		
		return map;
	}
	
	//궁금해요 좋아요 통합
	@RequestMapping("getTotalQuestionLikeCount")
	public Map<String, Object> getTotalQuestionLikeCount(int question_id){
		
		Map<String, Object> map = new HashMap<>();
		map.put("result", "success");
		map.put("count", questionService.getTotalQuestionLike(question_id));
		
		return map;
	}
}
