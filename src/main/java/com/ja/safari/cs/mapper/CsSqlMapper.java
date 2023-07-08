package com.ja.safari.cs.mapper;

import java.util.List;


import com.ja.safari.dto.CsAttendanceLogDto;
import com.ja.safari.dto.CsCategoryDto;
import com.ja.safari.dto.CsEmpDto;
import com.ja.safari.dto.CsQnaDto;
import com.ja.safari.dto.CsQnaCombinedDto;
import com.ja.safari.dto.CsScheduleDto;

public interface CsSqlMapper {

	// 로그인 - 아이디 비번으로 유저 찾기
	public CsEmpDto getEmpDtoByUserNameAndPw(CsEmpDto empDto);
	
	// 직원 아이디로 직원 찾기 
	public CsEmpDto getEmpDtoById(Integer id);

	// 직원 등록 
	public void registerEmployee(CsEmpDto csEmpDto);

	// 직원 리스트 
	public List<CsEmpDto> getEmployeeList();
	
	// 직원 출근 최근 
	public List<CsAttendanceLogDto> getRecentAttendanceLogDtos(Integer empId);

	// 기존 스케줄 지우기 
	public void deleteScheduleByEmpId(Integer empId);
	
	// 새로운 스케줄 저장 
	public void insertScheduleByEmpId(CsScheduleDto csScheduleDto);

	// 직원 아이디로 스케줄 가져오기 
	public List<CsScheduleDto> getScheduleByEmpId(int empId);
	
	// 스케줄 가져오기 - 캘린더 
	public List<CsScheduleDto> getScheduleList();

	// 출근 
	public void insertTimeInByEmpId(int empId);

	// 퇴근 
	public void updateTimeOutByLogId(int empId);
	
	// 현재 출근했고 일 적은 직원 가져오기
	public CsEmpDto getEmployeeWithLeastWorkload();
	
	// 1대1문의 저장  
	public void insertQnaPost(CsQnaDto csQnaDto);
	
	// 카테고리 가져오기
	public CsCategoryDto getCategoryById(int id);

	// 1대1 문의 가져오기 - 유저아이디로 
	public List<CsQnaDto> getInquiryListByUserId(int userId);

	// 1대1 문의 가져오기 - 직원  
	public List<CsQnaDto> getInquiryListByEmpId(int empId);
	
	// 미답변 문의 개수 가져오기 - 직원  
	public Integer getUnansweredInquiryCount(int empId);
	
	// 1대1 문의 가져오기 - id로  
	public CsQnaDto getQnaDtoById(int id);
	
	// 1대1 문의 CombinedDto 가져오기 - id로  
	public CsQnaCombinedDto getQnaCombinedDtoById(Integer id);

	// 1대1 문의 답변 저장 - 업데이트 
	public void saveQnaReply(CsQnaDto qnaDto);

	
	
	
	
	
	
	

}
