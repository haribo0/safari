package com.ja.safari.community.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

//import com.ja.safari.community.service.CommunityServiceImpl;
import com.ja.safari.community.service.PickServiceImpl;
import com.ja.safari.dto.PickCommentDto;
import com.ja.safari.dto.PickDto;
import com.ja.safari.dto.PickLikeDto;
import com.ja.safari.dto.PickOptionDto;
import com.ja.safari.dto.PickOptionVoteDto;
import com.ja.safari.dto.PickShowCardDto;
import com.ja.safari.dto.ProductDto;
import com.ja.safari.dto.UserDto;
import com.ja.safari.user.service.UserServiceImpl;


@Controller
@RequestMapping("/community/*")
public class PickController {
	
	//@Autowired
	//private CommunityServiceImpl communityService;
	
	@Autowired
	private PickServiceImpl pickService;
	
	@Autowired
	private UserServiceImpl userService;


	

		////////////
		// 골라줘요 //
		///////////
		
		
		//골라줘요 메인페이지 //게시물 옵션 이미지 추가. //페이징 추가.
		@RequestMapping("pick/mainPage")
		public String pickMainPage(Model model, @RequestParam(value = "pickPage", defaultValue = "1") int pickPage, String pick_searchType, String pick_searchWord) {
			
			//페이징
			List<Map<String, Object>> pickBoardList = pickService.selectAllPickBoards(pickPage, pick_searchType, pick_searchWord);
			int pickBoardCount = pickService.getPickBoardCount();
			int totalPickPage = (int) Math.ceil(pickBoardCount / 10.0);
			
			model.addAttribute("pickBoardList", pickBoardList);
			model.addAttribute("totalPickPage", totalPickPage);
			model.addAttribute("currentPickPage", pickPage);
			
			//게시물 옵션 이미지 추가.//리스트 //맵
			
			model.addAttribute("pickBoardList", pickBoardList);
			
			return "/community/pick/mainPage";
		}
/*		
		//골라줘요 글쓰기 페이지
		@RequestMapping("pick/writeContentPage")
		public String pickWriteContentPage() {
			
			return "/community/pick/writeContentPage";
		}

		//골라줘요 글쓰기 프로세스
		@RequestMapping("pick/writeContentProcess")
		public String pickWriteContentProcess(HttpSession session, PickDto pickDto, PickOptionDto pickOptionDto) {
			
			UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
			
			int user_id = sessionUser.getId();
			pickDto.setUser_id(user_id);
			
			pickService.registerPickBoard(pickDto);
			
			//중고거래 옵션 insert
			pickService.registerPickOption(pickOptionDto);
			
			
			return "redirect:/community/pick/mainPage";
		}
*/
		
		
		//골라줘요 글쓰기 페이지 //골라줘요 옵션 추가.
		@RequestMapping("pick/writeContentPage")
		public String pickWriteContentPage(Model model) {
			
			//골라줘요 옵션 추가. (여기부터)
			List<PickShowCardDto> showAllProductList = pickService.showAllProduct();
			model.addAttribute("showAllProductList", showAllProductList);
			
			
			model.addAttribute("productPickOptionList", pickService.getProductPickOptionList());
			
			//System.out.printf("*1 컨트롤러 showProductByproductIdList: ", showProductByproductIdList);//확인용
			
			return "/community/pick/writeContentPage";
		}
		
		//골라줘요 글쓰기 프로세스 
		@RequestMapping("pick/writeContentProcess")
		public String pickWriteContentProcess(HttpSession session, PickDto pickDto, int [] category) {
			
			
			UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
			
			int user_id = sessionUser.getId();
			pickDto.setUser_id(user_id);

			pickService.registerPickBoard(pickDto, category);
			
			
			return "redirect:/community/pick/mainPage";
		}
		
		
		//골라줘요 해시태그 작성 프로세스 
		@RequestMapping("pick/writeHashtagContentProcess")
		public String writeHashtagContentProcess(HttpSession session, PickDto pickDto, int [] category) {
			
			
			UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
			
			int user_id = sessionUser.getId();
			pickDto.setUser_id(user_id);

			pickService.registerPickBoard(pickDto, category);
			
			
			return "redirect:/community/pick/mainPage";
		}
		
		
		//골라줘요 게시판 상세보기 //좋아요 추가 //댓글 리스트로 조회
		@RequestMapping("pick/readContentPage/{id}")
		public String pickReadContentPage(@PathVariable int id, Model model) {
			
			pickService.increaseViewsPickBoard(id);//조회수 증가.
			
			Map<String, Object> map = pickService.getPickBoardByBoardId(id);
			
			model.addAttribute("map", map);
			
			//댓글 
			List<Map<String, Object>> pickCommentsList = pickService.getPickcommentList(id);
			model.addAttribute("pickCommentsList", pickCommentsList);

			// html escape
			PickDto pickDto = (PickDto)map.get("pickDto");
			String content = pickDto.getContent();
			content = StringEscapeUtils.escapeHtml4(content);
			content = content.replaceAll("\n", "<br>");
			pickDto.setContent(content);
			
			//게시물 좋아요 count
			int PickBoardLikeCount = pickService.countLikeByPickBoardId(id);
			model.addAttribute("PickBoardLikeCount", PickBoardLikeCount);
			
			return "/community/pick/readContentPage";
		}
		
