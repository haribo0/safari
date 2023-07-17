package com.ja.safari.cs.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ja.safari.cs.service.CsServiceImpl;
import com.ja.safari.dto.CsEmpDto;

@Controller
@RequestMapping("/cs/*")
public class CsController {
	
	@Autowired
	private CsServiceImpl csService;
	
	
	/*
	 * 페이지
	 */
	
	@RequestMapping("mainPage") 
	public String mainPage(HttpSession session, Model model){
		
		CsEmpDto empUser = (CsEmpDto) session.getAttribute("empUser");
		if(empUser == null) return "redirect:./loginPage"; 	
		
		// 팀장 
		if(empUser.getMaster() > 0) return "redirect:./dashboard";
		
		// 사원 
//		model.addAttribute("lastAttendance", csService.getLastAttendanceLogByEmpId(empUser.getId()));
		model.addAttribute("workState", csService.getWorkStateByEmpId(empUser.getId()));
		
		return "cs/mainPage";
	}
	
	@RequestMapping("loginPage") 
	public String loginPage(){
		
		return "cs/loginPage";
	}
	
	@RequestMapping("registerPage") 
	public String registerPage(){
		
		return "cs/registerPage";
	}
	
	// 대시 보드 - 팀장용 
	@RequestMapping("dashboard") 
	public String dashboard(HttpSession session, Model model){
		
		CsEmpDto empUser = (CsEmpDto) session.getAttribute("empUser");
		if(empUser==null) return "redirect:./loginPage";
		
		// 실시간 채팅 직원별 별점 
		model.addAttribute("chatRatingList", csService.getEmpChatRatingList() );
		
		return "cs/dashboard2";
	}
	
	
	// 실시간 채팅 현황 - 팀장용 
	@RequestMapping("liveChatStatus") 
	public String liveChatStatus(HttpSession session){
		
		CsEmpDto empUser = (CsEmpDto) session.getAttribute("empUser");
		if(empUser==null) return "redirect:./loginPage";
		
		return "cs/liveChatStatus";
	}
	
	
	// 1대1문의 현황 - 팀장용 
	@RequestMapping("inquiryStatus") 
	public String inquiryStatus(HttpSession session){
		
		CsEmpDto empUser = (CsEmpDto) session.getAttribute("empUser");
		if(empUser==null) return "redirect:./loginPage";
		
		return "cs/inquiryStatus";
	}
	
	// 테스트용 - 안 씀 
	@RequestMapping("dashboardFetch") 
	public String dashboardFetch(HttpSession session){
		
		CsEmpDto empUser = (CsEmpDto) session.getAttribute("empUser");
		if(empUser==null) return "redirect:./loginPage";
		
		return "cs/dashboardFetch";
	}
	
	// 테스트 페이지 - 안 씀 
	@RequestMapping("testPage") 
	public String testPage(){
		
		return "cs/test";
	}
	
	// 직원 
	@RequestMapping("employees") 
	public String employees(HttpSession session){
		
		CsEmpDto empUser = (CsEmpDto) session.getAttribute("empUser");
		if(empUser==null) return "redirect:./loginPage";
		
		return "cs/employees";
	}
	
	// 1대1 문의 
	@RequestMapping("inquiries") 
	public String inquiries(HttpSession session){
		
		CsEmpDto empUser = (CsEmpDto) session.getAttribute("empUser");
		if(empUser==null) return "redirect:./loginPage";
		
		return "cs/inquiries";
	}

	// 실시간 문의 
	@RequestMapping("liveChat") 
	public String liveChat(HttpSession session){
		
		CsEmpDto empUser = (CsEmpDto) session.getAttribute("empUser");
		if(empUser==null) return "redirect:./loginPage";
		
		return "cs/liveChat";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	/*
	 * 프로세스
	 */
	
	
	@RequestMapping("loginProcess") 
	public String loginProcess(HttpSession session, CsEmpDto empDto){
		
		CsEmpDto empUser = csService.getEmpDtoByUserNameAndPw(empDto);
		
		if(empUser==null) return "redirect:./loginPage";
		
		session.setAttribute("empUser", empUser);
		
		return "redirect:./mainPage";
	}
	
	
	@RequestMapping("logoutProcess") 
	public String logoutProcess(HttpSession session){
		
		session.invalidate();
		
		return "redirect:./mainPage";
	}
	
	
	
	
	
	

}
