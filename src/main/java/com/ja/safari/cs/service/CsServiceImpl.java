package com.ja.safari.cs.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.safari.cs.mapper.CsSqlMapper;
import com.ja.safari.dto.CsAttendanceLogDto;
import com.ja.safari.dto.CsChatListDto;
import com.ja.safari.dto.CsChatResponseDto;
import com.ja.safari.dto.CsChatResponseDto2;
import com.ja.safari.dto.CsEmpDto;
import com.ja.safari.dto.CsEmpRatingResponseDto;
import com.ja.safari.dto.CsEventDto;
import com.ja.safari.dto.CsLiveChatCountResponseDto;
import com.ja.safari.dto.CsLiveChatDto;
import com.ja.safari.dto.CsLiveChatMsgDto;
import com.ja.safari.dto.CsLiveChatRating;
import com.ja.safari.dto.CsQnaCombinedDto;
import com.ja.safari.dto.CsQnaCountResponseDto;
import com.ja.safari.dto.CsQnaDto;
import com.ja.safari.dto.CsQnaRating;
import com.ja.safari.dto.CsScheduleDto;
import com.ja.safari.dto.CsTodayStatsDto;
import com.ja.safari.dto.UserDto;
import com.ja.safari.user.mapper.UserSqlMapper;

@Service
public class CsServiceImpl {

	@Autowired
	private CsSqlMapper csSqlMapper;
	
	@Autowired
	private UserSqlMapper userSqlMapper;
	
	
	
	// 로그인 
	public CsEmpDto getEmpDtoByUserNameAndPw(CsEmpDto empDto) {
		return csSqlMapper.getEmpDtoByUserNameAndPw(empDto);
	}

	// 직원 추가 등록 
	public void registerEmployee(CsEmpDto csEmpDto) {
		csSqlMapper.registerEmployee(csEmpDto);
	}

	// 직원 리스트 불러오기 
	public List<Map<String, Object>> getEmployeeList() {
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		for (CsEmpDto csEmpDto : csSqlMapper.getEmployeeList()) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("empDto", csEmpDto);
			// TODO :출근 기록 없을 경우 null 오류 처리해주기 !! 
			// 직원 아이디로 최근 출근부 최근 기록 
			List<CsAttendanceLogDto> csAttendanceLogDtos = csSqlMapper.getRecentAttendanceLogDtos(csEmpDto.getId());
			if(csAttendanceLogDtos.size() == 0) {
				map.put("workStatus", "휴무");
			} else {
				CsAttendanceLogDto csAttendanceLogDto = csAttendanceLogDtos.get(0);
				map.put("workStatus", csAttendanceLogDto.getTime_out()==null ? "근무" : "휴무");
			}
			
			// 직원 스케줄 가져오기 
			map.put("scheduleList", csSqlMapper.getScheduleByEmpId(csEmpDto.getId()));
			
			list.add(map);
		}
		
