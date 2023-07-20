package com.ja.safari.community.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.safari.community.mapper.CommunitySqlMapper;
import com.ja.safari.community.mapper.QuestionSqlMapper;
import com.ja.safari.dto.QuestionDto;
import com.ja.safari.dto.QuestionImgDto;
import com.ja.safari.dto.QuestionLikeDto;
import com.ja.safari.dto.QuestionReplyDto;
import com.ja.safari.dto.UserDto;
import com.ja.safari.user.mapper.UserSqlMapper;

@Service
public class QuestionServiceImpl {

	@Autowired
	private CommunitySqlMapper communitySqlMapper;
	
	@Autowired
	private UserSqlMapper userSqlMapper;
	
	@Autowired
	private QuestionSqlMapper questionSqlMapper;
	
	
	//궁금해요 게시물 등록 
	public void registerQuestionBoard(QuestionDto questionDto, List<QuestionImgDto> questionImgDtoList) {
		
		int questionId = communitySqlMapper.createPk();
		
		questionDto.setId(questionId);
		questionSqlMapper.registerQuestionBoard(questionDto);
		
		for(QuestionImgDto questionImgDto: questionImgDtoList) {
			questionImgDto.setQuestion_id(questionId);
			questionSqlMapper.insertQuestionBoardImage(questionImgDto);
		}
	}
	
	//궁금해요 게시물 조회
	public Map<String, Object> getQuestionBoardByBoardId(int id){
		
		Map<String, Object> map = new HashMap<>();
		
		QuestionDto questionDto = questionSqlMapper.getQuestionBoardByBoardId(id);
		
		UserDto userDto = userSqlMapper.selectUserDtoById(questionDto.getUser_id());
		
		List<QuestionImgDto> questionImgDtoList = questionSqlMapper.selectQuestionBoardImageByQuestionId(id);
		
		int replyCompleteCount = questionSqlMapper.countQuestionReplyComplete(id);
		
		map.put("userDto", userDto);
		map.put("questionDto", questionDto);
		map.put("questionImgDtoList", questionImgDtoList);
		map.put("replyCompleteCount", replyCompleteCount);
		
		return map;
		
	}
	
	//궁금해요 게시물 조회수 증가
	public void increaseQuestionReadCount(int id) {
		questionSqlMapper.increaseQuestionReadCount(id);
	}
	
	//궁금해요 게시물 개수
	public int getQuestionBoardCount() {
		
		return questionSqlMapper.getQuestionBoardCount();
	}
	
	//궁금해요 메인페이지 전체 조회
	public List<Map<String, Object>> getQuestionBoardList(int questionPageNum, String question_searchType, String question_searchWord){
		
		List<Map<String, Object>> questionBoardList = new ArrayList<>();
		
		List<QuestionDto> questionDtoList = questionSqlMapper.selectAllQuestionBoards(questionPageNum, question_searchType, question_searchWord);
		
		for(QuestionDto questionDto : questionDtoList) {
			
			Map<String, Object> map = new HashMap<>();
			
			UserDto userDto = userSqlMapper.selectUserDtoById(questionDto.getUser_id());
			
			int questionLikeCount = questionSqlMapper.getQuestionLikeCountByBoardId(questionDto.getId());
			int questionReplyCount = questionSqlMapper.selectAllQuestionReplyCountByBoardId(questionDto.getId());
			int questionImgCount = questionSqlMapper.selectAllQuestionImgByBoardId(questionDto.getId());
			
			map.put("userDto", userDto);
			map.put("questionDto", questionDto);
			map.put("questionLikeCount", questionLikeCount);
			map.put("questionReplyCount", questionReplyCount);
			map.put("questionImgCount", questionImgCount);
			
			questionBoardList.add(map);
		}
		
		return questionBoardList;
	}
	
	//궁금해요 best 게시물 출력
	public List<Map<String, Object>> selectBestQuestionBoards(){
		
		List<Map<String, Object>> questionBoardList = new ArrayList<>();
		
		List<QuestionDto> questionDtoList = questionSqlMapper.selectBestQuestionBoard();
		
		for(QuestionDto questionDto : questionDtoList) {
			
			Map<String, Object> map = new HashMap<>();
			
			UserDto userDto = userSqlMapper.selectUserDtoById(questionDto.getUser_id());
			
			int questionLikeCount = questionSqlMapper.getQuestionLikeCountByBoardId(questionDto.getId());
			int questionReplyCount = questionSqlMapper.selectAllQuestionReplyCountByBoardId(questionDto.getId());
			int questionImgCount = questionSqlMapper.selectAllQuestionImgByBoardId(questionDto.getId());
			
			map.put("userDto", userDto);
			map.put("questionDto", questionDto);
			map.put("questionLikeCount", questionLikeCount);
			map.put("questionReplyCount", questionReplyCount);
			map.put("questionImgCount", questionImgCount);
			
			questionBoardList.add(map);
		}
		
		return questionBoardList;
	}
	
	//궁금해요 게시물 수정
	public void updateQuestionBoard(QuestionDto questionDto) {
		questionSqlMapper.updateQuestionBoard(questionDto);
	}
	
	//궁금해요 게시물 삭제
	public void deleteQuestionBoardByBoardId(int id) {
		questionSqlMapper.deleteQuestionBoardByBoardId(id);
	}
	
	//궁금해요 게시물 답변 등록
	public void registerQuestionReply(QuestionReplyDto questionReplyDto) {
		questionSqlMapper.registerQuestionReply(questionReplyDto);
	}
	
