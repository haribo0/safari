package com.ja.safari.used.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ja.safari.dto.ProductChatDto;
import com.ja.safari.dto.ProductDto;
import com.ja.safari.dto.ProductLikeDto;
import com.ja.safari.dto.UsedPurchaseReviewDto;
import com.ja.safari.dto.UserCoinDto;
import com.ja.safari.dto.UserDto;
import com.ja.safari.used.service.UsedServiceImpl;


@RestController
@RequestMapping("/used/*")
public class UsedRestController {
	
	@Autowired
	UsedServiceImpl usedService;
	
	// 상품 전체보기 -ajax 카테고리 정렬 및 모든 정렬 
	@RequestMapping("getProductByAllCondition")
	public Map<String, Object> getProductByAllCondition(
			Integer mainId,  
			Integer subId, 
			Integer cityId, 
			Integer townId, 
			Integer statusId, 
			Integer orderId) {
		Map<String, Object> map = new HashMap<>();
		List<Map<String, Object>> list = usedService.selectProductByAllCondition(mainId, subId, cityId, townId, statusId, orderId);
		map.put("result", "success");
		map.put("list", list);
		
		return map;
	}
	
	// 상품 전체보기  
	@RequestMapping("getProductList")
	public Map<String, Object> getProductList() {
		Map<String, Object> map = new HashMap<>();
		List<Map<String, Object>> list = usedService.selectProductList();
		map.put("result", "success");
		map.put("list", list);
		
		return map;
	}
	
	// 상품상세 
	@RequestMapping("getProductById")
	public Map<String, Object> getProductById(Integer productId) {
		Map<String, Object> map = new HashMap<>();
		map.put("productDto", usedService.selectProductDtoById(productId));
		map.put("result", "success");
		
		return map;
	}
	
	// 대분류에 따른 소분류 
	@RequestMapping("getSubCategoryList")
	public Map<String, Object> getSubCategoryList(Integer mainCategoryId) {
		Map<String, Object> map = new HashMap<>();
		map.put("subCategoryList", usedService.selectSubCategory(mainCategoryId));
		return map;
	}
	
	// 도시에 따른 동네 
	@RequestMapping("getTownList")
	public Map<String, Object> getTownList(Integer cityId) {
		Map<String, Object> map = new HashMap<>();
		map.put("getTownList", usedService.selectProductTown(cityId));
		return map;
	}
	
	// id가 있는지 확인 
	@RequestMapping("getMyId")
	public Map<String, Object> getMyId(HttpSession session){
		Map<String, Object> map = new HashMap<>();
		
		if(session.getAttribute("sessionUser")==null) {
			map.put("result", "fail");
			map.put("reason", "로그인되어있지않습니다.");
		}else {
			map.put("result", "success");
			map.put("id", session.getId());
		}
		return map;
	}
	
	// 총 찜수 가져오기 
	@RequestMapping("getTotalLikeCount")
	public Map<String, Object> getTotalLikeCount(int productId){
		Map<String, Object> map = new HashMap<>();
		map.put("result", "success");
		map.put("count", usedService.productTotalLikeCount(productId));
		return map;
	}
	
	// 좋아요 누르기(insert,delete)
	@RequestMapping("toggleLike")
	public  Map<String, Object> toggleLike(ProductLikeDto productLikeDto, int productId, HttpSession session){
		Map<String, Object> map = new HashMap<>();
		UserDto sessionUser =  (UserDto) session.getAttribute("sessionUser");
		productLikeDto.setProduct_id(productId);
		productLikeDto.setUser_id(sessionUser.getId());
		usedService.toggleLike(productLikeDto);
		map.put("result", "success");
		return map;
	}
	
	// 좋아요 있는지 없는지 확인 
	@RequestMapping("isLiked")
	public Map<String, Object> isLiked(HttpSession session, int productId, ProductLikeDto productLikeDto){
		Map<String, Object> map = new HashMap<>();
		UserDto sessionUser =  (UserDto) session.getAttribute("sessionUser");
		
		if(sessionUser == null) {
			map.put("result", "fail");
			map.put("reason", "로그인되어있지않습니다.");
			return map;
		}
		
		productLikeDto.setProduct_id(productId);
		productLikeDto.setUser_id(sessionUser.getId());
		
		map.put("result", "success");
		map.put("isLiked", usedService.isLiked(productLikeDto));
		
		return map;
	}
	
