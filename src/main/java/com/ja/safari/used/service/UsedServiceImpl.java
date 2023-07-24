package com.ja.safari.used.service;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
import com.ja.safari.dto.UserCoinDto;
import com.ja.safari.dto.UserDto;
import com.ja.safari.used.mapper.UsedSqlMapper;
import com.ja.safari.user.mapper.UserSqlMapper;

@Transactional
@Service
public class UsedServiceImpl {
	
	@Autowired
	UsedSqlMapper usedSqlMapper;
	
	@Autowired
	UserSqlMapper userSqlMapper;
	
	//user id 에 대한 userDto
	public UserDto selectUserDtoById(int id) {
		return usedSqlMapper.selectUserDtoById(id);
	}
	
	//상품 대분류 카테고리 
	public List<ProductMainCategoryDto> selectMainCategory(){
		return usedSqlMapper.selectMainCategory();
	}
	
	//상품 소분류 카테고리 
	public List<ProductSubCategoryDto> selectSubCategory(Integer mainCategoryId){
		return usedSqlMapper.selectSubCategory(mainCategoryId);
	}
	
	//상품 도시 카테고리 
	public List<ProductCityDto> selectProductCity(){
		return usedSqlMapper.selectProductCity();
	}
	
	//상품 동네 카테고리 
	public List<ProductTownDto> selectProductTown(Integer cityId){
		return usedSqlMapper.selectProductTown(cityId);
	}
	
	// 대분류에 따른 소분류 
	public List<Map<String, Object>> selectMainAndSubCategory(){
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		List<ProductMainCategoryDto> mainCategoryList = usedSqlMapper.selectMainCategory();
		for(ProductMainCategoryDto productMainCategoryDto:mainCategoryList) {
			Map<String, Object> map = new HashMap<String, Object>();
			Integer productId = productMainCategoryDto.getId();
			List<ProductSubCategoryDto> subCategoryDtoList = usedSqlMapper.selectSubCategory(productId);
			map.put("productMainCategoryDto", productMainCategoryDto);
			map.put("subCategoryDtoList", subCategoryDtoList);
			list.add(map);
		}
		return list;
	}
	
	//상품 PK
	public int createProductPk() {
		return usedSqlMapper.createProductPk();
	}
	
	//상품 등록 
	public void insertProduct(ProductDto productDto) {
		usedSqlMapper.insertProduct(productDto);
	}
	
	//상품이미지 등록 
	public void insertProductImg(ProductImgDto productImgDto) {
		usedSqlMapper.insertProductImg(productImgDto);
	}
	
	// 상품 전체 불러오기 - ajax
	public List<Map<String, Object>> selectProductByAllCondition(
		Integer mainId, 
		Integer subId, 
		Integer cityId, 
		Integer townId, 
		Integer statusId, 
		Integer orderId){
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		List<ProductDto> productDtoList = usedSqlMapper.selectProductByAllCondition(mainId, subId, cityId, townId, statusId, orderId);
		
		for(ProductDto productDto : productDtoList) {
			Map<String, Object> map = new HashMap<>();
			Integer productId = productDto.getId();
			int reservationCount = usedSqlMapper.countProductRequestReservation(productId);
			int completeCount = usedSqlMapper.countProductRequestComplete(productId);
			Integer townIdTwo = productDto.getProduct_town_id();
			
			map.put("productDto", productDto);
			map.put("reservationCount", reservationCount);
			map.put("completeCount", completeCount);
			map.put("likeCount", usedSqlMapper.selectProductLikeCountByProductId(productId));
			map.put("requestCount", usedSqlMapper.countProductRequestByProductId(productId));
			map.put("productImgDto", usedSqlMapper.selectProductImg(productId));
			map.put("productTownDto", usedSqlMapper.selectProductTownById(townIdTwo));
			map.put("productCityDto", usedSqlMapper.selectProductCityByTownId(townIdTwo));
			list.add(map);
		}
		return list;
	}
	
	
	//상품 전체 불러오기
	public List<Map<String, Object>> selectProductList(){
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		List<ProductDto> productDtoList = usedSqlMapper.selectProduct();
		
		for(ProductDto productDto : productDtoList) {
			Map<String, Object> map = new HashMap<>();
			int productId = productDto.getId();
			int reservationCount = usedSqlMapper.countProductRequestReservation(productId);
			int completeCount = usedSqlMapper.countProductRequestComplete(productId);
			Integer townId = productDto.getProduct_town_id();
			map.put("productDto", productDto);
			map.put("reservationCount", reservationCount);
			map.put("completeCount", completeCount);
			map.put("likeCount", usedSqlMapper.selectProductLikeCountByProductId(productId));
			map.put("requestCount", usedSqlMapper.countProductRequestByProductId(productId));
			map.put("productImgDto", usedSqlMapper.selectProductImg(productId));
			map.put("productTownDto", usedSqlMapper.selectProductTownById(townId));
			map.put("productCityDto", usedSqlMapper.selectProductCityByTownId(townId));
			list.add(map);
		}
		return list;
	}
	
