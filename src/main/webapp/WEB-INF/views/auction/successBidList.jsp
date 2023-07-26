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
.orangeButton{
	background: #ff6f0f;
	font-weight: bold;
	color: white;
}
.text-orange {
	color:#ff6f0f;
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
					<h5>낙찰 내역</h5>						
				</div>
			</div>
			
	
			
			<div class="row mt-4">
				<div class="col">
				
					<div class="row">
						<div class="col">
							<span>
								<i class="bi bi-exclamation-circle fs-5 me-1"></i></span>
									<span class="fw-semibold fs-5">참고사항</span>
						
						</div>
					</div>	
					
					<div class="row">
						<div class="col">
							경매종료일로부터 <span class="fw-bold text-danger">7일 이내</span>에 결제하셔야 판매자로부터 제품을 수령받으실 수 있습니다.
						</div>
					</div>		
					
					
					<div class="row mt-4 mb-2">
						<div class="col fw-semibold fs-5">
						    내가 낙찰한 경매 목록
						</div>
					</div>	
					
					
					
										
						
				<div class="row mt-3">
					<div class="col">
					
						<table class="table">
							<thead>
								<tr class="text-center">
									<td class="custom-table-secondary" style="width: 50%">상품정보</td>
									<td class="custom-table-secondary">낙찰가</td>
									<td class="custom-table-secondary">낙찰시간</td>
									<td class="custom-table-secondary">경매종료일</td>
									<td class="custom-table-secondary">상태</td>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty successBidList}">
									<tr class="text-center">
										<td colspan="5">낙찰 정보가 없습니다.</td>
									</tr>
								</c:if>
								 <c:forEach items="${successBidList}" var="bidDto">
									<tr>
										<td class="align-middle">
											<div class="row">
												<div class="col-3">
													<input type="hidden" id="bid_${bidDto.auction_item_id}" value="${bidDto.id}">
													<a href="/safari/auction/productDetail/${bidDto.auction_item_id}"
													id="aid_${bidDto.auction_item_id}">
														<img src="/auctionFiles/${bidDto.auction_item_img_link}" style="
														width: 120px; height: 120px;" class="img-fluid"></a>
												</div>
												<div class="col ms-2">
													<div class="row mt-4">
														<div class="col ms-2" style="font-size: 14px;">
															${bidDto.main_category_name} > ${bidDto.sub_category_name}
														</div>
													</div>
													<div class="row">
														<div class="col ms-2 fw-semibold">
														<input type="hidden" value="${bidDto.auction_item_id}">
															<span style="font-size: 16px;"><a href="/safari/auction/productDetail/${bidDto.auction_item_id}">
															${bidDto.title}</a></span>
														<input type="hidden" id="title_${bidDto.auction_item_id}" value="${bidDto.title}">	
														</div>
													</div>											
												</div>
											</div>	
										</td>
										<td class="align-middle text-center">
											<span class= "fw-bold" style="font-size: 18px;"><fmt:formatNumber value="${bidDto.bid_price}"  pattern="#,###"/></span> 원
											<input type="hidden" id="bid_price_${bidDto.auction_item_id}" value="${bidDto.bid_price}">
										</td>
										<td class="align-middle text-center">
											<fmt:formatDate value="${bidDto.reg_date}" pattern="yyyy.MM.dd" />
											<br>
											<fmt:formatDate value="${bidDto.reg_date}" pattern="a hh:mm" />
										</td>
										<td class="align-middle text-center">
											<fmt:formatDate value="${bidDto.end_date}" pattern="yyyy.MM.dd" />
											<br>
											<fmt:formatDate value="${bidDto.end_date}" pattern="a hh:mm" />
										
										</td>
										<td class="align-middle text-center">
											<span id="myStatus_${bidDto.id}"></span>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					
			
				
							

						</div>
					</div>						
						
					<div class="row mt-5">
						<div class="col">
							
							<div class="row mt-2 ms-2">
								<div class="col">
									<div class="row fw-bold fs-5">
										<div class="col">
											 
										</div>
									</div>
								
								</div>
							</div>
							
						</div>
						<div class="col-1"></div>
						<div class="col">
							
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
	

