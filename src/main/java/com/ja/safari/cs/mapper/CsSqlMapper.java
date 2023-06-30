package com.ja.safari.cs.mapper;

import com.ja.safari.dto.CsEmpDto;

public interface CsSqlMapper {

	// 로그인 - 아이디 비번으로 유저 찾기
	public CsEmpDto getEmpDtoByUserNameAndPw(CsEmpDto empDto);
	
	

}