		//골라줘요 게시판 수정하기 페이지
		@RequestMapping("pick/updateContentPage/{id}")
		public String pickUpdateContentPage(@PathVariable int id, Model model) {
			
			Map<String, Object> map = pickService.getPickBoardByBoardId(id);
			
			model.addAttribute("map", map);
			
			return "/community/pick/updateContentPage";
		}
		
		
		//골라줘요 게시판 수정하기 프로세스
		@RequestMapping("pick/updateContentProcess")
		public String pickUpdateContentProcess(PickDto pickDto) {
			
			pickService.updatePickBoard(pickDto);
			int id = pickDto.getId();
			
			System.out.println(id);
			//return "redirect:/community/pick/mainPage";
			return "redirect:/community/pick/readContentPage/" + id;
		}
		
		//골라줘요 게시물 삭제하기
		@RequestMapping("pick/deleteContentProcess/{id}")
		public String pickDeleteContentProcess(@PathVariable int id) {
			
			pickService.deletePickBoard(id);
			
			return "redirect:/community/pick/mainPage";
		}
		
		//골라줘요 댓글 등록하기
		@RequestMapping("pick/writeCommentProcess/{id}")
		public String pickWriteCommentProcess(HttpSession session, @PathVariable int id, PickCommentDto pickCommentDto) {
			
			UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");
			
			if (sessionUser == null) {
				
				return "redirect:/user/loginPage"; 
			} else {
				pickCommentDto.setUser_id(sessionUser.getId());
				System.out.println(sessionUser.getId());//유저 확인용 test sysout.
				pickService.registerPickComment(pickCommentDto);
			}
			
			return "redirect:/community/pick/readContentPage/" + id;
		}
		
		
		
		//골라줘요 댓글 삭제하기
		@RequestMapping("pick/deleteCommentProcess/{id}")
		public String pickDeleteCommentProcess(@PathVariable int id, int pick_id){
			
			pickService.deleteByPickcommentId(id);
			
			return "redirect:/community/pick/readContentPage/" + pick_id;
		}
		
		
		//골라줘요 좋아요 insert
		@RequestMapping("pick/insertPickLikeProcess/{id}")
		public String insertPickLikeProcess(HttpSession session, PickLikeDto pickLikeDto, @PathVariable int id) {
			
			UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
			
			//로그인 안되어 있을 때
			if (sessionUser == null) {
				
				return "redirect:/user/loginPage";
			} 
			
			// 로그인이 되어 있을 때
			else {
				
				pickLikeDto.setUser_id(sessionUser.getId());
				pickLikeDto.setPick_id(id);
		
				// 유저의 게시글 좋아요 여부 확인
				int likeCount = pickService.checkPickLike(pickLikeDto);
				
				
				if (likeCount > 0) {
					pickService.removeLikePickBoard(pickLikeDto);
				} else {
					pickService.insertPickLike(pickLikeDto);
				}
				
				return "redirect:/community/pick/readContentPage/" + id;
			}

		}
		

	// 골라줘요 옵션 투표 프로세스 
	@RequestMapping("pick/voteProcess")	
	public String voteProcess(int pick_id, PickOptionVoteDto pickOptionVoteDto, HttpSession session) {
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		
		//로그인 안되어 있을 때
		if (sessionUser == null) {
			return "redirect:/user/loginPage";
		} 

		pickOptionVoteDto.setUser_id(sessionUser.getId());
		
		pickService.vote(pickOptionVoteDto, pick_id);
		
		
		return "redirect:/community/pick/readContentPage/" + pick_id;
	}
			
}
	

