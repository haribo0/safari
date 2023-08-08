package com.ja.safari.user.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.ja.safari.auction.service.AuctionServiceImpl;
import com.ja.safari.cs.service.CsServiceImpl;
import com.ja.safari.dto.PromotionReviewDto;
import com.ja.safari.dto.UserChargeCoinKakaoPayApproveDto;
import com.ja.safari.dto.UserDto;
import com.ja.safari.used.service.UsedServiceImpl;
import com.ja.safari.user.service.UserServiceImpl;

@Controller
@RequestMapping("/user/*")
public class UserController {
	
	@Autowired
	private UserServiceImpl userService;
	
	@Autowired
	private UsedServiceImpl usedService;
	
	@Autowired
	private AuctionServiceImpl auctionService;
	
	@Autowired
	private CsServiceImpl csService;
	

	/*
	 * 페이징처리 
	 */
	
	// sessionIntercepter를 위한 페이징
	@RequestMapping("loginRequired")
	public String loginRequired() {
		return null;
	}
	
	// 회원가입 페이징
	@RequestMapping("joinPage")
	public String joinPage() {
		
		
		return "/main/joinPage";
	}
	
	// 로그인
	@RequestMapping("loginPage")
	public String loginPage() {
		
		return "/main/loginPage";
	}
	
	
	// 로그인 페이지 테스트중 
	@RequestMapping("loginPage2")
	public String loginPage2() {
		
		return "/main/loginPage2";
	}
	
	
	// 로그인
	@RequestMapping("kakaoLogin")
	public String kakaoLogin(HttpSession session, String code, String error, String error_description, String state) {
		
		// System.out.println("kakaoLogin");
		
		if(code != null) {
			System.out.println(code);
			return "redirect:./kakaoLoginProcessPage?code="+code;
		}
		
		if(error != null) {
			System.out.println(error);
			return "redirect:./loginPage";
		}
		
		if(error_description != null) {
			System.out.println(error_description);
			return "redirect:./loginPage";
		}
		
		if(state != null) {
			System.out.println(state);
			return "redirect:./loginPage";
		}
		
		return "redirect:./loginPage";
	}
	
	// 로그인
	@RequestMapping("kakaoLoginProcessPage")
	public String kakaoLoginProcessPage(String code, Model model) {
		
		// System.out.println(code);
		model.addAttribute("code", code);
		
		return "/main/kakaoLoginProcess";
	}
	

	
	
	// 회원정보 수정 페이지
	@RequestMapping("modifyProfile") 
	public String modifyProfile(HttpSession session, Model model) {
		
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		if(sessionUser == null) {
			return "redirect:/user/loginPage";
		}
		
		model.addAttribute("userInfo", userService.selectUserDtoById(sessionUser.getId()));
		
		return "user/modifyProfile";
	}
	

	
	// 주소관리|마이페이지
	@RequestMapping("myAddressPage")
	public String myAddressPage(HttpSession session) {
		
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		if(sessionUser==null) {
			return "redirect:../user/loginPage";
		}
		
		return "user/myAddressPage";
	}
	
	// 대여주문리스트|마이페이지
	@RequestMapping("myOrderListPage")
	public String myOrderListPage(HttpSession session, Model model) {
		
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		if(sessionUser==null) {
			return "redirect:../user/loginPage";
		}
		
		List<Map<String, Object>> rentalOrderDtoList = userService.getRentalOrderedList(sessionUser.getId());
		
		model.addAttribute("rentalOrderDtoList",rentalOrderDtoList);
		
		return "/user/myRentalOrderListPage";
	}
	
	// 대여찜|마이페이지
	@RequestMapping("myRentalLikePage")
	public String myRentalLikePage(HttpSession session, Model model) {

		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		List<Map<String, Object>> rentalItemLikeList = userService.getRentalItemLikeList(sessionUser.getId());
		
		model.addAttribute("rentalItemLikeList",rentalItemLikeList);
		
		return "/user/myRentalLikePage";
	}
	
	// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	// 대여|코인페이지 (!    하리님한테 수정해도 되는지 말씀드리기 !)
	@RequestMapping("myCoinPage")
	public String myCoinPage (HttpSession session, Model model) {
		
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		if(sessionUser==null) {
			return "redirect:../user/loginPage";
		}
		
		model.addAttribute("chargeCoinHistoryList" ,userService.getCoinChargeHistoryList(sessionUser.getId()));
		model.addAttribute("coinTransactions", userService.getCoinUsageHistoryList(sessionUser.getId()));
		
		
		return "/user/myCoinPage";
	}
	// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	
	// 1대1문의 | 마이페이지
	@RequestMapping("myInquiryPage")
	public String myInquiryPage(HttpSession session, Model model) {
		
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		if(sessionUser==null) {
			return "redirect:../user/loginPage";
		}
		
		List<Map<String, Object>> rentalOrderDtoList = userService.getRentalOrderedList(sessionUser.getId());
		
		model.addAttribute("rentalOrderDtoList",rentalOrderDtoList);
		
		return "user/myInquiryPage";
	}
	
