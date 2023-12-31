<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사파리 | 메인</title>
<!-- 메타 섹션 -->
<jsp:include page="../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->
<link rel="stylesheet" href="/safari/resources/style/auction.css" type="text/css">
<style>
.orangeButton{
	background: #ff6f0f;
	font-weight: bold;
	color: white;
}
/* a {
	list-style: none;
	color: inherit;
} */
.custom-table-secondary {
  background-color: #E2E3E5!important; /* 원하는 연한 색상으로 변경 */
}

</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>

	<!-- 헤더 섹션 -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->
	
	<!-- 마이페이지 상단 블럭 -->
	<jsp:include page="../common/myPageTop.jsp"></jsp:include>
	<!-- 마이페이지 상단 블럭 -->

	<div class="container d-flex mt-5 px-0">
		<div class="row w-100">
		<!-- 마이페이지 nav -->
		<jsp:include page="../common/myPageNav.jsp"></jsp:include>
		<!-- 마이페이지 nav -->
			
		<div class="col ms-4">
			<div class="row" style="border-bottom: 2px solid #222; height: 48px;">
				<div class="col p-0">
					<h5>주문/결제</h5>						
				</div>
			</div>
			
			<div class="row mt-4">
				<div class="col fw-bold fs-5">
					
				</div>
			</div>
			
			<div class="row">
      		
   		<div class="col">
   		
   			<div class="row">
   				<div class="col">
   				
   				
   					<div class="row">
   					
   						<div class="col">
   						
   						
   						
   						   <div class="row">
    							<div class="col">
    							
    								<!-- <div class="row">
    									<div class="col fw-semibold fs-5">
		      								구매자 정보
		      							</div>
		      							<div class="col fw-semibold fs-5">
		      								판매자 정보
		      							</div>
    								</div>  -->
    								
    						<%-- 		<div class="row mt-2">
    									<div class="col">
    										<table class="table">
    											<tr>
    												<td class="table-light text-center border-top" style="width: 150px;"> 이름</td>
    												<td class="border-top">
	    												<div class="row">
		    												<div class="col ms-2">
		    													${sessionUser.nickname}
		    												</div>
	    												</div>
    												</td>
    											</tr>
    											<tr>
    												<td class="table-light text-center" style="width: 150px;"> 이메일 </td>
    												<td>
    													<div class="row">
		    												<div class="col ms-2">
		    													${sessionUser.email}
		    												</div>
	    												</div>
    												</td>
    											</tr>
    											<tr>
    												<td class="table-light text-center" style="width: 150px;"> 휴대폰 번호</td>
    												<td>
    													<div class="row">
		    												<div class="col ms-2">
		    													${sessionUser.phone}
		    												</div>
	    												</div>
    												</td>
    											</tr>
    										
    										</table>
    									
    									</div>
    									
										<div class="col">
    										<table class="table">
    											<tr>
    												<td class="table-light text-center border-top" style="width: 150px;"> 이름</td>
    												<td class="border-top">
	    												<div class="row">
		    												<div class="col ms-2">
		    													${orderInfo.nickname}
		    												</div>
	    												</div>
    												</td>
    											</tr>
    											<tr>
    												<td class="table-light text-center" style="width: 150px;"> 이메일 </td>
    												<td>
    													<div class="row">
		    												<div class="col ms-2">
		    													${orderInfo.email}
		    												</div>
	    												</div>
    												</td>
    											</tr>
    											<tr>
    												<td class="table-light text-center" style="width: 150px;"> 휴대폰 번호</td>
    												<td>
    													<div class="row">
		    												<div class="col ms-2">
		    													${orderInfo.phone}
		    												</div>
	    												</div>
    												</td>
    											</tr>
    										
    										</table>
    									
    									</div>    									
    									
    								
    									
    									
    								
    								</div> --%>
    								
    								<div class="row mt-1">
    									<div class="col fw-semibold fs-5">
    										낙찰 정보
    									</div>
    								</div>
    								
    								<div class="row mt-2">
    									<div class="col">
    										<table class="table">
    											<tr class="text-center">
    												<td class="table-light">입찰시간</td>
    												<td class="table-light">경매종료일</td>
    												<td class="table-light">참고사항</td>
    											</tr>
    											<tr class="text-center">
    											
    												<td><fmt:formatDate value="${orderInfo.reg_date}" pattern="yyyy.MM.dd a hh:mm" /></td>
    												<td> <fmt:formatDate value="${orderInfo.end_date}" pattern="yyyy.MM.dd a hh:mm" /></td>
    												<td><span class="fw-medium">경매종료일부터 <span class="text-danger">7일 이내</span></span>에 결제하셔야 유찰처리되지 않습니다.</td>
    											</tr>
    										
    										</table>
    									</div>
    								</div>
    							
    							
		      						<div class="row mt-3">
		      							<div class="col fw-semibold fs-5">
		      								주문 상품 정보
		      							</div>
		      						</div>
		     						
		      						<div class="row mt-2">
		      							<div class="col">
		      								
		      								<input type="hidden" id="bid" value="${orderInfo.id}">
		      								<input type="hidden" id="user_id" value="${sessionUser.id}">
		      								<input type="hidden" id="title" value="${orderInfo.title}">
		      								<input type="hidden" id="bid_price" value="${orderInfo.bid_price}">
		      								
		      								
		      								<table class="table">
		      									<thead class="table-light">
		      										<tr class="text-center">
		      											<td>상품정보</td>
		      											<td>낙찰가</td>
		      											<td>수량</td>
		      											<td>구매가</td>
		      										</tr>
		      									</thead>
		      									<tbody>
		      										<tr>
		      											<td>
		      												<div class="row p-1 align-middle">
		      													<div class="col-auto">
		      														<a href="/safari/auction/productDetail/${orderInfo.auction_item_id}">
																		<img 
																		src="/auctionFiles/${orderInfo.auction_item_img_link}" style="
																		width: 120px; height: 120px;"></a>
		      													</div>
		      													<div class="col-8 ms-3">
		      														<div class="row mt-3">
		      															<div class="col">
		      																${orderInfo.main_category_name}<span style="font-size: 14px;" class="m-1"> > </span>  ${orderInfo.sub_category_name}
		      															</div>
		      														</div>
		      														<div class="row">
		      															<div class="col fw-semibold overflow" style="font-size: 18px; width: 300px">
		      																<a href="/safari/auction/productDetail/${orderInfo.auction_item_id}">
		      																	${orderInfo.title}
		      																</a>	
		      															</div>
		      														</div>
		      													</div>
		      												</div>
		      											
		      											</td>
		      											<td class="text-center">
			      											<div class="row mt-5" style="position: relative; bottom: 4px;">
			      												<div class="col">
				      												<span class="fw-bold" style="font-size: 18px;">
				      													<fmt:formatNumber value="${orderInfo.bid_price}"  pattern="#,###"/>
				      												</span>	원
			      												</div>
			      											 </div>
		      												
		      											</td>
		      											<!-- <td class="text-center"></td> -->
		      											<td class="text-center align-middle">
		      												<span style="position: relative; bottom: 6px;">1</span>
		      											</td>
		      											<td class="text-center">
		      												<div class="row mt-5" style="position: relative; bottom: 4px;">
			      												<div class="col">
				      												<span class="fw-bold text-danger" style="font-size: 18px;">
				      													<fmt:formatNumber value="${orderInfo.bid_price}"  pattern="#,###"/>
				      												</span>	원
			      												</div>
			      											 </div>
		      											
		      											</td>
		      										</tr>
		      									</tbody>
		      								</table>
		      							</div>
		      						</div>
	    						</div>
    						</div>
   						
   						
   						
   						<div class="row mt-3">
	   						<div class="col-8">
	   							<div class="row">
		     						<div class="col-auto fw-semibold fs-5">
		     							배송지 정보
		     						</div>
		     						<div class="col">
		     							<input type="button" class="btn btn-sm btn-outline-dark" value="배송지 변경"
		     							onclick="modifyAddressModal()">
		     						</div>
	    						</div>
    						
	    						<div class="row mt-2 me-3">
	    							<div class="col">
	    								<table class="table">
	    									<tr>
	    										<td class="table-light align-middle text-center border-top" style="width: 150px;"> 받는사람 </td>
	    										<td class="border-top">
	    											
	    											<span class="ms-2" id="addressee"></span>
	    										</td>
	    									</tr>							
	    								
	    									<tr>
	    										<td class="table-light align-middle text-center border-top" style="width: 150px;"> 배송지명 </td>
	    										<td class="border-top">
	    											
	    											<span class="ms-2" id="addressName"></span>
	    										</td>
	    									</tr>
	    									
	    									<tr>
	    										<td class="table-light align-middle text-center" style="width: 150px;"> 배송주소 </td>
	    										<td>
	    											<span class="ms-2" id="deliveryAddress"></span>
	    										</td>
	    									</tr>
	    									
	    									<tr>
	    										<td class="table-light align-middle text-center" style="width: 150px;"> 연락처 </td>
	    										<td>
	    											<span class="ms-2" id="addressPhone"></span>
	    										</td>	
	    									</tr>
	    									
	    									<tr>
	    										<td class="table-light align-middle text-center" style="width: 150px;"> 배송 요청사항 </td>
	    										<td >
	    											<input type="text" class="form-control" id="addressMessage">
	    										</td>	
	    									</tr>
	    									
	    									
	    									
	    								</table>
	    							</div>
	    						</div>
	    						
	    						<div class="row mt-1 mb-5">
	    							<div class="col-11 ms-2 py-5 border border-1 rounded-2 bg-light">
	    								
	    								<div class="row">
	    									<div class="col ms-1">
	    										<div class="row">
	    											<div class="col-3">
	    												
	    												<div class="row">
	    													<div class="col text-center">
	    														현재 보유 코인
	    													</div>
	    												</div>
	    												
	    												<div class="row mt-2">
	    													<div class="col text-center">
	    														<span class="fs-5 fw-bold" id="nowMyCoin"></span> 원 
	    													</div> 
	    												</div>
			    									
			    									</div>
			    									<div class="col px-0">
	    												<div class="row mt-4">
	    													<div class="col fs-4 ms-2">
	    														-
	    													</div>
	    												</div>
			    								
			    									</div>
			    									<div class="col-2 px-0">
	    									
			    										<div class="row">
	    													<div class="col ms-1">
	    														결제 코인
	    													</div>
	    												</div>
	    												
	    												
	    												<div class="row mt-2">
	    													<div class="col ms-1">
	    														<span class="fw-bold fs-5 text-danger" id="payCoin">
				      													<fmt:formatNumber value="${orderInfo.bid_price}"  pattern="#,###"/>
				      												</span>	원
	    													</div>
	    												</div>
	    												
			    									</div>
			    									<div class="col px-0">
	    												<div class="row mt-4">
	    													<div class="col fs-4 ms-3">
	    														-
	    													</div>
	    												</div>
			    								
			    									</div>
			    									<div class="col-2 px-0">
	    												<div class="row">
	    													<div class="col ms-2">
	    														배송비
	    													</div>
	    												</div>
	    												
	    												<div class="row mt-2">
	    													<div class="col ms-3">
	    														<span class="fw-bold fs-5">0</span> 원
	    													</div>
	    												</div>
			    										
			    									</div>
			    									
			    									<div class="col px-0">
	    												<div class="row mt-4">
	    													<div class="col fs-4 px-0 me-2">
	    														=
	    													</div>
	    												</div>
			    								
			    									</div>
			    									
			    									
			    									   									
			    									<div class="col-2 px-0">
	    												<div class="row">
	    													<div class="col me-1 px-0">
	    													  잔여 코인
	    													</div>
	    												</div>
	    												
	    												<div class="row mt-2">
	    													<div class="col px-0">
	    														<span id="remainCoin" class= "fs-5 fw-bold"></span> 원
	    													</div>
	    												</div>
			    										
			    									</div>
	    										</div>
	    									</div>
	    								</div>
	    								
	    							</div>
	    							
	    						</div>
	    						
	    						
    						</div>
    						<%-- 결제 창 --%>
    						<div class="col">
    							
    							<div class="row">
    								<div class="col">
    								
    									<div class="row">
    										<div class="col px-0 fw-bold fs-5">
    											최종 결제정보
    										</div>
    									</div>
    									
    									<div class="row mt-2">
    										<div class="col shadow-sm" >
    										
    											<div class="row p-2 mb-2 ">
    											
    												<div class="col">
    												<div class="row">
    												<!--  -->
    												<div class="col">
    													<div class="row">
    														<div class="col">
    														
    															<div class="row mt-1">
    																<div class="col">
    																	보유 코인
    																</div>
    															</div>
    															
    															<div class="row mt-1">
    																<div class="col">
    																	총 상품금액
    																</div>
    															</div>
    															
    															<div class="row mt-3">
    																<div class="col">
    																	총 배송비 
    																	<span class="ms-2">
    																		<input type="button" class="btn btn-outline-secondary btn-sm" value="상세보기"
    																		style="font-size: 14px;" onclick="shipModal()">
    																	</span>
    																</div>
    															</div>
    															
    															<div class="row mt-4">
    																<div class="col fw-bold fs-5">
    																	최종 결제금액
    																</div>
    															</div>
    														
    														
    														</div>
    														<div class="col text-end">
    														
    															<div class="row mt-1">
    																<div class="col">
    																	<span style="font-size: 18px;"  id="coinBalance"></span> 원
    																</div>
    															</div>
    															
    															<div class="row mt-1">
    																<div class="col">
    																	<span class="fw-bold" style="font-size: 18px;">
				      													<fmt:formatNumber value="${orderInfo.bid_price}"  pattern="#,###"/>
				      												</span>	원
    																</div>
    															</div>
    															
    															<div class="row mt-3">
    																<div class="col">
    																	<span class="fw-bold">0</span> 원
    																</div>
    															</div>
    															
    															<div class="row mt-3">
    																<div class="col">
    																	<span class="fs-4 text-danger fw-bold">
				      													<fmt:formatNumber value="${orderInfo.bid_price}"  pattern="#,###"/>
				      												</span>	원
    																</div>
    															</div>
    										
    														</div>
    													
    													</div>
    													
   			
					    													
    												</div>
    												</div>
    												
   													<div class="row mt-3">
														<div class="col d-grid fs-4">
															<input type="button" class="btn btn-lg orangeButton pe-0 ps-0" value="결제하기"
															onclick="kakaoPayModal()" id="payButton">
														</div>
													</div>
													
													<div class="row mt-2">
														<div class="col"></div>
													</div>
    												<!--  -->
    												</div>
    											</div>
    																					
    										
    										</div>
    									</div>
    									
    									<div class="row mt-5 mb-5">
    										<div class="col rounded-1 bg-light p-2">
    											
    											<div class="row">
    												<div class="col ms-1" >
    													주문 상품정보 및 결제대행 서비스 이용약관에
    												</div>
    											</div>
    											
    											<div class="row">
    												<div class="col ms-1">
    													 모두 동의하십니까?
    												</div>
    											</div>
    											
    											<div class="row mt-2 ms-2">
    												<div class="col form-check" style="position: relative; right: 5px;">
													  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
													  <label class="form-check-label" for="flexCheckDefault">
													    <span class="fw-bold">모두 동의</span>
													  </label>
													</div>
    											</div>
    										</div>
    									
    									</div>
    								
    								
									
										
						
    								
    								
    								</div>
    							</div>
    							
    							
    							
    							
    							
    						</div>
    						<%-- 결제 창 --%>
    						</div>
    						

    						
    						
   						</div>
   					
   					
   					</div>
   				
 	
   				</div>
   			</div>
   		
   		</div>
   		
      	
      	</div>
			
			
			
			
			
			
		</div>
	</div>
	</div>
	
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->



