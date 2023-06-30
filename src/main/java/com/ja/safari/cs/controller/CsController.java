package com.ja.safari.cs.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public String mainPage(HttpSession session){
		
		CsEmpDto empUser = (CsEmpDto) session.getAttribute("empUser");
		if(empUser == null) return "redirect:./loginPage"; 	
		
		if(empUser.getMaster() > 0) return "redirect:./dashboard";
		
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
	public String dashboard(){
		
		return "cs/dashboard";
	}
	
	@RequestMapping("testPage") 
	public String testPage(){
		
		return "cs/test";
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
	
	
	
	
	
	

}
