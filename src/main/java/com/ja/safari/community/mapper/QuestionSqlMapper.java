package com.ja.safari.community.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ja.safari.dto.QuestionDto;
import com.ja.safari.dto.QuestionImgDto;
import com.ja.safari.dto.QuestionLikeDto;
import com.ja.safari.dto.QuestionReplyDto;

public interface QuestionSqlMapper {

	public int createPk();
	
	//궁금해요 게시물 등록 
		public void registerQuestionBoard(QuestionDto questionDto);
		
		//궁금해요 게시물 조회
		public QuestionDto getQuestionBoardByBoardId(int id);
		
		//궁금해요 게시물 전체 리스트 조회
		public List<QuestionDto> selectAllQuestionBoards(@Param("question_searchType") String question_searchType, @Param("question_searchWord") String question_searchWord);
		
		//궁금해요 게시물 수정
		public void updateQuestionBoard(QuestionDto questionDto);
		
		//궁금해요 게시물 삭제
		public void deleteQuestionBoardByBoardId(int id);
		
		//궁금해요 게시물 답변 등록
		public void registerQuestionReply(QuestionReplyDto questionReplyDto);
		
		//궁금해요 게시물 답변 조회
		public List<QuestionReplyDto> selectAllQuestionReplyByBoardId(int id);
		
		//궁금해요 게시물 답변 삭제
		public void deleteQuestionReply(int id);
		
		//궁금해요 게시물 조회수 증가
		public void increaseQuestionReadCount(int id);
		
		//궁금해요 게시물 좋아요 insert
		public void insertQuestionLike(QuestionLikeDto questionLikeDto);
		
		public int getQuestionLikeCountByBoardId(int question_id);
			
		
		//궁금해요 게시물 좋아요 입력/취소
		public int checkQuestionLike(QuestionLikeDto questionLikeDto);
		
		public void removeQuestionLike(QuestionLikeDto questionLikeDto);
		
		//궁금해요 게시물 답변 조회
		public QuestionReplyDto getQuestionReplyById(int id);
		
		//궁금해요 게시물 답변 채택 insert
		public void acceptQuestionReply(int id);
		
		//궁금해요 게시물 답변 채택 완료 update
		public void completeQuestionReply(int id); 
		
		//궁금해요 게시물 채택 상태 변경 update
		public void completeQuestionBoard(int id);
		
		//궁금해요 게시물 이미지 등록 
		public void insertQuestionBoardImage(QuestionImgDto questionImgDto);
		
		//궁금해요 게시물 이미지 조회
		public List<QuestionImgDto> selectQuestionBoardImageByQuestionId(int questionId);
}