<%-- 결제 모두 동의 체크 박스 alert --%>
<div class="modal" id="checkBoxModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered"> 
    <div class="modal-content">
      <div class="modal-header bg-light">
   		<div class="row">
   			<div class="col fw-semibold">
   				결제 안내
   			</div>
   		</div>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
      	
      	<div class="row text-center">
    		<div class="col"> 
    			이용약관에 모두 동의하여야 결제하실 수 있습니다.
    		</div>
       </div>
  
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창닫기</button>
      </div>      
   
    </div>
  </div>
</div>
<%-- alert --%>

<%-- 배송비 모달 --%>
<div class="modal" id="shipModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered"> 
    <div class="modal-content">
      <div class="modal-header bg-light">
      		<h5 class="ms-2 modal-title fw-semibold">배송비 정보</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
      	
      	<div class="row mt-2">
      		<div class="col-11 ms-3">
      			
      			<div class="row">
      				<div class="col fw-semibold fs-5">
      					482 배송상품
      				</div>
      			</div>
      			
      			<div class="row mt-3">
      				<div class="col">
      				
      					<div class="row">
      						<div class="col">
      							일반상품 배송비
      						</div>
      					</div>
      					
     					<div class="row mt-2">
      						<div class="col">
      							총 배송비
      						</div>
      					</div>      					
      				
      				</div>
      				<div class="col">
      				
						<div class="row">
      						<div class="col text-end">
      							<span class="fw-semibold">0</span> 원
      						</div>
      					</div>   
      					
     					<div class="row mt-2">
      						<div class="col text-end">
      							<span class="fw-semibold">0</span> 원
      						</div>
      					</div>           					   				
      				
      				</div>      				
      			</div>
      			
      			<div class="row mt-4 border-bottom">
      				<div class="col"></div>
      			</div>
      			
				<div class="row mt-3">
      				<div class="col">
      				
      					<div class="row">
      						<div class="col">
      							합계
      						</div>
      					</div>

      				</div>
      				<div class="col">
      				
						<div class="row">
      						<div class="col text-end">
      							<span class="fw-semibold fs-5 text-danger">0</span> 원
      						</div>
      					</div>   
      									   				
      				
      				</div>      				
      			</div>      			
      		
      			
      		</div>
      	</div>

  
      </div>
        
   
    </div>
  </div>
