package com.ja.safari.auction.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ja.safari.dto.AuctionBidDto;
import com.ja.safari.dto.AuctionDeliveryDto;
import com.ja.safari.dto.AuctionDeliveryTrackingDto;
import com.ja.safari.dto.AuctionItemChatroomDto;
import com.ja.safari.dto.AuctionItemDto;
import com.ja.safari.dto.AuctionItemImgDto;
import com.ja.safari.dto.AuctionItemInquiryDto;
import com.ja.safari.dto.AuctionItemLikeDto;
import com.ja.safari.dto.AuctionItemOrderAddressDto;
import com.ja.safari.dto.AuctionItemOrderPaymentDto;
import com.ja.safari.dto.AuctionItemReplyDto;
import com.ja.safari.dto.AuctionKakaoPayApproveDto;
import com.ja.safari.dto.AuctionPurchaseConfirmedDto;
import com.ja.safari.dto.AuctionQnADto;
import com.ja.safari.dto.ProductMainCategoryDto;
import com.ja.safari.dto.ProductSubCategoryDto;
import com.ja.safari.dto.UserAddressDto;
import com.ja.safari.dto.UserCoinDto;
import com.ja.safari.dto.UserDto;

public interface AuctionSqlMapper {
	
	// 경매 물품 등록 시퀀스 
	public int createPk();
	
	// 경매 물품 등록 페이지 이동하면 대규모 카테고리 리스트 출력
	public List<ProductMainCategoryDto> getProductMainCategories();
	
	// 경매 물품 등록 시 대규모 카테고리 선택할 때 소규모 카테고리 리스트 출력
	public List<ProductSubCategoryDto> getProductSubCategoriesByMainCategoryId(int productMainCategoryId);
	
	// 경매 메인페이지에서 상태에 따른 경매 조회
	public List<AuctionItemDto> getAuctionListByStatus(@Param("status") String status);
	
	
	// 물품의 대규모 카테고리는 무엇일까요?
	public ProductMainCategoryDto getProductMainCategory(int id);
	
	// 물품의 소규모 카테고리는 무엇일까요?
	public ProductSubCategoryDto getProductSubCategory(int id);	
	
	// 경매 등록
	public void registerAuctionProduct(AuctionItemDto auctionItemDto);
	
	// 경매 물품 이미지 등록
	public void registerAuctionProductImage(AuctionItemImgDto auctionItemImgDto);
	
	// 경매 수정
	public void modifyAuctionProduct(AuctionItemDto auctionItemDto);
	
	// 경매 이미지 수정
	public void modifyAuctionProductImage(AuctionItemImgDto auctionItemImgDto);
	
	// 경매 삭제
	public void removeAuctionProduct(int id);
	
	// 경매 물품 이미지 삭제 
	public void removeAuctionProductImage(int auctionItemId);
	
	// 경매 메인페이지에서 경매 리스트 조회 (물품 종류에 관계없이 전체보기) 
	public List<AuctionItemDto> getAuctionList();
	
	// 경매 메인페이지에서 경매 리스트 조회 시 이미지 출력 (물품 종류에 관계없이 전체보기) 
	public AuctionItemImgDto getAuctionImg(int auctionItemId);
	
	// 경매 메인 페이지에서 대규모 카테고리 조회
	public List<ProductMainCategoryDto> getProductMainCategoriesForMenu();
	
	// 경매 메인페이지에서 대규모 카테고리 클릭 시 그에 해당하는 경매 리스트 조회
	public List<AuctionItemDto>  getAuctionListByMainCategory(int id);
	
	//  경매 메인페이지에서 소규모 카테고리 클릭 시 그에 해당하는 경매 리스트 조회
	public List<AuctionItemDto> getAuctionListBySubCategory(int id);
	
	// 경매 물품 상세페이지
	public AuctionItemDto getAuctionProductDetail(int id);
	
	// 경매 물품 상세페이지 (이미지)
	public List<AuctionItemImgDto> getAuctionProductImages(int auctionItemId);
	
	// 경매 상품 문의 등록
	public void registerAuctionInquiry(AuctionItemInquiryDto auctionItemInquiryDto);
	
	// 경매 상품 문의 삭제
	public void removeAuctionInquiry(int id);
	
	// 경매 상품 문의 답변 등록 
	public void registerAuctionReply(AuctionItemReplyDto auctionItemReplyDto);
	
	// 경매 상품 문의 답변 삭제
	public void removeAuctionReply(int id);
	
	// 경매 상품 당 문의 리스트 조회 
	public List<AuctionQnADto> getAuctionQnAList(int auctionItemId);
	
	
	// 경매 종료 시간 실시간으로 받아오기
	public AuctionItemDto getAuctionEndTimeInRealTime(int auctionItemId);
	
	// 물품의 소규모 카테고리 조회
	public ProductSubCategoryDto getAuctionProductSubCategory(int id);
	
