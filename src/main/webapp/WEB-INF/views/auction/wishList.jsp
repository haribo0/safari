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
</head>

<style>
.overflow {
  white-space: nowrap; /* 텍스트를 한 줄로 표시 */
  overflow: hidden; /* 넘친 텍스트를 숨김 */
  text-overflow: ellipsis; /* 넘친 텍스트를 "..."으로 표시 */
}
.btn_auctionEnd{padding:3px 10px; background: #e9ecef; border:none; color: black; border-radius:8px; font-size: 13px; font-weight: meidum; }
.btn_auctionReady{padding:3px 10px; background: #e6edfe; border:none; color: #789efd; border-radius:8px; font-size: 13px; font-weight: bold;}
.btn_auctionIng{padding:3px 10px; background: #dff5ea; border:none; color: #6db590; border-radius:8px; font-size: 13px; font-weight: bold;}
</style>
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
					<h5>찜 내역</h5>						
				</div>
			</div>
			
			<div class="row me-5" style="position: relative; right: 10px;">
				<div class="col">
			
				<div class="row mt-4">
					<div class="col">
						<span>
							<i class="bi bi-exclamation-circle fs-5 me-1"></i></span>
								<span class="fw-semibold fs-5">참고사항</span>
					</div>
				</div>
				
				<div class="row">
					<div class="col">
						찜한 경매 중에서 준비중이거나 진행중인 경매만 표시됩니다.
					</div>
				</div>			
		
			    <div class="row">
					<div class="col">
						진행중인 경매의 <span class="fw-semibold">현재가는 <span class="text-danger">실시간으로</span> 업데이트</span> 되고 있습니다.
					</div>
				</div>		
				
				<div class="row mt-4">
					<div class="col fw-semibold fs-5">
					 	 관심 있는 경매 목록
					</div>
				</div>			
				
				
				<c:if test="${empty auctionWishList}">
					<div class="row mt-3">
						<div class="col text-center fs-5">
							관심 있는 경매가 없습니다.
						</div>
					</div>	
				</c:if>
					
				<div class="row mt-3 mb-5">
					<c:forEach items="${auctionWishList}" var="wish">
						<div class="col-3 mb-5">
							
							<div class="row">
								<div class="col">
									<a href="/safari/auction/productDetail/${wish.id}" class="text-decoration-none d-inline-block">
											  <img src="/auctionFiles/${wish.auction_item_img_link}" class="img-fluid" alt="..." 
											  	 style="height: 220px;">
									</a>
								</div>
							</div>
							
							
							<div class="row mt-2">
								<div class="col overflow fw-medium" style="width: 200px; font-size:16px;">
									<a href="/safari/auction/productDetail/${wish.id}">
									   ${wish.title}</a>
								</div>
							</div>
							
							
							
							<div class="row mt-1">
								<div class="col-auto">
									현재가 <span style="font-size: 18px;"
									 class="fw-bold ms-1 fs-5" id="currentPrice_${wish.id}"></span>
									 <span>원</span>
								</div>
								<div class="col px-0" >
									<span id="auctionStatus_${wish.id}"> </span>
								</div>
								
							</div>
							
							<div class="row mt-1">
								<div class="col" style="font-size: 14px;">
									즉시낙찰가
									<span class="ms-2" >
						 				<fmt:formatNumber value="${wish.max_price}" pattern="#,###"/>원
						 			</span> 
								</div>
							</div>	
							
							<div class="row mt-1">
								<div class="col">
									<span id="bidCount_${bidItem.id}"></span>
								</div>
							</div>
							
							<div class="row mt-1 mb-0">
								<div class="col">
									<p id="remainTime_${wish.id}" class="mb-1"
									style="font-size:17px;">
									 </p>
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

      if (auctionEndDate <= nowDate || response.auctionItem.auctionDto.auction_status == '종료') {  
    	  statusButton.classList.add("btn_auctionEnd");
          statusButton.innerText = "경매 종료";
    	  
      } else if (auctionStartDate <= nowDate) {
    	  statusButton.classList.add("btn_auctionIng");
          statusButton.innerText = "진행중";
      } else {
      	 statusButton.classList.add("btn_auctionReady");
      	 statusButton.innerText = "준비중";
      }
      
      auctionStatusBox.appendChild(statusButton);
      
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
      
      
      
      let countDownTableBox = document.getElementById("remainTime_" + id);
      countDownTableBox.innerHTML = "";
      
      const timeIcon = document.createElement("i");
      timeIcon.classList.add("bi", "bi-clock", "me-2");
      timeIcon.style.position = "relative";
    
     
      
	  	// 경매가 종료된 경우
	  	if (auctionEndDate <= nowDate || response.auctionItem.auctionDto.auction_status == '종료') {
	  		return;
	  	} 
	  	// 경매가 시작되었거나 준비중인 경우
	  	else {
	  		let auctionCountDown;
	  		// 경매가 시작된 경우
	  		if (auctionStartDate <= nowDate) {
	  			auctionCountDown = countdownFromEndDate(auctionEndDate);
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
  		 currentPriceElement.textContent =  new Intl.NumberFormat('ko-KR').format(currentPrice);
  }
}
 
 
 // restcontroller에서 찜리스트 가지고오기
 
 function getAuctionWishList() {
	
	 const xhr = new XMLHttpRequest();
	  xhr.onreadystatechange = function() {
	    if (xhr.readyState === 4 && xhr.status === 200) {
	      const response = JSON.parse(xhr.responseText);
	      
	       if(!response.getWishList) {
	    	  return;
	      }
	      
	      else { 
	      for(data of response.getWishList) {
	    	  
	    	  let currentPrice = 0;
	   
	    	  getCurrentPrice(data.auction_item_id);
	    	  updateAuctionCountDown(data.auction_item_id);
	      }
	      
	      }
	    }
	    
	  };
	  xhr.open("get", "/safari/auction/getMyWishListForRealTime");
	  xhr.send();		  
	
} 

window.addEventListener("DOMContentLoaded", function(){

	getAuctionWishList();
 
});
 
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	
</body>
</html>