<div class="modal" id="deliveryStatusModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
      		
      		
 				<%-- 배송 아이콘 --%>     		
      			<div class="row mt-3 text-center">
      				<div class="col ms-4">
      					<div class="row">
      						<div class="col px-auto mx-auto">
      							<i class="bi bi-cash-coin mt-1" style="font-size: 32px;"></i>
      						</div>
      						<div class="col fw-medium my-auto"> > </div>
      						<div class="col  px-auto mx-auto">
      						<i class="bi bi-boxes mt-1  px-auto mx-auto" style="font-size: 32px;"></i>
      							
      						</div>
      						<div class="col  fw-medium my-auto"> > </div>
      						<div class="col  px-auto mx-auto"> 
      							<i class="bi bi-truck mt-1" style="font-size: 32px; "></i>
      							
      						</div>
      						<div class="col  fw-medium my-auto"> > </div>
      						<div class="col  px-auto mx-auto">
      							<i class="bi bi-bag-check mt-1 pt-1"  style="font-size: 28px; "></i>
      							
      						</div>
      					</div>
      					
      					  <div class="row  fw-medium">
      						<div class="col px-auto mx-auto" id="ds_payComplete">
      							결제완료
      						</div>
      						<div class="col  fw-medium">  </div>
      						<div class="col px-auto mx-auto" id="ds_deliveryReady">
      							배송준비중
      						</div>
      						<div class="col  fw-medium ">  </div>
      						<div class="col px-auto mx-auto" id="ds_deliveryIng">
      							배송중
      						</div>
      						<div class="col  fw-medium ">  </div>
      						<div class="col px-auto mx-auto" id="ds_deliveryComplete">
      							배송완료
      						</div>
      					</div>
      				</div>
      			</div>
      			<%-- 배송 아이콘 --%>    
      			
      			
      			<%-- 상품 정보 --%>
      			<div class="row mt-5">
      				<div class="col ms-4">
      				
      					<div class="row">
      						<div class="col">
      						
      							<div class="row">
      								<div class="col fw-semibold fs-5">
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
      										<div class="col fw-semibold" id="productTitle" style="font-size: 18px;">
      										</div>
      									</div>
      									
      									<div class="row mt-1">
      										<div class="col">
      											구매수량 : 1개
      										</div>
      									</div>
      									
      									<div class="row mt-1">
      										<div class="col" id="sellerInfo">
      										
      										</div>
      									</div>
      								
      								</div>
      								<%-- 상품 제목  --%>
      								
      							</div>
  
      						</div>
      					</div>
      					
      					
      					
      				</div>
      			</div>
      			
      			
      		
				
      			<%-- 상품 정보 --%>
      			
      			<%-- 정보 --%>
      			<div class = "row mt-5">
      				<div class="col ms-4">
      					
      					
      					<div class="row">
      						<div class="col">
		      					<div class="row">
		      						<div class="col fw-semibold fs-5">
		      							배송 정보
		      							
		      						</div>
		      						<div class="col text-end mt-1">
		      							<a href="/safari/user/myInquiryPostPage">
		      							<span style="font-size: 14px">배송 관련 문의하기</span> <span style="font-size: 11px;"> ></span></a>
		      						</div>
		      					</div>
		      					
		      					<div class="row mt-2 mb-1">
		      						<div class="col">
		      							
		      							<div class="row">
		      								<div class="col fw-semibold text-secondary">배송일시</div>
		      								<div class="col-8 text-end" id="deliveryDate"></div>
	
		      							</div>
		      							
		      							<div class="row mt-1">
		      								<div class="col fw-semibold text-secondary">택배사</div>
		      								<div class="col-8 text-end">482</div>
	
		      							</div> 
		      							
		      							
		      						</div>
		      					</div>
      						</div>
      						
      						
      						
      						
      						<div class="col ms-3">
			      				<div class="row">
		      						<div class="col fw-semibold fs-5">
		      							결제 정보
		      						</div>
		      					</div>
	      					
		      					<div class="row mt-2 mb-1">
		      						<div class="col">
		      							
		      							<div class="row">
		      								<div class="col fw-semibold text-secondary">결제일시</div>
		      								<div class="col-8 text-end" id="paymentDate"></div>
	
		      							</div>
		      							
		      							<div class="row mt-1">
		      								<div class="col fw-semibold text-secondary">결제금액</div>
		      								<div class="col-8 text-end">
		      									<span class="fw-semibold text-danger" id="paymentPrice"></span> 원
		      								</div>
	
		      							</div>
		      							
		      						</div>
		      					</div>	  
      						</div>
      						
      						
      					</div>
      					
      					
      				<%-- 주문 정보 --%>
	      				<div class="row mt-5">
	      					<div class="col fw-semibold fs-5">
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
						
						<div class="row mt-1 mb-2 mb-4">
							<div class="col fw-bold text-secondary">배송요청사항</div>
							<div class="col-8 text-end" id="paymentMessage"></div>
						</div>
    					
      					
      				</div>
      			</div>
      		
      		
      			<%-- 정보 --%>
      			
      	
      		
      		</div>
      	
      	</div>
      
      	
      	
      
      <div class="modal-footer">
      	
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창닫기</button>
      </div>      
   
    </div>
  </div>
