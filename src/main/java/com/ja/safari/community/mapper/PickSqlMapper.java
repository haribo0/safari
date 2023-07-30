package com.ja.safari.community.mapper; 

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ja.safari.dto.PickCommentDto;
import com.ja.safari.dto.PickDto;
import com.ja.safari.dto.PickHashtagDto;
import com.ja.safari.dto.PickLikeDto;
import com.ja.safari.dto.PickOptionDto;
import com.ja.safari.dto.PickOptionValuesForVoteDto;
import com.ja.safari.dto.PickOptionVoteDto;
import com.ja.safari.dto.PickShowCardDto;
import com.ja.safari.dto.ProductDto;
import com.ja.safari.dto.ProductImgDto;

public interface PickSqlMapper {
	




	/////////////
	// 골라줘요  //
	/////////////
	
	
	//골라줘요 게시판 PK 조회
	public int createPickPk();
	
	//골라줘요 게시물 등록
	public void registerPickBoard(PickDto pickDto);
	
	//골라줘요 게시판 전체조회
	//public List<PickDto> selectAllPickBoards();
	public List<PickDto> selectAllPickBoards(@Param("pickPage") int pickPage, @Param("pick_searchType") String pick_searchType, @Param("pick_searchWord") String pick_searchWord);
	
	//골라줘요 메인페이지 페이징 카운트
	public int getPickBoardCount();
	
	//골라줘요 게시판 상세보기
	public PickDto getPickBoardByBoardId(int id);
	
	//골라줘요 게시물 수정하기
	public void updatePickBoard(PickDto pickDto);
	
	//골라줘요 게시물 삭제하기
	public void deletePickBoard(int id);
	
	//골라줘요 댓글 insert
	public void registerPickComment(PickCommentDto pickCommentDto);
	
	//골라줘요 게시물 ID로 댓글 조회
	public List<PickCommentDto> selectByPickcommentId(Integer id);
	
	//골라줘요 댓글 삭제
	public void deleteByPickcommentId(int id);
		
	//골라줘요 댓글 수정
	public void updatePickcomment(PickCommentDto pickCommentDto); 
	
	//골라줘요 게시물 조회수 증가
	public void increaseViewsPickBoard(int id);
	
	//골라줘요 좋아요 insert : like
	public void insertPickLike(PickLikeDto pickLikeDto); 
	
	//골라줘요 유저ID로 좋아요 여부 체크
	public int checkPickLike(PickLikeDto pickLikeDto);
	
	//골라줘요 좋아요 delete
	public void removeLikePickBoard(PickLikeDto pickLikeDto);
	
	//골라줘요 좋아요 개수 count
	public int countLikeByPickBoardId(int pick_id);	

	//골라줘요 게시물 댓글 count
	public int countPickCommentByBoardId(int pick_id);
	
	//골라줘요 : 중고 상품 테이블에서 조회해서 받아오기. (이름, 가격, 좋아요 수, 이미지) productDto 받아오기
	public List<PickShowCardDto> showAllProduct();
	
	//중요.
	//골라줘요 : 중고 상품 테이블에서 조회해서 받아오기. (이름, 가격, 좋아요 수, 이미지) productDto 받아오기 PICK_ID로 조회.
	public List<PickShowCardDto> showAllProductbyPickId(int id);
	
	// 골라줘요 최신글 정렬
	public List<PickDto> newPostByPick();
	
	
	//////////////중고//////////////////////
	//중고 이미지 아이디로 조회 //안씀
	public List<ProductImgDto> selectProductBoardImageBytProductId(int product_id);
	
	//중고 이미지 리스트 조회 //안씀
	public List<ProductImgDto> selectAllProductImg(int id);
	
	//중고게시물 전체조회
	public List<ProductDto> selectAllProductBoards();
	
	//중고이미지 전체조회
	public List<ProductImgDto> selectAllProductImages();
	
	//골라줘요 옵션 전체조회
	public List<PickOptionDto> selectAllPickOptions();
	
	//
	//중고게시물 리스트 옵션ID로 조회
	public List<ProductDto> getProductBoardByOptionId(int id);	
	
	//중고이미지 리스트 중고ID로 조회
	public List<ProductImgDto> getProductImgByProductboardId(int id);
	
	//옵션 리스트 골라줘요게시물ID로 조회
	public List<PickOptionDto> getOptionByPickboardId(int id);
	
	////////////// 골라줘요 옵션//////////////////////
	
	//골라줘요 게시물에 옵션 insert
	public void registerPickOption(PickOptionDto pickOptionDto);
	
	//골라줘요 글쓰기 페이지에서 옵션 후보 리스트 조회
	public List<ProductDto> getProductPickOptionList();
	
	//골라줘요 상세페이지 옵션 투표 결과 계산
	public List<PickOptionValuesForVoteDto> getPickOptionValues(int pick_id);	
	
	//골라줘요 상세페이지 옵션 투표하기
	public void insertPickOptionVote(PickOptionVoteDto pickOptionVoteDto);
	
	//골라줘요 상세페이지 옵션 투표 취소하기
	public void resetVote(@Param("user_id") int user_id, @Param("pick_id") int pick_id);
	

	
	
	//////////////골라줘요 해시태그//////////////////////
	//골라줘요 게시물에 해시태그 insert
	public void registerPickHashtag(PickHashtagDto pickHashtagDto);
	
	//골라줘요 게시물 ID로 해시태그 조회 select
	public List<PickHashtagDto> selectByPickHashtagId(Integer id);
	
	//골라줘요 해시태그 삭제
	public void deleteByPickHashtagId(int id);
		
	//골라줘요 해시태그 수정
	public void updatePickHashtag(PickHashtagDto pickHashtagDto); 

	//골라줘요 게시물 해시태그 count
	public int countPickHashtagByBoardId(int pick_id);
	

}
