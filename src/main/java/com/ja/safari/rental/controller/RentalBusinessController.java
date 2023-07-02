package com.ja.safari.rental.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jca.cci.object.EisOperation;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.ja.safari.dto.KaKaoPayApproveDto;
import com.ja.safari.dto.RentalBusinessDto;
import com.ja.safari.dto.RentalItemDto;
import com.ja.safari.dto.RentalItemImgDto;
import com.ja.safari.dto.RentalOrderDto;
import com.ja.safari.dto.RentalPeriodDiscDto;
import com.ja.safari.rental.service.RentalBusinessServiceImpl;

@Controller
@RequestMapping("/rentalBusiness/*")
public class RentalBusinessController {
	
	@Autowired
	RentalBusinessServiceImpl rentalService;
	
	

	/*
	 * 페이징처리 
	 */
	
	// 대여 메인 페이지
	@RequestMapping("mainPage")
	public String main(HttpSession session) {
		
		RentalBusinessDto businessDto = (RentalBusinessDto) session.getAttribute("businessUser");
		if(businessDto == null) return "redirect:./loginPage"; 	
		
		return "rentalB/dashboard";
	}
	
	// 회원가입 페이지 
	@RequestMapping("businessRegisterPage")
	public String businessRegisterPage(HttpSession session) {
		
		session.invalidate();
		return "rentalB/businessRegisterPage";
	}
	
	// 사업자 계정 정보 수정 
	@RequestMapping("businessUpdateInfoPage")
	public String businessUpdateInfoPage(HttpSession session, Model model) {

		RentalBusinessDto businessDto = (RentalBusinessDto) session.getAttribute("businessUser");
		if(businessDto == null) return "redirect:./loginPage"; 	
		
		model.addAttribute("dto", rentalService.getBusinessDtoById(businessDto.getId()));
		
		return "rentalB/businessUpdateInfoPage";
	}
	
	// 로그인  페이지 
	@RequestMapping("loginPage")
	public String loginPage() {
		
		return "rentalB/businessLoginPage";
	}
	
	// 로그인  페이지 
	@RequestMapping("businessLoginPage")
	public String businessLoginPage() {
		
		return "rentalB/businessLoginPage";
	}
	
	// 상품등록 페이지 
	@RequestMapping("productRegisterPage")
	public String productRegisterPage(HttpSession session, Model model) {
		
		RentalBusinessDto businessDto = (RentalBusinessDto) session.getAttribute("businessUser");
		if(businessDto == null) return "redirect:./loginPage"; 		
		
		model.addAttribute("mainCategoryList", rentalService.getRentalMainCategoryList());
		
		return "rentalB/productRegisterPage";
	}
	
	// 상품 관리 페이지   
	@RequestMapping("productListPage")
	public String productListPage(HttpSession session, Model model) {
		
		RentalBusinessDto businessDto = (RentalBusinessDto) session.getAttribute("businessUser");
		if(businessDto == null) return "redirect:./loginPage"; 		
		
		model.addAttribute("list", rentalService.getProductAndPriceListByUserId(businessDto.getId()));
		model.addAttribute("user", businessDto);
		
		return "rentalB/productListPage";
	}
	
	// 상품 수정 페이지   
	@RequestMapping("productEditPage")
	public String productEditPage(HttpSession session, Model model, int id) {
		
		RentalBusinessDto businessDto = (RentalBusinessDto) session.getAttribute("businessUser");
		if(businessDto == null) return "redirect:./loginPage"; 		
		
		model.addAttribute("map", rentalService.getProductAndPriceMapByUserId(id));
		model.addAttribute("mainCategoryList", rentalService.getRentalMainCategoryList());
		model.addAttribute("itemId", id);
		
		return "rentalB/productEditPage";
	}
	
	// 주문 관리 페이지    
	@RequestMapping("orderListPage")
	public String orderListPage(HttpSession session, Model model) {
		
		RentalBusinessDto businessDto = (RentalBusinessDto) session.getAttribute("businessUser");
		if(businessDto == null) return "redirect:./loginPage"; 		
		
		model.addAttribute("list", rentalService.getRentalOrderAndProductListByUserId(businessDto.getId()));
		
		
		return "rentalB/orderListPage";
	}
	