		return list;
	}
	
	
	// 스케줄 변경 
	public void changeSchedule(String[] days, Integer startTime, Integer endTime, Integer empId) {
		
		//일단 기존 데이터 다 지우기 
		csSqlMapper.deleteScheduleByEmpId(empId);
		// DTO 세팅 후 하나씩 인서트  
		for(String day:days) {
			CsScheduleDto csScheduleDto = new CsScheduleDto();
			csScheduleDto.setEmp_id(empId);
			csScheduleDto.setStart_time(startTime);
			csScheduleDto.setEnd_time(endTime);
			csScheduleDto.setWeekday(day);
			csSqlMapper.insertScheduleByEmpId(csScheduleDto);
		}
		
	}
	
	
	// 스케줄 가져오기  
	public List<CsEventDto> getCalendarData(Date start, Date end) {
		
		List<CsEventDto> list = new ArrayList<CsEventDto>();
		
		List<CsScheduleDto> scheduleList = csSqlMapper.getScheduleList();
	    for(CsScheduleDto scheduleDto : scheduleList) {
	    	String eventName = csSqlMapper.getEmpDtoById(scheduleDto.getEmp_id()).getName();
	    	String weekday = scheduleDto.getWeekday();
	    	int weekdayInt = getWeekdayAsInteger(weekday);
	    	List<Date> dates = getDatesForWeekday(weekdayInt, start, end);
	    	for(Date date : dates) {
	    		
	    	    CsEventDto eventDto = new CsEventDto(eventName, setDateAndTime(date,scheduleDto.getStart_time()), setDateAndTime(date,scheduleDto.getEnd_time()));
	    	    
	    		list.add(eventDto);
	    	}
	    }
	    
	    return list;
	}
	
	// 날짜와 시간을 합쳐서 Date 타입으로 리턴 
	private Date setDateAndTime(Date date, int time) {
	    Calendar calendar = Calendar.getInstance();
	    calendar.setTime(date);
	    calendar.set(Calendar.HOUR_OF_DAY, time);
	    calendar.set(Calendar.MINUTE, 0);
	    calendar.set(Calendar.SECOND, 0);
	    calendar.set(Calendar.MILLISECOND, 0);

	    return calendar.getTime();
	}

	// 요일로 시작일부터 마지막일까지의 해당 요일의 날짜를 구해서 리스트로 리턴 
	public List<Date> getDatesForWeekday(int weekday, Date start, Date end) {
	    List<Date> dates = new ArrayList<>();
	    Calendar calendar = Calendar.getInstance();
	    calendar.setTime(start);
	    while (!calendar.getTime().after(end)) {
	        if (calendar.get(Calendar.DAY_OF_WEEK) == weekday) {
	            dates.add(calendar.getTime());
	        }
	        calendar.add(Calendar.DATE, 1);
	    }
	    return dates;
	}
	
	// 요일을 정수로 변환해서 리턴 
	private int getWeekdayAsInteger(String weekday) {
	    switch (weekday.toLowerCase()) {
	        case "일":
	            return Calendar.SUNDAY;
	        case "월":
	            return Calendar.MONDAY;
	        case "화":
	            return Calendar.TUESDAY;
	        case "수":
	            return Calendar.WEDNESDAY;
	        case "목":
	            return Calendar.THURSDAY;
	        case "금":
	            return Calendar.FRIDAY;
	        case "토":
	            return Calendar.SATURDAY;
	        default:
	            throw new IllegalArgumentException("Invalid weekday: " + weekday);
	    }
	}
	
	private String getTodayDayOfWeek() {
		// Calendar 인스턴스 생성
        Calendar calendar = Calendar.getInstance();
        // 현재 날짜와 시간으로 설정
        calendar.setTimeInMillis(System.currentTimeMillis());
        // 요일 가져오기 (1: 일요일, 2: 월요일, ..., 7: 토요일)
        int dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);

        // 요일에 따라 문자열로 변환하여 출력
        String dayOfWeekString;
        
        switch (dayOfWeek) {
            case Calendar.SUNDAY:
                dayOfWeekString = "일";
                break;
            case Calendar.MONDAY:
                dayOfWeekString = "월";
                break;
            case Calendar.TUESDAY:
                dayOfWeekString = "화";
                break;
            case Calendar.WEDNESDAY:
                dayOfWeekString = "수";
                break;
            case Calendar.THURSDAY:
                dayOfWeekString = "목";
                break;
            case Calendar.FRIDAY:
                dayOfWeekString = "금";
                break;
            case Calendar.SATURDAY:
                dayOfWeekString = "토";
                break;
            default:
                dayOfWeekString = "";
                break;
                
        	} 
        return dayOfWeekString;
	}
	

	public String getWorkStateByEmpId(int empId) {
		// 근무 날인지 확인 
		Calendar calendar = Calendar.getInstance();
        int dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);
        int hourOfDay = calendar.get(Calendar.HOUR_OF_DAY);
        
        String workState = "휴무";
        
        // 직원 아이디로 근무 스케줄 가져오기 (여러개 / 요일별) 
		for(CsScheduleDto scheduleDto : csSqlMapper.getScheduleByEmpId(empId)) {
			
			// 최근 출퇴근 기록 가져오기 
			List<CsAttendanceLogDto> attList = csSqlMapper.getRecentAttendanceLogDtos(empId);
			
			// 해당일에 근무 일 경우 
			if(getWeekdayAsInteger(scheduleDto.getWeekday()) == dayOfWeek) {
				// 근무 기록 없거나 마지막 기록에 퇴근 시간이 있으면
				if(attList.size()==0) workState = (hourOfDay < scheduleDto.getEnd_time() ? "출근전" : "퇴근");
				else if(attList.get(0).getTime_out()!=null) {
					workState = (hourOfDay < scheduleDto.getEnd_time() ? "출근전" : "퇴근");
				} else {
					workState = "근무";
				}
			} else { // 근무일 아닐경우 
				if(attList.size()==0) continue;
				else if(attList.get(0).getTime_out()==null) {
					workState = "근무";
				}
			}
		}
		
		return workState;
	}

	
	// 출근 처리 
	public void startWorking(int empId) {
		
		csSqlMapper.insertTimeInByEmpId(empId);
		
	}

	// 퇴근 처리 
	public void stopWorking(int empId) {
		
		csSqlMapper.updateTimeOutByLogId(csSqlMapper.getRecentAttendanceLogDtos(empId).get(0).getId());
		
	}
	
	// 1대1문의 - 가장 일 적은 직원 배정 후 데이터 저장 
	public void postInquiry(CsQnaDto inquiry) {
		// 출근했고 가장 일 적은 직원 가져오기 
		CsEmpDto empDto = csSqlMapper.getEmployeeWithLeastWorkload();
		inquiry.setEmp_id(empDto.getId());
		// 1대1 문의 저장 
		csSqlMapper.insertQnaPost(inquiry);
		
	}

	// 회원 아이디로 문의리스트 가져오기 
	public List<Map<String, Object>> getInquiryListByUserId(int userId) {
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		for(CsQnaDto csQnaDto :  csSqlMapper.getInquiryListByUserId(userId)) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("qna", csQnaDto);
			map.put("category", csSqlMapper.getCategoryById(csQnaDto.getCategory_id()));
			list.add(map);
		}
		
		return list;
	}
	
	// 직원 아이디로 문의리스트 가져오기 
	public List<Map<String, Object>> getInquiryListByEmpId(int empId) {
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		for(CsQnaDto csQnaDto :  csSqlMapper.getInquiryListByEmpId(empId)) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("qna", csQnaDto);
			map.put("category", csSqlMapper.getCategoryById(csQnaDto.getCategory_id()));
			list.add(map);
		}
		
		return list;
	}
	
	// 직원 아이디로 미답변 개수 가져오기 
	public Integer getUnansweredInquiryCount(int empId) {
		
		return csSqlMapper.getUnansweredInquiryCount(empId);
	}

	// 1대1 문의 상세 가져오기 
	public CsQnaCombinedDto getQnaCombinedDtoById(int id) {
		
		CsQnaCombinedDto csQnaCombinedDto = csSqlMapper.getQnaCombinedDtoById(id);
		String content = csQnaCombinedDto.getQna_content().replaceAll("\n", "<br>");
		csQnaCombinedDto.setQna_content(content);
		if(csQnaCombinedDto.getQna_reply()!=null) {
			String reply = csQnaCombinedDto.getQna_reply().replaceAll("\n", "<br>");
			csQnaCombinedDto.setQna_reply(reply);
		}
		
		return csQnaCombinedDto;
	}

	// 1대1 문의 답변 저장 
	public void saveQnaReply(CsQnaDto qnaDto) {
		csSqlMapper.saveQnaReply(qnaDto);
		
	}

	// 실시간 문의 시작  
	public int startLiveChat(CsLiveChatDto csLiveChatDto) {
		
		// 출근했고 가장 일 적은 직원 가져오기 
		CsEmpDto empDto = csSqlMapper.getEmployeeWithLeastWorkload();
		// 담당 직원 배정 
		csLiveChatDto.setEmp_id(empDto.getId());
		// pk 가져오기
		int chatPk = csSqlMapper.getLiveChatPk();
		csLiveChatDto.setId(chatPk);
		
		// DB에 정보 인서트 
		csSqlMapper.insertLiveChat(csLiveChatDto);
		
		return chatPk;
	}

	// 실시간 문의 메세지 전송 (user)
	public void sendLiveChatMsg(CsLiveChatMsgDto msgDto) {
		csSqlMapper.insertLiveChatMsg(msgDto);
		
	}
	
	// 실시간 문의 메세지 리스트 가져오기 
	public List<CsLiveChatMsgDto> getLiveChatMsgList(Integer chatId) {
		
		return csSqlMapper.getLiveChatMsgListByChatId(chatId);
	}

	// 종료되지 않은 채팅 카운트 
	public Integer getUnfinishedChatCountByEmpId(int empId) {
		
		return csSqlMapper.getUnfinishedChatCountByEmpId(empId);
	}

	// 직원 아이디로 채팅방 리스트 가져오기 (채팅방만)
	public List<Map<String, Object>> getLiveChatListByEmpId(int empId) {
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		for(CsChatListDto csChatListDto  :  csSqlMapper.getLiveChatListByEmpId(empId)) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("chat", csChatListDto);
			map.put("unread", csSqlMapper.getUnreadMsgCountByChatId(csChatListDto.getId()));
			map.put("msg", csSqlMapper.getLastMsgByChatId(csChatListDto.getId()));
			list.add(map);
			
		}
		return list;
	}
	
	// 메세지 리스트 가져오기
	public List<CsLiveChatMsgDto> getMsgListByChatId(int chatId) {
		
		return csSqlMapper.getMsgListByChatId(chatId);
	}
	
	// 직원 아이디로 채팅방 리스트 ResonseDto 가져오기
	public List<CsChatResponseDto> getChatResponseDtoListByEmpId(int empId) {
		
		return csSqlMapper.getCsChatResponseDtoListByEmpId(empId);
	}
	
	// 직원 아이디로 채팅방 리스트 ResonseDto 가져오기
	public List<CsChatResponseDto2> getCsChatResponseDtoList2ByEmpId(int empId) {
		
		return csSqlMapper.getCsChatResponseDtoList2ByEmpId(empId);
	}

	// 직원 | 메세지 읽음 처리 
	public void markMsgAsReadByEmp(Integer chatId) {
		csSqlMapper.markMsgAsReadByEmp(chatId);
	}

	// 1대1 문의 답변에 대한 후기가 있는지 
	public boolean isQnaReplyRated(Integer id) {
		
		return csSqlMapper.getQnaReplyRateCount(id) > 0;
	}

	// 1대1 문의 후기 저장 
	public void saveQnaReplyRating(CsQnaRating csQnaRating) {
		
		csSqlMapper.insertQnaReplyRating(csQnaRating);
	}

	public void saveChatMsg(CsLiveChatMsgDto chatMsgDto) {
		
		csSqlMapper.insertLiveChatMsgByEmp(chatMsgDto);
	}

	// user | 메세지 읽음 처리 
	public void markMsgAsReadByUser(Integer chatId) {
		csSqlMapper.markMsgAsReadByUser(chatId);
		
	}

	// 실시간 문의 상담 종료 
	public void endLiveChatById(Integer chatId) {
		
		csSqlMapper.endLiveChatById(chatId);
	}

	// 실시간 문의 상담 종료 여부 
	public boolean isChatEnded(Integer chatId) {
		// end_date 있으면 1 없으면 0 
		return csSqlMapper.isChatEnded(chatId) > 0;
	}

	// 실시간 문의 후기 저장 
	public void saveLiveChatRating(CsLiveChatRating liveChatRating) {
		csSqlMapper.saveLiveChatRating(liveChatRating);
		
	}

	// 채팅 아이디로 유저 가져오기 
	public UserDto getUserDtoByChatId(Integer chatId) {
		
		return csSqlMapper.getUserDtoByChatId(chatId);
	}

	// 채팅 아이디로 상담사 닉네임 가져오기 
	public String getEmpNicknameByChatId(Integer chatId) {
		CsEmpDto empDto = csSqlMapper.getEmpDtoByChatId(chatId);
		return empDto.getNickname() ;
	}
	
	// 오늘 실시간 현황 
