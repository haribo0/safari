package com.ja.safari.community.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//import com.ja.safari.community.mapper.CommunitySqlMapper;
import com.ja.safari.community.mapper.PickSqlMapper;
import com.ja.safari.dto.PickCommentDto;
import com.ja.safari.dto.PickDto;
import com.ja.safari.dto.PickHashtagDto;
import com.ja.safari.dto.PickLikeDto;
import com.ja.safari.dto.PickOptionDto;
import com.ja.safari.dto.PickOptionValuesForVoteDto;
import com.ja.safari.dto.PickOptionVoteDto;
import com.ja.safari.dto.PickShowCardDto;
import com.ja.safari.dto.ProductDto;
import com.ja.safari.dto.ProductImgDto;
import com.ja.safari.dto.RecruitDto;
import com.ja.safari.dto.RecruitImgLinkDto;
import com.ja.safari.dto.UserDto;
import com.ja.safari.used.mapper.UsedSqlMapper;
import com.ja.safari.user.mapper.UserSqlMapper;

@Service
public class PickServiceImpl {
	
	//@Autowired
	//private CommunitySqlMapper communitySqlMapper;
	@Autowired
	private UserSqlMapper userSqlMapper;
	@Autowired
	private PickSqlMapper pickSqlMapper;
	@Autowired
	private UsedSqlMapper usedSqlMapper;


	
	
	
	////////////
	// 골라줘요 //
	///////////

	//골라줘요 게시판 작성하기 
	public void registerPickBoard(PickDto pickDto) {
		
		int pick_id = pickSqlMapper.createPickPk();
		
		pickDto.setId(pick_id);
		pickSqlMapper.registerPickBoard(pickDto);
	}

	
	
	//골라줘요 옵션.
	public List<PickShowCardDto> showAllProduct() {

		return pickSqlMapper.showAllProduct();
	}
	
	
	
	//골라줘요 게시판 전체 조회 //좋아요 count 추가 //댓글 count 추가
		public List<Map<String, Object>> selectAllPickBoards() {
			
			List<Map<String, Object>> pickBoardList = new ArrayList<>();
			
			List<PickDto> pickDtoList = pickSqlMapper.selectAllPickBoards();
			
			
			
					//옵션DTO
					List<PickOptionDto> pickOptionList = pickSqlMapper.selectAllPickOptions();
					
					//중고DTO
					List<ProductDto> productDtoList = pickSqlMapper.selectAllProductBoards();
					
					//중고이미지DTO
					List<ProductImgDto> productImgDtoList = pickSqlMapper.selectAllProductImages();
			
			for(PickDto pickDto : pickDtoList) {
				
				Map<String, Object> map = new HashMap<>();
				
				List<PickOptionValuesForVoteDto> pickOptionValuesForVoteDtoList = pickSqlMapper.getPickOptionValues(pickDto.getId());//추가.
				
				map.put("pickOptionValuesForVoteDtoList", pickOptionValuesForVoteDtoList);//추가.
				
				
				UserDto userDto = userSqlMapper.selectUserDtoById(pickDto.getUser_id());
				
					//옵션DTO
					for(PickOptionDto pickOptionDto : pickOptionList) {
						int a = pickOptionDto.getPick_id();
						int b = pickDto.getId();
						
						if(a == b) {
							map.put("pickOptionDto", pickOptionDto);
							
							//중고DTO
							for(ProductDto productDto : productDtoList) {
								int c = productDto.getId();
								int d = pickOptionDto.getProduct_id();
								
								if(c == d) {
									map.put("productDto", productDto);
									
									//중고이미지DTO
									for(ProductImgDto productImgDto : productImgDtoList) {
										int e = productImgDto.getProduct_id();
										int f = productDto.getId();
										
										if(e == f) {
											map.put("productImgDto", productImgDto);
										}
									}
									//중고이미지DTO
									
								}
							}
							//중고DTO
						}
						
					}
					//옵션DTO
				
				int pickLikeCount = pickSqlMapper.countLikeByPickBoardId(pickDto.getId());
				int pickCommentCount = pickSqlMapper.countPickCommentByBoardId(pickDto.getId());
				
				map.put("pickDto", pickDto);
				map.put("userDto", userDto);
				map.put("pickLikeCount", pickLikeCount);
				map.put("pickCommentCount", pickCommentCount);
				
				
				pickBoardList.add(map);
			}  
			
			return pickBoardList;
		}
	
	
	//골라줘요 게시판 상세보기  (매개변수 id = 게시글 id)
	public Map<String, Object> getPickBoardByBoardId(int id) {
		
		Map<String, Object> map = new HashMap<>();
		
		PickDto pickDto = pickSqlMapper.getPickBoardByBoardId(id);
		UserDto userDto = userSqlMapper.selectUserDtoById(pickDto.getUser_id());
		
		map.put("userDto", userDto);
		map.put("pickDto", pickDto);
		
		
		List<PickOptionValuesForVoteDto> pickOptionValuesForVoteDtoList = pickSqlMapper.getPickOptionValues(id);
		
		//showCardDTo
		//List<PickShowCardDto> PickShowCardDtoList = pickSqlMapper.showAllProduct();
		
		
		//옵션DTO 
		//List<PickOptionDto> pickOptionDtoList = pickSqlMapper.getOptionByPickboardId(id);
		
		//중고게시물DTO 
		//PickOptionDto pickoptionDto = pickSqlMapper.getPickBoardByBoardId(id); //mapper
		//List<ProductDto> productDtoList = pickSqlMapper.getProductBoardByOptionId(id);
		
		//중고이미지DTO 
		//ProductDto productDto = pickSqlMapper.getPickBoardByBoardId(id); //mapper
		//List<ProductImgDto> productImgDtoList = pickSqlMapper.getProductImgByProductboardId(id);
		
		int sum = 0;
		for(PickOptionValuesForVoteDto x : pickOptionValuesForVoteDtoList) {
			sum += x.getVote_cnt();
		}
		
		//map.put("productImgDtoList", productImgDtoList); //중고이미지DTO 
		//map.put("productDtoList", productDtoList); //중고게시물DTO 
		//map.put("pickOptionDtoList", pickOptionDtoList); //옵션DTO 
		//map.put("PickShowCardDtoList", PickShowCardDtoList); //showCardDTo
		map.put("pickOptionValuesForVoteDtoList", pickOptionValuesForVoteDtoList);
		map.put("totalVoteCount", sum);
	
		
		return map;
	}

	
	
	
	//골라줘요 게시물 수정하기
	public void updatePickBoard(PickDto pickDto) {
		
		pickSqlMapper.updatePickBoard(pickDto);
	}
	

