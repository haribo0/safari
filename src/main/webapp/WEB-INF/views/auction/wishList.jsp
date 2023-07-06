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
</head>
<body>

	<!-- 헤더 섹션 -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->
	<div class="container d-flex mt-5">
	<div style="width: 24%;">
		<h2 class="fw-bold">마이페이지</h2>
		
		<ul class="list-group mt-4">
		<li class="list-group-item border border-0 pb-0"><a class="btn fs-5 text fw-bold py-1" href="#">회원정보</a></li>
		  	<div class="" id="">
				<ul class="list-group ms-4">
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">회원정보수정</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">배송지관리</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">찜</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">1:1문의</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">리뷰관리</a></li>
				</ul>
			</div>
			
		
		  <li class="list-group-item border border-0 pb-0"><a class="btn fs-5 text fw-bold py-1" href="#collapse1">중고</a></li>
		  	<div class="" id="">
				<ul class="list-group ms-4">
					<li class="list-group-item border-0"><a href="../used/chatList" class="btn py-0 text-body-secondary">채팅방 목록</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">리스트제목</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">리스트제목</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">리스트제목</a></li>
				</ul>
			</div>
			
		  <li class="list-group-item border border-0 pb-0"><a class="btn fs-5 text fw-bold py-1" href="#">대여</a></li>
		  	<div class="" id="">
				<ul class="list-group ms-4">
					<li class="list-group-item border-0"><a href="./myOrderListPage" class="btn py-0 text-body-secondary">오더리스트</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">리스트제목</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">리스트제목</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">리스트제목</a></li>
				</ul>
			</div>
			
		  <li class="list-group-item border border-0 pb-0"><a class="btn fs-5 text fw-bold py-1" href="/safari/auction/myPage" >경매</a></li>
		  	<div class="" id="">
				<ul class="list-group ms-4">
					<li class="list-group-item border-0"><a href="/safari/auction/bidList" class="btn py-0 text-body-secondary">입찰목록</a></li>
					<li class="list-group-item border-0"><a href="/safari/auction/successBidList" class="btn py-0 text-body-secondary">낙찰목록</a></li>
					<li class="list-group-item border-0"><a href="/safari/auction/wishList" class="btn py-0 text-body-secondary">찜</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">구매한 상품</a></li>
				</ul>
			</div>
			
		  <li class="list-group-item border border-0 pb-0"><a class="btn fs-5 text fw-bold py-1" href="#" >커뮤니티</a></li>
		  	<div class="" id="">
				<ul class="list-group ms-4">
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">리스트제목</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">리스트제목</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">리스트제목</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">리스트제목</a></li>
				</ul>
			</div>
		</ul>
	</div>
		
	<div class="pt-2 w-100">
		
		<div class="row">
			<div class="col ms-4">
			
				<div class="row">
					<div class="col fs-5">
						<span><img class="mb-1" src="/safari/resources/img/auction/notice.png"
						style="max-width: 30px; max-height: 30px;"></span>
						진행중인 경매의 현재가는 실시간으로 업데이트되고 있습니다.
					</div>
				</div>
			
				<div class="row mt-3">
					<div class="col fw-bold fs-4">
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
				
				<div class="row mt-3">
					<div class="col">

					<div class="row flex-wrap pt-2">
			 				<c:forEach items="${auctionWishList}" var="wish">
								<div class="col-3 me-5" style="cursor: pointer;">
									<div class="card border border-0 " style="width: 20rem;">
										<div class="row px-3">
											<div class="col pe-3">
												<a href="/safari/auction/productDetail/${wish.id}" class="text-decoration-none d-inline-block">
												  <img src="/auctionFiles/${wish.auction_item_img_link}" class="img-fluid card-img-top object-fit-cover" alt="..." 
												  	style="max-width: 220px; max-height: 220px;" >
												</a>
											</div>
										</div>
										
										
									  <div class="card-body ps-0">
									  	<div class="d-flex justify-content-between">
									    	<p class="text-dark mb-0 fw-bold">
									    		<a href="/safari/auction/productDetail/${wish.id}" class="text-decoration-none d-inline-block text-dark">
									    			${wish.title}</a>   <span id="auctionStatus_${wish.id}" class="ms-2"> </span></p>
									  		<%--<p class="mb-0" style="position: relative; bottom: 260px;"><span class="fw-bold" id="totalLikeCount"></span><i id="heartBox" onclick="toggleLike(${map.rentalItemDto.id})" class="text-danger bi bi-heart heart_box" data-item-id="${map.rentalItemDto.id}" style="font-size: 18px;"></i></p> --%>
									  	</div>
									  	
									  	<p class="mb-0">
									  		${wish.main_category_name} > ${wish.sub_category_name}
									  	</p>
 										<p class="mb-0">
									    	현재가&nbsp;<span class="fs-5 text-danger fw-bold" id="currentPrice_${wish.id}"></span>
									    </p>									  	
									  	
									    <p id="remainTime_${wish.id}">
									  
									    </p>
									    								    
									    <p>
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
      statusButton.classList.add("btn-sm");
      statusButton.classList.add("fw-bold");
      statusButton.classList.add("disabled");
      if (auctionEndDate <= nowDate || response.auctionItem.auctionDto.auction_status == '종료') {  
    	  statusButton.classList.add("btn-outline-danger");
          statusButton.innerText = "경매 종료";
    	  
      } else if (auctionStartDate <= nowDate) {
    	  statusButton.classList.add("btn-outline-success");
          statusButton.innerText = "진행중";
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
      
      
    //  const auctionEndDateBox = document.getElementById("auctionEndDate_" + id);
     // auctionEndDateBox.innerText = "경매종료일 : " +formattedauctionEndDate;
      
      
      
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
	  	

	       	const remainTimeRow = document.createElement("div");
	       	remainTimeRow.classList.add("row");
	        //remainTimeRow.classList.add("mt-1");
	        
	        const remainTimeCol = document.createElement("div");
	        remainTimeCol.classList.add("col", "fs-5");
	        remainTimeCol.innerText = "남은 시간 : "
	        
 
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
  		 currentPriceElement.textContent =  new Intl.NumberFormat('ko-KR').format(currentPrice) + "원 \u00A0\u00A0\u00A0";
  }
}
 
 
 // restcontroller에서 찜리스트 가지고오기
 
 function getAuctionWishList() {
	
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

	getAuctionWishList();
 
});
 
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	
</body>
</html>