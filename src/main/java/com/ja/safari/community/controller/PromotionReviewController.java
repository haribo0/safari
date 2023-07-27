package com.ja.safari.community.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ja.safari.community.service.PromotionReviewCommentServiceImpl;
import com.ja.safari.community.service.PromotionReviewServiceImpl;
import com.ja.safari.dto.PromotionReviewCommentDto;
import com.ja.safari.dto.PromotionReviewDto;
import com.ja.safari.dto.PromotionReviewImgDto;
import com.ja.safari.dto.UserCoinDto;
import com.ja.safari.dto.UserDto;
import com.ja.safari.rental.service.RentalBusinessServiceImpl;

@Controller
@RequestMapping("/community/*")
public class PromotionReviewController {

	@Autowired
	private PromotionReviewServiceImpl promotionReviewService;
	@Autowired
	private PromotionReviewCommentServiceImpl promotionReviewCommentService;
	@Autowired
	private RentalBusinessServiceImpl rentalBusinessService;
	////////////
	// 써봤어요 //
	///////////




	// 커뮤니티 프로모션 메인 페이지
	@RequestMapping("promotion/promotionReviewMainPage")
	public String promotionReviewMainPage(Model model, @RequestParam(value = "page", defaultValue = "1") int page,
			String promoReview_searchType,
			String promoReview_searchWord,
			PromotionReviewCommentDto promotionReviewCommentDto,
			HttpSession session,
			Integer subCategoryId
			) {

		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");

		int sessionId = 0;

		if(sessionUser != null) {
			sessionId = sessionUser.getId();
		}
		
		List<Map<String, Object>> promoReviewList = promotionReviewService.getPromotionReviewList(page, promoReview_searchType, promoReview_searchWord, promotionReviewCommentDto, sessionId, subCategoryId);		
	
		List<Map<String, Object>> orderByLikePromoReviewList = promotionReviewService.orderByPromotionReviewLikes(sessionId); 
		
		List<Map<String, Object>> bestPromotionReviewPostList = promotionReviewService.bestPromoReviewPost(sessionId);
		
		model.addAttribute("promoReviewList", promoReviewList);
		model.addAttribute("orderByLikePromoReviewList", orderByLikePromoReviewList);
		model.addAttribute("bestPromotionReviewPostList", bestPromotionReviewPostList);

		return "/community/promotion/promotionReviewMainPage";
	}

	// 커뮤니티 프로모션 게시글 작성페이지
	@RequestMapping("promotion/writePromotionReviewPage")
	public String writePromotionReviewPage(HttpSession session, Model model) {

		UserDto userDto = (UserDto) session.getAttribute("sessionUser");
		if(userDto == null) return "redirect:/user/loginPage";

		model.addAttribute("mainCategoryList", rentalBusinessService.getRentalMainCategoryList());
		// model.addAttribute("rentalItemList", promotionReviewService.getRentalItems());


		return "/community/promotion/writePromotionReviewPage";
	}

	// 커뮤니티 게시글 작성해서 버튼 process
	@RequestMapping("promotion/writePromotionReviewProcess")
	public String writePromotionReviewProcess(HttpSession session, PromotionReviewDto params, MultipartFile [] promoFiles) {


		List<PromotionReviewImgDto> promotionReviewImgDtoList = new ArrayList<>();

		// 파일 저장 로직
		if(promoFiles != null) {

			for(MultipartFile multipartFile : promoFiles) {

				if(multipartFile.isEmpty()) {
					continue;
				}

				String rootFolder = "C:/uploadPromoFiles/";

				// 날짜별 폴더 생성 로직
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
				String today = sdf.format(new Date());

				File targetFolder = new File(rootFolder + today); // C:/uploadFolder/2023/05/23

				if(!targetFolder.exists()) {
					targetFolder.mkdirs();
				}

				// 저장 파일명 만들기
				String fileName = UUID.randomUUID().toString();
				fileName += "_" + System.currentTimeMillis();

				// 확장자 추출
				String originalFileName = multipartFile.getOriginalFilename();

				String ext = originalFileName.substring(originalFileName.lastIndexOf("."));

				String saveFileName = today + "/" + fileName + ext;

				try {
					multipartFile.transferTo(new File(rootFolder + saveFileName));
				}catch(Exception e) {
					e.printStackTrace();
				}

				PromotionReviewImgDto promotionReviewImgDto = new PromotionReviewImgDto();
				promotionReviewImgDto.setRental_review_img(saveFileName);

				promotionReviewImgDtoList.add(promotionReviewImgDto);
			}
		}

		// 데이터 저장 로직

		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");

		int userId = sessionUser.getId();
		params.setUser_id(userId);

		promotionReviewService.writePromotionReview(params, promotionReviewImgDtoList);


		return "redirect:/community/promotion/contentPromotionReviewPage?id="+params.getId();
	}

