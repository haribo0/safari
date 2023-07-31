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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ja.safari.community.service.CommunityServiceImpl;
import com.ja.safari.community.service.RecruitServiceImpl;
import com.ja.safari.dto.PickDto;
import com.ja.safari.dto.RecruitDto;
import com.ja.safari.dto.RecruitImgLinkDto;
import com.ja.safari.dto.RecruitLikeDto;
import com.ja.safari.dto.UserDto;


@Controller
@RequestMapping("/community/*")
public class RecruitController  {
	
	@Autowired
	private CommunityServiceImpl communityService;
	@Autowired
	private RecruitServiceImpl recruitService;
	

	
	
		////////////
		// 구인구직 //
		///////////

	
	
		//구인구직 메인 페이지 //페이징 추가.
		@RequestMapping("recruit/mainPage") 
		public String recruitMainPage(Model model, @RequestParam(value = "recruitPage", defaultValue = "1") int recruitPage, String recruit_searchType, String recruit_searchWord) {
		  
			List<Map<String, Object>> recruitBoardList = recruitService.selectAllRecruitBoards(recruitPage, recruit_searchType, recruit_searchWord);
			
			int recruitBoardCount = recruitService.getRecruitBoardCount();
			
			model.addAttribute("recruitBoardList", recruitBoardList);
			
			//페이지네이션
			int totalRecruitPage = (int) Math.ceil(recruitBoardCount / 10.0);
			
			model.addAttribute("totalRecruitPage", totalRecruitPage);
			model.addAttribute("currentRecruitPage", recruitPage);
			
			//베스트게시글
			List<Map<String, Object>> recruitBestBoardList = recruitService.selectBestRecruitBoard();
			
			model.addAttribute("recruitBestBoardList", recruitBestBoardList);
			
			return "/community/recruit/mainPage"; 
		}
		 
		

		//구인구직 글쓰기 페이지
		@RequestMapping("recruit/writeContentPage") 
		public String recruitWriteContentPage() {
			
			
			return "/community/recruit/writeContentPage"; 
		}
		
		//구인구직 글쓰기 프로세스 //구인구직 이미지 파일 첨부 추가.
		@RequestMapping("recruit/recruitWriteContentProcess")
		public String writeContentProcess(HttpSession session, RecruitDto recruitDto, MultipartFile [] recruitFiles) {	
			// 세션이 null일 때 로그인 페이지로 리다이렉트시키기  
			
			List<RecruitImgLinkDto> recruitImgLinkDtoList = new ArrayList<>();
			
			//파일 저장 로직
			if(recruitFiles != null) {
				
				for(MultipartFile multipartFile : recruitFiles) {
					
					if(multipartFile.isEmpty()) {
						continue;
					}
					
					System.out.println("파일이름: " + multipartFile.getOriginalFilename());
					
					String rootFolder = "C:/uploadFiles/";
					
					//날짜별 폴더 생성 로직.
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
					String today = sdf.format(new Date());
					
					File targetFolder = new File(rootFolder + today); // C:/uploadFolder/2023/05/23
					
					if(!targetFolder.exists()) {
						targetFolder.mkdirs();
					}
					
					//저장 파일명 만들기. 핵심은 파일명 충돌 방지 = 랜덤 + 시간.
					String fileName = UUID.randomUUID().toString();
					fileName += "_" + System.currentTimeMillis();
					
					//확장자 추출
					String originalFileName = multipartFile.getOriginalFilename();
					
					String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
					
					String saveFileName = today + "/" + fileName + ext;
					
					try {
						multipartFile.transferTo(new File(rootFolder + saveFileName));
					} catch(Exception e) {
						e.printStackTrace();
					}
					
					RecruitImgLinkDto recruitImgLinkDto = new RecruitImgLinkDto();
					recruitImgLinkDto.setImg_name(originalFileName);
					recruitImgLinkDto.setImg_link(saveFileName);
					
					recruitImgLinkDtoList.add(recruitImgLinkDto);
				}
			}
			
			//데이터 저장 로직
			
			UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
			
			int user_id = sessionUser.getId();
			recruitDto.setUser_id(user_id);
			
			recruitService.registerRecruitBoard(recruitDto, recruitImgLinkDtoList);
			
			return "redirect:./mainPage";
		}
		
		

