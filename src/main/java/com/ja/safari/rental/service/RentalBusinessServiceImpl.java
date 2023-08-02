package com.ja.safari.rental.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ja.safari.dto.KaKaoPayApproveDto;
import com.ja.safari.dto.RentalAdsOrderDto;
import com.ja.safari.dto.RentalBusinessDto;
import com.ja.safari.dto.RentalCancelDto;
import com.ja.safari.dto.RentalItemDto;
import com.ja.safari.dto.RentalItemImgDto;
import com.ja.safari.dto.RentalItemReturnDto;
import com.ja.safari.dto.RentalMainCategoryDto;
import com.ja.safari.dto.RentalOrderDto;
import com.ja.safari.dto.RentalPeriodDiscDto;
import com.ja.safari.dto.RentalReturnExtraCharge;
import com.ja.safari.dto.RentalReviewDto;
import com.ja.safari.dto.RentalSubCategoryDto;
import com.ja.safari.dto.RentalSurchargeBillDto;
import com.ja.safari.dto.UserCoinDto;
import com.ja.safari.rental.mapper.RentalBusinessSqlMapper;
import com.ja.safari.user.mapper.UserSqlMapper;

@Transactional
@Service
public class RentalBusinessServiceImpl {
	
	@Autowired
	RentalBusinessSqlMapper rentalSqlMapper;
	
	@Autowired
	UserSqlMapper userSqlMapper;
	
	
	// 중복 확인 
	public boolean isUserIdTaken(String userId) { 
		return rentalSqlMapper.countUsersByBusinessUserId(userId)>0;
	}
	
	// 회원 가입 
	public void registerBusiness(RentalBusinessDto rentalBusinessDto) {
		rentalSqlMapper.registerBusiness(rentalBusinessDto);
		return;
	}
	
	// 로그인  
	public RentalBusinessDto businessLogin(RentalBusinessDto rentalBusinessDto) {
		return rentalSqlMapper.selectBusinessUserByIdAndPw(rentalBusinessDto);
	}
	
	// 상품 pk 
	public int getRentalItemPk() {
		return rentalSqlMapper.getRentalItemPk();
	}
	
	// 상품 등록 
	public void registerRentalItem(RentalItemDto rentalItemDto) {
		rentalSqlMapper.registerRentalItem(rentalItemDto);
		return ;
	}
	
	// 상품 삭제
	public void deleteRentalItem(int id) {
		rentalSqlMapper.deleteRentalItem(id);
		return ;
	}
	
	// 상품 업데이트 
	public void updateRentalItem(RentalItemDto rentalItemDto) {
		rentalSqlMapper.updateRentalItem(rentalItemDto);
		return ;
	}
	
	// 상품 상세이미지 등록 
	public void registerRentalItemImgs(List<RentalItemImgDto> rentalItemImgDtos) {
		for(RentalItemImgDto rentalItemImgDto : rentalItemImgDtos) {
			System.out.println(rentalItemImgDto.getItem_id());
			rentalSqlMapper.registerRentalItemImg(rentalItemImgDto);
		}
		return ;
	}
	
	// 상품 상세이미지 삭제 
	public void deleteRentalItemImg(int itemId) {
		rentalSqlMapper.deleteRentalItemImg(itemId);
		return ;
	}
	
	// 할인 가격 등록
	public void registerDiscountedPeriod(List<RentalPeriodDiscDto> discPriceList) {
		for(RentalPeriodDiscDto rentalPeriodDiscDto : discPriceList) {
			rentalSqlMapper.registerDiscountedPrice(rentalPeriodDiscDto);
		}
		return ;
	}
	
	// 할인 가격 삭제
	public void deleteDiscountedPeriodByItemId(int id) {
		rentalSqlMapper.deleteDiscountedPricesByItemId(id);
		return ;
	}
	
	// 대분류 카테고리 가져오기  
	public List<RentalMainCategoryDto> getRentalMainCategoryList(){
		return rentalSqlMapper.getRentalMainCategoryList();
	}
	
	// 대분류 id로 소분류 카테고리 가져오기  
	public List<RentalSubCategoryDto> getRentalSubCategoryListByMainCategoryId(int mainCategoryId){
		return rentalSqlMapper.getRentalSubCategoryListByMainCategoryId(mainCategoryId);
	}	
	
	// 유저아이디로 상품 리스트 가져오기 
	public List<RentalItemDto> getProductListByUserId(int businessId){
		return rentalSqlMapper.getProductListByUserId(businessId);
	}	
	