	// 커뮤니티 프로모션 게시글 세부 페이지
	@RequestMapping("promotion/contentPromotionReviewPage")
	public String contentPromotionReviewPage(Model model, Integer id) {

		promotionReviewService.increaseViewCount(id);

		Map<String, Object> map = promotionReviewService.getPromotionReview(id);
		List<Map<String, Object>> promoCommentDtoList = promotionReviewCommentService.getpromotionReviewCommentDtoList(id);

		List<Map<String, Object>> bestPromotionReviewPostList = promotionReviewService.bestPromoReviewPost(id);
		
		// html escape(enter키)
		PromotionReviewDto promotionReviewDto = (PromotionReviewDto)map.get("promotionReviewDto");
		String promotionReviewContent = promotionReviewDto.getPromotion_review_content();

		promotionReviewContent = StringEscapeUtils.escapeHtml4(promotionReviewContent);
		promotionReviewContent = promotionReviewContent.replaceAll("\n", "<br>");
		promotionReviewDto.setPromotion_review_content(promotionReviewContent);


		model.addAttribute("data", map);
		model.addAttribute("promoCommentDtoList", promoCommentDtoList);
		model.addAttribute("bestPromotionReviewPostList", bestPromotionReviewPostList);

		return "/community/promotion/contentPromotionReviewPage";
	}

	// 프로모션 게시글 수정 페이지
	@RequestMapping("promotion/updatePromotionReviewPage")
	public String updatePromotionReviewPage(HttpSession session, Model model, int id) {

		UserDto userDto = (UserDto) session.getAttribute("sessionUser");
		if(userDto == null) return "redirect:/user/loginPage";

		Map<String, Object> map = promotionReviewService.getPromotionReview(id);

		model.addAttribute("data", map);
		model.addAttribute("mainCategoryList", rentalBusinessService.getRentalMainCategoryList());


		return "/community/promotion/updatePromotionReviewPage";
	}

	// 프로모션 게시글 수정 프로세스
	@RequestMapping("promotion/updatePromotionReviewProcess")
	public String updatePromotionReviewProcess(HttpSession session, PromotionReviewDto params,
											   MultipartFile [] promoFiles) {


		// 이미지 삭제
		    promotionReviewService.deletePromotionReviewImg(params.getId());


		// 파일
		List<PromotionReviewImgDto> promotionReviewImgDtoList = new ArrayList<>();

		// 파일 저장 로직
		if(promoFiles != null) {

			for(MultipartFile multipartFile : promoFiles) {

				if(multipartFile.isEmpty()) {
					continue;
				}

				String rootFolder = "C:/uploadPromoFiles/";

				// 날짜별 폴더 생성 로직
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
				String today = sdf.format(new Date());

				File targetFolder = new File(rootFolder + today);

				if(!targetFolder.exists()) {
					targetFolder.mkdirs();
				}

				// 저장 파일명 만들기
				String fileName = UUID.randomUUID().toString();
				fileName += "_" + System.currentTimeMillis();

				// 확장자 추출
				String originalFileName = multipartFile.getOriginalFilename();

				String ext = originalFileName.substring(originalFileName.lastIndexOf("."));

				String saveFileName = today + "/" + fileName + ext;

				try {
					multipartFile.transferTo(new File(rootFolder + saveFileName));
				}catch(Exception e) {
					e.printStackTrace();
				}

				PromotionReviewImgDto promotionReviewImgDto = new PromotionReviewImgDto();
				promotionReviewImgDto.setRental_review_img(saveFileName);

				promotionReviewImgDtoList.add(promotionReviewImgDto);
			}
		}

		// 데이터 저장 로직

		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");

		int userId = sessionUser.getId();
		params.setUser_id(userId);

		promotionReviewService.updatePromotionReview(params, promotionReviewImgDtoList);




		return "redirect:/community/promotion/contentPromotionReviewPage?id="+params.getId();
	}

	// 프로모션 게시글 삭제
	@RequestMapping("promotion/deletePromotionReviewProcess")
	public String deletePromotionReviewProcess(int id) {

		promotionReviewService.deletePromotionReview(id);

		return "redirect:/community/promotion/promotionReviewMainPage";
	}





