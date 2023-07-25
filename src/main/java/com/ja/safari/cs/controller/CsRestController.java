package com.ja.safari.cs.controller;

import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ja.safari.cs.service.CsServiceImpl;
import com.ja.safari.dto.CsEmpDto;
import com.ja.safari.dto.CsLiveChatMsgDto;
import com.ja.safari.dto.CsQnaDto;
import com.ja.safari.dto.UserDto;

@RestController
@RequestMapping("/cs/*")
public class CsRestController {

	@Autowired
	private CsServiceImpl csService;
	
	
	// 직원 리스트 조회 
	@RequestMapping("login")
	public  Map<String, Object> login(HttpSession session, CsEmpDto empDto) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		CsEmpDto empUser = csService.getEmpDtoByUserNameAndPw(empDto);
		
		if (empUser != null) {
		   session.setAttribute("empUser", empUser);
		   map.put("result", "success");
	   } else {
		   map.put("result", "fail");
	   }
		
		return map;
	}
	
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
	
	
	// 직원 출근
	@RequestMapping("startWorking")
	public  Map<String, Object> startWorking(HttpSession session) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		CsEmpDto empUser = (CsEmpDto) session.getAttribute("empUser");
		if(empUser == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}
		
		csService.startWorking(empUser.getId());
		
		map.put("result", "success");
		
		return map;
	}
	
	// 직원 퇴근 
	@RequestMapping("stopWorking")
	public  Map<String, Object> stopWorking(HttpSession session) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		CsEmpDto empUser = (CsEmpDto) session.getAttribute("empUser");
		if(empUser == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}
		
		csService.stopWorking(empUser.getId());
		
		map.put("result", "success");
		
		return map;
	}
	
	
	// 직원 근무 상태
	@RequestMapping("getWorkStateByEmpId")
	public  Map<String, Object> getWorkStateByEmpId(HttpSession session) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		CsEmpDto empUser = (CsEmpDto) session.getAttribute("empUser");
		if(empUser == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}
		
		map.put("result", "success");
		map.put("workState", csService.getWorkStateByEmpId(empUser.getId()));
		
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
	
	// 직원아이디로 문의 내역 가져오기 + 처리되지 않은 문의 개수 
	@RequestMapping("getInquiryListByEmpId")
	public  Map<String, Object> getInquiryListByEmpId(HttpSession session) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		CsEmpDto empUser = (CsEmpDto) session.getAttribute("empUser");
		if(empUser == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}
		
		map.put("result", "success");
		map.put("list", csService.getInquiryListByEmpId(empUser.getId()));
		map.put("count", csService.getUnansweredInquiryCount(empUser.getId()));
		
		return map;
	}
	
	// 문의 내역 1개 가져오기
	@RequestMapping("getInquirDetailById")
	public  Map<String, Object> getInquirDetailById(HttpSession session, Integer id) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		CsEmpDto empUser = (CsEmpDto) session.getAttribute("empUser");
		if(empUser == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}
		
		
		map.put("result", "success");
		map.put("qna", csService.getQnaCombinedDtoById(id));
		
		return map;
	}
	
	
	// 문의 답글 저장 
	@RequestMapping("saveQnaReply")
	public  Map<String, Object> saveQnaReply(HttpSession session, CsQnaDto qnaDto) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		CsEmpDto empUser = (CsEmpDto) session.getAttribute("empUser");
		if(empUser == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}
		
		csService.saveQnaReply(qnaDto);
		
		map.put("result", "success");
		
		return map;
	}
	
	
	
	// 직원아이디로 실시간 문의 채팅방 리스트  가져오기 + 처리되지 않은 문의 개수 
	@RequestMapping("getLiveChatList")
	public  Map<String, Object> getLiveChatList(HttpSession session) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		CsEmpDto empUser = (CsEmpDto) session.getAttribute("empUser");
		if(empUser == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}
		
		map.put("result", "success");
		map.put("list", csService.getCsChatResponseDtoList2ByEmpId(empUser.getId()));
		map.put("count", csService.getUnfinishedChatCountByEmpId(empUser.getId()));
		
		return map;
	}
	
	// 직원아이디로 실시간 문의 채팅방 리스트  가져오기 + 처리되지 않은 문의 개수 
	@RequestMapping("getLiveChatList2")
	public  Map<String, Object> getLiveChatList2(HttpSession session) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		CsEmpDto empUser = (CsEmpDto) session.getAttribute("empUser");
		if(empUser == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}
		
		map.put("result", "success");
		map.put("list", csService.getLiveChatListByEmpId(empUser.getId()));
		map.put("count", csService.getUnfinishedChatCountByEmpId(empUser.getId()));
		
		return map;
	}
	
	// 직원아이디로 실시간 문의 채팅방 리스트  가져오기 + 처리되지 않은 문의 개수 
	@RequestMapping("getMsgListByChatId")
	public  Map<String, Object> getMsgListByChatId(HttpSession session, Integer chatId) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		CsEmpDto empUser = (CsEmpDto) session.getAttribute("empUser");
		if(empUser == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}
		
		// 읽음 처리 
		csService.markMsgAsReadByEmp(chatId);
		
		map.put("result", "success");
		map.put("list", csService.getMsgListByChatId(empUser.getId()));
		
		return map;
	}

	// 직원 메세지 읽음 처리  
	@RequestMapping("markMsgAsRead")
	public  Map<String, Object> markMsgAsRead(HttpSession session, Integer chatId) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		CsEmpDto empUser = (CsEmpDto) session.getAttribute("empUser");
		if(empUser == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}
		
		csService.markMsgAsReadByEmp(chatId);
		
		map.put("result", "success");
		
		return map;
	}
	
	// 직원 메세지 저장  
	@RequestMapping("saveChatMsg")
	public  Map<String, Object> saveChatMsg(HttpSession session, CsLiveChatMsgDto chatMsgDto) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		CsEmpDto empUser = (CsEmpDto) session.getAttribute("empUser");
		if(empUser == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}
		
		chatMsgDto.setSender(0);
		csService.saveChatMsg(chatMsgDto);
		
		map.put("result", "success");
		
		return map;
	}
	
	// 메세지 새로고침   
	@RequestMapping("reloadChatMsgByChatId")
	public  Map<String, Object> reloadChatMsgByChatId(HttpSession session, Integer chatId) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		CsEmpDto empUser = (CsEmpDto) session.getAttribute("empUser");
		if(empUser == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}
		
		map.put("result", "success");
		map.put("list", csService.getMsgListByChatId(chatId));
		map.put("isChatEnded", csService.isChatEnded(chatId)); 
		map.put("user", csService.getUserDtoByChatId(chatId)); 

		return map;
	}
	
	
	// 실시간 문의 종료   
	@RequestMapping("endLiveChatById")
	public  Map<String, Object> endLiveChatById(HttpSession session, Integer chatId) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		CsEmpDto empUser = (CsEmpDto) session.getAttribute("empUser");
		if(empUser == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}
		
		csService.endLiveChatById(chatId);
		
		map.put("result", "success");
		
		return map;
	}
	
	// 대시보드 그래프 // 주간 직원 업무량 데이터 가져오기 
	@RequestMapping("getWeeklyChartData")
	public  Map<String, Object> getWeeklyChartData(HttpSession session) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		CsEmpDto empUser = (CsEmpDto) session.getAttribute("empUser");
		if(empUser == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}
		
		map.put("result", "success");
		map.put("list1", csService.getWeeklyEmpWorkCountList());
		map.put("list2", csService.getWeeklyEmpTaskCountList());
		
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
		
		csService.changeSchedule(days, startTime, endTime, empId);
		
        LocalDate today = LocalDate.now();
        DayOfWeek dayOfWeek = today.getDayOfWeek();
        // The value of dayOfWeek will be in the enum DayOfWeek (MONDAY, TUESDAY, etc.)
        System.out.println("Today's day (using LocalDate): " + dayOfWeek);
        System.out.println("Today's day in int: " + dayOfWeek.getValue());
		
		
		map.put("result", "success");
		
		return map;
	}
	
	// 스케줄 가져오기 - 구현 전 
	@RequestMapping("getSchedule")
	public  Map<String, Object> getSchedule(HttpSession session) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		CsEmpDto empUser = (CsEmpDto) session.getAttribute("empUser");
		if(empUser == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}
		
		map.put("result", "success");
		
		return map;
	}
	
	
	// 캘린더에 표시할 스케줄 가져오기 
	@RequestMapping("getCalendarData")
	public  Map<String, Object> getCalendarData(HttpSession session,String start, String end) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		CsEmpDto empUser = (CsEmpDto) session.getAttribute("empUser");
		if(empUser == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}
		
		SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
		    Date startDate = dateTimeFormat.parse(start);
		    Date endDate = dateTimeFormat.parse(end);
		    
			map.put("result", "success");
			map.put("list", csService.getCalendarData(startDate, endDate));
			
			return map;

		} catch (Exception e) {
		    e.printStackTrace();
		}
		
		return map;
	}
	
	
	
	
	
	
	
	
	
	
}
