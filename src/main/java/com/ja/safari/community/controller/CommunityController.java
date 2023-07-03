package com.ja.safari.community.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ja.safari.community.service.CommunityServiceImpl;
import com.ja.safari.community.service.PromotionReviewServiceImpl;
import com.ja.safari.dto.HelpCommentCompleteDto;
import com.ja.safari.dto.HelpCommentDto;
import com.ja.safari.dto.HelpDto;
import com.ja.safari.dto.HelpImgDto;
import com.ja.safari.dto.HelpLikeDto;
import com.ja.safari.dto.PromotionReviewDto;
import com.ja.safari.dto.PromotionReviewImgDto;
import com.ja.safari.dto.QuestionDto;
import com.ja.safari.dto.QuestionLikeDto;
import com.ja.safari.dto.QuestionReplyDto;
import com.ja.safari.dto.RecruitDto;
import com.ja.safari.dto.RecruitImgLinkDto;
import com.ja.safari.dto.RecruitLikeDto;
import com.ja.safari.dto.UserDto;

@Controller
@RequestMapping("/community/*")
public class CommunityController {

	@Autowired
	private CommunityServiceImpl communityService;

	@Autowired
	private PromotionReviewServiceImpl promotionReviewService;

	// 커뮤니티 메인 페이지
	@RequestMapping("mainPage")
	public String main() {

		return "community/mainPage";
	}

	// 해주세요 메인 페이지
	@RequestMapping("help/mainPage")
	public String mainPage(Model model, @RequestParam(value = "helpPage", defaultValue = "1") int helpPage) {

		List<Map<String, Object>> helpBoardList = communityService.selectAllHelpBoards(helpPage);
		int helpBoardCount = communityService.getHelpBoardCount();
		int totalHelpPage = (int) Math.ceil(helpBoardCount / 10.0);

		model.addAttribute("helpBoardList", helpBoardList);
		model.addAttribute("totalHelpPage", totalHelpPage);
		model.addAttribute("currentHelpPage", helpPage);

		List<Map<String, Object>> helpBestBoardList = communityService.selectBestHelpBoards();
		model.addAttribute("helpBestBoardList", helpBestBoardList);

		// int helpCommentCount = communityService.selectAllHelpBoards();
		// model.addAttribute("helpCommentCount", helpCommentCount);

		return "/community/help/mainPage";
	}

	//해주세요 글쓰기 페이지
	@RequestMapping("help/writeContentPage")
	public String writeContentPage() {
		return "/community/help/writeContentPage";
	}

	//해주세요 글쓰기 프로세스
	@RequestMapping("help/writeContentProcess")
	public String writeContentProcess(HttpSession session, HelpDto helpDto, MultipartFile[] helpBoardFiles) {
		// 세션이 null일 때 로그인 페이지로 리다이렉트시키기

		List<HelpImgDto> helpImgDtoList = new ArrayList<>();

		// 파일 저장 로직
		if (helpBoardFiles != null) {

			for (MultipartFile multipartFile : helpBoardFiles) {

				if (multipartFile.isEmpty()) {
					continue;
				}

				System.out.println("파일명: " + multipartFile.getOriginalFilename());

				String rootFolder = "C:/uploadFiles/";

				// 날짜별 폴더 생성 로직
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
				String today = sdf.format(new Date());

				File targetFolder = new File(rootFolder + today);

				if (!targetFolder.exists()) {
					targetFolder.mkdirs();
				}

				// 저장 파일명 만들기(파일명 충돌 방지 = 랜덤값 + 시간)
				String fileName = UUID.randomUUID().toString();
				fileName += "_" + System.currentTimeMillis();

				// 확장자 추출
				String originalFileName = multipartFile.getOriginalFilename();

				String ext = originalFileName.substring(originalFileName.lastIndexOf("."));

				String saveFileName = today + "/" + fileName + ext;

				// 문법 오류 피하기 위해 try-catch
				try {
					multipartFile.transferTo(new File(rootFolder + saveFileName));
				} catch (Exception e) {
					e.printStackTrace();
				}

				HelpImgDto helpImgDto = new HelpImgDto();
				helpImgDto.setHelp_original_filename(originalFileName);
				helpImgDto.setHelp_img_link(saveFileName);

				helpImgDtoList.add(helpImgDto);
			}
			// 데이터 저장 로직

			communityService.registerHelpBoard(helpDto, helpImgDtoList);
		}
		return "redirect:./mainPage";

	}