</div>

<%-- 배송비 모달 --%>


<%-- 배송지 변경 모달 --%>
<div class="modal" id="modifyAddressModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered"> 
    <div class="modal-content">
      <div class="modal-header bg-light">
      		<h5 class="ms-2 modal-title fw-semibold">배송지 변경</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
      	
      	<div class="row mt-2">
      		<div class="col-11 ms-3" id="myAddressList" style="height: 400px; overflow:auto;">
      			
      		
      			
      			
      			
      		
      			
      		</div>
      	</div>

  
      </div>
        
   
    </div>
  </div>
</div>

<%-- 배송지 변경 모달 --%>



<%-- 배송지 추가 모달 --%>
<div class="modal" id="addAddressModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered"> 
    <div class="modal-content">
      <div class="modal-header bg-light">
      		<i class="bi bi-chevron-left p-0" data-bs-dismiss="modal" aria-label="Close" style="cursor: pointer;"></i> 
      		<!-- <i class="bi bi-chevron-left p-0" onclick="modifyAddressModal()" style="cursor: pointer;"></i> -->
      		<h5 class="ms-2 modal-title fw-semibold">배송지 추가</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
      	
      	<div class="row mt-2">
      		<div class="col-11 ms-3" style="height: 400px; overflow:auto;">
      		
      			<div class="row">
      				<div class="col">	
      					<div class="input-group">
      						<span class="input-group-text">
	      						<i class="bi bi-person fs-5"></i>
	      					</span>
	      					<input type="text" class="form-control" placeholder="받는 사람" id="add_addressee">
      					</div>
      				</div>
      			</div>
      			
      			<div class="row mt-3">
      				<div class="col">	
      					<div class="input-group">
      						<span class="input-group-text">
	      						<i class="bi bi-truck fs-5"></i>
	      					</span>
	      					<input type="text" class="form-control" placeholder="배송지명" id="address_name">
      					</div>
      				</div>
      			</div>      

				<div class="row mt-3">
      				<div class="col">	
      					<div class="input-group">
      						<span class="input-group-text">
	      						<i class="bi bi-phone fs-5"></i>
	      					</span>
	      					<input type="text" class="form-control" placeholder="연락처"
	      					oninput="oninputPhone(this)" maxlength="13" id="phone">
      					</div>
      				</div>
      			</div>            			
      			
      			
      		<div class="row mt-4">
      			<div class="col">
      				<input type="button" class="btn btn-sm btn-outline-dark" value="우편번호 찾기"
					onclick="daumPost()" > 
      			</div>
      		</div>		

      		
			<div class="row mt-3">
			    <div class="col">
			        <div class="input-group">
			            <span class="input-group-text">
			                <i class="bi bi-geo-alt fs-5"></i>
			            </span>
			            <div class="d-flex flex-column" style="width: 380px">
			                <input type="text" class="form-control" placeholder="주소" id="address">
			                <input type="text" class="form-control" placeholder="상세주소" id="detail_address">
			            </div>
			        </div>
			    </div>
			</div>		
			
			<div class="row mt-4">
				<div class="col d-grid">
					<input type="button" class="btn btn-outline-primary" value="배송지 등록"
					onclick="addUserAddress()">
				</div>
			</div>	
      				        		
      		
      		</div>
      		
      	</div>

      </div>
   
    </div>
  </div>