	// 수정할때 price가져오기
	@RequestMapping("getProductPrice")
	public Map<String, Object> getProductPrice(int productId){
		Map<String, Object> map = new HashMap<>();
		ProductDto productDto = usedService.selectProductDtoById(productId);
		map.put("result", "success");
		map.put("price", productDto.getPrice());
		
		return map;
	}
	
	// 대분류 고정시키기
	@RequestMapping("getCategoryAll")
	public Map<String, Object> getCategoryAll(int productId){
		Map<String, Object> map = new HashMap<>();
		map.put("result", "success");
		ProductDto productDto = usedService.selectProductDtoById(productId);
		map.put("mainCategoryName", usedService.selectProductMainCategoryDtoById(productId).getMain_category_name());
		map.put("subCategoryName", usedService.selectProductSubCategoryById(productDto.getProduct_sub_category()).getSub_category_name());
		
		return map;
	}
	
	// 채팅창 modal - insert
	@RequestMapping("insertProductChatDto")
	public Map<String, Object> insertProductChatDto(HttpSession session, ProductChatDto productChatDto){
		Map<String, Object> map = new HashMap<>();
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		if(sessionUser == null) {
			map.put("result", "fail");
			map.put("reason", "로그인되어있지않습니다.");
			return map;
		}
		productChatDto.setSender_id(sessionUser.getId());
		usedService.insertProductChat(productChatDto);
		map.put("result", "success");
		return map;
	}
	
	// 채팅창 리스트 보여주기 
	@RequestMapping("chatListAjax")
	public Map<String, Object> chatList(HttpSession session) {
		Map<String, Object> map = new HashMap<>();
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		if(sessionUser==null) {
			map.put("result", "fail");
			map.put("reason", "로그인되어있지않습니다.");
			return map;
		}else {
			map.put("chatRoomList", usedService.selectProductRequestAllByUserId(sessionUser.getId()));
			map.put("coinBalance", usedService.getUserCoinBalance(sessionUser.getId()));
			map.put("sessionUser", sessionUser);
			map.put("result", "success");
			return map;
		}
	}
	
	// 채팅창 modal-reloadChatList - 채팅내용 리스트 보여주기 
	@RequestMapping("reloadChatList")
	public Map<String, Object> reloadChatList(Integer requestId, HttpSession session, Integer receiverId){
		Map<String, Object> map = new HashMap<>();
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		if(sessionUser == null) {
			map.put("result", "fail");
			map.put("reason", "로그인되어있지않습니다.");
			return map;
		}else {
			map.put("sessionId", sessionUser.getId());
			map.put("receiverDto", usedService.selectUserDtoById(receiverId));
			map.put("chatList", usedService.selectProductChatByRequestId(requestId));
			map.put("result", "success");
			return map;
		}
	}
	
	// 채팅Content 읽음여부 update 
	@RequestMapping("updateIsRead")
	public Map<String, Object> updateIsRead(Integer requestId, HttpSession session){
		Map<String, Object> map = new HashMap<>();
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		if(sessionUser == null) {
			map.put("result", "fail");
			map.put("reason", "로그인되어있지않습니다.");
			return map;
		}else {
			usedService.updateIsRead(requestId, sessionUser.getId());
			map.put("result", "success");
			return map;
		}
	}
	
	// 채팅창 모달 내 상품 정보 및 상태 
	@RequestMapping("getProductInformation")
	public Map<String, Object> getProductInformation(Integer requestId, HttpSession session){
		Map<String, Object> map = new HashMap<>();
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		if(sessionUser == null) {
			map.put("result", "fail");
			map.put("reason", "로그인되어있지않습니다.");
			return map;
		}else {
			Integer productId = usedService.selectProductRequestById(requestId).getProduct_id();
			Integer requesterId = usedService.selectProductRequestById(requestId).getUser_id();
			map.put("map", usedService.selectProductInformation(productId));
			// 예약, 예약취소, 거래완료, 리뷰쓰기, 송금하기 
			map.put("sessionId", sessionUser.getId());
			map.put("reservationCount", usedService.countProductRequestReservation(productId));
		    map.put("completeCount", usedService.countProductRequestComplete(productId));
		    map.put("requestCount", usedService.countProductRequestByProductId(productId));
			map.put("productRequestDto", usedService.selectProductRequestByProductIdAndRequestId(productId, requesterId));
			map.put("myWroteReviewCount", usedService.selectMyWroteReviewCount(requestId, sessionUser.getId()));
			map.put("result", "success");
			return map;
		}
	}
	
