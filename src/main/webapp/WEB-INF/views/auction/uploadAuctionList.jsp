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

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<link rel="stylesheet" href="/safari/resources/style/common.css" type="text/css">
<link rel="stylesheet" href="/safari/resources/style/auction.css" type="text/css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<style>
.overflow {
  white-space: nowrap; /* 텍스트를 한 줄로 표시 */
  overflow: hidden; /* 넘친 텍스트를 숨김 */
  text-overflow: ellipsis; /* 넘친 텍스트를 "..."으로 표시 */
}
.text-orange {
	color:#ff6f0f;
}
.orangeButton{
	background: #ff6f0f;
	font-weight: bold;
	color: white;
}
.custom-table-secondary {
  background-color: #f4f4f4!important; /* 원하는 연한 색상으로 변경 */
}
</style>

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
					<h5>내가 올린 경매 내역</h5>						
				</div>
			</div>
			
			
			<div class="row mt-4">
				<div class="col">
				
					
					<div class="row">
						<div class="col">
							• &nbsp; 경매가 종료된 후, 낙찰자가 <span class="fw-semibold">7일 이내</span>에 결제하지 않으면 경매를 재시작하실 수 있습니다.
						</div>
					</div>		
					
					
					<div class="row mt-4">
						<div class="col fw-semibold fs-5">
						 	 종료된 경매 결제 현황
						</div>
					</div>
					
					<div class="row mt-2">
						<div class="col">
							<table class="table align-middle">
								<thead class="table-light">
									<tr class="text-center">
										<td>상품정보</td>
										<td>낙찰자</td>
										<td>낙찰가</td>
										<td>경매종료일</td>
										<td>상태</td>
									</tr>
								</thead>
							<tbody>
							   <c:if test="${empty endedAuctionList}">
							        <tr>
							            <td colspan="5" class="text-center">종료된 경매가 없습니다.</td>
							        </tr>
							    </c:if>					
								<c:forEach items="${endedAuctionList}" var="endedBidDto">
									<%-- <input type="hidden" id="user_id_${bidDto.auction_item_id}" value="${sessionUser.id}"> --%>
										<tr>
											<td>
												<div class="row">
								
													<div class="col-3">
														<a href="/safari/auction/productDetail/${endedBidDto.auction_item_id}">
														<img 
														src="/auctionFiles/${endedBidDto.auction_item_img_link}" style="
														width: 120px; height: 120px;"></a>
													</div>
													<div class="col ms-2">
														<div class="row mt-4">
															<div class="col" style="font-size: 14px;">
																${endedBidDto.main_category_name} > ${endedBidDto.sub_category_name}
															</div>
														</div>
														<div class="row">
															<div class="col fw-semibold">
															<input type="hidden" value="${endedBidDto.auction_item_id}">
																<span style="font-size: 16px;"><a href="/safari/auction/productDetail/${endedBidDto.auction_item_id}">
																${endedBidDto.title}</a></span>
															<input type="hidden" id="title_${endedBidDto.auction_item_id}" value="${endedBidDto.title}">	
															</div>
														</div>
													</div>									
												</div>
											</td>
											<td class="text-center">
												${endedBidDto.nickname}
											</td>
											<td class="text-center">
												<span class= "fw-bold" style="font-size: 18px;"><fmt:formatNumber value="${endedBidDto.bid_price}"  pattern="#,###"/></span> 원
												<input type="hidden" id="bid_price_${endedBidDto.auction_item_id}" value="${endedBidDto.bid_price}">
											</td>
											
											<td class="text-center">
												<fmt:formatDate value="${endedBidDto.end_date}" pattern="yyyy.MM.dd" />
												<br>
												<fmt:formatDate value="${endedBidDto.end_date}" pattern="a hh:mm" />
											</td>
											<td class="text-center">
											
											
													<div class="row">
														<div class="col" id="payStatus_${endedBidDto.id}">
															
														</div>
													</div>
													<div class="row mt-2">
													<%-- ajax --%>
														<div class="col" id="processStatus_${endedBidDto.id}">
															
														</div>
														<%-- ajax --%>
													</div>												
												
													
													
											</td>							
										</tr>
								</c:forEach>
								</tbody>								
							</table>		
						</div>
					</div>
					
					
					
					

				
				<div class="row mt-4">
						<div class="col fw-semibold fs-5">
							전체 경매 목록
						</div>
				</div>
				
				<c:if test="${empty noBidAuctionList}">
					<div class="row mt-4">
						<div class="col text-center" style="font-size: 18px">
						
							<div class="row mt-4">
								<div class="col">
									정보가 없습니다.
								</div>
							</div>
						</div>
					</div>	
				</c:if>					
				<div class="row mt-4">
					<c:forEach items="${noBidAuctionList}" var="auction">
						<div class="col-3 mb-3">
							
							<div class="row">
								<div class="col">
									<a href="/safari/auction/productDetail/${auction.id}" class="text-decoration-none d-inline-block">
											  <img src="/auctionFiles/${auction.auction_item_img_link}" class="img-fluid" alt="..." 
											  	 style="height: 180px;">
									</a>
								</div>
							</div>
							
							
							<div class="row mt-2">
								<div class="col fw-medium overflow" style="width: 200px;">
									<a href="/safari/auction/productDetail/${auction.id}">
									   ${auction.title}</a>
								</div>
							</div>
							
				
						</div>
					</c:forEach>
				</div>									
					
																		
				
				</div>
			</div>
			
		
		
		</div>
	</div>
	</div>
	


	
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->
	