	// 입찰하기
	public void submitBidRequest(AuctionBidDto auctionBidDto);
	
	// 입찰하기 직전 내가 입찰할 수 있는 금액인지 확인
	public int checkBidAttemptYn(int auctionItemId);
	
	// 입찰 정보 조회
	public AuctionBidDto getBidInfo(int id);
	
	// 현 시간 각 경매의 최고 입찰자가 누구인지 회원pk로 출력하기
	public Integer checkNowMaxBiderByAuctionItemId(int auctionItemId);
	
	// 종료 시간이 1분 미만일 때 입찰하였을 경우, 경매 종료 시간 1분 늘리기
	public void renewEndTimeAuctionItem(int auctionItemId);
	
	// 입찰하기 버튼 갱신하기 위해 경매 상태 확인
	public AuctionItemDto getStatusForRenewInputBidBox(int id);
	
	// 경매 물품 현재 상황 조회 
	public AuctionItemDto getAuctionStatusByAuctionItemId(int id);
	
	// 카운트다운 
	public AuctionItemDto getAuctionCountDown(int id);
	
	
	// 경매 시작일 도달 시 진행중 처리 
	public void renewAuctionItemStatusIng(int id);
	
	// 경매 종료일 도달 시 경매 종료 처리
	public void renewAuctionItemStatusEnd(int id);
	
	// 즉시 낙찰 시 경매 종료로 상태 업데이트
	public void renewImmediateSuccessfulBid(int id);
	
	// 즉시 낙찰 시 날짜 상태 업데이트
	public void renewImmediateSuccessfulBidEndDate(int id);
	
	// 한 경매의 입찰 리스트 출력
	public List<AuctionBidDto> getBidList(int auctionItemId);
	
	// 한 경매의 입찰 횟수 조회
	public int getBidCount(int auctionItemId);
	
	// 한 경매의 입찰 순위 3위까지 출력
	public List<AuctionBidDto> getAuctionTop3BidPrice(int auctionItemId);
	
	// 경매 현재가 계속 업데이트
	public Integer getCurrentBidPriceByAuctionItem(int auctionItemId);
	
	// 경매 입찰 가격이 즉시 낙찰 가격 이상인지 여부 확인
	public AuctionBidDto isBidPriceGreaterThanOrEqualToMaxPrice(int auctionItemId);
	
	// 회원의 입찰 기록 조회
	public List<AuctionBidDto> getBidHistoryByUser(int userBuyerId);
	
	//  마이페이지 - 내가 입찰한 기록 조회 (시간 업데이트 용도, id값만 필요함)
	public List<AuctionBidDto> getMyBidListForRealTime(int userBuyerId);
	
	// 회원의 경매 업로드 기록 조회
	public List<AuctionItemDto> getAuctionUploadHistoryByUser(int userSellerId);
	

	
	
	// 경매 찜하기 클릭
	public void likeAuctionProduct(AuctionItemLikeDto auctionItemLikeDto);
	
	// 경매 좋아요 삭제 (테스트용)
	public void deleteAllLike(int id);
	
	// 경매 좋아요 취소 
	public void unlikeAuctionProduct(AuctionItemLikeDto auctionItemLikeDto);
	
	// 고객 당 경매 좋아요 누른 개수 확인 
	public int checklikeAuctionProductByUser(AuctionItemLikeDto auctionItemLikeDto);
	
	// 경매물품 당 좋아요 개수 
	public int countLikeAuctionProduct(int auctionItemId);
	
	// 경매 마이페이지 - 찜 목록 (시간 업데이트용)
	public List<AuctionItemLikeDto> getMyWishListForRealTime(int userBuyerId);

	
	// 경매 채팅방에서 채팅 입력
	public void sendMessageInAuctionChatroom(AuctionItemChatroomDto auctionItemChatroomDto);
	
	// 경매 채팅방에서 채팅 기록 조회
	public List<AuctionItemChatroomDto> getChatHistoryInAuctionChatroom(int auctionItemId);
	
	// 경매 채팅방에서 내 채팅 삭제
	public void removeMessageInAuctionChatroom(int id);
	
	//경매 채팅방에 있는 입찰기록을 모두 삭제 (임시, 사용하면 안되는데 테스트용)
	public void deleteAllBid(int id);
	
	// 경매 채팅방에 있는 채팅을 모두 삭제 (임시, 사용하면 안되는데 테스트용)
	public void deleteAllChat(int id);
	
	// 마이페이지 - 내가 입찰한 기록 조회
	public List<AuctionItemDto> getMyBidList(int userBuyerId);
	
	// 마이페이지 - 내가 입찰한 기록 조회 (진행중)
	public List<AuctionItemDto> getMyBidListIng(int userBuyerId);
	
