package com.ja.safari.user.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ja.safari.auction.service.AuctionServiceImpl;
import com.ja.safari.dto.UserDto;
import com.ja.safari.user.service.UserServiceImpl;

@Controller
@RequestMapping("/user/*")
public class UserController {
	
	@Autowired
	private UserServiceImpl userService;
	
	@Autowired
	private AuctionServiceImpl auctionService;
	

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
	
	// 주소관리|마이페이지
	@RequestMapping("myAddressPage")
	public String myAddressPage() {
		
		return "user/myAddressPage";
	}
	
	// 대여|마이페이지
	@RequestMapping("myOrderListPage")
	public String myOrderListPage(HttpSession session, Model model) {
		
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		
		List<Map<String, Object>> rentalOrderDtoList = userService.getRentalOrderedList(sessionUser.getId());
		
		model.addAttribute("rentalOrderDtoList",rentalOrderDtoList);
		
		return "/main/myOrderListPage";
	}
	
	// 대여|코인페이지
	@RequestMapping("myCoinPage")
	public String myCoinPage () {
		
		return "/user/myCoinPage";
	}
	
	// 1대1문의 | 마이페이지 - cs 
	@RequestMapping("myPageInquiries")
	public String myPageInquiries(HttpSession session, Model model) {
		
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		
		List<Map<String, Object>> rentalOrderDtoList = userService.getRentalOrderedList(sessionUser.getId());
		
		model.addAttribute("rentalOrderDtoList",rentalOrderDtoList);
		
		return "user/myPageQna";
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
	
	// 영인 마이페이지 - 경매 리스트
	@RequestMapping("auctionList")
	public String auctionList(Model model, HttpSession session) {
		
		UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");
		
		if (sessionUser == null) {
			return "/main/loginPage";
		} else {
			model.addAttribute("bidHistoryList", auctionService.getBidHistoryByUser(sessionUser.getId()));
			model.addAttribute("auctionHistoryList", auctionService.getAuctionUploadHistoryByUser(sessionUser.getId()));
			return "/auction/List";
		}
		
	}
	
	
	
	
	
	
}
