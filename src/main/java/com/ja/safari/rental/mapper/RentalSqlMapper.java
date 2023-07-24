package com.ja.safari.rental.mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.ja.safari.dto.RentalBusinessDto;
import com.ja.safari.dto.RentalMainCategoryDto;
import com.ja.safari.dto.RentalOrderDto;
import com.ja.safari.dto.RentalOrderKakaopayAmount;
import com.ja.safari.dto.RentalOrderKakaopayApprove;
import com.ja.safari.dto.RentalOrderKakaopayInactivation;
import com.ja.safari.dto.RentalOrderKakaopayReady;
import com.ja.safari.dto.RentalPeriodDiscDto;
import com.ja.safari.dto.RentalReturnKakaopayAmount;
import com.ja.safari.dto.RentalReturnKakaopayApprove;
import com.ja.safari.dto.RentalReviewCountDto;
import com.ja.safari.dto.RentalReviewDto;
import com.ja.safari.dto.RentalReviewImgDto;
import com.ja.safari.dto.RentalSubCategoryDto;
import com.ja.safari.dto.UserDto;
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
	public List<RentalItemDto> selectRentalItemListAll(@Param("sub_category_id") Integer sub_category_id, @Param("main_category_id") Integer main_category_id, @Param("orderly") String orderly);

	// 상품 하나 가져오기
	public RentalItemDto selectById(int id);

	// 상품 상세 이미지 가져오기
	public List<RentalItemImgDto> selectItemImageByItemId(int itemId);
	
	// 리뷰 별점별 갯수 가져오기 
	public List<RentalReviewCountDto> getRentalReviewCountByRating(int itemId);

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

	// 대여 title 가져오기
	public String selectItemTitleByItemId(int itemId);

	// 대여 pk 가져오기
	public int getRentalOrderPk();

	// 대여 appove pk 가져오기
	public int getRentalOrderKakaopayApprovePk();
	// 대여 반납 appove pk
	public int getRentalReturnKakaopayApprovePk();


	// 카카오 페이 준비
	public void insertRentalKakaoReady(RentalOrderKakaopayReady rentalOrderKakaopayReady);

	// 카카오 페이 준비 dto 가져오기
	public RentalOrderKakaopayReady getRentalOrderKakaopay(int id);
	// 카카오 페이 반납 dto 가져오기
	public RentalOrderKakaopayReady getRentalReturnKakaopay(int id);

	// 카카오 페이 approve & amount 정보저장
	public void insertRentalKakaoApprove(RentalOrderKakaopayApprove rentalOrderKakaopayApprove);
	public void insertRentalKakaoApproveAmount(RentalOrderKakaopayAmount rentalOrderKakaopayAmount);

	// 대여 반납 approve & amount 정보저장
	public void insertReturnKakaoApprove(RentalReturnKakaopayApprove rentalReturnKakaopayApprove);
	public void insertReturnKakaoApproveAmount(RentalReturnKakaopayAmount rentalReturnKakaopayAmount);
	
	// 카카오 페이 구독취소	
	public String getSidbyId(int id);
	public void insertRentalOrderKakaoInactivation(RentalOrderKakaopayInactivation rentalOrderKakaopayInactivation);

	// 카카오 정기결제 approve 없을시
	public Date getFirstApproveAt(String sid);

	// 대여 프로세스 완료 되었는지
	public String selectIsCompletedById(int id);

	// 대여 반납 신청pk
	public int getRentalOrderReturnPk();

	// 서브 카테고리 가져오기
	public RentalSubCategoryDto selectSubCatName(int id);

	// 메인 카테고리 이름 가져오기
	public String selectMainCatName(int main_category_id);

	// 대여 반납 아이템 가져오기
	public RentalItemReturnDto selectRentalItemRetrunById(int id);

	// 대여 찜 리스트 가져오기
	public List<RentalItemLikeDto> selectRentalItemLikeAll(int id);

	// 아이디로 유저 찾기
	public UserDto selectUserById(int id);

	// 대여 아이템 하나 가져오기
	public RentalItemDto selectRentalItem(int rental_id);

	// 유저 리뷰 카운트 
	public Integer selectIsOverCount(int id, int orderId);

	// 판매자 dto 가져오기
	public RentalBusinessDto selectRentalBuisnessById(int itemId);





	
	
}