	//해주세요 게시물 페이지
	@RequestMapping("help/readContentPage/{id}")
	public String readContentPage(@PathVariable int id, Model model) {

		communityService.increaseHelpReadCount(id);

		Map<String, Object> map = communityService.getHelpBoard(id);

		model.addAttribute("map", map);

		List<Map<String, Object>> helpCommentsList = communityService.getHelpCommentList(id);

		model.addAttribute("helpCommentsList", helpCommentsList);

		int HelpBoardLikeCount = communityService.getHelpLikeCountByBoardId(id);

		model.addAttribute("HelpBoardLikeCount", HelpBoardLikeCount);

		return "/community/help/readContentPage";

	}

	//해주세요 수정 페이지
	@RequestMapping("help/updateContentPage/{id}")
	public String updateContentPage(@PathVariable int id, Model model) {

		Map<String, Object> map = communityService.getHelpBoard(id);
		model.addAttribute("map", map);

		return "/community/help/updateContentPage";
	}

	// 해주세요 수정
	@RequestMapping("help/updateContentProcess")
	public String updateContentProcess(HelpDto helpDto) {
		communityService.updateHelpBoard(helpDto);

		return "redirect:/community/help/mainPage";
	}

	// 해주세요 삭제
	@RequestMapping("help/deleteContentProcess/{id}")
	public String deleteContentProcess(@PathVariable int id) {

		communityService.deleteHelpBoard(id);

		return "redirect:/community/help/mainPage";
	}

	// 해주세요 댓글 등록
	@RequestMapping("help/writeCommentProcess/{id}")
	public String writeCommentProcess(HttpSession session, HelpCommentDto helpCommentDto, @PathVariable int id) {

		UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");

		if (sessionUser == null) {

			return "redirect:/user/loginPage";

		} else {

			communityService.registerHelpComment(helpCommentDto);
		}

		return "redirect:/community/help/readContentPage/" + id;
	}

	// 해주세요 댓글 삭제
	@RequestMapping("help/deleteCommentProcess/{id}")
	public String deleteCommentProcess(@PathVariable int id, int boardId) {

		communityService.deleteHelpComment(id);

		return "redirect:/community/help/readContentPage/" + boardId;
	}

	// 해주세요 게시물 좋아요 insert
	@RequestMapping("help/insertHelpLikeProcess/{id}") // helpDto에 데이터를 컨트롤러에서 직접 넣기 위해 매개변수로 지정
	// jsp에서 좋아요를 클릭하면 게시글 id만 받아오는데 현재 세션 유저의 id를 dto에 담기 위해 매개변수에 dto 선언해준것
	// helplikedto에 게시글 id랑 유저 id를 담아주기 위해 선언한 것
	// 데이터를 dto에 담기 위해 설계
	public String insertHelpLikeProcess(HttpSession session, HelpLikeDto helpLikeDto, @PathVariable int id) {

		// System.out.println("id = " + id);
		UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");

		if (sessionUser == null) {

			return "redirect:/user/loginPage";// 고치기

		} else {
			helpLikeDto.setUser_id(sessionUser.getId());
			helpLikeDto.setHelp_id(id);

			// 유저의 게시글 좋아요 여부 확인
			int helplikeCount = communityService.checkHelpLike(helpLikeDto);

			if (helplikeCount > 0) {
				// System.out.println("삭제가 되나요?");
				communityService.removeHelpLike(helpLikeDto);

			} else {
				communityService.insertHelpLike(helpLikeDto);
			}

			return "redirect:/community/help/readContentPage/" + id;
		}

	}

	// 해주세요 미션완료 insert
	@RequestMapping("help/acceptHelpCommentProcess") // id : helpCommentDto.id
	public String acceptHelpCommentProcess(int help_comment_id, HelpCommentCompleteDto helpCommentCompleteDto) {

		helpCommentCompleteDto.setHelp_comment_id(help_comment_id);

		// 매개변수에서 받아온 댓글 pk로 게시물 댓글 테이블에 있는 게시물 pk를 조회하기 위해서 사용
		HelpCommentDto helpCommentDto = communityService.getHelpCommentById(help_comment_id);

		communityService.acceptHelpComment(helpCommentCompleteDto);

		return "redirect:/community/help/readContentPage/" + helpCommentDto.getHelp_id();
	}

