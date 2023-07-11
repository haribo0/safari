package com.ja.safari.user.mapper;

import java.util.List;

import com.ja.safari.dto.CsQnaDto;
import com.ja.safari.dto.PromotionReviewDto;
import com.ja.safari.dto.RentalOrderDto;
import com.ja.safari.dto.UserAddressDto;
import com.ja.safari.dto.UserCoinDto;
import com.ja.safari.dto.UserDto;

public interface UserSqlMapper {

	//회원가입
	public void insert(UserDto uerDto);
	
	//로그인
	public UserDto selectByIdAndPw(UserDto uerDto);
	
	// 유저아이디로 유저 dto 찾아오기
	public UserDto selectUserDtoById(int id);
	
	//주소추가
	public void insertUserAddress(UserAddressDto params);

	//주소가져오기
	public List<UserAddressDto> selectAddressListAllById(int id);

	//렌탈 리스트 불러오기
	public List<RentalOrderDto> selectRentalOrderedListById(int id);

	// 1대1 문의 
	public void postInquiry(CsQnaDto inquiry);
	
	// 회원 코인 충전 pk 받아오기 
	public int getOnChargeCoinPk();
	
	// user coin insert
	public void insertUserCoin(UserCoinDto userCoinDto);
	
	// 코인 방금 충전한 내역 조회
	public UserCoinDto getChargeCoinSuccessHistory(Integer id);

	// 회원의 현재 보유 코인 조회
	public int getUserCoinBalance(int userId);
	
	// 회원의 코인 충전 내역 조회
	public List<UserCoinDto> getCoinChargeHistoryList(int userId);
	
	// 회원의 코인 지출 내역 조회
	public List<UserCoinDto> getCoinUsageHistoryList(int userId);
	
	// 회원의 코인 전체 사용 내역 조회
	public List<UserCoinDto> getUserCoinAllHistoryList(int userId);
	
	// 회원의 코인 전체 사용 내역 횟수
	public int getUserCoinAllHistoryCount(int userId);

	// 커뮤니티 리워드 내가 쓴 게시글
	public List<PromotionReviewDto> selectProreviewByMyPost(int user_id);
	
}
