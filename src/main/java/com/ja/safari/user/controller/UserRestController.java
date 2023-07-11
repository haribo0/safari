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
import com.ja.safari.dto.CsQnaDto;
import com.ja.safari.dto.UserAddressDto;
import com.ja.safari.dto.UserChargeCoinKakaoPayApproveDto;
import com.ja.safari.dto.UserCoinDto;
import com.ja.safari.dto.UserDto;
import com.ja.safari.user.service.UserServiceImpl;

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
	  
	  // 회원의 현재 보유 코인 조회
	  @RequestMapping("getUserCoinBalance") 
	  public Map<String, Object> getUserCoinBalance(HttpSession session) {
		  
		  Map<String, Object> map = new HashMap<String, Object>();
		  
		  UserDto userDto = (UserDto) session.getAttribute("sessionUser");
			
			if(userDto == null) {
				map.put("result", "fail");
				map.put("reason", "로그인이 필요합니다.");
				return map;
			}
			
			map.put("result", "success");
			map.put("coins", userService.getUserCoinBalance(userDto.getId()));
			
			return map;
		  
	  }
	  

	  
	  
	  
	  // 코인 충전 pk 받아오기
	  @RequestMapping("getOnChargeCoinPk")
	  public Map<String, Object> getOnChargeCoinPk(HttpSession session) {
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			
			UserDto userDto = (UserDto) session.getAttribute("sessionUser");
			
			if(userDto == null) {
				map.put("result", "fail");
				map.put("reason", "로그인이 필요합니다.");
				return map;
			}
			
			map.put("partnerOrderId", userService.getOnChargeCoinPk());
			map.put("result", "success");
			
			return map;

	  }
	  
		// 코인 충전 준비 정보를 세션에 저장하기 
		@RequestMapping("saveChargeCoinTidToSession")
		public Map<String, Object> saveAuctionTidToSession(HttpSession session, UserChargeCoinKakaoPayApproveDto userChargeCoinKakaoPayApproveDto) {
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");
			if(sessionUser == null) {
				map.put("result", "fail");
				map.put("reason", "로그인이 필요합니다");
				return map;
			}
	
			session.setAttribute("userChargeCoinkakaoPay", userChargeCoinKakaoPayApproveDto);
			
			map.put("result", "success");

			return map;		
			
		}
	  
		// 카카오페이 코인 충전 정보 보내주기 
	  @RequestMapping("getOnChargeCoinKakaoPayReadyInfo")
		public  Map<String, Object> getOnChargeCoinKakaoPayReadyInfo(HttpSession session) {
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");
			if(sessionUser == null) {
				map.put("result", "fail");
				map.put("reason", "로그인이 필요합니다");
				return map;
			}
			
			UserChargeCoinKakaoPayApproveDto userChargeCoinKakaoPayApproveDto = 
							(UserChargeCoinKakaoPayApproveDto) session.getAttribute("userChargeCoinkakaoPay");

			map.put("result", "success");
			map.put("coinReadyInfo", userChargeCoinKakaoPayApproveDto);	
			
			return map;
		}
	  
	  
		// 코인 충전 후 저장
		@RequestMapping("saveChargeCoinData")
		public  Map<String, Object> saveChargeCoinData(HttpSession session, UserChargeCoinKakaoPayApproveDto userChargeCoinKakaoPayApproveDto,
			UserCoinDto userCoinDto) {
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			UserDto userDto = (UserDto) session.getAttribute("sessionUser");
			if(userDto == null) {
				map.put("result", "fail");
				map.put("reason", "login required");
				return map;
			}
			System.out.println(userChargeCoinKakaoPayApproveDto.getPartner_order_id());
			userCoinDto.setId(userChargeCoinKakaoPayApproveDto.getPartner_order_id());
			
			userCoinDto.setUser_id(userChargeCoinKakaoPayApproveDto.getPartner_user_id());
			userCoinDto.setTransaction_detail(userChargeCoinKakaoPayApproveDto.getItem_name());
			userCoinDto.setCoin_transaction(userChargeCoinKakaoPayApproveDto.getAmount());
			
			userService.insertUserCoin(userCoinDto);
			
			map.put("result", "success");
			
			return map;
		}
	  
	  
	  
}

