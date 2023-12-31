package com.ja.safari.user.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ja.safari.cs.service.CsServiceImpl;
import com.ja.safari.dto.CsLiveChatDto;
import com.ja.safari.dto.CsLiveChatMsgDto;
import com.ja.safari.dto.CsLiveChatRating;
import com.ja.safari.dto.CsQnaDto;
import com.ja.safari.dto.CsQnaRating;
import com.ja.safari.dto.KakaoUserInfo;
import com.ja.safari.dto.RentalItemReturnDto;
import com.ja.safari.dto.UserAddressDto;
import com.ja.safari.dto.UserChargeCoinKakaoPayApproveDto;
import com.ja.safari.dto.UserCoinDto;
import com.ja.safari.dto.UserDto;
import com.ja.safari.rental.service.RentalBusinessServiceImpl;
import com.ja.safari.rental.service.RentalServiceImpl;
import com.ja.safari.used.service.UsedServiceImpl;
import com.ja.safari.user.service.UserServiceImpl;

@RestController
@RequestMapping("/user/*")
public class UserRestController {

	@Autowired
	private UserServiceImpl userService;
	
	@Autowired
	private CsServiceImpl csServiceImpl;
	
	@Autowired
	private UsedServiceImpl usedService;
	
	@Autowired
	private RentalServiceImpl rentalService;
	
	@Autowired
	private RentalBusinessServiceImpl rentalBusinessService;
	
	
	