<%-- 배송 alert --%>
<div class="modal" id="startDeliveryModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered"> 
    <div class="modal-content">
      <div class="modal-header">
      		<h5 class="modal-title"></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
      	
      	<div class="row text-center">
    		<div class="col"> 
    			해당 상품을 배송하시겠습니까?
    		</div>
       </div>
  
      </div>
      
      <div class="modal-footer">
      	<input type="button" class="btn orangeButton" value="확인" onclick="startDelivery()">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>      
   
    </div>
  </div>
</div>
<%-- 배송 alert --%>

<%-- 주문 조회 --%>
<div class="modal" id="checkDeliveryModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered"> 
    <div class="modal-content">
      <div class="modal-header bg-light">
     	 <div class="row mb-0">
      			<div class="col ms-4 fs-5 fw-semibold">주문/배송 조회</div>
      		</div>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
      	
      	<div class="row">
      		<div class="col-11 ms-4">
      		
      			<div class="row mt-2">
      				<div class="col">
      					
      					<div class="row">
      						<div class="col fw-semibold" style="font-size:18px;">
      							상품 정보
      						</div>
      					</div>
      					
						<div class="row mt-2">
							<%-- 이미지 --%>
							<div class="col" id="productImage">
							
							</div>
							<%-- 이미지 --%>
							
							<%-- 상품 제목 --%>
							<div class="col-10">
							
								<div class="row">
									<div class="col">
										<span id="productMainCategoryName" style="font-size: 14px;"></span>
										<span style="font-size: 14px;" class="m-1"> > </span>
										<span id="productSubCategoryName" style="font-size: 14px;"></span>
									</div>
									
								</div>
								
								<div class="row">
									<div class="col fw-semibold py-0" id="productTitle" style="font-size: 18px;">
									
									</div>
								</div>
								
								<div class="row mt-1">
									<div class="col" id="auctionStartInfo" style="font-size: 14px;">
									
									</div>
								</div>
								
								<div class="row">
									<div class="col" id="auctionEndInfo" style="font-size: 14px;">
									
									</div>
								</div>
				
							</div>
							<%-- 상품 제목  --%>
							
						</div>
						
						<div class="row mt-4">
							<div class="col">
								<div class="row">
									<div class="col fw-semibold" style="font-size:18px;">
										구매자 정보
									</div>
								</div>
								
								<div class="row mt-2">
									<div class="col">
										<table class="table">
											<tr class="border-top">
												<td class="custom-table-secondary text-center" style="width: 100px;">이름</td>
												<td> <span class="ms-2" id="buyerName"></span></td>
											</tr>
											<tr>
												<td class="custom-table-secondary text-center" style="width: 100px;">이메일</td>
												<td> <span class="ms-2" id="buyerEmail"></span></td>
											</tr>
											<tr>
												<td class="custom-table-secondary text-center" style="width: 100px;">휴대폰번호</td>
												<td><span class="ms-2" id="buyerPhone"></span></td>
											</tr>
										
										</table>
									
									</div>
								</div>
							</div>
							<div class="col">
								<div class="row">
									<div class="col fw-semibold" style="font-size:18px;">
										결제 정보
									</div>
								</div>
								
								<div class="row mt-2">
									<div class="col ms-3 border border-1 rounded-3 p-3 ">
									
										<div class="row mt-1">
											<div class="col">
												
												<div class="row">
													<div class="col text-secondary">
														결제금액
													</div>
												</div>
												
												<div class="row mt-1">
													<div class="col text-secondary">
														결제일
													</div>
												</div>
											
												<div class="row mt-1">
													<div class="col text-secondary">
														결제수단
													</div>
												</div>											
											
											
											</div>
											<div class="col-8">
											
												<div class="row">
													<div class="col text-end py-0">
														<span class="fw-semibold text-danger" id="payPrice"> </span> 원
													</div>
												</div>
												
												<div class="row mt-1">
													<div class="col text-end">
														<span id="payDate"></span>
													</div>
												</div>
											
												<div class="row mt-1">
													<div class="col text-end">
														카카오페이
													</div>
												</div>															
											
											
											</div>
											
										</div>
									
									
									</div>
								</div>
							
							
							</div>
						</div>
						
						
						<div class="row mt-3">
							<div class="col fw-semibold" style="font-size:18px;">
								배송 정보
							</div>
							<div class="col text-end" style="position: relative; top: 5px;">
								배송시작일 <span id="deliveryStartDate"></span>
							</div>
						</div>
						
						<div class="row mt-2 mb-5 text-center">
							<div class="col ms-3">
								<div class="row">
		      						<div class="col px-auto mx-auto">
		      							<i class="bi bi-boxes mt-1 ms-2" style="font-size: 32px;"></i>
		      						</div>
		      						<div class="col fw-medium my-auto"> > </div>
		      						<div class="col px-auto mx-auto">
		      							<i class="bi bi-truck mt-1 " style="font-size: 32px;"></i>
		      						</div>
		      						<div class="col fw-medium my-auto"> > </div>
		      						<div class="col  px-auto mx-auto"> 
		      							<i class="bi bi-bag-check mt-1" style="font-size: 32px; "></i>
		      							
		      						</div>
		      						<div class="col  fw-medium my-auto"> > </div>
		      						<div class="col  px-auto mx-auto">
		      							<i class="bi bi-check-lg mt-1" style="font-size: 28px;"></i>
		      							
		      						</div>
		      					</div>
		      					
		      					  <div class="row fw-medium">
		      						<div class="col px-auto mx-auto" id="ds_deliveryReady">
		      							배송준비중
		      						</div>
		      						<div class="col fw-medium">  </div>
		      						<div class="col px-auto mx-auto" id="ds_deliveryIng">
		      							배송중
		      						</div>
		      						<div class="col fw-medium">  </div>
		      						<div class="col px-auto mx-auto" id="ds_deliveryComplete">
		      							배송완료
		      						</div>
		      						<div class="col fw-medium">  </div>
		      						<div class="col px-auto mx-auto" id="ds_buyComplete">
		      							구매확정
		      						</div>
		      					</div>							
							
							</div>
						
						</div>
						
						
						<div class="row mt-2">
	      					<div class="col fw-semibold" style="font-size:18px;">
	      						배송 상세 정보
	      					</div>
	      				</div>
	      				
	      				<div class="row mt-1">
							<div class="col fw-bold text-secondary">배송지</div>
							<div class="col-8 text-end" id="deliveryAddress"></div>
						</div>
	      				
	      				<div class="row mt-1">
							<div class="col fw-bold text-secondary">연락처</div>
							<div class="col-8 text-end" id="paymentPhone"></div>
						</div>
						
						<div class="row mt-1 mb-4">
							<div class="col fw-bold text-secondary">배송요청사항</div>
							<div class="col-8 text-end" id="paymentMessage"></div>
						</div>
				
      					
      				</div>
      			</div>
 				
      	
      		
      		</div>
      	
      	</div>
      
      	
      	
      
      <div class="modal-footer">
      	
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창닫기</button>
      </div>      
   
    </div>
  </div>