		//구인구직 게시판 상세보기 //이미지 추가 //좋아요 추가.
		@RequestMapping("recruit/readContentPage/{id}")
		public String recruitReadContentPage(@PathVariable int id, Model model) {
			
			recruitService.increaseViewsRecruitBoard(id);//조회수 증가.
			
			Map<String, Object> map = recruitService.getRecruitBoardById(id);
			
			System.out.println(map);
			System.out.println(map.get("recruitImgLinkDtoList").toString());
			
			model.addAttribute("map", map);
			
			// html escape
			RecruitDto recruitDto = (RecruitDto)map.get("recruitDto");
			String content = recruitDto.getContent();
			content = StringEscapeUtils.escapeHtml4(content);
			content = content.replaceAll("\n", "<br>");
			recruitDto.setContent(content);
			
			//게시물 좋아요 count
			int RecruitBoardLikeCount = recruitService.countLikeByRecruitBoardId(id);
			model.addAttribute("RecruitBoardLikeCount", RecruitBoardLikeCount);
			
			return "/community/recruit/readContentPage";
		}
		
		//구인구직 게시판 수정하기 페이지
		@RequestMapping("recruit/updateContentPage/{id}")
		public String recruitUpdateContentPage(@PathVariable int id, Model model) {
			
			Map<String, Object> map = recruitService.getRecruitBoardById(id);
			
			model.addAttribute("map", map);
			
			return "/community/recruit/updateContentPage";
		}
		
		
		//구인구직 게시판 수정하기 프로세스
		@RequestMapping("recruit/updateContentProcess")
		public String recruitUpdateContentProcess(RecruitDto recruitDto) {
			
			recruitService.updateRecruitBoard(recruitDto);
			int id = recruitDto.getId();
			
			System.out.println(id);
			//return "redirect:/community/pick/mainPage";
			return "redirect:/community/recruit/readContentPage/" + id;
		}
		
		//구인구직 게시물 삭제하기
		@RequestMapping("recruit/deleteContentProcess/{id}")
		public String recruitDeleteContentProcess(@PathVariable int id) {
			
			recruitService.deleteRecruitBoard(id);
			
			return "redirect:/community/recruit/mainPage";
		}
		
		//구인구직 좋아요 insert
		/*
		 * @RequestMapping("recruit/insertRecruitLikeProcess/{id}") public String
		 * insertRecruitLikeProcess(HttpSession session, RecruitLikeDto
		 * recruitLikeDto, @PathVariable int id) {
		 * 
		 * UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");
		 * 
		 * recruitLikeDto.setUser_id(sessionUser.getId());
		 * recruitLikeDto.setRecruit_id(id);
		 * 
		 * recruitService.insertRecruitLike(recruitLikeDto);
		 * 
		 * return "redirect:/community/recruit/readContentPage/" + id; }
		 */
		
		//구인구직 좋아요 insert
		@RequestMapping("recruit/insertRecruitLikeProcess/{id}")
		public String insertRecruitLikeProcess(HttpSession session, RecruitLikeDto recruitLikeDto, @PathVariable int id) {
			
			UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");
			
			//로그인 안되어 있을 때
			if (sessionUser == null) {
				
				return "redirect:/user/loginPage";
			} 
			
			// 로그인이 되어 있을 때
			else {
				
				recruitLikeDto.setUser_id(sessionUser.getId());
				recruitLikeDto.setRecruit_id(id);
		
				// 유저의 게시글 좋아요 여부 확인
				int likeCount = recruitService.checkrecruitLike(recruitLikeDto);
				
				
				if (likeCount > 0) {
					recruitService.deleteRecruitLike(recruitLikeDto);
				} else {
					recruitService.insertRecruitLike(recruitLikeDto);
				}
				
				return "redirect:/community/recruit/readContentPage/" + id;
			}
			
			
		}
	
}
	

