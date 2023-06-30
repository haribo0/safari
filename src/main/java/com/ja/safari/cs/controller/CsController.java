package com.ja.safari.cs.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ja.safari.cs.service.CsServiceImpl;

@Controller
@RequestMapping("/cs/*")
public class CsController {
	
	@Autowired
	private CsServiceImpl csService;
	
	
	
	@RequestMapping("mainPage") 
	public String mainPage(HttpSession session){
		
		
		
		return "mainPage";
	}
	
	
	

}
