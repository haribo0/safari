package com.ja.safari.community.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ja.safari.dto.QuestionDto;
import com.ja.safari.dto.QuestionImgDto;
import com.ja.safari.dto.QuestionLikeDto;
import com.ja.safari.dto.QuestionReplyDto;
import com.ja.safari.dto.UserCoinDto;

public interface QuestionSqlMapper {

	public int createPk();
	
	//궁금해요 게시물 등록 
		public void registerQuestionBoard(QuestionDto questionDto);
		
		// 궁금해요 게시물 개수
		public int getQuestionBoardCount();
		
		//궁금해요 게시물 조회
		public QuestionDto getQuestionBoardByBoardId(int id);
		
		//궁금해요 게시물 전체 리스트 커뮤 메인 조회
		public List<QuestionDto> selectAllQuestionMainBoards();
		
		//궁금해요 게시물 전체 리스트 조회
		public List<QuestionDto> selectAllQuestionBoards(@Param("questionPage") int questionPage, @Param("question_searchType") String question_searchType, @Param("question_searchWord") String question_searchWord);
		
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
		
		//궁금해요 좋아요 개수 출력
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
		
		//궁금해요 게시물 답변 개수 출력
		public int selectAllQuestionReplyCountByBoardId(int question_id);
		
		//궁금해요 게시물 채택 상태 변경 update
		public void completeQuestionBoard(int id);
		
		//궁금해요 게시물 이미지 등록 
		public void insertQuestionBoardImage(QuestionImgDto questionImgDto);
		
		//궁금해요 게시물 이미지 조회
		public List<QuestionImgDto> selectQuestionBoardImageByQuestionId(int questionId);
		
		//궁금해요 게시물 이미지 유무 보드 출력
		public int selectAllQuestionImgByBoardId(int question_id);
		
		//궁금해요 베스트 게시물 출력
		public List<QuestionDto> selectBestQuestionBoard();
		
		//궁금해요 베스트 배너
		public List<QuestionDto> selectBestBanner();
		
		// 글 채택 여부...
		public int countQuestionReplyComplete(int question_id);

		// 답변 채택 코인 리워드 
		public void questionReplyCoinReward(UserCoinDto userCoinDto);
		
		// 궁금해요 최신 게시물
		public List<QuestionDto> newPostByQuestion();
		
		
}
