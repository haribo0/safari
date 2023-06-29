package com.ja.safari.auction.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ja.safari.auction.service.AuctionServiceImpl;
import com.ja.safari.dto.AuctionBidDto;
import com.ja.safari.dto.AuctionItemChatroomDto;
import com.ja.safari.dto.AuctionItemDto;
import com.ja.safari.dto.AuctionItemImgDto;
import com.ja.safari.dto.AuctionItemLikeDto;
import com.ja.safari.dto.UserDto;
import com.ja.safari.user.service.UserServiceImpl;

@RestController
@RequestMapping("/auction/*")
public class RestAuctionController {
	
	@Autowired
	private AuctionServiceImpl auctionService;
	@Autowired
	private UserServiceImpl userService;
	
	// 경매 메인 페이지에서 경매 리스트 실시간으로 출력 (추후 카테고리에 따라 쿼리 수정해야함)
	@RequestMapping("getAuctionList")
	public Map<String, Object> getAuctionList(HttpSession session) {
		
		Map<String, Object> map  =  new HashMap<>();

		map.put("getAuctionList", auctionService.getAuctionList());
		    

		return map;
	}
	
	
	// 경매 메인 페이지에서 대규모 카테고리 출력
	@RequestMapping("getProductMainCategoriesForMenu")
	public Map<String, Object> getProductMainCategoriesForMenu() {
		
		Map<String, Object> map  =  new HashMap<>();
		
		map.put("mainCategoryList", auctionService.getProductMainCategoriesForMenu());
		
		return map;
	}
	
	//경매 메인 페이지에서 대규모 카테고리에 따른 경매 리스트 출력 
	@RequestMapping("getAuctionListByMainCategory")
	public Map<String, Object> getAuctionListByMainCategory(int id) {
		
		Map<String, Object> map  =  new HashMap<>();

		map.put("getAuctionList", auctionService.getAuctionListByMainCategory(id));
		
		return map;		
		
	} 	
	
	
	//경매 메인 페이지에서 소규모 카테고리에 따른 경매 리스트 출력 
	@RequestMapping("getAuctionListBySubCategory")
	public Map<String, Object> getAuctionListBySubCategory(int id) {
		
		Map<String, Object> map  =  new HashMap<>();

		map.put("getAuctionList", auctionService.getAuctionListBySubCategory(id));
		
		return map;		
		
	} 

	
	// 경매 페이지 접속 시 회원 세션 확인
	@RequestMapping("getUserId")
	public Map<String, Object> getUserId(HttpSession session) {

		Map<String, Object> map  =  new HashMap<>();

		UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");
		
		if (sessionUser == null) {
			map.put("result", "fail");
		} else {
			map.put("result", "success");
			map.put("id", sessionUser.getId());
		}
		return map;
	}
	
	// 경매 페이지 접속 시 판매자 누구인지 확인
	@RequestMapping("getSellerId/{auctionItemId}")
	public Map<String, Object> getUserId(@PathVariable int auctionItemId) {

		Map<String, Object> map  =  new HashMap<>();

		UserDto userDto =  userService.selectUserDtoById(auctionService.getAuctionItem(auctionItemId).getUser_seller_id());
		map.put("id", userDto.getId());

		return map;
	}
	
	
	// 대규모 카테고리 선택하면 소규모 카테고리 리스트 출력
	@RequestMapping("getProductSubCategories/{productMainCategoryId}")
	public Map<String, Object> getProductSubCategories(@PathVariable int productMainCategoryId) {
		
		Map<String, Object> map  =  new HashMap<>();
		
		map.put("subCategories", auctionService.getProductSubCategoriesByMainCategoryId(productMainCategoryId));
		
		map.put("result", "success"); 
		
		return map;
	}
	