</div>

<%-- 배송지 추가 모달 --%>

<%-- 주소 등록 alert --%>
<div class="modal" id="addrValidateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered"> 
    <div class="modal-content">
      <div class="modal-header">
      	
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
      	
      	<div class="row text-center">
    		<div class="col" id="validateContent"> </div>
       </div>
  
      </div>
      
      <div class="modal-footer">
      	
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창닫기</button>
      </div>      
   
    </div>
  </div>
</div>
<%-- 주소 등록 alert --%>





<script>

let selectedAddressId = null;
let userCoinBalance = null;


// 로그인된 세션 초기화
let mySessionId = null;
// 세션가져오기
function getSessionId(){
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			if(response.result == "success"){
				mySessionId = response.id; 
			}
		}
	}
	
	xhr.open("get", "../user/getMyId", false);
	xhr.send();		
}


// 예정 잔여 코인
function getRemainCoinBalance() {
	
	const remainCoinBox =  document.querySelector("#remainCoin");
	const nowMyCoin = document.querySelector("#nowMyCoin");
	
	const bidPrice = document.querySelector("#bid_price");
	
	
	nowMyCoin.innerText = new Intl.NumberFormat('ko-KR').format(userCoinBalance);
	remainCoinBox.innerText =  new Intl.NumberFormat('ko-KR').format(userCoinBalance - bidPrice.value);
	
	
}

