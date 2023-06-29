package com.ja.safari.user.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.safari.dto.RentalItemDto;
import com.ja.safari.dto.RentalOrderDto;
import com.ja.safari.dto.UserAddressDto;
import com.ja.safari.dto.UserDto;
import com.ja.safari.rental.mapper.RentalSqlMapper;
import com.ja.safari.user.mapper.UserSqlMapper;

@Service
public class UserServiceImpl {
	
	@Autowired
	private UserSqlMapper userSqlMapper;
	
	@Autowired
	private RentalSqlMapper rentalSqlMapper;
	
	
	
	//회원가입
	public void joinUser(UserDto userDto) {
		userSqlMapper.insert(userDto);
	}
	
	//로그인
	public UserDto loginUser(UserDto userDto) {
		UserDto user = userSqlMapper.selectByIdAndPw(userDto);
		return user;
	}

	// 주소 추가
	public void addUserAddress(UserAddressDto userAddressDto) {
		userSqlMapper.insertUserAddress(userAddressDto);
	}

	// 주소 불러오기
	public List<UserAddressDto> getUserAddressList(int id) {
		List<UserAddressDto> userAddressDtolist = userSqlMapper.selectAddressListAllById(id);
		
		return userAddressDtolist;
	}
	
	// 대여한 리스트 불러오기
	public List<Map<String, Object>> getRentalOrderedList(int id) {
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		List<RentalOrderDto> RentalOrderDtolist = userSqlMapper.selectRentalOrderedListById(id);
		
		for(RentalOrderDto item: RentalOrderDtolist) {
			Map<String, Object> map = new HashMap<String, Object>();
			
			RentalItemDto rentalItem = rentalSqlMapper.selectById(item.getItem_id());
			
			map.put("orderedItem", item);
			map.put("product", rentalItem);
		
			list.add(map);
		}
		
		return list;
	}
	
	// 영인 
	public UserDto selectUserDtoById(int id) {
		return userSqlMapper.selectUserDtoById(id);
	}

	
	
	
	
	
	
	

}