	// 상품 아이디로 가격 옵션 가져오기 
	public List<RentalPeriodDiscDto> getDiscountedPriceListByItemId(int itemId){
		return rentalSqlMapper.getDiscountedPriceList(itemId);
	}	
	
	// 상품 아이디로 가격 옵션 가져오기 
	public List<Map<String, Object>> getProductAndPriceListByUserId(int businessId){
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		for(RentalItemDto item : rentalSqlMapper.getProductListByUserId(businessId)) {
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("product", item);
			map.put("discountedPriceList", rentalSqlMapper.getDiscountedPriceList(item.getId()));
			List<RentalAdsOrderDto> rentalAdsOrderDtos = rentalSqlMapper.getAdsDtoByProductId(item.getId());
			map.put("ads", rentalAdsOrderDtos.size() > 0);
			if(rentalAdsOrderDtos.size()>0) map.put("adsDto", rentalAdsOrderDtos.get(0));
			
			list.add(map);
		}
		
		return list;
	}	
	

	// 상품 아이디로 상품과 가격옵션 가져오기 
	public Map<String,Object> getProductAndPriceMapByUserId(int itemId){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("product", rentalSqlMapper.selectRentalItemDto(itemId));
		map.put("discountedPrices", rentalSqlMapper.getDiscountedPriceList(itemId));
		
		return map;
	}

	public RentalBusinessDto getBusinessDtoById(int id) {
		return rentalSqlMapper.getBusinessDtoById(id);
	}
	
	// 사업자 회원 정보 업데이트 
	public void updateBusinessInfo(RentalBusinessDto rentalBusinessDto) {
		rentalSqlMapper.updateBusinessInfo(rentalBusinessDto);
		
	}
	
	// 계정 id로 최근 주문 5 가져오기
	public List<Map<String, Object>> getRecentReturnListByUserId(int id) {
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		for(RentalItemReturnDto rentalItemReturnDto : rentalSqlMapper.getRecentReturnListByUserId(id)) {
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("returnDto", rentalItemReturnDto);
			RentalOrderDto rentalOrderDto = rentalSqlMapper.getOrderDtoById(rentalItemReturnDto.getRental_order_id());
			map.put("order", rentalOrderDto);
			map.put("user", userSqlMapper.selectUserDtoById(rentalOrderDto.getUser_id()));
			map.put("product", rentalSqlMapper.selectRentalItemDto(rentalOrderDto.getItem_id()));
			list.add(map);
		}
		return list;
	}
	