</div>
</div>
<%-- 주문 조회 --%>



<%-- 배송시작 전 주문 조회 --%>
<div class="modal" id="checkOrderModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered"> 
    <div class="modal-content">
      <div class="modal-header bg-light">
     	 <div class="row mb-0">
      			<div class="col ms-4 fs-5 fw-semibold">주문 조회</div>
      		</div>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
      	
      	<div class="row">
      		<div class="col-11 ms-4">
      		
      			<div class="row mt-2">
      				<div class="col">
      					
      					<div class="row">
      						<div class="col fw-semibold" style="font-size:18px;"> 
      							상품 정보
      						</div>
      					</div>
      					
						<div class="row mt-2">
							<%-- 이미지 --%>
							<div class="col" id="productOrderImage">
							
							</div>
							<%-- 이미지 --%>
							
							<%-- 상품 제목 --%>
							<div class="col-10">
							
								<div class="row">
									<div class="col">
										<span id="productOrderMainCategoryName" style="font-size: 14px;"></span>
										<span style="font-size: 14px;" class="m-1"> > </span>
										<span id="productOrderSubCategoryName" style="font-size: 14px;"></span>
									</div>
								</div>
								
								<div class="row">
									<div class="col fw-semibold py-0" id="productOrderTitle" style="font-size: 18px;">
									
									</div>
								</div>
								
								<div class="row mt-1">
									<div class="col" id="auctionOrderStartInfo" style="font-size: 14px;">
									
									</div>
								</div>
								
								<div class="row">
									<div class="col" id="auctionOrderEndInfo" style="font-size: 14px;">
									
									</div>
								</div>
				
							</div>
							<%-- 상품 제목  --%>
							
						</div>
						
						
						<div class="row mt-4">
							<div class="col">
								<div class="row">
									<div class="col fw-semibold" style="font-size:18px;">
										구매자 정보
									</div>
								</div>
								
								<div class="row mt-2">
									<div class="col">
										<table class="table">
											<tr class="border-top">
												<td class="custom-table-secondary text-center" style="width: 100px;">이름</td>
												<td> <span class="ms-2" id="buyerNameOrder"></span></td>
											</tr>
											<tr>
												<td class="custom-table-secondary text-center" style="width: 100px;">이메일</td>
												<td> <span class="ms-2" id="buyerEmailOrder"></span></td>
											</tr>
											<tr>
												<td class="custom-table-secondary text-center" style="width: 100px;">휴대폰번호</td>
												<td><span class="ms-2" id="buyerPhoneOrder"></span></td>
											</tr>
										
										</table>
									
									</div>
								</div>
							</div>
							<div class="col">
								<div class="row">
									<div class="col fw-semibold" style="font-size:18px;">
										결제 정보
									</div>
								</div>
								
								<div class="row mt-2">
									<div class="col ms-3 border border-1 rounded-3 p-3 ">
									
										<div class="row mt-1">
											<div class="col">
												
												<div class="row">
													<div class="col text-secondary">
														결제금액
													</div>
												</div>
												
												<div class="row mt-1">
													<div class="col text-secondary">
														결제일
													</div>
												</div>
											
												<div class="row mt-1">
													<div class="col text-secondary">
														결제수단
													</div>
												</div>											
											
											
											</div>
											<div class="col-9">
											
												<div class="row">
													<div class="col text-end py-0">
														<span class="fw-semibold text-danger" id="payPriceOrder"> </span> 원
													</div>
												</div>
												
												<div class="row mt-1">
													<div class="col text-end">
														<span id="payDateOrder"></span>
													</div>
												</div>
											
												<div class="row mt-1">
													<div class="col text-end">
														카카오페이
													</div>
												</div>															
											
											
											</div>
											
										</div>
									
									
									</div>
								</div>
							
							
							</div>
						</div>
						
						
						
						<div class="row mt-2">
	      					<div class="col fw-semibold" style="font-size:18px;">
	      						배송 상세 정보
	      					</div>
	      				</div>
	      				
	      				<div class="row mt-1">
							<div class="col fw-bold text-secondary">배송지</div>
							<div class="col-8 text-end" id="deliveryAddressOrder"></div>
						</div>
	      				
	      				<div class="row mt-1">
							<div class="col fw-bold text-secondary">연락처</div>
							<div class="col-8 text-end" id="paymentPhoneOrder"></div>
						</div>
						
						<div class="row mt-1 mb-4">
							<div class="col fw-bold text-secondary">배송요청사항</div>
							<div class="col-8 text-end" id="paymentMessageOrder"></div>
						</div>
						
						
      					
      				</div>
      			</div>
      		</div>
      	</div>
      
      <div class="modal-footer">
      	
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창닫기</button>
      </div>      
   
    </div>
  </div>
