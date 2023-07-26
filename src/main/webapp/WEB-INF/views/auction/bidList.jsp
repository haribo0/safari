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
.overflow {
  white-space: nowrap; /* 텍스트를 한 줄로 표시 */
  overflow: hidden; /* 넘친 텍스트를 숨김 */
  text-overflow: ellipsis; /* 넘친 텍스트를 "..."으로 표시 */
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
					<h5>입찰 내역</h5>						
				</div>
			</div>
			
	
			<div class="row mt-4">
   				<div class="col">
   					• &nbsp; 입찰하신 경매 목록 중에서 현재 진행중인 경매만 표시됩니다.
   				</div>
   			</div>
   			
   			<div class="row mt-1">
   				<div class="col">
   					• &nbsp; 본인이 최고입찰자일 경우 최고입찰가는 <span class="text-success">초록색</span>으로 표시됩니다.
   				</div>
   			</div>
   			
   			<div class="row mt-1">
   				<div class="col">
   					• &nbsp; 본인이 최고입찰자가 아닐 경우 최고입찰가는 <span class="text-danger">빨간색</span>으로 표시됩니다.
   				</div>
   			</div>
   			
   			 <div class="row mt-1">
   				<div class="col">
   					• &nbsp; 경매 당 최고입찰가(현재가)는 <span class="fw-semibold">실시간으로 업데이트</span>되고 있습니다.
   				</div>
   			</div>
		
		
			<div class="row mt-4">
				<div class="col fw-semibold fs-5">
					내가 입찰한 경매 목록
				</div>
			</div>
			
			<div class="row mt-3">
				<div class="col">
					 <input class="form-check-input me-2" type="radio" id="radioStatusIng" name="radioStatus" value="ing" style="cursor:pointer";>
					  <label class="form-check-label me-4" for="radioStatusIng">
					    	진행중인 경매만 보기
					  </label>
					  <input class="form-check-input me-2" type="radio" id="radioStatus" name="radioStatus" value="" style="cursor:pointer";>
	  					<label class="form-check-label me-4" for="radioStatus">
	    					전체보기
	  				</label>	
				</div>
			</div>

				<%-- 표 공간 --%>
				<div class="row mt-4 mb-4">
					<div class="col">	
				
						<table class="table">
							<thead>
								<tr class="text-center">
									<td class="custom-table-secondary" style="width: 540px">상품정보</td>
									<td class="custom-table-secondary">내 입찰가</td>
									<td class="custom-table-secondary">최고입찰가</td>
									<td class="custom-table-secondary">입찰수</td>
									<td class="custom-table-secondary">남은시간</td>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty userBidList}">
									<tr class="text-center">
										<td colspan="5">입찰 정보가 없습니다.</td>
									</tr>
								</c:if>
								<c:forEach items="${userBidList}" var="bidDto">
									<tr>
										<td class="align-middle">
										<div class="row">
											<div class="col-3">
												<a href="/safari/auction/productDetail/${bidDto.id}">
													<img src="/auctionFiles/${bidDto.auction_item_img_link}" style="
													width: 120px; height: 120px;" class="img-fluid"></a>
											</div>
											<div class="col ms-1">
												<div class="row mt-4">
													<div class="col ms-1" style="font-size: 14px;">
														${bidDto.main_category_name} > ${bidDto.sub_category_name}
													</div>
												</div>
												<div class="row">
													<div class="col ms-1 fw-semibold">
														<span style="font-size: 16px;"><a href="/safari/auction/productDetail/${bidDto.id}">
														${bidDto.title}</a></span>
													</div>
												</div>											
											</div>
										</div>	
									</td>
									<td class="align-middle text-center">
										<input type="hidden" id="bidPrice_${bidDto.id}" value="${bidDto.bid_price}">
										<span class="fw-bold" style="font-size: 18px;">
										<fmt:formatNumber value="${bidDto.bid_price}"  pattern="#,###"/></span> 원
									</td>
									<td class="align-middle text-center">
										<span class="fw-bold" style="font-size: 18px;" id="currentPrice_${bidDto.id}"></span> 원
									</td>
									<td class="align-middle text-center">
										<span id="bidCount_${bidDto.id}"></span>
									</td>
									<td class="align-middle text-center">
										<span id="remainTime_${bidDto.id}"></span>
									</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
			<%-- 표 공간 --%>
				</div>
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
	            
	            const currentPriceElement = document.getElementById("currentPrice_" + auctionItemId);
	            const myBidPriceElement = document.getElementById("bidPrice_" + auctionItemId);
	           
	            
	            if (myBidPriceElement.value < currentPrice) {
	            
	          	  currentPriceElement.style.color = "red";
	            } else {
	          	  currentPriceElement.style.color = "green";
	            }
	            
	            currentPriceElement.textContent =  new Intl.NumberFormat('ko-KR').format(currentPrice);
	           
	        }
	  } 
	 
	  xhr.open("get", "/safari/auction/getCurrentPrice?auctionItemId=" + auctionItemId);
	  xhr.send();	  
	  
	    setTimeout(function() {
	    	 getCurrentPrice(auctionItemId);
	       }, 1000); // 10초 간격으로 함수 호출 (1000ms = 1초)
		  	  
}