	// 상품 베스트 불러오기  
	public List<Map<String, Object>> selectBestProduct() {
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		List<ProductDto> productDtoList = usedSqlMapper.selectBestProduct();
		
		for(ProductDto productDto : productDtoList) {
			Map<String, Object> map = new HashMap<>();
			int productId = productDto.getId();
			int reservationCount = usedSqlMapper.countProductRequestReservation(productId);
			int completeCount = usedSqlMapper.countProductRequestComplete(productId);
			Integer townId = productDto.getProduct_town_id();
			map.put("productDto", productDto);
			map.put("reservationCount", reservationCount);
			map.put("completeCount", completeCount);
			map.put("likeCount", usedSqlMapper.selectProductLikeCountByProductId(productId));
			map.put("requestCount", usedSqlMapper.countProductRequestByProductId(productId));
			map.put("productImgDto", usedSqlMapper.selectProductImg(productId));
			map.put("productTownDto", usedSqlMapper.selectProductTownById(townId));
			map.put("productCityDto", usedSqlMapper.selectProductCityByTownId(townId));
			
			list.add(map);
		}
		return list;
	}
	
	// 상품 카테고리에 따른 상품 리스트 
	public List<Map<String,Object>> selectProductByCategory(Integer mainId, Integer subId) {
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		List<ProductDto> productDtoList = usedSqlMapper.selectProductByCategory(mainId, subId);
		
		for(ProductDto productDto : productDtoList) {
			Map<String, Object> map = new HashMap<>();
			int productId = productDto.getId();
			int reservationCount = usedSqlMapper.countProductRequestReservation(productId);
			int completeCount = usedSqlMapper.countProductRequestComplete(productId);
			map.put("productDto", productDto);
			map.put("reservationCount", reservationCount);
			map.put("completeCount", completeCount);
			map.put("likeCount", usedSqlMapper.selectProductLikeCountByProductId(productId));
			map.put("requestCount", usedSqlMapper.countProductRequestByProductId(productId));
			map.put("productImgDto", usedSqlMapper.selectProductImg(productId));
			
			list.add(map);
		}
		return list;
	}
	
	
	//상품 상세정보 불러오기(상품Dto)  
	public Map<String, Object> selectProductDetail(int productId){
		Map<String, Object> map = new HashMap<>();
		ProductDto productDto = usedSqlMapper.selectProductById(productId);
		Integer townId = productDto.getProduct_town_id();
//		String content = productDto.getContent().replaceAll("\n", "<br>");
//		productDto.setContent(content);
		int productLikeCount = usedSqlMapper.selectProductLikeCountByProductId(productId);
		map.put("productDto", productDto);
		map.put("productLikeCount", productLikeCount);
		map.put("productTownDto", usedSqlMapper.selectProductTownById(townId));
		map.put("productCityDto", usedSqlMapper.selectProductCityByTownId(townId));
		
		return map;
	}		
	
	//상품 상세정보 불러오기(상품이미지 Dto)
	public List<ProductImgDto> selectProductDetailImg(int productId){
		List<ProductImgDto> list = usedSqlMapper.selectProductImgAll(productId);
		return list;
	}
	
