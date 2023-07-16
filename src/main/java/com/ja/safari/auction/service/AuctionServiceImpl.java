package com.ja.safari.auction.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.safari.auction.mapper.AuctionSqlMapper;
import com.ja.safari.dto.AuctionBidDto;
import com.ja.safari.dto.AuctionDeliveryDto;
import com.ja.safari.dto.AuctionItemChatroomDto;
import com.ja.safari.dto.AuctionItemDto;
import com.ja.safari.dto.AuctionItemImgDto;
import com.ja.safari.dto.AuctionItemInquiryDto;
import com.ja.safari.dto.AuctionItemLikeDto;
import com.ja.safari.dto.AuctionItemReplyDto;
import com.ja.safari.dto.AuctionKakaoPayApproveDto;
import com.ja.safari.dto.AuctionPurchaseConfirmedDto;
import com.ja.safari.dto.AuctionQnADto;
import com.ja.safari.dto.ProductMainCategoryDto;
import com.ja.safari.dto.ProductSubCategoryDto;
import com.ja.safari.dto.UserCoinDto;
import com.ja.safari.dto.UserDto;
import com.ja.safari.user.mapper.UserSqlMapper;

@Service
public class AuctionServiceImpl {
	
	@Autowired
	private AuctionSqlMapper auctionSqlMapper;
	@Autowired
	private UserSqlMapper userSqlMapper;
	
	// 경매 물품 등록 페이지 이동하면 대규모 카테고리 리스트 출력
	public List<ProductMainCategoryDto> getProductMainCategories() {
		return auctionSqlMapper.getProductMainCategories();
	}
	
	// 경매 물품 등록 시 대규모 카테고리 선택할 때 소규모 카테고리 리스트 출력
	public List<ProductSubCategoryDto> getProductSubCategoriesByMainCategoryId(int productMainCategoryId) {
		return auctionSqlMapper.getProductSubCategoriesByMainCategoryId(productMainCategoryId);
	}
	
	// 경매 등록
	public void registerAuctionProduct(AuctionItemDto auctionItemDto, List<AuctionItemImgDto> auctionItemImgDtoList) {
		
		int auctionItemPk = auctionSqlMapper.createPk();
		
		auctionItemDto.setId(auctionItemPk);
		
		auctionSqlMapper.registerAuctionProduct(auctionItemDto);
		
		// 제품 이미지 등록
		for (AuctionItemImgDto  auctionItemImgDto :  auctionItemImgDtoList) {
			auctionItemImgDto.setAuction_item_id(auctionItemPk);
			auctionSqlMapper.registerAuctionProductImage(auctionItemImgDto);
	}
		
	}
	
	// 메뉴바에 대규모 카테고리 리스트 조회
	public List<ProductMainCategoryDto> getProductMainCategoriesForMenu() {
		return auctionSqlMapper.getProductMainCategoriesForMenu();
	}
	
	// 경매 메인페이지에서 경매 리스트 조회 (대규모 카테고리) 
		public List<Map<String, Object>> getAuctionListByMainCategory(int id) {
			
			 List<Map<String, Object>> auctionMainList = new ArrayList<>();
			
			 List<AuctionItemDto> auctionDtoList = auctionSqlMapper.getAuctionListByMainCategory(id);
			 
			 for (AuctionItemDto auctionDto : auctionDtoList) {
				 
				 Map<String, Object> map = new HashMap<>();
				 
				 // 경매 리스트에서 회원의 닉네임을 출력
				 UserDto userDto = userSqlMapper.selectUserDtoById(auctionDto.getUser_seller_id());
				 
				 // 경매 리스트에서 메인 이미지 출력
				 AuctionItemImgDto auctionItemImgDto = auctionSqlMapper.getAuctionImg(auctionDto.getId());
				 
				 
				 map.put("userDto", userDto);
				 map.put("auctionImgDto", auctionItemImgDto);
				 map.put("auctionDto", auctionDto);
				 map.put("bidCount", auctionSqlMapper.getBidCount(auctionDto.getId()));
				 
				 auctionMainList.add(map);
			 }
				
			return auctionMainList;
		}
	
	
	
	
	// 경매 메인페이지에서 경매 리스트 조회 (소규모 카테고리) 
	public List<Map<String, Object>> getAuctionListBySubCategory(int id) {
		
		 List<Map<String, Object>> auctionSubList = new ArrayList<>();
		
		 List<AuctionItemDto> auctionDtoList = auctionSqlMapper.getAuctionListBySubCategory(id);
		 
		 for (AuctionItemDto auctionDto : auctionDtoList) {
			 
			 Map<String, Object> map = new HashMap<>();
			 
			 // 경매 리스트에서 회원의 닉네임을 출력
			 UserDto userDto = userSqlMapper.selectUserDtoById(auctionDto.getUser_seller_id());
			 
			 // 경매 리스트에서 메인 이미지 출력
			 AuctionItemImgDto auctionItemImgDto = auctionSqlMapper.getAuctionImg(auctionDto.getId());
			 
			 
			 map.put("userDto", userDto);
			 map.put("auctionImgDto", auctionItemImgDto);
			 map.put("auctionDto", auctionDto);
			 map.put("bidCount", auctionSqlMapper.getBidCount(auctionDto.getId()));
			 
			 auctionSubList.add(map);
		 }
			
		return auctionSubList;
	}
	
	
	
