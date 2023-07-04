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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ja.safari.dto.KaKaoPayApproveDto;
import com.ja.safari.dto.RentalBusinessDto;
import com.ja.safari.dto.RentalItemDto;
import com.ja.safari.dto.RentalItemImgDto;
import com.ja.safari.dto.RentalMainCategoryDto;
import com.ja.safari.dto.RentalPeriodDiscDto;
import com.ja.safari.dto.RentalReviewDto;
import com.ja.safari.dto.RentalSubCategoryDto;
import com.ja.safari.rental.service.RentalBusinessServiceImpl;

@RestController
@RequestMapping("/rentalBusiness/*")
public class RentalBusinessRestController {
	
	@Autowired
	RentalBusinessServiceImpl rentalService;
	
	@RequestMapping("isUserIdTaken")
	public  Map<String, Object> isUserIdTaken(String userId) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("result", "success");
		map.put("isUserIdTaken", rentalService.isUserIdTaken(userId));
		
		return map;
	}
	
	@RequestMapping("getSubCategoryList")
	public  Map<String, Object> getSubCategoryList(int mainCategoryId) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", "success");
		map.put("subCategoryList", rentalService.getRentalSubCategoryListByMainCategoryId(mainCategoryId));
		
		return map;
	}
	
	// 마이페이지 주소
	@RequestMapping("getBusinessUserDto")
	public  Map<String, Object> getBusinessUserDto(HttpSession session) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		RentalBusinessDto businessDto = (RentalBusinessDto) session.getAttribute("businessUser");
		if(businessDto == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}
		
		map.put("result", "success");
		map.put("user", rentalService.getBusinessDtoById(businessDto.getId()));
		
		return map;
	}
	

	// 회원 정보 수정
	@RequestMapping("businessUpdateInfoProcess")
	public Map<String, Object> businessUpdateInfoProcess(HttpSession session, RentalBusinessDto rentalBusinessDto, String addressDetail,
			MultipartFile regImg) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		RentalBusinessDto businessDto = (RentalBusinessDto) session.getAttribute("businessUser");
		if(businessDto == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}
		
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
		
		if(addressDetail!=null && addressDetail!="") {
			String address = rentalBusinessDto.getBusiness_address();
			address += " "+addressDetail;
			rentalBusinessDto.setBusiness_address(address);
		}
		
		rentalService.updateBusinessInfo(rentalBusinessDto);
		
		map.put("result", "success");

		return map;
	}
	
	// 상품 관리 페이지   
	@RequestMapping("getProductListPage")
	public Map<String, Object> getProductListPage(HttpSession session) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		RentalBusinessDto businessDto = (RentalBusinessDto) session.getAttribute("businessUser");
		if(businessDto == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}	
		
		map.put("result", "success");
		map.put("list", rentalService.getProductAndPriceListByUserId(businessDto.getId()));
		map.put("user", businessDto);
		
		return map;
	}
	
	
	
	
	// 배송 처리 리스트 
	@RequestMapping("getProductListToBeShippedList")
	public  Map<String, Object> getProductListToBeShippedList(HttpSession session) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		RentalBusinessDto businessDto = (RentalBusinessDto) session.getAttribute("businessUser");
		if(businessDto == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}
		
		map.put("result", "success");
		map.put("list", rentalService.getOrderAndProductListToBeShippedByUserId(businessDto.getId()));
		
		return map;
	}
	
	// 배송 완료 리스트 
	@RequestMapping("getShippedOrderList")
	public  Map<String, Object> getShippedOrderList(HttpSession session) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		RentalBusinessDto businessDto = (RentalBusinessDto) session.getAttribute("businessUser");
		if(businessDto == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}
		
		map.put("result", "success");
		map.put("list", rentalService.getShippedOrderListByUserId(businessDto.getId()));
		
		return map;
	}
	
	// 반품 신청 리스트 - 수취확인 전  
	@RequestMapping("getItemToBeReturnedList")
	public  Map<String, Object> getItemToBeReturnedList(HttpSession session) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		RentalBusinessDto businessDto = (RentalBusinessDto) session.getAttribute("businessUser");
		if(businessDto == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}
		
		map.put("result", "success");
		map.put("list", rentalService.getItemToBeReturnedListByBusinessId(businessDto.getId()));
		
		return map;
	}
	
	// 반품 신청 리스트 - 수취확인 후 
	@RequestMapping("getItemReturnedList")
	public  Map<String, Object> getItemReturnedList(HttpSession session) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		RentalBusinessDto businessDto = (RentalBusinessDto) session.getAttribute("businessUser");
		if(businessDto == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}
		
		map.put("result", "success");
		map.put("list", rentalService.getItemReturnedListByBusinessId(businessDto.getId()));
		
		return map;
	}
	
	// 주문 배송 완료 처리  
	@RequestMapping("changeShippingStatus")
	public  Map<String, Object> changeShippingStatus(HttpSession session, int orderId) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		RentalBusinessDto businessDto = (RentalBusinessDto) session.getAttribute("businessUser");
		if(businessDto == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}
		
		rentalService.changeShippingStatus(orderId);
		
		map.put("result", "success");
		
		return map;
	}
	
	
	// 반품 수취확인 처리  
	@RequestMapping("changeReturnShippingStatus")
	public  Map<String, Object> changeReturnShippingStatus(HttpSession session, int returnId) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		RentalBusinessDto businessDto = (RentalBusinessDto) session.getAttribute("businessUser");
		if(businessDto == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}
		
		rentalService.changeReturnShippingStatus(returnId);
		
		map.put("result", "success");
		
		return map;
	}
	
	// 상품 리스트 가져오기  
	@RequestMapping("getProductList")
	public  Map<String, Object> getProductList(HttpSession session) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		RentalBusinessDto businessDto = (RentalBusinessDto) session.getAttribute("businessUser");
		if(businessDto == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}
		map.put("result", "success");
		map.put("list", rentalService.getProductListByUserId(businessDto.getId()));
		
		return map;
	}
	
	// 주문 관리 페이지    
	@RequestMapping("getOrderListByOrderStatusAndProduct")
	public Map<String, Object> orderListPage2(HttpSession session, String orderStatus, Integer productId) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		RentalBusinessDto businessDto = (RentalBusinessDto) session.getAttribute("businessUser");
		if(businessDto == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}	
		
		map.put("result", "success");
		map.put("list", rentalService.getRentalOrderAndProductListByUserIdFilterByStatusAndProduct(businessDto.getId(), orderStatus, productId));
		
		return map;
	}
	
	// 반품 아이디로 상품 주문 가져오기 
	@RequestMapping("getProductAndOrderByReturnId")
	public  Map<String, Object> getProductDtoByOrderId(HttpSession session, Integer returnId) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		RentalBusinessDto businessDto = (RentalBusinessDto) session.getAttribute("businessUser");
		if(businessDto == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}
		map.put("result", "success");
		map.put("product", rentalService.getProductDtoByReturnId(returnId));
		map.put("order", rentalService.getOrderDtoByReturnId(returnId));
		
		return map;
	}
	
	// 정산 정보 저장 
	@RequestMapping("returnAfterCharge")
	public  Map<String, Object> returnAfterCharge(HttpSession session, Integer returnId, Integer[] chargeValue, String[] reasonValue) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		RentalBusinessDto businessDto = (RentalBusinessDto) session.getAttribute("businessUser");
		if(businessDto == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}
		
		rentalService.returnAfterCharge(returnId, chargeValue, reasonValue);
		map.put("result", "success");
		
		return map;
	}

	
	// 리뷰 리스트 