//	public Map<String, Object> getStatsToday() {
//		Map<String, Object> map = new HashMap<String, Object>();
//		
//		return map;
//	}
	
	// 오늘 실시간 현황 
	public CsTodayStatsDto getStatsToday() {
		
		return csSqlMapper.getStatsToday();
	}

	
	// 실시간 직원 출근 현황 
	public List<Map<String, Object>> getEmpListForToday() {
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		// 오늘 요일 
		String dayOfWeekToday = getTodayDayOfWeek();
		
		for(CsEmpDto empDto :  csSqlMapper.getEmpListForToday(dayOfWeekToday)) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("emp", empDto);
			CsScheduleDto scheduleDto = csSqlMapper.getScheduleByEmpIdAndWeekday(empDto.getId(),dayOfWeekToday);
			map.put("schedule", scheduleDto);
			String workState = getWorkStateByEmpId(empDto.getId());
			map.put("workState", workState);
			CsQnaCountResponseDto qnaCountResponseDto = csSqlMapper.getQnaCountForTodayByEmpId(empDto.getId()).get(0);
			map.put("qna", qnaCountResponseDto);
			CsLiveChatCountResponseDto chatCountResponseDto = csSqlMapper.getLiveChatCountForTodayByEmpId(empDto.getId()).get(0);
			map.put("chat", chatCountResponseDto);
			if(qnaCountResponseDto.getReply_count()>0) {
				// 평균 계산 
				// map.put("qnaAvgTime", qnaCountResponseDto.getReply_count()/getTimeDifferenceInMinutes(scheduleDto.getStart_time()));
				// map.put("qnaAvgTime", getTimeDifferenceInMinutes(scheduleDto.getStart_time())/qnaCountResponseDto.getReply_count());
				// map.put("qnaAvgTime", csSqlMapper.getAvgReplyTimeTodayByEmpId(empDto.getId()));
				double avgReplyTime = csSqlMapper.getAvgReplyTimeTodayByEmpId(empDto.getId());
				double roundedAvgReplyTime = Math.round(avgReplyTime * 10.0) / 10.0;
				map.put("qnaAvgTime", roundedAvgReplyTime);
				
			} else {
				map.put("qnaAvgTime", "-");

			}
			if(chatCountResponseDto.getChat_ended_count()>0) {
				// 평균 계산 
				// map.put("chatAvgTime", chatCountResponseDto.getChat_ended_count()/getTimeDifferenceInMinutes(scheduleDto.getStart_time()));
				// map.put("chatAvgTime", getTimeDifferenceInMinutes(scheduleDto.getStart_time())/chatCountResponseDto.getChat_ended_count());
				// map.put("chatAvgTime", csSqlMapper.getAvgChatEndTimeTodayByEmpId(empDto.getId()));
				double avgChatTime = csSqlMapper.getAvgChatEndTimeTodayByEmpId(empDto.getId());
				double roundedAvgChatTime = Math.round(avgChatTime * 10.0) / 10.0;
				map.put("chatAvgTime", roundedAvgChatTime);
			} else {
				map.put("chatAvgTime", "-");
				
			}
			list.add(map);
		}
		
		
		return list;
		
	}

	
	// 지난 주간 현황 
	public List<Map<String, Object>> getLastWeekData() {
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		
		for(CsEmpDto empDto :  csSqlMapper.getEmployeeList()) {
			if(empDto.getMaster()==1) continue;
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("emp", empDto);
			map.put("rating", csSqlMapper.getRatingsByEmpId(empDto.getId()));
			map.put("weeklyHours", csSqlMapper.getWeeklyHoursByEmpId(empDto.getId()));
			map.put("qna", csSqlMapper.getWeeklyQnaCountByEmpId(empDto.getId()));
			map.put("chat", csSqlMapper.getWeeklyLiveChatCountByEmpId(empDto.getId()));
			
			
			list.add(map);
		}
		
		return list;
		
	}
	
	

	private int getTimeDifferenceInMinutes(int startHour) {
        // 현재 시간 가져오기
        Calendar now = Calendar.getInstance();
        int currentHour = now.get(Calendar.HOUR_OF_DAY); // 현재 시간의 시간 부분
        int currentMinute = now.get(Calendar.MINUTE); // 현재 시간의 분 부분
        
        // 현재 시간과 출근 시간의 차이 계산
        int diffMinutes = (currentHour - startHour) * 60 + (currentMinute - 0);
        
        // 분 단위 차이를 시간 단위로 변환
        int diffHours = diffMinutes / 60;
        
		return diffHours;
	}
	
	
	
	
	
	
	
	
	
}
