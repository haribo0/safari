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
import com.ja.safari.dto.UserDto;
import com.ja.safari.user.mapper.UserSqlMapper;
import com.ja.safari.user.service.UserServiceImpl;

@Service
public class PromotionReviewServiceImpl {
	
	@Autowired
	private PromotionReviewMapper promotionReviewMapper;
	@Autowired
	private UserSqlMapper userSqlMapper;
	@Autowired
	private PromotionReviewCommentMapper promotionReviewCommentMapper;
	
	// 프로모션 리뷰 게시글 목록 리스트 
	public List<Map<String, Object>> getPromotionReviewList(int page, String promoReview_searchType, String promoReview_searchWord, PromotionReviewCommentDto promotionReviewCommentDto){
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		List<PromotionReviewDto> promotionReviewList = promotionReviewMapper.selectPromotionReviewAll(page, promoReview_searchType, promoReview_searchWord);
		
		for(PromotionReviewDto promotionReviewDto : promotionReviewList) {
			Map<String, Object> map = new HashMap<>();	
		UserDto userDto = userSqlMapper.selectUserDtoById(promotionReviewDto.getUser_id());	
		List<PromotionReviewImgDto> promotionReviewImgList = promotionReviewMapper.selectByPromoReviewImgId(promotionReviewDto.getId());
		
		
		int countPromotionReviewComment = promotionReviewCommentMapper.countPromotionReviewComment(promotionReviewDto.getId());
		
		
			map.put("promotionReviewDto", promotionReviewDto);
			map.put("userDto", userDto);
			map.put("promotionReviewImgList", promotionReviewImgList);		
			map.put("countPromotionReviewComment", countPromotionReviewComment);
			
			
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
		
		
		// List 나오는지 확인용 출력(상세페이지로 넘어갈 때)
		for(PromotionReviewImgDto p : promotionReviewImgDtoList) {
			
			System.out.println(p.getPromotion_review_id());
		}
		
		
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
	public List<Map<String, Object>> orderByPromotionReviewLikes() {
		
		List<PromotionReviewLikeDto> orderByPromotionReviewLikesList = promotionReviewMapper.orderByPromotionReviewLikes();
		
		//System.out.println("공감 있는 리스트 " + orderByPromotionReviewLikesList);
		
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
		
			map.put("userDto", userDto);
			map.put("promotionReviewDto", promotionReviewDto);
			map.put("promotionReviewLikeDto", promotionReviewLikeDto);
			map.put("promotionReviewImgList", promotionReviewImgList);
			map.put("countPromotionReviewComment", countPromotionReviewComment);
			
			
			orderByPromoReviewLikesList.add(map);
			
		}
		
		return orderByPromoReviewLikesList;
	}

}