	//궁금해요 게시물 답변 삭제
	public void deleteQuestionReply(int id) {
		questionSqlMapper.deleteQuestionReply(id);
	}

	//궁금해요 게시물 답변 하나 조회 
	public QuestionReplyDto getQuestionReplyById(int id) {
		return questionSqlMapper.getQuestionReplyById(id);
	}
	
	////궁금해요 게시물 답변 개수 조회 
	public int selectAllQuestionReplyCountByBoardId(int question_id) {
		int questionReplyCount = questionSqlMapper.selectAllQuestionReplyCountByBoardId(question_id);
		return questionReplyCount;
	}
	
	
	//궁금해요 게시물 답변 전체 조회
	public List<Map<String, Object>> getQuestionReplyBoardList(int id){
	
	List<Map<String, Object>> questionReplyBoardList = new ArrayList<>();
	
	List<QuestionReplyDto> questionReplyDtoList = questionSqlMapper.selectAllQuestionReplyByBoardId(id);
	
	for(QuestionReplyDto questionReplyDto: questionReplyDtoList) {
		
		Map<String, Object> map = new HashMap<>();
		
		UserDto userDto = userSqlMapper.selectUserDtoById(questionReplyDto.getUser_id());
		
		
		map.put("userDto", userDto);
		map.put("questionReplyDto", questionReplyDto);
		
		questionReplyBoardList.add(map);
		
	}
	
		return questionReplyBoardList;
	}
	
	
	
	
	//궁금해요 게시물 좋아요 insert
	public void insertQuestionLike(QuestionLikeDto questionLikeDto) {
		questionSqlMapper.insertQuestionLike(questionLikeDto);
	}
	
	public int getQuestionLikeCountByBoardId(int question_id) {
		int QuestionBoardLikeCount = questionSqlMapper.getQuestionLikeCountByBoardId(question_id);
		return QuestionBoardLikeCount;
	}
	/*
	 * public int getHelpLikeCountByBoardId(int help_id) { int boardLikeCount =
	 * communitySqlMapper.getHelpLikeCountByBoardId(help_id); return boardLikeCount;
	 * }
	 */
	
	//궁금해요 게시물 좋아요 입력
	public int checkQuestionLike(QuestionLikeDto questionLikeDto) {
		return questionSqlMapper.checkQuestionLike(questionLikeDto);
	}
	
	//궁금해요 게시물 좋아요 입력 취소
	public void removeQuestionLike(QuestionLikeDto questionLikeDto) {
		questionSqlMapper.removeQuestionLike(questionLikeDto);
	}
	
	//궁금해요 좋아요 통합
	public void toggleQuestionLike(QuestionLikeDto questionLikeDto) {
		
		if(questionSqlMapper.checkQuestionLike(questionLikeDto)>0) {
			questionSqlMapper.removeQuestionLike(questionLikeDto);
		}else {
			questionSqlMapper.insertQuestionLike(questionLikeDto);
		}
	}
	
	public boolean isQuestionLiked(QuestionLikeDto questionLikeDto) {
		
		return questionSqlMapper.checkQuestionLike(questionLikeDto)>0;
	}
	
	public int getTotalQuestionLike(int question_Id) {
		return questionSqlMapper.getQuestionLikeCountByBoardId(question_Id);
	}
	
	//궁금해요 게시물 답변 채택 insert
	public void acceptQuestionReply(int id) {
		questionSqlMapper.acceptQuestionReply(id);
	}

	//궁금해요 게시물 답변 채택 update
	public void completeQuestionReply(int id) {
		questionSqlMapper.completeQuestionReply(id);
	}
	
	//궁금해요 게시물 답변 
	/*
	 * public Map<String, Object> getQuestionReply(int id){
	 * 
	 * Map<String, Object> map = new HashMap<>();
	 * 
	 * QuestionReplyDto questionReplyDto =
	 * questionSqlMapper.getQuestionReplyById(id); UserDto userDto =
	 * userSqlMapper.selectUserDtoById(questionReplyDto.getUser_id());
	 * 
	 * map.put("userDto", userDto); map.put("questionReplyDto", questionReplyDto);
	 * 
	 * return map; }
	 */
	
	//궁금해요 게시물 채택상태 update
	public void completeQuestionBoard(int id) {
		questionSqlMapper.completeQuestionBoard(id);
	}

	//궁금해요 게시물 이미지 수 count
	public int selectAllQuestionImgByBoardId(int question_id) {
		int questionImgCount = questionSqlMapper.selectAllQuestionImgByBoardId(question_id);
		return questionImgCount;
	}
	
	
	
//	public  void  getRegisterHelpBoardList() {
//		List<HelpDto> registerHelpBoardDtoList =  communitySqlMapper.registerHelpBoardselectAll();
//		
//		for(HelpDto helpDto : registerHelpBoardDtoList) {
//			helpDto.get
//		}
		
		
//	}

//	public void help(HelpDto helpDto) {
//		System.out.println("여기서 알고리즘 수행");
//		communitySqlMapper.insert(helpDto);
//	}
	
//	public void registerQuestionBoard(CommunityQuestionDto communityQuestionDto, CommunityDto communityDto, CommunityQuestionCategoryDto communityQuestionCategoryDto) {
//		
//		communitySqlMapper.registerCommunity(communityDto);
//		
//		
//		communitySqlMapper.registerQuestionCategory(communityQuestionCategoryDto);
//		communitySqlMapper.registerQuestionBoard(communityQuestionDto);
//		
//	}

	
}
