package com.ja.safari.community.mapper;

import java.util.List;

import com.ja.safari.dto.PromotionReviewCommentDto;

public interface PromotionReviewCommentMapper {

	public void insertPromotionReviewComment (PromotionReviewCommentDto promotionReviewCommentDto);
	
	public List<PromotionReviewCommentDto> selectPromotionReviewCommentAll(Integer promotion_review_id);
}
