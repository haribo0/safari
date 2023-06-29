package com.ja.safari.rental.mapper;

import java.util.List;

import com.ja.safari.dto.RentalBusinessDto;
import com.ja.safari.dto.RentalMainCategoryDto;
import com.ja.safari.dto.RentalOrderDto;
import com.ja.safari.dto.RentalPeriodDiscDto;
import com.ja.safari.dto.RentalReviewDto;
import com.ja.safari.dto.RentalReviewImgDto;
import com.ja.safari.dto.RentalSubCategoryDto;
import com.ja.safari.dto.RentalItemDto;
import com.ja.safari.dto.RentalItemImgDto;
import com.ja.safari.dto.RentalItemLikeDto;
import com.ja.safari.dto.RentalItemReturnDto;

public interface RentalSqlMapper {
	// 다수 쿼리 적용 리뷰 이미지
	public int createPk();
	
	// 회사 회원 등록
	public void registerBusiness(RentalBusinessDto rentalBusinessDto);

	// 아이디 중복 확인 
	public int countUsersByBusinessUserId(String businessUserId);
	
	//로그인
	public RentalBusinessDto selectBusinessUserByIdAndPw(RentalBusinessDto rentalBusinessDto);
	
	// 카테고리 리스트 가져오기
	public List<RentalMainCategoryDto> selectCategoryListAll();
	
	// 서브카테고리 가져오기
	public List<RentalSubCategoryDto> selectSubCategoryList(int mainCategoryId);

	// 상품리스트 가져오기
	public List<RentalItemDto> selectRentalItemListAll();

	// 상품 하나 가져오기
	public RentalItemDto selectById(int id);

	// 상품 상세 이미지 가져오기
	public List<RentalItemImgDto> selectItemImageByItemId(int itemId);

	// 상품 좋아요 여부확인
	public int countMyLike(RentalItemLikeDto rentalItemLikeDto);
	// 좋아요 지우기
	public void deleteLike(RentalItemLikeDto rentalItemLikeDto);
	// 좋아요 생성
	public void insertLike(RentalItemLikeDto rentalItemLikeDto);
	// 렌탈 상품 아이템 좋아요 다른 이용자 누른 갯수
	public int countLikeById(int id);
	// 기간별 할인 리스트
	public List<RentalPeriodDiscDto> selectPeriodDiscById(int id);

	// 대여신청
	public void insertRentalOrder(RentalOrderDto rentalOrderDto);

	// 대여 반납
	public void insertRentalReturn(RentalItemReturnDto rentalItemReturnDto);

	// 대여 리뷰 등록
	public void insertRentalReview(RentalReviewDto rentalReviewDto);

	//대여 이미지 등록
	public void insertRentalReviewImg(RentalReviewImgDto rentalReviewImgDto);

	// 대여 리뷰 가져오기
	public List<RentalReviewDto> selectRentalReviewAll(int id);

	// 대여 리뷰 이미지 가져오기
	public List<RentalReviewImgDto> selectRentalReviewImgAll(int id);

	// 대여 리뷰 평점 가져오기
	public Double selectRatingAvg(int id);

	// 대여 리뷰 갯수 가져오기
	public Integer selectReviewCount(int id);

	
	
}
