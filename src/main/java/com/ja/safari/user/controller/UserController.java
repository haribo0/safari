package com.ja.safari.user.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ja.safari.auction.service.AuctionServiceImpl;
import com.ja.safari.cs.service.CsServiceImpl;
import com.ja.safari.dto.PromotionReviewDto;
import com.ja.safari.dto.UserChargeCoinKakaoPayApproveDto;
import com.ja.safari.dto.UserDto;
import com.ja.safari.user.service.UserServiceImpl;

@Controller
@RequestMapping("/user/*")
public class UserController {
	
	@Autowired
	private UserServiceImpl userService;
	
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
	
	// 대여|마이페이지
	@RequestMapping("myOrderListPage")
	public String myOrderListPage(HttpSession session, Model model) {
		
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		if(sessionUser==null) {
			return "redirect:../user/loginPage";
		}
		
		List<Map<String, Object>> rentalOrderDtoList = userService.getRentalOrderedList(sessionUser.getId());
		
		model.addAttribute("rentalOrderDtoList",rentalOrderDtoList);
		
		return "/main/myOrderListPage";
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
		
		return "user/myInquiryDetail";
	}
	
	
	
	
	
	/*
	 * 로직처리 
	 */
	
	// 회원가입 프로세스
	@RequestMapping("userJoinProcess")
	public String userJoinProcess(UserDto userDto) {
		
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
	
	// 세연 마이페이지 - 커뮤니티 게시글 리스트
	@RequestMapping("myAllCommunityPostListPage")
	public String myAllCommunityPostListPage(Model model, HttpSession session, PromotionReviewDto promotionReviewDto) {

		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		
		if(sessionUser==null) {
			return "redirect:../user/loginPage";
		}else {
			
			int sessionId = 0;
			sessionId = sessionUser.getId();
			List<Map<String, Object>> proreviewByMyPost = userService.getProreviewByMyPost(sessionId);
			
			
			model.addAttribute("proreviewByMyPost", proreviewByMyPost);
			
			return "user/myAllCommunityPostListPage";
		}
		
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

	// 세연 마이페이지 - 커뮤니티 좋아요 리스트
	@RequestMapping("myCommunityLikesListPage")
	public String myCommunityLikesListPage(HttpSession session) {
		
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		
		if(sessionUser==null) {
			return "redirect:../user/loginPage";
		}else {
			return "user/myCommunityLikesListPage";
		}
	
	}
	
	// 세연 마이페이지 - (임시) 리워드 찜 리스트 
	@RequestMapping("rewardLikesListPage")
	public String rewardLikesListPage(HttpSession session) {
		
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		
		if(sessionUser==null) {
			return "redirect:../user/loginPage";
		}else {
			return "user/rewardLikesListPage";
		}
	}
}
