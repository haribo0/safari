package com.ja.safari.community.mapper;

import java.util.List;

import com.ja.safari.dto.HelpCommentCompleteDto;
import com.ja.safari.dto.HelpCommentDto;
import com.ja.safari.dto.HelpDto;
import com.ja.safari.dto.HelpImgDto;
import com.ja.safari.dto.HelpLikeDto;
import com.ja.safari.dto.QuestionDto;
import com.ja.safari.dto.QuestionLikeDto;
import com.ja.safari.dto.QuestionReplyDto;
import com.ja.safari.dto.RecruitDto;
import com.ja.safari.dto.RecruitImgLinkDto;
import com.ja.safari.dto.RecruitLikeDto;
import com.ja.safari.dto.UserDto;

public interface CommunitySqlMapper {
	

	
	/////////////
	// 해주세요  //
	/////////////
	
	// 해주세요 pk 
	public int createPk();
	
	public UserDto selectUserByUserId(int id);
	
	public HelpCommentDto getHelpCommentById(int id);
	
	//해주세요 게시글 등록
	public void registerHelpBoard(HelpDto helpDto);
	
	//해주세요 게시글 조회
	public List<HelpDto> selectAllHelpBoards(int helpPage);
	
	//해주세요 메인 페이징
	public int getHelpBoardCount();
	public HelpDto getHelpBoard(int id);
	
	//해주세요 게시글 수정
	public void updateHelpBoard(HelpDto helpDto);
	
	public void deleteHelpBoard(int id);
	
	public void increaseHelpReadCount(int id);

	//해주세요 이미지 등록
	public void insertHelpBoardImage(HelpImgDto helpImgDto);
	public List<HelpImgDto> selectHelpBoardImageByHelpId(int helpId);
	
	//해주세요 댓글 등록
	public void registerHelpComment(HelpCommentDto helpCommentDto);
	
	//해주세요 댓글 조회
	public List<HelpCommentDto> selectAllHelpComments(int id);
	
	//해주세요 댓글 삭제
	public void deleteHelpComment(int id);
	
	//해주세요 게시물 좋아요
	public void insertHelpLike(HelpLikeDto helpLikeDto);
	
	public int getHelpLikeCountByBoardId(int help_id);
	
	//해주세요 댓글 개수 출력
	public int selectAllHelpCommentCountByBoardId(int help_id);
	
	//해주세요 좋아요 개수 출력
	public int selectAllHelpLikeCountByBoardId(int help_id);
	
	//해주세요 이미지 유무 출력
	public int selectAllHelpImgByBoardId(int help_id);
	
	//해주세요 좋아요 1개 체크
	public int checkHelpLike(HelpLikeDto helpLikeDto);
		
	//해주세요 좋아요 1개 삭제
	public int removeHelpLike(HelpLikeDto helpLikeDto);
	
	//해주세요 베스트 게시글 출력
	public List<HelpDto> selectBestHelpBoard();
	
	//해주세요 채택 insert
	public void acceptHelpComment(HelpCommentCompleteDto helpCommentCompleteDto);
	
	// 해주세요 채택 완료 update
	public void completeHelpComment(HelpCommentDto helpCommentDto);
	
	//해주세요 채택상태 변경
	public void changeCompleteHelp(HelpDto helpDto);
	
	//궁금해요 게시물 등록 
	public void registerQuestionBoard(QuestionDto questionDto);
	
	//궁금해요 게시물 조회
	public QuestionDto getQuestionBoardByBoardId(int id);
	
	//궁금해요 게시물 전체 리스트 조회
	public List<QuestionDto> selectAllQuestionBoards();
	
	//궁금해요 게시물 수정
	public void updateQuestionBoard(QuestionDto questionDto);
	
	//궁금해요 게시물 삭제
	public void deleteQuestionBoardByBoardId(int id);
	
	//궁금해요 게시물 답변 등록
	public void registerQuestionReply(QuestionReplyDto questionReplyDto);
	
	//궁금해요 게시물 답변 조회
	public List<QuestionReplyDto> selectAllQuestionReplyByBoardId(int question_id);
	
	//궁금해요 게시물 조회수 증가
	public void increaseQuestionReadCount(int id);
	
	//궁금해요 게시물 좋아요 insert
	public void insertQuestionLike(QuestionLikeDto questionLikeDto);
	
	public int getQuestionLikeCountByBoardId(int question_id);
		
	
	//궁금해요 게시물 좋아요 입력/취소
	public int checkQuestionLike(QuestionLikeDto questionLikeDto);
	
	public void removeQuestionLike(QuestionLikeDto questionLikeDto);
	
	
	
//	public List<HelpDto> registerHelpBoardselectAll();
	
//	public void registerCommunity(CommunityDto communityDto);
//	
//	public void registerQuestionBoard(CommunityQuestionDto communityQuestionDto);
//	
//	public void registerQuestionCategory(CommunityQuestionCategoryDto communityQuestionCategoryDto);
	
	
	
	
	
	
	/////////////
	// 구인구직  //
	/////////////
	
	
	//구인구직 PK 조회
		public int createRecruitPk();
		
		//구인구직 게시물 등록
		public void registerRecruitBoard(RecruitDto recruitDto);
		
		//구인구직 게시물 이미지 등록 : image
		public void insertRecruitBoardImage(RecruitImgLinkDto recruitImgLinkDto);
		
		//구인구직 게시물 이미지 게시물 아이디로 조회
		public List<RecruitImgLinkDto> selectRecruitBoardImageByRecruitId(int recruit_id);
		
		//구인구직 게시물 전체조회
		public List<RecruitDto> selectAllRecruitBoards();
		
		//구인구직 게시물 아이디로 선택
		public RecruitDto selectById(int id);
		
		//구인구직 게시물 수정하기	//구인구직 게시물 삭제하기	//구인구직 게시물 조회수 증가
		
		//구인구직 좋아요 insert : like
		public void insertRecruitLike(RecruitLikeDto recruitLikeDto); 
		
		//구인구직 좋아요 delete
		public void deleteRecruitLike(RecruitLikeDto recruitLikeDto);
		
		//구인구직 좋아요 개수 count
		public int countLikeByRecruitBoardId(int recruit_id);
	
	
		
	
	
	}