	// 거래 예약중으로 상태 변경
	@RequestMapping("productRequestStatusReservation")
	public Map<String, Object> productRequestReservation(HttpSession session, Integer requestId) {
		Map<String, Object> map = new HashMap<>();
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		if(sessionUser == null) {
			map.put("result", "fail");
			map.put("reason", "로그인되어있지않습니다.");
			return map;
		}else {
			Integer productId = usedService.selectProductRequestById(requestId).getProduct_id();
			Integer userId = usedService.selectProductRequestById(requestId).getUser_id();
			
			usedService.updateProductRequestStatusReservate(productId, userId);
			map.put("result", "success");
			return map;
		}
	}
	
	// 거래 예약취소 - 거래요청으로 변경
	@RequestMapping("productRequestStatusCancel")
	public Map<String, Object> productRequestCancel(HttpSession session, Integer requestId) {
		Map<String, Object> map = new HashMap<>();
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		if(sessionUser == null) {
			map.put("result", "fail");
			map.put("reason", "로그인되어있지않습니다.");
			return map;
		}else {
			Integer productId = usedService.selectProductRequestById(requestId).getProduct_id();
			Integer userId = usedService.selectProductRequestById(requestId).getUser_id();
			
			usedService.updateProductRequestStatusCancel(productId, userId);
			map.put("result", "success");
			return map;
		}
	}
	
	// 거래완료- 거래완료로 상태 변경 
	@RequestMapping("productRequestStatusComplete")
	public Map<String, Object> productRequestStatusComplete(HttpSession session, Integer requestId) {
		Map<String, Object> map = new HashMap<>();
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		if(sessionUser == null) {
			map.put("result", "fail");
			map.put("reason", "로그인되어있지않습니다.");
			return map;
		}else {
			Integer productId = usedService.selectProductRequestById(requestId).getProduct_id();
			Integer userId = usedService.selectProductRequestById(requestId).getUser_id();
			
			usedService.updateProductRequestStatusComplete(productId, userId);
			map.put("result", "success");
			return map;
		}
	}
	
	// 코인 결제 후 구매자 마이너스, 판매자 플러스 헤주기
	@RequestMapping("reduceAndPlusUserCoinByUsed")
	public Map<String, Object> reduceUserCoinByUsed(HttpSession session, UserCoinDto userCoinDto, Integer productId, Integer requestId) {
		Map<String, Object> map = new HashMap<>();
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		if(sessionUser == null) {
			map.put("result", "fail");
			map.put("reason", "로그인되어있지않습니다.");
			return map;
		}else {
			usedService.reduceAndPlusUserCoinByUsed(userCoinDto, productId, requestId);
			
			map.put("result", "success");
			return map;
		}
	}
	
//	// 카카오페이 결제 ready 정보를 세션에 저장 
//	@RequestMapping("saveTidToSession")
//	public  Map<String, Object> saveTidToSession(HttpSession session, UsedKaKaoPayApproveDto usedkakaoPayApproveDto) {
//			
//		Map<String, Object> map = new HashMap<String, Object>();
//		
//		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
//		if(sessionUser == null) {
//			map.put("result", "fail");
//			map.put("reason", "login required");
//			return map;
//		}
//		
//		session.setAttribute("usedKakaoPay", usedkakaoPayApproveDto);
//		
//		map.put("result", "success");
//		
//		
//		return map;
//	}
//	
//
//	// 카카오페이 결제 ready 정보 보내주기 
//	@RequestMapping("getKakaoPayReadyInfo")
//	public Map<String, Object> getKakaoPayReadyInfo(HttpSession session) {
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		
//		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
//		if(sessionUser == null) {
//			map.put("result", "fail");
//			map.put("reason", "login required");
//			return map;
//		}
//		
//		UsedKaKaoPayApproveDto usedkakaoPayApproveDto = (UsedKaKaoPayApproveDto) session.getAttribute("usedKakaoPay");
//
//		map.put("result", "success");
//		map.put("readyInfo", usedkakaoPayApproveDto);
//		
//		return map;
//	}
//	
//	// 카카오페이 결제 후 정보 저장  
//	@RequestMapping("saveOrderAndPaymentInfo")
//	public  Map<String, Object> saveOrderAndPaymentInfo(HttpSession session, UsedKaKaoPayApproveDto usedKakaoApproveDto) {
//		Map<String, Object> map = new HashMap<String, Object>();
//		
//		UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");
//		if(sessionUser == null) {
//			map.put("result", "fail");
//			map.put("reason", "login required");
//			return map;
//		}
//		
//	    usedService.saveOrderAndPaymentInfo(usedKakaoApproveDto);
//		
//		return map;
//	}
	
