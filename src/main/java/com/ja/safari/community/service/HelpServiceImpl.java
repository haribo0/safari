package com.ja.safari.community.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.safari.community.mapper.CommunitySqlMapper;
import com.ja.safari.community.mapper.HelpSqlMapper;
import com.ja.safari.dto.HelpCommentCompleteDto;
import com.ja.safari.dto.HelpCommentDto;
import com.ja.safari.dto.HelpDto;
import com.ja.safari.dto.HelpImgDto;
import com.ja.safari.dto.HelpLikeDto;
import com.ja.safari.dto.UserDto;
import com.ja.safari.user.mapper.UserSqlMapper;

@Service
public class HelpServiceImpl {

	@Autowired
	private CommunitySqlMapper communitySqlMapper;
	
	@Autowired
	private HelpSqlMapper helpSqlMapper;
	
	@Autowired
	private UserSqlMapper userSqlMapper;
	
	public void registerHelpBoard(HelpDto helpDto, List<HelpImgDto> helpImgDtoList) {

		int helpId =  communitySqlMapper.createPk();
		
		helpDto.setId(helpId);
		helpSqlMapper.registerHelpBoard(helpDto);
		
		for(HelpImgDto helpImgDto: helpImgDtoList) {
			helpImgDto.setHelp_id(helpId);
			helpSqlMapper.insertHelpBoardImage(helpImgDto);
			
		}
		
		
	}
	
	//댓글 아이디 조회
	public HelpCommentDto getHelpCommentById(int id) {
		
		return helpSqlMapper.getHelpCommentById(id);
	}
	
	
	//해주세요 메인페이지 리스트 조회 
	public List<Map<String, Object>> selectAllHelpBoards(int helpPageNum){
		
		//화면에 출력해주기 위한 그릇(리스트)
		List<Map<String, Object>> helpBoardList = new ArrayList<>();
		
		List<HelpDto> helpDtoList = helpSqlMapper.selectAllHelpBoards(helpPageNum);
		
		for(HelpDto helpDto : helpDtoList) {
			
			Map<String, Object> map = new HashMap<>();
			
			UserDto userDto = userSqlMapper.selectUserDtoById(helpDto.getUser_id());
			
			int helpCommentCount = helpSqlMapper.selectAllHelpCommentCountByBoardId(helpDto.getId());
			
			int helpLikeCount = helpSqlMapper.selectAllHelpLikeCountByBoardId(helpDto.getId());
			
			int helpImgCount = helpSqlMapper.selectAllHelpImgByBoardId(helpDto.getId());
			
			map.put("helpImgCount", helpImgCount);
			map.put("helpLikeCount", helpLikeCount);
			map.put("helpCommentCount", helpCommentCount);
			map.put("userDto", userDto);
			map.put("helpDto", helpDto);
		
			
			helpBoardList.add(map);
		}
		
		return helpBoardList; 
	}
	
	//해주세요 메인페이지 best 리스트 조회 
	public List<Map<String, Object>> selectBestHelpBoards(){
		
		//화면에 출력해주기 위한 그릇(리스트)
		List<Map<String, Object>> helpBoardList = new ArrayList<>();
		
		List<HelpDto> helpDtoList = helpSqlMapper.selectBestHelpBoard();
		
		for(HelpDto helpDto : helpDtoList) {
			
			Map<String, Object> map = new HashMap<>();
			
			UserDto userDto = userSqlMapper.selectUserDtoById(helpDto.getUser_id());
			
			int helpCommentCount = helpSqlMapper.selectAllHelpCommentCountByBoardId(helpDto.getId());
			
			int helpLikeCount = helpSqlMapper.selectAllHelpLikeCountByBoardId(helpDto.getId());
			
			int helpImgCount = helpSqlMapper.selectAllHelpImgByBoardId(helpDto.getId());
			
			
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
		
		return helpSqlMapper.getHelpBoardCount();
	}
	
	//게시글 조회 
	public Map<String, Object> getHelpBoard(int id){
		
		Map<String, Object> map = new HashMap<>();
		
		HelpDto helpDto = helpSqlMapper.getHelpBoard(id);
		
		UserDto userDto = userSqlMapper.selectUserDtoById(helpDto.getUser_id());
		
		List<HelpImgDto> helpImgDtoList = helpSqlMapper.selectHelpBoardImageByHelpId(id);
		
		map.put("userDto", userDto);
		map.put("helpDto", helpDto);
		map.put("helpImgDtoList",helpImgDtoList);
		
		//System.out.println(helpDto.getId());
		
		return map;
	}
	
	// 게시글 수정
	public void updateHelpBoard(HelpDto helpDto) {
		helpSqlMapper.updateHelpBoard(helpDto);
	}
	
	//게시글 삭제
	public void deleteHelpBoard(int id) {
		helpSqlMapper.deleteHelpBoard(id);
	}
	
	//게시글 조회수 
	public void increaseHelpReadCount(int id) {
		helpSqlMapper.increaseHelpReadCount(id);
	}
	
	//해주세요 댓글 작성
	public void registerHelpComment(HelpCommentDto helpCommentDto) {
		
		helpSqlMapper.registerHelpComment(helpCommentDto);
			
	}

	//해주세요 댓글 삭제
	public void deleteHelpComment(int id) {
		helpSqlMapper.deleteHelpComment(id);
	}
	
	//해주세요 좋아요 insert
	public void insertHelpLike(HelpLikeDto helpLikeDto) {
		helpSqlMapper.insertHelpLike(helpLikeDto);
	}
	
	//해주세요 좋아요 눌렀는지 조회/delete
	public int checkHelpLike(HelpLikeDto helpLikeDto) {
		return helpSqlMapper.checkHelpLike(helpLikeDto);
	}
	

	//해주세요 좋아요 delete
	public void removeHelpLike(HelpLikeDto helpLikeDto) {
		helpSqlMapper.removeHelpLike(helpLikeDto);
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
		
		List<HelpCommentDto> helpCommentDtoList = helpSqlMapper.selectAllHelpComments(id);
		
		for(HelpCommentDto helpCommentDto : helpCommentDtoList) {
			
			Map<String, Object> map = new HashMap<>();
			
			UserDto userDto = userSqlMapper.selectUserDtoById(helpCommentDto.getUser_id());
			System.out.println(userDto);
			map.put("userDto", userDto);
			map.put("helpCommentDto",helpCommentDto);
			
			helpCommentsList.add(map);
		}
		
			return helpCommentsList;
		
			
		}
				

	
	public int getHelpLikeCountByBoardId(int help_id) {
		int HelpBoardLikeCount = helpSqlMapper.getHelpLikeCountByBoardId(help_id);
		return HelpBoardLikeCount;
	}
	
	//업로더가 게시물 채택 눌렀을 때
	//public void realCompleteHelp()
	

	//해주세요 미션완료(채택) insert
	public void acceptHelpComment(HelpCommentCompleteDto helpCommentCompleteDto) {
		helpSqlMapper.acceptHelpComment(helpCommentCompleteDto);
	}
	
	//해주세요 미션완료(채택) update
	public void completeHelpComment(HelpCommentDto helpCommentDto) {
		helpSqlMapper.completeHelpComment(helpCommentDto);
	}
	
	//해주세요 채택상태 변경
	public void changeCompleteHelp(HelpDto helpDto) {
		helpSqlMapper.changeCompleteHelp(helpDto);
	}
}
