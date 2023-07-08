package com.ja.safari.rental.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.taglibs.standard.lang.jstl.Literal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.safari.dto.RentalBusinessDto;
import com.ja.safari.dto.RentalItemDto;
import com.ja.safari.dto.RentalItemImgDto;
import com.ja.safari.dto.RentalItemLikeDto;
import com.ja.safari.dto.RentalItemReturnDto;
import com.ja.safari.dto.RentalMainCategoryDto;
import com.ja.safari.dto.RentalOrderDto;
import com.ja.safari.dto.RentalOrderKakaopayReady;
import com.ja.safari.dto.RentalPeriodDiscDto;
import com.ja.safari.dto.RentalReviewDto;
import com.ja.safari.dto.RentalReviewImgDto;
import com.ja.safari.dto.RentalSubCategoryDto;
import com.ja.safari.dto.UserDto;
import com.ja.safari.rental.mapper.RentalSqlMapper;
import com.ja.safari.user.mapper.UserSqlMapper;
import com.ja.safari.user.service.UserServiceImpl;

@Service
public class RentalServiceImpl {
	
	@Autowired
	RentalSqlMapper rentalSqlMapper;
	
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
	
	// 상품 리스트 가져오기
	public List<Map<String, Object>> getRentalItemList(Integer sub_category_id, Integer main_category_id ) {
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		if(main_category_id == null) main_category_id = 0;
		if(sub_category_id==null) sub_category_id=0;
		
		List<RentalItemDto> rentalItemDtoList = rentalSqlMapper.selectRentalItemListAll(sub_category_id, main_category_id);
		
		for(RentalItemDto item : rentalItemDtoList) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("rentalItemDto", item);
			
			list.add(map);
		}
		return list;
	}
	
	// 카테고리 가져오기
	public List<Map<String, Object>> getCategoryList() {
		
		List<Map<String, Object>> list = new ArrayList<>();
		List<RentalMainCategoryDto> RentalMainCategoryDtoList = rentalSqlMapper.selectCategoryListAll();
		
		for(RentalMainCategoryDto item : RentalMainCategoryDtoList) {
			
			Map<String, Object> map = new HashMap<String, Object>();

			map.put("categoryItem", item);
			
			int mainCategoryId = item.getId();
			List<RentalSubCategoryDto> subCategList = rentalSqlMapper.selectSubCategoryList(mainCategoryId);

			 map.put("subTitleList", subCategList);
			
			list.add(map);
		}
		return list;
	}
	
	// 대여 아이템 하나 가져오기
	public Map<String, Object> getItem(int id) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		RentalItemDto rentalItemDto = rentalSqlMapper.selectById(id);
		List<RentalPeriodDiscDto> rentalPeriodDiscDtoList = rentalSqlMapper.selectPeriodDiscById(id);
		
		List<RentalItemImgDto> rentalItemImgDtoList = rentalSqlMapper.selectItemImageByItemId(id);
		
		map.put("rentalItemDto", rentalItemDto);
		map.put("rentalItemImgDtoList", rentalItemImgDtoList);
		map.put("rentalPeriodDiscDtoList", rentalPeriodDiscDtoList);
		
		return map;
	}

	// 대여 상품 아이템 좋아요 토글
	public void toggleRentalItemLike(RentalItemLikeDto rentalItemLikeDto) {
		
		if(rentalSqlMapper.countMyLike(rentalItemLikeDto) > 0) {
			System.out.println("0보다 큼!!!");
			rentalSqlMapper.deleteLike(rentalItemLikeDto);
		} else {
			rentalSqlMapper.insertLike(rentalItemLikeDto);
		}
		
	}
	
	// 대여 상품 아이템 좋아요 다른 이용자 누른 갯수
	public Object getTotalLike(int id) {
		return rentalSqlMapper.countLikeById(id);
	}

	// 대여 상품 아이템 내가(로그인사용자) 좋아요 했는지
	public boolean isLiked(RentalItemLikeDto rentalItemLikeDto) {
		return rentalSqlMapper.countMyLike(rentalItemLikeDto) > 0;
	}

	
	// 대여 상품 주문
	public void OrderRental(RentalOrderDto rentalOrderDto) {
		rentalSqlMapper.insertRentalOrder(rentalOrderDto);
		return;
	}

	// 대여 반납
	public void rentalReturn(RentalItemReturnDto rentalItemReturnDto) {
		rentalSqlMapper.insertRentalReturn(rentalItemReturnDto);
	}

	// 대여 리뷰 등록
	public void writeRentalReview(RentalReviewDto rentalReviewDto, List<RentalReviewImgDto> rentalReviewImgDtoList ) {
		int reviewId = rentalSqlMapper.createPk();
		
		rentalReviewDto.setId(reviewId);
		rentalSqlMapper.insertRentalReview(rentalReviewDto);
		
		for(RentalReviewImgDto i : rentalReviewImgDtoList ) {
			i.setReview_id(reviewId);
			rentalSqlMapper.insertRentalReviewImg(i);
		}
	}

	// 리뷰 불러오기
	public List<Map<String, Object>> getRentalReview(int id) {
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		List<RentalReviewDto> rentalReviewDtoList = rentalSqlMapper.selectRentalReviewAll(id);
		
		for(RentalReviewDto i :rentalReviewDtoList ) {
			Map<String, Object> map = new HashMap<String, Object>();
			
			int reviewId = i.getId();
			List<RentalReviewImgDto> rentalReviewImgDtoList = rentalSqlMapper.selectRentalReviewImgAll(reviewId);
			
			map.put("reviewImgList", rentalReviewImgDtoList);
			map.put("reviewList", i);
			
			list.add(map);
		}
		
		return list;
	}

	// 리뷰 카운트
	public Integer getRentalReviewCount(int id) {
		Integer count = rentalSqlMapper.selectReviewCount(id);
		return count;
	}

	// 리뷰 평점
	public Double getRentalReviewRating(int id) {
		   
		if(rentalSqlMapper.selectRatingAvg(id)!=null) return rentalSqlMapper.selectRatingAvg(id);
		else return 0.0;

		   
		}

	// 아이템 하나 title 가져오기
	public String getItemTitle(int itemId) {
		String title = rentalSqlMapper.selectItemTitleByItemId(itemId);
		return title;
	}

	// 주문 진행시 pk 생성
	public int getRentalOrderPk() {
		return rentalSqlMapper.getRentalOrderPk();
	}

	// 카카오페이 준비 dto 생성
	public void saveKakaoReady(RentalOrderKakaopayReady rentalOrderKakaopay) {
		rentalSqlMapper.insertRentalKakaoReady(rentalOrderKakaopay);
		return;
	}
	
	// 카카오페이 준비 다음 단계를 위한 dto 다시 가져오기
	public RentalOrderKakaopayReady getKakaoPayReady(int id) {
		RentalOrderKakaopayReady kakaoPayReady = rentalSqlMapper.getRentalOrderKakaopay(id);
		System.out.println("partner_user_id:: " + kakaoPayReady.getPartner_user_id());
		System.out.println("partner_user_id:: " + kakaoPayReady.getTid());
		return kakaoPayReady;
	}


	
	

	
	
	

}