	// 상품Dto -id 에 따른
	public ProductDto selectProductDtoById(int productId) {
		return usedSqlMapper.selectProductById(productId);
	}
	
	// 조회수 올리기
	public void updateProductViewsById(int productId) {
		usedSqlMapper.updateProductViewsById(productId);
	}
	
	// 좋아요 누르기(insert,delete)
	public void toggleLike(ProductLikeDto productLikeDto) {
		if(usedSqlMapper.selectMyProductLike(productLikeDto)>0) {
			usedSqlMapper.deleteProductLike(productLikeDto);
		}else {
			usedSqlMapper.insertProductLike(productLikeDto);
		}
	}
	
	// 좋아요 총 개수
	public int productTotalLikeCount(int productId) {
		return usedSqlMapper.selectProductLikeCountByProductId(productId);
	}
	
	// 내가 좋아요를 눌렀는지 확인
	public boolean isLiked(ProductLikeDto productLikeDto) {
		return usedSqlMapper.selectMyProductLike(productLikeDto)>0;
	}
	
	// 소분류 가져오기 -id 에 따른
	public ProductSubCategoryDto selectProductSubCategoryById(int id) {
		return usedSqlMapper.selectProductSubCategoryById(id);
	}
	
	// 상품 소분류 아이디에 대한 대분류 가져오기
	public ProductMainCategoryDto selectProductMainCategoryDtoById(int productId) {
		ProductDto productDto = usedSqlMapper.selectProductById(productId);
		int subCategoryId = productDto.getProduct_sub_category();
		ProductSubCategoryDto subCategoryDto = usedSqlMapper.selectProductSubCategoryById(subCategoryId);
		int mainCategoryId = subCategoryDto.getProduct_main_category_id();
		ProductMainCategoryDto productMainCategoryDto = usedSqlMapper.selectProductMainbCategoryById(mainCategoryId);
		return productMainCategoryDto;
	}
	
	//상품 수정 업데이트 
	public void updateProduct(ProductDto productDto) {
		usedSqlMapper.updateProduct(productDto);
	}
	
	//상품 이미지 삭제 
	public void deleteProductImgByProductId(int productId) {
		usedSqlMapper.deleteProductImgByProductId(productId);
	}
	
	//상품 삭제
	public void deleteProductByProductId(int id) {
		usedSqlMapper.deleteProductByProductId(id);
	}
	
	// 거래 요청 insert
	public void insertProductRequest(ProductRequestDto productRequestDto) {
		usedSqlMapper.insertProductRequest(productRequestDto);
	}
	
	// 사용자가 해당 상품을 거래요청했는지 확인 
	public boolean selectProductRequestCountByUser(int productId, int userId) {
		return usedSqlMapper.selectProductRequestCountByUser(productId,userId)>0;
	}
	
	// 거래요청 취소
	public void deleteProductRequestByUser(int productId, int userId) {
		usedSqlMapper.deleteProductRequestByUser(productId,userId);
	}
	
	// 상품 ID에 따른 거래요청리스트-userDto
	public List<Map<String, Object>> selectProductRequestByProductId(int productId){
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		List<ProductRequestDto> productRequestDtoList = usedSqlMapper.selectProductRequestByProductId(productId);
		for(ProductRequestDto productRequestDto:productRequestDtoList) {
			Map<String, Object> map = new HashMap<String, Object>();
			UserDto userDto = usedSqlMapper.selectUserDtoById(productRequestDto.getUser_id());
			
			map.put("productRequestDto", productRequestDto);
			map.put("userDto", userDto);
			list.add(map);
		}
		return list;
	}
	
	// 거래요청 상태 변경 - 예약중
	public void updateProductRequestStatusReservate(int productId, int userId) {
		usedSqlMapper.updateProductRequestStatusReservate(productId, userId);
	}
	
	// 거래요청 상태 변경 - 거래완료 
	public void updateProductRequestStatusComplete(int productId, int userId) {
		usedSqlMapper.updateProductRequestStatusComplete(productId, userId);
	}
	