</div>
</div>


<%-- 구매 확정 alert --%>
<div class="modal" id="buyCompleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered"> 
    <div class="modal-content">
      <div class="modal-header bg-light">
      		<h5 class="modal-title ms-1 fw-bold">구매확정</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
      	
      	<div class="row text-center">
    		<div class="col"> 
    			
    			<div class="row">
    				<div class="col">
    					해당 상품을 구매 확정 처리하시겠습니까?
    				</div>
    			</div>
    			
    			 <div class="row">
    				<div class="col">
    					구매확정 이후에는 반품이 불가능합니다.
    				</div>
    			</div>
    			
    		</div>
       </div>
  
      </div>
      
      <div class="modal-footer">
      	<button type="button" class="btn orangeButton" id="buyCompleteConfirmButton">확인</button>

        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>      
   
    </div>
  </div>
</div>
<%-- 구매 확정 alert --%>


<%-- 반품 신청  --%>
<div class="modal" id="refundModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered"> 
    <div class="modal-content">
      <div class="modal-header bg-light">
      		<h5 class="modal-title fw-bold">반품 신청</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
      
      	<div class="row mt-2">
      		<div class="col ms-5">
      		
      		
			<div class="row py-3 fw-bolder">
				<div class="col text-center">
					<label class="p-0 col-form-label" >문의 제목</label>
				</div>
					
				<div class="col-8 px-0">
					<input type="text" class="form-control" >
				</div>
				<div class="col"></div>
			
			</div>
			
			<div class="row py-3 text-center fw-bolder">
				<div class="col">
					<label class="col-form-label p-0" >문의 내용</label>
				</div>
				<div class="col-8 px-0">
					<textarea class="form-control"  rows="8"></textarea>
				</div>
				<div class="col"></div>
			</div>
			
			<div class="row py-3 fw-bolder">
				<div class="col text-center">
					<label class="p-0 col-form-label" >사진 업로드</label>
				</div>
					
				<div class="col-8 px-0">
					<input type="file" class="form-control">
				</div>
				<div class="col"></div>
			
			</div>
      		
  
      		</div>
      	
      	</div>
   
      	
     	
			
  
      </div>
      
      <div class="modal-footer">
      	<input type="button" class="btn orangeButton" value="등록">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>      
   
    </div>
  </div>
</div>
<%-- 반품 신청  --%>




<script>

let selectedPk = null;

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