//주문 시 기본 배송지 정보들 가져오기
function getMyAddressInfoInOrderPage() {
	
	const xhr = new XMLHttpRequest();
	
	const addressee = document.querySelector("#addressee");
	const addressName = document.querySelector("#addressName");
	const deliveryAddress = document.querySelector("#deliveryAddress");
	const addressPhone = document.querySelector("#addressPhone");
	const addressMessage = document.querySelector("#addressMessage");
	
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
	
			if (response.addressList && response.addressList.length > 0) {
				// 가장 최근에 등록한 주소 가져오기
		        const firstAddressDto = response.addressList[0];
		       
				addressee.innerText = firstAddressDto.addressee;
		        addressName.innerText = firstAddressDto.address_name; 
		        deliveryAddress.innerText = firstAddressDto.address;
		        addressPhone.innerText = firstAddressDto.phone;
		        
		      }
	
		}
	}
	xhr.open("get", "/safari/user/getUserAddress");
	xhr.send();	
}




	
// 다음 주소 api
function daumPost(){
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
            
            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }
            //document.getElementById('postcode').value = data.zonecode;
            document.getElementById('address').value = addr;
            document.getElementById('detail_address').focus();
        }
    }).open();
}

//배송비 모달 열기
function shipModal() {
	const shipModal = bootstrap.Modal.getOrCreateInstance("#shipModal");
	shipModal.show();
}