</div>
</div>
<%-- 배송 전 주문 조회 --%>



<script>

// 배송보낼 pk
let deliveryPk = null;

//날짜 변환 함수	
function formatTime(timestamp) {
	  const date = new Date(timestamp);
	  const year = date.getFullYear();
	  const month = String(date.getMonth() + 1).padStart(2, '0');
	  const day = String(date.getDate()).padStart(2, '0');
	  let hours = date.getHours();
	  let period = '오전';

	  if (hours >= 12) {
	    hours -= 12;
	    period = '오후';
	  }

	  if (hours === 0) {
	    hours = 12;
	  }

	  const minutes = String(date.getMinutes()).padStart(2, '0');
	  const formattedDate = year + '-' + month + '-' + day + "\u00a0\u00a0" + period + ' ' + hours + ':' + minutes;
	  return formattedDate;
	}

// 배송 시작 물어보는 모달
function startDeliveryModal(id) {
	
	deliveryPk = id;
	
	const startDeliveryModal = bootstrap.Modal.getOrCreateInstance("#startDeliveryModal");
	
	startDeliveryModal.show();
	
}

// 배송 이전 주문 내역 모달
function checkOrderModal(id) {
	

	const xhr = new XMLHttpRequest();
	  xhr.onreadystatechange = function() {
	    if (xhr.readyState === 4 && xhr.status === 200) {
	      const response = JSON.parse(xhr.responseText);
	      
	      showOrderDeliveryDetail(id);
	      
		  const productImageBox = document.querySelector("#productOrderImage");
	      productImageBox.innerHTML = "";
	      
	      const imageRow = document.createElement("div");
	      imageRow.classList.add("row");
			 
		  const imageCol = document.createElement("div");
		  imageCol.classList.add("col");
			
		  const productImageLink = document.createElement("a");
		  productImageLink.href = "/safari/auction/productDetail/" + response.orderDeliveryInfo.auction_item_id;
		  
		  const productImage = document.createElement("img");
		  productImage.classList.add("img-fluid");
		  productImage.src = "/auctionFiles/" + response.orderDeliveryInfo.auction_item_img_link;
		  
		  productImageLink.appendChild(productImage);
		  imageCol.appendChild(productImageLink);
		 
		  imageRow.appendChild(imageCol);
		  
		  productImageBox.appendChild(imageRow);
		  
		  const mainCategoryName = document.querySelector("#productOrderMainCategoryName");
		  mainCategoryName.innerText = response.orderDeliveryInfo.main_category_name;
		  const subCategoryName = document.querySelector("#productOrderSubCategoryName");
		  subCategoryName.innerText =  response.orderDeliveryInfo.sub_category_name;
		  
		// 상품 제목 //
      	 const productTitleBox = document.querySelector("#productOrderTitle");
      	 productTitleBox.innerHTML = "";
      	 
		 const titleRow = document.createElement("div");
		 titleRow.classList.add("row");
		 
		 const titleCol = document.createElement("div");
		 titleCol.classList.add("col");
      	 
      	 const titleLink = document.createElement("a");
      	 titleLink.href = "/safari/auction/productDetail/" + response.orderDeliveryInfo.auction_item_id;
      	 titleLink.innerText = response.orderDeliveryInfo.title; 
      	 
      	 titleCol.appendChild(titleLink);
      	 titleRow.appendChild(titleCol);
      	 
      	 productTitleBox.appendChild(titleRow);
      	// 상품 제목 //
	      	
	      	// 경매 정보 // 
	      	const startDateBox = document.querySelector("#auctionOrderStartInfo");
	      	const startDate = new Date(response.orderDeliveryInfo.start_date);
	      	startDateBox.innerText = "경매시작일 : " + formatTime(startDate);
	      	
	      	const endDateBox = document.querySelector("#auctionOrderEndInfo");
	      	const endDate = new Date(response.orderDeliveryInfo.end_date);
	      	endDateBox.innerText = "경매종료일 : " + formatTime(endDate);
	      	
	      	// 구매자 정보 //
	      	const buyerName = document.querySelector("#buyerNameOrder");
	      	const buyerEmail = document.querySelector("#buyerEmailOrder");
	      	const buyerPhone = document.querySelector("#buyerPhoneOrder");
	      	
	      	buyerName.innerText = response.orderDeliveryInfo.nickname;
	      	buyerEmail.innerText = response.orderDeliveryInfo.email;
	      	buyerPhone.innerText = response.orderDeliveryInfo.phone;
	      	
	      	const payPrice = document.querySelector("#payPriceOrder");
	      	const payDateBox = document.querySelector("#payDateOrder");
	      	
	      	payPrice.innerText = new Intl.NumberFormat('ko-KR').format(response.orderDeliveryInfo.bid_price);
	      	const payDate = new Date(response.orderDeliveryInfo.payment_reg_date);
	      	payDateBox.innerText = formatTime(payDate);
		  

		   const checkOrderModal = bootstrap.Modal.getOrCreateInstance("#checkOrderModal");
	
	       checkOrderModal.show();
	
	    }
	  }
	
  xhr.open("get", "/safari/auction/getEndedAuctionOrderAndDeliveryInfo?id=" + id);
  xhr.send();
}