	//골라줘요 게시물 삭제하기
	public void deletePickBoard(int id) {
		
		pickSqlMapper.deletePickBoard(id);
	}
	
	//골라줘요 게시물 조회수 증가
	public void increaseViewsPickBoard(int id) {
		
		pickSqlMapper.increaseViewsPickBoard(id);
	}
	
	//골라줘요 댓글 작성하기
	public void registerPickComment(PickCommentDto pickCommentDto) {
		
		pickSqlMapper.registerPickComment(pickCommentDto);
	}
	
	
	
	//골라줘요 게시물 ID로 댓글 조회하기 //매개변수의 id는 게시물 아이디 //댓글 추가. 
	public List<Map<String, Object>> getPickcommentList(Integer pick_id) {

		List<Map<String, Object>> pickCommentsList = new ArrayList<>();
		
		List<PickCommentDto> pickCommentDtoList = pickSqlMapper.selectByPickcommentId(pick_id);
		
		for(PickCommentDto pickCommentDto : pickCommentDtoList) {

			Map<String, Object> map = new HashMap<>();

			int userId = pickCommentDto.getUser_id();
			UserDto userDto = userSqlMapper.selectUserDtoById(userId); 

			map.put("userDto", userDto);
			map.put("pickCommentDto", pickCommentDto);

			pickCommentsList.add(map);
		}
		
		return pickCommentsList;
	}
	
	
	
	//골라줘요 댓글 삭제하기
	public void deleteByPickcommentId(int id) {
		
		pickSqlMapper.deleteByPickcommentId(id);
	}
	
	//골라줘요 좋아요 insert
	public void insertPickLike(PickLikeDto pickLikeDto) {
		
		pickSqlMapper.insertPickLike(pickLikeDto);
		
	}

	//골라줘요 좋아요 눌렀는지 유저ID로 체크.
	public int checkPickLike(PickLikeDto pickLikeDto) {
		
		return pickSqlMapper.checkPickLike(pickLikeDto);
	}
	
	//골라줘요 좋아요 delete
	public void removeLikePickBoard(PickLikeDto pickLikeDto) {
		
		pickSqlMapper.removeLikePickBoard(pickLikeDto);
	}
	
	
	//골라줘요 좋아요 count
	public int countLikeByPickBoardId(int pick_id) {
		
		int PickBoardLikeCount = pickSqlMapper.countLikeByPickBoardId(pick_id);
		
		return PickBoardLikeCount;
	}
	
	//골라줘요 AJAX 좋아요
	public void toggleLike(PickLikeDto pickLikeDto) {
			
			if(pickSqlMapper.checkPickLike(pickLikeDto) > 0) {
				pickSqlMapper.removeLikePickBoard(pickLikeDto);
			}else {
				pickSqlMapper.insertPickLike(pickLikeDto);
			}
		}
	
	//골라줘요 좋아요 유무 체크
	public boolean isLiked(PickLikeDto pickLikeDto) {
		return pickSqlMapper.checkPickLike(pickLikeDto) > 0;
	}
	
	//골라줘요 게시물 좋아요 개수 count
	public int getTotalLike(int pick_id) {
		return pickSqlMapper.countLikeByPickBoardId(pick_id);
	}
	
	//골라줘요 AJAX 댓글
	public void registerComment(PickCommentDto pickCommentDto) {
		//pickSqlMapper.insertComment(pickCommentDto);
		pickSqlMapper.registerPickComment(pickCommentDto);
	}
	
