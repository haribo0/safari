package com.ja.safari.rental.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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

import com.ja.safari.dto.RentalBusinessDto;
import com.ja.safari.dto.RentalItemReturnDto;
import com.ja.safari.dto.RentalOrderDto;
import com.ja.safari.dto.RentalReviewDto;
import com.ja.safari.dto.RentalReviewImgDto;
import com.ja.safari.dto.UserAddressDto;
import com.ja.safari.dto.UserDto;
import com.ja.safari.rental.service.RentalServiceImpl;
import com.ja.safari.user.service.UserServiceImpl;

@Controller
@RequestMapping("/rental/*")
public class RentalController {
	
	@Autowired
	private RentalServiceImpl rentalService;
	@Autowired
	private UserServiceImpl userService;

	/*
	 * 페이징처리 
	 */
	
	// 대여 메인 페이지
	@RequestMapping("mainPage")
	public String main(Model model, Integer sub_category_id, Integer main_category_id) {
		//System.out.println("sub_category_id:: " + sub_category_id);
		
		List<Map<String, Object>> categoryList = rentalService.getCategoryList();
		List<Map<String, Object>> rentalItemList = rentalService.getRentalItemList(sub_category_id, main_category_id);
		
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("rentalItemList", rentalItemList);
		return "rental/mainPage";
	}
	
	// 회원가입 페이지 
	@RequestMapping("businessRegisterPage")
	public String businessRegisterPage(HttpSession session) {
		
		session.invalidate();
		return "rental/businessRegisterPage";
	}
	
	// 로그인  페이지 
	@RequestMapping("businessLoginPage")
	public String businessLoginPage() {
		
		return "rental/businessLoginPage";
	}
	
	// 상품 상세 페이지
	@RequestMapping("productDescPage")
	public String productDescPage(Model model, int id) {
		
		Map<String, Object> map = rentalService.getItem(id);
		List<Map<String, Object>> reviewMap = rentalService.getRentalReview(id);
		int reviewCount = rentalService.getRentalReviewCount(id);
		Double reviewRating = rentalService.getRentalReviewRating(id);
	
		model.addAttribute("data", map); // 대여 아이템 상품 하나
		model.addAttribute("reviewData", reviewMap); // 대여 아이템 리뷰
		model.addAttribute("reviewCount", reviewCount); // 대여 아이템 리뷰 갯수
		model.addAttribute("reviewRating",reviewRating); // 대여 평점
		
		return "rental/productDescPage";
	}
	
	// 상품등록 페이지 
	@RequestMapping("productRegisterPage")
	public String productRegisterPage(HttpSession session) {
		
		RentalBusinessDto businessDto = (RentalBusinessDto) session.getAttribute("businessUser");
		if(businessDto == null) return "redirect:./loginPage"; 
		
		return "rental/productRegisterPage";
	}
	
	// 대여 오더 페이지
	@RequestMapping("orderConfirmPage")
	public String orderConfirmPage(Model model, HttpSession session, int id) {
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		
		if(sessionUser == null) {
			return "redirect:../user/loginPage";
		} else {
			Map<String, Object> map = rentalService.getItem(id);
			List<UserAddressDto> userAddressDtoList = userService.getUserAddressList(sessionUser.getId()); 
			
			model.addAttribute("data",map);
			model.addAttribute("addressList", userAddressDtoList);
			
			return "rental/orderConfirmPage";			
		}
	}
	
	//대여 카카오페이 성공페이지
	//안내 페이지 제공예정
	
	
	
	/*
	 * 로직처리 
	 */
	
	
	// 로그인 프로세스 
	@RequestMapping("businessLoginProcess")
	public String businessLoginProcess(HttpSession session, RentalBusinessDto rentalBusinessDto) {
				
		RentalBusinessDto businessUser = rentalService.businessLogin(rentalBusinessDto);
		
		if(businessUser == null) return "redirect:./loginPage"; 
		
		session.setAttribute("businessUser", businessUser);
		return "redirect:./mainPage";
	}

	// 대여 주문 프로세스 
	@RequestMapping("rentalOrderProcess")
	public String rentalOrderProcess(HttpSession session, RentalOrderDto params) {
	 
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		if(sessionUser==null) return "redirect:../user/loginPage";
		
		//if(prd_address!=null || prd_address!="") params.setAddress(prd_address);
		
		params.setUser_id(sessionUser.getId());
		rentalService.OrderRental(params);
		
		return "redirect:./mainPage";
	}
	
	// 대여 반납 프로세스
	@RequestMapping("rentalReturnProcess")
	public String rentalReturnProcess(int rental_order_id) {
		RentalItemReturnDto rentalItemReturnDto = new RentalItemReturnDto();
		rentalItemReturnDto.setRental_order_id(rental_order_id);
		
		rentalService.rentalReturn(rentalItemReturnDto);
		
		return "redirect:../user/myOrderListPage";
	}
	
	// 대여 리뷰 프로세스
	@RequestMapping("writeRentalReviewProcess")
	public String writeRentalReviewProcess(HttpSession session, RentalReviewDto params, MultipartFile[] rental_review_img) {
		
		List<RentalReviewImgDto> rentalReviewImgDtoList= new ArrayList<>();
		
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		int userId = sessionUser.getId();
		
		params.setUser_id(userId);
		
		// 파일 저장 로직 
		if(rental_review_img != null) {
			
			for(MultipartFile multipartFile : rental_review_img ) {
				if(multipartFile.isEmpty()) { //예외처리
					continue;
				}
			
	
			String rootFolder = "C:\\ploadFiles";
	
			// 날짜별 폴더 생성 로직 
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			String today = sdf.format(new Date());
			File targetFoler = new File(rootFolder + today); 
			if(!targetFoler.exists()) {
				targetFoler.mkdirs();
			}
			
			// 저장 파일명 만들기 : 파일명 충돌 방지 = 랜덤 + 시간 
			String fileName = UUID.randomUUID().toString();
			fileName += "_" + System.currentTimeMillis();
			
			// 확장자 추출 
			String originalFileName = multipartFile.getOriginalFilename();
			String extString = originalFileName.substring(originalFileName.lastIndexOf("."));
			String saveReviewFileName = today + "/" + fileName + extString;
			
			try {
				multipartFile.transferTo(new File(rootFolder + saveReviewFileName));
			} catch (Exception e) {
				e.printStackTrace();
			}

			RentalReviewImgDto rentalReviewImgDto = new RentalReviewImgDto();
			rentalReviewImgDto.setRental_review_img(saveReviewFileName);
			
			rentalReviewImgDtoList.add(rentalReviewImgDto);
		} // 파일 업로드 관련 끝 
		}
		rentalService.writeRentalReview(params,rentalReviewImgDtoList);
		
		return "redirect:../user/myOrderListPage";
	}
	
	
}