// 베송 상세 정보
function showOrderDeliveryDetail(id) {
	
	const xhr = new XMLHttpRequest();
	
	 xhr.onreadystatechange = function() {
   	 if (xhr.readyState === 4 && xhr.status === 200) {
       	 
       	const response = JSON.parse(xhr.responseText);
       	
       	const deliveryAddress = document.querySelector("#deliveryAddressOrder");
       	const paymentPhone = document.querySelector("#paymentPhoneOrder");
       	const paymentMessage = document.querySelector("#paymentMessageOrder");
       	deliveryAddress.innerHTML = "";
       	paymentPhone.innerHTML = "";
       	paymentMessage.innerHTML = "";
       
       	if (response.addressDetail && response.addressDetail.address) {
       		deliveryAddress.innerText = response.addressDetail.address;
       		paymentPhone.innerText =  response.addressDetail.phone;
       		paymentMessage.innerText =  response.addressDetail.delivery_message;
       	} else {
       		
       	}
       	
   	 }
	 } 	 
	
	 xhr.open("get", "/safari/auction/getAddressInfoInPaymentAndDelivery?id=" + id);
	 xhr.send();	
	
}

//배송 상세 정보 조회하기
function showDeliveryDetail(id) {
	
	const xhr = new XMLHttpRequest();
	
	 xhr.onreadystatechange = function() {
    	 if (xhr.readyState === 4 && xhr.status === 200) {
        	 
        	const response = JSON.parse(xhr.responseText);
        	
        	const deliveryAddress = document.querySelector("#deliveryAddress");
        	const paymentPhone = document.querySelector("#paymentPhone");
        	const paymentMessage = document.querySelector("#paymentMessage");
        	deliveryAddress.innerHTML = "";
        	paymentPhone.innerHTML = "";
        	paymentMessage.innerHTML = "";
        
        	if (response.addressDetail && response.addressDetail.address) {
        		deliveryAddress.innerText = response.addressDetail.address;
        		paymentPhone.innerText =  response.addressDetail.phone;
        		paymentMessage.innerText =  response.addressDetail.delivery_message;
        	} else {
        		console.log("주소 정보 없음");
        	}
        	
    	 }
	 } 	 
	
	 xhr.open("get", "/safari/auction/getAddressInfoInPaymentAndDelivery?id=" + id);
	 xhr.send();	

}


