package com.ja.safari.used.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ja.safari.dto.ProductChatDto;
import com.ja.safari.dto.ProductDto;
import com.ja.safari.dto.ProductLikeDto;
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
		
	// 채팅창 modal-reloadChatList - 채팅 리스트 보여주기 
	@RequestMapping("reloadChatList")
	public Map<String, Object> reloadChatList(Integer requestId, HttpSession session){
		Map<String, Object> map = new HashMap<>();
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		if(sessionUser == null) {
			map.put("result", "fail");
			map.put("reason", "로그인되어있지않습니다.");
			return map;
		}else {
			map.put("sessionId", sessionUser.getId());
		}
		map.put("chatList", usedService.selectProductChatByRequestId(requestId));
		map.put("result", "success");
		return map;
	}
}
