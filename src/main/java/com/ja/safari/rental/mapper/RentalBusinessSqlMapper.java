package com.ja.safari.rental.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.jmx.export.naming.IdentityNamingStrategy;

import com.ja.safari.dto.KaKaoPayApproveDto;
import com.ja.safari.dto.RentalAdsOrderDto;
import com.ja.safari.dto.RentalBusinessDto;
import com.ja.safari.dto.RentalCancelBillDto;
import com.ja.safari.dto.RentalCancelDto;
import com.ja.safari.dto.RentalItemDto;
import com.ja.safari.dto.RentalItemImgDto;
import com.ja.safari.dto.RentalItemReturnDto;
import com.ja.safari.dto.RentalKakaoPaymentDto;
import com.ja.safari.dto.RentalMainCategoryDto;
import com.ja.safari.dto.RentalOrderDto;
import com.ja.safari.dto.RentalPeriodDiscDto;
import com.ja.safari.dto.RentalReturnExtraCharge;
import com.ja.safari.dto.RentalReviewDto;
import com.ja.safari.dto.RentalReviewImgDto;
import com.ja.safari.dto.RentalSubCategoryDto;
import com.ja.safari.dto.RentalSurchargeBillDto;

public interface RentalBusinessSqlMapper {
	
	// 회사 회원 등록
	public void registerBusiness(RentalBusinessDto rentalBusinessDto);

	// 아이디 중복 확인 
	public int countUsersByBusinessUserId(String businessUserId);
	
	// 로그인
	public RentalBusinessDto selectBusinessUserByIdAndPw(RentalBusinessDto rentalBusinessDto);
	
	// 상품 pk 생성 
	public int getRentalItemPk();

	// 상품 등록
	public void registerRentalItem(RentalItemDto rentalItemDto);
	
	// 상품 삭제 
	public void deleteRentalItem(int id);
	
	// 상품 수정  
	public void updateRentalItem(RentalItemDto rentalItemDto);
	
	// 상품 상세 이미지 등록 
	public void registerRentalItemImg(RentalItemImgDto rentalItemImgDto);
	
	// 상품 상제 이미지 삭제
	public void deleteRentalItemImg(int itemId);
	
	// 상품 id로 상품 dto 가져오기 
	public RentalItemDto selectRentalItemDto(int itemId);
	
	// 반납 추가금  
	public List<RentalReturnExtraCharge> getRentalReturnExtraCharges(int returnId);
	
	// 할인 가격 등록 
	public void registerDiscountedPrice(RentalPeriodDiscDto rentalPeriodDiscDto);
	
	// 할인 가격 삭제
	public void deleteDiscountedPricesByItemId(int itemId);
	
	// 대분류 카테고리 가져오기  
	public List<RentalMainCategoryDto> getRentalMainCategoryList();
	
	// 대분류 id로 소분류 카테고리 가져오기  
	public List<RentalSubCategoryDto> getRentalSubCategoryListByMainCategoryId(int mainCategoryId);

	// 유저아이디로 상품 리스트 가져오기 
	public List<RentalItemDto> getProductListByUserId(int businessId);
	
	// 유저아이디로 상품 가격 리스트 가져오기 
	public List<RentalPeriodDiscDto> getDiscountedPriceList(int itemId);

	// 사업자 계정 id로 가져오기 
	public RentalBusinessDto getBusinessDtoById(int id);

	// 사업자 계정 정보 수정 
	public void updateBusinessInfo(RentalBusinessDto rentalBusinessDto);
	
	// 판매자 id로 최근 주문 5개 리스트 가져오기 
	public List<RentalItemReturnDto> getRecentReturnListByUserId(int userId);
	
	// 판매자 id로 최근 주문 5개 리스트 가져오기 
	public List<RentalOrderDto> getRecentOrderListByUserId(int userId);
	
	// 판매자 id로 주문 리스트 가져오기 
	public List<RentalOrderDto> getOrderListByUserId(int userId);
	
	// 상품 id로 주문 리스트 가져오기 
	public List<RentalOrderDto> getOrderListByUserIdAndProductId(@Param("userId") int userId, @Param("productId") int productId);
	