// 주문 내역, 배송 조회 모달
function checkDeliveryModal(id) {
	
	// 배송진행상태

	const ds_deliveryReady = document.querySelector("#ds_deliveryReady");
	const icon_deliveryReady = document.querySelector(".bi-boxes");
	
	const ds_deliveryIng = document.querySelector("#ds_deliveryIng");
	const icon_deliveryIng = document.querySelector(".bi-truck");
	
	const ds_deliveryComplete = document.querySelector("#ds_deliveryComplete");
	const icon_eliveryComplete = document.querySelector(".bi-bag-check");
	
	const ds_buyComplete = document.querySelector("#ds_buyComplete");
	const icon_buyComplete = document.querySelector(".bi-check-lg");
	
    // 배송 진행 상태 아이콘의 text-danger 클래스 제거

    ds_deliveryReady.classList.remove("text-orange");
    icon_deliveryReady.classList.remove("text-orange");
    
    ds_deliveryIng.classList.remove("text-orange");
    icon_deliveryIng.classList.remove("text-orange");
    
    ds_deliveryComplete.classList.remove("text-orange");
    icon_eliveryComplete.classList.remove("text-orange");
    
    ds_buyComplete.classList.remove("text-orange");
    icon_buyComplete.classList.remove("text-orange");
	
	const xhr = new XMLHttpRequest();
	  xhr.onreadystatechange = function() {
	    if (xhr.readyState === 4 && xhr.status === 200) {
	      const response = JSON.parse(xhr.responseText);
	      
	      showDeliveryDetail(id);
	
		  const productImageBox = document.querySelector("#productImage");
	      productImageBox.innerHTML = "";
	      
	      const imageRow = document.createElement("div");
  	      imageRow.classList.add("row");
  	    
  	      const imageCol = document.createElement("div");
		  imageCol.classList.add("col");
		  
		  const productImageLink = document.createElement("a");
		  productImageLink.href = "/safari/auction/productDetail/" + response.orderDeliveryInfo.auction_item_id;
			
		  const productImage = document.createElement("img");
		  productImage.classList.add("img-fluid");
		  productImage.src = "/auctionFiles/" + response.orderDeliveryInfo.auction_item_img_link;
		  
		  productImageLink.appendChild(productImage);
		  imageCol.appendChild(productImageLink);
      	  imageRow.appendChild(imageCol);
		  productImageBox.appendChild(imageRow);
		  
		  const mainCategoryName = document.querySelector("#productMainCategoryName");
		  mainCategoryName.innerText = response.orderDeliveryInfo.main_category_name;
		  const subCategoryName = document.querySelector("#productSubCategoryName");
		  subCategoryName.innerText =  response.orderDeliveryInfo.sub_category_name;
		  
		 // 상품 제목 //
      	 const productTitleBox = document.querySelector("#productTitle");
      	 productTitleBox.innerHTML = "";
    
      	 
		 const titleRow = document.createElement("div");
		 titleRow.classList.add("row");
		 
		 const titleCol = document.createElement("div");
		 titleCol.classList.add("col");
      	 
      	 const titleLink = document.createElement("a");
      	 titleLink.href = "/safari/auction/productDetail/" + response.orderDeliveryInfo.auction_item_id;
      	 titleLink.innerText = response.orderDeliveryInfo.title; 
      	 
      	 titleCol.appendChild(titleLink);
      	 titleRow.appendChild(titleCol);
      	 
      	 productTitleBox.appendChild(titleRow);
      	 
      	 
      	// 상품 제목 //
      	
      	// 경매 정보 // 
      	const startDateBox = document.querySelector("#auctionStartInfo");
      	const startDate = new Date(response.orderDeliveryInfo.start_date);
      	startDateBox.innerText = "경매시작일 : " + formatTime(startDate);
      	
      	const endDateBox = document.querySelector("#auctionEndInfo");
      	const endDate = new Date(response.orderDeliveryInfo.end_date);
      	endDateBox.innerText = "경매종료일 : " + formatTime(endDate);
      	
      	// 구매자 정보 //
      	const buyerName = document.querySelector("#buyerName");
      	const buyerEmail = document.querySelector("#buyerEmail");
      	const buyerPhone = document.querySelector("#buyerPhone");
      	
      	buyerName.innerText = response.orderDeliveryInfo.nickname;
      	buyerEmail.innerText = response.orderDeliveryInfo.email;
      	buyerPhone.innerText = response.orderDeliveryInfo.phone;
      	
      	const payPrice = document.querySelector("#payPrice");
      	const payDateBox = document.querySelector("#payDate");
      	
      	payPrice.innerText = new Intl.NumberFormat('ko-KR').format(response.orderDeliveryInfo.bid_price);
      	const payDate = new Date(response.orderDeliveryInfo.payment_reg_date);
      	payDateBox.innerText = formatTime(payDate);
      	
      	const deliveryStartDateBox = document.querySelector("#deliveryStartDate");
      	const deliveryStartDate =  new Date(response.orderDeliveryInfo.delivery_reg_date);
      	deliveryStartDateBox.innerText = formatTime(deliveryStartDate);
      	
      	console.log(response.orderDeliveryInfo.delivery_status);
      	console.log(response.orderDeliveryInfo.purchase_confirmed_exists)
       	if (response.orderDeliveryInfo.purchase_confirmed_exists == "No") {
       		if(response.orderDeliveryInfo.delivery_status == "배송중") {
    			ds_deliveryIng.classList.add("text-orange");
    			icon_deliveryIng.classList.add("text-orange");
    			
    		} else if (response.orderDeliveryInfo.delivery_status == "배송완료") {
    			ds_deliveryComplete.classList.add("text-orange");
    			icon_eliveryComplete.classList.add("text-orange");
    		}
    		
    	} else {
    		
    		 ds_buyComplete.classList.add("text-orange");
    	     icon_buyComplete.classList.add("text-orange");
    	}
      	
      	
      	// 구매자 정보 //

		const checkDeliveryModal = bootstrap.Modal.getOrCreateInstance("#checkDeliveryModal");
		checkDeliveryModal.show();
	    
	    }
	  }
	
	  xhr.open("get", "/safari/auction/getEndedAuctionOrderAndDeliveryInfo?id=" + id);
	  xhr.send();
		
	
}