	// 거래요청 상태 변경 - 예약취소->거래요청 
	public void updateProductRequestStatusCancel(int productId, int userId) {
		usedSqlMapper.updateProductRequestStatusCancel(productId, userId);
	}
	
	// 거래요청 중 예약중인 것의 개수 
	public int countProductRequestReservation(int productId) {
		return usedSqlMapper.countProductRequestReservation(productId);
	}
	
	// 거래요청 중 거래완료인 것의 개수 
	public int countProductRequestComplete(int productId) {
		return usedSqlMapper.countProductRequestComplete(productId);
	}
	
	// 총 요청 개수 - 상품 아이디에 따른
	public int countProductRequestByProductId(int productId) {
		return usedSqlMapper.countProductRequestByProductId(productId);
	}
	
	// 사용자가 거래요청한 것과 거래요청 받은 것의 리스트 (상품Dto, 회원Dto, 요청Dto, 동네Dto) 
	public List<Map<String, Object>> selectProductRequestAllByUserId(Integer userId) {
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		List<ProductRequestDto> productRequestDtoList = usedSqlMapper.selectProductRequestAllByUserId(userId);
		for(ProductRequestDto productRequestDto:productRequestDtoList) {
			Map<String, Object> map = new HashMap<>();
			Integer requestId = productRequestDto.getId();
			ProductDto productDto = usedSqlMapper.selectProductById(productRequestDto.getProduct_id());
			ProductTownDto productTownDto = usedSqlMapper.selectProductTownById(productDto.getProduct_town_id()); 
			ProductImgDto productImgDto = usedSqlMapper.selectProductImg(productRequestDto.getProduct_id());
			ProductChatDto productChatDto = usedSqlMapper.selectLastChatContent(requestId);
			// 안읽은 개수 표시
			int unreadCount = usedSqlMapper.selectUnreadCountByRequestId(requestId, userId);
			// 내가 거래요청한 채팅일 때 & chat내용이 null일때 
			UserDto userDto = null;
			String chatContent = null;
			String lastChatDate = null;

			if(productRequestDto.getUser_id()==userId && usedSqlMapper.selectChatCount(requestId)==0) {
				// 상대방 UserDto 
				userDto = usedSqlMapper.selectUserDtoById(productDto.getUser_id());
				chatContent = "";
				lastChatDate = "";
			    
			}else if(productRequestDto.getUser_id()==userId && usedSqlMapper.selectChatCount(requestId)>0){
				userDto = usedSqlMapper.selectUserDtoById(productDto.getUser_id());
				chatContent = productChatDto.getContent();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
				String formattedDateTime = sdf.format(productChatDto.getReg_date());
				lastChatDate = formattedDateTime;
			}
			else if(productRequestDto.getUser_id()!=userId && usedSqlMapper.selectChatCount(requestId)==0) {
			// 내상품에 대한 채팅을 받았을 때 & chat내용이 null일때 
				userDto = usedSqlMapper.selectUserDtoById(productRequestDto.getUser_id());
				chatContent = "";
				lastChatDate = "";
		    }    
			else {
				userDto = usedSqlMapper.selectUserDtoById(productRequestDto.getUser_id());
				chatContent = productChatDto.getContent();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
				String formattedDateTime = sdf.format(productChatDto.getReg_date());
				lastChatDate = formattedDateTime;
			}
			
			map.put("productRequestDto", productRequestDto);
			map.put("productDto", productDto);
			map.put("userDto", userDto);
			map.put("productImgDto", productImgDto);
			map.put("productTownDto", productTownDto);
			map.put("chatContent", chatContent);
			map.put("unreadCount", unreadCount);
			map.put("lastChatDate", lastChatDate);
			list.add(map);
		}
		return list;
	}
	
	// 채팅 insert 
	public void insertProductChat(ProductChatDto productChatDto) {
		usedSqlMapper.insertProductChat(productChatDto);
	}
	
	// 각 채팅방에 대한 채팅내용 불러오기 
	public List<ProductChatDto> selectProductChatByRequestId(Integer requestId) {
		return usedSqlMapper.selectProductChatByRequestId(requestId);
	}