	// 프로모션 리뷰 전체(모든) 페이지
	@RequestMapping("promotion/allPromotionReviewPage")
	public String allPromotionReviewPage(Model model,
				@RequestParam(value = "page", defaultValue = "1") int page,
				String promoReview_searchType,
				String promoReview_searchWord,
				PromotionReviewCommentDto promotionReviewCommentDto,
				HttpSession session,
				Integer subCategoryId
				) {


		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");

		int sessionId = 0;

		if(sessionUser != null) {
			sessionId = sessionUser.getId();
		}

		List<Map<String, Object>> topViewCount = promotionReviewService.topViewCount(sessionId);

		List<Map<String, Object>> promoReviewList = promotionReviewService.getPromotionReviewList(page, promoReview_searchType, promoReview_searchWord, promotionReviewCommentDto, sessionId, subCategoryId);
		
		System.out.println("promoReviewList 컨트롤러 : " + promoReviewList);
		
		List<Map<String, Object>> promoReviewCategory = promotionReviewService.getPromotionCategoryList();
		
		
		int promotionReviewCount = promotionReviewService.getPromotionReviewCount(promoReview_searchType, promoReview_searchWord);

		int totalPage = (int)Math.ceil(promotionReviewCount/10.0);

		int startPage = ((page-1)/5)*5 + 1;
		int endPage = ((page-1)/5+1)*5;

		if(endPage > totalPage) {
			endPage = totalPage;
		}
		
		
		model.addAttribute("promoReviewList", promoReviewList);
		model.addAttribute("topViewCount", topViewCount);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("currentPageNum", page);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);

		String promoReview_searchQueryString = "";
		if(promoReview_searchType != null && promoReview_searchWord != null) {
			promoReview_searchQueryString += "&promoReview_searchType=" + promoReview_searchType;
			promoReview_searchQueryString += "&promoReview_searchWord=" + promoReview_searchWord;
		}

		model.addAttribute("promoReview_searchQueryString", promoReview_searchQueryString);
		
		model.addAttribute("promoReviewCategory", promoReviewCategory);

		return "/community/promotion/allPromotionReviewPage";
	}


	// 댓글 작성 process
	@RequestMapping("promotion/writePromotionReivewCommentProcess")
	public String writePromotionReivewCommentProcess(HttpSession session, PromotionReviewCommentDto params) {

		UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");

		int userId = sessionUser.getId();
		params.setUser_id(userId);

		promotionReviewCommentService.writePromotionReivewComment(params);

		return "redirect:/community/promotion/contentPromotionReviewPage?id=" + params.getPromotion_review_id();
	}

	// 댓글 수정
	@RequestMapping("promotion/updatePromoCommentProcess")
	public String updatePromoComment(@RequestParam("commentId") int commentId, @RequestParam("newComment") String newComment) {

		PromotionReviewCommentDto promotionReviewCommentDto = promotionReviewCommentService.selectPromoCommentById(commentId);
		int boardId = promotionReviewCommentDto.getPromotion_review_id();

		promotionReviewCommentDto.setPromotion_review_comment(newComment);
	    promotionReviewCommentService.updatePromoComment(promotionReviewCommentDto);

	    return "redirect:/community/promotion/contentPromotionReviewPage?id=" + boardId;
	}

	// 댓글 삭제 process
	@RequestMapping("promotion/deletePromotionReivewCommentProcess")
	public String deletePromotionReivewCommentProcess(int id) {

		PromotionReviewCommentDto promotionReviewCommentDto = promotionReviewCommentService.selectPromoCommentById(id);
		int boardId = promotionReviewCommentDto.getPromotion_review_id();

		promotionReviewCommentService.deletePromotionReviewComment(id);

		return "redirect:/community/promotion/contentPromotionReviewPage?id=" + boardId;
	}


	// 리워드 적립 페이지(거쳐가는 페이지=> 여기서 포인트 적립이 되야 함.)
	@RequestMapping("promotion/rewardPromotionReviewPage")
	public String rewardPromotionReviewPage(int itemId, int userId, int writerId, HttpSession session) {
		
		UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");
		int sessionId = 0;

		if(sessionUser != null) {
			sessionId = sessionUser.getId();
			if( sessionId == writerId ) {
				System.out.println("sessionId"+sessionId);

				return "redirect:/rental/productDescPage?id="+itemId;
			}
		}
		
		
		// 게시물 작성자 코인
		System.out.println("rental_item_id"+itemId);
		System.out.println("userId"+userId);
		System.out.println("writerId"+writerId);
		
		UserCoinDto userCoinDto = new UserCoinDto();
		userCoinDto.setUser_id(userId);
		userCoinDto.setCoin_transaction(1);
		userCoinDto.setTransaction_detail("리워드게시판 코인 적립");
		
		
		
		promotionReviewService.increaseUserCoinByPromoReviewReward(userCoinDto);

		return "redirect:/rental/productDescPage?id="+itemId;
	}
}
