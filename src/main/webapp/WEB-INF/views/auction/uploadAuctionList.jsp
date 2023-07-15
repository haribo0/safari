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
					<h5>내가 올린 경매 목록</h5>						
				</div>
			</div>
			
			
			<div class="row mt-4">
				<div class="col">
				
					<div class="row">
						<div class="col">
							<span>
								<img class="mb-1" src="/safari/resources/img/auction/notice.png"
									style="max-width: 25px; max-height: 25px;"></span>
									<span class="fw-bold fs-5">참고사항</span>
						
						</div>
					</div>	
					
					<div class="row">
						<div class="col">
							업로드하신 경매 물품의 <span class="fw-bold">현재가는 <span class="text-danger">실시간으로</span> 업데이트</span>되고 있습니다.
						</div>
					</div>	
					
					<div class="row">
						<div class="col">
							경매가 종료된 후, 낙찰자가 <span class="fw-bold">7일 이내</span>에 결제하지 않으면 경매를 재시작하실 수 있습니다.
						</div>
					</div>		
					
					
					<div class="row mt-4">
						<div class="col fw-bold fs-5">
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
								
													<div class="col">
														<a href="/safari/auction/productDetail/${endedBidDto.auction_item_id}">
														<img class="me-3"
														src="/auctionFiles/${endedBidDto.auction_item_img_link}" style="
														position: relative; left: 30px; width: 120px; height: 120px;"></a>
													</div>
													<div class="col-8" class="text-start">
														<div class="row mt-4">
															<div class="col" style="font-size: 14px;">
																${endedBidDto.main_category_name} > ${endedBidDto.sub_category_name}
															</div>
														</div>
														<div class="row">
															<div class="col fw-bold">
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
											<td class="text-center fw-bold text-danger">
												<fmt:formatNumber value="${endedBidDto.bid_price}"  pattern="#,###"/>원
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
					
					
					
					<div class="row mt-4" >
						<div class="col fw-bold fs-5">
						 	 입찰 기록이 있는 경매 목록
						</div>
						
						<div class="col d-flex justify-content-end" >
							
							 <input class="form-check-input me-2" type="radio" id="radioStatus" name="radioStatus" value="">
							  <label class="form-check-label me-4" for="radioStatus">
							    	전체보기
							  </label>			
								
							 <input class="form-check-input me-2" type="radio" id="radioStatusIng" name="radioStatus" value="ing">
							  <label class="form-check-label me-4" for="radioStatusIng">
							    	진행중인 경매만 보기
							  </label>
				 		  		
				
								<input class="form-check-input me-2" type="radio" id="radioStatusReady" name="radioStatus" value="ready">
								  <label class="form-check-label me-2" for="radioStatusReady">
								    	준비중인 경매만 보기
								  </label>				
							</div>						
						
					</div>		
					
				<c:if test="${empty uploadAuctionList}">
					<div class="row mt-4" style="min-height: 200px;">
						<div class="col text-center fs-5">
							입찰 기록이 있는 경매가 없습니다.
						</div>
					</div>	
				</c:if>
				
	
					
				<div class="row mt-4">
					<c:forEach items="${uploadAuctionList}" var="auction">
						<div class="col-3 mb-3">
							
							<div class="row">
								<div class="col">
									<a href="/safari/auction/productDetail/${auction.auction_item_id}" class="text-decoration-none d-inline-block">
											  <img src="/auctionFiles/${auction.auction_item_img_link}" class="img-fluid" alt="..." 
											  	 style="height: 180px;">
									</a>
								</div>
							</div>
							
							
							<div class="row mt-2">
								<div class="col fw-medium overflow" style="width: 200px;">
									<a href="/safari/auction/productDetail/${auction.auction_item_id}">
									   ${auction.title}</a>
								</div>
							</div>
							
							
							
							<div class="row">
								<div class="col text-secondary">
									<span id="priceStatus"></span>
									<span class="text-danger fw-bold" id="currentPrice_${auction.auction_item_id}"></span>
								</div>
							</div>
							
							<div class="row mt-1 mb-0">
								<div class="col">
									<p id="remainTime_${auction.auction_item_id}">
									 </p>
								</div>
							</div>
							
							<p><span id="auctionStatus_${auction.auction_item_id}"> </span></p>
							
						</div>
					</c:forEach>
				</div>					
					
					

				
				<div class="row mt-4">
						<div class="col fw-bold fs-5">
							전체 경매 목록
						</div>
				</div>
				
				<c:if test="${empty noBidAuctionList}">
					<div class="row mt-4">
						<div class="col text-center fs-5">
							정보가 없습니다.
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
	