	// 경매 메인페이지에서 경매 리스트 조회 (물품 종류에 관계없이 전체보기) 
	public List<Map<String, Object>> getAuctionList() {
		
		List<Map<String, Object>> auctionList = new ArrayList<>();
		
		 List<AuctionItemDto> auctionDtoList = auctionSqlMapper.getAuctionList();
		 
		 for (AuctionItemDto auctionDto : auctionDtoList) {
			 
			 Map<String, Object> map = new HashMap<>();
			 
			 // 경매 리스트에서 회원의 닉네임을 출력
			 UserDto userDto = userSqlMapper.selectUserDtoById(auctionDto.getUser_seller_id());
			 
			 // 경매 리스트에서 메인 이미지 출력
			 AuctionItemImgDto auctionItemImgDto = auctionSqlMapper.getAuctionImg(auctionDto.getId());
			 
			 
			 map.put("userDto", userDto);
			 map.put("auctionImgDto", auctionItemImgDto);
			 map.put("auctionDto", auctionDto);
			 map.put("bidCount", auctionSqlMapper.getBidCount(auctionDto.getId()));
			 
			  
			 auctionList.add(map);
		 }
			
		return auctionList;
	}
	
	// 경매 메인페이지에서 상태에 따른 경매 조회 
	public List<Map<String, Object>> getAuctionListByStatus(String status) {
		
		List<Map<String, Object>> auctionList = new ArrayList<>();
		
		 List<AuctionItemDto> auctionDtoList = auctionSqlMapper.getAuctionListByStatus(status);
		 
		 for (AuctionItemDto auctionDto : auctionDtoList) {
			 
			 Map<String, Object> map = new HashMap<>();
			 
			 // 경매 리스트에서 회원의 닉네임을 출력
			 UserDto userDto = userSqlMapper.selectUserDtoById(auctionDto.getUser_seller_id());
			 
			 // 경매 리스트에서 메인 이미지 출력
			 AuctionItemImgDto auctionItemImgDto = auctionSqlMapper.getAuctionImg(auctionDto.getId());
			 
			 
			 map.put("userDto", userDto);
			 map.put("auctionImgDto", auctionItemImgDto);
			 map.put("auctionDto", auctionDto);
			 map.put("bidCount", auctionSqlMapper.getBidCount(auctionDto.getId()));
			 
			  
			 auctionList.add(map);
		 }
			
		return auctionList;
	}
	
	
	
	
	// 경매 수정
	public void modifyAuctionProduct(AuctionItemDto auctionItemDto, List<AuctionItemImgDto> auctionItemImgDtoList) {
		
		// 제품 이미지 등록
		for (AuctionItemImgDto  auctionItemImgDto :  auctionItemImgDtoList) {
			auctionItemImgDto.setAuction_item_id(auctionItemDto.getId());
			auctionSqlMapper.registerAuctionProductImage(auctionItemImgDto);
	}

		auctionSqlMapper.modifyAuctionProduct(auctionItemDto);

	}
	
	
	// 경매 삭제
	public void removeAuctionProduct(int id) {
		
		// 이미지 삭제
		auctionSqlMapper.removeAuctionProductImage(id);
		// 물품 삭제
		auctionSqlMapper.removeAuctionProduct(id);
		
		// 좋아요도 삭제 처리해주어야함 추후에 코드 추가
		
		// 채팅 삭제
		auctionSqlMapper.deleteAllChat(id);
		
		// 입찰 삭제
		auctionSqlMapper.deleteAllBid(id);
		
		// 결제 삭제
		auctionSqlMapper.removePayData(id);
		
		
	}
	