// 종료된 경매 결제 현황 상태바 (결제 완료된거)
function reloadPayAndDeliveryStatus() {
	
	const xhr = new XMLHttpRequest();
	  xhr.onreadystatechange = function() {
	    if (xhr.readyState === 4 && xhr.status === 200) {
	      const response = JSON.parse(xhr.responseText);
	      
	     
	      
	      for (data of response.endedAuctionList) {
	    	  
	    	  const payStatus = document.getElementById("payStatus_" + data.id);
	    	  const processStatus = document.getElementById("processStatus_" + data.id);
	    	  
	    	  const orderInfoButton = document.createElement("input");
	    	  orderInfoButton.type="button";
	    	  orderInfoButton.classList.add("btn", "btn-sm", "btn-outline-secondary");
	    	  orderInfoButton.value = "주문조회";
	    	  
	    	  payStatus.innerHTML = "";
	    	  processStatus.innerHTML ="";
	    	  
	    	  
              let statusButton = document.createElement("input");
              statusButton.type = "button";
              statusButton.classList.add("btn", "btn-sm");
              
	    	  // 결제 완료되었을 때
	    	  if (data.payment_exists == 'Yes') {
	    		  
	    		  // 배송 미처리
	    		  if (data.delivery_exists == 'No') {
	    			  payStatus.innerText = "결제완료";
	    			  
	    			  const row = document.createElement("div");
	    			  row.classList.add("row");
	    			  
	    			  const col = document.createElement("div");
	    			  col.classList.add("col");
	    			  
	    			  orderInfoButton.setAttribute("onclick", "checkOrderModal(" + data.id + ")");
	    			  
	    			  col.appendChild(orderInfoButton);
	    			  row.appendChild(col);
	    			  
	    			  const row1 = document.createElement("div");
	    			  row1.classList.add("row", "mt-1");
	    			  
	    			  const col1 = document.createElement("div");
	    			  col1.classList.add("col");
	    			  
	    			  statusButton.classList.add("btn-outline-secondary");
					  statusButton.value = "배송하기";
					  statusButton.setAttribute("onclick", "startDeliveryModal(" + data.id + ")");
					 
	    			  col1.appendChild(statusButton);
					  row1.appendChild(col1);	    			  
	
	    	          processStatus.appendChild(row);
	    	          processStatus.appendChild(row1);
	    			 
	    		  } 
	    		  // 배송 처리
	    		  else  {
	    			  
	    			 const deliveryRegDate = new Date(data.delivery_reg_date);
	    			 // 나중에 3일로 변경 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		    		 const threeDaysLater = new Date(deliveryRegDate.setDate(deliveryRegDate.getDate() + 1));
		    		 
		    		 const nowDate = new Date();
		    		 
		    		 if (nowDate > threeDaysLater) {
		    			 if (data.purchase_confirmed_exists == 'No') {
		    			 	payStatus.innerText = "배송완료";
		    			 } else {
		    				 payStatus.innerText = "구매확정";
		    			 }
		    		 } else {
		    			 payStatus.innerText = "배송중";

		    		 }
		    		 statusButton.classList.add("btn-outline-secondary");
	    			 statusButton.value = "주문조회";
	    			 statusButton.setAttribute("onclick", "checkDeliveryModal(" + data.id + ")");
	    			 
	    			 processStatus.appendChild(statusButton);
	    			 
	    		  }
	    		  
	    	  }
	    	  // 결제 대기중일때
	    	  else {
	    		  payStatus.innerText = "결제대기중";
	    		  
	    	  }
	      	}
	    
	    
	    }
	  } 
      xhr.open("get", "/safari/auction/selectEndedAuctionInfo/");
      xhr.send();
	
}

