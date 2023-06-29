package com.ja.safari.community.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.safari.community.mapper.CommunitySqlMapper;
import com.ja.safari.dto.HelpCommentDto;
import com.ja.safari.dto.HelpDto;
import com.ja.safari.dto.HelpImgDto;
import com.ja.safari.dto.HelpLikeDto;
import com.ja.safari.dto.RecruitDto;
import com.ja.safari.dto.RecruitImgLinkDto;
import com.ja.safari.dto.RecruitLikeDto;
import com.ja.safari.dto.UserDto;
import com.ja.safari.user.mapper.UserSqlMapper;

@Service
public class CommunityServiceImpl {
	
	@Autowired
	private CommunitySqlMapper communitySqlMapper;
	@Autowired
	private UserSqlMapper userSqlMapper;
	
	public void registerHelpBoard(HelpDto helpDto, List<HelpImgDto> helpImgDtoList) {

		int helpId =  communitySqlMapper.createPk();
		
		helpDto.setId(helpId);
		communitySqlMapper.registerHelpBoard(helpDto);
		
		for(HelpImgDto helpImgDto: helpImgDtoList) {
			helpImgDto.setHelp_id(helpId);
			communitySqlMapper.insertHelpBoardImage(helpImgDto);
			
		}
		
		
	}
	
	//해주세요 메인페이지 리스트 조회 
	public List<Map<String, Object>> selectAllHelpBoards(int helpPageNum){
		
		//화면에 출력해주기 위한 그릇(리스트)
		List<Map<String, Object>> helpBoardList = new ArrayList<>();
		
		List<HelpDto> helpDtoList = communitySqlMapper.selectAllHelpBoards(helpPageNum);
		
		for(HelpDto helpDto : helpDtoList) {
			
			Map<String, Object> map = new HashMap<>();
			
			UserDto userDto = userSqlMapper.selectUserDtoById(helpDto.getUser_id());
			
			int helpCommentCount = communitySqlMapper.selectAllHelpCommentCountByBoardId(helpDto.getId());
			
			int helpLikeCount = communitySqlMapper.selectAllHelpLikeCountByBoardId(helpDto.getId());
			
			int helpImgCount = communitySqlMapper.selectAllHelpImgByBoardId(helpDto.getId());
			
			map.put("helpImgCount", helpImgCount);
			map.put("helpLikeCount", helpLikeCount);
			map.put("helpCommentCount", helpCommentCount);
			map.put("userDto", userDto);
			map.put("helpDto", helpDto);
		
			
			helpBoardList.add(map);
		}
		
		return helpBoardList; 
	}
	// 매개변수 id : 게시글 id / 게시글 하나 조회
	public int getHelpBoardCount() {
		
		return communitySqlMapper.getHelpBoardCount();
	}
	
	//게시글 조회 
	public Map<String, Object> getHelpBoard(int id){
		
		Map<String, Object> map = new HashMap<>();
		
		HelpDto helpDto = communitySqlMapper.getHelpBoard(id);
		
		UserDto userDto = userSqlMapper.selectUserDtoById(helpDto.getUser_id());
		
		List<HelpImgDto> helpImgDtoList = communitySqlMapper.selectHelpBoardImageByHelpId(id);
		
		map.put("userDto", userDto);
		map.put("helpDto", helpDto);
		map.put("helpImgDtoList",helpImgDtoList);
		
		System.out.println(helpDto.getId());
		
		return map;
	}
	
	// 게시글 수정
	public void updateHelpBoard(HelpDto helpDto) {
		communitySqlMapper.updateHelpBoard(helpDto);
	}
	
	//게시글 삭제
	public void deleteHelpBoard(int id) {
		communitySqlMapper.deleteHelpBoard(id);
	}
	
	//게시글 조회수 
	public void increaseHelpReadCount(int id) {
		communitySqlMapper.increaseHelpReadCount(id);
	}
	
	//해주세요 댓글 작성
	public void registerHelpComment(HelpCommentDto helpCommentDto) {
		
		communitySqlMapper.registerHelpComment(helpCommentDto);
			
	}

	//해주세요 댓글 삭제
	public void deleteHelpComment(int id) {
		communitySqlMapper.deleteHelpComment(id);
	}
	
