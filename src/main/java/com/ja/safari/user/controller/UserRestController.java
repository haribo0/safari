package com.ja.safari.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ja.safari.dto.UserAddressDto;
import com.ja.safari.dto.UserDto;
import com.ja.safari.user.service.UserServiceImpl;

import oracle.net.jdbc.TNSAddress.AddressList;

@RestController
@RequestMapping("/user/*")
public class UserRestController {

	@Autowired
	private UserServiceImpl userService;

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
	 

}

