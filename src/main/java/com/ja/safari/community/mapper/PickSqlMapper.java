package com.ja.safari.community.mapper;

import java.util.List;

import com.ja.safari.dto.PickCommentDto;
import com.ja.safari.dto.PickDto;
import com.ja.safari.dto.PickLikeDto;
import com.ja.safari.dto.PickOptionDto;

public interface PickSqlMapper {
	




	/////////////
	// 골라줘요  //
	/////////////
	
	
	//골라줘요 게시판 PK 조회
	public int createPickPk();
	
	//골라줘요 게시물 등록
	public void registerPickBoard(PickDto pickDto);
	
	//골라줘요 게시판 전체조회
	public List<PickDto> selectAllPickBoards();
	
	//골라줘요 게시판 상세보기
	public PickDto getPickBoardByBoardId(int id);
	
	//골라줘요 게시물 수정하기
	public void updatePickBoard(PickDto pickDto);
	
	//골라줘요 게시물 삭제하기
	public void deletePickBoard(int id);
	
	//골라줘요 댓글 insert
	public void registerPickComment(PickCommentDto pickCommentDto);
	
	//골라줘요 게시물 ID로 조회
	public List<PickCommentDto> selectByPickcommentId(Integer id);
	
	//골라줘요 댓글 삭제
	public void deleteByPickcommentId(int id);
		
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
	
	//골라줘요 게시물에 옵션 insert
	public void registerPickOption(PickOptionDto pickOptionDto);

}
