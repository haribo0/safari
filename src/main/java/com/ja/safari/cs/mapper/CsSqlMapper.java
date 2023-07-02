package com.ja.safari.cs.mapper;

import java.util.List;

import com.ja.safari.dto.CsAttendanceLogDto;
import com.ja.safari.dto.CsEmpDto;

public interface CsSqlMapper {

	// 로그인 - 아이디 비번으로 유저 찾기
	public CsEmpDto getEmpDtoByUserNameAndPw(CsEmpDto empDto);

	// 직원 등록 
	public void registerEmployee(CsEmpDto csEmpDto);

	// 직원 리스트 
	public List<CsEmpDto> getEmployeeList();
	
	// 직원 출근부  
	public CsAttendanceLogDto getAttendanceLogByEmpId(Integer empId);
	
	
	
	
	
	

}