	// 리뷰 모달창 정보 가져오기 
	@RequestMapping("getReviewHeaderAndBody")
	public Map<String, Object> getReviewHeaderAndBody(HttpSession session, Integer senderId, Integer receiverId, Integer requestId){
		Map<String, Object> map = new HashMap<String, Object>();
		
		UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");
		if(sessionUser == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}else {
			map.put("map", usedService.getReviewHeaderAndBody(senderId, receiverId, requestId));
			return map;
		}
	}
	
	// 리뷰 rateId에 따른 체크박스 가져오기 
	@RequestMapping("getCheckBoxByRateId")
	public Map<String, Object> getCheckBoxByRateId(HttpSession session, Integer rateId){
		Map<String, Object> map = new HashMap<String, Object>();
		
		UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");
		if(sessionUser == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}else {
			map.put("map", usedService.getCheckBoxByRateId(rateId));
			return map;
		}
	}
	
	// 리뷰 insert 
	@RequestMapping("insertPurchaseReview")
	public Map<String, Object> insertPurchaseReview(HttpSession session,
		   UsedPurchaseReviewDto usedPurchaseReviewDto,
		   Integer[] selectedCheckboxes,
		   MultipartFile reviewImg
		){
		Map<String, Object> map = new HashMap<String, Object>();
		
		UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");
		if(sessionUser == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}else {
			if(reviewImg != null) {
				String rootFolder = "/Users/gahyeonhong/Documents/safari/";
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
				String today = sdf.format(new Date());
				File targetFolder = new File(rootFolder + today); //C:/uploadFolder/2023/05/23
					
				if(!targetFolder.exists()) {
					targetFolder.mkdirs();
				}
				// 저장 파일명 만들기. 핵심은 파일명 충돌 방지 = 랜덤 + 시간
				String fileName = UUID.randomUUID().toString();
				fileName += "_" + System.currentTimeMillis();
					
				//확장자 추출
				String originalFileName = reviewImg.getOriginalFilename(); //사용자에 있는 파일명
					
				String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
					
				String saveFileName = today + "/" + fileName + ext;
					
				//문법 오류 피하기 위해서
				try {
					reviewImg.transferTo(new File(rootFolder + saveFileName));
				}catch(Exception e) {
					e.printStackTrace();
				}
				usedPurchaseReviewDto.setReview_img_link(saveFileName);
				}
			else {
				usedPurchaseReviewDto.setReview_img_link("n");
			}
			// insert
			usedService.insertPurchaseReview(usedPurchaseReviewDto, selectedCheckboxes);
			map.put("result", "success");
			return map;
		}
	}
	
	// 내가 쓴 리뷰 가져오기 
	@RequestMapping("getMyWroteReview")
	public Map<String, Object> getMyWroteReview(HttpSession session, Integer requestId, Integer senderId, Integer receiverId) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");
		if(sessionUser == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}else {
			map.put("map", usedService.getMyWroteReview(requestId,senderId,receiverId));
			map.put("result", "success");
			return map;
		}
	}
	
	// 송금 요청하기
	@RequestMapping("productRequestTransfer")
	public Map<String, Object> productRequestTransfer(HttpSession session, Integer requestId) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");
		if(sessionUser == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}else {
			usedService.productRequestTransfer(requestId,sessionUser.getId());
			map.put("result", "success");
			return map;
		}
	}
	
	
	
	
	
	
	
	
}
