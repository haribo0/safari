package com.ja.safari.used.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.rowset.JoinRowSet;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.safari.dto.ProductChatDto;
import com.ja.safari.dto.ProductCityDto;
import com.ja.safari.dto.ProductDto;
import com.ja.safari.dto.ProductImgDto;
import com.ja.safari.dto.ProductLikeDto;
import com.ja.safari.dto.ProductMainCategoryDto;
import com.ja.safari.dto.ProductRequestDto;
import com.ja.safari.dto.ProductSubCategoryDto;
import com.ja.safari.dto.ProductTownDto;
import com.ja.safari.dto.UserDto;
import com.ja.safari.used.mapper.UsedSqlMapper;

@Service
public class UsedServiceImpl {
	
	@Autowired
	UsedSqlMapper usedSqlMapper;
	
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
			int productId = productDto.getId();
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
		String content = productDto.getContent().replaceAll("\n", "<br>");
		productDto.setContent(content);
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
	
	// 사용자가 거래요청한 것과 거래요청 받은 것의 리스트 (상품Dto, 회원Dto, 요청Dto) 
	public List<Map<String, Object>> selectProductRequestAllByUserId(Integer userId) {
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		List<ProductRequestDto> productRequestDtoList = usedSqlMapper.selectProductRequestAllByUserId(userId);
		for(ProductRequestDto productRequestDto:productRequestDtoList) {
			Map<String, Object> map = new HashMap<>();
			ProductDto productDto = usedSqlMapper.selectProductById(productRequestDto.getProduct_id());
			ProductImgDto productImgDto = usedSqlMapper.selectProductImg(productRequestDto.getProduct_id());
			// 내가 거래요청한 채팅일 때
			UserDto userDto = null;
			if(productRequestDto.getUser_id()==userId) {
				// 상대방 UserDto 
				userDto = usedSqlMapper.selectUserDtoById(productDto.getUser_id());
			}// 내상품에 대한 채팅을 받았을 때 
			else {
				userDto = usedSqlMapper.selectUserDtoById(productRequestDto.getUser_id());
			}
			map.put("productRequestDto", productRequestDto);
			map.put("productDto", productDto);
			map.put("userDto", userDto);
			map.put("productImgDto", productImgDto);
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
	
	
}
