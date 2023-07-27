package com.ja.safari.user.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.safari.community.mapper.HelpSqlMapper;
import com.ja.safari.community.mapper.PickSqlMapper;
import com.ja.safari.community.mapper.PromotionReviewCommentMapper;
import com.ja.safari.community.mapper.PromotionReviewMapper;
import com.ja.safari.community.mapper.QuestionSqlMapper;
import com.ja.safari.community.mapper.RecruitSqlMapper;
import com.ja.safari.dto.HelpDto;
import com.ja.safari.dto.HelpImgDto;
import com.ja.safari.dto.PickDto;
import com.ja.safari.dto.PromotionReviewDto;
import com.ja.safari.dto.PromotionReviewImgDto;
import com.ja.safari.dto.QuestionDto;
import com.ja.safari.dto.QuestionImgDto;
import com.ja.safari.dto.RecruitDto;
import com.ja.safari.dto.RentalBusinessDto;
import com.ja.safari.dto.RentalItemDto;
import com.ja.safari.dto.RentalItemLikeDto;
import com.ja.safari.dto.RentalItemReturnDto;
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
	@Autowired
	private HelpSqlMapper helpSqlMapper;
	@Autowired
	private PickSqlMapper pickSqlMapper;
	@Autowired
	private QuestionSqlMapper questionSqlMapper;
	@Autowired
	private RecruitSqlMapper recruitSqlMapper;
	
	//회원가입
	public void joinUser(UserDto userDto) {
		userSqlMapper.insert(userDto);
	}
	
	//로그인
	public UserDto loginUser(UserDto userDto) {
		UserDto user = userSqlMapper.selectByIdAndPw(userDto);
		return user;
	}
	
	// 카카오 로그인 
	public UserDto kakaoLogin(UserDto userDto) {
	
		// 테이블에 유저 있는지 확인 
		UserDto user = userSqlMapper.selectUserDtoByUserId(userDto);
		
		// 없으면 정보 저장 - 아이디랑 닉네임만
		if(user==null) {
			userSqlMapper.insertKakaoUser(userDto);
			// 정보 없다면 파라미터로 받은 객체를 그대로 리턴 
			return userDto;
		} 
		
		// 기존에 로그인한적 있다면 DB에서 찾아온 userDto를 리턴 
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
	
	// 아이디 중복 체크
	public boolean existsUserId(String email) {
		
		int count = userSqlMapper.existsUserId(email);
		
		if (count > 0) {
			return true;
		} else {
			return false;
		}
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
		
		for(RentalOrderDto orderDto: RentalOrderDtolist) {
			Map<String, Object> map = new HashMap<String, Object>();
			int orderId = orderDto.getId();
			String isCompleted = rentalSqlMapper.selectIsCompletedById(orderId);
			
			RentalItemDto rentalItem = rentalSqlMapper.selectById(orderDto.getItem_id());
			RentalItemReturnDto rentalItemReturnDto = rentalSqlMapper.selectRentalItemRetrunById(orderId);
			// 리뷰 숫자 세기 작업중
			int myReviewCount = rentalSqlMapper.selectMyReviewCount(id, orderId);
			
			int itemId = rentalItem.getId();
			RentalBusinessDto rentalBusinessDto = rentalSqlMapper.selectRentalBuisnessById(itemId);
			
			// 오늘 날짜 
			Date currentDate = new Date();
			// 주문 진행 상태 
			String orderState = "";
			
			if (rentalItemReturnDto!=null) {
				if(rentalItemReturnDto.getIs_completed()=="Y") {
					orderState = "반납완료";
				} else if (rentalItemReturnDto.getIs_item_returned().equals("Y")) {
					orderState = "정산중";
				} else {
					orderState = "반납신청";
				}
			} else {
				// 시작일 이후면
				if(orderDto.getStart_date().compareTo(currentDate) < 0 ) orderState = "대여중";
				else if(orderDto.getIs_shipped().equals("Y") ) orderState = "배송중";
				// 다 아니면 
				else orderState = "주문완료";
			}
			
			
			
			
			map.put("myReviewCount", myReviewCount);
			map.put("isCompleted", isCompleted);
			map.put("orderedItem", orderDto);
			map.put("product", rentalItem);
			map.put("rentalItemReturnDto",rentalItemReturnDto);
			map.put("rentalBusinessDto",rentalBusinessDto);
			map.put("orderState",orderState);
		
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
	
	// 리워드 코인 적립(보드id의 작성자를 조회를 해서 ~ 어쩌고저쩌고 해서~ 해야할ㄹ거같은데)
	public void insertPromoCoin(UserCoinDto userCoinDto, PromotionReviewDto promotionReviewDto) {
		
		userCoinDto.setId(getOnChargeCoinPk()); 
		userCoinDto.setUser_id(promotionReviewDto.getUser_id());
		userCoinDto.setCoin_transaction(50);
		userCoinDto.setTransaction_operand("P");
		userCoinDto.setTransaction_detail("리워드 포인트 적립");
		
	    
		userSqlMapper.insertUserCoin(userCoinDto);
	   
	  
		
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
	
	
	// 세연 - 커뮤니티 내가 쓴 게시글(구인구직) 불러오기
	public List<Map<String, Object>> getRecruitByMyPost(int user_id) {

		List<RecruitDto> recruitMyPostList = userSqlMapper.selectRecruitByMyPost(user_id);
		
		List<Map<String, Object>> recruitPostMyPostList = new ArrayList<>();	

		for(RecruitDto recruitDto : recruitMyPostList) {
			Map<String, Object> map = new HashMap<>();
			
			UserDto userDto = userSqlMapper.selectUserDtoById(recruitDto.getUser_id());
			// 좋아요
			int countLikeByRecruit = recruitSqlMapper.countLikeByRecruitBoardId(recruitDto.getId());
			
			map.put("userDto", userDto);
			map.put("recruitDto", recruitDto);
			map.put("countLikeByRecruit", countLikeByRecruit);
			
			recruitPostMyPostList.add(map);
			
		}
		
		return recruitPostMyPostList;
	}
	
	// 세연 - 커뮤니티 내가 쓴 게시글(해주세요) 불러오기
		public List<Map<String, Object>> getHelpByMyPost(int user_id) {

			List<HelpDto> helpMyPostList = userSqlMapper.selectHelpByMyPost(user_id);
			
			List<Map<String, Object>> helpPostMyPostList = new ArrayList<>();
			
			for(HelpDto helpDto : helpMyPostList) {
				Map<String, Object> map = new HashMap<>();
				
				UserDto userDto = userSqlMapper.selectUserDtoById(helpDto.getUser_id());
				
				List<HelpImgDto> helpImgList = helpSqlMapper.selectHelpBoardImageByHelpId(helpDto.getId());
				// 댓글
				int countHelpComment = helpSqlMapper.selectAllHelpCommentCountByBoardId(helpDto.getId());
				// 좋아요
				int countLikeByHelp= helpSqlMapper.selectAllHelpLikeCountByBoardId(helpDto.getId());
				
				map.put("userDto", userDto);
				map.put("helpDto", helpDto);
				map.put("helpImgList", helpImgList);
				map.put("countHelpComment", countHelpComment);
				map.put("countLikeByHelp", countLikeByHelp);
				
				helpPostMyPostList.add(map);
				
			}
			
			return helpPostMyPostList;
		}
	
	// 세연 - 커뮤니티 내가 쓴 게시글(골라줘요) 불러오기
	public List<Map<String, Object>> getPickByMyPost(int user_id) {

		List<PickDto> pickMyPostList = userSqlMapper.selectPickByMyPost(user_id);
		
		List<Map<String, Object>> pickPostMyPostList = new ArrayList<>();
		
		for(PickDto pickDto : pickMyPostList) {
			Map<String, Object> map = new HashMap<>();
			
			UserDto userDto = userSqlMapper.selectUserDtoById(pickDto.getUser_id());
			
			// 댓글 
			int countPickComment = pickSqlMapper.countPickCommentByBoardId(pickDto.getId());			
			// 좋아요
			int countLikeByPick = pickSqlMapper.countLikeByPickBoardId(pickDto.getId());
			
			map.put("userDto", userDto);
			map.put("pickDto", pickDto);
			map.put("countPickComment", countPickComment);
			map.put("countLikeByPick", countLikeByPick);
			
			pickPostMyPostList.add(map);
			
		}
		
		return pickPostMyPostList;
	}
	
	// 세연 - 커뮤니티 내가 쓴 게시글(궁금해요) 불러오기
		public List<Map<String, Object>> getQuestionByMyPost(int user_id) {

		    List<QuestionDto> questionMyPostList = userSqlMapper.selectQuestionByMyPost(user_id);
		    
		    List<Map<String, Object>> questionPostMyPostList = new ArrayList<>();

		    for (QuestionDto questionDto : questionMyPostList) {
		        Map<String, Object> map = new HashMap<>();

		        UserDto userDto = userSqlMapper.selectUserDtoById(questionDto.getUser_id());
				
				List<QuestionImgDto> questionImgList = questionSqlMapper.selectQuestionBoardImageByQuestionId(questionDto.getId());

				// 궁금해요 댓글 갯수 가져오는거 연결
			//	int countQuestionComment = questionSqlMapper.
				
				// 궁금해요 좋아요 갯수 가져오는거 연결
			//	int countLikeByQuestion = questionSqlMapper.
				
				map.put("userDto", userDto);
				map.put("questionDto", questionDto);
				map.put("questionImgList", questionImgList);
			//	map.put("countQuestionComment", countQuestionComment);
			//	map.put("countLikeByQuestion", countLikeByQuestion);

				questionPostMyPostList.add(map);
		        
		    }

		    return questionPostMyPostList;
		}
	
	// 세연 - 커뮤니티 좋아요한 게시글(리워드 리뷰) 불러오기
	public List<Map<String, Object>> getPromoReviewByUserLikes(int user_id) {

	    List<PromotionReviewDto> promoReviewMyLikeList = promotionReviewMapper.getPromoReviewLikePost(user_id);
	    
	    List<Map<String, Object>> promoReviewByMyLikeList = new ArrayList<>();

	    for (PromotionReviewDto promotionReviewDto : promoReviewMyLikeList) {
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

	        promoReviewByMyLikeList.add(map);
	        
	    }

	    return promoReviewByMyLikeList;
	}
		
	// 세연 - 커뮤니티 좋아요한 게시글(구인구직) 불러오기
	public List<Map<String, Object>> getRecruitByUserLikes(int user_id) {

	    List<RecruitDto> recruitMyLikeList = userSqlMapper.selectRecruitByPostMyLike(user_id);
	    
	    List<Map<String, Object>> recruitByMyLikeList = new ArrayList<>();

	    for (RecruitDto recruitDto : recruitMyLikeList) {
	        Map<String, Object> map = new HashMap<>();

	        UserDto userDto = userSqlMapper.selectUserDtoById(recruitDto.getUser_id());
	    // 좋아요
	   	int countLikeByRecruit = recruitSqlMapper.countLikeByRecruitBoardId(recruitDto.getId());
			
			map.put("userDto", userDto);
			map.put("recruitDto", recruitDto);
			map.put("countLikeByRecruit", countLikeByRecruit);

			recruitByMyLikeList.add(map);
	        
	    }

	    return recruitByMyLikeList;
	}
		
	
	// 세연 - 커뮤니티 좋아요한 게시글(해주세요) 불러오기
	public List<Map<String, Object>> getHelpByUserLikes(int user_id) {

	    List<HelpDto> helpMyLikeList = userSqlMapper.selectHelpByPostMyLike(user_id);
	    
	    List<Map<String, Object>> helpByMyLikeList = new ArrayList<>();

	    for (HelpDto helpDto : helpMyLikeList) {
	        Map<String, Object> map = new HashMap<>();

	        UserDto userDto = userSqlMapper.selectUserDtoById(helpDto.getUser_id());
			
			List<HelpImgDto> helpImgList = helpSqlMapper.selectHelpBoardImageByHelpId(helpDto.getId());

			// 댓글
			int countHelpComment = helpSqlMapper.selectAllHelpCommentCountByBoardId(helpDto.getId());
			// 좋아요
			int countLikeByHelp= helpSqlMapper.selectAllHelpLikeCountByBoardId(helpDto.getId());
			
			map.put("userDto", userDto);
			map.put("helpDto", helpDto);
			map.put("helpImgList", helpImgList);
			map.put("countHelpComment", countHelpComment);
			map.put("countLikeByHelp", countLikeByHelp);

			helpByMyLikeList.add(map);
	        
	    }

	    return helpByMyLikeList;
	}
	
	// 세연 - 커뮤니티 좋아요한 게시글(골라줘요) 불러오기
	public List<Map<String, Object>> getPickByUserLikes(int user_id) {

	    List<PickDto> pickMyLikeList = userSqlMapper.selectPickByPostMyLike(user_id);
	    
	    List<Map<String, Object>> pickByMyLikeList = new ArrayList<>();

	    for (PickDto pickDto : pickMyLikeList) {
	        Map<String, Object> map = new HashMap<>();

	        UserDto userDto = userSqlMapper.selectUserDtoById(pickDto.getUser_id());
			
	        // 댓글 
			int countPickComment = pickSqlMapper.countPickCommentByBoardId(pickDto.getId());			
			// 좋아요
			int countLikeByPick = pickSqlMapper.countLikeByPickBoardId(pickDto.getId());
			
			map.put("userDto", userDto);
			map.put("pickDto", pickDto);
			map.put("countPickComment", countPickComment);
			map.put("countLikeByPick", countLikeByPick);

			pickByMyLikeList.add(map);
	        
	    }

	    return pickByMyLikeList;
	}
	
	
	// 세연 - 커뮤니티 좋아요한 게시글(궁금해요) 불러오기
	public List<Map<String, Object>> getQuestionByUserLikes(int user_id) {

	    List<QuestionDto> questionMyLikeList = userSqlMapper.selectQuestionByPostMyLike(user_id);
	    
	    List<Map<String, Object>> questionByMyLikeList = new ArrayList<>();

	    for (QuestionDto questionDto : questionMyLikeList) {
	        Map<String, Object> map = new HashMap<>();

	        UserDto userDto = userSqlMapper.selectUserDtoById(questionDto.getUser_id());
			
			List<QuestionImgDto> questionImgList = questionSqlMapper.selectQuestionBoardImageByQuestionId(questionDto.getId());

			// 궁금해요 댓글 갯수 가져오는거 연결
		//	int countQuestionComment = questionSqlMapper.
			
			// 궁금해요 좋아요 갯수 가져오는거 연결
		//	int countLikeByQuestion = questionSqlMapper.
			
			map.put("userDto", userDto);
			map.put("questionDto", questionDto);
			map.put("questionImgList", questionImgList);
		//	map.put("countQuestionComment", countQuestionComment);
		//	map.put("countLikeByQuestion", countLikeByQuestion);

			questionByMyLikeList.add(map);
	        
	    }

	    return questionByMyLikeList;
	}

	
	// 대여 - 좋아요 리스트 불러오기
	public List<Map<String, Object>> getRentalItemLikeList(int id) {
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		List<RentalItemLikeDto> rentalItemLikeList = rentalSqlMapper.selectRentalItemLikeAll(id);
		
		for(RentalItemLikeDto rentalItemLike : rentalItemLikeList ) {
			Map<String, Object> map = new HashMap<>();
			
			RentalItemDto rentalItemDto = rentalSqlMapper.selectById(rentalItemLike.getItem_id());
			
			map.put("rentalItemLike", rentalItemLike);
			map.put("rentalItemDto", rentalItemDto);
			
			list.add(map);
		}
		return list;
	}
	
}
