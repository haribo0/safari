package com.ja.safari.community.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ja.safari.community.service.QuestionServiceImpl;
import com.ja.safari.dto.QuestionDto;
import com.ja.safari.dto.QuestionLikeDto;
import com.ja.safari.dto.QuestionReplyDto;
import com.ja.safari.dto.UserDto;
import com.ja.safari.user.service.UserServiceImpl;


@Controller
@RequestMapping("/community/*")
public class QuestionController {  

	@Autowired
	private QuestionServiceImpl questionService;

	@Autowired
	private UserServiceImpl userService;
	
	// 궁금해요 메인 페이지
		@RequestMapping("question/mainPage")
		public String question(Model model) {

			List<Map<String, Object>> questionBoardList = questionService.getQuestionBoardList();

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

			questionService.registerQuestionBoard(questionDto);

			return "redirect:./mainPage";
		}

		//궁금해요 게시물 페이지
		@RequestMapping("question/questionReadContentPage/{id}")
		public String questionReadContentPage(@PathVariable int id, Model model) {

			questionService.increaseQuestionReadCount(id);

			Map<String, Object> map = questionService.getQuestionBoardByBoardId(id);

			model.addAttribute("map", map);

			int QuestionBoardLikeCount = questionService.getQuestionLikeCountByBoardId(id);

			model.addAttribute("QuestionBoardLikeCount", QuestionBoardLikeCount);

			return "/community/question/questionReadContentPage";
		}

		// 궁금해요 게시물 수정 페이지
		@RequestMapping("question/updateQuestionContentPage/{id}")
		public String updateQuestionContentPage(@PathVariable int id, Model model) {

			Map<String, Object> map = questionService.getQuestionBoardByBoardId(id);
			model.addAttribute("map", map);

			return "/community/question/updateQuestionContentPage";
		}

		//궁금해요 게시물 수정 프로세스 
		@RequestMapping("question/updateQuestionContentProcess")
		public String updateQuestionContentProcess(QuestionDto questionDto) {
			questionService.updateQuestionBoard(questionDto);
			System.out.println(questionDto.getId());

			return "redirect:/community/question/questionReadContentPage/"+ questionDto.getId();
		}

		// 궁금해요 게시물 삭제
		@RequestMapping("question/deleteQuestionContentProcess/{id}")
		public String deleteQuestionContentProcess(@PathVariable int id) {

			questionService.deleteQuestionBoardByBoardId(id);

			return "redirect:/community/question/mainPage";
		}

		//답변 등록 프로세스 
		@RequestMapping("question/writeQuestionReplyProcess")
		public String writeQuestionReplyProcess(QuestionReplyDto questionReplyDto) {

			questionService.registerQuestionReply(questionReplyDto);
			
			return "redirect:/community/question/questionReadContentPage/" + questionReplyDto.getQuestion_id();

		}
		
		//답변 작성 페이지
			 @RequestMapping("question/replyQuestionContentPage/{id}") 
			 public String replyQuestionContentPage(@PathVariable int id, Model model) { 
				 
		     model.addAttribute("board", questionService.getQuestionBoardByBoardId(id));
			 
			
//			 List<Map<String,Object>> questionReplyBoardList = communityService.getQuestionReplyBoardList(id);
//			 
//			 model.addAttribute("questionReplyBoardList", questionReplyBoardList); 
			 
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

				int questionlikeCount = questionService.checkQuestionLike(questionLikeDto);

				if (questionlikeCount > 0) {
					questionService.removeQuestionLike(questionLikeDto);

				} else {
					questionService.insertQuestionLike(questionLikeDto);
				}

				return "redirect:/community/question/questionReadContentPage/" + id;
			}
		}
}
