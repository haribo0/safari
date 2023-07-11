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
import com.ja.safari.dto.PickLikeDto;
import com.ja.safari.dto.PickOptionDto;
import com.ja.safari.dto.ProductDto;
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
	public List<Map<String, Object>> showProductByproductIdList() {

		//골라줘요 옵션
		int product_id = usedSqlMapper.createProductPk();
		List<Map<String, Object>> productBoardList = new ArrayList<>();
		List<ProductDto> productDtoList = usedSqlMapper.selectProduct();
		
		System.out.printf("1 서비스 product_id: ", product_id);//확인용
		System.out.printf("2 서비스 productDtoList: ", productDtoList);//확인용
		
		for(ProductDto productDto : productDtoList ) {
			
			Map<String, Object> map = new HashMap<>();
			
			productDto.setId(product_id); //productId
			pickSqlMapper.showProductByproductId(productDto);
			
			map.put("productDto", productDto);
			
			System.out.printf("3 서비스 productDto: ", productDto);//확인용
			
			productBoardList.add(map);
		}
		
		return productBoardList;
	}
	
	
	
	//골라줘요 게시판 전체 조회 //좋아요 count 추가 //댓글 count 추가
	public List<Map<String, Object>> selectAllPickBoards() {
		
		List<Map<String, Object>> pickBoardList = new ArrayList<>();
		
		List<PickDto> pickDtoList = pickSqlMapper.selectAllPickBoards();
		
		for(PickDto pickDto : pickDtoList) {
			
			Map<String, Object> map = new HashMap<>();
			
			UserDto userDto = userSqlMapper.selectUserDtoById(pickDto.getUser_id());
			
			int pickLikeCount = pickSqlMapper.countPickCommentByBoardId(pickDto.getId());
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
	
	
	
	//골라줘요 게시물 ID로 조회하기 //매개변수의 id는 게시물 아이디 //댓글 추가. 
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
		
		int HelpBoardLikeCount = pickSqlMapper.countLikeByPickBoardId(pick_id);
		
		return HelpBoardLikeCount;
	}
	
	//골라줘요 게시물 옵션 insert
	public void registerPickOption(PickOptionDto pickOptionDto) {
		
		pickSqlMapper.registerPickOption(pickOptionDto);
	}
}