// 배송지 변경 모달 열기
function modifyAddressModal() {
	
/* 	const addAddressModal = bootstrap.Modal.getOrCreateInstance("#addAddressModal");
	addAddressModal.hide();  */
	
	const addressListBox = document.querySelector("#myAddressList");
	addressListBox.innerHTML = "";

	const xhr = new XMLHttpRequest();	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			const shouldAutoScroll = isScrolledToBottom(addressListBox); 

			if (response.addressCount == 0) {
				
				const row = document.createElement("div");
				row.classList.add("row", "mb-2", "p-1");
				
				const col = document.createElement("div");
				col.classList.add("col", "border", "border-1", "rounded-2", "text-center");
				
				const noRow = document.createElement("div");
				noRow.classList.add("row", "mt-3", "mb-3");
				
				const noCol = document.createElement("div");
				noCol.classList.add("col");
				noCol.style.fontSize = "18px";
				
				noCol.innerText = "등록된 배송지가 없습니다.";
				
				noRow.appendChild(noCol);
				col.appendChild(noRow);
				
				row.appendChild(col);

				addressListBox.appendChild(row);
			}
			else {
			
			for (data of response.addressList) {

				//console.log(response.addressList[0]);
				const row = document.createElement("div");
				row.classList.add("row", "mb-2", "p-1");
				
				const col = document.createElement("div");
				col.classList.add("col", "border", "border-1", "rounded-2");
				
				const addressNameRow = document.createElement("div");
				addressNameRow.classList.add("row", "mt-2");
				
				const addressNameCol = document.createElement("div");
				addressNameCol.classList.add("col", "fw-bold");
				addressNameCol.style.fontSize = "18px";
				addressNameCol.innerText = data.address_name;
				
				addressNameRow.appendChild(addressNameCol);
				
				
				const selectedRow = document.createElement("div");
				selectedRow.classList.add("row", "mt-1");
				
				const selectedCol = document.createElement("div");
				selectedCol.classList.add("col");
				
				
				if (data == response.addressList[0]) {
					const button = document.createElement("button");
					button.classList.add("btn", "btn-outline-primary", "btn-sm", "disabled", "fw-bold");
					button.innerText = "기본배송지";
					
					selectedCol.appendChild(button);
				}
				selectedRow.appendChild(selectedCol);
				
				const addressRow = document.createElement("div");
				addressRow.classList.add("row", "mt-2");
				
				const addressCol = document.createElement("div");
				addressCol.classList.add("col");
				
				addressCol.innerText = data.address;
				
				addressRow.appendChild(addressCol);
				
				const finalRow = document.createElement("div");
				finalRow.classList.add("row", "mt-1", "mb-2");
				
				const phoneCol = document.createElement("div");
				phoneCol.classList.add("col");
				phoneCol.innerText = data.phone;
				
				const buttonCol = document.createElement("div");
				buttonCol.classList.add("col", "text-end");
				
				const selectButton = document.createElement("input");
				selectButton.type = "button";
				selectButton.classList.add("btn", "orangeButton");
				selectButton.value = "선택";
				selectButton.style.position = "relative";
				selectButton.style.bottom = "7px";
				selectButton.setAttribute("onclick", "modifyAddress("+ data.id +")");
				
				buttonCol.appendChild(selectButton);
				
				finalRow.appendChild(phoneCol);
				finalRow.appendChild(buttonCol);
				
				col.appendChild(addressNameRow);
				col.appendChild(selectedRow);
				col.appendChild(addressRow);
				col.appendChild(finalRow);
				
				row.appendChild(col);

				addressListBox.appendChild(row);
				
				}
			}
			
			const addRow = document.createElement("div");
			addRow.classList.add("row", "mt-3");
			
			const addCol = document.createElement("div");
			addCol.classList.add("col", "d-grid", "ps-0", "pe-0");
			
			const addButton = document.createElement("input");
			addButton.type = "button";
			addButton.classList.add("btn", "btn-outline-primary");
			addButton.value = "+  배송지 추가";
			addButton.setAttribute("onclick", "addAddressModal()");
			
			addCol.appendChild(addButton);
			addRow.appendChild(addCol);	
			
			//const addInputRow = document.createElement("")
			// 이건 나중애....
			
			
			addressListBox.appendChild(addRow);
			
			if (shouldAutoScroll) {
				addressListBox.scrollTop = addressListBox.scrollHeight;
         	}
			
			const modifyAddressModal = bootstrap.Modal.getOrCreateInstance("#modifyAddressModal");
			
			modifyAddressModal.show();
			
		}
	}
	xhr.open("get", "/safari/auction/getMyAddressListInOrderPage?userId=" + mySessionId);
	xhr.send();	
}