	// 1대1문의 | 마이페이지 - cs 
	@RequestMapping("myInquiryPostPage")
	public String myInquiryPostPage(HttpSession session, Model model) {
		
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		if(sessionUser==null) {
			return "redirect:../user/loginPage";
		}
		
		List<Map<String, Object>> rentalOrderDtoList = userService.getRentalOrderedList(sessionUser.getId());
		
		model.addAttribute("rentalOrderDtoList",rentalOrderDtoList);
		
		return "user/myInquiryPostPage";
	}
	
	// 1대1문의 상세보기 
	@RequestMapping("myInquiryDetail") 
	public String myInquiryDetail(HttpSession session, Model model, Integer id){
		
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		if(sessionUser==null) {
			return "redirect:../user/loginPage";
		}
		
		model.addAttribute("qna", csService.getQnaCombinedDtoById(id));
		model.addAttribute("isRated", csService.isQnaReplyRated(id));
		
		return "user/myInquiryDetail";
	}
	
	// 중고 -- 마이페이지 : 관심목록 
	@RequestMapping("wishList")
	public String wishList(HttpSession session, Model model) {
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		if(sessionUser==null) {
			return "redirect:./loginPage";
		}else {
			model.addAttribute("list", usedService.selectProductLikeByUserId(sessionUser.getId()));
			return "used/wishList";
		}
	}
	
	// 중고 -- 마이페이지 : 판매목록
	@RequestMapping("selectMySellList")
	public String selectMySellList(HttpSession session) {
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		if(sessionUser==null) {
			return "redirect:./loginPage";
		}else {
			return "used/mySellList";
		}
	}
	
	// 중고 -- 마이페이지 : 구매목록
		@RequestMapping("selectMyBuyList")
		public String selectMyBuyList(HttpSession session, Model model) {
			UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
			if(sessionUser==null) {
				return "redirect:./loginPage";
			}else {
				model.addAttribute("list", usedService.selectMyBuyListByUserId(sessionUser.getId()));
				return "used/myBuyList";
			}
		}
	
	/*
	 * 로직처리 
	 */
	
	// 회원가입 프로세스
	@RequestMapping("userJoinProcess")
	public String userJoinProcess(UserDto userDto, MultipartFile profileImageFile) {
		
		
		// 프사 저장 로직
		if (profileImageFile != null) {

			String rootFolder = "C:/auctionFiles/";

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
			String originalFileName = profileImageFile.getOriginalFilename(); // originalFileName : 사용자가 컴퓨터에 올리는 파일명
			String ext = originalFileName.substring(originalFileName.lastIndexOf(".")); // lastindexof: 뒤에서부터 .의 위치를 찾아서
																						// 숫자를 반환

			// 슬래시 주의할 것 기억하기
			String saveFileName = today + "/" + fileName + ext;

			try {
				// java.io.file 불러오기, 폴더를 포함한 파일명을 넣는다
				// 다른 이미지이지만 파일명이 같은 경우, 충돌을 피하려면
				profileImageFile.transferTo(new File(rootFolder + saveFileName));
			} catch (Exception e) {
				e.printStackTrace();
			}
			userDto.setProfile_img_link(saveFileName);

		}
	
		userService.joinUser(userDto);

		
		return "/main/loginPage";
	}
	
	// 로그인 프로세싱
	@RequestMapping("userLoginProcess")
	public String userLoginProcess(HttpSession session, UserDto userDto) {

		UserDto sessionUser = userService.loginUser(userDto);
		
		if(sessionUser == null) { 
			return "main/loginPage"; 
		}else{
			session.setAttribute("sessionUser", sessionUser);
			return "redirect:../main/mainPage";
		 }
		
	}
	
	
	// 로그아웃 
	@RequestMapping("userLogoutProcess")
	public String userLogoutProcess(HttpSession session, UserDto userDto) {
		
		session.invalidate();
		return "redirect:../main/mainPage";
	}
	
	
	//홍가현이 추가한 마이페이지
	@RequestMapping("myPage")
	public String myPage(HttpSession session) {
		UserDto sessionUser =  (UserDto)session.getAttribute("sessionUser");
		if(sessionUser==null) {
			return "redirect:../user/loginPage";
		}else {
			return "user/myPage";
		}
	}
	
	
	// 코인 충전 실패 
	@RequestMapping("chargeCoinFailed")
	public String paymentFailed(HttpSession session) {
		
		UserDto userDto = (UserDto) session.getAttribute("sessionUser");
		if(userDto == null) return "redirect:./loginPage"; 		
		
		return "user/chargeCoinFailed";
	}

