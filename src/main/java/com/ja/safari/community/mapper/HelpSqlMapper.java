package com.ja.safari.community.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ja.safari.dto.HelpCommentDto;
import com.ja.safari.dto.HelpDto;
import com.ja.safari.dto.HelpImgDto;
import com.ja.safari.dto.HelpLikeDto;
import com.ja.safari.dto.UserCoinDto;
import com.ja.safari.dto.UserDto;

public interface HelpSqlMapper {

	public int createPk();
	
	public HelpCommentDto getHelpCommentById(int id);
	
	//해주세요 게시글 등록
	public void registerHelpBoard(HelpDto helpDto);
	
	//해주세요 게시글 조회
	public List<HelpDto> selectAllHelpBoards(@Param("helpPage") int helpPage, @Param("help_searchType") String help_searchType, @Param("help_searchWord") String help_searchWord);
	
	//해주세요 메인 페이징
	public int getHelpBoardCount();
	
	//해주세요 게시글 상세 조회
	public HelpDto getHelpBoard(int id);
	
	//해주세요 게시글 수정
	public void updateHelpBoard(HelpDto helpDto);
	
	//해주세요 게시글 삭제
	public void deleteHelpBoard(int id);
	
	//해주세요 게시글 조회수 증가 
	public void increaseHelpReadCount(int id);

	//해주세요 이미지 등록
	public void insertHelpBoardImage(HelpImgDto helpImgDto);
	
	//해주세요 이미지 조회
	public List<HelpImgDto> selectHelpBoardImageByHelpId(int helpId);
	
	//해주세요 이미지 리스트 조회
	public List<HelpImgDto> selectAllHelpImg(int id);
	
	//해주세요 게시글 최신순
	public List<HelpDto> newPostByHelp();
	
	//댓글
	//해주세요 댓글 등록
	public void registerHelpComment(HelpCommentDto helpCommentDto);
	
	//해주세요 댓글 조회
	public List<HelpCommentDto> selectAllHelpComments(int help_id); //boardId
	
	//해주세요 댓글 삭제
	public void deleteHelpComment(int id);
	
	//해주세요 댓글 수정
	public void updateHelpComment(HelpCommentDto helpCommentDto);
	
	
	
	public int getHelpLikeCountByBoardId(int help_id);
	
	//해주세요 댓글 개수 출력
	public int selectAllHelpCommentCountByBoardId(int help_id);
	
	
	//해주세요 게시물 좋아요
	public void insertHelpLike(HelpLikeDto helpLikeDto);
	
	//해주세요 좋아요 개수 출력 //countLikeByBoardId
	public int selectAllHelpLikeCountByBoardId(int help_id);
	
	//해주세요 좋아요 1개 체크 //countMyLike
	public int checkHelpLike(HelpLikeDto helpLikeDto);
	
	//해주세요 좋아요 1개 삭제
	public int removeHelpLike(HelpLikeDto helpLikeDto);
	
	//해주세요 이미지 유무 출력
	public int selectAllHelpImgByBoardId(int help_id);
		
	//해주세요 베스트 게시글 출력
	public List<HelpDto> selectBestHelpBoard();
	
	//해주세요 채택 insert
	public void acceptHelpComment(int id);
	
	// 해주세요 댓글 채택 완료 update
	public void completeHelpComment(int id);
	
	//해주세요 채택상태 변경
	public void changeCompleteHelp(int id);
	
	//해주세요 댓글 채택 코인 리워드
	public void helpCommentCoinReward(UserCoinDto userCoinDto);
}