	// 주문 관리 페이지    
	@RequestMapping("orderListPage2")
	public String orderListPage2(HttpSession session, Model model) {
		
		RentalBusinessDto businessDto = (RentalBusinessDto) session.getAttribute("businessUser");
		if(businessDto == null) return "redirect:./loginPage"; 		
		
		model.addAttribute("list", rentalService.getRentalOrderAndProductListByUserId(businessDto.getId()));
		model.addAttribute("productList", rentalService.getProductListByUserId(businessDto.getId()));
		
		
		return "rentalB/orderListPage2";
	}
	
	// 배송 관리 페이지    
	@RequestMapping("orderDeliveryPage")
	public String orderDeliveryPage(HttpSession session, Model model) {
		
		RentalBusinessDto businessDto = (RentalBusinessDto) session.getAttribute("businessUser");
		if(businessDto == null) return "redirect:./loginPage"; 		
		
		model.addAttribute("list", rentalService.getOrderAndProductListToBeShippedByUserId(businessDto.getId()));
		
		return "rentalB/orderDeliveryPage2";
	}
	
	
	// 반품 관리 페이지    
	@RequestMapping("orderReturnPage")
	public String orderReturnPage(HttpSession session, Model model) {
		
		RentalBusinessDto businessDto = (RentalBusinessDto) session.getAttribute("businessUser");
		if(businessDto == null) return "redirect:./loginPage"; 		
		
		model.addAttribute("list", rentalService.getOrderAndProductListToBeShippedByUserId(businessDto.getId()));
		
		return "rentalB/orderReturnPage";
	}
	
	
	
	// 리뷰 관리 페이지    
	@RequestMapping("orderReviewPage")
	public String orderReviewPage(HttpSession session, Model model) {
		
		RentalBusinessDto businessDto = (RentalBusinessDto) session.getAttribute("businessUser");
		if(businessDto == null) return "redirect:./loginPage"; 		
		
//		model.addAttribute("list", rentalService.getReviewListByProduct(businessDto.getId()));
		
		return "rentalB/orderReviewPage2";
	}
	
	// 내 정보     
	@RequestMapping("myInfoPage")
	public String myInfoPage(HttpSession session, Model model) {
		
		RentalBusinessDto businessDto = (RentalBusinessDto) session.getAttribute("businessUser");
		if(businessDto == null) return "redirect:./loginPage"; 		
		
		model.addAttribute("dto", rentalService.getBusinessDtoById(businessDto.getId()));
		
		return "rentalB/myInfoPage";
	}
	
	
	// 결제 중 
	@RequestMapping("paymentProcess")
	public String paymentProcess(HttpSession session, String pg_token) {
		
		RentalBusinessDto businessDto = (RentalBusinessDto) session.getAttribute("businessUser");
		if(businessDto == null) return "redirect:./loginPage"; 		
		
		System.out.println(pg_token);
		KaKaoPayApproveDto kakaoPagApproveDto = (KaKaoPayApproveDto) session.getAttribute("kakaoPay");
		kakaoPagApproveDto.setPg_token(pg_token);
		session.setAttribute("kakaoPay", kakaoPagApproveDto);
		
		return "rentalB/paymentProcess";
	}
	
	
	// 결제 성공     
	@RequestMapping("paymentSucceeded")
	public String paymentSucceeded(HttpSession session, Model model, Integer orderId) {
		
		RentalBusinessDto businessDto = (RentalBusinessDto) session.getAttribute("businessUser");
		if(businessDto == null) return "redirect:./loginPage"; 		
		
		session.removeAttribute("kakaoPay");
		
		model.addAttribute("map", rentalService.getOrderAndPaymentInfo(orderId));
		
		return "rentalB/paymentSucceeded";
	}
	
	
	
	
	
	
	
	
	