//	@RequestMapping("getAllReviews")
//	public  Map<String, Object> getAllReviewList(HttpSession session) {
//		
//		System.out.println("aaa");
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		
//		RentalBusinessDto businessDto = (RentalBusinessDto) session.getAttribute("businessUser");
//		if(businessDto == null) {
//			map.put("result", "fail");
//			map.put("reason", "login required");
//			return map;
//		}
//		map.put("result", "success");
//		map.put("list", rentalService.getAllReviews());
//		
//		return map;
//	}
	
	
	
	// 리뷰 리스트 
	@RequestMapping("getReviewListByProduct")
	public  Map<String, Object> getReviewListByProduct(HttpSession session, Integer productId, Integer status) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		RentalBusinessDto businessDto = (RentalBusinessDto) session.getAttribute("businessUser");
		if(businessDto == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}
		map.put("result", "success");
		map.put("list", rentalService.getReviewsAndUsersAndItemsByProduct(productId, status));
		
		return map;
	}
	
	
	// 리뷰 답글 저장 
	@RequestMapping("saveReviewReply")
	public  Map<String, Object> saveReviewReply(HttpSession session, RentalReviewDto rentalReviewDto) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		RentalBusinessDto businessDto = (RentalBusinessDto) session.getAttribute("businessUser");
		if(businessDto == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}
		
		System.out.println("답글저장::"+rentalReviewDto.getRental_reply_review());
		rentalService.saveReviewReply(rentalReviewDto);
		
		map.put("result", "success");
		
		
		return map;
	}
	
	// 광고 주문 pk 
	@RequestMapping("getAdsOrderPk")
	public  Map<String, Object> getAdsOrderPk(HttpSession session) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		RentalBusinessDto businessDto = (RentalBusinessDto) session.getAttribute("businessUser");
		if(businessDto == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}
		
		map.put("result", "success");
		map.put("orderId", rentalService.getRentalAdsPk());
		System.out.println( map.get("orderId"));
		
		return map;
	}
	
	
	// 카카오페이 결제 ready 정보를 세션에 저장 
	@RequestMapping("saveTidToSession")
	public  Map<String, Object> saveTidToSession(HttpSession session, KaKaoPayApproveDto kakaoPayApproveDto) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		RentalBusinessDto businessDto = (RentalBusinessDto) session.getAttribute("businessUser");
		if(businessDto == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}
		
		session.setAttribute("kakaoPay", kakaoPayApproveDto);
		
		map.put("result", "success");
		
		
		return map;
	}
	

	// 카카오페이 결제 ready 정보 보내주기 
	@RequestMapping("getKakaoPayReadyInfo")
	public  Map<String, Object> getKakaoPayReadyInfo(HttpSession session) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		RentalBusinessDto businessDto = (RentalBusinessDto) session.getAttribute("businessUser");
		if(businessDto == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}
		
		KaKaoPayApproveDto kakaoPayApproveDto = (KaKaoPayApproveDto) session.getAttribute("kakaoPay");

		map.put("result", "success");
		map.put("readyInfo", kakaoPayApproveDto);
		
		
		return map;
	}
	
	// 카카오페이 결제 후 정보 저장  
	@RequestMapping("saveOrderAndPaymentInfo")
	public  Map<String, Object> saveOrderAndPaymentInfo(HttpSession session, KaKaoPayApproveDto kakoApproveDto) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		RentalBusinessDto businessDto = (RentalBusinessDto) session.getAttribute("businessUser");
		if(businessDto == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}
		
		rentalService.saveOrderAndPaymentInfo(kakoApproveDto);
		
		return map;
	}
	
	
	// 메인 카테고리 리스트 가져오기 (상품 등록) 
	@RequestMapping("getMainCategoryList")
	public  Map<String, Object> getMainCategoryList(HttpSession session) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		RentalBusinessDto businessDto = (RentalBusinessDto) session.getAttribute("businessUser");
		if(businessDto == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}
		
		map.put("result", "success");
		map.put("mainCategoryList", rentalService.getRentalMainCategoryList());
		
		
		return map;
	}
	
	

	// 상품 등록 
	@RequestMapping("productRegisterProcess")
	public Map<String, Object> productRegisterProcess(HttpSession session, RentalItemDto rentalItemDto, Integer[] discountedPrice, MultipartFile mainImg, 
			MultipartFile[] itemImgs) {
		

		Map<String, Object> map = new HashMap<String, Object>();
		
		RentalBusinessDto businessDto = (RentalBusinessDto) session.getAttribute("businessUser");
		if(businessDto == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}
		
		
		int itemPk = rentalService.getRentalItemPk();
		rentalItemDto.setId(itemPk);
		rentalItemDto.setBusiness_id(businessDto.getId());
		
		if(mainImg != null) {
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
		// 파일 저장 로직 
		if(itemImgs != null) {
			for(MultipartFile multipartFile : itemImgs) {
				if(multipartFile.isEmpty()) {
					continue;
				}
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
				String originalFileName = multipartFile.getOriginalFilename();
				String extString = originalFileName.substring(originalFileName.lastIndexOf("."));
				String saveFileName = today + "/" + fileName + extString;
				try {
					multipartFile.transferTo(new File(rootFolder + saveFileName));
				} catch (Exception e) {
					e.printStackTrace();
				}
				RentalItemImgDto rentalItemImgDto = new RentalItemImgDto();
				rentalItemImgDto.setItem_id(itemPk);
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
					rentalPeriodDiscDto.setItem_id(itemPk);
					discPriceList.add(rentalPeriodDiscDto);
				}
			}
		}
		
		// 서비스 넘겨주기 
		rentalService.registerRentalItem(rentalItemDto);
		rentalService.registerRentalItemImgs(rentalItemImgDtos);
		rentalService.registerDiscountedPeriod(discPriceList);
		
		map.put("result", "success");

		
		return map;
	}
	
	
	
	
	
	
	////////////
	// 대시보드 //
	///////////
	
	// 차트 데이터
	@RequestMapping("getDataForChart")
	public  Map<String, Object> getSalesByMonth(HttpSession session) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		RentalBusinessDto businessDto = (RentalBusinessDto) session.getAttribute("businessUser");
		if(businessDto == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}
		
		map.put("result", "success");
		map.put("saleList", rentalService.getSalesByProduct(businessDto.getId()));
		map.put("genderList", rentalService.getSalesByGender(businessDto.getId()));
		map.put("revenueList", rentalService.getRevenueByDay(businessDto.getId()));

		
		return map;
	}

	// 최근 주문 가져오기
	@RequestMapping("getRecentOrderList")
	public  Map<String, Object> getRecentOrderList(HttpSession session) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		RentalBusinessDto businessDto = (RentalBusinessDto) session.getAttribute("businessUser");
		if(businessDto == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}
		map.put("result", "success");
		map.put("list", rentalService.getRecentOrdersByUserId(businessDto.getId()));
		
		return map;
	}
	
	// 최근 반납 가져오기
	@RequestMapping("getRecentReturnList")
	public  Map<String, Object> getRecentReturnList(HttpSession session) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		RentalBusinessDto businessDto = (RentalBusinessDto) session.getAttribute("businessUser");
		if(businessDto == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
			return map;
		}
		map.put("result", "success");
		map.put("list", rentalService.getRecentReturnListByUserId(businessDto.getId()));
		
		return map;
	}
	
	
	// 최근 반납 가져오기
//	@RequestMapping("getRecentReturnList")
//	public  Map<String, Object> getRecentReturnList(HttpSession session) {
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		
//		RentalBusinessDto businessDto = (RentalBusinessDto) session.getAttribute("businessUser");
//		if(businessDto == null) {
//			map.put("result", "fail");
//			map.put("reason", "login required");
//			return map;
//		}
//		map.put("result", "success");
//		
//		return map;
//	}
	
	
	

}
