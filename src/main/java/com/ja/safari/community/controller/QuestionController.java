package com.ja.safari.community.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ja.safari.community.service.QuestionServiceImpl;
import com.ja.safari.dto.HelpImgDto;
import com.ja.safari.dto.QuestionDto;
import com.ja.safari.dto.QuestionImgDto;
import com.ja.safari.dto.QuestionLikeDto;
import com.ja.safari.dto.QuestionReplyCompleteDto;
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
		public String question(Model model, String question_searchType, String question_searchWord) {

			List<Map<String, Object>> questionBoardList = questionService.getQuestionBoardList(question_searchType, question_searchWord);

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
		public String questionWriteContentProcess(HttpSession session, QuestionDto questionDto, MultipartFile[] questionBoardFiles) {

			List<QuestionImgDto> questionImgDtoList = new ArrayList<>();
			
			// 파일 저장 로직
			if (questionBoardFiles != null) {

				for (MultipartFile multipartFile : questionBoardFiles) {

					if (multipartFile.isEmpty()) {
						continue;
					}

					System.out.println("파일명: " + multipartFile.getOriginalFilename());

					String rootFolder = "C:/uploadFiles/";

					// 날짜별 폴더 생성 로직
					SimpleDateFormat qqq = new SimpleDateFormat("yyyy/MM/dd");
					String today = qqq.format(new Date());

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

					QuestionImgDto questionImgDto = new QuestionImgDto();
					questionImgDto.setQuestion_original_filename(originalFileName);
					questionImgDto.setQuestion_img_link(saveFileName);

					questionImgDtoList.add(questionImgDto);
				}
				// 데이터 저장 로직
			
			questionService.registerQuestionBoard(questionDto, questionImgDtoList);
			}
			return "redirect:./mainPage";
		}

		//궁금해요 게시물 페이지
		@RequestMapping("question/questionReadContentPage/{id}")
		public String questionReadContentPage(@PathVariable int id, Model model) {

			questionService.increaseQuestionReadCount(id);

			Map<String, Object> map = questionService.getQuestionBoardByBoardId(id);

			model.addAttribute("map", map);
			
			List<Map<String, Object>> questionReplyBoardList = questionService.getQuestionReplyBoardList(id);
			
			model.addAttribute("questionReplyBoardList", questionReplyBoardList);

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
			//System.out.println(questionDto.getId());

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
		
		//궁금해요 답변 작성 페이지
		 @RequestMapping("question/replyQuestionContentPage/{id}") 
			public String replyQuestionContentPage(@PathVariable int id, Model model) { 
				 
		    model.addAttribute("board", questionService.getQuestionBoardByBoardId(id));
			 
			
			 List<Map<String,Object>> questionReplyBoardList = questionService.getQuestionReplyBoardList(id);
			 
			 model.addAttribute("questionReplyBoardList", questionReplyBoardList); 
			 
			 return "/community/question/replyQuestionContentPage";
			 }

		//궁금해요 답변 삭제
		@RequestMapping("question/deleteQuestionReplyProcess/{id}")
		public String deleteQuestionReplyProcess(@PathVariable int id, int questionboardId) {
			
			questionService.deleteQuestionReply(id);
			
			return "redirect:/community/question/questionReadContentPage/"+ questionboardId;
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
		
	  //궁금해요 게시물 채택 
		@RequestMapping("question/acceptQuestionReplyProcess")
		public String acceptQuestionReplyProcess(int question_reply_id, QuestionReplyCompleteDto questionReplyCompleteDto) {
		
		// 궁금해요 채택완료 테이블
		questionReplyCompleteDto.setQuestion_reply_id(question_reply_id);
		
		QuestionReplyDto questionReplyDto = questionService.getQuestionReplyById(question_reply_id);
			
		questionService.acceptQuestionReply(question_reply_id);
		questionService.completeQuestionReply(question_reply_id);
		questionService.completeQuestionBoard(question_reply_id);
		
		
		return "redirect:/community/question/questionReadContentPage/" + questionReplyDto.getQuestion_id();
}
		
		
		
		
		
		
}