	// 해주세요 미션완료 update //잘 모르겠음
	@RequestMapping("help/completeHelpCommentProcess")
	public String completeHelpCommentProcess(int id, int help_comment_id, HelpCommentDto helpCommentDto,
			HelpCommentCompleteDto helpCommentCompleteDto) {

		communityService.completeHelpComment(helpCommentDto);

		return "redirect:/community/help/readContentPage/" + id;
	}

	// 궁금해요 메인 페이지
	@RequestMapping("question/mainPage")
	public String question(Model model) {

		List<Map<String, Object>> questionBoardList = communityService.getQuestionBoardList();

		model.addAttribute("questionBoardList", questionBoardList);

		return "/community/question/mainPage";
	}

	//궁금해요 게시물 작성 페이지
	@RequestMapping("question/questionWriteContentPage")
	public String questionWriteContentPage() {
		return "/community/question/questionWriteContentPage";
	}

	//궁금해요 게시물 작성 프로세스 
	@RequestMapping("question/questionWriteContentProcess")
	public String questionWriteContentProcess(QuestionDto questionDto) {

		communityService.registerQuestionBoard(questionDto);

		return "redirect:./mainPage";
	}

	//궁금해요 게시물 페이지
	@RequestMapping("question/questionReadContentPage/{id}")
	public String questionReadContentPage(@PathVariable int id, Model model) {

		communityService.increaseQuestionReadCount(id);

		Map<String, Object> map = communityService.getQuestionBoardByBoardId(id);

		model.addAttribute("map", map);

		int QuestionBoardLikeCount = communityService.getQuestionLikeCountByBoardId(id);

		model.addAttribute("QuestionBoardLikeCount", QuestionBoardLikeCount);

		return "/community/question/questionReadContentPage";
	}

	// 궁금해요 게시물 수정 페이지
	@RequestMapping("question/updateQuestionContentPage/{id}")
	public String updateQuestionContentPage(@PathVariable int id, Model model) {

		Map<String, Object> map = communityService.getQuestionBoardByBoardId(id);
		model.addAttribute("map", map);

		return "/community/question/updateQuestionContentPage";
	}

	//궁금해요 게시물 수정 프로세스 
	@RequestMapping("question/updateQuestionContentProcess")
	public String updateQuestionContentProcess(QuestionDto questionDto) {
		communityService.updateQuestionBoard(questionDto);
		System.out.println(questionDto.getId());

		return "redirect:/community/question/questionReadContentPage/"+ questionDto.getId();
	}

	// 궁금해요 게시물 삭제
	@RequestMapping("question/deleteQuestionContentProcess/{id}")
	public String deleteQuestionContentProcess(@PathVariable int id) {

		communityService.deleteQuestionBoardByBoardId(id);

		return "redirect:/community/question/mainPage";
	}

	//답변 등록 프로세스 
	@RequestMapping("question/writeQuestionReplyProcess")
	public String writeQuestionReplyProcess(QuestionReplyDto questionReplyDto) {

		communityService.registerQuestionReply(questionReplyDto);
		
		return "redirect:/community/question/questionReadContentPage/" + questionReplyDto.getQuestion_id();

	}
	
	//답변 작성 페이지
		 @RequestMapping("question/replyQuestionContentPage/{id}") 
		 public String replyQuestionContentPage(@PathVariable int id, Model model) { 
			 
	     model.addAttribute("board", communityService.getQuestionBoardByBoardId(id));
		 
		
//		 List<Map<String,Object>> questionReplyBoardList = communityService.getQuestionReplyBoardList(id);
//		 
//		 model.addAttribute("questionReplyBoardList", questionReplyBoardList); 
		 
		 return "/community/question/replyQuestionContentPage";
		 }


