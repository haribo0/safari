package com.ja.safari.community.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.safari.community.mapper.PromotionReviewCommentMapper;
import com.ja.safari.community.mapper.PromotionReviewMapper;
import com.ja.safari.dto.PromotionReviewCommentDto;
import com.ja.safari.dto.PromotionReviewDto;
import com.ja.safari.dto.PromotionReviewImgDto;
import com.ja.safari.dto.PromotionReviewLikeDto;
import com.ja.safari.dto.RentalMainCategoryDto;
import com.ja.safari.dto.UserDto;
import com.ja.safari.rental.mapper.RentalSqlMapper;
import com.ja.safari.user.mapper.UserSqlMapper;

@Service
public class PromotionReviewServiceImpl {
	
	@Autowired
	private PromotionReviewMapper promotionReviewMapper;
	@Autowired
	private UserSqlMapper userSqlMapper;
	@Autowired
	private PromotionReviewCommentMapper promotionReviewCommentMapper;
	@Autowired
	private RentalSqlMapper rentalSqlMapper;
	
	
	// 프로모션 리뷰 게시글 목록 리스트 
	public List<Map<String, Object>> getPromotionReviewList(int page, String promoReview_searchType, String promoReview_searchWord,
				PromotionReviewCommentDto promotionReviewCommentDto, int sessionId){
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		List<PromotionReviewDto> promotionReviewList = promotionReviewMapper.selectPromotionReviewAll(page, promoReview_searchType, promoReview_searchWord);
		
		for(PromotionReviewDto promotionReviewDto : promotionReviewList) {
			Map<String, Object> map = new HashMap<>();	
		UserDto userDto = userSqlMapper.selectUserDtoById(promotionReviewDto.getUser_id());	
		List<PromotionReviewImgDto> promotionReviewImgList = promotionReviewMapper.selectByPromoReviewImgId(promotionReviewDto.getId());
				
		
		int countPromotionReviewComment = promotionReviewCommentMapper.countPromotionReviewComment(promotionReviewDto.getId());

		
		
		// 이건 그 게시물의 공감수가 몇개인지잖아...
		int countLikeByPromotionReview = promotionReviewMapper.countLikeByPromotionReviewId(promotionReviewDto.getId());
		int checkPromotionReviewMyLike = promotionReviewMapper.checkPromotionReviewMyLike(promotionReviewDto.getUser_id());
		
		
		PromotionReviewLikeDto paramForMybatis = new PromotionReviewLikeDto();
		paramForMybatis.setReview_id(promotionReviewDto.getId());
		paramForMybatis.setUser_id(sessionId);
		
		int realCheck = promotionReviewMapper.countPromotionReviewMyLike(paramForMybatis);
		
		
			map.put("promotionReviewDto", promotionReviewDto);
			map.put("userDto", userDto);
			map.put("promotionReviewImgList", promotionReviewImgList);		
			map.put("countPromotionReviewComment", countPromotionReviewComment);
			map.put("countLikeByPromotionReview", countLikeByPromotionReview);
			map.put("checkPromotionReviewMyLike", checkPromotionReviewMyLike);
			map.put("realCheck", realCheck);
			
			
			list.add(map);
			
		}
		
		return list;
	}
	
	// 페이징
	public int getPromotionReviewCount(String promoReview_searchType, String promoReview_searchWord) {
		
		return promotionReviewMapper.getPromotionReviewCount(promoReview_searchType, promoReview_searchWord);
	}
	
	// 프로모션 리뷰 게시물 등록
	public void writePromotionReview (PromotionReviewDto promotionReviewDto, List<PromotionReviewImgDto> promotionReviewImgDtoList) {
		
		int promotionReviewId = promotionReviewMapper.createPK();
		

		
		promotionReviewDto.setId(promotionReviewId);
		promotionReviewMapper.insertPromotionReview(promotionReviewDto);
		
		for(PromotionReviewImgDto promotionReviewImgDto : promotionReviewImgDtoList) {
			promotionReviewImgDto.setPromotion_review_id(promotionReviewId);
			promotionReviewMapper.insertPromotionReviewImg(promotionReviewImgDto);
		}
	}
		
	// 프로모션 리뷰 게시물
	public Map<String, Object> getPromotionReview(int id){
		
		Map<String, Object> map = new HashMap<>();
		
		PromotionReviewDto promotionReviewDto = promotionReviewMapper.selectByPromoReviewId(id);

		UserDto userDto = userSqlMapper.selectUserDtoById(promotionReviewDto.getUser_id());
			
		List<PromotionReviewImgDto> promotionReviewImgDtoList = promotionReviewMapper.selectByPromoReviewImgId(id);
			
		map.put("userDto", userDto);
		map.put("promotionReviewDto", promotionReviewDto);
		map.put("promotionReviewImgDtoList", promotionReviewImgDtoList);

		
		// map 안에 map 넣기 예시
		// Map<String, Object> mapRental = new HashMap<>();
		// map.put("mapRental", mapRental);
		
		return map;
	}
	
	// 프로모션 리뷰 게시물 수정
	public void updatePromotionReview(PromotionReviewDto promotionReviewDto, List<PromotionReviewImgDto> promotionReviewImgDtoList) {
		
		promotionReviewMapper.updatePromotionReview(promotionReviewDto);
		
		promotionReviewMapper.deletePromotionReviewImg(promotionReviewDto.getId());
		
		for(PromotionReviewImgDto promotionReviewImgDto : promotionReviewImgDtoList) {
			
			promotionReviewImgDto.setPromotion_review_id(promotionReviewDto.getId());
			promotionReviewMapper.insertPromotionReviewImg(promotionReviewImgDto);
			
		}
		
	}
	
	
	// 프로모션 리뷰 게시물 삭제
	public void deletePromotionReview(int id) {
		
		promotionReviewMapper.deletePromotionReview(id);
	}
	