	// 경매 이미지만 삭제
	public void removeAuctionProductImage(int id) {
		// 이미지 삭제
		auctionSqlMapper.removeAuctionProductImage(id);
	}
	
	// 경매 물품 하나만 조회
	public AuctionItemDto getAuctionItem(int id) {
		return auctionSqlMapper.getAuctionProductDetail(id);
	}
	
	
	
	// 경매 물품 대규모 카테고리명 조회
	public ProductMainCategoryDto getProductMainCategory(int id) {
		return auctionSqlMapper.getProductMainCategory(id);
	}
	
	// 경매 물품 소규모 카테고리명 조회
	public ProductSubCategoryDto getProductSubCategory(int id) {
		return auctionSqlMapper.getAuctionProductSubCategory(id);
	}
	
	
	// 경매 물품 상세페이지 접속
	public Map<String, Object> getAuctionProductDetail(int id) {
		
		Map<String, Object> map = new HashMap<>();

		AuctionItemDto auctionDto = auctionSqlMapper.getAuctionProductDetail(id);
		map.put("auctionDto", auctionDto); 
		
		//UserDto userDto = userSqlMapper.getUserInfoById(auctionDto.getUser_seller_id());
		
		//map.put("userDto", userDto);

		AuctionItemImgDto auctionItemImgDto = auctionSqlMapper.getAuctionImg(auctionDto.getId());
	
		map.put("auctionMainImgDto", auctionItemImgDto); 
		
		map.put("auctionImgDtoList", auctionSqlMapper.getAuctionProductImages(auctionDto.getId()));
		
		map.put("bidCount", auctionSqlMapper.getBidCount(id));
		
		
		// 잠시 보류
		/*map.put("maxBidPrice", auctionSqlMapper.getMaxBidPriceByAuctionItem(auctionDto.getId()));*/
		
		
		
		// 대규모, 소규모 카테고리 화면에 보이게 하기
		ProductSubCategoryDto productSubCategoryDto = 
							auctionSqlMapper.getProductSubCategory(auctionDto.getAuction_sub_category_id());
		ProductMainCategoryDto productMainCategoryDto = 
						auctionSqlMapper.getProductMainCategory(productSubCategoryDto.getProduct_main_category_id());
		
		map.put("productSubCategoryDto", productSubCategoryDto);
		map.put("productMainCategoryDto", productMainCategoryDto);
		
		return map;
	}
	
	
	// 경매 상품 문의 등록
	public void registerAuctionInquiry(AuctionItemInquiryDto auctionItemInquiryDto) {
		auctionSqlMapper.registerAuctionInquiry(auctionItemInquiryDto);
	}

	// 경매 상품 문의 답변 등록 
	public void registerAuctionReply(AuctionItemReplyDto auctionItemReplyDto) {
		auctionSqlMapper.registerAuctionReply(auctionItemReplyDto);
	}
	
	// 경매 상품 당 문의 리스트 조회 
	public List<AuctionQnADto> getAuctionQnAList(int auctionItemId) {
		return auctionSqlMapper.getAuctionQnAList(auctionItemId);
	}
	
	
	// 경매 종료 시간 실시간으로 받아오기
	public AuctionItemDto getAuctionEndTimeInRealTime(int auctionItemId) {
		return auctionSqlMapper.getAuctionEndTimeInRealTime(auctionItemId);
	}
	
	// 경매 현재가 계속 업데이트
	public Integer getCurrentPriceByAuctionItem(int auctionItemId) {
		return auctionSqlMapper.getCurrentBidPriceByAuctionItem(auctionItemId);
	}
	
	
	// 입찰하기 
	public synchronized boolean submitBidRequest(AuctionBidDto auctionBidDto) {
		
			if (auctionBidDto.getBid_price() > auctionSqlMapper.checkBidAttemptYn(auctionBidDto.getAuction_item_id())) {
				auctionSqlMapper.submitBidRequest(auctionBidDto);
				return true;
			} else {
				return false;
			 }
		
}

	
	// 한 경매의 입찰 순위 3위까지 출력
	public List<Map<String, Object>> getAuctionTop3BidPrice(int auctionItemId) {
		
		List<Map<String, Object>> top3BidList = new ArrayList<>();
		
		List<AuctionBidDto> getTop3BidList = auctionSqlMapper.getAuctionTop3BidPrice(auctionItemId);
		
		for(AuctionBidDto auctionBidDto : getTop3BidList) {
			
			Map<String, Object> map = new HashMap<>();
			
			UserDto userDto = userSqlMapper.selectUserDtoById(auctionBidDto.getUser_buyer_id());
			
			map.put("userDto", userDto);
			map.put("auctionBidDto", auctionBidDto);
			
			top3BidList.add(map);
		}
		
		return top3BidList;
	}
	


