package com.ja.safari.cs.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.safari.cs.mapper.CsSqlMapper;
import com.ja.safari.dto.CsAttendanceLogDto;
import com.ja.safari.dto.CsEmpDto;

@Service
public class CsServiceImpl {

	@Autowired
	private CsSqlMapper csSqlMapper;
	
	
	
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
			CsAttendanceLogDto csAttendanceLogDto = csSqlMapper.getAttendanceLogByEmpId(csEmpDto.getId());
			map.put("workStatus", csAttendanceLogDto.getTime_out()==null ? "근무" : "휴무");
			list.add(map);
		}
		
		return list;
	}
	
	
	
	
}