// 판매자 - 배송하기
function startDelivery() {
	
	const id = deliveryPk;
	
	const xhr = new XMLHttpRequest();
	  xhr.onreadystatechange = function() {
	    if (xhr.readyState === 4 && xhr.status === 200) {
	      const response = JSON.parse(xhr.responseText);

	      deliveryPk = null;
	      
		  const startDeliveryModal = bootstrap.Modal.getOrCreateInstance("#startDeliveryModal");
		  startDeliveryModal.hide();
		  
		  reloadPayAndDeliveryStatus();
	      
	    }
	  }
	  
      xhr.open("get", "/safari/auction/startAuctionDelivery?partnerOrderId=" + id);
      xhr.send();
}



//경매 종료일로부터의 카운트다운 함수
function countdownFromEndDate(endDate) {
	  // 현재 시간
	  var current = new Date();

	  // 차이 계산 (밀리초 단위)
	  var difference = endDate.getTime() - current.getTime();

	  // 차이를 일, 시간, 분, 초로 변환
	  var days = Math.floor(difference / (1000 * 60 * 60 * 24));
	  difference -= days * 1000 * 60 * 60 * 24;
	  
	  var hours = Math.floor(difference / (1000 * 60 * 60));
	  difference -= hours * 1000 * 60 * 60;
	  
	  var minutes = Math.floor(difference / (1000 * 60));
	  difference -= minutes * 1000 * 60;
	  
	  var seconds = Math.floor(difference / 1000);

	  // 결과 반환
	  return {
	    days: days > 0 ? days : "",
	    hours: hours,
	    minutes: minutes,
	    seconds: seconds
	  };
	}
	
// 경매 시작일로부터의 카운트다운 함수
function countdownFromStartDate(startDate) {
  // 현재 시간
  var current = new Date();

  // 차이 계산 (밀리초 단위)
  var difference = startDate.getTime() - current.getTime();


  // 차이를 일, 시간, 분, 초로 변환
  var days = Math.floor(difference / (1000 * 60 * 60 * 24));
  difference -= days * 1000 * 60 * 60 * 24;
  
  var hours = Math.floor(difference / (1000 * 60 * 60));
  difference -= hours * 1000 * 60 * 60;
  
  var minutes = Math.floor(difference / (1000 * 60));
  difference -= minutes * 1000 * 60;
  
  var seconds = Math.floor(difference / 1000);

  // 결과 반환
  return {
    days: days,
    hours: hours,
    minutes: minutes,
    seconds: seconds
  };
}





// 배송처리 페이지 띄우기
function shippingPage() {
	
	const shippingModal = bootstrap.Modal.getOrCreateInstance("#shippingModal");
	shippingModal.show();
	
}

window.addEventListener("DOMContentLoaded", function(){

	reloadPayAndDeliveryStatus();
});
 




</script>

<!-- Modal -->
<div class="modal modal-lg" id="shippingModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">배송 처리</h1> 
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
  		<%-- 시작 --%>   
  			
  		<%-- 끝 --%>
      </div>
   
    </div>
  </div>
</div>
<!-- Modal -->






</body>
</html>