package com.ja.safari.user.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.safari.community.mapper.PromotionReviewCommentMapper;
import com.ja.safari.community.mapper.PromotionReviewMapper;
import com.ja.safari.dto.PromotionReviewDto;
import com.ja.safari.dto.PromotionReviewImgDto;
import com.ja.safari.dto.RentalItemDto;
import com.ja.safari.dto.RentalOrderDto;
import com.ja.safari.dto.UserAddressDto;
import com.ja.safari.dto.UserCoinDto;
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
	
	// 회원정보 수정 - 현재 비밀번호 확인
	public UserDto checkUserPw(int id) {
		return userSqlMapper.checkUserPw(id);
	}
	
	// 회원정보 수정
	public void modifyUserInfo(UserDto userDto) {
		userSqlMapper.modifyUserInfo(userDto);
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
	
	// 유저 당 등록된 주소 개수 가져오기
	public int getUserAddressCount(int userId) {
		return userSqlMapper.getUserAddressCount(userId);
	}
	
	// 주소 수정 - pk로 데이터 가져오기
	public UserAddressDto getAddressInfoByPk(int id) {
		return userSqlMapper.getAddressInfoByPk(id);
	}
	
	// 주소 수정
	public void modifyUserAddress(UserAddressDto userAddressDto) {
		userSqlMapper.modifyUserAddress(userAddressDto);
	}
	
	// 주소 삭제
	public void removeUserAddress(int id) {
		userSqlMapper.removeUserAddress(id);
	}
	
	// 대여한 리스트 불러오기
	public List<Map<String, Object>> getRentalOrderedList(int id) {
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		List<RentalOrderDto> RentalOrderDtolist = userSqlMapper.selectRentalOrderedListById(id);
		
		for(RentalOrderDto item: RentalOrderDtolist) {
			Map<String, Object> map = new HashMap<String, Object>();
			String isCompleted = rentalSqlMapper.selectIsCompletedById(item.getId());
			System.out.println("isCompleted:: " + isCompleted);
			
			RentalItemDto rentalItem = rentalSqlMapper.selectById(item.getItem_id());
			
			map.put("isCompleted", isCompleted);
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
	
	// 코인 충전 pk 받아오기
	public int getOnChargeCoinPk() {
		return userSqlMapper.getOnChargeCoinPk();
	}
	
	// 코인 충전 정보 저장
	public void insertUserCoin(UserCoinDto userCoinDto) {
		userSqlMapper.insertUserCoin(userCoinDto);
	}

	// 코인 방금 충전한 내역 조회
	public Map<String, Object> getChargeCoinSuccessHistory(Integer id) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("chargeCoinHistory", userSqlMapper.getChargeCoinSuccessHistory(id));
		
		return map;
	}
	
	// 회원의 현재 보유 코인 조회
	public int getUserCoinBalance(int userId) {
		return userSqlMapper.getUserCoinBalance(userId);
	}
	
	// 회원의 코인 충전 내역 조회
	public List<UserCoinDto> getCoinChargeHistoryList(int userId) {
		return userSqlMapper.getCoinChargeHistoryList(userId);
	}
	
	// 회원의 코인 지출 내역 조회
	public List<UserCoinDto> getCoinUsageHistoryList(int userId) {
		return userSqlMapper.getCoinUsageHistoryList(userId);
	}
	
	// 회원의 코인 전체 사용 내역 조회
	public List<UserCoinDto> getUserCoinAllHistoryList(int userId) {
		return userSqlMapper.getUserCoinAllHistoryList(userId);
	}
	
	// 회원의 코인 전체 사용 내역 횟수
	public int getUserCoinAllHistoryCount(int userId) {
		return userSqlMapper.getUserCoinAllHistoryCount(userId);
	}
	
	// 세연 - 커뮤니티 내가 쓴 게시글(리워드) 불러오기
	public List<Map<String, Object>> getProreviewByMyPost(int user_id) {

		List<PromotionReviewDto> proReviewMyPostList = userSqlMapper.selectProreviewByMyPost(user_id);
		
		
		List<Map<String, Object>> promoReviewMyPostList = new ArrayList<>();
		
		
		for(PromotionReviewDto promotionReviewDto : proReviewMyPostList) {
		
			
			Map<String, Object> map = new HashMap<>();
		
			
			UserDto userDto = userSqlMapper.selectUserDtoById(promotionReviewDto.getUser_id());
			
			List<PromotionReviewImgDto> promotionReviewImgList = promotionReviewMapper.selectByPromoReviewImgId(promotionReviewDto.getId());
			
			int countPromotionReviewComment = promotionReviewCommentMapper.countPromotionReviewComment(promotionReviewDto.getId());
			
			int countLikeByPromotionReview = promotionReviewMapper.countLikeByPromotionReviewId(promotionReviewDto.getId());
			
			map.put("userDto", userDto);
			map.put("promotionReviewDto", promotionReviewDto);
			map.put("promotionReviewImgList", promotionReviewImgList);
			map.put("countPromotionReviewComment", countPromotionReviewComment);
			map.put("countLikeByPromotionReview", countLikeByPromotionReview);
			
			promoReviewMyPostList.add(map);
			
		}
		
		return promoReviewMyPostList;
	}
	
	
	
	
	
	
	

}