// 배송조회 모달 열기
function deliveryStatusModal(id) {

	selectedPk = id; // 입찰 pk

 	const xhr = new XMLHttpRequest();
	
	// 배송진행상태
	const ds_payComplete = document.querySelector("#ds_payComplete");
	const icon_payComplete = document.querySelector(".bi-cash-coin");
	
	const ds_deliveryReady = document.querySelector("#ds_deliveryReady");
	const icon_deliveryReady = document.querySelector(".bi-boxes");
	
	const ds_deliveryIng = document.querySelector("#ds_deliveryIng");
	const icon_deliveryIng = document.querySelector(".bi-truck");
	
	const ds_deliveryComplete = document.querySelector("#ds_deliveryComplete");
	const icon_eliveryComplete = document.querySelector(".bi-bag-check");
	
	const deliveryDetailStatus = document.querySelector("#deliveryDetailStatus");
	
	
    // 배송 진행 상태 아이콘의 text-danger 클래스 제거
    ds_payComplete.classList.remove("text-orange");
    icon_payComplete.classList.remove("text-orange");
    
    ds_deliveryReady.classList.remove("text-orange");
    icon_deliveryReady.classList.remove("text-orange");
    
    ds_deliveryIng.classList.remove("text-orange");
    icon_deliveryIng.classList.remove("text-orange");
    
    ds_deliveryComplete.classList.remove("text-orange");
    icon_eliveryComplete.classList.remove("text-orange");


    xhr.onreadystatechange = function() {
    	 if (xhr.readyState === 4 && xhr.status === 200) {
        	 
        	const response = JSON.parse(xhr.responseText);
        	
        	// 배송 상세 정보 조회
        	showDeliveryDetail(id);
        	
        	// 상품 이미지 // 
        	const productImageBox = document.querySelector("#productImage");
        	productImageBox.innerHTML = "";
        	
        	const imageRow = document.createElement("div");
    	    imageRow.classList.add("row");
    	    
    	    const imageCol = document.createElement("div");
  		    imageCol.classList.add("col");
  		    
  		    const productImageLink = document.createElement("a");
		    productImageLink.href = "/safari/auction/productDetail/" + response.deliveryStatusDto.auction_item_id;
        	
        	const productImage = document.createElement("img");
        	productImage.classList.add("img-fluid");
        	productImage.src = "/auctionFiles/" + response.deliveryStatusDto.auction_item_img_link;
        	
        	productImageLink.appendChild(productImage);
        	imageCol.appendChild(productImageLink);
        	imageRow.appendChild(imageCol);

        	productImageBox.appendChild(imageRow);
        	// 상품 이미지 //
        	
        	// 상품 제목 //
        	const productTitleBox = document.querySelector("#productTitle");
        	productTitleBox.innerHTML = "";
        	const titleRow = document.createElement("div");
		    titleRow.classList.add("row");
		 
		    const titleCol = document.createElement("div");
		    titleCol.classList.add("col");
		    
			const titleLink = document.createElement("a");
	      	titleLink.href = "/safari/auction/productDetail/" + response.deliveryStatusDto.auction_item_id;
	      	titleLink.innerText = response.deliveryStatusDto.title; 
	      	 
	      	titleCol.appendChild(titleLink);
	      	titleRow.appendChild(titleCol);
	      	 
	      	productTitleBox.appendChild(titleRow);
	     // 상품 제목 //
        	
        	const sellerInfoBox = document.querySelector("#sellerInfo");
        	sellerInfoBox.innerText = "판매자 : " + response.deliveryStatusDto.nickname;
        	
        	// 결제 정보 //
        	const paymentDateBox = document.querySelector("#paymentDate");
        	const paymentDate = new Date(response.deliveryStatusDto.payment_reg_date);
        	paymentDateBox.innerText = formatTime(paymentDate);
        	
        	const paymentPriceBox = document.querySelector("#paymentPrice");
        	paymentPriceBox.innerText = new Intl.NumberFormat('ko-KR').format(response.deliveryStatusDto.amount);
        	
        	// 결제 정보 //
        	
        	const deliveryStatusModal = bootstrap.Modal.getOrCreateInstance("#deliveryStatusModal");
        	deliveryStatusModal.show();
        	
        	const deliveryDateBox = document.querySelector("#deliveryDate");
        	// 배송일자
        	if (!response.deliveryStatusDto.delivery_reg_date) {
        		deliveryDateBox.innerText = "예정";
        	} else {
        		const deliveryDate = new Date(response.deliveryStatusDto.delivery_reg_date);
        		deliveryDateBox.innerText = formatTime(deliveryDate);
        	}
 
        	
        	if (!response.deliveryStatusDto.delivery_status) {
        		ds_deliveryReady.classList.add("text-orange");
        		icon_deliveryReady.classList.add("text-orange");
        		
        	} else {
        		
        		if(response.deliveryStatusDto.delivery_status == "배송중") {
        			ds_deliveryIng.classList.add("text-orange");
        			icon_deliveryIng.classList.add("text-orange");
        			
        		} else if (response.deliveryStatusDto.delivery_status == "배송완료") {
        			ds_deliveryComplete.classList.add("text-orange");
        			icon_eliveryComplete.classList.add("text-orange");
        		}
        	}

        	
        }
    };
    
    xhr.open("get", "/safari/auction/getDeliveryStatusInSuccessfulBid?id=" + selectedPk);
    xhr.send();	

}

// 배송 상세 정보 조회하기
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
	
	 xhr.open("get", "/safari/auction/getAddressInfoInPaymentAndDelivery?id=" + selectedPk);
	 xhr.send();	

}

// 반품 신청 모달
function openRefundModal(id) {
	
	const refundModal = bootstrap.Modal.getOrCreateInstance("#refundModal");
	refundModal.show();
	
}