// 배송지 추가 모달 열기
function addAddressModal() {
	
/* 	const modifyAddressModal = bootstrap.Modal.getOrCreateInstance("#modifyAddressModal");
	modifyAddressModal.hide();  */
	
	const addAddressModal = bootstrap.Modal.getOrCreateInstance("#addAddressModal");
	addAddressModal.show();
}


//주소 등록
function addUserAddress() {
	
	const addressee = document.getElementById("add_addressee");
	const address_name = document.getElementById("address_name");
	const phone = document.getElementById("phone");
	const address = document.getElementById("address");
	const detail_address = document.getElementById("detail_address");
	
	if (addressee.value == "" || address_name.value == "" || phone.value == "" || address.value == "") {
		
		const content = document.getElementById("validateContent");
		content.innerHTML = "";
		
		const validateModal = bootstrap.Modal.getOrCreateInstance("#addrValidateModal");
		if (addressee.value == "") {
			content.innerText = "받는사람을 입력하세요";
		}
		  else if (address_name.value == "") {
			content.innerText = "배송지명을 입력하세요";
		} else if (phone.value == "") {
			content.innerText = "연락처를 입력하세요";
		} else if (address.value == "") {
			content.innerText = "주소를 입력하세요";
		}
		
		validateModal.show();
		
		setTimeout(function() {
			validateModal.hide();
		}, 1000);
		
		return;
	}
	
	
	
	const xhr = new XMLHttpRequest();	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);

			modifyAddressModal();
			
			const addAddressModal = bootstrap.Modal.getOrCreateInstance("#addAddressModal");
			addAddressModal.hide();
			
			addressee.value = "";
			address_name.value = "";
			phone.value = "";
			address.value = "";
			detail_address.value = "";
		}
	}
	xhr.open("post", "/safari/user/addUserAddress");
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
	xhr.send("addressee=" + addressee.value + "&address_name=" + address_name.value + "&phone=" + phone.value + "&address=" + address.value + "  " + detail_address.value);	
}



// 전화번호 형식 변경 함수
function oninputPhone(target) {
    target.value = target.value
        .replace(/[^0-9]/g, '')
        .replace(/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
}


//주소 수정
function modifyAddress(id) {

	const addressee = document.querySelector("#addressee");
	const addressName = document.querySelector("#addressName");
	const deliveryAddress = document.querySelector("#deliveryAddress");
	const addressPhone = document.querySelector("#addressPhone");
	const addressMessage = document.querySelector("#addressMessage");
	
	const xhr = new XMLHttpRequest();	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			  addressee.innerText = response.selectedAddress.addressee;
			  addressName.innerText = response.selectedAddress.address_name; 
		      deliveryAddress.innerText = response.selectedAddress.address;
		      addressPhone.innerText = response.selectedAddress.phone;
		      
			 const modifyAddressModal = bootstrap.Modal.getOrCreateInstance("#modifyAddressModal");
			 modifyAddressModal.hide();
			/*  setTimeout(function() {
				 modifyAddressModal.hide();
				}, 1000);
 */
			
		}
	}
	
	xhr.open("get", "/safari/auction/changeAddressInOrderPage?id=" + id);
	xhr.send();
	
}