//현재가를 업데이트하여 jsp화면에 출력
/* function updateCurrentPrice(auctionItemId, currentPrice) {
  const currentPriceElement = document.getElementById("currentPrice_" + auctionItemId);
  
  const myBidPriceElement = document.getElementById("bidPrice_" + auctionItemId);
  
  if (myBidPriceElement.value < currentPrice) {
	  currentPriceElement.style.color = "red";
  } else {
	  currentPriceElement.style.color = "green";
  }
	  
  
  	if (currentPriceElement) {
  		 currentPriceElement.textContent =  new Intl.NumberFormat('ko-KR').format(currentPrice);
  }
}
 */

//경매 정보를 업데이트하고 화면에 출력하는 함수
function updateAuctionCountDown(id) {
	
  
  const xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function() {
    if (xhr.readyState === 4 && xhr.status === 200) {
      const response = JSON.parse(xhr.responseText);
      
      const nowDate = new Date();

      const auctionEndDate = new Date(response.auctionItem.auctionDto.end_date); // 경매 종료일
      const auctionStartDate = new Date(response.auctionItem.auctionDto.start_date); // 경매 시작일
 
      let countDownTableBox = document.getElementById("remainTime_" + id);
      countDownTableBox.innerHTML = "";

	  	// 경매가 종료된 경우
	  	if (auctionEndDate <= nowDate || response.auctionItem.auctionDto.auction_status == '종료') {
	  		
	  		const row = document.createElement("div");
	  		row.classList.add("row");
	  		
	  		const col = document.createElement("div");
	  		col.classList.add("col");
	  		
	  		col.innerText = "경매 종료";
	  		
	  		row.appendChild(col);
	  		
	  		countDownTableBox.appendChild(row);

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
	  	
	  		const row = document.createElement("div");
	  		row.classList.add("row");
	  		
	  		const col = document.createElement("div");
	  		col.classList.add("col");

	   
	        const timeIcon = document.createElement("i");
	        timeIcon.classList.add("bi", "bi-clock", "me-2");
        
	        col.appendChild(timeIcon);
		        
	         if (auctionCountDown.days > 0) {
	        	 
	        	 const timeSpan1 = document.createElement("span");
	             timeSpan1.innerText = auctionCountDown.days + "일 ";
	  
		         col.appendChild(timeSpan1);
	         	}
	        
	         if (auctionCountDown.hours > 0) {
	        	 
	        	   const timeSpan2 = document.createElement("span");
	               if (auctionCountDown.hours < 10)  {
	             	  timeSpan2.innerText = "0" + auctionCountDown.hours + ":";
	               } 
	               else {
	               	timeSpan2.innerText = auctionCountDown.hours + ":";
	               }
	             
	              col.appendChild(timeSpan2);
	            }  
	         	else {
	          	  
	           		const timeSpan2 = document.createElement("span");
	                timeSpan2.innerText = "00"+":";
	                col.appendChild(timeSpan2);
	              }
	         
	         if (auctionCountDown.minutes > 0) {
	           
	             const timeSpan3 = document.createElement("span");
	             if (auctionCountDown.minutes < 10)  {
	               	timeSpan3.innerText = "0" + auctionCountDown.minutes + ":";
	               } else {
	                 timeSpan3.innerText = auctionCountDown.minutes + ":";
	               }
	              col.appendChild(timeSpan3);
	           }
	         
	         else {

	          	  const timeSpan3 = document.createElement("span");
	               timeSpan3.classList.add("fw-bold");
	               timeSpan3.innerText = "00"+":";
	               col.appendChild(timeSpan3);
	             }         

	         const timeSpan4 = document.createElement("span");
	         if (auctionCountDown.seconds < 10)  {
	           	timeSpan4.innerText = "0" + auctionCountDown.seconds;
	           } else {
	             timeSpan4.innerText = auctionCountDown.seconds;
	           }
	         col.appendChild(timeSpan4);
		       
		      row.appendChild(col); 
		      countDownTableBox.appendChild(row);
		      
	
      	
		        setTimeout(function() {
		            updateAuctionCountDown(id);
		          }, 1000); // 10초 간격으로 함수 호출 (1000ms = 1초)
	
	  		}

	    }
	  }

      xhr.open("get", "/safari/auction/getAuctionItemInfo/" + id);
      xhr.send();

 }
 
