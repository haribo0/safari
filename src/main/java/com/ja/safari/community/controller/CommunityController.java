package com.ja.safari.community.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ja.safari.community.service.HelpServiceImpl;
import com.ja.safari.community.service.PickServiceImpl;
import com.ja.safari.community.service.PromotionReviewServiceImpl;
import com.ja.safari.community.service.QuestionServiceImpl;
import com.ja.safari.community.service.RecruitServiceImpl;
import com.ja.safari.dto.UserDto;

@Controller
@RequestMapping("/community/*")
public class CommunityController {
 
	@Autowired
	private PromotionReviewServiceImpl promotionReviewService;
	@Autowired
	private HelpServiceImpl helpService;
	@Autowired
	private QuestionServiceImpl questionService;
	@Autowired
	private RecruitServiceImpl recruitService;
	@Autowired
	private PickServiceImpl pickService;

	  // 커뮤니티 메인 페이지
	   @RequestMapping("mainPage")
	   public String main(Model model, HttpSession session) {
			
		   UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");

			int sessionId = 0;

			if(sessionUser != null) {
				sessionId = sessionUser.getId();
			}
		   
			// 리워드 리뷰 
		    List<Map<String, Object>> newPostByPromoReviewList = promotionReviewService.newPostByPromoReview(sessionId);		
		    List<Map<String, Object>> newPostByHelpList = helpService.newPostByHelp(sessionId);
		    List<Map<String, Object>> newPostByQuestionList = questionService.newPostByQuestion(sessionId);
		    List<Map<String, Object>> newPostByRecruitList = recruitService.newPostByRecruit(sessionId);
		    List<Map<String, Object>> newPostByPickList = pickService.newPostByPick(sessionId);
		   
		    // 최신 게시글 리스트
		    Map<String, List<Map<String, Object>>> newCommunityPostList = new HashMap<>();

		    newCommunityPostList.put("newPostByPromoReviewList", newPostByPromoReviewList);
		    newCommunityPostList.put("newPostByHelpList", newPostByHelpList);
		    newCommunityPostList.put("newPostByQuestionList", newPostByQuestionList);
		    newCommunityPostList.put("newPostByRecruitList", newPostByRecruitList);
		    newCommunityPostList.put("newPostByPickList", newPostByPickList);
		    
		   model.addAttribute("newPostByPromoReviewList", newPostByPromoReviewList);
		   model.addAttribute("newPostByHelpList", newPostByHelpList);
		   model.addAttribute("newPostByQuestionList", newPostByQuestionList);
		   model.addAttribute("newPostByRecruitList", newPostByRecruitList);
		   model.addAttribute("newPostByPickList", newPostByPickList);
		   model.addAttribute("newCommunityPostList", newCommunityPostList);
		   

	      return "community/mainPage";
	   }


}