	/*
	 * 로직처리 
	 */
	
	
	@RequestMapping("productDeleteProcess")
	public String productDeleteProcess(HttpSession session, int id) {
		
		RentalBusinessDto businessUser = (RentalBusinessDto)session.getAttribute("businessUser");
		if(businessUser==null) {
			return "redirect:./loginPage";
		}
		
		rentalService.deleteRentalItem(id);
		rentalService.deleteDiscountedPeriodByItemId(id);
		rentalService.deleteRentalItemImg(id);
		
		return "redirect:./productListPage";
	}
	
	
	@RequestMapping("businessRegisterProcess")
	public String businessRegisterProcess(HttpSession session, RentalBusinessDto rentalBusinessDto, String addressDetail,
			MultipartFile regImg) {
		
		
		// 파일 저장 로직 
		if(regImg != null) {
	
			String rootFolder = "/Users/hailey/Documents/safariImg/";
	
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
			String originalFileName = regImg.getOriginalFilename();
			String extString = originalFileName.substring(originalFileName.lastIndexOf("."));
			String saveFileName = today + "/" + fileName + extString;
			
			try {
				regImg.transferTo(new File(rootFolder + saveFileName));
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			rentalBusinessDto.setReg_img_link(saveFileName);
			
		} // 파일 업로드 관련 끝 
		
		String address = rentalBusinessDto.getBusiness_address();
		address += " "+addressDetail;
		rentalBusinessDto.setBusiness_address(address);
		
		rentalService.registerBusiness(rentalBusinessDto);
		
		
		return "redirect:./mainPage";
	}
	
//	
//	@RequestMapping("businessUpdateInfoProcess")
//	public String businessUpdateInfoProcess(HttpSession session, RentalBusinessDto rentalBusinessDto, String addressDetail,
//			MultipartFile regImg) {
//		
//		RentalBusinessDto businessUser = (RentalBusinessDto)session.getAttribute("businessUser");
//		if(businessUser==null) {
//			return "redirect:./loginPage";
//		}
//		
//		// 파일 저장 로직 
//		if(regImg != null) {
//			
//			String rootFolder = "/Users/hailey/Documents/safariImg/";
//			
//			// 날짜별 폴더 생성 로직 
//			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
//			String today = sdf.format(new Date());
//			File targetFoler = new File(rootFolder + today); 
//			if(!targetFoler.exists()) {
//				targetFoler.mkdirs();
//			}
//			
//			// 저장 파일명 만들기 : 파일명 충돌 방지 = 랜덤 + 시간 
//			String fileName = UUID.randomUUID().toString();
//			fileName += "_" + System.currentTimeMillis();
//			
//			// 확장자 추출 
//			String originalFileName = regImg.getOriginalFilename();
//			String extString = originalFileName.substring(originalFileName.lastIndexOf("."));
//			String saveFileName = today + "/" + fileName + extString;
//			
//			try {
//				regImg.transferTo(new File(rootFolder + saveFileName));
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//			
//			rentalBusinessDto.setReg_img_link(saveFileName);
//			
//		} // 파일 업로드 관련 끝 
//		
//		if(addressDetail!=null && addressDetail!="") {
//			String address = rentalBusinessDto.getBusiness_address();
//			address += " "+addressDetail;
//			rentalBusinessDto.setBusiness_address(address);
//		}
//		
//		rentalService.updateBusinessInfo(rentalBusinessDto);
//		
//		return "redirect:./mainPage";
//	}
//	
//	
//	// 상품 등록 
//	@RequestMapping("productRegisterProcess")
//	public String productRegisterProcess(HttpSession session, RentalItemDto rentalItemDto, Integer[] discountedPrice, MultipartFile mainImg, 
//			MultipartFile[] itemImgs) {
//		
//		RentalBusinessDto rentalBusinessDto = (RentalBusinessDto)session.getAttribute("businessUser");
//		if(rentalBusinessDto==null) {
//			return "redirect:./loginPage";
//		}
//		
//		int itemPk = rentalService.getRentalItemPk();
//		rentalItemDto.setId(itemPk);
//		rentalItemDto.setBusiness_id(rentalBusinessDto.getId());
//		
//		if(mainImg != null) {
//			String rootFolder = "/Users/hailey/Documents/safariImg/";
//			// 날짜별 폴더 생성 로직 
//			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
//			String today = sdf.format(new Date());
//			File targetFoler = new File(rootFolder + today);
//			if(!targetFoler.exists()) {
//				targetFoler.mkdirs();
//			}
//			// 저장 파일명 만들기 : 파일명 충돌 방지 = 랜덤 + 시간 
//			String fileName = UUID.randomUUID().toString();
//			fileName += "_" + System.currentTimeMillis();
//			// 확장자 추출 
//			String originalFileName = mainImg.getOriginalFilename();
//			String extString = originalFileName.substring(originalFileName.lastIndexOf("."));
//			String saveFileName = today + "/" + fileName + extString;
//			try {
//				mainImg.transferTo(new File(rootFolder + saveFileName));
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//			rentalItemDto.setMain_img_link(saveFileName);
//		}
//		
//
//		List<RentalItemImgDto> rentalItemImgDtos = new ArrayList<>();
//		// 파일 저장 로직 
//		if(itemImgs != null) {
//			for(MultipartFile multipartFile : itemImgs) {
//				if(multipartFile.isEmpty()) {
//					continue;
//				}
//				String rootFolder = "/Users/hailey/Documents/safariImg/";
//				// 날짜별 폴더 생성 로직 
//				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
//				String today = sdf.format(new Date());
//				File targetFoler = new File(rootFolder + today);
//				if(!targetFoler.exists()) {
//					targetFoler.mkdirs();
//				}
//				// 저장 파일명 만들기 : 파일명 충돌 방지 = 랜덤 + 시간 
//				String fileName = UUID.randomUUID().toString();
//				fileName += "_" + System.currentTimeMillis();
//				// 확장자 추출 
//				String originalFileName = multipartFile.getOriginalFilename();
//				String extString = originalFileName.substring(originalFileName.lastIndexOf("."));
//				String saveFileName = today + "/" + fileName + extString;
//				try {
//					multipartFile.transferTo(new File(rootFolder + saveFileName));
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//				RentalItemImgDto rentalItemImgDto = new RentalItemImgDto();
//				rentalItemImgDto.setItem_id(itemPk);
//				rentalItemImgDto.setImg_link(saveFileName);
//				
//				rentalItemImgDtos.add(rentalItemImgDto);
//			}
//		}
//		// 파일 업로드 관련 끝 
//		
//		// 할인 가격 체크 
//		List<RentalPeriodDiscDto> discPriceList = new ArrayList<>();
//		if(discountedPrice!=null) {
//			for(int i=0;i<3;i++) {
//				if(discountedPrice[i]!=null) {
//					RentalPeriodDiscDto rentalPeriodDiscDto = new RentalPeriodDiscDto();
//					rentalPeriodDiscDto.setDiscounted_price(discountedPrice[i]);
//					rentalPeriodDiscDto.setRental_period((i+1)*12);
//					rentalPeriodDiscDto.setItem_id(itemPk);
//					discPriceList.add(rentalPeriodDiscDto);
//				}
//			}
//		}
//		
//		// 서비스 넘겨주기 
//		rentalService.registerRentalItem(rentalItemDto);
//		rentalService.registerRentalItemImgs(rentalItemImgDtos);
//		rentalService.registerDiscountedPeriod(discPriceList);
//		
//		
//		return "redirect:./mainPage";
//	}
//	
	
	// 상품 수정
	@RequestMapping("productUpdateProcess")
	public String productUpdateProcess(HttpSession session, RentalItemDto rentalItemDto, Integer[] discountedPrice, MultipartFile mainImg, 
			MultipartFile[] itemImgs) {
		
		RentalBusinessDto rentalBusinessDto = (RentalBusinessDto)session.getAttribute("businessUser");
		if(rentalBusinessDto==null) {
			return "redirect:./loginPage";
		}
		
		rentalItemDto.setBusiness_id(rentalBusinessDto.getId());
		System.out.println(rentalItemDto.getId());
		
		// 기존 이미지/할인 정보 삭제 
		rentalService.deleteDiscountedPeriodByItemId(rentalItemDto.getId());
		rentalService.deleteRentalItemImg(rentalItemDto.getId());
		
		// 대표 사진 저장 
		if(mainImg != null) {
			String rootFolder = "/Users/hailey/Documents/safariImg/";
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			String today = sdf.format(new Date());
			File targetFoler = new File(rootFolder + today);
			if(!targetFoler.exists()) {
				targetFoler.mkdirs();
			}
			String fileName = UUID.randomUUID().toString();
			fileName += "_" + System.currentTimeMillis();
			String originalFileName = mainImg.getOriginalFilename();
			String extString = originalFileName.substring(originalFileName.lastIndexOf("."));
			String saveFileName = today + "/" + fileName + extString;
			try {
				mainImg.transferTo(new File(rootFolder + saveFileName));
			} catch (Exception e) {
				e.printStackTrace();
			}
			rentalItemDto.setMain_img_link(saveFileName);
		}
		
		
		List<RentalItemImgDto> rentalItemImgDtos = new ArrayList<>();
		// 상세 이미지 저장 
		if(itemImgs != null) {
			for(MultipartFile multipartFile : itemImgs) {
				if(multipartFile.isEmpty()) {
					continue;
				}
				String rootFolder = "/Users/hailey/Documents/safariImg/";
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
				String today = sdf.format(new Date());
				File targetFoler = new File(rootFolder + today);
				if(!targetFoler.exists()) {
					targetFoler.mkdirs();
				}
				String fileName = UUID.randomUUID().toString();
				fileName += "_" + System.currentTimeMillis();
				String originalFileName = multipartFile.getOriginalFilename();
				String extString = originalFileName.substring(originalFileName.lastIndexOf("."));
				String saveFileName = today + "/" + fileName + extString;
				try {
					multipartFile.transferTo(new File(rootFolder + saveFileName));
				} catch (Exception e) {
					e.printStackTrace();
				}
				RentalItemImgDto rentalItemImgDto = new RentalItemImgDto();
				rentalItemImgDto.setItem_id(rentalItemDto.getId());
				rentalItemImgDto.setImg_link(saveFileName);
				
				rentalItemImgDtos.add(rentalItemImgDto);
			}
		}
		// 파일 업로드 관련 끝 
		
		// 할인 가격 체크 
		List<RentalPeriodDiscDto> discPriceList = new ArrayList<>();
		if(discountedPrice!=null) {
			for(int i=0;i<3;i++) {
				if(discountedPrice[i]!=null) {
					RentalPeriodDiscDto rentalPeriodDiscDto = new RentalPeriodDiscDto();
					rentalPeriodDiscDto.setDiscounted_price(discountedPrice[i]);
					rentalPeriodDiscDto.setRental_period((i+1)*12);
					rentalPeriodDiscDto.setItem_id(rentalItemDto.getId());
					discPriceList.add(rentalPeriodDiscDto);
				}
			}
		}
		
		
		// 서비스 넘겨주기 
		rentalService.updateRentalItem(rentalItemDto);
		rentalService.registerRentalItemImgs(rentalItemImgDtos);
		rentalService.registerDiscountedPeriod(discPriceList);
		
		return "redirect:./productListPage";
	}
	
	// 로그인 프로세스 
	@RequestMapping("businessLoginProcess")
	public String businessLoginProcess(HttpSession session, RentalBusinessDto rentalBusinessDto) {
				
		RentalBusinessDto businessUser = rentalService.businessLogin(rentalBusinessDto);
		
		if(businessUser == null) return "redirect:./loginPage"; 
		
		session.setAttribute("businessUser", businessUser);
		return "redirect:./mainPage";
	}
	
	// 로그아웃 프로세스 
	@RequestMapping("businessLogoutProcess")
	public String businessLogoutProcess(HttpSession session) {
		
		session.invalidate();
		return "redirect:./mainPage";
	}

	
	
	
	
	
	
	
	
	
}
