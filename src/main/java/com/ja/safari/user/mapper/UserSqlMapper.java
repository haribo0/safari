package com.ja.safari.user.mapper;

import java.util.List;

import com.ja.safari.dto.CsQnaDto;
import com.ja.safari.dto.HelpDto;
import com.ja.safari.dto.PickDto;
import com.ja.safari.dto.PromotionReviewDto;
import com.ja.safari.dto.QuestionDto;
import com.ja.safari.dto.RecruitDto;
import com.ja.safari.dto.RentalOrderDto;
import com.ja.safari.dto.UserAddressDto;
import com.ja.safari.dto.UserCoinDto;
import com.ja.safari.dto.UserDto;

public interface UserSqlMapper {

	// 프사가 있는 회원가입
	public void insert(UserDto uerDto);
	
	// 프사가 없는 회원가입
	public void insertNoImg(UserDto userDto);
	
	
	// 카카오 로그인시 최초 1회 정보 등록 
	public void insertKakaoUser(UserDto uerDto);
	
	// 카카오로그인시 회원 있나 없나 체크 
	public UserDto selectUserDtoByUserId(UserDto userDto); 
	
	//로그인
	public UserDto selectByIdAndPw(UserDto uerDto);

	
	// 아이디 찾기
	public int findUserIdCount(UserDto userDto);
	
	public UserDto findUserId(UserDto userDto);
	// 아이디 찾기
	
	// 비밀번호 찾기
	public int findUserPwCount(UserDto userDto);
	
	// 비밀번호 찾기 - 닉네임으로 pk 탐색
	public UserDto findUserPkForNickname(UserDto userDto);
	
	// 비밀번호 찾기 - 변경
	public void renewUserPw(UserDto userDto);
	
	
	
	
	
	// 회원정보 수정 - 현재 비밀번호 확인
	public UserDto checkUserPw(int id);
	
	// 회원정보 수정
	public void modifyUserInfo(UserDto userDto);
	
	// 회원정보 수정 - 프사 x
	public void modifyUserInfoNoImg(UserDto userDto);

	// 아이디 중복 체크 
	public int existsUserId(String email);
	
	// 닉네임 중복 체크
	public int existsNickname(String nickname);
	

	
	
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

	// 코인 마이너스
	public void reduceUserCoin(UserCoinDto userCoinDto);
	
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
	
	// 커뮤니티 궁금해요 내가 쓴 게시글
	public List<QuestionDto> selectQuestionByMyPost(int user_id);
	
	// 커뮤니티 구인구직 내가 좋아요한 게시글
	public List<RecruitDto> selectRecruitByPostMyLike(int user_id);
	
	// 커뮤니티 해주세요 내가 좋아요한 게시글
	public List<HelpDto> selectHelpByPostMyLike(int user_id);
	
	// 커뮤니티 골라줘요 내가 좋아요한 게시글
	public List<PickDto> selectPickByPostMyLike(int user_id);
	
	// 커뮤니티 궁금해요 내가 좋아요한 게시글(나중에 db합치면 xml 다시 확인)
	public List<QuestionDto> selectQuestionByPostMyLike(int user_id);
	
	

	
	
	// 테스트 로그인 -  사용자
	public UserDto selectTestUser(UserDto userDto);
	
	
	
}
