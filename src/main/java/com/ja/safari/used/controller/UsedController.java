package com.ja.safari.used.controller;


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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.ja.safari.dto.ProductDto;
import com.ja.safari.dto.ProductImgDto;
import com.ja.safari.dto.ProductRequestDto;
import com.ja.safari.dto.UserDto;
import com.ja.safari.used.service.UsedServiceImpl;

@Controller
@RequestMapping("/used/*")
public class UsedController {
	
	@Autowired
	UsedServiceImpl usedService;
	
	// 중고 메인 페이지
	@RequestMapping("mainPage")
	public String main(Model model) {
		List<Map<String, Object>> list = usedService.selectProductList();
		model.addAttribute("list", list);
		// categoryList
		model.addAttribute("categoryList", usedService.selectMainAndSubCategory());
		model.addAttribute("cityList", usedService.selectProductCity());
		return "/used/mainPageAjax";
	}
	
	// 베스트 
	@RequestMapping("bestPage")
	public String bestPage(Model model) {
		model.addAttribute("list", usedService.selectBestProduct());
		// categoryList
		model.addAttribute("categoryList", usedService.selectMainAndSubCategory());
		model.addAttribute("cityList", usedService.selectProductCity());
		return "/used/bestPage";
	}
	
	// 카테고리 리스트 불러오기 
	@RequestMapping("categoryList")
	public String categoryList(Model model, Integer mainId, Integer subId) {
		model.addAttribute("list", usedService.selectProductByCategory(mainId, subId));
		model.addAttribute("categoryList", usedService.selectMainAndSubCategory());
		model.addAttribute("cityList", usedService.selectProductCity());
		return "/used/mainPage";
	}
	
	// 상품 등록 페이지 
	@RequestMapping("productRegister")
	public String productRegister(Model model, HttpSession session) {
		if(session.getAttribute("sessionUser")==null) {
			return "redirect:../user/loginPage";
		}else {
			model.addAttribute("MainCateogryList", usedService.selectMainCategory());
			model.addAttribute("cityList", usedService.selectProductCity());
			
			return "used/productRegister2";
		}
	}
	
	// 상품 등록 수정 페이지
	@RequestMapping("updateProductRegister")
	public String updateProductRegister(int productId, HttpSession session, Model model) {
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		if(sessionUser!=null && sessionUser.getId()==usedService.selectProductDtoById(productId).getUser_id()) {
			Map<String, Object> map = usedService.selectProductDetail(productId);
			model.addAttribute("map", map);
			model.addAttribute("MainCateogryList", usedService.selectMainCategory());
			model.addAttribute("cityList", usedService.selectProductCity());
			return "used/updateProductRegister";
			
		}else {
			return "redirect:../user/loginPage";
		}
	}
	
	//상품 수정한거 저장 
	@RequestMapping("updateProductRegisterProcess")
	public String updateProductRegisterProcess(ProductDto productDto, HttpSession session, String price1, MultipartFile[] images) {
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		if(sessionUser==null) {
			return "redirect:../user/loginPage";
		}else {
			if(price1==null) {
				productDto.setPrice(0);
			}else {
				price1 = price1.replace(",", "");
				int price = Integer.valueOf(price1);
				productDto.setPrice(price);
			}
			
			int productId = productDto.getId();
			usedService.updateProduct(productDto);
			usedService.deleteProductImgByProductId(productId);
			if(images != null) {
				for(MultipartFile multipartFile:images) {
					//파일이 존재하지 않을 떄도 반복문을 한번 돌기 때문에 continue 
					if(multipartFile.isEmpty()) {
						continue;
					}
					
					String rootFolder = "/Users/gahyeonhong/Documents/safari/";
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
					String today = sdf.format(new Date());
					File targetFolder = new File(rootFolder + today); //C:/uploadFolder/2023/05/23
					
					if(!targetFolder.exists()) {
						targetFolder.mkdirs();
					}
					
					// 저장 파일명 만들기. 핵심은 파일명 충돌 방지 = 랜덤 + 시간
					String fileName = UUID.randomUUID().toString();
					fileName += "_" + System.currentTimeMillis();
					
					//확장자 추출
					String originalFileName = multipartFile.getOriginalFilename(); //사용자에 있는 파일명
					
					String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
					
					String saveFileName = today + "/" + fileName + ext;
					
					//문법 오류 피하기 위해서
					try {
						multipartFile.transferTo(new File(rootFolder + saveFileName));
					}catch(Exception e) {
						e.printStackTrace();
					}
					
					ProductImgDto productImgDto = new ProductImgDto();
					productImgDto.setProduct_id(productId);
					productImgDto.setProduct_img_link(saveFileName);
					usedService.insertProductImg(productImgDto);
				}
			}
			return "redirect:./productDetail?productId="+productId;
		}
		
	}
	
