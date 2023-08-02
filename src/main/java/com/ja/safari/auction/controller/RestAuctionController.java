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
import com.ja.safari.dto.AuctionDeliveryTrackingDto;
import com.ja.safari.dto.AuctionItemChatroomDto;
import com.ja.safari.dto.AuctionItemDto;
import com.ja.safari.dto.AuctionItemImgDto;
import com.ja.safari.dto.AuctionItemInquiryDto;
import com.ja.safari.dto.AuctionItemLikeDto;
import com.ja.safari.dto.AuctionItemOrderAddressDto;
import com.ja.safari.dto.AuctionItemReplyDto;
import com.ja.safari.dto.AuctionKakaoPayApproveDto;
import com.ja.safari.dto.AuctionPurchaseConfirmedDto;
import com.ja.safari.dto.UserAddressDto;
import com.ja.safari.dto.UserCoinDto;
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
	
	// 경매 메인페이지에서 상태에 따른 경매 조회 
	@RequestMapping("getAuctionListByStatus")
	public Map<String, Object> getAuctionListByStatus(String status) {
		
		Map<String, Object> map  =  new HashMap<>();
		
		map.put("getAuctionList", auctionService.getAuctionListByStatus(status));
	
		return map;
	}
	
	// 검색
	@RequestMapping("searchAuction")
	public Map<String, Object> searchAuction(String searchWord) {
		
		Map<String, Object> map  =  new HashMap<>();
		
		map.put("getAuctionList", auctionService.searchAuction(searchWord));
		
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
	
	// 경매 상품 문의 등록 
	@RequestMapping("registerAuctionInquiry")
	public Map<String, Object> registerAuctionInquiry(HttpSession session, AuctionItemInquiryDto auctionItemInquiryDto) {
		
		Map<String, Object> map  =  new HashMap<>();

		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");

		auctionItemInquiryDto.setUser_buyer_id(sessionUser.getId());
		auctionService.registerAuctionInquiry(auctionItemInquiryDto); 
		map.put("result", "success");
		
		return map;
	}
	
	// 경매 상품 문의 답변 삭제
	@RequestMapping("removeAuctionInquiry")
	public Map<String, Object> removeAuctionInquiry(int id) {
		
		Map<String, Object> map  =  new HashMap<>();
		
		auctionService.removeAuctionInquiry(id);
		
		return map;
		
	}
		

	
	// 경매 상품 문의 답변
	@RequestMapping("registerAuctionReply")
	public Map<String, Object> registerAuctionReply(HttpSession session, AuctionItemReplyDto auctionItemReplyDto) {
		
		Map<String, Object> map  =  new HashMap<>();

		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");

		auctionItemReplyDto.setUser_seller_id(sessionUser.getId());
		auctionService.registerAuctionReply(auctionItemReplyDto);
		map.put("result", "success");
		
		return map;
	}
		
	// 경매 상품 문의 답변 삭제
	@RequestMapping("removeAuctionReply")
	public Map<String, Object> removeAuctionReply(int id) {
		
		Map<String, Object> map  =  new HashMap<>();
		
		auctionService.removeAuctionReply(id);
		
		return map;
		
	}
	
	
	
	// 경매 문의 리스트 조회
	@RequestMapping("getAuctionQnAList")
	public Map<String, Object> getAuctionQnAList(int auctionItemId) {
	
		Map<String, Object> map  =  new HashMap<>();
		
		map.put("qnaList", auctionService.getAuctionQnAList(auctionItemId));
		
		return map;
	}
	
	
	
	// 경매 종료 시간 실시간으로 받아오기
	@RequestMapping("getAuctionEndTimeInRealTime/{auctionItemId}")
	public Map<String, Object> getAuctionEndTimeInRealTime(@PathVariable int auctionItemId) {

		Map<String, Object> map  =  new HashMap<>();

		map.put("auctionEndTime", auctionService.getAuctionEndTimeInRealTime(auctionItemId));
		
		return map;
	}
	
	// 미이페이지 - 입찰 목록에서 상태에 따른 경매 조회 
	/*
	 * @RequestMapping("getMyBidListIng") public Map<String, Object>
	 * getBidListByStatus(HttpSession session) {
	 * 
	 * Map<String, Object> map = new HashMap<>();
	 * 
	 * UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");
	 * 
	 * map.put("getAuctionList",
	 * auctionService.getMyBidListIng(sessionUser.getId()));
	 * 
	 * return map; }
	 */
	


	
	//입찰요청
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
		
		boolean bidSuccess = auctionService.submitBidRequest(auctionBidDto);
		
		// 입찰 성공할 경우
		  if (bidSuccess) {
			    map.put("result", "success");
			    
			 } else {
			    map.put("result", "failure");
			  }

		return map;
		
	} 
	
	// 경매 상세페이지에서 내 입찰목록 모달 조회
	@RequestMapping("getMyBidListIng") 
	public Map<String, Object> getMyBidListIng(HttpSession session) {
		
		Map<String, Object> map = new HashMap<>();
		
		UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");
		
		map.put("myBidList", auctionService.getMyBidListIng(sessionUser.getId()));
		map.put("myBidCount", auctionService.getUserBidCount(sessionUser.getId()));
		
		return map;
		
	}
	
	// 경매 상세페이지에서 입찰 리스트 중 입찰가만 계속 조회
	@RequestMapping("getMyBidPrice")
	public Map<String, Object> getMyBidPrice(HttpSession session) {
		
		Map<String, Object> map = new HashMap<>();
		
		UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");
		
		map.put("myBidPrice", auctionService.getMyBidPrice(sessionUser.getId()));
	
		return map;
	}
	
	
	
	//  한 경매의 입찰 순위 3위까지 출력
	@RequestMapping("getTop3BidList") 
	public Map<String, Object> getTop3BidList(int auctionItemId) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("top3BidList", auctionService.getAuctionTop3BidPrice(auctionItemId));
		
		return map;
	}
	
	
	
	// 입찰 기록 리스트 출력
	@RequestMapping("getBidList")
	public Map<String, Object> getBidList(int auctionItemId) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("bidList", auctionService.getBidList(auctionItemId));
		
		map.put("bidCount", auctionService.getBidCount(auctionItemId));
		
		return map;
		
	}
	
	// 마이페이지 - 내가 입찰한 기록 조회
	@RequestMapping("getMyBidList") 
	public Map<String, Object> getMyBidList(HttpSession session)  {
		
		Map<String, Object> map = new HashMap<>();
		
		UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");
		
		map.put("myBidList", auctionService.getMyBidList(sessionUser.getId()));
		
		return map;
	}
	
	
	// 마이페이지 - 내가 입찰한 기록 조회 (시간 업데이트 용도, id값만 필요함)
	/*
	 * @RequestMapping("getMyBidListForRealTime") public Map<String, Object>
	 * getMyBidListForRealTime(HttpSession session) {
	 * 
	 * Map<String, Object> map = new HashMap<>();
	 * 
	 * UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");
	 * 
	 * map.put("getBidList",
	 * auctionService.getMyBidListForRealTime(sessionUser.getId()));
	 * 
	 * return map;
	 * 
	 * }
	 */
	
	// 입찰 버튼 갱신
	@RequestMapping("getStatusForRenewInputBidBox/{auctionItemId}")
	public Map<String, Object> updateInputBidBox(@PathVariable int auctionItemId) {
	
		Map<String, Object> map = new HashMap<>();
		
		map.put("getAuctionItemStatus", auctionService.getStatusForRenewInputBidBox(auctionItemId));
		
		return map;
		
	}
	
	// 경매 당 입찰 수 실시간으로 출력
	@RequestMapping("getBidCount")
	public Map<String, Object> getBidCountByAuction(int auctionItemId) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("bidCount", auctionService.getBidCount(auctionItemId));
		
		return map;
		
	}
	
	
	// 현 시간 각 경매의 최고 입찰자가 누구인지 회원pk로 출력하기
	@RequestMapping("checkNowMaxBiderByAuctionItemId/{auctionItemId}") 
	public Map<String, Object> checkNowMaxBiderByAuctionItemId(@PathVariable int auctionItemId)  {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("nowMaxBider", auctionService.checkNowMaxBiderByAuctionItemId(auctionItemId));
		
		if (userService.selectUserDtoById(auctionService.checkNowMaxBiderByAuctionItemId(auctionItemId)) == null) {
				map.put("result", "fail");
			
		} else {
				map.put("nowMaxBiderDto", 
				userService.selectUserDtoById(auctionService.checkNowMaxBiderByAuctionItemId(auctionItemId))); 
		}
	
		return map;
	}
	
	// 종료 시간이 1분 미만일 때 입찰하였을 경우, 경매 종료 시간 1분 늘리기
	@RequestMapping("renewEndTimeAuctionItem/{auctionItemId}") 
	public Map<String, Object> renewEndTimeAuctionItem(@PathVariable int auctionItemId) {
		
		Map<String, Object> map = new HashMap<>();
	
		auctionService.renewEndTimeAuctionItem(auctionItemId);
		
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
		
		//System.out.println(auctionItemId + "번 제품의 경매가 종료됩니다");
		
		return map;
		
	}
	
	// 경매 시작 날짜 지나면 진행중 처리
	@RequestMapping("renewAuctionItemStatusIng/{auctionItemId}")
	public  Map<String, Object> renewAuctionItemStatusIng(@PathVariable int auctionItemId) {
		
		Map<String, Object> map = new HashMap<>();
		
		auctionService.renewAuctionItemStatusIng(auctionItemId);
		
		return map;
		
	}
	
	// 경매 즉시 낙찰 후 경매 종료 처리
	@RequestMapping("renewImmediateSuccessfulBid")
	public Map<String, Object> renewSuccessfulBidOrEnd(int auctionItemId) {
		
		Map<String, Object> map = new HashMap<>();
		
		//auctionService.renewImmediateSuccessfulBid(auctionItemId);
		
		auctionService.renewImmediateSuccessfulBidEndDate(auctionItemId);
		
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
	
	// 마이페이지 - 찜 목록 (시간 업데이트용)
	@RequestMapping("getMyWishListForRealTime")
	public Map<String, Object> getMyWishListForRealTime(HttpSession session) {
		
		Map<String, Object> map = new HashMap<>();

		UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");
		
		map.put("getWishList", auctionService.getMyWishListForRealTime(sessionUser.getId()));
		
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
	
	// 주문화면에서 배송지 변경 버튼 클릭 후 설정된 조회 
	@RequestMapping("getMyAddressListInOrderPage")
	public Map<String, Object> getMyAddressListInOrderPage(int userId) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("addressList", auctionService.getMyAddressListInOrderPage(userId));
		
		return map;
	}
	
	// 주문화면에서 배송지 변경 모달에서 주소 선택
	@RequestMapping("changeAddressInOrderPage") 
	public Map<String, Object> changeAddressInOrderPage(HttpSession session, UserAddressDto userAddressDto) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");
		
		userAddressDto.setUser_id(sessionUser.getId());
		
		map.put("selectedAddress", auctionService.changeAddressInOrderPage(userAddressDto));
		
		return map;
		
	}
	
	
	
	// 카카오페이 결제 준비 정보를 세션에 저장하기 (o)
	@RequestMapping("saveAuctionTidToSession")
	public Map<String, Object> saveAuctionTidToSession(HttpSession session, AuctionKakaoPayApproveDto auctionKakaoPayApproveDto) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");
		if(sessionUser == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}
		
		//System.out.println("restcontroller 결제 준비 정보 세션에 저장하는 dto : " + auctionKakaoPayApproveDto);
		session.setAttribute("auctionkakaoPay", auctionKakaoPayApproveDto);
		
		map.put("result", "success");

		return map;		
		
	}
	
	// 카카오페이 결제 ready 정보 보내주기 
	@RequestMapping("getAuctionKakaoPayReadyInfo")
	public  Map<String, Object> getAuctionKakaoPayReadyInfo(HttpSession session) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");
		if(sessionUser == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}
		
		AuctionKakaoPayApproveDto  auctionkakaoPayApproveDto = 
						(AuctionKakaoPayApproveDto) session.getAttribute("auctionkakaoPay");

		map.put("result", "success");
		map.put("auctionReadyInfo", auctionkakaoPayApproveDto);	
		
		return map;
	}

	// 카카오페이 결제 후 정보 저장
	@RequestMapping("saveAuctionPaymentInfo")
	public  Map<String, Object> saveAuctionPaymentInfo(HttpSession session, AuctionKakaoPayApproveDto auctionKakaoPayApproveDto,
																								UserCoinDto buyerCoinDto, UserCoinDto sellerCoinDto) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		UserDto userDto = (UserDto) session.getAttribute("sessionUser");
		if(userDto == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}
		
		auctionService.saveAuctionKakaoPayInfo(auctionKakaoPayApproveDto);
		
		buyerCoinDto.setUser_id(auctionKakaoPayApproveDto.getPartner_user_id());
		buyerCoinDto.setCoin_transaction(auctionKakaoPayApproveDto.getAmount());
		
		// 구매자 코인 차감
		auctionService.reduceUserCoinByAuction(buyerCoinDto);
		
		// 판매자 코인 획득
		UserDto sellerDto = auctionService.getUserSellerInfoByAuctionPay(auctionKakaoPayApproveDto.getPartner_order_id());
		
		sellerCoinDto.setUser_id(sellerDto.getId());
		sellerCoinDto.setCoin_transaction(auctionKakaoPayApproveDto.getAmount());
		
		auctionService.increaseUserCoinByAuction(sellerCoinDto);
		
		
		map.put("result", "success");
		
		return map;
	}
	
	// 결제 시 배송정보 저장
	@RequestMapping("registerAddressInfoInPayment")
	public  Map<String, Object> registerAddressInfoInPayment(AuctionItemOrderAddressDto auctionItemOrderAddressDto) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		auctionService.registerAddressInfoInPayment(auctionItemOrderAddressDto);
		
		return map;
	}
	
	
	
   // 마이페이지 - 낙찰된 건 (배송 조회)
	@RequestMapping("getMySuccessfulBidPayAndDeliveryStatusList")
	public Map<String, Object> getMySuccessfulBidAndDeliveryStatusList(HttpSession session) {
		
		UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("myStatusList", auctionService.getMySuccessfulBidPayAndDeliveryStatusList(sessionUser.getId()));
		
		return map;
	}
	
	
	// 경매 업로더 입장에서 종료된 경매 - 낙찰자 정보 조회
	@RequestMapping("getEndedAuctionMaxBiderByUploader")
	public Map<String, Object> getEndedAuctionMaxBiderByUploader(HttpSession session) {
		
		UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("maxBiderInfo", auctionService.getAuctionAndBidInfoByUploader(sessionUser.getId()));
		
		return map;
		
	}
	
	 // 경매 업로더 입장에서 결제 여부 조회
	@RequestMapping("getPayYnByUploader")
	public  Map<String, Object> getPayYnByUploader(HttpSession session) {
		
		UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("payYn", auctionService.getPayYnByUploader(sessionUser.getId()));
		
		return map;
	}
	
	// 경매 업로더 - 최고 입찰자, 낙찰자 조회
	@RequestMapping("getMaxBiderNickname")
	public Map<String, Object> getMaxBiderNickname(HttpSession session,  int auctionItemId) {
		
		UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("maxBiderNickname", auctionService.getMaxBiderNickname(sessionUser.getId(), auctionItemId));
		
		return map;
		
	}
	
	// 경매 업로더의 입장에서 종료된 경매 리스트 상태 조회
	@RequestMapping("selectEndedAuctionInfo")
	public Map<String, Object> selectEndedAuctionInfo(HttpSession session) {
		
		UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("endedAuctionList", auctionService.getEndedAuctionlist(sessionUser.getId()));
		
		return map;
	}
	
	// 경매 업로더 입장에서 물품 당 주문 내역, 배송 조회 모달 확인
	@RequestMapping("getEndedAuctionOrderAndDeliveryInfo")
	public Map<String, Object> getEndedAuctionOrderAndDeliveryInfo(HttpSession session, AuctionBidDto auctionBidDto) {
		
		UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		auctionBidDto.setUser_seller_id(sessionUser.getId());
		
		map.put("orderDeliveryInfo",auctionService.getEndedAuctionOrderAndDeliveryInfo(auctionBidDto));
		
		return map;
	}
	
	
	// 배송 시작
	@RequestMapping("startAuctionDelivery")
	public  Map<String, Object> startAuctionDelivery(int partnerOrderId) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		auctionService.startAuctionDelivery(partnerOrderId);
		
		map.put("result", "success");
		
		return map;
		
	}
	
	
	// 배송 조회
	@RequestMapping("checkAutionDeliveryStatus")
	public Map<String, Object>  checkAutionDeliveryStatus(int partnerOrderId) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("deliveryStatus", auctionService.checkAutionDeliveryStatus(partnerOrderId));
		
		return map;
	}
	
	// 배송 조회 (모달)
	@RequestMapping("getDeliveryStatusInSuccessfulBid")
	public Map<String, Object>  getDeliveryStatusInSuccessfulBid(HttpSession session, int id, AuctionDeliveryTrackingDto auctionDeliveryTrackingDto) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");
		
		auctionDeliveryTrackingDto.setUser_buyer_id(sessionUser.getId());
		auctionDeliveryTrackingDto.setId(id);
		
		map.put("deliveryStatusDto", auctionService.getDeliveryStatusInSuccessfulBid(auctionDeliveryTrackingDto));
		
		return map;
	}
	
	// 배송 상세정보 조회
	@RequestMapping("getAddressInfoInPaymentAndDelivery")
	public Map<String, Object> getAddressInfoInPaymentAndDelivery(int id) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("addressDetail", auctionService.getAddressInfoInPaymentAndDelivery(id));
		
		return map;
		
	}
	 
	// 배송 완료 (쿼리 수정해야함)
	@RequestMapping("completeAuctionDelivery")
	public Map<String, Object> completeAuctionDelivery(int partnerOrderId) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		auctionService.completeAuctionDelivery(partnerOrderId);
		
		map.put("result", "success");
		
		return map;
		
	}
	
	// 구매 확정
	@RequestMapping("registerPurchaseConfirmed")
	public Map<String, Object> registerPurchaseConfirmed(AuctionPurchaseConfirmedDto auctionPurchaseConfirmedDto, 
			int auctionDeliveryAfterPaymentId, int id) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		auctionPurchaseConfirmedDto.setDelivery_payment_id(auctionDeliveryAfterPaymentId);
		auctionPurchaseConfirmedDto.setPartner_order_id(id);
		auctionService.registerPurchaseConfirmed(auctionPurchaseConfirmedDto);
		
	    map.put("result", "success");
		
		return map;
		
	}
	
	// 구매 확정 여부 조회
	@RequestMapping("checkPurchaseConfirmed")
	public Map<String, Object> checkPurchaseConfirmed(int partnerOrderId) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("checkYn", auctionService.checkPurchaseConfirmedYn(partnerOrderId));
		
		return map;
	}

	// 메인 페이지
	
	
	// 곧 마감 되는 경매 내림차순 정렬 6개
	@RequestMapping("getdeadlineApproachingAuctonList")
	public Map<String, Object> deadlineApproachingAuctonList()  {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("deadlineList", auctionService.deadlineApproachingAuctonList());
		
		return map;

	}
	
	// 입찰 수 많은 경매 정렬 5개
	@RequestMapping("getAuctionOrderByBidCount")
	public Map<String, Object> getAuctionOrderByBidCount() {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("maxBidList", auctionService.getAuctionOrderByBidCount());
		
		return map;
	}
	
	// 랜덤 추출
	@RequestMapping("getAuctionListByRandom")
	public Map<String, Object> getAuctionListByRandom() {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("ranAuctionList", auctionService.getAuctionListByRandom());
		
		return map;
	}
	
}