//전화번호 형식 변경 함수
function oninputPhone(target) {
    target.value = target.value
        .replace(/[^0-9]/g, '')
        .replace(/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
}



//새 창 띄우기 
 function openNewWindow(url) {
 	  // Define the window features
 	  const windowFeatures = "width=600,height=600,resizable=yes,scrollbars=yes";

 	  // Open a new window with the specified URL and features
 	  const childWindow = window.open(url, "_blank", windowFeatures);
 	  
 	  // Add an event listener to the child window's unload event
 	  childWindow.addEventListener("unload", function() {
 	     
 	  });
 		  
 	  
 	  // Return the child window object
 	  return childWindow;
 }
 
 




function getMySuccessfulBidPayAndDeliveryStatusList() {
	
	
	const xhr = new XMLHttpRequest();
	  xhr.onreadystatechange = function() {
	    if (xhr.readyState === 4 && xhr.status === 200) {
	      const response = JSON.parse(xhr.responseText);
	      
	      for (data of response.myStatusList) {
	    	  
	    	  let myStatus = document.getElementById("myStatus_" + data.id);
	    	  myStatus.innerHTML = "";
	    	  console.log(data.payment_exists);
	    	  
	    	  // 결제를 하지 않았을 경우
	    	  if (data.payment_exists == 'No') {
	    		  
	    		  console.log(data.payment_exists);
	    		  
	    		  const row  = document.createElement("div");
	    		  row.classList.add("row");
	    		  
	    		  const col  = document.createElement("div");
	    		  col.classList.add("col");
	    		  
	    		  const payButton = document.createElement("input");
	    		  payButton.type = "button";
	    		  payButton.classList.add("btn", "btn-sm", "btn-outline-dark");
	    		  payButton.value = "결제하기";
	    		  
	    		  
	    		   payButton.onclick = function(dataId) {
	    			    return function() {
	    			        location.href = "/safari/auction/getOrderPage?id=" + dataId;
	    			        console.log(dataId);
	    			    };
	    			}(data.id); 
	    			
	    			
	    		
    	          
    	          col.appendChild(payButton);
    	          
    	          row.appendChild(col);
	              
    	          myStatus.appendChild(row);    
	    	  } 
	    	  // 결제를 하였을 경우
	    	  else {
	    		  const deliveryRegDate = new Date(data.delivery_reg_date);
	    		  const threeDaysLater = new Date(deliveryRegDate.setDate(deliveryRegDate.getDate() + 1));
	    		  // @@@@@@@@@@@ 나중에 3일로 꼭 변경해야함. (임시로 1일로 설정) @@@@@@@@@@@@@@@@@@@@
	    		  
	    		  const nowDate = new Date();
	    		  
	    		  // 배송처리가 되지 않았을 경우
	    		  if (data.delivery_exists == 'No') {
	    			  	const row = document.createElement("div");
    				  	row.classList.add("row");
    				  	
    				  	const col = document.createElement("div");
    				  	col.classList.add("col");
    				  	
    				  	col.innerText = "배송준비중";
    				  	
    					const rowButton = document.createElement("div");
    					rowButton.classList.add("row", "mt-1");
    				  	
    				  	const colButton = document.createElement("div");
    				  	colButton.classList.add("col");
    				  	
       					const selectButton = document.createElement("input");
    					selectButton.type = "button";
    					selectButton.classList.add("btn", "btn-sm", "btn-outline-dark");
    					selectButton.value = "배송조회";
    					selectButton.setAttribute("onclick", "deliveryStatusModal("+ data.id +")");
    					
    					colButton.appendChild(selectButton);
    					
    					rowButton.appendChild(colButton);
    				  	
    				  	row.appendChild(col);
    				  	myStatus.appendChild(row);
    				  	myStatus.appendChild(rowButton);
    				  	
    				  	
	    		  } 
	    		  // 배송처리가 되었을 경우
	    		  else if (data.delivery_reg_date){
	    			  // 배송한지 3일이 지났을 때
	    			  if (nowDate > threeDaysLater) {
							
	    				  	// 배송완료 처리하기 전에 db에 배송완료 여부 확인 (중복 insert 방지하기 위함)
	    				    selectAuctionDeliveryStatusBeforeComplete(data.id);
	    				    
	    				    // 구매확정이 되었을 때
	    				    if (data.purchase_confirmed == 'Yes') {
	    				    	
	    				    	
	    				    	const row = document.createElement("div");
		    				  	row.classList.add("row");
		    				  	
		    				  	const col = document.createElement("div");
		    				  	col.classList.add("col");
		    				  	
		    				  	col.innerText = "구매확정";
		    				  	
		    				  	row.appendChild(col);
		    				  	
		    					const rowButton = document.createElement("div");
		    					rowButton.classList.add("row", "mt-1");
		    				  	
		    				  	const colButton = document.createElement("div");
		    				  	colButton.classList.add("col");
		    				  	
		       					const selectButton = document.createElement("input");
		    					selectButton.type = "button";
		    					selectButton.classList.add("btn", "btn-sm", "btn-outline-secondary");
		    					selectButton.value = "배송조회";
		    					selectButton.setAttribute("onclick", "deliveryStatusModal("+ data.id +")");
		    					colButton.appendChild(selectButton);
		    					rowButton.appendChild(colButton);
		    					
		    				  	myStatus.appendChild(row);
		    				  	myStatus.appendChild(rowButton);
	    				    } 
	    				    // 구매확정이 아직 되지 않았을 때
	    				    else {
	    				    
	    				    
	    				  	const row = document.createElement("div");
	    				  	row.classList.add("row");
	    				  	
	    				  	const col = document.createElement("div");
	    				  	col.classList.add("col");
	    				  	
	    				  	col.innerText = "배송완료";
	    				  	
	    				  	row.appendChild(col);
	    				  	myStatus.appendChild(row);
	    				  	
	    					const rowButton = document.createElement("div");
	    					rowButton.classList.add("row", "mt-1");
	    				  	
	    				  	const colButton = document.createElement("div");
	    				  	colButton.classList.add("col");
	    				  	
	       					const selectButton = document.createElement("input");
	    					selectButton.type = "button";
	    					selectButton.classList.add("btn", "btn-sm", "btn-outline-secondary");
	    					selectButton.value = "배송조회";
	    					selectButton.setAttribute("onclick", "deliveryStatusModal("+ data.id +")");
	    					
	    					colButton.appendChild(selectButton);
	    					
	    					rowButton.appendChild(colButton);
	    					
	    					myStatus.appendChild(rowButton);
	    				  	
	    				  	const row2 = document.createElement("div");
	    				  	row2.classList.add("row", "mt-1");
	    				  	
	    				  	const col2 = document.createElement("div");
	    				  	col2.classList.add("col");
	    				  	
	    					const buyButton = document.createElement("input");
	    					buyButton.type = "button";
	    					buyButton.classList.add("btn", "btn-sm", "btn-outline-secondary");
	    					buyButton.value = "구매확정";
	    					buyButton.setAttribute("onclick", "getDeliverypkByBidpk("+ data.id + ")");
	    				
	    					
	    				/* 	buyButton.onclick = function (id) {
		    	                return function () {
		    	                	getDeliverypkByBidpk(id);
		    	                };
		    	              }(data.id);
		    	               */
	    					
	    					col2.appendChild(buyButton);
	    					
	    					row2.appendChild(col2);
	    					
	    					myStatus.appendChild(row2);
	    					
	      				  	const row3 = document.createElement("div");
	    				  	row3.classList.add("row", "mt-1");
	    				  	
	    				  	const col3 = document.createElement("div");
	    				  	col3.classList.add("col");
	    				  	
	    					const refundButton = document.createElement("input");
	    					refundButton.type = "button";
	    					refundButton.classList.add("btn", "btn-sm", "btn-outline-secondary");
	    					refundButton.value = "반품신청";
	    					refundButton.setAttribute("onclick", "openRefundModal("+ data.id + ")");
	    					
	    					col3.appendChild(refundButton);
	    					
	    					row3.appendChild(col3);
	    					
	    					myStatus.appendChild(row3);
	    					/* myStatus.style.position = "relative";
	    					myStatus.style.bottom = "8px"; */
	    				   }
	    				  	
	    			        
	    			    } 
	    			  // 배송처리는 되었지만 아직 배송완료 x
	    			  else {
	    			    	
	    			    	const row = document.createElement("div");
	    				  	row.classList.add("row");
	    				  	
	    				  	const col = document.createElement("div");
	    				  	col.classList.add("col");
	    				  	col.innerText = "배송중";
	    				  	
	    				  	row.appendChild(col);
	    				  	
	    				 	const row2 = document.createElement("div");
	    				  	row2.classList.add("row", "mt-1");
	    				  	
	    				  	const col2 = document.createElement("div");
	    				  	col2.classList.add("col");
	    				  	
	    					const selectButton = document.createElement("input");
	    					selectButton.type = "button";
	    					selectButton.classList.add("btn", "btn-sm", "btn-outline-secondary");
	    					selectButton.value = "배송조회";
	    					selectButton.setAttribute("onclick", "deliveryStatusModal("+ data.id +")");
	    					
	    					col2.appendChild(selectButton);
	    					row2.appendChild(col2);
	    					
	    					myStatus.appendChild(row);
	    					myStatus.appendChild(row2);
	    			    }
	    		  }
	    		  
	    	  }
	      }
	      
	      
	    }
	  }
	  xhr.open("get", "/safari/auction/getMySuccessfulBidPayAndDeliveryStatusList");
      xhr.send();
	
}

// 배송완료 처리하기 전에 배송 상태 확인
function selectAuctionDeliveryStatusBeforeComplete(id) {
	
	const xhr = new XMLHttpRequest();
	  xhr.onreadystatechange = function() {
	    if (xhr.readyState === 4 && xhr.status === 200) {
	      const response = JSON.parse(xhr.responseText);
	      
	      if (response.deliveryStatus.delivery_status != '배송완료'){
	    	  renewAuctionDeliveryComplete(id);
	      }
	      
	    }
	  }
	  xhr.open("get", "/safari/auction/checkAutionDeliveryStatus?partnerOrderId=" +id);
      xhr.send();
	      
	
}

// 배송완료 처리
function renewAuctionDeliveryComplete(id) {
	
	const xhr = new XMLHttpRequest();
	  xhr.onreadystatechange = function() {
	    if (xhr.readyState === 4 && xhr.status === 200) {
	      if(response.result == "success") {
	      	const response = JSON.parse(xhr.responseText);
	      }
	      
	    }
	  }
	  xhr.open("get", "/safari/auction/completeAuctionDelivery?partnerOrderId=" +id);
      xhr.send();
	      
	
}




//구매확정 - 낙찰 pk를 받아와서 배송 pk 받아오기
function getDeliverypkByBidpk(id) {
    const xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            const response = JSON.parse(xhr.responseText);

            // 배송 pk 받고 구매 확정 처리
             buyCompleteModal(id, response.deliveryStatus.id);
        }
    };

    xhr.open("get", "/safari/auction/checkAutionDeliveryStatus?partnerOrderId=" + id);
    xhr.send();
}