	// 채팅창 읽음여부 업데이트 
	public void updateIsRead(Integer requestId, Integer receiverId) {
		usedSqlMapper.updateIsRead(requestId, receiverId);
	}
	
	// pkId로 productRequestDto select
	public ProductRequestDto selectProductRequestById(Integer id) {
		return usedSqlMapper.selectProductRequestById(id);
	}
	
	// 채팅창 header 내 필요한 정보 
	public Map<String, Object> selectProductInformation(Integer productId){
		Map<String, Object> map = new HashMap<String, Object>();
		ProductImgDto productImgDto = usedSqlMapper.selectProductImg(productId);
		ProductDto productDto = usedSqlMapper.selectProductById(productId);
		String status = null;
		if(usedSqlMapper.countProductRequestComplete(productId)>0) {
			status = "거래완료";
		}else if(usedSqlMapper.countProductRequestReservation(productId)>0) {
			status = "예약중";
		}else {
			status = "판매중";
		}
		
		
		map.put("productImgDto", productImgDto);
		map.put("productDto", productDto);
		map.put("status", status);
		
		return map;
		
	}
	
	// 판매자일때 요청자, 상품 아이디에 따른 productRequestDto 가져오기
	public ProductRequestDto selectProductRequestByProductIdAndRequestId(Integer productId,Integer requesterId){
		return usedSqlMapper.selectProductRequestByProductIdAndRequestId(productId, requesterId);
	}
	
	// 카카오페이  결제 저장 
	public void saveOrderAndPaymentInfo(UsedKaKaoPayApproveDto usedKaKaoPayApproveDto) {
		
		usedSqlMapper.insertUsedPayment(usedKaKaoPayApproveDto);
		// 코인 저장 
		ProductDto productDto = usedSqlMapper.selectProductById(usedKaKaoPayApproveDto.getItem_code());
		UserCoinDto userCoinDto = new UserCoinDto(); 
		userCoinDto.setUser_id(productDto.getUser_id());
		userCoinDto.setCoin_transaction(productDto.getPrice()); 
		userCoinDto.setTransaction_operand("P");
		userCoinDto.setTransaction_detail("중고거래 입금"); 
		
		userSqlMapper.insertUserCoin(userCoinDto);
		
		//채팅 저장
		ProductChatDto productChatDto = new ProductChatDto();
		// 돈 보내는 사람 
		UserDto userDto = usedSqlMapper.selectUserDtoById(usedKaKaoPayApproveDto.getPartner_user_id());
		// 채팅에 입금한거 저장
		productChatDto.setPurchase_request_id(usedKaKaoPayApproveDto.getPartner_order_id());
		// productDto.getPrice() 값을 가져온다고 가정
		int price = productDto.getPrice();

		// 천단위마다 쉼표를 찍는 DecimalFormat 객체 생성
		DecimalFormat decimalFormat = new DecimalFormat("#,###");

		// price 값을 천단위마다 쉼표를 찍어서 문자열로 변환
		String formattedPrice = decimalFormat.format(price);
		productChatDto.setContent(userDto.getNickname()+"이(가) "+formattedPrice+"원 송금하였습니다.");
		usedSqlMapper.insertProductChat(productChatDto);
	}
	
	// 광고 주문/결제 정보 가져오기  
	public Map<String, Object> getOrderAndPaymentInfo(Integer orderId) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("payment", usedSqlMapper.getUsedPaymentByOrderId(orderId));
		ProductDto productDto = usedSqlMapper.selectProductById(usedSqlMapper.selectProductRequestById(orderId).getProduct_id());
		map.put("productDto", productDto);
		