	// 계정 id로 최근 주문 5 가져오기
	public List<Map<String, Object>> getRecentOrdersByUserId(int id) {
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		for(RentalOrderDto rentalOrderDto : rentalSqlMapper.getRecentOrderListByUserId(id)) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("order", rentalOrderDto);
			map.put("user", userSqlMapper.selectUserDtoById(rentalOrderDto.getUser_id()));
			map.put("product", rentalSqlMapper.selectRentalItemDto(rentalOrderDto.getItem_id()));
			list.add(map);
		}
		return list;
	}
	
	// 주문 아이디로 반납 dto 
	public RentalItemReturnDto getItemReturnDtoByOrderId(int orderId) {
		
		return rentalSqlMapper.getItemReturnDtoByOrderId(orderId);
	}
	
	// 주문 아이디로 반납 추가금
	public List<RentalReturnExtraCharge> getRentalReturnExtraCharges(int returnId) {
		
		return rentalSqlMapper.getRentalReturnExtraCharges(returnId);
	}

	
	// 계정 id로 주문 리스트 가져오기
	public List<Map<String, Object>> getRentalOrderAndProductListByUserId(int id) {
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Date currentDate = new Date();
		for(RentalOrderDto rentalOrderDto : rentalSqlMapper.getOrderListByUserId(id)) {
			String status = "";
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("order", rentalOrderDto);
			map.put("user", userSqlMapper.selectUserDtoById(rentalOrderDto.getUser_id()));
			map.put("product", rentalSqlMapper.selectRentalItemDto(rentalOrderDto.getItem_id()));
			
			RentalItemReturnDto rentalItemReturnDto = rentalSqlMapper.getItemReturnDtoByOrderId(rentalOrderDto.getId());
			
			if (rentalItemReturnDto!=null) {
				if(rentalItemReturnDto.getIs_completed()=="Y") {
						status = "정산완료";
				} else if (rentalItemReturnDto.getIs_item_returned().equals("Y")) {
					status = "회수완료";
				} else {
					status = "반납신청";
				}
			} else {
				// 시작일 이후면
				if(rentalOrderDto.getStart_date().compareTo(currentDate) < 0 ) status = "대여중";
				// 다 아니면 
				else status = "주문완료";
			}
			map.put("status", status);
			list.add(map);
		}
		
		return list;
	}
	
	// 계정 id로 주문 리스트 가져오기 - 상품별 상태별 
	public List<Map<String, Object>> getRentalOrderAndProductListByUserIdFilterByStatusAndProduct(Integer userId, 
			String orderStatus, Integer productId) {
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Date currentDate = new Date();
		for(RentalOrderDto rentalOrderDto : rentalSqlMapper.getOrderListByUserIdAndProductId(userId, productId)) {
			String status = "";
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("order", rentalOrderDto);
			map.put("user", userSqlMapper.selectUserDtoById(rentalOrderDto.getUser_id()));
			map.put("product", rentalSqlMapper.selectRentalItemDto(rentalOrderDto.getItem_id()));
			
			RentalItemReturnDto rentalItemReturnDto = rentalSqlMapper.getItemReturnDtoByOrderId(rentalOrderDto.getId());
			
			if (rentalItemReturnDto!=null) {
				if(rentalItemReturnDto.getIs_completed()=="Y") {
						status = "정산완료";
				} else if (rentalItemReturnDto.getIs_item_returned().equals("Y")) {
					status = "회수완료";
				} else {
					status = "반납신청";
				}
			} else {
				// 시작일 이후면
				if(rentalOrderDto.getStart_date().compareTo(currentDate) < 0 ) status = "대여중";
				// 다 아니면 
				else status = "주문완료";
			}
			
			map.put("status", status);
			
//			주문 대여 취소 반납 정산 
			if(orderStatus.equals("주문") && status.equals("주문완료")) {list.add(map);}
			else if(orderStatus.equals("대여") && status.equals("대여중")) list.add(map);
			else if(orderStatus.equals("반납") && status.contains("회수")) list.add(map);
			else if(orderStatus.equals("반납") && status.contains("반납")) list.add(map);
			else if(orderStatus.equals("정산") && status.equals("정산완료")) list.add(map);
			
			if(orderStatus.equals("전체")) list.add(map);
		}
		
		return list;
	}
	
	
	// 판매자 아이디로 배송처리할 주문 가져오기 
	public List<Map<String, Object>> getOrderAndProductListToBeShippedByUserId(int id) {
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		for(RentalOrderDto rentalOrderDto : rentalSqlMapper.getOrderListToBeShippedByUserId(id)) {
			Map<String, Object> map = new HashMap<String, Object>();
						
			map.put("order", rentalOrderDto);
			map.put("product", rentalSqlMapper.selectRentalItemDto(rentalOrderDto.getItem_id()));
			map.put("user", userSqlMapper.selectUserDtoById(rentalOrderDto.getUser_id()));
						
			list.add(map);
		}
		
		return list;
	}
	
	
	// 판매자 아이디로 배송완료 주문 가져오기 
	public List<Map<String, Object>> getShippedOrderListByUserId(int id) {
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		for(RentalOrderDto rentalOrderDto : rentalSqlMapper.getShippedOrderListByUserId(id)) {
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("order", rentalOrderDto);
			map.put("product", rentalSqlMapper.selectRentalItemDto(rentalOrderDto.getItem_id()));
			map.put("user", userSqlMapper.selectUserDtoById(rentalOrderDto.getUser_id()));

			list.add(map);
		}
		
		return list;
	}
	
	
	// 판매자 아이디로 반품 신청 리스트 가져오기 - 수취확인 전 
	public List<Map<String, Object>> getItemToBeReturnedListByBusinessId(int id) {
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		for(RentalItemReturnDto rentalItemReturnDto : rentalSqlMapper.getItemToBeReturnedListByBusinessId(id)) {
			Map<String, Object> map = new HashMap<String, Object>();
			
			RentalOrderDto rentalOrderDto = rentalSqlMapper.getOrderDtoById(rentalItemReturnDto.getRental_order_id());
			
			// System.out.println(rentalOrderDto.getItem_id());
			
			map.put("returnDto", rentalItemReturnDto);
			map.put("orderDto", rentalOrderDto);
			map.put("userDto", userSqlMapper.selectUserDtoById(rentalOrderDto.getUser_id()));
			map.put("productDto", rentalSqlMapper.selectRentalItemDto(rentalOrderDto.getItem_id()));
			
			list.add(map);
		}
		
		return list;
	}
	
	// 판매자 아이디로 반품 신청 리스트 가져오기  - 수취확인 후 
	public List<Map<String, Object>> getItemReturnedListByBusinessId(int id) {
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		for(RentalItemReturnDto rentalItemReturnDto : rentalSqlMapper.getItemReturnedListByBusinessId(id)) {
			Map<String, Object> map = new HashMap<String, Object>();
			
			RentalOrderDto rentalOrderDto = rentalSqlMapper.getOrderDtoById(rentalItemReturnDto.getRental_order_id());
			
			// System.out.println(rentalOrderDto.getItem_id());
			
			map.put("returnDto", rentalItemReturnDto);
			map.put("orderDto", rentalOrderDto);
			map.put("userDto", userSqlMapper.selectUserDtoById(rentalOrderDto.getUser_id()));
			map.put("productDto", rentalSqlMapper.selectRentalItemDto(rentalOrderDto.getItem_id()));
			
			list.add(map);
		}
		
		return list;
	}
	
	
	
	// 전체 리뷰 리스트 가져오기 
	public List<Map<String, Object>> getAllReviews() {
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		
		for(RentalReviewDto rentalReviewDto : rentalSqlMapper.getAllReviews()) {
			Map<String, Object> map = new HashMap<String, Object>();
			
			int orderId = rentalReviewDto.getRental_id();
			RentalOrderDto rentalOrderDto = rentalSqlMapper.getOrderDtoById(orderId);
						
			map.put("review", rentalReviewDto);
			map.put("user", userSqlMapper.selectUserDtoById(rentalOrderDto.getUser_id()));
			map.put("order", rentalOrderDto);
			map.put("product", rentalSqlMapper.selectRentalItemDto(rentalOrderDto.getItem_id()));
			
			list.add(map);
			
		}
		
		return list;
	}
	
	
	
	
	// 상품 아이디와 상태로 리뷰 리스트 가져오기 
	public List<Map<String, Object>> getReviewsAndUsersAndItemsByProduct(Integer productId, Integer status) {
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		for(RentalReviewDto rentalReviewDto : rentalSqlMapper.getReviewListByProductIdAndStatus(productId,status)) {
			Map<String, Object> map = new HashMap<String, Object>();
			
			
			int orderId = rentalReviewDto.getRental_id();
			RentalOrderDto rentalOrderDto = rentalSqlMapper.getOrderDtoById(orderId);
						
			map.put("review", rentalReviewDto);
			map.put("isReplied", rentalReviewDto.getRental_reply_review()!=null);
			map.put("user", userSqlMapper.selectUserDtoById(rentalOrderDto.getUser_id()));
			map.put("order", rentalOrderDto);
			map.put("product", rentalSqlMapper.selectRentalItemDto(rentalOrderDto.getItem_id()));
			
			list.add(map);
		}
		
		return list;
	}
	
	
	
	
	// 리뷰 답글 등록 
	public void saveReviewReply(RentalReviewDto rentalReviewDto) {
		rentalSqlMapper.saveReviewReply(rentalReviewDto);
	}
	
	// 광고 주문 pk  
	public int getRentalAdsPk() {
		return rentalSqlMapper.getRentalAdsPk();
	}
	
	

	// 주문 배송 완료 처리 
	public void changeShippingStatus(int orderId) {
		rentalSqlMapper.changeShippingStatus(orderId);
		
	}
	
	// 광고 주문/결제 저장 
	public void saveOrderAndPaymentInfo(KaKaoPayApproveDto kakaoPayApproveDto) {
		
		rentalSqlMapper.insertAdsPayment(kakaoPayApproveDto);
		
		
		RentalAdsOrderDto adsOrderDto = new RentalAdsOrderDto();
		
		adsOrderDto.setId(kakaoPayApproveDto.getPartner_order_id());
		adsOrderDto.setItem_id(kakaoPayApproveDto.getItem_code());
		adsOrderDto.setPrice(kakaoPayApproveDto.getAmount());
		
		String adsPlan = kakaoPayApproveDto.getItem_name();
		if(adsPlan.equals("ADS_WEEK")) adsOrderDto.setPeriod("week");
		else if(adsPlan.equals("ADS_MONTH")) adsOrderDto.setPeriod("month");
		else if(adsPlan.equals("ADS_YEAR")) adsOrderDto.setPeriod("year");
		
		rentalSqlMapper.insertAdsOrder(adsOrderDto);

	}
	
	// 광고 주문/결제 정보 가져오기  
	public Map<String, Object> getOrderAndPaymentInfo(Integer orderId) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("order", rentalSqlMapper.getAdsOrderById(orderId));
		map.put("payment", rentalSqlMapper.getAdsPaymentByOrderId(orderId));
		
		return map;
	}

	// 반품 아이디로 상품 가져오기 
	public RentalItemDto getProductDtoByReturnId(Integer returnId) {
		
		return rentalSqlMapper.getProductDtoByReturnId(returnId);
	}

	// 반품 아이디로 주문 가져오기 
	public RentalOrderDto getOrderDtoByReturnId(Integer returnId) {
		
		return rentalSqlMapper.getOrderDtoByReturnId(returnId);
	}

	// 반품 수취확인 
	public void changeReturnShippingStatus(int returnId) {
		rentalSqlMapper.changeReturnShippingStatus(returnId);
		
	}
	