	// 상품 등록한 것 저장
	@RequestMapping("productRegisterProcess")
	public String productRegisterProcess(ProductDto productDto, MultipartFile[] images, HttpSession session,String price1){
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		if(sessionUser==null) {
			return "redirect:../user/loginPage";
		}else {
			if(price1==null) {
				productDto.setPrice(0);
			}else {
				price1 = price1.replace(",", "");
				int price = Integer.valueOf(price1);
				productDto.setPrice(price);
			}
			
			int productId = usedService.createProductPk();
			productDto.setId(productId);
			System.out.println(productDto.getId());
			System.out.println(productDto.getUser_id());
			System.out.println(productDto.getTitle());
			System.out.println(productDto.getContent());
			System.out.println(productDto.getLocation());
			System.out.println(productDto.getPrice());
			System.out.println(productDto.getProduct_sub_category());
			System.out.println(productDto.getProduct_town_id());
			
			usedService.insertProduct(productDto);
			
			if(images != null) {
				for(MultipartFile multipartFile:images) {
					//파일이 존재하지 않을 떄도 반복문을 한번 돌기 때문에 continue 
					if(multipartFile.isEmpty()) {
						continue;
					}
					String rootFolder = "/Users/gahyeonhong/Documents/safari/";
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
					String today = sdf.format(new Date());
					File targetFolder = new File(rootFolder + today); //C:/uploadFolder/2023/05/23
					
					if(!targetFolder.exists()) {
						targetFolder.mkdirs();
					}
					// 저장 파일명 만들기. 핵심은 파일명 충돌 방지 = 랜덤 + 시간
					String fileName = UUID.randomUUID().toString();
					fileName += "_" + System.currentTimeMillis();
					
					//확장자 추출
					String originalFileName = multipartFile.getOriginalFilename(); //사용자에 있는 파일명
					
					String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
					
					String saveFileName = today + "/" + fileName + ext;
					
					//문법 오류 피하기 위해서
					try {
						multipartFile.transferTo(new File(rootFolder + saveFileName));
					}catch(Exception e) {
						e.printStackTrace();
					}
					
					ProductImgDto productImgDto = new ProductImgDto();
					productImgDto.setProduct_id(productId);
					productImgDto.setProduct_img_link(saveFileName);
					usedService.insertProductImg(productImgDto);
				}
			}
			return "redirect:./mainPage";
		}
	}
	
	//상품 상세 페이지 
	@RequestMapping("productDetail")
	public String productDetail(Model model, int productId, HttpSession session) {
		Map<String, Object> map = usedService.selectProductDetail(productId);
		List<ProductImgDto> list = usedService.selectProductDetailImg(productId);
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		if(sessionUser!=null) {
			model.addAttribute("result", usedService.selectProductRequestCountByUser(productId, sessionUser.getId()));
		}else {
			model.addAttribute("result", false);
		}
	    model.addAttribute("reservationCount", usedService.countProductRequestReservation(productId));
	    model.addAttribute("completeCount", usedService.countProductRequestComplete(productId));
	    model.addAttribute("requestCount", usedService.countProductRequestByProductId(productId));
		model.addAttribute("map", map);
		model.addAttribute("list", list);
		// 거래요청 List
		model.addAttribute("productRequestList", usedService.selectProductRequestByProductId(productId));
		usedService.updateProductViewsById(productId);
		
		return "used/productDetail";
	}
	
	// 상품 삭제
	@RequestMapping("deleteProduct")
	public String deleteProduct(int productId) {
		usedService.deleteProductByProductId(productId);
		return "redirect:./mainPage";
	}
	
	// 거래 요청 
	@RequestMapping("productRequest")
	public String productRequest(HttpSession session, int productId) {
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		if(sessionUser==null) {
			return "redirect:../user/loginPage";
		}else {
			ProductRequestDto productRequestDto = new ProductRequestDto();
			productRequestDto.setProduct_id(productId);
			productRequestDto.setUser_id(sessionUser.getId());
			usedService.insertProductRequest(productRequestDto);
			return "redirect:./chatList";
		}
	}
	
	// 채팅방 이미 있는 사람 
	@RequestMapping("productRequestAlready")
	public String productRequestAlready(HttpSession session, int productId) {
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		if(sessionUser==null) {
			return "redirect:../user/loginPage";
		}else {
//			usedService.deleteProductRequestByUser(productId, sessionUser.getId());
			return "redirect:./chatList";
		}
	}
	
	// 거래 예약중으로 상태 변경
	@RequestMapping("productRequestStatusReservation")
	public String productRequestReservation(HttpSession session, int productId, int userId) {
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		if(sessionUser==null) {
			return "redirect:../user/loginPage";
		}else {
			usedService.updateProductRequestStatusReservate(productId, userId);
			return "redirect:./productDetail?productId="+productId;
		}
	}
	
	// 거래 취소-  거래요청으로 변경
	@RequestMapping("productRequestStatusCancel")
	public String productRequestCancel(HttpSession session, int productId, int userId) {
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		if(sessionUser==null) {
			return "redirect:../user/loginPage";
		}else {
			usedService.updateProductRequestStatusCancel(productId, userId);
			return "redirect:./productDetail?productId="+productId;
		}
	}
	
	// 거래완료- 거래완료로 상태 변경 
	@RequestMapping("productRequestStatusComplete")
	public String productRequestStatusComplete(HttpSession session, int productId, int userId) {
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		if(sessionUser==null) {
			return "redirect:../user/loginPage";
		}else {
			usedService.updateProductRequestStatusComplete(productId, userId);
			return "redirect:./productDetail?productId="+productId;
		}
	}
	
	// 채팅창 리스트 보여주기 
	@RequestMapping("chatList")
	public String chatList(HttpSession session) {
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		if(sessionUser==null) {
			return "redirect:../user/loginPage";
		}else {
//			model.addAttribute("list", usedService.selectProductRequestAllByUserId(sessionUser.getId()));
			return "used/chatList";
		}
	}
	
	
	
	

}
