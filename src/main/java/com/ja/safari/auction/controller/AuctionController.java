package com.ja.safari.auction.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ja.safari.auction.service.AuctionServiceImpl;
import com.ja.safari.dto.AuctionItemOrderPaymentDto;
import com.ja.safari.dto.AuctionKakaoPayApproveDto;
import com.ja.safari.dto.UserDto;
import com.ja.safari.user.service.UserServiceImpl;

@Controller
@RequestMapping("/auction/*")
public class AuctionController {
	
	@Autowired
	private AuctionServiceImpl auctionService;
	@Autowired
	private UserServiceImpl userService;
	

	// 메인 페이지
	@RequestMapping("mainPage")
	public String mainpage(Model model) {
		
		return "auction/mainPage";
	}
	
	
	
	
   // 경매 리스트페이지
	@RequestMapping("List")
	public String main(Model model) {
		
		model.addAttribute("auctionList", auctionService.getAuctionList());
		model.addAttribute("productMainCategories", auctionService.getProductMainCategories());   
		
		return "auction/List";
	}
	

	// 경매 삭제
	@RequestMapping("removeProductProcess/{id}")
	public String removeProductProcess(@PathVariable int id) {
		
		auctionService.removeAuctionProduct(id);
		
		//  "redirect:../mainPage";
		return "redirect:/auction/List";
	}
	
	// 경매 물품 상세페이지
	@RequestMapping("productDetail/{id}") 
	public String productDetail(Model model, @PathVariable int id) {

		model.addAttribute("productDetail", auctionService.getAuctionProductDetail(id));
		model.addAttribute("productMainCategories", auctionService.getProductMainCategories());  
		
	    model.addAttribute("sellerInfo", userService.selectUserDtoById((auctionService.getAuctionItem(id).getUser_seller_id())));
		
		model.addAttribute("productSubCategory", 
				auctionService.getProductSubCategory(auctionService.getAuctionItem(id).getAuction_sub_category_id()));		
		
		
		return "auction/productDetail";
	}
	
	// 마이페이지 - 내가 입찰한 기록 조회
	@RequestMapping("bidList")
	public String getMyBidList(HttpSession session, Model model) {
	
		UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");
		
		if(sessionUser == null) {
			return "redirect:/user/loginPage";
		}
		
		model.addAttribute("userBidList", auctionService.getMyBidList(sessionUser.getId()));
		
		return "auction/bidList";
	}
	
	// 마이페이지 - 낙찰 기록 조회
	@RequestMapping("successBidList")
	public String getMySuccessBidList(HttpSession session, Model model) {
	
		UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");
		
		if(sessionUser == null) {
			return "redirect:/user/loginPage";
		}
		
		model.addAttribute("successBidList", auctionService.getMySueecssfulBidList(sessionUser.getId()));
		
		return "auction/successBidList";
	}
	
	// 마이페이지 - 결제 창 
	@RequestMapping("getOrderPage")
	public String getOrderPage(HttpSession session, Model model, int id, AuctionItemOrderPaymentDto auctionItemOrderPaymentDto) {
		
		UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");
		
		if(sessionUser == null) {
			return "redirect:/user/loginPage";
		}
		
		auctionItemOrderPaymentDto.setUser_buyer_id(sessionUser.getId());
		auctionItemOrderPaymentDto.setId(id);
		
		model.addAttribute("orderInfo", auctionService.getOrderPageBySuccessBidPk(auctionItemOrderPaymentDto));	
		
		return "auction/getOrderPage";
	}
	
	// 마이페이지 - 찜 목록 조회
	@RequestMapping("wishList")
	public String MyAuctionWishList(HttpSession session, Model model) {
		
		UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");
		
		if(sessionUser == null) {
			return "redirect:/user/loginPage";
		}
		
		model.addAttribute("auctionWishList", auctionService.getMyAuctionWishList(sessionUser.getId()));
		
		return "auction/wishList";		
		
	}
	
	// 마이 페이지 - 경매 업로드 조회
	@RequestMapping("uploadAuctionList")
	public String getMyUploadAuctionList(HttpSession session, Model model) {
		
		UserDto sessionUser = (UserDto) session.getAttribute("sessionUser");
		
		if(sessionUser == null) {
			return "redirect:/user/loginPage";
		}
		
		model.addAttribute("uploadAuctionList", auctionService.getAuctionAndBidInfoByUploader(sessionUser.getId()));
		
		model.addAttribute("endedAuctionList", auctionService.getEndedAuctionAndPayYnInfoByUploader(sessionUser.getId()));
		
		model.addAttribute("noBidAuctionList", auctionService.getAuctionInfoByUploader(sessionUser.getId()));
		
		return "auction/uploadAuctionList";		
		
	}
	

	
	   // 결제 실패 
		@RequestMapping("paymentFailed")
		public String paymentFailed(HttpSession session) {
			
			UserDto userDto = (UserDto) session.getAttribute("sessionUser");
			if(userDto == null) return "redirect:./loginPage"; 		
			
			return "auction/paymentFailed";
		}
	
	// 결제 중 
		@RequestMapping("paymentProcess")
		public String paymentProcess(HttpSession session, String pg_token) {
			
			UserDto userDto = (UserDto) session.getAttribute("sessionUser");
			if(userDto == null) return "redirect:/user/loginPage"; 		
			
		
			
			AuctionKakaoPayApproveDto  auctionkakaoPayApproveDto = 
					(AuctionKakaoPayApproveDto) session.getAttribute("auctionkakaoPay");
			
			auctionkakaoPayApproveDto.setPg_token(pg_token);
			
			
			session.setAttribute("auctionkakaoPay", auctionkakaoPayApproveDto);
			
			return "auction/paymentProcess";
		}
		
		
		// 결제 성공     
		@RequestMapping("paymentSucceed")
		public String paymentSucceeded(HttpSession session, Model model, Integer id)
		{
			
			UserDto userDto = (UserDto) session.getAttribute("sessionUser");
			if(userDto == null) return "redirect:/user/loginPage"; 		
			
			session.removeAttribute("auctionkakaoPay");
			
			
			model.addAttribute("map", auctionService.getAuctionKakaoPayInfo(id));
			
			return "auction/paymentSucceed";
		}
	

	
	
}
