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
import com.ja.safari.dto.CsEmpDto;
import com.ja.safari.dto.CsEventDto;
import com.ja.safari.dto.CsQnaCombinedDto;
import com.ja.safari.dto.CsQnaDto;
import com.ja.safari.dto.CsScheduleDto;
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
			// 출근 기록 없을 경우 null 오류 처리해주기 !! 
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

	public String getWorkStateByEmpId(int empId) {
		// 근무 날인지 확인 
		Calendar calendar = Calendar.getInstance();
        int dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);
        int hourOfDay = calendar.get(Calendar.HOUR_OF_DAY);
        
        String workState = "휴무";
        
        // 근무 스케줄 가져오기 (요일별) 
		for(CsScheduleDto scheduleDto : csSqlMapper.getScheduleByEmpId(empId)) {
			// 해당일에 근무 일 경우 
			if(getWeekdayAsInteger(scheduleDto.getWeekday()) == dayOfWeek) {
				// 근무 시작 시간 전후 체크
				List<CsAttendanceLogDto> attList = csSqlMapper.getRecentAttendanceLogDtos(empId);
				// 근무 기록 없거나 마지막 기록에 퇴근 시간이 있으면
				if(attList.size()==0 || attList.get(0).getTime_out()!=null) {
					workState = (hourOfDay < scheduleDto.getEnd_time() ? "출근전" : "퇴근");
				} else {
					workState = "근무";
				}
			} 
			
		}
		
		return workState;
	}

	public void startWorking(int empId) {
		
		csSqlMapper.insertTimeInByEmpId(empId);
		
	}

	public void stopWorking(int empId) {
		
		csSqlMapper.updateTimeOutByLogId(csSqlMapper.getRecentAttendanceLogDtos(empId).get(0).getId());
		
	}
	
	// 1대1문의 - 가장 일 적은 직원 배정 후 데이터 저장 
	public void postInquiry(CsQnaDto inquiry) {
		// 출근했고 가장 일 적은 직원 가져오기 
		CsEmpDto empDto = csSqlMapper.getEmployeeWithLeastWorkload();
		System.out.println(empDto.getId());
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

	// 문의 상세 가져오기 
	public CsQnaCombinedDto getQnaCombinedDtoById(int id) {
		
		return csSqlMapper.getQnaCombinedDtoById(id);
	}

	public void saveQnaReply(CsQnaDto qnaDto) {
		csSqlMapper.saveQnaReply(qnaDto);
		
	}

	
	
	
}
