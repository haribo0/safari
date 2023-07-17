package com.ja.safari.community.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.safari.community.mapper.PromotionReviewCommentMapper;
import com.ja.safari.dto.PromotionReviewCommentDto;
import com.ja.safari.dto.UserDto;
import com.ja.safari.user.mapper.UserSqlMapper;

@Service
public class PromotionReviewCommentServiceImpl {
	
	@Autowired
	private PromotionReviewCommentMapper promotionReviewCommentMapper;
	@Autowired
	private UserSqlMapper userSqlMapper;
	
	
	// 댓글 리스트
	public List<Map<String, Object>> getpromotionReviewCommentDtoList (Integer promotion_review_id){	
		
		List<PromotionReviewCommentDto> promotionReviewCommentDtoList = promotionReviewCommentMapper.selectPromotionReviewCommentAll(promotion_review_id);
		
		List<Map<String, Object>> promoCommentDtoList = new ArrayList<>();
			
		for(PromotionReviewCommentDto promotionReviewCommentDto : promotionReviewCommentDtoList ) {
			
			Map<String, Object> map = new HashMap<>();
						
			int userId = promotionReviewCommentDto.getUser_id();
				
			UserDto userDto = userSqlMapper.selectUserDtoById(userId);
			
			
			map.put("userDto", userDto);
			map.put("promotionReviewCommentDto", promotionReviewCommentDto);
						
			promoCommentDtoList.add(map);			
			
		}

		return promoCommentDtoList;
		
		
	}
	
	// 댓글 작성
	public void writePromotionReivewComment(PromotionReviewCommentDto promotionReviewCommentDto) {
		
		
		promotionReviewCommentMapper.insertPromotionReviewComment(promotionReviewCommentDto);
		
		
	}
	
	// 게시글에서 댓글 삭제
	public void deletePromotionReviewComment(Integer id) {
		

		System.out.println("댓글서비스 : " + id);
		
		promotionReviewCommentMapper.deletePromotionReviewComment(id);
	}
	
	// 댓글 id 조회
	public PromotionReviewCommentDto selectPromoCommentById(int id) {
		
		return promotionReviewCommentMapper.selectPromoCommentById(id);
	}
	
	// 댓글 수정
	public void updatePromoComment(PromotionReviewCommentDto promotionReviewCommentDto) {
		
		promotionReviewCommentMapper.updatePromoComment(promotionReviewCommentDto);
		
		
	}
	
	
	
}