	// 경매 물품 등록
	@RequestMapping("registerProductProcess")
	public Map<String, Object> registerProductProcess(HttpSession session, AuctionItemDto auctionItemDto, 
																							MultipartFile[] auctionItemImgFiles) {
		Map<String, Object> map  =  new HashMap<>();
		
		// 상세 이미지 등록
		List<AuctionItemImgDto> auctionItemImgList = new ArrayList<>();
		// 파일 저장 로직
		if (auctionItemImgFiles != null) {

			for (MultipartFile auctionItemImgFile : auctionItemImgFiles) {

				// 이미지가 존재하지 않을 때
				if (auctionItemImgFile.isEmpty()) {
					continue;
				}

				String rootFolder = "C:/auctionFiles/";

				// 날짜별 폴더 생성 로직

				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd"); // 날짜를 문자로 바꿔주는 역할
				String today = sdf.format(new Date()); // new Date(): 오늘 날짜 출력

				File targetFolder = new File(rootFolder + today); 

				if (!targetFolder.exists()) {
					targetFolder.mkdirs(); // 폴더 생성

				}

				// 저장 파일명 만들기. 핵심은 파일명 충돌 방지 = 랜덤 + 시간
				String fileName = UUID.randomUUID().toString();
				fileName += "_" + System.currentTimeMillis();

				// 확장자 추출
				String originalFileName = auctionItemImgFile.getOriginalFilename(); // originalFileName : 사용자가 컴퓨터에 올리는 파일명
				String ext = originalFileName.substring(originalFileName.lastIndexOf(".")); // lastindexof: 뒤에서부터 .의 위치를
																							// 찾아서 숫자를 반환

				// 슬래시 주의할 것 기억하기
				String saveFileName = today + "/" + fileName + ext;

				try {
					// java.io.file 불러오기, 폴더를 포함한 파일명을 넣는다
					// 다른 이미지이지만 파일명이 같은 경우, 충돌을 피하려면
					auctionItemImgFile.transferTo(new File(rootFolder + saveFileName));
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				AuctionItemImgDto auctionItemImgDto = new AuctionItemImgDto();
				auctionItemImgDto.setAuction_item_img_link(saveFileName);

				auctionItemImgList.add(auctionItemImgDto);
			}
		}

		// 데이터 저장 로직
		UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");
		
		int user_seller_id = sessionUser.getId();
		auctionItemDto.setUser_seller_id(user_seller_id);
		
		
		
		auctionService.registerAuctionProduct(auctionItemDto, auctionItemImgList);				
		
		 map.put("result", "success");
		
		return map;
		
	}
	
	
	// 경매 수정
		@RequestMapping("modifyProductProcess")
		public Map<String, Object>  modifyAuctionProduct(HttpSession session, AuctionItemDto auctionItemDto, 
																		MultipartFile[] auctionItemImgFiles
																	) {
		
		Map<String, Object> map  =  new HashMap<>();
			
		// 상세 이미지 삭제
		auctionService.removeAuctionProductImage(auctionItemDto.getId());

		// 상세 이미지 등록
		List<AuctionItemImgDto> auctionItemImgList = new ArrayList<>();
		// 파일 저장 로직
		if (auctionItemImgFiles != null) {

			for (MultipartFile auctionItemImgFile : auctionItemImgFiles) {

				// 이미지가 존재하지 않을 때
				if (auctionItemImgFile.isEmpty()) {
					continue;
				}

				String rootFolder = "C:/auctionFiles/";

				// 날짜별 폴더 생성 로직

				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd"); // 날짜를 문자로 바꿔주는 역할
				String today = sdf.format(new Date()); // new Date(): 오늘 날짜 출력

				File targetFolder = new File(rootFolder + today); 

				if (!targetFolder.exists()) {
					targetFolder.mkdirs(); // 폴더 생성

				}

				// 저장 파일명 만들기. 핵심은 파일명 충돌 방지 = 랜덤 + 시간
				String fileName = UUID.randomUUID().toString();
				fileName += "_" + System.currentTimeMillis();

				// 확장자 추출
				String originalFileName = auctionItemImgFile.getOriginalFilename(); // originalFileName : 사용자가 컴퓨터에 올리는 파일명
				String ext = originalFileName.substring(originalFileName.lastIndexOf(".")); // lastindexof: 뒤에서부터 .의 위치를
																							// 찾아서 숫자를 반환

				// 슬래시 주의할 것 기억하기
				String saveFileName = today + "/" + fileName + ext;

				try {
					// java.io.file 불러오기, 폴더를 포함한 파일명을 넣는다
					// 다른 이미지이지만 파일명이 같은 경우, 충돌을 피하려면
					auctionItemImgFile.transferTo(new File(rootFolder + saveFileName));
				} catch (Exception e) {
					e.printStackTrace();
				}

				AuctionItemImgDto auctionItemImgDto = new AuctionItemImgDto();
				auctionItemImgDto.setAuction_item_img_link(saveFileName);

				auctionItemImgList.add(auctionItemImgDto);
	
			}
		}

		// 데이터 저장 로직

		auctionService.modifyAuctionProduct(auctionItemDto, auctionItemImgList);
		map.put("result", "success");	
		
		
		return map;
	}	
	
		
	// 경매 상세 페이지 조회
	@RequestMapping("getAuctionItemInfo/{id}")
	public Map<String, Object> getAuctionItemInfo(@PathVariable int id) {
		
		Map<String, Object> map  =  new HashMap<>();
		
		map.put("auctionItem", auctionService.getAuctionProductDetail(id));
			
		return map;
	}
	

	
	
	// 입찰요청
	@RequestMapping("bidRequest/{auctionItemId}")
	public Map<String, Object> bidRequest(HttpSession session, @PathVariable int auctionItemId,
																	AuctionBidDto auctionBidDto) {
		
		Map<String, Object> map  =  new HashMap<>();
		
		UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");
		
		auctionBidDto.setAuction_item_id(auctionItemId);
		auctionBidDto.setUser_buyer_id(sessionUser.getId());
		
		
		AuctionItemDto auctionItemDto = auctionService.getAuctionItem(auctionBidDto.getAuction_item_id());
		map.put("auctionItemDto", auctionItemDto);
		
		// 입찰한 유저의 정보
		UserDto userDto = userService.selectUserDtoById(sessionUser.getId());
		map.put("userDto", userDto);
		
		auctionService.submitBidRequest(auctionBidDto);
		
		//session.setAttribute("auctionBidInfo", auctionBidDto);
		
		map.put("result", "success");	

		
		return map;
		
	}
	
	
	// 입찰 기록 리스트 출력
	@RequestMapping("getBidList")
	public Map<String, Object> getBidList(int auctionItemId) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("bidList", auctionService.getBidList(auctionItemId));
		
		return map;
		
	}
	
