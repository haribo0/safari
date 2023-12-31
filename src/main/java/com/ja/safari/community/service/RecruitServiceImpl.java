 package com.ja.safari.community.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.safari.community.mapper.CommunitySqlMapper;
import com.ja.safari.community.mapper.RecruitSqlMapper;
import com.ja.safari.dto.HelpDto;
import com.ja.safari.dto.HelpImgDto;
import com.ja.safari.dto.PromotionReviewDto;
import com.ja.safari.dto.PromotionReviewImgDto;
import com.ja.safari.dto.PromotionReviewLikeDto;
import com.ja.safari.dto.ProreviewRentalCategoryDto;
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
	
	
	
	//구인구직 게시물 전체조회 //좋아요 count 추가 //구인구직 이미지링크 추가
	public List<Map<String, Object>> selectAllRecruitBoards(int recruitPageNum, String recruit_searchType, String recruit_searchWord) {
		
		List<Map<String, Object>> recruitBoardList = new ArrayList<>();
		
		List<RecruitDto> recruitDtoList = recruitSqlMapper.selectAllRecruitBoards(recruitPageNum, recruit_searchType, recruit_searchWord);
		
		
		for(RecruitDto recruitDto : recruitDtoList) {
			
			Map<String, Object> map = new HashMap<>();
			
			UserDto userDto = userSqlMapper.selectUserDtoById(recruitDto.getUser_id());
			
			//이미지 링크 추가
			List<RecruitImgLinkDto> recruitImgLinkDtoList = recruitSqlMapper.selectAllRecruitImg(recruitDto.getId());
			int recruitImgCount = recruitSqlMapper.selectAllRecruitImgByBoardId(recruitDto.getId());
			
			int recruitLikeCount = recruitSqlMapper.countLikeByRecruitBoardId(recruitDto.getId());
			
			map.put("recruitDto", recruitDto);
			map.put("userDto", userDto);
			map.put("recruitLikeCount", recruitLikeCount);
			map.put("recruitImgLinkDtoList", recruitImgLinkDtoList); //이미지 링크 추가
			map.put("recruitImgCount", recruitImgCount); //이미지 링크 추가
			
			recruitBoardList.add(map);
		}
		
		return recruitBoardList;
	}
	
	//구인구직 메인페이지 best 리스트 조회 
	public List<Map<String, Object>> selectBestRecruitBoard(){
		
		//화면에 출력해주기 위한 그릇(리스트)
		List<Map<String, Object>> recruitBoardList = new ArrayList<>();
		
		List<RecruitDto> recruitDtoList = recruitSqlMapper.selectBestRecruitBoard();
		
		
		for(RecruitDto recruitDto : recruitDtoList) {
			
			Map<String, Object> map = new HashMap<>();
			
			UserDto userDto = userSqlMapper.selectUserDtoById(recruitDto.getUser_id());
			
			List<RecruitImgLinkDto> recruitImgLinkDtoList = recruitSqlMapper.selectAllRecruitImg(recruitDto.getId());
			
			int recruitLikeCount = recruitSqlMapper.countLikeByRecruitBoardId(recruitDto.getId());
			
			map.put("recruitLikeCount", recruitLikeCount);
			map.put("userDto", userDto);
			map.put("recruitDto", recruitDto);
			map.put("recruitImgLinkDtoList", recruitImgLinkDtoList);
			
			recruitBoardList.add(map);
		}
		
		return recruitBoardList; 
	}
		
	
	//구인구직 게시물 개수 count
	public int getRecruitBoardCount() {
		
		return recruitSqlMapper.getRecruitBoardCount();
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
	
	//구인구직 좋아요 삭제
	public void deleteRecruitLike(RecruitLikeDto recruitLikeDto) {
		
		recruitSqlMapper.deleteRecruitLike(recruitLikeDto);
	}
	
	//구인구직 좋아요 count
	public int countLikeByRecruitBoardId(int recruit_id) {
		
		int RecruitBoardLikeCount = recruitSqlMapper.countLikeByRecruitBoardId(recruit_id);
		
		return RecruitBoardLikeCount;
	}
	
	
	// 구인구직 게시물 최신순
		public List<Map<String, Object>> newPostByRecruit(int sessionId) {
		
		List<RecruitDto> newPostRecruitList = recruitSqlMapper.newPostByRecruit();
		
		List<Map<String, Object>> newPostByRecruitList = new ArrayList<>();
		
		for(RecruitDto recruitDto : newPostRecruitList) {
			Map<String, Object> map = new HashMap<>();
						
			UserDto userDto = userSqlMapper.selectUserDtoById(recruitDto.getUser_id());
				
				map.put("userDto", userDto);
				map.put("recruitDto", recruitDto);

				newPostByRecruitList.add(map);
			
		}		
		
		return newPostByRecruitList;
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