	//골라줘요 댓글 삭제
	public void deleteComment(int id) {
		//pickSqlMapper.deleteComment(id);
		pickSqlMapper.deleteByPickcommentId(id);
	}
	
	//골라줘요 댓글 수정
	public void updateComment(PickCommentDto pickCommentDto) {
		//pickSqlMapper.updateComment(pickCommentDto);
		pickSqlMapper.updatePickcomment(pickCommentDto);
	}
	
	//골라줘요 게시물 ID로 댓글리스트 조회
	public List<Map<String, Object>> getCommentList(int pick_id){
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<PickCommentDto> commentList = pickSqlMapper.selectByPickcommentId(pick_id);
		
		for(PickCommentDto pickCommentDto : commentList) {
			
			UserDto userDto = userSqlMapper.selectUserDtoById(pickCommentDto.getUser_id());
			//PickDto pickDto = pickSqlMapper.getPickBoardByBoardId(id);
			//UserDto userDto = userSqlMapper.selectUserDtoById(pickDto.getUser_id());
			
			Map<String, Object> map = new HashMap<>();
			
			map.put("userDto", userDto);
			map.put("pickCommentDto", pickCommentDto);
			
			list.add(map);
		}
		
		return list;
	}
	
	// 골라줘요 최신글 정렬
	public List<Map<String, Object>> newPostByPick(int sessionId) {
		
		List<PickDto> newPostPickList = pickSqlMapper.newPostByPick();
		
		List<Map<String, Object>> newPostByPickList = new ArrayList<>();
		
		for(PickDto pickDto : newPostPickList) {
			Map<String, Object> map = new HashMap<>();
						
			UserDto userDto = userSqlMapper.selectUserDtoById(pickDto.getUser_id());        
			
			map.put("userDto", userDto);
			map.put("pickDto", pickDto);

			newPostByPickList.add(map);
		
		}		
		
		return newPostByPickList;
	}
	
	
	//////////////골라줘요 옵션//////////////////////
	//골라줘요 게시물 옵션 insert
	public void registerPickOption(PickOptionDto pickOptionDto) {
		
		pickSqlMapper.registerPickOption(pickOptionDto);
	}
	
	//골라줘요 글쓰기 페이지에서 옵션 후보 리스트 조회
	public List<ProductDto> getProductPickOptionList(){
		
		return pickSqlMapper.getProductPickOptionList();
		
	}
	
	//골라줘요 게시물 등록 
	public void registerPickBoard(PickDto pickDto, int [] category) {
		
		int pk = pickSqlMapper.createPickPk();
		pickDto.setId(pk);
		pickSqlMapper.registerPickBoard(pickDto);

		for(int x : category) {
			PickOptionDto pickOptionDto = new PickOptionDto();
			pickOptionDto.setPick_id(pk);
			pickOptionDto.setProduct_id(x);
			
			pickSqlMapper.registerPickOption(pickOptionDto);
		}
		
	}
	
	//골라줘요 투표
	public void vote(PickOptionVoteDto pickOptionVoteDto, int pick_id) {
		pickSqlMapper.resetVote(pickOptionVoteDto.getUser_id(), pick_id);
		pickSqlMapper.insertPickOptionVote(pickOptionVoteDto);
	}
	
	//////////////골라줘요 해시태그//////////////////////
	//골라줘요 게시물 해시태그 insert
	public void registerPickHashtag(PickHashtagDto pickHashtagDto) {
		
		pickSqlMapper.registerPickHashtag(pickHashtagDto);
	}
	
	//골라줘요 게시물 ID로 해시태그 조회 select
	public List<Map<String, Object>> getHashtagList(int pick_id){
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<PickHashtagDto> hashtagList = pickSqlMapper.selectByPickHashtagId(pick_id);
		
		for(PickHashtagDto pickHashtagDto : hashtagList) {
			
			UserDto userDto = userSqlMapper.selectUserDtoById(pickHashtagDto.getUser_id());
			//PickDto pickDto = pickSqlMapper.getPickBoardByBoardId(id);
			//UserDto userDto = userSqlMapper.selectUserDtoById(pickDto.getUser_id());
			
			Map<String, Object> map = new HashMap<>();
			
			map.put("userDto", userDto);
			map.put("pickHashtagDto", pickHashtagDto);
			
			list.add(map);
		}
		
		return list;
	}
	
	
	//골라줘요 해시태그 삭제
	public void deleteByPickHashtagId(int id) {
		
		pickSqlMapper.deleteByPickHashtagId(id);
	}
	
	//골라줘요 해시태그 수정
	public void updatePickHashtag(PickHashtagDto pickHashtagDto) {

		pickSqlMapper.updatePickHashtag(pickHashtagDto);
	}
	
	//골라줘요 게시물 해시태그 count //골라줘요 좋아요 count 참고했음.
	public int countPickHashtagByBoardId(int pick_id) {
		
		int PickBoardHashtagCount = pickSqlMapper.countPickHashtagByBoardId(pick_id);
		
		return PickBoardHashtagCount;
	}
	
}