	// 입찰버튼 갱신하기 위해 경매 상태 조회
	public AuctionItemDto getStatusForRenewInputBidBox(int auctionItemId) {
		return auctionSqlMapper.getStatusForRenewInputBidBox(auctionItemId);
	}
	
	// 경매 입찰 수 조회
	public int getBidCount(int auctionItemId) {
		return auctionSqlMapper.getBidCount(auctionItemId);
	}
	
	
	
	// 현 시간 각 경매의 최고 입찰자가 누구인지 회원pk로 출력하기
	public Integer checkNowMaxBiderByAuctionItemId(int auctionItemId) {
		
		int  user_buyer_id; // 최고 입찰자를 담을 변수
		
		// 아무도 입찰 안했을 경우 에러처리
		if (auctionSqlMapper.checkNowMaxBiderByAuctionItemId(auctionItemId) == null) { 
			user_buyer_id = 0;
		} else {
			user_buyer_id = auctionSqlMapper.checkNowMaxBiderByAuctionItemId(auctionItemId);
		}
		return user_buyer_id;
	}
	
	// 종료 시간이 1분 미만일 때 입찰하였을 경우, 경매 종료 시간 1분 늘리기
	public void renewEndTimeAuctionItem(int auctionItemId) {
		
		auctionSqlMapper.renewEndTimeAuctionItem(auctionItemId);
	}
	

	
	// 경매 물품 현재 상황 조회 
	public AuctionItemDto getAuctionStatusByAuctionItemId(int id) {
		return auctionSqlMapper.getAuctionStatusByAuctionItemId(id);
	}
	
	// 경매 시작일 도달 시 진행중 처리
	public void renewAuctionItemStatusIng(int id) {
		auctionSqlMapper.renewAuctionItemStatusIng(id);
	}
	
	// 경매 종료일 도달 시 경매 종료 처리
	public void renewAuctionItemStatusEnd(int id) {
		auctionSqlMapper.renewAuctionItemStatusEnd(id);
	}
	
	// 카운트다운 
	public AuctionItemDto getAuctionCountDown(int id) {
		return auctionSqlMapper.getAuctionCountDown(id);
	}
	
	// 즉시 낙찰 시 경매 종료 상태 업데이트
	public void renewImmediateSuccessfulBid(int id) {
		auctionSqlMapper.renewImmediateSuccessfulBid(id);
	}
	
	// 즉시 낙찰 시 날짜 상태 업데이트
	public void renewImmediateSuccessfulBidEndDate(int id) {
		auctionSqlMapper.renewImmediateSuccessfulBidEndDate(id);
	}
	
	// 입찰 정보 조회
	public Map<String, Object> getBidInfo(int id) {
		
		Map<String, Object> map = new HashMap<>();
		
		 AuctionBidDto auctionBidDto = auctionSqlMapper.getBidInfo(id);
		 
		 UserDto userDto = userSqlMapper.selectUserDtoById(auctionBidDto.getUser_buyer_id());
		 
		 AuctionItemDto auctionItemDto = auctionSqlMapper.getAuctionProductDetail(auctionBidDto.getAuction_item_id());
		 
		 map.put("auctionBidDto", auctionItemDto);
		 map.put("userDto", userDto);
		 map.put("auctionItemDto", auctionItemDto );
		 
		 return map;

	}
	
	
	// 한 경매의 입찰 리스트 출력
	public List<Map<String, Object>> getBidList(int auctionItemId) {
		
		List<Map<String, Object>> bidList = new ArrayList<>();
		
		List<AuctionBidDto> auctionbidDtoList = auctionSqlMapper.getBidList(auctionItemId);
		
		for(AuctionBidDto auctionBidDto : auctionbidDtoList) {
			
			Map<String, Object> map = new HashMap<>();
			
			UserDto userDto = userSqlMapper.selectUserDtoById(auctionBidDto.getUser_buyer_id());
			
			map.put("userDto", userDto);
			map.put("auctionBidDto", auctionBidDto);
			
			bidList.add(map);
		}
		
		return bidList;
	}
	
	
	
	
	// 경매 찜하기 아이콘 클릭
	public void toggleLikeAuctionProduct(AuctionItemLikeDto auctionItemLikeDto) {
		
		if (auctionSqlMapper.checklikeAuctionProductByUser(auctionItemLikeDto) > 0) {
			auctionSqlMapper.unlikeAuctionProduct(auctionItemLikeDto);
		} else {
			auctionSqlMapper.likeAuctionProduct(auctionItemLikeDto);
		}
	}
	
