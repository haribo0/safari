package com.ja.safari.used.mapper;

import java.util.List;


import org.apache.ibatis.annotations.Param;

import com.ja.safari.dto.ProductChatDto;
import com.ja.safari.dto.ProductCityDto;
import com.ja.safari.dto.ProductDto;
import com.ja.safari.dto.ProductImgDto;
import com.ja.safari.dto.ProductLikeDto;
import com.ja.safari.dto.ProductMainCategoryDto;
import com.ja.safari.dto.ProductRequestDto;
import com.ja.safari.dto.ProductSubCategoryDto;
import com.ja.safari.dto.ProductTownDto;
import com.ja.safari.dto.UsedCheckboxSelectedReviewDto;
import com.ja.safari.dto.UsedKaKaoPayApproveDto;
import com.ja.safari.dto.UsedPurchaseReviewDto;
import com.ja.safari.dto.UsedReviewCheckboxCategoryDto;
import com.ja.safari.dto.UsedReviewRateCategoryDto;
import com.ja.safari.dto.UserCoinDto;
import com.ja.safari.dto.UserDto;

public interface UsedSqlMapper {
	// 유저아이디에 따른 UserDto
	public UserDto selectUserDtoById(int id);
	// 상품 대분류  카테고리
	public List<ProductMainCategoryDto> selectMainCategory();
	// 상품 소분류  카테고리  
	public List<ProductSubCategoryDto> selectSubCategory(Integer mainCategoryId);
	// 상품 도시 카테고리 
	public List<ProductCityDto> selectProductCity();
	// 상품 동네아이디에 따른 도시Dto
	public ProductCityDto selectProductCityByTownId(Integer townId);
	// 상품 동네 카테고리  
	public List<ProductTownDto> selectProductTown(Integer cityId);
	// 상품 동네아이디에 따른 Dto
	public ProductTownDto selectProductTownById(Integer townId);
	// 상품 pk
	public int createProductPk();
	// 상품 insert
	public void insertProduct(ProductDto productDto);
	// 상품Img insert
	public void insertProductImg(ProductImgDto productImgDto);
	// 상품 전체 불러오기 - ajax
	public List<ProductDto> selectProductByAllCondition(
			@Param("mainId")Integer mainId, 
			@Param("subId")Integer subId, 
			@Param("cityId")Integer cityId, 
			@Param("townId")Integer townId, 
			@Param("statusId")Integer statusId, 
			@Param("orderId")Integer orderId);
	// 상품 전체 불러오기 
	public List<ProductDto> selectProduct();
	// 상품 베스트
	public List<ProductDto> selectBestProduct();
	// 상품 카테고리에 따른 상품 리스트 
	public List<ProductDto> selectProductByCategory(@Param("mainId")Integer mainId, @Param("subId")Integer subId);
	// 상품 이미지1개  불러오기
	public ProductImgDto selectProductImg(int productId);
	// 상품 이미지 전부 불러오기
	public List<ProductImgDto> selectProductImgAll(int productId);
	// 상품 아이디에 따른 상품Dto
	public ProductDto selectProductById(int productId);
	// 상품 조회수 올리기
	public void updateProductViewsById(int productId);
	// 상품 ID에 따른 좋아요 전체수
	public int selectProductLikeCountByProductId(int productId);
	// 좋아요 누르기 
	public void insertProductLike(ProductLikeDto productLikeDto);
	// 좋아요 삭제 
	public void deleteProductLike(ProductLikeDto ProductLikeDto);
	// 내가 누른 좋아요 수 
	public int selectMyProductLike(ProductLikeDto ProductLikeDto);
	// 소분류 가져오기
	public ProductSubCategoryDto selectProductSubCategoryById(int id);
	// 대분류 가져오기
	public ProductMainCategoryDto selectProductMainbCategoryById(int id);
	// 상품 이미지 삭제
	public void deleteProductImgByProductId(int productId);
	// 상품 수정
	public void updateProduct(ProductDto productDto);
	// 상품 삭제
	public void deleteProductByProductId(int id);
	// 거래 요청 insert
	public void insertProductRequest(ProductRequestDto productRequestDto);
	// 거래 요청 Dto 모두- productId에 따라 
	public List<ProductRequestDto> selectProductRequestByProductId(int productId);
	// 사용자가 해당 상품 거래요청했는지 확인하는 count
	public int selectProductRequestCountByUser(@Param("productId")int productId, @Param("userId")int userId);
	// 사용자가 해당 상품 거래요청 취소
	public void deleteProductRequestByUser(@Param("productId")int productId, @Param("userId")int userId);
	// 거래요청 상태 예약중으로 업데이트
	public void updateProductRequestStatusReservate(@Param("productId")int productId, @Param("userId")int userId);
	// 거래요청 상태 거래완료로 업데이트
	public void updateProductRequestStatusComplete(@Param("productId")int productId, @Param("userId")int userId);
	// 거래요청 상태 거래요청으로 업데이트(예약취소할때)
	public void updateProductRequestStatusCancel(@Param("productId")int productId, @Param("userId")int userId);
	// 거래요청 상태가 예약중인 것의 개수 
	public int countProductRequestReservation(int productId);
	// 거래요청 상태가 거래완료인 것의 개수 
	public int countProductRequestComplete(int productId);
	// 거래요청의 상품 iD에 따른 개수
	public int countProductRequestByProductId(int productId);
	// 사용자가 거래요청한 것과 거래요청받은 것의 리스트 
	public List<ProductRequestDto> selectProductRequestAllByUserId(Integer userId);
	// 채팅방 채팅 넣기 
	public void insertProductChat(ProductChatDto productChatDto);
	// 채팅방 순서대로 불러내기 
	public List<ProductChatDto> selectProductChatByRequestId(Integer requestId);
	// 채팅방 마지막 내용 불러오기 
	public ProductChatDto selectLastChatContent(Integer requestId);
	// 채팅 내용 있는지 개수 확인 
	public int selectChatCount(Integer requestId);
	// 채팅창 읽음여부 업데이트 
	public void updateIsRead(@Param("requestId")Integer requestId, @Param("receiverId")Integer receiverId);
	// 채팅목록과 userId에 따른 안읽음 개수 
	public int selectUnreadCountByRequestId(@Param("requestId")Integer requestId, @Param("receiverId")Integer receiverId);
	// request pk Id로 requestDto select
	public ProductRequestDto selectProductRequestById(Integer id);
	// 판매자일때 요청자에 따른 productRequestDto 가져오기
	public ProductRequestDto selectProductRequestByProductIdAndRequestId(@Param("productId")Integer productId, @Param("requesterId")Integer requesterId);
	// 카카오페이  결제 insert 
	public void insertUsedPayment(UsedKaKaoPayApproveDto usedKakaoPayApproveDto);
	// 결제 select 
	public UsedKaKaoPayApproveDto getUsedPaymentByOrderId(Integer orderId);
	// 리뷰 평가 카테고리 
	public List<UsedReviewRateCategoryDto> selectUsedReviewRateCategory();
	// 리뷰 평가 카테고리 - id에 따른 
	public UsedReviewRateCategoryDto selectUsedReviewRateCategoryById(Integer id);
	// 리뷰 평가 id에 따른 체크박스 카테고리 
	public List<UsedReviewCheckboxCategoryDto> selectUsedReviewCheckboxCategoryByRateId(Integer rateId);
	// 리뷰 pk
	public int selectPurchaseReviewPk();
	// 리뷰 insert
	public void insertUsedPurchaseReview(UsedPurchaseReviewDto purchaseReviewDto);
	// 리뷰 체크박스 insert 
	public void insertUsedCheckboxSelectedReview(UsedCheckboxSelectedReviewDto usedCheckboxSelectedReviewDto);
	// 해당 거래에 대한 내가 쓴 리뷰 개수 
	public int selectMyWroteReviewCount(@Param("requestId")Integer requestId, @Param("senderId")Integer senderId);
	// 해당 거래에 대한 내가 쓴 리뷰내용 가져오기 
	public UsedPurchaseReviewDto selectPurchaseReviewByRequestIdAndSenderId(@Param("requestId")Integer requestId, @Param("senderId")Integer senderId);
	// 해당 거래에 대한 내가 쓴 리뷰체크 박스 가져오기 
	public List<UsedReviewCheckboxCategoryDto> selectCheckboxSelectedReviewByRequestIdAndSenderId(@Param("requestId")Integer requestId, @Param("senderId")Integer senderId);
	// 메인에서 나눔 물건 리스트 
	public List<ProductDto> selectFreePriceList();
	// 메인에서 전체리스트 -8개 
	public List<ProductDto> selectAllProductListByEight();
	// 상세페이지에서 연관상품 5개 
	public List<ProductDto> selectRelatedProductByFive(@Param("id")Integer id, @Param("subId")Integer subId);
	// 코인 결제하고 나서 마이너스 
	public void reduceUserCoinByUsed(UserCoinDto userCoinDto);
	// 좋아요 리스트 
	public List<ProductLikeDto> selectProductLikeByUserId(Integer userId);
	// 나의 판매리스트(판매중, 예약중, 거래완료)
	public List<ProductDto> selectMySellList(Integer userId, Integer status);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
