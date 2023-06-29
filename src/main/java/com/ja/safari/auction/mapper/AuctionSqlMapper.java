package com.ja.safari.auction.mapper;

import java.util.List;

import com.ja.safari.dto.AuctionBidDto;
import com.ja.safari.dto.AuctionItemChatroomDto;
import com.ja.safari.dto.AuctionItemDto;
import com.ja.safari.dto.AuctionItemImgDto;
import com.ja.safari.dto.AuctionItemLikeDto;
import com.ja.safari.dto.ProductMainCategoryDto;
import com.ja.safari.dto.ProductSubCategoryDto;

public interface AuctionSqlMapper {
	
	// 경매 물품 등록 시퀀스 
	public int createPk();
	
	// 경매 물품 등록 페이지 이동하면 대규모 카테고리 리스트 출력
	public List<ProductMainCategoryDto> getProductMainCategories();
	
	// 경매 물품 등록 시 대규모 카테고리 선택할 때 소규모 카테고리 리스트 출력
	public List<ProductSubCategoryDto> getProductSubCategoriesByMainCategoryId(int productMainCategoryId);
	
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
	
	// 물품의 소규모 카테고리 조회
	public ProductSubCategoryDto getAuctionProductSubCategory(int id);
	
	// 입찰하기
	public void submitBidRequest(AuctionBidDto auctionBidDto);
	
	// 입찰 정보 조회
	public AuctionBidDto getBidInfo(int id);
	
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
	
	// 낙찰 시 경매 종료로 상태 업데이트
	public void renewSuccessfulBidOrEnd(int id);
	
	// 한 경매의 입찰 리스트 출력
	public List<AuctionBidDto> getBidList(int auctionItemId);
	
	// 한 경매의 입찰 횟수 조회
	public int getBidCount(int auctionItemId);
	
	// 경매 현재가 계속 업데이트
	public Integer getCurrentBidPriceByAuctionItem(int auctionItemId);
	
	// 경매 입찰 가격이 즉시 낙찰 가격 이상인지 여부 확인
	public AuctionBidDto isBidPriceGreaterThanOrEqualToMaxPrice(int auctionItemId);
	
	// 회원의 입찰 기록 조회
	public List<AuctionBidDto> getBidHistoryByUser(int userBuyerId);
	
	// 회원의 경매 업로드 기록 조회
	public List<AuctionItemDto> getAuctionUploadHistoryByUser(int userSellerId);
	

	
	
	// 경매 찜하기 클릭
	public void likeAuctionProduct(AuctionItemLikeDto auctionItemLikeDto);
	
	// 경매 좋아요 취소 
	public void unlikeAuctionProduct(AuctionItemLikeDto auctionItemLikeDto);
	
	// 고객 당 경매 좋아요 누른 개수 확인 
	public int checklikeAuctionProductByUser(AuctionItemLikeDto auctionItemLikeDto);
	
	// 경매물품 당 좋아요 개수 
	public int countLikeAuctionProduct(int auctionItemId);

	
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
}