	// 판매자 id로 배송처리할 주문 리스트 가져오기 
	public List<RentalOrderDto> getOrderListToBeShippedByUserId(int userId);
	
	// 판매자 id로 배송 완료된 주문 리스트 가져오기 
	public List<RentalOrderDto> getShippedOrderListByUserId(int userId);
	
	// 전체 리뷰 리스트 가져오기 
	public List<RentalReviewDto> getAllReviews();
	
	// 상태별 리뷰 리스트 가져오기 
	public List<RentalReviewDto> getReviewListByStatus(@Param("status") String status);
	
	// 상품별/상태별 리뷰 리스트 가져오기 
	public List<RentalReviewDto> getReviewListByProductIdAndStatus(@Param("productId")Integer productId,@Param("status") Integer status);
	
	// 리뷰 답글 등록 
	public void saveReviewReply(RentalReviewDto rentalReviewDto);

	// order id로 취소 dto 가져오기 
	public RentalCancelDto getOrderCancelByOrderId(int orderId);
	
	// cancel id로 취소정산 dto 가져오기 
	public RentalCancelBillDto getOrderCancelBillByCancelId(int cancelId);
	
	// order id로 반납 dto 가져오기 
	public RentalItemReturnDto getItemReturnDtoByOrderId(int orderId);
	
	// cancel id로 반납정산 dto 가져오기 
	public RentalSurchargeBillDto getSurchargeBillDtoByReturnId(int returnId);
	
	// 주문 id로 주문 dto  
	public RentalOrderDto getOrderDtoById(int orderId);
	
	// 광고 주문 pk 가져오기
	public int getRentalAdsPk();
	
	// 광고 주문 insert
	public void insertAdsOrder(RentalAdsOrderDto rentalAdsOrderDto);
	
	// 광고 주문 DTO 가져오기 
	public List<RentalAdsOrderDto> getAdsDtoByProductId(int productId);
	
	// 광고 결제 insert 
	public void insertAdsPayment(KaKaoPayApproveDto kakaoPayApproveDto);
	
	// 광고 주문 select
	public RentalAdsOrderDto getAdsOrderById(Integer orderId);
	
	// 광고 결제 select 
	public RentalKakaoPaymentDto getAdsPaymentByOrderId(Integer orderId);

	// 광고 주문 카운트 
	public Integer getAdsCountByProductId(Integer productId);
	
	// 반품 신청 주문 리스트 - 수취확인 전 
	public List<RentalItemReturnDto> getItemToBeReturnedListByBusinessId(Integer businessId);
	
	// 반품 신청 주문 리스트 - 수취확인 후 
	public List<RentalItemReturnDto> getItemReturnedListByBusinessId(Integer businessId);

	// 반품 번호로 상품 찾아오기 
	public RentalItemDto getProductDtoByReturnId(Integer returnId);

	//  반품 번호로 주문 찾아오기
	public RentalOrderDto getOrderDtoByReturnId(Integer returnId);
	
	// 정산 pk 찾아오기
	public Integer getA(Integer returnId);
	
	// 주문 배송 완료 처리 
	public void changeShippingStatus(int orderId);

	// 반품 수취확인 
	public void changeReturnShippingStatus(int returnId);
	
	// 반품 주문 정산까지 완료 처리 
	public void returnCompleteById(int returnId);
	
	// 추가금 정산 디비에 입력 
	public void insertExtraCharge(RentalReturnExtraCharge extraCharge);

	
	


	/////////////
	// 대시 보드 // 
	////////////
	
	
	// 월별 주문수 
	public List<Map<String, Object>> getSalesByMonth(Integer businessId);
	
	// 상품별 주문수 
	public List<Map<String, Object>> getSalesByProduct(Integer businessId);
	
	// 고객 성별 비율
	public List<Map<String, Object>> getSalesByGender(Integer businessId);
	
	// 월별 매출 
	public List<Map<String, Object>> getRevenueByDay(Integer businessId);









	
}
