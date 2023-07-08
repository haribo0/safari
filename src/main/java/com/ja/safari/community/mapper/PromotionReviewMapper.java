package com.ja.safari.community.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ja.safari.dto.PromotionReviewDto;
import com.ja.safari.dto.PromotionReviewImgDto;
import com.ja.safari.dto.PromotionReviewLikeDto;

public interface PromotionReviewMapper {
	
	// PK
	public int createPK();

	// 프로모션 전체 
	public List<PromotionReviewDto> selectPromotionReviewAll(@Param("page") int page,
				@Param("promoReview_searchType")String promoReview_searchType,
				@Param("promoReview_searchWord")String promoReview_searchWord);
	
	// 리뷰 글 갯수
	public int getPromotionReviewCount(
			@Param("promoReview_searchType")String promoReview_searchType,
			@Param("promoReview_searchWord")String promoReview_searchWord);
	
	// 프로모션 insert
	public void insertPromotionReview(PromotionReviewDto promotionReviewDto);
	
	// 프로모션 이미지 전체
	public List<PromotionReviewImgDto> selectPromotionReviewImgAll();
	
	// 프로모션 이미지 insert
	public void insertPromotionReviewImg(PromotionReviewImgDto promotionReviewImgDto);
	
	// 프로모션 게시글 번호
	public PromotionReviewDto selectByPromoReviewId(int id);
	
	// 이미지
	public List<PromotionReviewImgDto> selectByPromoReviewImgId(int promotion_review_id);
	
	// 프로모션 게시글 수정
	public void updatePromotionReview(PromotionReviewDto promotionReviewDto);
	
	// 프로모션 게시글 삭제
	public void deletePromotionReview(int id);
	
	// 프로모션 게시글 이미지 삭제
	public void deletePromotionReviewImg(int promotion_review_id);
	
	// 프로모션 게시글 조회수
	public void increaseViewCount(int id);
	
	// 프로모션 게시글 좋아요 +
	public void plusPromotionReviewLike(PromotionReviewLikeDto promotionReviewLikeDto);
	
	// 프로모션 게시글 좋아요 -
	public void deletePromotionReviewLike(PromotionReviewLikeDto promotionReviewLikeDto);
	
	// 프로모션 게시글 좋아요 카운트
	public int countPromotionReviewMyLike(PromotionReviewLikeDto promotionReviewLikeDto);
	public int countLikeByPromotionReviewId(int reviewId);
	
	// 프로모션 게시물 공감순으로 정렬
	public List<PromotionReviewLikeDto> orderByPromotionReviewLikes();

	// 임시 유저 좋아요
	public int checkPromotionReviewMyLike(int user_id);
	
	// 프로모션 게시글 조회수 높은 순
	public List<PromotionReviewDto> topViewByPromoReview();
	
	
	
	
	
	
	
}