	// 프로모션 리뷰 게시물 이미지 삭제
	public void deletePromotionReviewImg(int promotion_review_id) {
		
		promotionReviewMapper.deletePromotionReviewImg(promotion_review_id);
	}
	
	// 프로모션 리뷰 게시물 조회수
	public void increaseViewCount(int id) {
		
		promotionReviewMapper.increaseViewCount(id);
	}

	// 프로모션 리뷰 게시물 공감
	public void toggleLikePromotionReview(PromotionReviewLikeDto promotionReviewLikeDto) {
		
		if (promotionReviewMapper.countPromotionReviewMyLike(promotionReviewLikeDto) > 0) {
				promotionReviewMapper.deletePromotionReviewLike(promotionReviewLikeDto);
		} else {
				promotionReviewMapper.plusPromotionReviewLike(promotionReviewLikeDto);
			
		}
	}
	
	// 공감버튼 on/off
	public boolean promoReviewIsLiked(PromotionReviewLikeDto promotionReviewLikeDto) {	
		return promotionReviewMapper.countPromotionReviewMyLike(promotionReviewLikeDto) > 0;
		
	}
	
	// 공감 total 
	public int getTotalPromoReviewLike(int reviewId) {
		return promotionReviewMapper.countLikeByPromotionReviewId(reviewId);
	}
	
	// 공감 많은 순으로 정렬
	public List<Map<String, Object>> orderByPromotionReviewLikes(int sessionId) {
		
		List<PromotionReviewLikeDto> orderByPromotionReviewLikesList = promotionReviewMapper.orderByPromotionReviewLikes();
		
		List<Map<String, Object>> orderByPromoReviewLikesList = new ArrayList<>();
			
		
		for(PromotionReviewLikeDto promotionReviewLikeDto : orderByPromotionReviewLikesList) {
									
			Map<String, Object> map = new HashMap<>();
			
			// 내용, 제목, 
			PromotionReviewDto promotionReviewDto = 
					promotionReviewMapper.selectByPromoReviewId(promotionReviewLikeDto.getReview_id());
			
			// 회원 pk, 닉네임
			UserDto userDto = userSqlMapper.selectUserDtoById(promotionReviewDto.getUser_id());
			
				
			List<PromotionReviewImgDto> promotionReviewImgList = promotionReviewMapper.selectByPromoReviewImgId(promotionReviewDto.getId());
			
			// 댓글 수
			int countPromotionReviewComment = promotionReviewCommentMapper.countPromotionReviewComment(promotionReviewDto.getId());
		
			int countLikeByPromotionReview = promotionReviewMapper.countLikeByPromotionReviewId(promotionReviewDto.getId());
			
			PromotionReviewLikeDto paramForMybatis = new PromotionReviewLikeDto();
			paramForMybatis.setReview_id(promotionReviewDto.getId());
			paramForMybatis.setUser_id(sessionId);
			
			int realCheck = promotionReviewMapper.countPromotionReviewMyLike(paramForMybatis);
			
			
			map.put("userDto", userDto);
			map.put("promotionReviewDto", promotionReviewDto);
			map.put("promotionReviewLikeDto", promotionReviewLikeDto);
			map.put("promotionReviewImgList", promotionReviewImgList);
			map.put("countPromotionReviewComment", countPromotionReviewComment);
			map.put("countLikeByPromotionReview", countLikeByPromotionReview);
			map.put("realCheck", realCheck);
			
			orderByPromoReviewLikesList.add(map);
			
		}
		
		return orderByPromoReviewLikesList;
	}

	// 조회수 높은 순으로 정렬
	public List<Map<String, Object>> topViewCount(int sessionId) {
		
		List<PromotionReviewDto> topViewCountList = promotionReviewMapper.topViewByPromoReview();
		
		List<Map<String, Object>> topViewPromoReivewList = new ArrayList<>();
		
		for(PromotionReviewDto promotionReviewDto : topViewCountList) {
			
			Map<String, Object> map = new HashMap<>();
				
			
			// 회원 pk, 닉네임
			UserDto userDto = userSqlMapper.selectUserDtoById(promotionReviewDto.getUser_id());
			
			
			List<PromotionReviewImgDto> promotionReviewImgList = promotionReviewMapper.selectByPromoReviewImgId(promotionReviewDto.getId());
			
			// 댓글 수
			int countPromotionReviewComment = promotionReviewCommentMapper.countPromotionReviewComment(promotionReviewDto.getId());
		
			int countLikeByPromotionReview = promotionReviewMapper.countLikeByPromotionReviewId(promotionReviewDto.getId());
			
			PromotionReviewLikeDto paramForMybatis = new PromotionReviewLikeDto();
			paramForMybatis.setReview_id(promotionReviewDto.getId());
			paramForMybatis.setUser_id(sessionId);
			
			int realCheck = promotionReviewMapper.countPromotionReviewMyLike(paramForMybatis);
			
			map.put("userDto", userDto);
			map.put("promotionReviewDto", promotionReviewDto);
			map.put("promotionReviewImgList", promotionReviewImgList);
			map.put("countPromotionReviewComment", countPromotionReviewComment);
			map.put("countLikeByPromotionReview", countLikeByPromotionReview);
			map.put("realCheck", realCheck);
			
			topViewPromoReivewList.add(map);

			
		}		
		
		return topViewPromoReivewList;
	}
	
	
}