	// 사용자 로그인
	@RequestMapping("loginProcess")
	public Map<String, Object> loginProcess(UserDto userDto, HttpSession session) {
		
		Map<String, Object> map = new HashMap<>();
		
	   if (userService.loginUser(userDto) != null) {
		   session.setAttribute("sessionUser", userService.loginUser(userDto));
		   map.put("result", "success");
	   } else {
		   map.put("result", "fail");
	   }
		return map;
		
	}

	
	// 카카오로그인 유저 정보 가져오기  
	@RequestMapping("saveKakaoUser")
	public Map<String, Object> saveKakaoLoginToken(KakaoUserInfo kakaoUserInfo, HttpSession session) {
		
		Map<String, Object> map = new HashMap<>();
		
		UserDto userDto = new UserDto();
		userDto.setEmail(kakaoUserInfo.getId());
		userDto.setNickname(kakaoUserInfo.getNickname());
		
		UserDto sessionUser = userService.kakaoLogin(userDto);
		
		session.setAttribute("sessionUser", sessionUser);
		
		map.put("result", "success");
			
		return map;
	}
	
	

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
			map.put("nickname", sessionUser.getNickname());
		}

		return map;
	}
	
	
	
	// 아이디 중복 체크
	@RequestMapping("existsUserId") 
	public Map<String, Object> existsUserId(String email)  {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		boolean exists = userService.existsUserId(email);
		
		map.put("exists", exists);
		
		return map;
	}
	
	// 닉네임 중복 체크
	@RequestMapping("existsNickname")
	public Map<String, Object> existsNickname(String nickname) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		boolean exists = userService.existsNickname(nickname);
		
		map.put("exists", exists);
		
		return map;
	
	}
	
	// 프사 조회
	@RequestMapping("getUserProfileImage")
	public Map<String, Object> getUserProfileImage(HttpSession session) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		
		if (sessionUser == null) {
			map.put("result", "fail");
		} else {
			map.put("profile_img_link", sessionUser.getProfile_img_link());
		}
		
		return map;
	}
	
	
	// 수정 페이지 접속 이전 비밀번호 체크
	@RequestMapping("checkPasswordProcess")
	public Map<String, Object> checkPasswordProcess(HttpSession session) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		
		if (sessionUser == null) {
			map.put("result", "fail");
		} else {
			map.put("userPw", userService.checkUserPw(sessionUser.getId()));
		}
		
		return map;
	}
	
	// 아이디 찾기
	@RequestMapping("findIdForEmailAndPhone") 
	public Map<String, Object> findIdForEmailAndPhone(UserDto userDto) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("findUserIdCount", userService.findUserIdCount(userDto));
		map.put("findUserId", userService.findUserId(userDto));
		
		return map;
	}
	
	// 비밀번호 찾기
	@RequestMapping("findPw") 
	public Map<String, Object> findPw(HttpSession session, UserDto userDto) {
		
		// 닉네임을 이용하여 pk를 불러오고 세션에 저장
		UserDto findUser = userService.findUserPkForNickname(userDto);
		session.setAttribute("findUserPk", findUser);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("findUserPwCount", userService.findUserPwCount(userDto));

		return map;
	}	
	
	// 비밀번호 찾기 - 변경
	@RequestMapping("renewUserPw")
	public Map<String, Object> renewUserPw(HttpSession session, UserDto userDto) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		// pk 세션 받아오기
		UserDto userPk = (UserDto) session.getAttribute("findUserPk");
		userDto.setId(userPk.getId());
		
		userService.renewUserPw(userDto);
		
		// 세션 remove
		session.removeAttribute("findUserPk");
		
		return map;
	}

	
	
	
	// 회원정보 수정
	@RequestMapping("modifyUserInfo")
	public Map<String, Object> modifyUserInfo(HttpSession session, UserDto userDto,
			@RequestParam(value = "profileImgFile", required = false)  MultipartFile profileImgFile) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		

		
		// 프사 저장 로직
		if (profileImgFile != null  && !profileImgFile.isEmpty()) {
			

			String rootFolder ="/Users/hailey/Documents/safariImg/";

			// 날짜별 폴더 생성 로직

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd"); // 날짜를 문자로 바꿔주는 역할
			String today = sdf.format(new Date()); // new Date(): 오늘 날짜 출력

			File targetFolder = new File(rootFolder + today); 

			if (!targetFolder.exists()) {
				targetFolder.mkdirs(); // 폴더 생성

			}

			// 저장 파일명 만들기. 핵심은 파일명 충돌 방지 = 랜덤 + 시간
			String fileName = UUID.randomUUID().toString();
			fileName += "_" + System.currentTimeMillis();

			// 확장자 추출
			String originalFileName = profileImgFile.getOriginalFilename(); // originalFileName : 사용자가 컴퓨터에 올리는 파일명
			String ext = originalFileName.substring(originalFileName.lastIndexOf(".")); // lastindexof: 뒤에서부터 .의 위치를 찾아서
																						// 숫자를 반환

			// 슬래시 주의할 것 기억하기
			String saveFileName = today + "/" + fileName + ext;

			try {
				// java.io.file 불러오기, 폴더를 포함한 파일명을 넣는다
				// 다른 이미지이지만 파일명이 같은 경우, 충돌을 피하려면
				profileImgFile.transferTo(new File(rootFolder + saveFileName));
			} catch (Exception e) {
				e.printStackTrace();
			}
			userDto.setId(sessionUser.getId());
			userDto.setProfile_img_link(saveFileName);
			userService.modifyUserInfo(userDto);

		} else {
			userDto.setId(sessionUser.getId());
			userService.modifyUserInfoNoImg(userDto);
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
		  
		  map.put("addressCount", userService.getUserAddressCount(sessionUser.getId()));
	  
	  
		  return map; 
	  }
	  
	// 주소 수정 - pk로 데이터 가져오기
	  @RequestMapping("getAddressInfoByPk")
	  public Map<String, Object> getAddressInfoByPk(HttpSession session, int id) {
		  
		  Map<String, Object> map = new HashMap<String, Object>();
		  UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		  
		  if (sessionUser == null) {
			  map.put("result", "fail");
			  map.put("reason", "로그인이 되어 있지 않습니다.");
			  return map;
		  }
		  
		  map.put("addrInfo", userService.getAddressInfoByPk(id));
		  
		  return map;
		  
	  }
	  
	  // 주소 수정
	  @RequestMapping("modifyUserAddress")
	  public Map<String, Object>  modifyUserAddress(HttpSession session, UserAddressDto params) {
		  
		  Map<String, Object> map = new HashMap<String, Object>();	  
		  UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		  
		  if (sessionUser == null) {
			  map.put("result", "fail");
			  map.put("reason", "로그인이 되어 있지 않습니다.");
			  return map;
		  }
		  
			params.setUser_id(sessionUser.getId());

			userService.modifyUserAddress(params);
			
		
			
			map.put("result", "success");
		   return map;
		  
	  }
	  
	  // 주소 삭제
	  @RequestMapping("removeUserAddress")
	  public Map<String, Object>  removeUserAddress(HttpSession session, int id) {
		  
		  Map<String, Object> map = new HashMap<String, Object>();	  
		  UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		  
		  if (sessionUser == null) {
			  map.put("result", "fail");
			  map.put("reason", "로그인이 되어 있지 않습니다.");
			  return map;
		  }
		  
		   userService.removeUserAddress(id);
			
			map.put("result", "success");
			
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

	  // 1대1문의 답변 후기 저장  
	  @RequestMapping("saveQnaReplyRating") 
	  public Map<String, Object> saveQnaReplyRating(HttpSession session, CsQnaRating csQnaRating) {
		  
		  Map<String, Object> map = new HashMap<String, Object>();
		  UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		  if (sessionUser == null) {
			  map.put("result", "fail");
			  map.put("reason", "로그인이 되어 있지 않습니다.");
			  return map;
		  }
		  
		  csServiceImpl.saveQnaReplyRating(csQnaRating);
		  
		  map.put("result", "success"); 
		  
		  return map; 
	  }
	  
	  // 실시간 문의 후기 저장  
	  @RequestMapping("saveLiveChatRating") 
	  public Map<String, Object> saveQnaReplyRating(HttpSession session, CsLiveChatRating liveChatRating) {
		  
		  Map<String, Object> map = new HashMap<String, Object>();
		  UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		  if (sessionUser == null) {
			  map.put("result", "fail");
			  map.put("reason", "로그인이 되어 있지 않습니다.");
			  return map;
		  }
		  
		  csServiceImpl.saveLiveChatRating(liveChatRating);
		  
		  map.put("result", "success"); 
		  
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
		  map.put("list", csServiceImpl.getLiveChatMsgList(chatId)); 
		  map.put("isChatEnded", csServiceImpl.isChatEnded(chatId)); 
		  map.put("emp", csServiceImpl.getEmpNicknameByChatId(chatId)); 
		  // 읽음 처리 
		  csServiceImpl.markMsgAsReadByUser(chatId);
		  
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
		
		
		// 회원의 코인 충전, 사용 내역 확인
		@RequestMapping("getCoinUsageHistory")
		public  Map<String, Object> getCoinUsageHistory(String type, HttpSession session) {
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			UserDto userDto = (UserDto) session.getAttribute("sessionUser");
			
			if(userDto == null) {
				map.put("result", "fail");
				map.put("reason", "login required");
				return map;
			}

			   List<UserCoinDto> coinHistoryList;
			   
			    if (type.equals("all")) {
			        coinHistoryList = userService.getUserCoinAllHistoryList(userDto.getId());
			    } else if (type.equals("charge")) {
			        coinHistoryList = userService.getCoinChargeHistoryList(userDto.getId());
			    } else {
			        coinHistoryList = userService.getCoinUsageHistoryList(userDto.getId());
			    }
			    
			    map.put("coinHistoryCount", userService.getUserCoinAllHistoryCount(userDto.getId()));
			    
			    map.put("coinHistoryList", coinHistoryList);
			    
			    return map;

		}
		
	  // 마이페이지 - 중고 - 판매내역 
	  @RequestMapping("getMySellListByStatus")
	  public Map<String, Object> getMySellListByStatus(HttpSession session, Integer statusId){
		  Map<String, Object> map = new HashMap<String, Object>();
		  UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");
		  if(sessionUser == null) {
			  map.put("result", "fail");
			  map.put("reason", "login required");
			  return map;
		  }else {
			  map.put("list", usedService.selectMySellList(sessionUser.getId(), statusId));
			  map.put("result", "success");
			  return map;
		  }
	  }
	  
	  // 마이페이지 - 중고 - 판매내역 - 예약중->예약취소 변경 
	  @RequestMapping("productRequestStatusCancelByProduct")
	  public Map<String, Object> productRequestStatusCancelByProduct(HttpSession session, Integer productId){
		  Map<String, Object> map = new HashMap<String, Object>();
		  UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");
		  if(sessionUser == null) {
			  map.put("result", "fail");
			  map.put("reason", "login required");
			  return map;
		  }else {
			  usedService.updateProductRequestStatusByproductId(productId);
			  map.put("result", "success");
			  return map;
		  }
	  }
	  
	  // 렌탈 반납 정보 
	  @RequestMapping("getRentalReturnDtoByOrderId")
	  public Map<String, Object> getRentalReturnDtoByOrderId(HttpSession session, Integer orderId){
		  Map<String, Object> map = new HashMap<String, Object>();
		  UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");
		  
		  RentalItemReturnDto rentalItemReturnDto = rentalBusinessService.getItemReturnDtoByOrderId(orderId);
		  
		  if(sessionUser == null) {
			  map.put("result", "fail");
			  map.put("reason", "login required");
			  return map;
		  } else {
			  
			  map.put("result", "success");
			  map.put("returnDto", rentalItemReturnDto);
			  map.put("returnExtraCharge", null);

			  if(rentalItemReturnDto!=null) {
				  map.put("returnExtraCharge", rentalBusinessService.getRentalReturnExtraCharges(rentalItemReturnDto.getId()));
			  }
			  
			  return map;
		  }
	  }
	 
	  
	  
	  
}

