package com.ja.safari.dto;

import java.util.Date;

public class CsChatCombinedDto {

	private int id;
	private UserDto userDto;
	private CsCategoryDto categoryDto;
	private CsEmpDto empDto;
	private Date reg_date;
	private Date end_date;
	
	public CsChatCombinedDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public CsChatCombinedDto(int id, UserDto userDto, CsCategoryDto categoryDto, CsEmpDto empDto, Date reg_date,
			Date end_date) {
		super();
		this.id = id;
		this.userDto = userDto;
		this.categoryDto = categoryDto;
		this.empDto = empDto;
		this.reg_date = reg_date;
		this.end_date = end_date;
	}



	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}

	public UserDto getUserDto() {
		return userDto;
	}

	public void setUserDto(UserDto userDto) {
		this.userDto = userDto;
	}

	public CsCategoryDto getCategoryDto() {
		return categoryDto;
	}

	public void setCategoryDto(CsCategoryDto categoryDto) {
		this.categoryDto = categoryDto;
	}

	public CsEmpDto getEmpDto() {
		return empDto;
	}

	public void setEmpDto(CsEmpDto empDto) {
		this.empDto = empDto;
	}
	
	
	
	
}
