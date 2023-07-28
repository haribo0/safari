package com.ja.safari.community.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ja.safari.dto.HelpDto;
import com.ja.safari.dto.HelpImgDto;
import com.ja.safari.dto.PickCommentDto;
import com.ja.safari.dto.PickDto;
import com.ja.safari.dto.PickLikeDto;
import com.ja.safari.dto.RecruitDto;
import com.ja.safari.dto.RecruitImgLinkDto;
import com.ja.safari.dto.RecruitLikeDto;

public interface RecruitSqlMapper {
	

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
	
	//구인구직 이미지 리스트 조회
	public List<RecruitImgLinkDto> selectAllRecruitImg(int id);
	
	//구인구직 이미지 수 보드에 출력(이미지 유무)
	public int selectAllRecruitImgByBoardId(int recruit_id);
	
	//구인구직 게시물 개수 count
	public int getRecruitBoardCount();
	
	//구인구직 게시물 삭제
	public void deleteRecruitBoard(int id);

	//구인구직 게시물 수정하기
	public void updateRecruitBoard(RecruitDto recruitDto);
	
	//구인구직 게시물 전체조회
	//public List<RecruitDto> selectAllRecruitBoards();
	public List<RecruitDto> selectAllRecruitBoards(@Param("recruitPage") int recruitPage, @Param("recruit_searchType") String recruit_searchType, @Param("recruit_searchWord") String recruit_searchWord);
	
	//구인구직 게시물 아이디로 선택
	public RecruitDto getRecruitBoardById(int id);
	
	//구인구직 게시물 조회수 증가
	public void increaseViewsRecruitBoard(int id);
	
	//구인구직 좋아요 insert : like
	public void insertRecruitLike(RecruitLikeDto recruitLikeDto); 
	
	//구인구직 유저ID로 좋아요 여부 체크
	public int checkRecruitLike(RecruitLikeDto recruitLikeDto);
	
	//구인구직 좋아요 delete
	public void deleteRecruitLike(RecruitLikeDto recruitLikeDto);
	
	//구인구직 좋아요 개수 count
	public int countLikeByRecruitBoardId(int recruit_id);

	//구인구직 게시물 최신순
	public List<RecruitDto> newPostByRecruit();
	
}