	// 입찰 버튼 갱신
	@RequestMapping("getStatusForRenewInputBidBox/{auctionItemId}")
	public Map<String, Object> updateInputBidBox(@PathVariable int auctionItemId) {
	
		Map<String, Object> map = new HashMap<>();
		
		map.put("getAuctionItemStatus", auctionService.getStatusForRenewInputBidBox(auctionItemId));
		
		return map;
		
	}
	
	// 경매 물품 현재 상황 조회 
	@RequestMapping("getAuctionStatusByAuctionItemId/{auctionItemId}")
	public  Map<String, Object> getAuctionStatusByAuctionItemId(@PathVariable int auctionItemId) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("auctionItemStatus", auctionService.getAuctionStatusByAuctionItemId(auctionItemId));
		
		return map;
	}
	
	// 경매 종료일 도달 시 종료 처리
	@RequestMapping("renewAuctionItemStatusEnd/{auctionItemId}")
	public Map<String, Object> renewAuctionItemStatusEnd(@PathVariable int auctionItemId) {
		
		Map<String, Object> map = new HashMap<>();
		
		auctionService.renewAuctionItemStatusEnd(auctionItemId);
		
		return map;
		
	}
	
	// 경매 시작 날짜 지나면 진행중 처리
	@RequestMapping("renewAuctionItemStatusIng/{auctionItemId}")
	public  Map<String, Object> renewAuctionItemStatusIng(@PathVariable int auctionItemId) {
		
		Map<String, Object> map = new HashMap<>();
		
		auctionService.renewAuctionItemStatusIng(auctionItemId);
		
		return map;
		
	}
	
	// 경매 낙찰 후 경매 종료 처리
	@RequestMapping("renewImmediateSuccessfulBid")
	public Map<String, Object> renewSuccessfulBidOrEnd(int auctionItemId) {
		
		Map<String, Object> map = new HashMap<>();
		
		auctionService.renewImmediateSuccessfulBid(auctionItemId);
		
		map.put("result", "success");
		
		return map;
	}
	
	
	// 경매 현재가 계속 업데이트
	@RequestMapping("getCurrentPrice")
	public Map<String, Object> getCurrentPrice(int auctionItemId) {
		
		Map<String, Object> map = new HashMap<>();
		
		if (auctionService.getCurrentPriceByAuctionItem(auctionItemId) == null) {
			
			map.put("currentPrice", auctionService.getAuctionItem(auctionItemId).getStart_price());
		} else {
			map.put("currentPrice", auctionService.getCurrentPriceByAuctionItem(auctionItemId));
		}
		
		return map;
	}
	
	// 카운트다운
	@RequestMapping("getAuctionCountDown/{auctionItemId}") 
	public Map<String, Object> getAuctionCountDown(@PathVariable int auctionItemId) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("countDownInfo", auctionService.getAuctionStatusByAuctionItemId(auctionItemId));
	
		return map;
	}
	
	
	
	// 경매 찜하기 클릭했다 뗐다하는 기능
	@RequestMapping("toggleLikeAuctionProduct")
	public Map<String, Object> toggleLikeAuctionProduct(HttpSession session, AuctionItemLikeDto params) {
	
		Map<String, Object> map = new HashMap<>();
		
		UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");
	
		params.setUser_buyer_id(sessionUser.getId());
		
		
		auctionService.toggleLikeAuctionProduct(params);
		
		map.put("result", "success");
		
		return map;
		
	}
	
	 // 고객이 하나의 경매 상품에 대하여 찜하기를 하였는지 확인
	@RequestMapping("checklikeAuctionProductByUser")
	public Map<String, Object> checklikeAuctionProductByUser(HttpSession session, AuctionItemLikeDto params
																										) {
		
		Map<String, Object> map = new HashMap<>();
		
		UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");
		
		if (sessionUser == null) {
			map.put("result", "fail");
			return map;
		}
		
		params.setUser_buyer_id(sessionUser.getId());
		
		map.put("result", "success");
		map.put("checklikeAuctionProductByUser", auctionService.checklikeAuctionProductByUser(params));
		
		return map;

	}
	
	// 경매물품 당 좋아요 개수 
	@RequestMapping("countLikeAuctionProduct")
	public Map<String, Object> countLikeAuctionProduct(int auctionItemId) {
		
		Map<String, Object> map = new HashMap<>();

		map.put("result", "success");
		
		map.put("count", auctionService.countLikeAuctionProduct(auctionItemId));
		
		return map;
	}
	

	
	// 경매 채팅방에서 채팅 입력
	@RequestMapping("sendMessageInAuctionChatroom/{auctionItemId}")
	public Map<String, Object> sendMessageInAuctionChatroom(AuctionItemChatroomDto auctionItemChatroomDto,
																											@PathVariable int auctionItemId,
																											HttpSession session) {
		
		Map<String, Object> map = new HashMap<>();
		
		UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");
		
		auctionItemChatroomDto.setUser_id(sessionUser.getId());
		
		auctionItemChatroomDto.setAuction_item_id(auctionItemId);
		
		
		auctionService.sendMessageInAuctionChatroom(auctionItemChatroomDto);
		
		map.put("result", "success");
		
		return map;
	}
	
	
	// 경매 채팅방에서 채팅 기록 조회
	@RequestMapping("getChatHistoryInAuctionChatroom")
	public Map<String, Object> getChatHistoryInAuctionChatroom(int auctionItemId) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("chatList", auctionService.getChatHistoryInAuctionChatroom(auctionItemId));
		map.put("result", "success");
		
		return map;
	}
	
	// 경매 채팅방에서 내 채팅 삭제
	@RequestMapping("removeMessageInAuctionChatroom/{id}")
	public Map<String, Object> removeMessageInAuctionChatroom(@PathVariable int id) {
		
		Map<String, Object> map = new HashMap<>();
		
		auctionService.removeMessageInAuctionChatroom(id);
		
		map.put("result", "success");
		
		return map;
	}
}
