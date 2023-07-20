package com.ja.safari.community.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ja.safari.community.service.HelpServiceImpl;
import com.ja.safari.dto.HelpCommentCompleteDto;
import com.ja.safari.dto.HelpCommentDto;
import com.ja.safari.dto.HelpLikeDto;
import com.ja.safari.dto.UserDto;

@RestController
@RequestMapping("/help/*")
public class RestHelpController {

	@Autowired
	private HelpServiceImpl helpService;
	
	
	@RequestMapping("acceptHelpCommentProcess")
	public Map<String, Object> acceptHelpCommentProcess(int help_comment_id, HelpCommentCompleteDto helpCommentCompleteDto){
		
		Map<String, Object> map = new HashMap<>();
		

		// 해주세요 미션완료 테이블 
		helpCommentCompleteDto.setHelp_comment_id(help_comment_id);

		// 매개변수에서 받아온 댓글 pk로 게시물 댓글 테이블에 있는 게시물 pk를 조회하기 위해서 사용
		HelpCommentDto helpCommentDto = helpService.getHelpCommentById(help_comment_id);

		// 데이터 insert
		helpService.acceptHelpComment(help_comment_id);
		
		// 댓글 상태 변경
		helpService.completeHelpComment(help_comment_id);

		helpService.changeCompleteHelp(helpCommentDto.getHelp_id());
		
		map.put("result", "success");
		
		return map;
	}
	
	
	//해주세요 좋아요 통합
	@RequestMapping("toggleHelpLike")
	public Map<String, Object> toggleHelpLike(HttpSession session, HelpLikeDto params){
		
		Map<String, Object> map = new HashMap<>();
		
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		params.setUser_id(sessionUser.getId());
		
		helpService.toggleHelpLike(params);
		
		map.put("result", "success");
		
		return map;
	}
	
	//해주세요 좋아요 통합
	@RequestMapping("isHelpLiked")
	public Map<String, Object> isHelpLiked(HttpSession session, HelpLikeDto params){
		
		Map<String, Object> map = new HashMap<>();
		
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		
		if(sessionUser == null) {
			
			return map;
		}
		
		params.setUser_id(sessionUser.getId());
		
		/*
		 * helpLikeDto.setHelp_id(help_id); helpLikeDto.setUser_id(sessionUser.getId());
		 */
		
		map.put("isHelpLiked", helpService.isHelpLiked(params));
		
		map.put("result", "success");
		//System.out.println(helpService.isHelpLiked(params));
		
		
		return map;
	}
	
	//해주세요 좋아요 통합
	@RequestMapping("getTotalHelpLikeCount")
	public Map<String, Object> getTotalHelpLikeCount(int help_id){
		
		Map<String, Object> map = new HashMap<>();
		map.put("result", "success");
		map.put("count", helpService.getTotalHelpLike(help_id));
		
		
		return map;
	}
	
	@RequestMapping("registerHelpComment")
	public Map<String, Object> registerHelpComment(HttpSession session, HelpCommentDto params){
		Map<String, Object> map = new HashMap<>();
		
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		params.setUser_id(sessionUser.getId());
		
		helpService.registerHelpComment(params);
		
		map.put("result", "success");
		
		return map;
	}
	
	@RequestMapping("deleteHelpComment")
	public Map<String, Object> deleteHelpComment(int id){
		Map<String, Object> map = new HashMap<>();
		
		helpService.deleteHelpComment(id);
		
		map.put("result", "success");
		
		return map;
	}
	
	
	@RequestMapping("updateHelpComment")
	public Map<String, Object> updateHelpComment(HelpCommentDto params){ 
		Map<String, Object> map = new HashMap<>();
		
		helpService.updateHelpComment(params);
		
		map.put("result", "success");
		
		return map;
	}
	
	//id: boardId
	@RequestMapping("getHelpCommentList")
	public Map<String, Object> getHelpCommentList(int help_id){ 
		Map<String, Object> map = new HashMap<>();
		
		map.put("helpCommentList", helpService.getHelpCommentList(help_id));
		
		map.put("result", "success");
		
		return map;
	}
}
