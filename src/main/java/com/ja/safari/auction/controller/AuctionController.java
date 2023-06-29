package com.ja.safari.auction.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ja.safari.auction.service.AuctionServiceImpl;
import com.ja.safari.dto.ProductMainCategoryDto;
import com.ja.safari.dto.ProductSubCategoryDto;
import com.ja.safari.dto.UserDto;

@Controller
@RequestMapping("/auction/*")
public class AuctionController {
	
	@Autowired
	private AuctionServiceImpl auctionService;
	

   // 경매 메인 페이지
	@RequestMapping("mainPage")
	public String main(Model model) {
		
		model.addAttribute("auctionList", auctionService.getAuctionList());
		model.addAttribute("productMainCategories", auctionService.getProductMainCategories());   
		
		return "auction/mainPage";
	}
	

	
	
	// 경매 수정 페이지 이동
	@RequestMapping("modifyProductPage/{id}") 
	public String modifyProductPage(Model model, @PathVariable int id) {
		
		model.addAttribute("auctionDto", auctionService.getAuctionProductDetail(id));
		
		model.addAttribute("productMainCategories", auctionService.getProductMainCategories());   
		
		model.addAttribute("productSubCategory", 
				auctionService.getProductSubCategory(auctionService.getAuctionItem(id).getAuction_sub_category_id()));
		
		return "auction/modifyProductPage";
	}
	
	
	// 경매 수정
//	@RequestMapping("modifyProductProcess")
//	public String modifyAuctionProduct(HttpSession session, AuctionItemDto auctionItemDto, 
//																	MultipartFile[] auctionItemImgFiles) {
//	
//		System.out.println("실행됩니까?");
//	// 상세 이미지 삭제
//	auctionService.removeAuctionProductImage(auctionItemDto.getId());
//
//	// 상세 이미지 등록
//	List<AuctionItemImgDto> auctionItemImgList = new ArrayList<>();
//	// 파일 저장 로직
//	if (auctionItemImgFiles != null) {
//
//		for (MultipartFile auctionItemImgFile : auctionItemImgFiles) {
//
//			// 이미지가 존재하지 않을 때
//			if (auctionItemImgFile.isEmpty()) {
//				continue;
//			}
//
//			String rootFolder = "C:/auctionFiles/";
//
//			// 날짜별 폴더 생성 로직
//
//			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd"); // 날짜를 문자로 바꿔주는 역할
//			String today = sdf.format(new Date()); // new Date(): 오늘 날짜 출력
//
//			File targetFolder = new File(rootFolder + today); 
//
//			if (!targetFolder.exists()) {
//				targetFolder.mkdirs(); // 폴더 생성
//
//			}
//
//			// 저장 파일명 만들기. 핵심은 파일명 충돌 방지 = 랜덤 + 시간
//			String fileName = UUID.randomUUID().toString();
//			fileName += "_" + System.currentTimeMillis();
//
//			// 확장자 추출
//			String originalFileName = auctionItemImgFile.getOriginalFilename(); // originalFileName : 사용자가 컴퓨터에 올리는 파일명
//			String ext = originalFileName.substring(originalFileName.lastIndexOf(".")); // lastindexof: 뒤에서부터 .의 위치를
//																						// 찾아서 숫자를 반환
//
//			// 슬래시 주의할 것 기억하기
//			String saveFileName = today + "/" + fileName + ext;
//
//			try {
//				// java.io.file 불러오기, 폴더를 포함한 파일명을 넣는다
//				// 다른 이미지이지만 파일명이 같은 경우, 충돌을 피하려면
//				auctionItemImgFile.transferTo(new File(rootFolder + saveFileName));
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//
//			AuctionItemImgDto auctionItemImgDto = new AuctionItemImgDto();
//			auctionItemImgDto.setAuction_item_img_link(saveFileName);
//
//			auctionItemImgList.add(auctionItemImgDto);
//		}
//	}
//
//	// 데이터 저장 로직
//
//	auctionService.modifyAuctionProduct(auctionItemDto, auctionItemImgList);
//	
//	return "redirect:./productDetail/" + auctionItemDto.getId();
//	
//	
//
//}	
	
	
	// 경매 삭제
	@RequestMapping("removeProductProcess/{id}")
	public String removeProductProcess(@PathVariable int id) {
		
		auctionService.removeAuctionProduct(id);
		
		//  "redirect:../mainPage";
		return "redirect:/auction/mainPage";
	}
	
	// 경매 물품 상세페이지
	@RequestMapping("productDetail/{id}") 
	public String productDetail(Model model, @PathVariable int id) {
		
		model.addAttribute("productDetail", auctionService.getAuctionProductDetail(id));
		model.addAttribute("productMainCategories", auctionService.getProductMainCategories());  
		
		ProductSubCategoryDto productSubCategoryDto = auctionService.getProductSubCategory(auctionService.getAuctionItem(id).getAuction_sub_category_id());
		 ProductMainCategoryDto productMainCategoryDto = auctionService.getProductMainCategory(productSubCategoryDto.getId());
		
		
		
		model.addAttribute("productSubCategory", 
				auctionService.getProductSubCategory(auctionService.getAuctionItem(id).getAuction_sub_category_id()));		
		
		return "auction/productDetail";
	}
	
	// 입찰페이지 접속
	@RequestMapping("bidPage/{id}")
	public String bidPage(HttpSession session, Model model, @PathVariable int id) {
		
		UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");
		
		if (sessionUser == null) {
			return "main/loginPage";
		} else {
			model.addAttribute("bidProduct", auctionService.getAuctionProductDetail(id));
			return "auction/bidPage";
	}
	}
	

	
	
	
	
}
