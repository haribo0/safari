package com.ja.safari.rental.service;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.taglibs.standard.lang.jstl.Literal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ja.safari.dto.RentalBusinessDto;
import com.ja.safari.dto.RentalItemDto;
import com.ja.safari.dto.RentalItemImgDto;
import com.ja.safari.dto.RentalItemLikeDto;
import com.ja.safari.dto.RentalItemReturnDto;
import com.ja.safari.dto.RentalMainCategoryDto;
import com.ja.safari.dto.RentalOrderDto;
import com.ja.safari.dto.RentalOrderKakaopayAmount;
import com.ja.safari.dto.RentalOrderKakaopayApprove;
import com.ja.safari.dto.RentalOrderKakaopayInactivation;
import com.ja.safari.dto.RentalOrderKakaopayReady;
import com.ja.safari.dto.RentalPeriodDiscDto;
import com.ja.safari.dto.RentalReturnKakaopayAmount;
import com.ja.safari.dto.RentalReturnKakaopayApprove;
import com.ja.safari.dto.RentalReviewDto;
import com.ja.safari.dto.RentalReviewImgDto;
import com.ja.safari.dto.RentalSubCategoryDto;
import com.ja.safari.dto.UserDto;
import com.ja.safari.rental.mapper.RentalSqlMapper;
import com.ja.safari.user.mapper.UserSqlMapper;
import com.ja.safari.user.service.UserServiceImpl;

@Transactional
@Service
public class RentalServiceImpl {
	
	@Autowired
	RentalSqlMapper rentalSqlMapper;
	
	// 중복 확인 
	public boolean isUserIdTaken(String userId) { 
		return rentalSqlMapper.countUsersByBusinessUserId(userId)>0;
	}
	
	// 회원 가입 
	public void registerBusiness(RentalBusinessDto rentalBusinessDto) {
		rentalSqlMapper.registerBusiness(rentalBusinessDto);
		return;
	}
	
	// 로그인  
	public RentalBusinessDto businessLogin(RentalBusinessDto rentalBusinessDto) {
		
		return rentalSqlMapper.selectBusinessUserByIdAndPw(rentalBusinessDto);
	}
	
	// 상품 리스트 가져오기
	public List<Map<String, Object>> getRentalItemList(Integer sub_category_id, Integer main_category_id, String orderly ) {
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		if(main_category_id == null) main_category_id = 0;
		if(sub_category_id==null) sub_category_id = 0;
		
		List<RentalItemDto> rentalItemDtoList = rentalSqlMapper.selectRentalItemListAll(sub_category_id, main_category_id, orderly);
		
		for(RentalItemDto item : rentalItemDtoList) {
			Map<String, Object> map = new HashMap<String, Object>();
			int itemId = item.getId();
			
			int itemLikeCount = rentalSqlMapper.countLikeById(itemId);
			int itemReviewCount = rentalSqlMapper.selectReviewCount(itemId);
			RentalBusinessDto rentalBusinessDto = rentalSqlMapper.selectRentalBuisnessById(itemId);
			
			map.put("rentalItemDto", item);
			map.put("itemLikeCount", itemLikeCount);
			map.put("itemReviewCount", itemReviewCount);
			map.put("rentalBusinessDto", rentalBusinessDto);
			
			list.add(map);
		}
		return list;
	}
	
	// 카테고리 가져오기
	public List<Map<String, Object>> getCategoryList() {
		
		List<Map<String, Object>> list = new ArrayList<>();
		List<RentalMainCategoryDto> RentalMainCategoryDtoList = rentalSqlMapper.selectCategoryListAll();
		
		for(RentalMainCategoryDto item : RentalMainCategoryDtoList) {
			
			Map<String, Object> map = new HashMap<String, Object>();

			map.put("categoryItem", item);
			
			int mainCategoryId = item.getId();
			List<RentalSubCategoryDto> subCategList = rentalSqlMapper.selectSubCategoryList(mainCategoryId);

			 map.put("subTitleList", subCategList);
			
			list.add(map);
		}
		return list;
	}
	
	// 대여 아이템 하나 가져오기
	public Map<String, Object> getItem(int id) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		RentalItemDto rentalItemDto = rentalSqlMapper.selectById(id);
		RentalSubCategoryDto rentalSubCategoryDto =  rentalSqlMapper.selectSubCatName(id);
		
		String mainCategoryName = rentalSqlMapper.selectMainCatName(rentalSubCategoryDto.getMain_category_id());
		String subCategoryName = rentalSubCategoryDto.getSub_category_name();
		
		List<RentalPeriodDiscDto> rentalPeriodDiscDtoList = rentalSqlMapper.selectPeriodDiscById(id);
		
		List<RentalItemImgDto> rentalItemImgDtoList = rentalSqlMapper.selectItemImageByItemId(id);
		
		RentalBusinessDto rentalBusinessDto = rentalSqlMapper.selectRentalBuisnessById(id);
		