<script>
// 종료된 경매 결제 현황 상태바 (결제 완료된거)
function reloadPayAndDeliveryStatus() {
	
	const xhr = new XMLHttpRequest();
	  xhr.onreadystatechange = function() {
	    if (xhr.readyState === 4 && xhr.status === 200) {
	      const response = JSON.parse(xhr.responseText);
	      
	     
	      
	      for (data of response.endedAuctionList) {
	    	  
	    	  const payStatus = document.getElementById("payStatus_" + data.id);
	    	  const processStatus = document.getElementById("processStatus_" + data.id);
	    	  
	    	  payStatus.innerHTML = "";
	    	  processStatus.innerHTML ="";
	    	  
              let statusButton = document.createElement("input");
              statusButton.type = "button";
              statusButton.classList.add("btn", "btn-sm");
              
	    	  // 결제 완료되었을 때
	    	  if (data.payment_exists == 'Yes') {
	    		  
	    		  // 배송 미처리
	    		  if (data.delivery_exists == 'No') {
	    			  payStatus.innerText = "결제완료"
	    			  statusButton.classList.add("btn-outline-secondary");
					  statusButton.value = "배송하기";
	    			  
	    	           statusButton.onclick = function (id) {
	    	                return function () {
	    	                  startDelivery(id);
	    	                };
	    	              }(data.id);
	    	              
	    	           processStatus.appendChild(statusButton);
	    			 
	    		  } 
	    		  // 배송 처리
	    		  else  {
	    			  
	    			 const deliveryRegDate = new Date(data.delivery_reg_date);
		    		 const threeDaysLater = new Date(deliveryRegDate.setDate(deliveryRegDate.getDate() + 2));
		    		 
		    		 const nowDate = new Date();
		    		 
		    		 if (nowDate > threeDaysLater) {
		    			 payStatus.innerText = "배송완료";
		    		 } else {
		    			 payStatus.innerText = "배송중";
		    		 }
	    			 
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
function startDelivery(id) {
	
	const xhr = new XMLHttpRequest();
	  xhr.onreadystatechange = function() {
	    if (xhr.readyState === 4 && xhr.status === 200) {
	      const response = JSON.parse(xhr.responseText);
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


//경매 정보를 업데이트하고 화면에 출력하는 함수
function updateAuctionCountDown(id) {
	
  
  const xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function() {
    if (xhr.readyState === 4 && xhr.status === 200) {
      const response = JSON.parse(xhr.responseText);
      
      const nowDate = new Date();

      const auctionEndDate = new Date(response.auctionItem.auctionDto.end_date); // 경매 종료일
      const auctionStartDate = new Date(response.auctionItem.auctionDto.start_date); // 경매 시작일
      
      let auctionStatusBox = document.getElementById("auctionStatus_" + id);
      auctionStatusBox.innerHTML = "";
      
      const statusButton = document.createElement("button");
      statusButton.classList.add("btn");
      statusButton.classList.add("btn-sm");
      statusButton.classList.add("fw-bold");
      statusButton.classList.add("disabled");
      
  
      
      if (auctionEndDate <= nowDate || response.auctionItem.auctionDto.auction_status == '종료') {  
    	  
    	 
    	  
      } else if (auctionStartDate <= nowDate) {
    	  statusButton.classList.add("btn-outline-success");
          statusButton.innerText = "진행중";
          auctionStatusBox.appendChild(statusButton);
      } else {
      	 statusButton.classList.add("btn-outline-primary");
      	 statusButton.innerText = "준비중";
      	 auctionStatusBox.appendChild(statusButton);
      }
      
      
      
      const formattedauctionEndDate = auctionEndDate.toLocaleString('ko-KR', {
          year: 'numeric',
          month: '2-digit',
          day: '2-digit',
          hour: '2-digit',
          minute: '2-digit',
          //second: '2-digit',
          hour12: true
        });	        
      
      
    //  const auctionEndDateBox = document.getElementById("auctionEndDate_" + id);
     // auctionEndDateBox.innerText = "경매종료일 : " +formattedauctionEndDate;
      
     
   /*   let priceStatusBox = document.getElementById("remainTime_");
     if (auctionStartDate <= nowDate || response.auctionItem.auctionDto.auction_status == '진행중') {
    	 priceStatusBox.innerText = "현재가 ";
    	 // 아무도 낙찰하지 않았을 경우 에러처리 해야함
     } else {
    	 priceStatusBox.innerText = "낙찰가 ";
     }
     */
      
      
      let countDownTableBox = document.getElementById("remainTime_" + id);
      countDownTableBox.innerHTML = "";
      
      const timeIcon = document.createElement("i");
      timeIcon.classList.add("bi", "bi-clock", "me-2");
      timeIcon.style.position = "relative";
    
     
      const maxBiderRow = document.createElement("div");
      maxBiderRow.classList.add("row");
      
      const maxBiderCol = document.createElement("div");
      maxBiderCol.classList.add("col");
      maxBiderCol.id = "maxBider_" + id;
      
	  	// 경매가 종료된 경우
	  	if (auctionEndDate <= nowDate || response.auctionItem.auctionDto.auction_status == '종료') {
	  		getMaxBider(id);
	  		maxBiderRow.appendChild(maxBiderCol);
	  		countDownTableBox.appendChild(maxBiderRow);
	  		return;
	  	} 
	  	// 경매가 시작되었거나 준비중인 경우
	  	else {
	  		let auctionCountDown;
	  		// 경매가 시작된 경우
	  		if (auctionStartDate <= nowDate) {
	  			auctionCountDown = countdownFromEndDate(auctionEndDate);
		  		countDownTableBox.appendChild(maxBiderRow);	  			
	  		} else {
	  			auctionCountDown = countdownFromStartDate(auctionStartDate);
	  		}
	  	

	       	const remainTimeRow = document.createElement("div");
	       	remainTimeRow.classList.add("row");
	        //remainTimeRow.classList.add("mt-1");
	        
	        const remainTimeCol = document.createElement("div");
	        remainTimeCol.classList.add("col");
	        	        
	        remainTimeCol.appendChild(timeIcon);
 
	         if (auctionCountDown.days > 0) {
		            const spanTime1 = document.createElement("span");
		            spanTime1.classList.add("fw-bold");
		            spanTime1.innerText = auctionCountDown.days + "일 ";  
		            remainTimeCol.appendChild(spanTime1);
	         	}
	        
	         if (auctionCountDown.hours > 0) {
	              const spanTime2 = document.createElement("span");
	              spanTime2.classList.add("fw-bold");
	              spanTime2.innerText = auctionCountDown.hours + "시간 ";
	              remainTimeCol.appendChild(spanTime2);
	            }
	          if (auctionCountDown.minutes > 0) {
	              const spanTime3  = document.createElement("span");
	              spanTime3.classList.add("fw-bold");
	              spanTime3.innerText = auctionCountDown.minutes + "분 ";
	          	  remainTimeCol.appendChild(spanTime3);
	            }		         

		       const spanTime4 = document.createElement("span");
		       spanTime4.classList.add("fw-bold");
		       spanTime4.innerText = auctionCountDown.seconds + "초 ";      
		              

		       	remainTimeCol.appendChild(spanTime4);
		        
		       	remainTimeRow.appendChild(remainTimeCol);
		       	
		       
		       	countDownTableBox.appendChild(remainTimeRow);	
		       	
		       	
		       	//const timeDiff = Math.abs(auctionEndDate - nowDate);  // 경매 시작까지 남은 시간 계산 (밀리초 단위)
                //const minutesDiff = Math.floor(timeDiff / (1000 * 60));  // 분 단위로 변환
      	
		        setTimeout(function() {
		            updateAuctionCountDown(id);
		          }, 1000); // 10초 간격으로 함수 호출 (1000ms = 1초)
	
	  		}

	    }
	  }

      xhr.open("get", "/safari/auction/getAuctionItemInfo/" + id);
      xhr.send();

 }
 

 
 
// 경매 종료 시 낙찰자 정보 조회
function getMaxBider(auctionItemId) {
	
	const xhr = new XMLHttpRequest();
	
	 xhr.onreadystatechange = function () {
	        if(xhr.readyState == 4 && xhr.status == 200){
	            const response = JSON.parse(xhr.responseText);
	            
				const maxBiderBox = document.getElementById("maxBider_" + auctionItemId);
				
				maxBiderBox.innerText = "낙찰자 : " + response.maxBiderNickname.nickname;
	                     
	        }
	  } 
	 
	  xhr.open("get", "/safari/auction/getMaxBiderNickname?auctionItemId=" + auctionItemId);
	  xhr.send();	 
}
 
//경매 현재가 계속 업데이트
function getCurrentPrice(auctionItemId) {
	
	const xhr = new XMLHttpRequest();
	
	
	 xhr.onreadystatechange = function () {
	        if(xhr.readyState == 4 && xhr.status == 200){
	            const response = JSON.parse(xhr.responseText);
	            const currentPrice = response.currentPrice;
	           
	            updateCurrentPrice(auctionItemId, currentPrice);
	        }
	  } 
	 
	  xhr.open("get", "/safari/auction/getCurrentPrice?auctionItemId=" + auctionItemId);
	  xhr.send();	  
	  
	    setTimeout(function() {
	    	 getCurrentPrice(auctionItemId);
	       }, 1000); // 10초 간격으로 함수 호출 (1000ms = 1초)
		  	  
}

//현재가를 업데이트하여 jsp화면에 출력
function updateCurrentPrice(auctionItemId, currentPrice) {
  const currentPriceElement = document.getElementById("currentPrice_" + auctionItemId);
  		if (currentPriceElement) {
  		 currentPriceElement.textContent =  new Intl.NumberFormat('ko-KR').format(currentPrice) + "원 \u00A0\u00A0\u00A0";
  }
}


function getUploadAuctionList() {
	
	 const xhr = new XMLHttpRequest();
	  xhr.onreadystatechange = function() {
	    if (xhr.readyState === 4 && xhr.status === 200) {
	      const response = JSON.parse(xhr.responseText);
	      
	      for(data of response.getAuctionList) {
	    	  
	    	  let currentPrice = 0;
	    	  
	    	  getCurrentPrice(data.auctionDto.id);
	    	  updateAuctionCountDown(data.auctionDto.id);
	      }
	    }
	    
	  };
	  xhr.open("get", "/safari/auction/getAuctionList");
	  xhr.send();		  
	
}

// 배송처리 페이지 띄우기
function shippingPage() {
	
	const shippingModal = bootstrap.Modal.getOrCreateInstance("#shippingModal");
	shippingModal.show();
	
}

window.addEventListener("DOMContentLoaded", function(){
	
	getUploadAuctionList();
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