package com.ja.safari.community.mapper;

import java.util.List;

import com.ja.safari.dto.PromotionReviewCommentDto;

public interface PromotionReviewCommentMapper {

	public void insertPromotionReviewComment (PromotionReviewCommentDto promotionReviewCommentDto);
	
	public List<PromotionReviewCommentDto> selectPromotionReviewCommentAll(Integer promotion_review_id);
	
	// 프로모션 글 목록 리스트에 댓글 갯수	
	public int countPromotionReviewComment(int promotion_review_id);
	
	// 댓글 수정
	public void updatePromoComment(PromotionReviewCommentDto promotionReviewCommentDto);
	
	// 댓글 삭제
	public void deletePromotionReviewComment(Integer id);
	
	// 댓글 id 조회
	public PromotionReviewCommentDto selectPromoCommentById(int id);
}