	//궁금해요 좋아요 insert
	@RequestMapping("question/insertQuestionLikeProcess/{id}")
	public String insertQuestionLikeProcess(HttpSession session, QuestionLikeDto questionLikeDto,
			@PathVariable int id) {

		UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");

		if (sessionUser == null) {

			return "redirect:/user/loginPage";

		} else {
			questionLikeDto.setUser_id(sessionUser.getId());
			questionLikeDto.setQuestion_id(id);

			int questionlikeCount = communityService.checkQuestionLike(questionLikeDto);

			if (questionlikeCount > 0) {
				communityService.removeQuestionLike(questionLikeDto);

			} else {
				communityService.insertQuestionLike(questionLikeDto);
			}

			return "redirect:/community/question/questionReadContentPage/" + id;
		}
	}
	////////////
	// 구인구직 //
	///////////

	// 구인구직 메인 페이지
	@RequestMapping("recruit/mainPage")
	public String recruitMainPage(Model model) {

		List<Map<String, Object>> recruitBoardList = communityService.selectAllRecruitBoards();

		model.addAttribute("recruitBoardList", recruitBoardList);

		return "/community/recruit/mainPage";
	}

	// 구인구직 글쓰기 페이지
	@RequestMapping("recruit/writeContentPage")
	public String recruitWriteContentPage() {

		return "/community/recruit/writeContentPage";
	}

	// 구인구직 글쓰기 프로세스 //구인구직 이미지 파일 첨부 추가.
	@RequestMapping("recruit/recruitWriteContentProcess")
	public String writeContentProcess(HttpSession session, RecruitDto recruitDto, MultipartFile[] recruitFiles) {
		// 세션이 null일 때 로그인 페이지로 리다이렉트시키기

		List<RecruitImgLinkDto> recruitImgLinkDtoList = new ArrayList<>();

		// 파일 저장 로직
		if (recruitFiles != null) {

			for (MultipartFile multipartFile : recruitFiles) {

				if (multipartFile.isEmpty()) {
					continue;
				}

				System.out.println("파일이름: " + multipartFile.getOriginalFilename());

				String rootFolder = "C:/uploadFiles/";

				// 날짜별 폴더 생성 로직.
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
				String today = sdf.format(new Date());

				File targetFolder = new File(rootFolder + today); // C:/uploadFolder/2023/05/23

				if (!targetFolder.exists()) {
					targetFolder.mkdirs();
				}

				// 저장 파일명 만들기. 핵심은 파일명 충돌 방지 = 랜덤 + 시간.
				String fileName = UUID.randomUUID().toString();
				fileName += "_" + System.currentTimeMillis();

				// 확장자 추출
				String originalFileName = multipartFile.getOriginalFilename();

				String ext = originalFileName.substring(originalFileName.lastIndexOf("."));

				String saveFileName = today + "/" + fileName + ext;

				try {
					multipartFile.transferTo(new File(rootFolder + saveFileName));
				} catch (Exception e) {
					e.printStackTrace();
				}

				RecruitImgLinkDto recruitImgLinkDto = new RecruitImgLinkDto();
				recruitImgLinkDto.setImg_name(originalFileName);
				recruitImgLinkDto.setImg_link(saveFileName);

				recruitImgLinkDtoList.add(recruitImgLinkDto);
			}
		}

		// 데이터 저장 로직

		UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");

		int user_id = sessionUser.getId();
		recruitDto.setUser_id(user_id);

		communityService.registerRecruitBoard(recruitDto, recruitImgLinkDtoList);

		return "redirect:./mainPage";
	}

	// 구인구직 게시판 상세보기 //이미지 추가 //좋아요 추가.
	@RequestMapping("recruit/readContentPage/{id}")
	public String recruitReadContentPage(@PathVariable int id, Model model) {

		Map<String, Object> map = communityService.getRecruitBoard(id);

		System.out.println(map);
		System.out.println(map.get("recruitImgLinkDtoList").toString());

		model.addAttribute("map", map);

		// 게시물 좋아요 count
		int RecruitBoardLikeCount = communityService.countLikeByRecruitBoardId(id);
		model.addAttribute("RecruitBoardLikeCount", RecruitBoardLikeCount);

		return "/community/recruit/readContentPage";
	}

