package com.ja.safari.rental.controller;

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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ja.safari.dto.RentalOrderKakaopayReady;
import com.ja.safari.dto.RentalPeriodDiscDto;
import com.ja.safari.dto.RentalReturnKakaopayAmount;
import com.ja.safari.dto.RentalReturnKakaopayApprove;
import com.ja.safari.dto.RentalReviewDto;
import com.ja.safari.dto.RentalItemDto;
import com.ja.safari.dto.RentalItemLikeDto;
import com.ja.safari.dto.RentalItemReturnDto;
import com.ja.safari.dto.RentalOrderDto;
import com.ja.safari.dto.RentalOrderKakaopayAmount;
import com.ja.safari.dto.RentalOrderKakaopayApprove;
import com.ja.safari.dto.UserDto;
import com.ja.safari.rental.mapper.RentalSqlMapper;
import com.ja.safari.rental.service.RentalServiceImpl;

@RestController
@RequestMapping("/rental/*")
public class RentalRestController {
	
	@Autowired
	RentalServiceImpl rentalService;
	
	@RequestMapping("isUserIdTaken")
	public Map<String, Object> isUserIdTaken(String userId) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("result", "success");
		map.put("isUserIdTaken", rentalService.isUserIdTaken(userId));
		
		return map;
	}
	
	// 렌탈 상품 아이템 좋아요
	@RequestMapping("toggleRentalItemLike")
	public Map<String, Object> toggleRentalItemLike(HttpSession session, RentalItemLikeDto params){
		Map<String, Object> map = new HashMap<>();
		
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		params.setUser_id(sessionUser.getId());
		rentalService.toggleRentalItemLike(params);
		
		map.put("result", "success");
		return map;
	}
	
	// 렌탈 상품 아이템 좋아요 다른 이용자 누른 갯수
	@RequestMapping("getTotalLikeCount")
	public Map<String, Object> getTotalLikeCount(int id) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("result", "success");
		map.put("count", rentalService.getTotalLike(id));
		return map;
	}
	
	// 로그인한 사용자가 좋아요 누름 리프레시
	@RequestMapping("isLiked")
	public Map<String, Object> isLiked(HttpSession session, RentalItemLikeDto params) {
		Map<String, Object> map = new HashMap<String, Object>();

		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		
		 if(sessionUser == null) {
			map.put("result", "fail");
			map.put("reason", "로그인 되어 있지 않습니다.");
			return map;
		 }
		 
		 params.setUser_id(sessionUser.getId());
		 
		 map.put("result", "success");
		 map.put("isLiked", rentalService.isLiked(params));
		return map;
	}
	
	// 대여 주문 pk
	@RequestMapping("getRentalOrderPk")
	public Map<String, Object> getRentalOrderPk(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		if(sessionUser == null) {
			map.put("result", "fail");
			map.put("reason", "login required");
		}
		
		map.put("result", "success");
		map.put("rentalOrderId", rentalService.getRentalOrderPk());
		
		return map;
	}
	
	
	// 대여 신청 카카오결제 프로세스
	@RequestMapping("rentalOrderKakaoProcess")
	public Map<String, Object> rentalOrderKakaoProcess(HttpSession session, RentalOrderDto params, int id) {
		Map<String, Object> map = new HashMap<String, Object>();
		session.setAttribute("rentalOrder", params);
		UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
		
		String itemTitle = rentalService.getItemTitle(params.getItem_id());
		
		try {
			URL kakaoAddressReady = new URL("https://kapi.kakao.com/v1/payment/ready");
			try {
				HttpURLConnection serverConn = (HttpURLConnection) kakaoAddressReady.openConnection(); // 컨트롤어에서 서버연결
				serverConn.setRequestMethod("POST");
				serverConn.setRequestProperty("Authorization", "KakaoAK 3b571b6edfbddf7b9912075b7f7c4172"); // 카카오에서 권장하는 헤더에 담을 어드민 키
				serverConn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8"); // utf-8 설정
				serverConn.setDoOutput(true); // 서버한테 전달 할 값이 있다 라는 true 표시
				
				String parameter = "cid=TCSUBSCRIP" // 가맹점 코드
						+ "&partner_order_id="+ id // 가맹점 주문번호
						+ "&partner_user_id="+params.getUser_id() // 가맹점 회원 id
						+ "&item_name="+itemTitle // 상품명
						+ "&quantity=1" // 상품수량
						+ "&total_amount="+params.getPrice() // 총 금액
						+ "&tax_free_amount=0" // 상품 비과세 금액
						+ "&approval_url=http://localhost:8181/safari/rental/onKakaopayProcess?id="+id // 결제 성공시 결제 신청 프로세스로 이동
						+ "&fail_url=http://localhost:8181/safari/rental/mainPage" // 결제 실패 시
						+ "&cancel_url=http://localhost:8181/safari/rental/mainPage"; // 결제 취소 시
				
				OutputStream sender = serverConn.getOutputStream(); // 데이터들을 던저줄 객체
				DataOutputStream giver = new DataOutputStream(sender); // 위 객체에게 데이터를 줄 권한 줌
				//giver.writeBytes(parameter); // 형변환(바이트로 약속되어있음)
				//giver.writeUTF("&item_name="+rentalItemDto.getTitle()); // 한글깨짐으로 인하여 따로 넣어줌
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
				
				RentalOrderKakaopayReady rentalOrderKakaopayReady = objectMapper.readValue(input, RentalOrderKakaopayReady.class);
				
				rentalOrderKakaopayReady.setPartner_user_id(sessionUser.getId());
				rentalOrderKakaopayReady.setCid("TCSUBSCRIP");
				rentalOrderKakaopayReady.setAmount(1);
				rentalOrderKakaopayReady.setPartner_order_id(id);
				rentalOrderKakaopayReady.setItem_name(itemTitle);
				
				rentalService.saveKakaoReady(rentalOrderKakaopayReady);
				
				map.put("result", "success");
				map.put("kakaoResult", input);
				
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return map;
	}
	
	
	// 카카오 결제 신청 성공시 최종결제 진행
	@RequestMapping("onKakaopayProcess")
	public String onKakaopayProcess(HttpSession session, HttpServletResponse response, int id, String pg_token) {
		
		System.out.println("PGTOKEN:: " + pg_token);
		System.out.println("partner_order_id:: " + id);
		
		RentalOrderKakaopayReady kakopayReady = rentalService.getKakaoPayReady(id);

		try {
			URL kakaoAddressApprove = new URL("https://kapi.kakao.com/v1/payment/approve");
			try {
				HttpURLConnection serverConn = (HttpURLConnection) kakaoAddressApprove.openConnection(); // 컨트롤어에서 서버연결
				serverConn.setRequestMethod("POST");
				serverConn.setRequestProperty("Authorization", "KakaoAK 3b571b6edfbddf7b9912075b7f7c4172"); // 카카오에서 권장하는 헤더에 담을 어드민 키
				serverConn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8"); // utf-8 설정
				serverConn.setDoOutput(true); // 서버한테 전달 할 값이 있다 라는 true 표시
				
				String parameter = "cid=TCSUBSCRIP" // 가맹점 코드
						+ "&tid=" + kakopayReady.getTid() // tid
						+ "&partner_order_id="+ kakopayReady.getPartner_order_id() // 가맹점 주문번호
						+ "&partner_user_id="+ kakopayReady.getPartner_user_id() // 가맹점 회원 id
						+ "&pg_token=" + pg_token;
				
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
				
				System.out.println(input);
				
				RentalOrderDto rentalOrderDto = (RentalOrderDto)session.getAttribute("rentalOrder");
				rentalOrderDto.setId(id);
				rentalOrderDto.setUser_id(kakopayReady.getPartner_user_id());
				
				// 주문 dto 테이블 넣기
				rentalService.OrderRental(rentalOrderDto);
				
				ObjectMapper objectMapper = new ObjectMapper();
				
				// 카카오 결제 정보 dto 테이블 넣기
				
				int approvePk = rentalService.getApprovePk();
				
				RentalOrderKakaopayApprove rentalOrderKakaopayApprove = objectMapper.readValue(input, RentalOrderKakaopayApprove.class);
				RentalOrderKakaopayAmount rentalOrderKakaopayAmount = rentalOrderKakaopayApprove.getAmount();
				rentalOrderKakaopayApprove.setId(approvePk);
				rentalOrderKakaopayAmount.setId(approvePk);
				
				rentalService.saveKakaoApprove(rentalOrderKakaopayApprove);
				rentalService.saveKakaoApproveAmount(rentalOrderKakaopayAmount);
				
				System.out.println("Amount?:: " + rentalOrderKakaopayAmount.toString());
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		 String redirectSuccessUri = "../user/myOrderListPage"; 
		
		try {
			response.sendRedirect(redirectSuccessUri);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		 
		
		return null;
	}
	
	// 대여 반납 프로세스
		@RequestMapping("rentalReturnProcess")
		public Map<String, Object> rentalReturnProcess(HttpSession session, int rental_order_id, int discount_revocation, String product_title) {

			Map<String, Object> map = new HashMap<String, Object>();
			
			// 반납 pk 설정
			int returnPk = rentalService.getRentalOrderReturnPk();
			// 반납 dto 준비
			RentalItemReturnDto rentalItemReturnDto = new RentalItemReturnDto();
			rentalItemReturnDto.setId(returnPk);
			rentalItemReturnDto.setRental_order_id(rental_order_id);
			rentalItemReturnDto.setDiscount_revocation(discount_revocation);
			
			session.setAttribute("rentalItemReturnDto", rentalItemReturnDto);
			
			UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
			
			try {
				URL kakaoAddressReady = new URL("https://kapi.kakao.com/v1/payment/ready");
				try {
					HttpURLConnection serverConn = (HttpURLConnection) kakaoAddressReady.openConnection(); // 컨트롤어에서 서버연결
					serverConn.setRequestMethod("POST");
					serverConn.setRequestProperty("Authorization", "KakaoAK 3b571b6edfbddf7b9912075b7f7c4172"); // 카카오에서 권장하는 헤더에 담을 어드민 키
					serverConn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8"); // utf-8 설정
					serverConn.setDoOutput(true); // 서버한테 전달 할 값이 있다 라는 true 표시
					
					String parameter = "cid=TC0ONETIME" // 가맹점 코드
							+ "&partner_order_id="+ returnPk // 가맹점 주문번호
							+ "&partner_user_id="+sessionUser.getId() // 가맹점 회원 id
							+ "&item_name="+product_title // 상품명
							+ "&quantity=1" // 상품수량
							+ "&total_amount="+discount_revocation // 총 금액
							+ "&tax_free_amount=0" // 상품 비과세 금액
							+ "&approval_url=http://localhost:8181/safari/rental/onReturnKakaoProcess?returnPk="+returnPk // 결제 성공시 결제 신청 프로세스로 이동
							+ "&fail_url=http://localhost:8181/safari/user/myOrderListPage" // 결제 실패 시
							+ "&cancel_url=http://localhost:8181/safari/user/myOrderListPage"; // 결제 취소 시
					
					OutputStream sender = serverConn.getOutputStream(); // 데이터들을 던저줄 객체
					DataOutputStream giver = new DataOutputStream(sender); // 위 객체에게 데이터를 줄 권한 줌
					//giver.writeBytes(parameter); // 형변환(바이트로 약속되어있음)
					//giver.writeUTF("&item_name="+rentalItemDto.getTitle()); // 한글깨짐으로 인하여 따로 넣어줌
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
					String input = bfrd.readLine(); // 최종 json형태로 만들어져 있음
					
					ObjectMapper objectMapper = new ObjectMapper();
					
					RentalOrderKakaopayReady rentalOrderKakaopayReady = objectMapper.readValue(input, RentalOrderKakaopayReady.class);
					
					rentalOrderKakaopayReady.setPartner_user_id(sessionUser.getId());
					rentalOrderKakaopayReady.setCid("TC0ONETIME");
					rentalOrderKakaopayReady.setAmount(1);
					rentalOrderKakaopayReady.setPartner_order_id(returnPk);
					rentalOrderKakaopayReady.setItem_name(product_title);
					
					rentalService.saveKakaoReady(rentalOrderKakaopayReady);
					System.out.println("반납READY 준비됨!!!");
					System.out.println("반납READY:: " + rentalOrderKakaopayReady);
					
					map.put("result", "success");
					map.put("kakaoResult", input);
					
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} catch (MalformedURLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return map;
		}
		
		
		// 대여 반납 카카오 결제 승인 프로세스
		@RequestMapping("onReturnKakaoProcess")
		public String onReturnKakaoProcess( HttpServletResponse response, HttpSession session, int returnPk, String pg_token) {
			System.out.println("결제 승인 시작!!!");
			
			RentalOrderKakaopayReady kakopayReady = rentalService.getKakaoPayReturnReady(returnPk);
			
			try {
				URL kakaoAddressApprove = new URL("https://kapi.kakao.com/v1/payment/approve");
				try {
					HttpURLConnection serverConn = (HttpURLConnection) kakaoAddressApprove.openConnection(); // 컨트롤어에서 서버연결
					serverConn.setRequestMethod("POST");
					serverConn.setRequestProperty("Authorization", "KakaoAK 3b571b6edfbddf7b9912075b7f7c4172"); // 카카오에서 권장하는 헤더에 담을 어드민 키
					serverConn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8"); // utf-8 설정
					serverConn.setDoOutput(true); // 서버한테 전달 할 값이 있다 라는 true 표시
					
					String parameter = "cid=TC0ONETIME" // 가맹점 코드
							+ "&tid=" + kakopayReady.getTid() // tid
							+ "&partner_order_id="+ kakopayReady.getPartner_order_id() // 가맹점 주문번호
							+ "&partner_user_id="+ kakopayReady.getPartner_user_id() // 가맹점 회원 id
							+ "&pg_token=" + pg_token;
					
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
					
					System.out.println(input);
					
					ObjectMapper objectMapper = new ObjectMapper();
					
					// 카카오 결제 정보 dto 테이블 넣기
					
					int returnApprovePk = rentalService.getReturnApprovePk();
					
					RentalReturnKakaopayApprove rentalReturnKakaopayApprove = objectMapper.readValue(input, RentalReturnKakaopayApprove.class);
					RentalReturnKakaopayAmount rentalReturnKakaopayAmount = rentalReturnKakaopayApprove.getAmount();
					
					rentalReturnKakaopayApprove.setId(returnApprovePk);
					rentalReturnKakaopayAmount.setId(returnApprovePk);
					
					rentalService.saveReturnKakaoApprove(rentalReturnKakaopayApprove);
					rentalService.saveReturnKakaoApproveAmount(rentalReturnKakaopayAmount);
					
					RentalItemReturnDto rentalItemReturnDto = (RentalItemReturnDto)session.getAttribute("rentalItemReturnDto");
					rentalService.rentalReturn(rentalItemReturnDto);
					
					session.removeAttribute("rentalItemReturnDto");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} catch (MalformedURLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			 String redirectSuccessUri = "../user/myOrderListPage"; 
				
				try {
					response.sendRedirect(redirectSuccessUri);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
			
			return null;
		}
			
		// 마이대여리스트중 할인테이블 가져오기
		@RequestMapping("getRentalPeriodDisc")
		public Map<String, Object> getRentalPeriodDisc(int id) {
			Map<String, Object> map = new HashMap<String, Object>();
			
			List<RentalPeriodDiscDto> rentalPeriodDiscDto = rentalService.getRentalItDiscDtoList(id);
			map.put("result", "success");
			map.put("rentalPeriodDiscDto", rentalPeriodDiscDto);
			
			return map;
		}

		// 마이대여리스트 내가 쓴 리뷰
		@RequestMapping("getMyItemReview")
		public Map<String, Object> getMyItemReview(HttpSession session, int id) {
			Map<String, Object> map = new HashMap<String, Object>();
			UserDto sessionUser = (UserDto)session.getAttribute("sessionUser");
			int myId = sessionUser.getId();
			
			RentalReviewDto rentalReviewDto = rentalService.getRentalMyReview(id, myId);
			map.put("result", "success");
			map.put("rentalReviewDto",rentalReviewDto);
			
			return map;
		}
}

