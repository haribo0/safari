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
   @keyframes blink {
     0% { opacity: 1; }
     50% { opacity: 0; }
     100% { opacity: 1; }
   }

   .blink-text {
     animation: blink 2s infinite;
   }
   
   a {
   	list-style: none;
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
					<h5>입찰 목록</h5>						
				</div>
			</div>
			
			<div class="row mt-4">
				<div class="col">
					<span>
						<img class="mb-1" src="/safari/resources/img/auction/notice.png"
							style="max-width: 25px; max-height: 25px;"></span>
							<span class="fw-bold fs-5">참고사항</span>
				</div>
			</div>
			
			<div class="row">
				<div class="col">
					진행중인 경매의 <span class="fw-bold">현재가는 <span class="text-danger">실시간으로</span> 업데이트</span> 되고 있습니다.
				</div>
			</div>
		
	
			<div class="row mt-3 mb-4">
				<div class="col fw-bold fs-5">
					내가 입찰한 경매 목록
				</div>
			</div>
				
			<c:forEach items="${userBidList}" var="bidItem">
				<div class="row mt-2 mb-4">
				
				    <!--  이미지 -->
					<div class="col">
						<a href="/safari/auction/productDetail/${bidItem.id}">
							<img class="img-fluid align-middle" style="height: 120px;"
							src="/auctionFiles/${bidItem.auction_item_img_link}">
						</a>						
					</div>
					<!--  이미지 -->
					
					<!-- 둘째창 -->
					<div class="col-10">
						
						<div class="row">
							<div class="col-auto fw-bold fs-5 me-0">
								<a href="/safari/auction/productDetail/${bidItem.id}">
										${bidItem.title}
										<span id="statusLiveSpan_${bidItem.id}"></span>
								</a>
							</div>
							<div class="col" id="liveButton">
								
							</div>
							<div class="col d-flex justify-content-end" id="auctionStatus_${bidItem.id}">
								
							</div>
						</div>
						
						<div class="row mt-1 text-secondary fw-bold">
							<div class="col-auto">
								현재가 &nbsp;
								<span id="currentPrice_${bidItem.id}" class="text-danger fs-5 opacity-75"> </span>								
							</div>
							<div class="col" style="position: relative; top: 3px;">
								즉시낙찰가
								<span>
					 				<fmt:formatNumber value="${bidItem.max_price}" pattern="#,###"/>원
					 			</span> 								
							</div>
						</div>
						
						<div class="row mt-2">
							<div class="col">
								경매시작일 : <fmt:formatDate value="${bidItem.start_date}"  pattern="yyyy. MM. dd. a hh:mm"  />
							</div>
							<div class="col-auto">
							 	
							</div>
						</div>
						
						<div class="row">
							<div class="col">
								<span id="auctionEndDate_${bidItem.id}">경매종료일</span> 
							</div>
							<div class="col-auto fw-bold fs-5" id="remainTime_${bidItem.id}">
								
							</div>
						</div>
						
					</div>
					<!-- 둘째창 -->
				</div>
				</c:forEach>
			<!--  foreach -->	
			
		
		<%-- 공간 --%>
			
			
		
		
		</div>
	</div>
	</div>
	
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

<script>
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
  		 currentPriceElement.textContent =  new Intl.NumberFormat('ko-KR').format(currentPrice) + "원";
  }
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
    	  statusButton.classList.add("btn-outline-secondary");
          statusButton.innerText = "경매 종료";
    	  
      } else if (auctionStartDate <= nowDate) {
    	  statusButton.classList.add("btn-outline-success");
          statusButton.innerText = "진행중";
          
          const statusLiveSpan = document.getElementById("statusLiveSpan_" + id);
          if (statusLiveSpan.innerText != 'LIVE') {
        	statusLiveSpan.classList.add("text-danger", "fw-bold", "ms-3", "fs-5", "blink-text");
        	statusLiveSpan.innerText = "LIVE";
        	  
          }
          
          
      } else {
      	 statusButton.classList.add("btn-outline-primary");
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
      
      
      const auctionEndDateBox = document.getElementById("auctionEndDate_" + id);
      auctionEndDateBox.innerText = "경매종료일 : " +formattedauctionEndDate;
      
      
      
      let countDownTableBox = document.getElementById("remainTime_" + id);
      countDownTableBox.innerHTML = "";
      
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
	  	

	       	/* const remainTimeRow = document.createElement("div");
	       	remainTimeRow.classList.add("row");
	        remainTimeRow.classList.add("mt-1");
	        
	        const remainTimeCol = document.createElement("div");
	        remainTimeCol.classList.add("col", "fs-4");
	         */
	         
	        const timeIcon = document.createElement("i");
	        timeIcon.classList.add("bi", "bi-clock", "me-2");
        
	        countDownTableBox.appendChild(timeIcon);
		        
	         if (auctionCountDown.days > 0) {
		            const spanTime1 = document.createElement("span");
		            spanTime1.classList.add("fw-bold");
		            spanTime1.innerText = auctionCountDown.days + "일 ";  
		            countDownTableBox.appendChild(spanTime1);
	         	}
	        
	         if (auctionCountDown.hours > 0) {
	              const spanTime2 = document.createElement("span");
	              spanTime2.classList.add("fw-bold");
	              spanTime2.innerText = auctionCountDown.hours + "시간 ";
	              countDownTableBox.appendChild(spanTime2);
	            }
	          if (auctionCountDown.minutes > 0) {
	              const spanTime3  = document.createElement("span");
	              spanTime3.classList.add("fw-bold");
	              spanTime3.innerText = auctionCountDown.minutes + "분 ";
	              countDownTableBox.appendChild(spanTime3);
	            }		         

		       const spanTime4 = document.createElement("span");
		       spanTime4.classList.add("fw-bold");
		       spanTime4.innerText = auctionCountDown.seconds + "초 ";   
	 
		       countDownTableBox.appendChild(spanTime4);
		        
	
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
 
 
function getUserBidList() {
	
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


window.addEventListener("DOMContentLoaded", function(){
	getSessionId();
	getUserBidList();
	
});
</script>
</body>	
</html>