	// 고객이 하나의 경매 상품에 대하여 찜하기를 하였는지 확인
	public boolean checklikeAuctionProductByUser(AuctionItemLikeDto auctionItemLikeDto) {
		return auctionSqlMapper.checklikeAuctionProductByUser(auctionItemLikeDto) > 0;
	}
	
	// 경매물품 당 좋아요 개수 
	public int countLikeAuctionProduct(int auctionItemId) {
		return auctionSqlMapper.countLikeAuctionProduct(auctionItemId);
	}

	// 경매 채팅방에서 채팅 입력
	public void sendMessageInAuctionChatroom(AuctionItemChatroomDto auctionItemChatroomDto) {
		auctionSqlMapper.sendMessageInAuctionChatroom(auctionItemChatroomDto);
	}
	
	// 경매 채팅방에서 채팅 기록 조회
	public List<Map<String, Object>> getChatHistoryInAuctionChatroom(int auctionItemId) {
		
		List<Map<String, Object>> chatList = new ArrayList<>();
		
		List<AuctionItemChatroomDto> chatDtoList = auctionSqlMapper.getChatHistoryInAuctionChatroom(auctionItemId);
		
		for (AuctionItemChatroomDto chatDto : chatDtoList) {
			
			Map<String, Object> map = new HashMap<>();
			
			UserDto userDto = userSqlMapper.selectUserDtoById(chatDto.getUser_id());
			
			map.put("userDto", userDto);
			map.put("chatDto", chatDto);
			
			chatList.add(map);
		}
		return chatList;
	}
	
	// 경매 채팅방에서 내 채팅 삭제
	public void removeMessageInAuctionChatroom(int id) {
		auctionSqlMapper.removeMessageInAuctionChatroom(id);
	}
	
	// 경매 마이페이지에서 내 입찰 기록 조회
	public List<Map<String, Object>> getBidHistoryByUser(int userBuyerId) {
		
		List<Map<String, Object>> bidHistoryList = new ArrayList<>();
		
		List<AuctionBidDto> bidHistoryDtoList = auctionSqlMapper.getBidHistoryByUser(userBuyerId);
		
		for (AuctionBidDto  bidHistoryDto : bidHistoryDtoList) {
			
			Map<String, Object> map = new HashMap<>();
			
			map.put("bidHistoryItemDto", auctionSqlMapper.getAuctionProductDetail(bidHistoryDto.getAuction_item_id()));
		
			map.put("bidHistoryImgDto", auctionSqlMapper.getAuctionImg(bidHistoryDto.getAuction_item_id()));
			
			map.put("bidHistoryDto", bidHistoryDto);
			
			 bidHistoryList.add(map);

		}
		return bidHistoryList;
	}
	

	
	 // 마이페이지 - 내가 입찰한 기록 조회
	public List<AuctionItemDto> getMyBidList(int userBuyerId) {
		return auctionSqlMapper.getMyBidList(userBuyerId);
	}
	
	// 마이페이지 - 낙찰된 경매 하나하나 결제하기 위해 주문 창 조회
	public AuctionBidDto getOrderPageBySuccessBidPk(AuctionBidDto auctionBidDto) {
		
		return auctionSqlMapper.getOrderPageBySuccessBidPk(auctionBidDto);
	}
	
	
	// 마이페이지 - 낙찰 기록 조회
	public List<AuctionBidDto> getMySueecssfulBidList(int userBuyerId) {
		
		return auctionSqlMapper.getMySueecssfulBidList(userBuyerId);
	}
	
	// 마이페이지 - 낙찰된 건 (배송 조회)
	public List<AuctionBidDto> getMySuccessfulBidPayAndDeliveryStatusList(int userBuyerId) {
		
		return auctionSqlMapper.getMySuccessfulBidPayAndDeliveryStatusList(userBuyerId);
	}
	