//입찰 수 실시간으로 갱신
function getBidCount(id) {
	
	const xhr = new XMLHttpRequest();

   	xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
 
            const response = JSON.parse(xhr.responseText);
            
            const auctionBidCount = document.getElementById("bidCount_" + id);
            auctionBidCount.innerHTML = "";
            
            const row = document.createElement("div");
            row.classList.add("row");
            
            const col = document.createElement("div");
            col.classList.add("col");
            
       

            const bidCount = document.createElement("span");
            bidCount.classList.add("ms-1");
            bidCount.innerText = response.bidCount + "명";
            
            col.appendChild(bidCount);
            
           	
           	row.appendChild(col);
           	
           	auctionBidCount.appendChild(row);
           	
            setTimeout(function() {
            	getBidCount(id);
   	       }, 1000); 
            
        }
        
   	}  
    xhr.open("get", "/safari/auction/getBidCount?auctionItemId=" + id);
    xhr.send();   	
} 
 
 
//경매 진행 상태
/* let status = null;


document.addEventListener('DOMContentLoaded', function() {
	
    document.getElementById('radioStatus').addEventListener('click', function() {
       	
    	getUserBidList();
        
    });	
    // 진행중인 버튼 클릭 시
    document.getElementById('radioStatusIng').addEventListener('click', function() {
        status = 'ing'; // 전역 변수에 'ing' 할당
        getUserBidListIng();
        status = null;
    });

    
}); */
 
 
/* function getUserBidListIng() {
	
	 const xhr = new XMLHttpRequest();
	  xhr.onreadystatechange = function() {
	    if (xhr.readyState === 4 && xhr.status === 200) {
	      const response = JSON.parse(xhr.responseText);
	      
	      for(data of response.getAuctionList) {
	    	  
	    	  let currentPrice = 0;
	    	  
	    	  getCurrentPrice(data.id);
	    	  updateAuctionCountDown(data.id);
	    	  getBidCount(data.id);
	      }
	    }
	    
	  };
	  xhr.open("get", "/safari/auction/getMyBidListIng");
	  xhr.send();		  
	
}   */
 
  
function getUserBidList() {
	
	 const xhr = new XMLHttpRequest();
	  xhr.onreadystatechange = function() {
	    if (xhr.readyState === 4 && xhr.status === 200) {
	      const response = JSON.parse(xhr.responseText);
	      
	      if(!response.myBidList) {
	    	  return;
	      }
	      
	      
	      for(data of response.myBidList) {
	    	  
	    	  let currentPrice = 0;
	    	  
	    	  getCurrentPrice(data.id);
	    	  updateAuctionCountDown(data.id);
	    	  getBidCount(data.id);
	      }
	    }
	    
	  };
	  xhr.open("get", "/safari/auction/getMyBidList");
	  xhr.send();		  
	
} 


window.addEventListener("DOMContentLoaded", function(){
	getSessionId();
	getUserBidList();
	
});
</script>
</body>	
</html>