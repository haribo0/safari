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

import com.ja.safari.community.service.HelpServiceImpl;
import com.ja.safari.dto.HelpCommentCompleteDto;
import com.ja.safari.dto.HelpCommentDto;
import com.ja.safari.dto.HelpDto;
import com.ja.safari.dto.HelpImgDto;
import com.ja.safari.dto.HelpLikeDto;
import com.ja.safari.dto.UserDto;

@Controller
@RequestMapping("/community/*")
public class HelpController {

	@Autowired
	private HelpServiceImpl helpService;



	// 해주세요 메인 페이지
	@RequestMapping("help/mainPage")
	public String mainPage(Model model, 
			@RequestParam(value = "helpPage", defaultValue = "1") int helpPage,
			String help_searchType,
			String help_searchWord
			) {

		List<Map<String, Object>> helpBoardList = helpService.selectAllHelpBoards(helpPage, help_searchType, help_searchWord);
		int helpBoardCount = helpService.getHelpBoardCount();
		int totalHelpPage = (int) Math.ceil(helpBoardCount / 10.0);

		
		model.addAttribute("helpBoardList", helpBoardList);
		model.addAttribute("totalHelpPage", totalHelpPage);
		model.addAttribute("currentHelpPage", helpPage);

		List<Map<String, Object>> helpBestBoardList = helpService.selectBestHelpBoards();
		model.addAttribute("helpBestBoardList", helpBestBoardList);

		/*
		 * int helpCommentCount = helpService.selectAllHelpBoards();
		 * model.addAttribute("helpCommentCount", helpCommentCount);
		 */

		return "/community/help/mainPage";
	}

	//해주세요 글쓰기 페이지
	@RequestMapping("help/writeContentPage")
	public String writeContentPage() {
		return "/community/help/writeContentPage";
	}

	//해주세요 글쓰기 프로세
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

			helpService.registerHelpBoard(helpDto, helpImgDtoList);
		}
		return "redirect:./mainPage";

	}

	//해주세요 게시물 페이지
	@RequestMapping("help/readContentPage/{id}")
	public String readContentPage(@PathVariable int id, Model model) {

		helpService.increaseHelpReadCount(id);

		Map<String, Object> map = helpService.getHelpBoard(id);

		model.addAttribute("map", map);

		List<Map<String, Object>> helpCommentsList = helpService.getHelpCommentList(id);

		model.addAttribute("helpCommentsList", helpCommentsList);

		int HelpBoardLikeCount = helpService.getHelpLikeCountByBoardId(id);

		model.addAttribute("HelpBoardLikeCount", HelpBoardLikeCount);

		return "/community/help/readContentPage";

	}

	//해주세요 수정 페이지
	@RequestMapping("help/updateContentPage/{id}")
	public String updateContentPage(@PathVariable int id, Model model) {

		Map<String, Object> map = helpService.getHelpBoard(id);
		model.addAttribute("map", map);

		return "/community/help/updateContentPage";
	}

	// 해주세요 수정
	@RequestMapping("help/updateContentProcess")
	public String updateContentProcess(HelpDto helpDto) {
		helpService.updateHelpBoard(helpDto);

		return "redirect:/community/help/readContentPage/" + helpDto.getId();
	}

	// 해주세요 삭제
	@RequestMapping("help/deleteContentProcess/{id}")
	public String deleteContentProcess(@PathVariable int id) {

		helpService.deleteHelpBoard(id);

		return "redirect:/community/help/mainPage";
	}

	// 해주세요 댓글 등록
	@RequestMapping("help/writeCommentProcess/{id}")
	public String writeCommentProcess(HttpSession session, HelpCommentDto helpCommentDto, @PathVariable int id) {

		UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");

		if (sessionUser == null) {

			return "redirect:/user/loginPage";

		} else {

			helpService.registerHelpComment(helpCommentDto);
		}

		return "redirect:/community/help/readContentPage/" + id;
	}

	// 해주세요 댓글 삭제
	@RequestMapping("help/deleteCommentProcess/{id}")
	public String deleteCommentProcess(@PathVariable int id, int boardId) {

		helpService.deleteHelpComment(id);

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
			int helplikeCount = helpService.checkHelpLike(helpLikeDto);

			if (helplikeCount > 0) {
				// System.out.println("삭제가 되나요?");
				helpService.removeHelpLike(helpLikeDto);

			} else {
				helpService.insertHelpLike(helpLikeDto);
			}

			return "redirect:/community/help/readContentPage/" + id;
		}

	}

	
	
	// 해주세요 미션완료 insert
	@RequestMapping("help/acceptHelpCommentProcess") // id : helpCommentDto.id
	public String acceptHelpCommentProcess(int help_comment_id, HelpCommentCompleteDto helpCommentCompleteDto) {

		// 해주세요 미션완료 테이블 
		helpCommentCompleteDto.setHelp_comment_id(help_comment_id);

		// 매개변수에서 받아온 댓글 pk로 게시물 댓글 테이블에 있는 게시물 pk를 조회하기 위해서 사용
		HelpCommentDto helpCommentDto = helpService.getHelpCommentById(help_comment_id);

		// 데이터 insert
		helpService.acceptHelpComment(help_comment_id);
		
		// 댓글 상태 변경
		helpService.completeHelpComment(help_comment_id);

		helpService.changeCompleteHelp(helpCommentDto.getHelp_id());
		
		
		return "redirect:/community/help/readContentPage/" + helpCommentDto.getHelp_id();
	}

	// 해주세요 미션완료 update //잘 모르겠음
	/*@RequestMapping("help/completeHelpCommentProcess")
	public String completeHelpCommentProcess(int id, int help_comment_id, HelpCommentDto helpCommentDto,
			HelpCommentCompleteDto helpCommentCompleteDto) {

		helpService.completeHelpComment(helpCommentDto);

		return "redirect:/community/help/readContentPage/" + id;
	}*/

}