		map.put("rentalItemDto", rentalItemDto);
		map.put("mainCategoryName", mainCategoryName);
		map.put("subCategoryName", subCategoryName);
		map.put("rentalItemImgDtoList", rentalItemImgDtoList);
		map.put("rentalPeriodDiscDtoList", rentalPeriodDiscDtoList);
		map.put("rentalBusinessDto", rentalBusinessDto);
		
		return map;
	}
	
	// 대여 아이템 할인 테이블 가져오기
	public List<RentalPeriodDiscDto> getRentalItDiscDtoList(int id) {
		List<RentalPeriodDiscDto> list = rentalSqlMapper.selectPeriodDiscById(id);
		return list;
	}

	// 대여 상품 아이템 좋아요 토글
	public void toggleRentalItemLike(RentalItemLikeDto rentalItemLikeDto) {
		
		if(rentalSqlMapper.countMyLike(rentalItemLikeDto) > 0) {
			System.out.println("0보다 큼!!!");
			rentalSqlMapper.deleteLike(rentalItemLikeDto);
		} else {
			rentalSqlMapper.insertLike(rentalItemLikeDto);
		}
		
	}
	
	// 대여 상품 아이템 좋아요 다른 이용자 누른 갯수
	public Object getTotalLike(int id) {
		return rentalSqlMapper.countLikeById(id);
	}

	// 대여 상품 아이템 내가(로그인사용자) 좋아요 했는지
	public boolean isLiked(RentalItemLikeDto rentalItemLikeDto) {
		return rentalSqlMapper.countMyLike(rentalItemLikeDto) > 0;
	}

	
	// 대여 상품 주문
	public void OrderRental(RentalOrderDto rentalOrderDto) {
		rentalSqlMapper.insertRentalOrder(rentalOrderDto);
		return;
	}
	
	// 대여 반납시 pk 생성
	public int getRentalOrderReturnPk() {
		int returnPk = rentalSqlMapper.getRentalOrderReturnPk();
		return returnPk;
	}

	// 대여 반납
	public void rentalReturn(RentalItemReturnDto rentalItemReturnDto) {
		
		rentalSqlMapper.insertRentalReturn(rentalItemReturnDto);
		
		//카카오 취소 진행
		String sid = rentalSqlMapper.getSidbyId(rentalItemReturnDto.getRental_order_id());
		System.out.println(" SID 아이디:: "+sid );
		
		try {
			URL kakaoInactive = new URL("https://kapi.kakao.com/v1/payment/manage/subscription/inactive");
			try {
				HttpURLConnection serverConn = (HttpURLConnection) kakaoInactive.openConnection(); // 컨트롤어에서 서버연결
				serverConn.setRequestMethod("POST");
				serverConn.setRequestProperty("Authorization", "KakaoAK 3b571b6edfbddf7b9912075b7f7c4172"); // 카카오에서 권장하는 헤더에 담을 어드민 키
				serverConn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8"); // utf-8 설정
				serverConn.setDoOutput(true); // 서버한테 전달 할 값이 있다 라는 true 표시
				
				String parameter = "cid=TCSUBSCRIP" + "&sid=" + sid; // 정기결제 코드
				
				OutputStream sender = serverConn.getOutputStream(); // 데이터들을 던저줄 객체
				DataOutputStream giver = new DataOutputStream(sender); // 위 객체에게 데이터를 줄 권한 줌
				giver.write(parameter.getBytes(StandardCharsets.UTF_8)); // 형변환(바이트로 약속되어있음)
				giver.close(); // 보내고 비움: 자동으로 flush
				
				int resultKakao = serverConn.getResponseCode(); // 전송이 잘 되었는지 안되었는지 번호를 받음
				InputStream reciver; // 받는객체 생성
				
				if(resultKakao == 200) {
					reciver = serverConn.getInputStream(); // 200 성공일 경우
				} else {
					reciver = serverConn.getErrorStream(); // 성공 외 경우
				}
				
				InputStreamReader reader = new InputStreamReader(reciver); // 받은걸 읽음
				BufferedReader bfrd = new BufferedReader(reader); // 바이트를 읽기 위해 형변환 버퍼리더 생성
				String input = bfrd.readLine();
				
				ObjectMapper objectMapper = new ObjectMapper();
				RentalOrderKakaopayInactivation rentalOrderKakaopayInactivation = objectMapper.readValue(input, RentalOrderKakaopayInactivation.class);
				if(rentalOrderKakaopayInactivation.getLast_approved_at() == null) {
					// 최초 결제만 하고 정기결제 미진행 상태일 경우 approve_at이 null값이기에 최초 결제시 approve 값을 넣음
					Date lastApproveAt = rentalSqlMapper.getFirstApproveAt(rentalOrderKakaopayInactivation.getSid());
					System.out.println("최초결제 승인:: " + lastApproveAt);
					rentalOrderKakaopayInactivation.setLast_approved_at(lastApproveAt);
				}
				System.out.println(rentalOrderKakaopayInactivation.toString());
				
				rentalSqlMapper.insertRentalOrderKakaoInactivation(rentalOrderKakaopayInactivation);
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
			
	}

	// 대여 리뷰 등록
	public void writeRentalReview(RentalReviewDto rentalReviewDto, List<RentalReviewImgDto> rentalReviewImgDtoList ) {
		int reviewId = rentalSqlMapper.createPk();
		
		rentalReviewDto.setId(reviewId);
		rentalSqlMapper.insertRentalReview(rentalReviewDto);
		
		for(RentalReviewImgDto i : rentalReviewImgDtoList ) {
			i.setReview_id(reviewId);
			rentalSqlMapper.insertRentalReviewImg(i);
		}
	}

	// 리뷰 불러오기
	public List<Map<String, Object>> getRentalReview(int id) {
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		List<RentalReviewDto> rentalReviewDtoList = rentalSqlMapper.selectRentalReviewAll(id);
		
		for(RentalReviewDto i :rentalReviewDtoList ) {
			Map<String, Object> map = new HashMap<String, Object>();
			
			int reviewId = i.getId();
			int rentalId = i.getRental_id();
			int userId = i.getUser_id();
			
			List<RentalReviewImgDto> rentalReviewImgDtoList = rentalSqlMapper.selectRentalReviewImgAll(reviewId);
			UserDto reviewer = rentalSqlMapper.selectUserById(userId);
			RentalItemDto rentalItemDto = rentalSqlMapper.selectRentalItem(rentalId);
			
			map.put("reviewList", i);
			map.put("reviewImgList", rentalReviewImgDtoList);
			map.put("reviewer",reviewer);
			map.put("rentalItemDto",rentalItemDto);
			
			System.out.println("RentalReviewDto?:: " + i);
			System.out.println("rental_id?:: " + rentalId);
			System.out.println("rentalItemDto?:: " + rentalItemDto);
			list.add(map);
		}
		
		return list;
	}

	// 리뷰 카운트
	public Integer getRentalReviewCount(int id) {
		Integer count = rentalSqlMapper.selectReviewCount(id);
		return count;
	}

	// 리뷰 평점
	public Double getRentalReviewRating(int id) {
		   
		if(rentalSqlMapper.selectRatingAvg(id)!=null) return rentalSqlMapper.selectRatingAvg(id);
		else return 0.0;

		   
		}

	// 아이템 하나 title 가져오기
	public String getItemTitle(int itemId) {
		String title = rentalSqlMapper.selectItemTitleByItemId(itemId);
		return title;
	}

	// 주문 진행시 pk 생성
	public int getRentalOrderPk() {
		return rentalSqlMapper.getRentalOrderPk();
	}

	// 대여 카카오페이 approve pk 생성
	public int getApprovePk() {
		return rentalSqlMapper.getRentalOrderKakaopayApprovePk();
	}
	
	// 대여 카카오페이 return pk 생성
	public int getReturnApprovePk() {
		return rentalSqlMapper.getRentalReturnKakaopayApprovePk();
	}

	// 카카오페이 준비 dto 생성
	public void saveKakaoReady(RentalOrderKakaopayReady rentalOrderKakaopay) {
		rentalSqlMapper.insertRentalKakaoReady(rentalOrderKakaopay);
		return;
	}
	
	// 카카오페이 준비 다음 단계를 위한 dto 가져오기
	public RentalOrderKakaopayReady getKakaoPayReady(int id) {
		RentalOrderKakaopayReady kakaoPayReady = rentalSqlMapper.getRentalOrderKakaopay(id);
		return kakaoPayReady;
	}
	// 카카오페이 반납 준비 다음단계를 위한 dto 가져오기
	public RentalOrderKakaopayReady getKakaoPayReturnReady(int returnPk) {
		RentalOrderKakaopayReady kakaopayReturnReady = rentalSqlMapper.getRentalReturnKakaopay(returnPk);
		System.out.println("TID??:: " + kakaopayReturnReady);
		return kakaopayReturnReady;
	}

	// 정기결제 주문 정보 저장
	public void saveKakaoApprove(RentalOrderKakaopayApprove rentalOrderKakaopayApprove) {
		rentalSqlMapper.insertRentalKakaoApprove(rentalOrderKakaopayApprove);
		return;
	}
	// 정기결제 주문시 amount 
	public void saveKakaoApproveAmount(RentalOrderKakaopayAmount rentalOrderKakaopayAmount) {
		rentalSqlMapper.insertRentalKakaoApproveAmount(rentalOrderKakaopayAmount);
		return;
	}

	// 반납시 단기결제 정보 저장
	public void saveReturnKakaoApprove(RentalReturnKakaopayApprove rentalReturnKakaopayApprove) {
		rentalSqlMapper.insertReturnKakaoApprove(rentalReturnKakaopayApprove);
		return;
	}
	// 반납시 amount
	public void saveReturnKakaoApproveAmount(RentalReturnKakaopayAmount rentalReturnKakaopayAmount) {
		rentalSqlMapper.insertReturnKakaoApproveAmount(rentalReturnKakaopayAmount);
		return;
	}

	




	
	

	
	
	

}
