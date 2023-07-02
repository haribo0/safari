package com.ja.safari.cs.controller;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ja.safari.cs.service.CsServiceImpl;
import com.ja.safari.dto.CsEmpDto;

@RestController
@RequestMapping("/cs/*")
public class CsRestController {

	@Autowired
	private CsServiceImpl csService;
	
	
	// 직원 리스트 조회 
	@RequestMapping("getEmployeeList")
	public  Map<String, Object> getEmployeeList(HttpSession session) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		CsEmpDto empUser = (CsEmpDto) session.getAttribute("empUser");
		if(empUser == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}
		
		map.put("result", "success");
		map.put("list", csService.getEmployeeList());
		
		return map;
	}
	
	// 직원 등록 프로세스 
	@RequestMapping("registerEmployeeProcess")
	public  Map<String, Object> registerEmployeeProcess(HttpSession session, CsEmpDto csEmpDto) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		CsEmpDto empUser = (CsEmpDto) session.getAttribute("empUser");
		if(empUser == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}
		
		csService.registerEmployee(csEmpDto);
		
		map.put("result", "success");
		
		return map;
	}
	
	@RequestMapping("changeSchedule")
	public  Map<String, Object> changeSchedule(HttpSession session, String[] days, Integer startTime, Integer endTime, Integer empId) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		CsEmpDto empUser = (CsEmpDto) session.getAttribute("empUser");
		if(empUser == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}
		
		if(days.length==0) {
			map.put("result", "fail");
			map.put("reason", "no days selected");
			return map;
		}
		
		for(String d:days) System.out.println(d);
		System.out.println(startTime);
		System.out.println(endTime);
		System.out.println(empId);
		
        LocalDate today = LocalDate.now();
        DayOfWeek dayOfWeek = today.getDayOfWeek();
        // The value of dayOfWeek will be in the enum DayOfWeek (MONDAY, TUESDAY, etc.)
        System.out.println("Today's day (using LocalDate): " + dayOfWeek);
		
		
		map.put("result", "success");
		
		return map;
	}
	
	
	
	
	
	
	
	
	
	
}
