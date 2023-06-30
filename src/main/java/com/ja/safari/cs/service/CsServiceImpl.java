package com.ja.safari.cs.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.safari.cs.mapper.CsSqlMapper;
import com.ja.safari.dto.CsEmpDto;

@Service
public class CsServiceImpl {

	@Autowired
	private CsSqlMapper csSqlMapper;
	
	
	

	public CsEmpDto getEmpDtoByUserNameAndPw(CsEmpDto empDto) {
		
		return csSqlMapper.getEmpDtoByUserNameAndPw(empDto);
	}
	
	
	
	
}
