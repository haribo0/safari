package com.ja.safari.user.mapper;

import java.util.List;

import com.ja.safari.dto.CsQnaDto;
import com.ja.safari.dto.HelpDto;
import com.ja.safari.dto.PickDto;
import com.ja.safari.dto.PromotionReviewDto;
import com.ja.safari.dto.RecruitDto;
import com.ja.safari.dto.RentalOrderDto;
import com.ja.safari.dto.UserAddressDto;
import com.ja.safari.dto.UserCoinDto;
import com.ja.safari.dto.UserDto;

public interface UserSqlMapper {

	//회원가입
	public void insert(UserDto uerDto);
	
	//로그인
	public UserDto selectByIdAndPw(UserDto uerDto);
	
	// 회원정보 수정 - 현재 비밀번호 확인
	public UserDto checkUserPw(int id);
	
	// 회원정보 수정
	public void modifyUserInfo(UserDto userDto);
	
	// 유저아이디로 유저 dto 찾아오기
	public UserDto selectUserDtoById(int id);
	
	//주소추가
	public void insertUserAddress(UserAddressDto params);

	//주소가져오기
	public List<UserAddressDto> selectAddressListAllById(int id);
	
	// 등록되 주소 개수 가져오기
	public int getUserAddressCount(int userId);
	
	// 주소 수정 - pk로 데이터 가져오기
	public UserAddressDto getAddressInfoByPk(int id);
	
	// 주소 수정
	public void modifyUserAddress(UserAddressDto userAddressDto);
	
	// 주소 삭제
	public void removeUserAddress(int id);

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
	
	// 커뮤니티 구인구직 내가 쓴 게시글
	public List<RecruitDto> selectRecruitByMyPost(int user_id);
	
	// 커뮤니티 해주세요 내가 쓴 게시글
	public List<HelpDto> selectHelpByMyPost(int user_id);
	
	// 커뮤니티 골라줘요 내가 쓴 게시글
	public List<PickDto> selectPickByMyPost(int user_id);
	
	
}