	// 구인구직 좋아요 insert
	@RequestMapping("recruit/insertRecruitLikeProcess/{id}")
	public String insertRecruitLikeProcess(HttpSession session, RecruitLikeDto recruitLikeDto, @PathVariable int id) {

		UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");

		recruitLikeDto.setUser_id(sessionUser.getId());
		recruitLikeDto.setRecruit_id(id);

		communityService.insertRecruitLike(recruitLikeDto);

		return "redirect:/community/recruit/readContentPage/" + id;
	}

	////////////
	// 써봤어요 //
	///////////

	// 커뮤니티 프로모션 메인 페이지
	@RequestMapping("promotion/promotionReviewMainPage")
	public String promotionReviewMainPage(Model model, @RequestParam(value = "page", defaultValue = "1") int page,
			String promoReview_searchType, String promoReview_searchWord) {

		List<Map<String, Object>> promoReviewList = promotionReviewService.getPromotionReviewList(page,
				promoReview_searchType, promoReview_searchWord);

		model.addAttribute("promoReviewList", promoReviewList);

		return "/community/promotion/promotionReviewMainPage";
	}

	// 커뮤니티 프로모션 게시글 작성페이지
	@RequestMapping("promotion/writePromotionReviewPage")
	public String writePromotionReviewPage() {

		return "/community/promotion/writePromotionReviewPage";
	}

	// 커뮤니티 게시글 작성해서 버튼 process
	@RequestMapping("promotion/writePromotionReviewProcess")
	public String writePromotionReviewProcess(HttpSession session, PromotionReviewDto params,
			MultipartFile[] promoFiles) {

		List<PromotionReviewImgDto> promotionReviewImgDtoList = new ArrayList<>();

		// 파일 저장 로직
		if (promoFiles != null) {

			for (MultipartFile multipartFile : promoFiles) {

				if (multipartFile.isEmpty()) {
					continue;
				}

				System.out.println("파일명 : " + multipartFile.getOriginalFilename());

				String rootFolder = "C:/uploadPromoFiles/";

				// 날짜별 폴더 생성 로직
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
				String today = sdf.format(new Date());

				File targetFolder = new File(rootFolder + today); // C:/uploadFolder/2023/05/23

				if (!targetFolder.exists()) {
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
				} catch (Exception e) {
					e.printStackTrace();
				}

				PromotionReviewImgDto promotionReviewImgDto = new PromotionReviewImgDto();
				promotionReviewImgDto.setRental_review_img(saveFileName);

				promotionReviewImgDtoList.add(promotionReviewImgDto);
			}
		}

		// 데이터 저장 로직

		UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");

		int userId = sessionUser.getId();
		params.setUser_id(userId);

		promotionReviewService.writePromotionReview(params, promotionReviewImgDtoList);

		return "redirect:/community/promotion/contentPromotionReviewPage?id=" + params.getId();
	}

	// 커뮤니티 프로모션 게시글 세부 페이지
	@RequestMapping("promotion/contentPromotionReviewPage")
	public String contentPromotionReviewPage(Model model, int id) {

		promotionReviewService.increaseViewCount(id);

		Map<String, Object> map = promotionReviewService.getPromotionReview(id);

		// html escape(enter키)
		PromotionReviewDto promotionReviewDto = (PromotionReviewDto) map.get("promotionReviewDto");
		String promotionReviewContent = promotionReviewDto.getPromotion_review_content();

		promotionReviewContent = StringEscapeUtils.escapeHtml4(promotionReviewContent);
		promotionReviewContent = promotionReviewContent.replaceAll("\n", "<br>");
		promotionReviewDto.setPromotion_review_content(promotionReviewContent);

		model.addAttribute("data", map);

		return "/community/promotion/contentPromotionReviewPage";
	}

	// 프로모션 게시글 수정 페이지
	@RequestMapping("promotion/updatePromotionReviewPage")
	public String updatePromotionReviewPage(Model model, int id) {

		Map<String, Object> map = promotionReviewService.getPromotionReview(id);

		model.addAttribute("data", map);

		return "/community/promotion/updatePromotionReviewPage";
	}