//	// 반품 후 정산 
//	public void returnAfterCharge(Integer returnId, Integer[] chargeValue, String[] reasonValue) {
//		// TODO : 할 일 -> 각각 배열 말고 dto 리스트로 한번에 가져오기
//		// 1. 먼저 반품 정산서 인서트 후 pk 가지고 정산사유/비용 인서트 
//		
//		
//		
//		for(int i=0;i<chargeValue.length;i++) {
//			
//		}
//		
//	}
	
	// 주문 완료 프로세스 
	public void returnComplete(RentalReturnExtraCharge[] extraChargeList) {
		// TODO : 1. 추가금 있으면 추가금 인서트 / 2. 보증금에서 추가금 빼고 코인 반납 / 3. 반납/주문 완료 처리 
		
		int totalExtraCharge = 0;
		
		// 1. 추가금 프로세스 (일단은 추가금 DB에 인서트만 )
		for(RentalReturnExtraCharge extraCharge : extraChargeList) {
			if(extraCharge.getCharge() == 0) continue;
			totalExtraCharge+=extraCharge.getCharge();
			rentalSqlMapper.insertExtraCharge(extraCharge);
		}
		
		// 2. 보증금 반환 
		RentalOrderDto rentalOrderDto = rentalSqlMapper.getOrderDtoByReturnId(extraChargeList[0].getReturn_id());
		RentalItemReturnDto rentalItemReturnDto = rentalSqlMapper.getItemReturnDtoByOrderId(rentalOrderDto.getId());
		
		int deposit = rentalOrderDto.getDeposit();
		
		// 보증금에서 상태 정산금과 기간할인취소금 빼기 
		int depositToReturn = deposit - totalExtraCharge - rentalItemReturnDto.getDiscount_revocation();
		
		UserCoinDto userCoinDto = new UserCoinDto();
		int coinPk = userSqlMapper.getOnChargeCoinPk();
		userCoinDto.setId(coinPk);
		userCoinDto.setCoin_transaction(depositToReturn);
		userCoinDto.setTransaction_detail("대여 보증금 반환");
		userCoinDto.setUser_id(rentalOrderDto.getUser_id());
		userSqlMapper.insertUserCoin(userCoinDto);
		
		// 3. 반품 및 정산 완료 처리 
		rentalSqlMapper.returnCompleteById(extraChargeList[0].getReturn_id());
	}
	
	
	
	
	
	
	

	
	// 월별 판매량 
	public List<Map<String, Object>> getSalesByMonth(Integer businessId) {
		return rentalSqlMapper.getSalesByMonth(businessId);
	}
	
	// 상품별 판매량 
	public List<Map<String, Object>> getSalesByProduct(Integer businessId) {
		return rentalSqlMapper.getSalesByProduct(businessId);
	}
	
	// 구매자 성별 비율 
	public List<Map<String, Object>> getSalesByGender(Integer businessId) {
		return rentalSqlMapper.getSalesByGender(businessId);
	}
	
	// 월별 매출
	public List<Map<String, Object>> getRevenueByDay(Integer businessId) {
		return rentalSqlMapper.getRevenueByDay(businessId);
	}


	
	


}