	// 코인 충전 진행
	@RequestMapping("chargeCoinProcess")
	public String paymentProcess(HttpSession session, String pg_token) {
		
		UserDto userDto = (UserDto) session.getAttribute("sessionUser");
		if(userDto == null) return "redirect:/user/loginPage"; 		
		
	
		UserChargeCoinKakaoPayApproveDto userChargeCoinKakaoPayApproveDto = 
				(UserChargeCoinKakaoPayApproveDto) session.getAttribute("userChargeCoinkakaoPay");
		
		userChargeCoinKakaoPayApproveDto.setPg_token(pg_token);
		
		session.setAttribute("userChargeCoinkakaoPay", userChargeCoinKakaoPayApproveDto);
		

		return "user/chargeCoinProcess";
	}
	
	// 코인 충전 성공     
	@RequestMapping("chargeCoinSucceed")
	public String paymentSucceeded(HttpSession session, Model model, Integer id) {
		
		UserDto userDto = (UserDto) session.getAttribute("sessionUser");
		if(userDto == null) return "redirect:/user/loginPage"; 		
		
		session.removeAttribute("userChargeCoinkakaoPay");
		
		model.addAttribute("map", userService.getChargeCoinSuccessHistory(id));
		
		return "user/chargeCoinSucceed";
	}
	
	// 세연 마이페이지 - 커뮤니티 게시글모음 리스트
	@RequestMapping("myAllCommunityPostListPage")
	public String myAllCommunityPostListPage(Model model, HttpSession session, PromotionReviewDto promotionReviewDto) {

		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		
		if(sessionUser==null) {
			return "redirect:../user/loginPage";
		}else {
			
			int sessionId = 0;
			sessionId = sessionUser.getId();
			
			List<Map<String, Object>> pickByMyPost = userService.getPickByMyPost(sessionId);
			List<Map<String, Object>> helpByMyPost = userService.getHelpByMyPost(sessionId);
			List<Map<String, Object>> recruitByMyPost = userService.getRecruitByMyPost(sessionId);
			List<Map<String, Object>> questionByMyPost = userService.getQuestionByMyPost(sessionId);
			List<Map<String, Object>> proreviewByMyPost = userService.getProreviewByMyPost(sessionId);
			
			model.addAttribute("pickByMyPost", pickByMyPost);
			model.addAttribute("helpByMyPost", helpByMyPost);
			model.addAttribute("recruitByMyPost", recruitByMyPost);
			model.addAttribute("questionByMyPost", questionByMyPost);
			model.addAttribute("proreviewByMyPost", proreviewByMyPost);
			
			return "user/myAllCommunityPostListPage";
		}
		
	}
	

	// 세연 마이페이지 - 커뮤니티 좋아요모음 리스트
	@RequestMapping("myCommunityLikesListPage")
	public String myCommunityLikesListPage(HttpSession session, Model model) {
		
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		
		if(sessionUser==null) {
			return "redirect:../user/loginPage";
		}else {
			
			int sessionId = 0;
			sessionId = sessionUser.getId();
			
			List<Map<String, Object>> recruitByMyLikePost = userService.getRecruitByUserLikes(sessionId);
			List<Map<String, Object>> helpByMyLikePost = userService.getHelpByUserLikes(sessionId);
			List<Map<String, Object>> questionByMyLikePost = userService.getQuestionByUserLikes(sessionId);
			List<Map<String, Object>> pickByMyLikePost = userService.getPickByUserLikes(sessionId);
			List<Map<String, Object>> proreviewByMyLikePost = userService.getPromoReviewByUserLikes(sessionId);
			
			
			model.addAttribute("recruitByMyLikePost", recruitByMyLikePost);
			model.addAttribute("helpByMyLikePost", helpByMyLikePost);
			model.addAttribute("questionByMyLikePost", questionByMyLikePost);
			model.addAttribute("pickByMyLikePost", pickByMyLikePost);
			model.addAttribute("proreviewByMyLikePost", proreviewByMyLikePost);
			
			
			return "user/myCommunityLikesListPage";
		}
	
	}
	
}