//카카오페이 결제 창
function kakaoPayModal() {
	
   const agreeCheckbox = document.getElementById("flexCheckDefault");
  
   // 동의 체크박스를 누르지 않으면 결제 창 띄우지 못하게 방지
   if (!agreeCheckbox.checked) {
    
	   const checkBoxModal = bootstrap.Modal.getOrCreateInstance("#checkBoxModal"); 
	   checkBoxModal.show();
		
		setTimeout(function() { // 1초 뒤 모달 창 삭제
			checkBoxModal.hide();
		}, 2000);
     return;
   }		
	
	
   const cid = 'TC0ONETIME';
   const partner_order_id = document.getElementById("bid").value;
   const partner_user_id = document.getElementById("user_id").value;
   const item_name = document.getElementById("title").value;

   const quantity = 1;
   const total_amount = document.getElementById("bid_price").value;
   const tax_free_amount = 0;
   const approval_url = "http://localhost:8181/safari/auction/paymentProcess";
   const cancel_url = "http://localhost:8181/safari/auction/successBidList";
   const fail_url = "http://localhost:8181/safari/auction/successBidList";
   
   const xhr = new XMLHttpRequest();
   
   xhr.onreadystatechange = function() {
	   if (xhr.readyState === XMLHttpRequest.DONE) {
	   if (xhr.status === 200) {
           const response = JSON.parse(xhr.responseText);

           // tid 무조건 받아와야함.
           const tid = response.tid;
          	

            const width = 600;
            const height = 600;
            const left = (window.screen.width - width) / 2;
            const top = (window.screen.height - height) / 2;
            const windowFeatures = "width=" + width + ",height=" + height + ",top=" + top + ",left=" + left + ",location=no,status=no,scrollbars=yes";
            const paymentWindow = window.open(response.next_redirect_pc_url, "_blank", windowFeatures);
            
            if (paymentWindow) {
               // 팝업이 정상적으로 열린 경우
               paymentWindow.focus();
            } else {
               // 팝업이 차단되었을 경우
               alert("팝업 차단이 감지되었습니다. 결제를 진행하려면 팝업 차단을 해제해주세요.");
            }
         
            // tid를 세션에 저장
            saveAuctionTidToSession(cid, partner_order_id, partner_user_id, tid, item_name, response.next_redirect_pc_url);
           
       } else {
    	   
       }
	   }
   };	
   
   
   xhr.open("POST", "https://kapi.kakao.com/v1/payment/ready");
   xhr.setRequestHeader("Authorization", "KakaoAK 88927c6d047da3940394d71e197276c3");
   xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
   xhr.send("cid="+cid+"&partner_order_id="+partner_order_id+"&partner_user_id="+partner_user_id+"&item_name="+item_name+
		   "&quantity="+quantity+"&total_amount="+total_amount+"&tax_free_amount="+tax_free_amount+
		   "&approval_url="+approval_url+"&cancel_url="+cancel_url+"&fail_url="+fail_url);
 
}



// tid 세션에 저장
 function saveAuctionTidToSession(cid, partner_order_id, partner_user_id, tid, item_name, 
		 next_redirect_pc_url, paymentWindow) {
	
	 	const xhr = new XMLHttpRequest();


	    xhr.onreadystatechange = function() {
	        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {

	        	// 에러 있음 고쳐야함 @@@@@@@@@@@@@@@@@@@
	              registerAddressInfoInPayment(partner_order_id);

	        	
	        }
	    };
	    
	    xhr.open("post", "/safari/auction/saveAuctionTidToSession");
	    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	    xhr.send("cid="+cid+"&partner_order_id="+partner_order_id+"&partner_user_id="+partner_user_id+"&tid="+tid+"&item_name="+item_name);	
		
}


// 결제 시 배송 정보 저장
function registerAddressInfoInPayment(partner_order_id) {
	
	const addressName = document.querySelector("#addressName").innerText;
	const deliveryAddress = document.querySelector("#deliveryAddress").innerText;
	const addressPhone = document.querySelector("#addressPhone").innerText;
	const addressMessage = document.querySelector("#addressMessage").value;
	

	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
		}
	}
   xhr.open("post", "/safari/auction/registerAddressInfoInPayment");
   xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
   xhr.send("id=" + partner_order_id + "&address=" + deliveryAddress + "&phone=" + addressPhone + "&delivery_message=" + addressMessage);	
}

//회원의 현재 보유 코인 조회
function getNowCoinBalance() {
 	
 		const xhr = new XMLHttpRequest();
 		
 		const coinBalance = document.querySelector("#coinBalance");
 	
 		xhr.onreadystatechange = function(){
 			if(xhr.readyState == 4 && xhr.status == 200){
 				const response = JSON.parse(xhr.responseText);
 				if(response.result == "success"){
 					coinBalance.innerText = new Intl.NumberFormat('ko-KR').format(response.coins);
 					userCoinBalance = response.coins;
 					getRemainCoinBalance(); 
 					
 					// 결제 버튼 활성화 여부 체크
 					const payButton = document.querySelector("#payButton");
 					
 					const bidPrice = document.querySelector("#bid_price");
 					
 					const bidPriceValue = parseInt(bidPrice.value);
 	
 					
 					if (response.coins < bidPriceValue) {
 						payButton.classList.remove("orangeButton");
 						payButton.style.backgroundColor = "#E2E3E5";
 						payButton.classList.add("fw-semibold", "opacity-50");
 						payButton.style.pointerEvents = "none";
 					}
 					
 					
 					
 					
 				}
 			}
 		}
 		
 		xhr.open("get", "/safari/user/getUserCoinBalance");
 		xhr.send();		
 	
 }

//스크롤이 맨 아래에 있는지 확인하는 함수
function isScrolledToBottom(element) {
  return element.scrollHeight - element.clientHeight <= element.scrollTop + 1;
}



window.addEventListener("DOMContentLoaded", function(){
	getSessionId();
	getMyAddressInfoInOrderPage();
	getNowCoinBalance();

});
</script>
</body>	
</html>