		return map;
	}
	
	// 리뷰 모달 정보 다 가져오기 (상품, 유저, 거래, 평가 카테고리)
	public Map<String, Object> getReviewHeaderAndBody(Integer senderId, Integer receiverId, Integer requestId){
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("senderDto", usedSqlMapper.selectUserDtoById(senderId));
		map.put("receiverDto", usedSqlMapper.selectUserDtoById(receiverId));
		map.put("productRequestDto", usedSqlMapper.selectProductRequestById(requestId));
		map.put("productDto", usedSqlMapper.selectProductById(usedSqlMapper.selectProductRequestById(requestId).getProduct_id()));
		map.put("productImgDto", usedSqlMapper.selectProductImg(usedSqlMapper.selectProductRequestById(requestId).getProduct_id()));
		map.put("usedReviewRateCategoryDto", usedSqlMapper.selectUsedReviewRateCategory());
		
		return map;
	}
	
	// 리뷰 모달에 질문, 체크박스 가져오기 
	public Map<String, Object> getCheckBoxByRateId(Integer rateId){
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("usedReviewRateCategoryDto", usedSqlMapper.selectUsedReviewRateCategoryById(rateId));
		map.put("usedReviewCheckboxCategoryDtoList", usedSqlMapper.selectUsedReviewCheckboxCategoryByRateId(rateId));
		
		return map;
	}
	
	// 리뷰 모달에서 저장된 리뷰 내용 
	public void insertPurchaseReview(UsedPurchaseReviewDto usedPurchaseReviewDto, Integer[] checkboxs) {
		Integer reviewId = usedSqlMapper.selectPurchaseReviewPk();
		
		// 거래리뷰 insert 
		usedPurchaseReviewDto.setId(reviewId);
		if(usedPurchaseReviewDto.getReview_comment()==null || usedPurchaseReviewDto.getReview_comment()=="")
			usedPurchaseReviewDto.setReview_comment("n");
			usedSqlMapper.insertUsedPurchaseReview(usedPurchaseReviewDto);
		
		// checkbox insert 
		for(Integer checkId:checkboxs) {
			UsedCheckboxSelectedReviewDto usedCheckboxSelectedReviewDto = new UsedCheckboxSelectedReviewDto();
			usedCheckboxSelectedReviewDto.setProduct_review_id(reviewId);
			usedCheckboxSelectedReviewDto.setReview_checkbox_category_id(checkId);
			usedSqlMapper.insertUsedCheckboxSelectedReview(usedCheckboxSelectedReviewDto);
		}
	}
	
	// 리뷰 갯수 
	public int selectMyWroteReviewCount(Integer requestId, Integer senderId) {
		return usedSqlMapper.selectMyWroteReviewCount(requestId, senderId);
	}

	// 내가 쓴 해당 거래의 리뷰 가져오기 
	public Map<String, Object> getMyWroteReview(Integer requestId, Integer senderId, Integer receiverId) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("senderDto", usedSqlMapper.selectUserDtoById(senderId));
		map.put("receiverDto", usedSqlMapper.selectUserDtoById(receiverId));
		map.put("productDto", usedSqlMapper.selectProductById(usedSqlMapper.selectProductRequestById(requestId).getProduct_id()));
		map.put("usedPurchaseReviewDto", usedSqlMapper.selectPurchaseReviewByRequestIdAndSenderId(requestId,senderId));
		map.put("usedReviewCheckboxCategotyDtoList", usedSqlMapper.selectCheckboxSelectedReviewByRequestIdAndSenderId(requestId, senderId));
		map.put("recevierReviewCount", usedSqlMapper.selectMyWroteReviewCount(requestId,receiverId));
		return map;
	}

	// 메인 - 무료 나눔 리스트 
	public List<Map<String, Object>> selectFreePriceList() {
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		List<ProductDto> productDtoList = usedSqlMapper.selectFreePriceList();
		
		for(ProductDto productDto : productDtoList) {
			Map<String, Object> map = new HashMap<>();
			int productId = productDto.getId();
			Integer townId = productDto.getProduct_town_id();
			map.put("productDto", productDto);
			map.put("likeCount", usedSqlMapper.selectProductLikeCountByProductId(productId));
			map.put("requestCount", usedSqlMapper.countProductRequestByProductId(productId));
			map.put("productImgDto", usedSqlMapper.selectProductImg(productId));
			map.put("productTownDto", usedSqlMapper.selectProductTownById(townId));
			map.put("productCityDto", usedSqlMapper.selectProductCityByTownId(townId));
			map.put("uploadTime", dateToTimeDifference(productDto.getReg_date()));
			list.add(map);
		}
		return list;
	}
	
	// 자바로 날짜 구하기 
	 public static String dateToTimeDifference(Date regDate) {
	        // 현재 시간을 가져옵니다.
        Date currentTime = new Date();

        // 현재 시간과 regDate 사이의 시간 차이를 계산합니다.
        long timeDifference = currentTime.getTime() - regDate.getTime();

        // 초, 분, 시간, 일, 월, 년 단위로 차이를 계산합니다.
        long seconds = timeDifference / 1000;
        long minutes = seconds / 60;
        long hours = minutes / 60;
        long days = hours / 24;
        long months = days / 30;
        long years = months / 12;

        String formattedTime;

        // 시/분/초 중 하나를 선택하여 표시합니다.
        if (years >= 1) {
            formattedTime = years + "년 전";
        } else if (months >= 1) {
            formattedTime = months + "개월 전";
        } else if (days >= 1) {
            formattedTime = days + "일 전";
        } else if (hours >= 1) {
            formattedTime = hours + "시간 전";
        } else if (minutes >= 1) {
            formattedTime = minutes + "분 전";
        } else {
            formattedTime = seconds + "초 전";
        }

        return formattedTime;
    }
	
	// 메인페이지에서 전체상품리스트 8개 
	 public List<Map<String, Object>> selectAllProductListByEight() {
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		List<ProductDto> productDtoList = usedSqlMapper.selectAllProductListByEight();
		
		for(ProductDto productDto : productDtoList) {
			Map<String, Object> map = new HashMap<>();
			int productId = productDto.getId();
			Integer townId = productDto.getProduct_town_id();
			map.put("productDto", productDto);
			map.put("likeCount", usedSqlMapper.selectProductLikeCountByProductId(productId));
			map.put("requestCount", usedSqlMapper.countProductRequestByProductId(productId));
			map.put("productImgDto", usedSqlMapper.selectProductImg(productId));
			map.put("productTownDto", usedSqlMapper.selectProductTownById(townId));
			map.put("productCityDto", usedSqlMapper.selectProductCityByTownId(townId));
			map.put("uploadTime", dateToTimeDifference(productDto.getReg_date()));
			list.add(map);
		}
		return list;
	}
	
	// 상세페이지에서 연관상품 5개 
	 public List<Map<String, Object>> selectRelatedProductByFive(int productId) {
		// 연관상품 보여주기 
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		ProductDto productDto = usedSqlMapper.selectProductById(productId);
		List<ProductDto> relatedProductList =  usedSqlMapper.selectRelatedProductByFive(productId, productDto.getProduct_sub_category());
		for(ProductDto productDto2 : relatedProductList) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("productDto", productDto2);
			map.put("productImgDto", usedSqlMapper.selectProductImg(productDto2.getId()));
			list.add(map);
		}
		return list;
 }
	 
	// 송금 요청하기  
	public void productRequestTransfer(Integer requestId, Integer id) {
		ProductRequestDto productRequestDto = usedSqlMapper.selectProductRequestById(requestId);
		ProductDto productDto = usedSqlMapper.selectProductById(productRequestDto.getProduct_id());
		ProductChatDto productChatDto = new ProductChatDto();
		productChatDto.setPurchase_request_id(requestId);
		productChatDto.setSender_id(id);
		productChatDto.setReceiver_id(productRequestDto.getUser_id());
		productChatDto.setContent("송금 요청 메시지가 도착했습니다.\n\n- 요청 금액 : "+productDto.getPrice()+"원\n\n상단에 있는 송금하기를 클릭하여 빠르게\n 송금하세요!");
		usedSqlMapper.insertProductChat(productChatDto);
	}
	 
	// 회원 코인 조회
	public int getUserCoinBalance(int userId) {
		return userSqlMapper.getUserCoinBalance(userId);
	}
	
	// 코인 결제 후 마이너스 인서트
	public void reduceAndPlusUserCoinByUsed(UserCoinDto userCoinDto, Integer productId, Integer requestId) {
		// 나눔이 아닐때 
		if(userCoinDto.getCoin_transaction()!=0) {
			// 구매한 사람 코인 마이너스 
			usedSqlMapper.reduceUserCoinByUsed(userCoinDto);
			// 판매한 사람 코인 플러스
			int coinPk = userSqlMapper.getOnChargeCoinPk();
			ProductDto productDto = usedSqlMapper.selectProductById(productId);
			UserCoinDto userCoinDto2 = new UserCoinDto();
			userCoinDto2.setId(coinPk);
			userCoinDto2.setUser_id(productDto.getUser_id());
			userCoinDto2.setCoin_transaction(userCoinDto.getCoin_transaction());
			userCoinDto2.setTransaction_detail("중고거래 판매건 입금");
			userSqlMapper.insertUserCoin(userCoinDto2);
			// 송금하면 채팅방에 송금한거 써놓아주기
			ProductChatDto productChatDto = new ProductChatDto();
			productChatDto.setPurchase_request_id(requestId);
			productChatDto.setSender_id(userCoinDto.getUser_id());
			productChatDto.setReceiver_id(productDto.getUser_id());
			productChatDto.setContent("입금 완료 메시지가 도착했습니다.\n\n- 입금된 금액 : "+productDto.getPrice()+"원\n\n자세한 코인 내역은 마이페이지-코인관리에서 확인 가능합니다.");
			usedSqlMapper.insertProductChat(productChatDto);
		}
	}
	
	// 마이페이지 내 좋아요 목록
	public List<Map<String, Object>> selectProductLikeByUserId(Integer userId){
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		List<ProductLikeDto> productLikeDtoList = usedSqlMapper.selectProductLikeByUserId(userId);
		for(ProductLikeDto productLikeDto:productLikeDtoList) {
			Map<String, Object> map = new HashMap<String, Object>();
			Integer productId = productLikeDto.getProduct_id();
			ProductDto productDto = usedSqlMapper.selectProductById(productId);
			map.put("productDto", productDto);
			map.put("productImgDto", usedSqlMapper.selectProductImg(productId));
			map.put("productCityDto", usedSqlMapper.selectProductCityByTownId(productDto.getProduct_town_id()));
			map.put("productTownDto", usedSqlMapper.selectProductTownById(productDto.getProduct_town_id()));
			list.add(map);
		}
		return list;
	}
	 
	// 마이페이지 내 나의 판매리스트(판매중, 예약중, 거래완료) 
	public List<Map<String, Object>> selectMySellList(Integer userId, Integer statusId){
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		List<ProductDto> productDtoList = usedSqlMapper.selectMySellList(userId, statusId);
		for(ProductDto productDto : productDtoList) {
			Map<String, Object> map = new HashMap<>();
			Integer productId = productDto.getId();
			Integer townId = productDto.getProduct_town_id();
			// 소분류 카테고리 
			ProductSubCategoryDto subCategoryDto = usedSqlMapper.selectProductSubCategoryById(productDto.getProduct_sub_category());
			map.put("productDto", productDto);
			map.put("reservationCount", usedSqlMapper.countProductRequestReservation(productId));
			map.put("completeCount", usedSqlMapper.countProductRequestComplete(productId));
			map.put("usedPurchaseReviewDto", usedSqlMapper.selectProductReviewByproductIdAndSenderId(productId, userId));
			map.put("productImgDto", usedSqlMapper.selectProductImg(productId));
			map.put("productTownDto", usedSqlMapper.selectProductTownById(townId));
			map.put("productCityDto", usedSqlMapper.selectProductCityByTownId(townId));
			map.put("productSubCategoryDto", subCategoryDto);
			map.put("productMainCategoryDto", usedSqlMapper.selectProductMainbCategoryById(subCategoryDto.getProduct_main_category_id()));
			list.add(map);
		}
		return list;
	}
	 
	 
	 
	 
	 
	 
	 
	 
	
	
	
}
