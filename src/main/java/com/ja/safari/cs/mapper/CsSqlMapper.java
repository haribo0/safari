package com.ja.safari.cs.mapper;

import java.util.List;


import com.ja.safari.dto.CsAttendanceLogDto;
import com.ja.safari.dto.CsEmpDto;
import com.ja.safari.dto.CsQnaDto;
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
	
	// 1대1문의 포스트 
	public void insertQnaPost(CsQnaDto csQnaDto);

	
	
	
	
	
	
	

}