	// 프로모션 게시글 수정 프로세스
	@RequestMapping("promotion/updatePromotionReviewProcess")
	public String updatePromotionReviewProcess(HttpSession session, PromotionReviewDto params,
			MultipartFile[] promoFiles) {

		System.out.println("controller : " + params.getId());

		// 이미지 삭제
		promotionReviewService.deletePromotionReviewImg(params.getId());

		// 파일
		List<PromotionReviewImgDto> promotionReviewImgDtoList = new ArrayList<>();

		// 파일 저장 로직
		if (promoFiles != null) {

			for (MultipartFile multipartFile : promoFiles) {

				if (multipartFile.isEmpty()) {
					continue;
				}

				System.out.println("파일명 : " + multipartFile.getOriginalFilename());

				String rootFolder = "C:/uploadPromoFiles/";

				// 날짜별 폴더 생성 로직
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
				String today = sdf.format(new Date());

				File targetFolder = new File(rootFolder + today);

				if (!targetFolder.exists()) {
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
				} catch (Exception e) {
					e.printStackTrace();
				}

				System.out.println("controller 수정 : 3");

				PromotionReviewImgDto promotionReviewImgDto = new PromotionReviewImgDto();
				promotionReviewImgDto.setRental_review_img(saveFileName);

				System.out.println("controller 수정 : 4");

				promotionReviewImgDtoList.add(promotionReviewImgDto);
			}
		}

		// 데이터 저장 로직

		UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");

		int userId = sessionUser.getId();
		params.setUser_id(userId);

		promotionReviewService.updatePromotionReview(params, promotionReviewImgDtoList);

		return "redirect:/community/promotion/contentPromotionReviewPage?id=" + params.getId();
	}

	// 프로모션 게시글 삭제
	@RequestMapping("promotion/deletePromotionReviewProcess")
	public String deletePromotionReviewProcess(int id) {

		promotionReviewService.deletePromotionReview(id);

		return "redirect:/community/promotion/promotionReviewMainPage";
	}

	// 프로모션 리뷰 전체(모든) 페이지
	@RequestMapping("promotion/allPromotionReviewPage")
	public String allPromotionReviewPage(Model model, @RequestParam(value = "page", defaultValue = "1") int page,
			String promoReview_searchType, String promoReview_searchWord) {

		List<Map<String, Object>> promoReviewList = promotionReviewService.getPromotionReviewList(page,
				promoReview_searchType, promoReview_searchWord);
		int promotionReviewCount = promotionReviewService.getPromotionReviewCount(promoReview_searchType,
				promoReview_searchWord);
		int totalPage = (int) Math.ceil(promotionReviewCount / 10.0);

		int startPage = ((page - 1) / 5) * 5 + 1;
		int endPage = ((page - 1) / 5 + 1) * 5;

		if (endPage > totalPage) {
			endPage = totalPage;
		}

		model.addAttribute("promoReviewList", promoReviewList);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("currentPageNum", page);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);

		String promoReview_searchQueryString = "";
		if (promoReview_searchType != null && promoReview_searchWord != null) {
			promoReview_searchQueryString += "&promoReview_searchType=" + promoReview_searchType;
			promoReview_searchQueryString += "&promoReview_searchWord=" + promoReview_searchWord;
		}

		model.addAttribute("promoReview_searchQueryString", promoReview_searchQueryString);

		return "/community/promotion/allPromotionReviewPage";
	}

	// 리워드 적립 페이지(거쳐가는 페이지)(이거 머리 안돌아가서 이상할걸 다시 수정하길)
	@RequestMapping("promotion/rewardPromotionReviewPage")
	public String rewardPromotionReviewPage() {

		return "redirect:/community/promotion/contentPromotionReviewPage";
	}

}

//	// 궁금해요 메인 페이지
//	@RequestMapping("question/mainPage")
//	public String question() {
//		return "/community/question/mainPage";
//	}
//	
//	@RequestMapping("question/qwriteContentPage")
//	public String qwriteContentPage() {
//		return "/community/question/qwriteContentPage";
//	}
//	
//	@RequestMapping("question/qwriteContentProcess")
//	public String qwriteContentProcess(HttpSession session, CommunityDto communityDto, CommunityQuestionDto communityQuestionDto, CommunityQuestionCategoryDto communityQuestionCategoryDto) {
//		communityService.registerQuestionBoard(communityDto, communityQuestionDto, communityQuestionCategoryDto);
//	
//	
//		return "/community/question/mainPage";
//	
//}