	// 마이페이지 - 찜 목록 조회
	public List<AuctionItemDto> getMyAuctionWishList(int userBuyerId) {
		return auctionSqlMapper.getMyAuctionWishList(userBuyerId);
	}
	
	//  마이페이지 - 경매 업로더 입장에서 입찰정보가 없을 경우 제품 정보 조회
	public  List<AuctionItemDto> getAuctionInfoByUploader(int userSellerId) {
		
		return auctionSqlMapper.getAuctionInfoByUploader(userSellerId);
	}
	
	
	// 마이페이지 - 경매 업로더 입장에서 낙찰자 정보와 경매 물품 정보 조회
	public List<AuctionBidDto> getAuctionAndBidInfoByUploader(int userSellerId) {
	
		return auctionSqlMapper.getAuctionAndBidInfoByUploader(userSellerId);
	}
	
	// 경매 업로더 입장에서 결제 여부 조회
	public List<AuctionBidDto> getPayYnByUploader(int userSellerId) {
		
		return auctionSqlMapper.getPayYnByUploader(userSellerId);
	}
	
	// 경매 업로더 - 최고 입찰자, 낙찰자 조회
	public AuctionBidDto getMaxBiderNickname(int userSellerId, int auctionItemId) {
		
		return auctionSqlMapper.getMaxBiderNickname(userSellerId, auctionItemId);
	}
	
	// 경매 업로더 - 종료된 경매에서 상품 정보와 결제 상태 확인
	public List<AuctionBidDto> getEndedAuctionAndPayYnInfoByUploader(int userSellerId) {
		
		return auctionSqlMapper.getEndedAuctionAndPayYnInfoByUploader(userSellerId);
	}
	
	
	// 경매 카카오페이 결제 정보 저장
	public void saveAuctionKakaoPayInfo(AuctionKakaoPayApproveDto auctionKakaoPayApproveDto) {
		auctionSqlMapper.saveAuctionKakaoPayInfo(auctionKakaoPayApproveDto);
	}
	
	// 경매 카카오페이 결제 정보 조회 (수정해야함)
	public Map<String, Object>  getAuctionKakaoPayInfo(Integer id) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("auctionPayment", auctionSqlMapper.getAuctionKakaoPayInfo(id));
		
	
		return map;
	}
	
	
	// 경매 낙찰 후 결제하여 코인 차감
	public void reduceUserCoinByAuction(UserCoinDto userCoinDto) {
		auctionSqlMapper.reduceUserCoinByAuction(userCoinDto);
	}
	
	// 결제 시 경매 판매자 정보 조회
	public UserDto getUserSellerInfoByAuctionPay(int partnerOrderId) {
		return auctionSqlMapper.getUserSellerInfoByAuctionPay(partnerOrderId);
	}
	
	// 구매자가 경매 낙찰 후 결제하면 판매자는 코인 획득
	public void increaseUserCoinByAuction(UserCoinDto userCoinDto) {
		auctionSqlMapper.increaseUserCoinByAuction(userCoinDto);
	}
	
	// 경매 업로더의 입장에서 종료된 경매 리스트 상태 조회
	public List<AuctionBidDto> getEndedAuctionlist(int userSellerId) {
		return auctionSqlMapper.getEndedAuctionlist(userSellerId);
	}
	
	
	// 배송 시작 (낙찰자가 결제하면 배송준비중, 판매자가 배송처리 누르는순간 배송중)
	public void startAuctionDelivery(int partnerOrderId) {
		auctionSqlMapper.startAuctionDelivery(partnerOrderId);
	}

	// 배송 조회
	public AuctionDeliveryDto checkAutionDeliveryStatus(int partnerOrderId) {
		return auctionSqlMapper.checkAutionDeliveryStatus(partnerOrderId);
	}
	
	// 배송 3일 지나면 배송완료 처리
	public void completeAuctionDelivery(int partnerOrderId) {
		auctionSqlMapper.completeAuctionDelivery(partnerOrderId);
	}
	
	// 구매 확정
	public void registerPurchaseConfirmed(AuctionPurchaseConfirmedDto auctionPurchaseConfirmedDto) {
		auctionSqlMapper.registerPurchaseConfirmed(auctionPurchaseConfirmedDto);
	}
	
	//  구매 확정 여부 조회
	public int checkPurchaseConfirmedYn(int partnerOrderId) {
		return auctionSqlMapper.checkPurchaseConfirmedYn(partnerOrderId);
	}

	
}
