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
	
	@RequestMapping("dashboard") 
	public String dashboard(HttpSession session){
		
		CsEmpDto empUser = (CsEmpDto) session.getAttribute("empUser");
		if(empUser==null) return "redirect:./loginPage";
		
		return "cs/dashboard";
	}
	
	@RequestMapping("dashboardFetch") 
	public String dashboardFetch(HttpSession session){
		
		CsEmpDto empUser = (CsEmpDto) session.getAttribute("empUser");
		if(empUser==null) return "redirect:./loginPage";
		
		return "cs/dashboardFetch";
	}
	
	@RequestMapping("testPage") 
	public String testPage(){
		
		return "cs/test";
	}
	
	
	@RequestMapping("employees") 
	public String employees(HttpSession session){
		
		CsEmpDto empUser = (CsEmpDto) session.getAttribute("empUser");
		if(empUser==null) return "redirect:./loginPage";
		
		return "cs/employees";
	}
	
	
	@RequestMapping("inquiries") 
	public String inquiries(HttpSession session){
		
		CsEmpDto empUser = (CsEmpDto) session.getAttribute("empUser");
		if(empUser==null) return "redirect:./loginPage";
		
		return "cs/inquiries";
	}
	
	
	@RequestMapping("myInquiryDetail") 
	public String myInquiryDetail(HttpSession session, Integer id){
		
		CsEmpDto empUser = (CsEmpDto) session.getAttribute("empUser");
		if(empUser==null) return "redirect:./loginPage";
		
		
		
		return "cs/myInquiryDetail";
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
