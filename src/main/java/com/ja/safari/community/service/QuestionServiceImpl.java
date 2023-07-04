package com.ja.safari.community.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.safari.community.mapper.QuestionSqlMapper;
import com.ja.safari.dto.QuestionDto;
import com.ja.safari.dto.QuestionLikeDto;
import com.ja.safari.dto.QuestionReplyDto;
import com.ja.safari.dto.UserDto;
import com.ja.safari.user.mapper.UserSqlMapper;

@Service
public class QuestionServiceImpl {


	
	@Autowired
	private UserSqlMapper userSqlMapper;
	
	@Autowired
	private QuestionSqlMapper questionSqlMapper;
	
	
	//궁금해요 게시물 등록 
	public void registerQuestionBoard(QuestionDto questionDto) {
		questionSqlMapper.registerQuestionBoard(questionDto);
	}
	
	//궁금해요 게시물 조회
	public Map<String, Object> getQuestionBoardByBoardId(int id){
		
		Map<String, Object> map = new HashMap<>();
		
		QuestionDto questionDto = questionSqlMapper.getQuestionBoardByBoardId(id);
		
		UserDto userDto = userSqlMapper.selectUserDtoById(questionDto.getUser_id());
		
		map.put("userDto", userDto);
		map.put("questionDto", questionDto);
		
		return map;
		
	}
	
	//궁금해요 게시물 조회수 증가
	public void increaseQuestionReadCount(int id) {
		questionSqlMapper.increaseQuestionReadCount(id);
	}
	
	//궁금해요 게시물 전체 조회
	public List<Map<String, Object>> getQuestionBoardList(){
		
		List<Map<String, Object>> questionBoardList = new ArrayList<>();
		
		List<QuestionDto> questionDtoList = questionSqlMapper.selectAllQuestionBoards();
		
		for(QuestionDto questionDto : questionDtoList) {
			
			Map<String, Object> map = new HashMap<>();
			
			UserDto userDto = userSqlMapper.selectUserDtoById(questionDto.getUser_id());
			
			map.put("userDto", userDto);
			map.put("questionDto", questionDto);
			
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

	//궁금해요 게시물 답변 조회
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
	
	//궁금해요 게시물 좋아요 입력/취소
	public int checkQuestionLike(QuestionLikeDto questionLikeDto) {
		return questionSqlMapper.checkQuestionLike(questionLikeDto);
	}
	
	public void removeQuestionLike(QuestionLikeDto questionLikeDto) {
		questionSqlMapper.removeQuestionLike(questionLikeDto);
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