	// 마이페이지 - 낙찰된 경매 하나하나 결제하기 위해 주문 창 조회
	public AuctionItemOrderPaymentDto getOrderPageBySuccessBidPk(AuctionItemOrderPaymentDto auctionItemOrderPaymentDto);
	
	
	// 마이페이지 - 낙찰 기록 조회
	public List<AuctionBidDto> getMySueecssfulBidList(int userBuyerId);
	
	// 마이페이지 - 낙찰된 건 (배송 조회)
	public List<AuctionBidDto> getMySuccessfulBidPayAndDeliveryStatusList(int userBuyerId);
	
	// 마이페이지 - 찜 목록 조회
	public List<AuctionItemDto> getMyAuctionWishList(int userBuyerId);
	
	// 주문화면에서 배송지 변경 버튼 클릭 후 설정된 조회 
	public List<UserAddressDto> getMyAddressListInOrderPage(int userId);
	
	// 주문화면에서 배송지 변경 모달에서 주소 선택
	public UserAddressDto changeAddressInOrderPage(UserAddressDto userAddressDto);
	
	// 경매 낙찰 건에 대한 카카오페이 결제 정보 저장
	public void saveAuctionKakaoPayInfo(AuctionKakaoPayApproveDto auctionKakaoPayApproveDto);
	
	// 경매 낙찰 건에 대한 카카오페이 결제 정보 조회 
	public AuctionKakaoPayApproveDto getAuctionKakaoPayInfo(Integer id);
	
	// 경매 낙찰 후 결제하여 코인 차감
	public void reduceUserCoinByAuction(UserCoinDto userCoinDto);
	
	// 구매자 결제 시 배송 정보 저장하는 dto insert
	public void registerAddressInfoInPayment(AuctionItemOrderAddressDto auctionItemOrderAddressDto);
	
	// 결제 시 경매 판매자 정보 조회
	public UserDto getUserSellerInfoByAuctionPay(int partnerOrderId);
	
	// 구매자가 경매 낙찰 후 결제하면 판매자는 코인 획득
	public void increaseUserCoinByAuction(UserCoinDto userCoinDto);
	
	
	//  결제 정보 삭제 (테스트 데이터 삭제 위함 !! 사실 절대 사용하면 안됨)
	public void removePayData(int auctionItemId);
	
	// 경매 업로더 입장에서 입찰정보가 없을 경우 제품 정보 조회
	public List<AuctionItemDto> getAuctionInfoByUploader(int userSellerId);
	
	// 경매 업로더 입장에서 낙찰자 정보와 경매 물품 정보 조회
	public List<AuctionBidDto> getAuctionAndBidInfoByUploader(int userSellerId);
	
	// 경매 업로더 입장에서 결제 여부 조회
	public List<AuctionBidDto> getPayYnByUploader(int userSellerId);
	
	// 경매 업로더 - 최고 입찰자, 낙찰자 조회
	public AuctionBidDto getMaxBiderNickname(@Param("userSellerId") int userSellerId, @Param("auctionItemId") int auctionItemId);
	
	// 경매 업로더 - 종료된 경매에서 상품 정보와 결제 상태 확인
	public List<AuctionBidDto> getEndedAuctionAndPayYnInfoByUploader(int userSellerId);
	
	// 경매 업로더의 입장에서 종료된 경매 리스트 상태 조회
	public List<AuctionBidDto> getEndedAuctionlist(int userSellerId);
	
	// 경매 업로더 입장에서 물품 당 주문 내역, 배송 조회 모달 확인
	public AuctionBidDto getEndedAuctionOrderAndDeliveryInfo(AuctionBidDto auctionBidDto);
	
	
	// 배송 시작 (낙찰자가 결제하면 배송준비중, 판매자가 배송처리 누르는순간 배송중)
	public void startAuctionDelivery(int partnerOrderId);
	
	// 판매자가 배송 시작 누르면 배송 상태 yes 처리
	
	
	// 배송 조회
	public AuctionDeliveryDto checkAutionDeliveryStatus(int partnerOrderId);
	
	// 낙찰목록 당 배송 조회  (배송 조회 모달 출력 형태 )
	public AuctionDeliveryTrackingDto getDeliveryStatusInSuccessfulBid(AuctionDeliveryTrackingDto auctionDeliveryTrackingDto);
	
	// 배송 조회 시 배송 상세 정보 보기
	public AuctionItemOrderAddressDto getAddressInfoInPaymentAndDelivery(int id);

	
	// 배송 3일 지나면 배송완료 처리
	public void completeAuctionDelivery(int partnerOrderId);
	
	// 구매 확정
	public void registerPurchaseConfirmed(AuctionPurchaseConfirmedDto auctionPurchaseConfirmedDto);
	
	//  구매 확정 여부 조회
	public int checkPurchaseConfirmedYn(int partnerOrderId);
	
	
	
	
}