// 구매 확정 물어보는 모달
  function buyCompleteModal(id, deliveryId) {

	  const buyCompleteModal = bootstrap.Modal.getOrCreateInstance("#buyCompleteModal");
	  
	  const confirmButton = document.getElementById("buyCompleteConfirmButton");
	  
	  console.log(id, deliveryId);
	  confirmButton.setAttribute("onclick", "purchaseConfirmed(" + id + "," + deliveryId + ")");
	
	   
	  confirmButton.addEventListener("click", function() {
	        buyCompleteModal.hide();
	    });
	  
	  buyCompleteModal.show();


	  
  }
  
  
// 구매 확정 처리
function purchaseConfirmed(id, deliveryId) {
	
	const xhr = new XMLHttpRequest();
	  xhr.onreadystatechange = function() {
	    if (xhr.readyState === 4 && xhr.status === 200) {
	    
	      	
	        let myStatusNew = document.getElementById("myStatus_" + id);
	        myStatusNew.innerHTML = ""; 

	        const buyRow = document.createElement("div");
	        buyRow.classList.add("row");
	        
	        const buyCol = document.createElement("div");
	        buyCol.classList.add("col");
	        
	        
	        buyCol.innerText = "구매확정";
	        
	        buyRow.appendChild(buyCol);
	        
	        myStatusNew.appendChild(buyRow);
	      	
	      	
	      
	    }
	  }
	  
     xhr.open("get", "/safari/auction/registerPurchaseConfirmed?auctionDeliveryAfterPaymentId=" + deliveryId + "&id="+id);
     xhr.send();
}



window.addEventListener("DOMContentLoaded", function(){

	getMySuccessfulBidPayAndDeliveryStatusList();
	
});





</script>




<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	
</body>
</html>