	//해주세요 댓글 개수 조회
//	public List<Map<String, Object>> selectAllHelpCommentCountByBoardId(int help_id){
//		
//		
//		List<Map<String, Object>> helpAllCommentsList = new ArrayList<>();
		
//		int   = communitySqlMapper.selectAllHelpCommentCountByBoardId(help_id);
		
//		
//		for(HelpCommentDto helpCommentDto : helpAllCommentDtoList) {
//			
//			Map<String, Object> map = new HashMap<>();
//			
//			UserDto userDto = userSqlMapper.selectById(helpCommentDto.getHelp_id());
//			HelpDto helpDto = communitySqlMapper.getHelpBoard(help_id);
//			
//			map.put("userDto", userDto);
//			map.put("helpCommentDto", helpCommentDto);
//			map.put("helpDto", helpDto);
//			
//			helpAllCommentsList.add(map);
//		}
		
//		return helpAllCommentsList;
	
	
	//해주세요 댓글 조회
	public  List<Map<String, Object>> getHelpCommentList(int id){
		
		List<Map<String, Object>> helpCommentsList = new ArrayList<>();
		
		List<HelpCommentDto> helpCommentDtoList = communitySqlMapper.selectAllHelpComments(id);
		
		for(HelpCommentDto helpCommentDto : helpCommentDtoList) {
			
			Map<String, Object> map = new HashMap<>();
			
			UserDto userDto = userSqlMapper.selectUserDtoById(helpCommentDto.getUser_id());
			
			map.put("userDto", userDto);
			map.put("helpCommentDto",helpCommentDto);
			
			helpCommentsList.add(map);
		}
		
			return helpCommentsList;
		
			
		}
				
	// 해주세요 게시물 좋아요 
	public void insertHelpLike(HelpLikeDto helpLikeDto) {
		communitySqlMapper.insertHelpLike(helpLikeDto);
	}
	
	public int getHelpLikeCountByBoardId(int help_id) {
		int HelpBoardLikeCount = communitySqlMapper.getHelpLikeCountByBoardId(help_id);
		return HelpBoardLikeCount;
	}
	
	

	/*
	 * public int getHelpLikeCountByBoardId(int help_id) { int boardLikeCount =
	 * communitySqlMapper.getHelpLikeCountByBoardId(help_id); return boardLikeCount;
	 * }
	 */
	 
	

	
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

	

	////////////
	// 구인구직 //
	///////////

	
	//구인구직 게시물 작성하기 //구인구직 이미지 링크 추가
	public void registerRecruitBoard(RecruitDto recruitDto, List<RecruitImgLinkDto> recruitImgLinkDtoList) {
		
		//시퀀스 미리 받는 것 앞으로 들어올 pk를 두 번 쓰려고.
		int recruit_id = communitySqlMapper.createRecruitPk();
		
		recruitDto.setId(recruit_id);
		communitySqlMapper.registerRecruitBoard(recruitDto);
		
		//이미지링크
		for(RecruitImgLinkDto recruitImgLinkDto : recruitImgLinkDtoList) {
			recruitImgLinkDto.setRecruit_id(recruit_id);
			communitySqlMapper.insertRecruitBoardImage(recruitImgLinkDto);
		}
		
		
	}
	
	
	
	//구인구직 게시물 전체조회 
	public List<Map<String, Object>> selectAllRecruitBoards() {
		
		List<Map<String, Object>> recruitBoardList = new ArrayList<>();
		
		List<RecruitDto> recruitDtoList = communitySqlMapper.selectAllRecruitBoards();
		
		for(RecruitDto recruitDto : recruitDtoList) {
			
			Map<String, Object> map = new HashMap<>();
			
			UserDto userDto = userSqlMapper.selectUserDtoById(recruitDto.getUser_id());
			
			map.put("recruitDto", recruitDto);
			map.put("userDto", userDto);
			
			recruitBoardList.add(map);
		}
		
		return recruitBoardList;
	}
	
	
	//구인구직 게시글 상세보기 (매개변수 id = 게시글 id) //구인구직 이미지링크 추가 //구인구직 좋아요 추가.
	public Map<String, Object> getRecruitBoard(int id){
		
		Map<String, Object> map = new HashMap<>();
		
		RecruitDto recruitDto = communitySqlMapper.selectById(id);
		
		UserDto userDto = userSqlMapper.selectUserDtoById(recruitDto.getUser_id());// 주의
		
		//이미지
		List<RecruitImgLinkDto> recruitImgLinkDtoList = communitySqlMapper.selectRecruitBoardImageByRecruitId(id);
		
		//에러잡는 코드.
		for(RecruitImgLinkDto c: recruitImgLinkDtoList) {
			System.out.println(c.toString());
		}
		
		map.put("userDto", userDto);
		map.put("recruitDto", recruitDto);
		   
		//이미지
		map.put("recruitImgLinkDtoList", recruitImgLinkDtoList);
		
		return map;
	}
	
	//구인구직 좋아요 insert
	public void insertRecruitLike(RecruitLikeDto recruitLikeDto) {
		
		communitySqlMapper.insertRecruitLike(recruitLikeDto);
	}
	
	//구인구직 좋아요 count
	public int countLikeByRecruitBoardId(int recruit_id) {
		
		int RecruitBoardLikeCount = communitySqlMapper.countLikeByRecruitBoardId(recruit_id);
		
		return RecruitBoardLikeCount;
	}



}

