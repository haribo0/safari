 package com.ja.safari.community.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.safari.community.mapper.CommunitySqlMapper;
import com.ja.safari.community.mapper.RecruitSqlMapper;
import com.ja.safari.dto.RecruitDto;
import com.ja.safari.dto.RecruitImgLinkDto;
import com.ja.safari.dto.RecruitLikeDto;
import com.ja.safari.dto.UserDto;
import com.ja.safari.user.mapper.UserSqlMapper;

@Service
public class RecruitServiceImpl {
	
	@Autowired
	private CommunitySqlMapper communitySqlMapper;
	@Autowired
	private UserSqlMapper userSqlMapper;
	@Autowired
	private RecruitSqlMapper recruitSqlMapper;

	////////////
	// 구인구직 //
	///////////

	
	//구인구직 게시물 작성하기 //구인구직 이미지 링크 추가
	public void registerRecruitBoard(RecruitDto recruitDto, List<RecruitImgLinkDto> recruitImgLinkDtoList) {
		
		//시퀀스 미리 받는 것 앞으로 들어올 pk를 두 번 쓰려고.
		int recruit_id = recruitSqlMapper.createRecruitPk();
		
		recruitDto.setId(recruit_id);
		recruitSqlMapper.registerRecruitBoard(recruitDto);
		
		//이미지링크
		for(RecruitImgLinkDto recruitImgLinkDto : recruitImgLinkDtoList) {
			recruitImgLinkDto.setRecruit_id(recruit_id);
			recruitSqlMapper.insertRecruitBoardImage(recruitImgLinkDto);
		}
		
		
	}
	
	
	
	//구인구직 게시물 전체조회 //좋아요 count 추가 
	public List<Map<String, Object>> selectAllRecruitBoards() {
		
		List<Map<String, Object>> recruitBoardList = new ArrayList<>();
		
		List<RecruitDto> recruitDtoList = recruitSqlMapper.selectAllRecruitBoards();
		
		for(RecruitDto recruitDto : recruitDtoList) {
			
			Map<String, Object> map = new HashMap<>();
			
			UserDto userDto = userSqlMapper.selectUserDtoById(recruitDto.getUser_id());
			
			int recruitLikeCount = recruitSqlMapper.countLikeByRecruitBoardId(recruitDto.getId());
			
			map.put("recruitDto", recruitDto);
			map.put("userDto", userDto);
			map.put("recruitLikeCount", recruitLikeCount);
			
			recruitBoardList.add(map);
		}
		
		return recruitBoardList;
	}
	
	
	//구인구직 게시글 상세보기 (매개변수 id = 게시글 id) //구인구직 이미지링크 추가 //구인구직 좋아요 추가.
	public Map<String, Object> getRecruitBoardById(int id){
		
		Map<String, Object> map = new HashMap<>();
		
		RecruitDto recruitDto = recruitSqlMapper.getRecruitBoardById(id);
		
		UserDto userDto = userSqlMapper.selectUserDtoById(recruitDto.getUser_id());// 주의
		
		//이미지
		List<RecruitImgLinkDto> recruitImgLinkDtoList = recruitSqlMapper.selectRecruitBoardImageByRecruitId(id);
		
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
	
	//구인구직 게시물 수정하기
	public void updateRecruitBoard(RecruitDto recruitDto) {
		
		recruitSqlMapper.updateRecruitBoard(recruitDto);
	}
	

	//구인구직 게시물 삭제하기
	public void deleteRecruitBoard(int id) {
		
		recruitSqlMapper.deleteRecruitBoard(id);
	}
	
	//구인구직 게시물 조회수 증가
	public void increaseViewsRecruitBoard(int id) {
		
		recruitSqlMapper.increaseViewsRecruitBoard(id);
	}
	
	//구인구직 좋아요 insert
	public void insertRecruitLike(RecruitLikeDto recruitLikeDto) {
		
		recruitSqlMapper.insertRecruitLike(recruitLikeDto);
	}
	
	//구인구직 좋아요 눌렀는지 유저ID로 체크.
	public int checkrecruitLike(RecruitLikeDto recruitLikeDto) {
		
		return recruitSqlMapper.checkRecruitLike(recruitLikeDto);
	}
	
	//구인구직 좋아요 count
	public int countLikeByRecruitBoardId(int recruit_id) {
		
		int RecruitBoardLikeCount = recruitSqlMapper.countLikeByRecruitBoardId(recruit_id);
		
		return RecruitBoardLikeCount;
	}
	
	
	//골라줘요 AJAX 좋아요
		public void toggleLike(RecruitLikeDto recruitLikeDto) {
				
				if(recruitSqlMapper.checkRecruitLike(recruitLikeDto) > 0) {
					recruitSqlMapper.deleteRecruitLike(recruitLikeDto);
				}else {
					recruitSqlMapper.insertRecruitLike(recruitLikeDto);
				}
			}
		
		public boolean isLiked(RecruitLikeDto recruitLikeDto) {
			return recruitSqlMapper.checkRecruitLike(recruitLikeDto) > 0;
		}
		
		public int getTotalLike(int recruit_id) {
			return recruitSqlMapper.countLikeByRecruitBoardId(recruit_id);
		}
		
	
}

