package com.ja.safari.user.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.safari.community.mapper.PromotionReviewCommentMapper;
import com.ja.safari.community.mapper.PromotionReviewMapper;
import com.ja.safari.dto.CsQnaDto;
import com.ja.safari.dto.PromotionReviewDto;
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
	
	@Autowired
	private PromotionReviewMapper promotionReviewMapper;
	
	@Autowired
	private PromotionReviewCommentMapper promotionReviewCommentMapper;
	
	
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

	// 세연 - 커뮤니티 내가 쓴 게시글(리워드) 불러오기
	public List<Map<String, Object>> getProreviewByMyPost(int user_id) {
		
		System.out.println("서비스1");

		List<PromotionReviewDto> proReviewMyPostList = userSqlMapper.selectProreviewByMyPost(user_id);
		
		System.out.println("서비스2");
		
		List<Map<String, Object>> promoReviewMyPostList = new ArrayList<>();
		
		System.out.println("서비스3");
		
		for(PromotionReviewDto promotionReviewDto : proReviewMyPostList) {
		
			System.out.println("서비스4");
			
			Map<String, Object> map = new HashMap<>();
		
			System.out.println("마이페이지 서비스 List : " + proReviewMyPostList);
			
			UserDto userDto = userSqlMapper.selectUserDtoById(promotionReviewDto.getUser_id());
			
			System.out.println("마이페이지 서비스 유저 : " + userDto);
			
			int countPromotionReviewComment = promotionReviewCommentMapper.countPromotionReviewComment(promotionReviewDto.getId());
			
			System.out.println("서비스5" + countPromotionReviewComment );
			
			int countLikeByPromotionReview = promotionReviewMapper.countLikeByPromotionReviewId(promotionReviewDto.getId());
			
			System.out.println("서비스6" + countLikeByPromotionReview );
			
			map.put("userDto", userDto);
			map.put("promotionReviewDto", promotionReviewDto);
			map.put("countPromotionReviewComment", countPromotionReviewComment);
			map.put("countLikeByPromotionReview", countLikeByPromotionReview);
			
			promoReviewMyPostList.add(map);
			
			System.out.println("커뮤니티마이페이지제발 : " + map);
		}
		
		return promoReviewMyPostList;
	}
	
	
	
	
	
	
	

}
