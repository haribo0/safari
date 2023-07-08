package com.ja.safari.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ja.safari.cs.service.CsServiceImpl;
import com.ja.safari.dto.CsLiveChatDto;
import com.ja.safari.dto.CsLiveChatMsgDto;
import com.ja.safari.dto.CsQnaDto;
import com.ja.safari.dto.UserAddressDto;
import com.ja.safari.dto.UserDto;
import com.ja.safari.user.service.UserServiceImpl;

import oracle.net.jdbc.TNSAddress.AddressList;

@RestController
@RequestMapping("/user/*")
public class UserRestController {

	@Autowired
	private UserServiceImpl userService;
	
	@Autowired
	private CsServiceImpl csServiceImpl;

	// 사용자 로그인 확인
	@RequestMapping("getMyId")
	public Map<String, Object> getMyId(HttpSession session) {
		Map<String, Object> map = new HashMap<>();

		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");

		if (sessionUser == null) {
			map.put("result", "fail");
			map.put("reason", "로그인이 되어 있지 않습니다.");
		} else {
			map.put("result", "success");
			map.put("id", sessionUser.getId());
		}

		return map;
	}

	// 사용자 주소 추가
	@RequestMapping("addUserAddress")
	public Map<String, Object> addUserAddress(HttpSession session, UserAddressDto params) {
		Map<String, Object> map = new HashMap<String, Object>();

		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		params.setUser_id(sessionUser.getId());
		userService.addUserAddress(params);

		map.put("result", "success");
		return map;
	}

	// 사용자 주소 불러오기
	  @RequestMapping("getUserAddress") 
	  public Map<String, Object> getUserAddress(HttpSession session) {
		  Map<String, Object> map = new HashMap<String, Object>();
		  UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
	  
		  List<UserAddressDto> userAddressDtoList = userService.getUserAddressList(sessionUser.getId()); 
		  map.put("result", "success"); 
		  map.put("addressList",userAddressDtoList);
	  
	  
		  return map; 
	  }
	  
	  // 1대1문의 포스트 - RequestBody
	  @RequestMapping("postInquiry") 
	  public Map<String, Object> postInquiry(HttpSession session, @RequestBody CsQnaDto inquiry) {
		  
		  Map<String, Object> map = new HashMap<String, Object>();
		  UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		  if (sessionUser == null) {
			  map.put("result", "fail");
			  map.put("reason", "로그인이 되어 있지 않습니다.");
			  return map;
		  }
		  
		  System.out.println(inquiry.getQna_title());
		  System.out.println(inquiry.getQna_content());
		  
		  map.put("result", "success"); 
		  inquiry.setUser_id(sessionUser.getId());
		  // 담당 직원 배정 및 1대1문의 저장 
		  csServiceImpl.postInquiry(inquiry);
		  
		  return map; 
	  }
	  
	  // 1대1문의 리스트 가져오기 
	  @RequestMapping("getInquiryList") 
	  public Map<String, Object> getInquiryList(HttpSession session) {
		  
		  Map<String, Object> map = new HashMap<String, Object>();
		  UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		  if (sessionUser == null) {
			  map.put("result", "fail");
			  map.put("reason", "로그인이 되어 있지 않습니다.");
			  return map;
		  }
		  
		  map.put("result", "success"); 
		  map.put("list",  csServiceImpl.getInquiryListByUserId(sessionUser.getId())); 
		  
		  
		  return map; 
	  }
	  
	  // 실시간 문의 시작하기  
	  @RequestMapping("startLiveChat") 
	  public Map<String, Object> startLiveChat(HttpSession session, Integer categoryId) {
		  
		  Map<String, Object> map = new HashMap<String, Object>();
		  UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		  if (sessionUser == null) {
			  map.put("result", "fail");
			  map.put("reason", "로그인이 되어 있지 않습니다.");
			  return map;
		  }
		  
		  CsLiveChatDto csLiveChatDto = new CsLiveChatDto();
		  // 일단 카테고리와 유저 정보만 넣기 
		  // 담당 직원 배정은 서비스에서 
		  csLiveChatDto.setCategory_id(categoryId);
		  csLiveChatDto.setUser_id(sessionUser.getId());
		  
		  map.put("result", "success"); 
		  map.put("chatId", csServiceImpl.startLiveChat(csLiveChatDto)); 
		  
		  return map; 
	  }
	  
	  
	  // 실시간 문의 메세지 전송 (user)
	  @RequestMapping("sendLiveChatMsg") 
	  public Map<String, Object> sendLiveChatMsg(HttpSession session, String sendLiveChatMsg, Integer chatId) {
		  
		  Map<String, Object> map = new HashMap<String, Object>();
		  UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		  if (sessionUser == null) {
			  map.put("result", "fail");
			  map.put("reason", "로그인이 되어 있지 않습니다.");
			  return map;
		  }
		  
		  CsLiveChatMsgDto csLiveChatMsgDto = new CsLiveChatMsgDto();
		  // emp 0 or user 1
		  csLiveChatMsgDto.setSender(1);
		  csLiveChatMsgDto.setMsg(sendLiveChatMsg);
		  csLiveChatMsgDto.setChat_id(chatId);
		  
		  csServiceImpl.sendLiveChatMsg(csLiveChatMsgDto);
		  
		  map.put("result", "success"); 
		  
		  return map; 
	  }
	  
	  
	  // 실시간 문의 메세지 가져오기 
	  @RequestMapping("getLiveChatMsgList") 
	  public Map<String, Object> getLiveChatMsgList(HttpSession session, Integer chatId) {
		  
		  Map<String, Object> map = new HashMap<String, Object>();
		  UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		  if (sessionUser == null) {
			  map.put("result", "fail");
			  map.put("reason", "로그인이 되어 있지 않습니다.");
			  return map;
		  }
		  
		  map.put("result", "success"); 
		  map.put("list", csServiceImpl.getLiveChatMsgList(chatId) ); 
		  
		  return map; 
	  }
	  
	  
	  
	  
	 

}

