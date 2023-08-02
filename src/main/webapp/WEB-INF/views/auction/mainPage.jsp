<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사파리 | 경매메인</title>
<!-- 메타 섹션 -->
<jsp:include page="../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<link rel="stylesheet" href="/safari/resources/style/common.css" type="text/css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
<link rel="stylesheet" href="/safari/resources/style/auction.css" type="text/css">
<style>
.overflow1 {
  display: -webkit-box; /* Set the display type as a flexible box (WebKit) */
  -webkit-box-orient: vertical; /* Set the flex container to stack the elements vertically (WebKit) */
  -webkit-line-clamp: 2; /* Limit the number of lines to 2 (WebKit) */
  overflow: hidden;
  text-overflow: ellipsis;
  width: 300px;
}    

.text-like {
	color: #FF7777;
}

.overflow {
  white-space: nowrap; /* 텍스트를 한 줄로 표시 */
  overflow: hidden; /* 넘친 텍스트를 숨김 */
  text-overflow: ellipsis; /* 넘친 텍스트를 "..."으로 표시 */
}
.orangeButton{
	background: #ff6f0f;
	font-weight: bold;
	color: white;
}

.btn-outline-dark:hover {
	background: white;
	color: black;

}
</style>
<body>

<!-- 헤더 섹션 -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->

	

<div class="container">
		<div class="row">
			<div class="col">
				<div id="carouselExample" class="carousel slide">
				  <div class="carousel-inner">
				  <!--   <div class="carousel-item active">
				      <img class="d-block w-100"  src="/safari/resources/img/auction/Banner0.png" alt="..." >
				    </div> -->
				    <div class="carousel-item active">
				    	<img class="d-block w-100" src="/safari/resources/img/auction/bann.png">
				    </div>
				  
				  </div>
				<!--   <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Previous</span>
				  </button>
				  <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Next</span>
				  </button> -->
				</div>
			</div>
		</div>
	</div>


	<div class="container main_box mt-5">
	
		<div class="row">
			<div class="col-6">
			 
			 	<div class="row">
			 		<div class="col-9 fs-5 fw-bold">
			 			곧 마감 ! 놓치지 마세요
			 		</div>
			 		<div class="col mt-2 text-end fw-semibold" style="font-size: 16px;">
			 			<a href="/safari/auction/List" class="text-secondary">더보기</a>
			 		</div>
			 	</div>
			 
			 	<div class="row mt-3" id="deadlineList">
					
				</div>
				
				<div class="row mt-3">
					<div class="col text-end">
						<a href="/safari/auction/List" class="btn btn-sm  btn-outline-dark">경매 목록 더보기</a>
					</div>
				</div>
			 
				
			</div>
			<div class="col-1"></div>
			<div class="col ms-5">
			
				<div class="row">
					<div class="col fs-5 fw-bold">
						지금 Hot한 경매에요!
					</div>
				</div>
				
				<div class="row mt-1">
					<div class="col" style="font-size: 14px">
						최근 입찰이 많이 진행된 경매 목록
					</div>
				</div>
				
				<div class="row mt-3">
					<div class="col" id="bidRankList">
					
		
					
					
					</div>
				</div>
				

			</div>
		</div>
		
		
		<div class="row mt-5 mb-4">
			<div class="col">
			
			
				<div class="row">
					<div class="col fs-5 fw-bold">
						482 추천 경매 리스트
					</div>
					<div class="col mt-2 text-end fw-semibold" style="font-size: 16px;">
			 			<a href="/safari/auction/List" class="text-secondary">더보기</a>
			 		</div>
				</div>
				
				<div class="row mt-3" id="randomAuctionList">
			
			
			
			
				</div>
				
			</div>
		</div>
	
	
	</div>




<script>

//곧 마감되는 경매 출력
function getDeadlineList() {
	
	// 경매 종료 표시
	const xhr = new XMLHttpRequest();
	  xhr.onreadystatechange = function() {
	    if (xhr.readyState === 4 && xhr.status === 200) {
	      const response = JSON.parse(xhr.responseText);

	      const deadlineListBox = document.querySelector("#deadlineList");
	      deadlineListBox.innerHTML = "";
	      
	      for (data of response.deadlineList) {
	    	  
	    	const col = document.createElement("div");
          	col.classList.add("col-4", "mb-3", "position-relative");
          	col.id = "col_" + data.auctionDto.id;
          	
          	const timeSpan = document.createElement("span");
			timeSpan.classList.add("rounded-1", "px-2", "py-0", "text-white");
			timeSpan.style.backgroundColor = "#FF7777";
			timeSpan.style.position = "absolute";
			timeSpan.style.top = "10px";
			timeSpan.style.left = "22px";
			timeSpan.style.fontSize = "15px";
			timeSpan.style.border = "none";
			timeSpan.id = "timeSpan_" + data.auctionDto.id;
			
			col.appendChild(timeSpan);
			
	      	let currentPrice = 0;
	      	
	      	const endDate = countdownFromEndDate(data.auctionDto.end_date);
        	
        	// !!!!!!!!!!!!!  여기 너무 중요 함수 호출
        	updateAuctionCountDown(data.auctionDto.id);
        	getCurrentPrice(data.auctionDto.id);
        	// 여기 너무 중요 함수 호출
        	
       		const imageRow = document.createElement("div");
            imageRow.classList.add("row");
       	
          	const imageCol = document.createElement("div");
        	imageCol.classList.add("col");
        	imageCol.id = "imageCol_" + data.auctionDto.id;
        	
        	const imageLink =  document.createElement("a");
        	imageLink.classList.add("text-decoration-none", "d-inline-block");
        	imageLink.href = "/safari/auction/productDetail/" + data.auctionDto.id;
        	
         	const imageInfo = document.createElement("img");
        	imageInfo.classList.add("img-fluid", "align-middle", "text-center");
        	imageInfo.style.height= "auto";
        	imageInfo.style.height = "200px"; 
        	/* imageInfo.style.width = "220px";  */
        	imageInfo.src = "/auctionFiles/" + data.auctionMainImgDto.auction_item_img_link;
        	imageInfo.id = "imageInfo_" + data.auctionDto.id;
        	
        	imageLink.appendChild(imageInfo);
        	imageCol.appendChild(imageLink);
        	
        	imageRow.appendChild(imageCol);
        	
        	col.appendChild(imageRow);
        	
        	
        	
        	const titleRow = document.createElement("div");
        	titleRow.classList.add("row", "mt-2");
        	
        	const titleCol = document.createElement("div");
        	titleCol.classList.add("col", "overflow", "fw-medium");
        	titleCol.style.width = "200px";
        	titleCol.style.fontSize = "15px";
        	
        	
        	const titleLink = document.createElement("a");
     
        	titleLink.href = "/safari/auction/productDetail/" + data.auctionDto.id;
        	titleLink.innerText = data.auctionDto.title;
        	
        	titleCol.appendChild(titleLink);
        	
        	titleRow.appendChild(titleCol);
        	
        	col.appendChild(titleRow);
        	
        	
            const priceRow = document.createElement("div");
            priceRow.classList.add("row");
            
            const priceCol = document.createElement("div");
            priceCol.classList.add("col");
            
            
            const nowSpan = document.createElement("span");
            nowSpan.classList.add("opacity-90", "fw-bold", "fs-5");
            nowSpan.id = "currentPrice_" + data.auctionDto.id;
            nowSpan.style.color = "#ff6f0f";
            
            const wonSpan = document.createElement("span");
            wonSpan.classList.add("ms-1");
            wonSpan.innerText = "원";
            
            priceCol.appendChild(nowSpan);
            priceCol.appendChild(wonSpan);
            
            priceRow.appendChild(priceCol);
            
            col.appendChild(priceRow);
        	
          	
	    	  
        	deadlineListBox.appendChild(col);  
	    	  
	      }
	      
	      
	    }
	  }
	  
      xhr.open("get", "/safari/auction/getdeadlineApproachingAuctonList");
      xhr.send();
}


//경매 종료일로부터의 카운트다운 함수
function countdownFromEndDate(endDate) {
	  // 현재 시간
	  var current = new Date();

	  // 차이 계산 (밀리초 단위)
	  var difference = endDate - current.getTime();

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
  const bidCurrentPriceElement = document.getElementById("bidCurrentPrice_" + auctionItemId);
  const randomCurrentPriceElement = document.getElementById("randomCurrentPrice_" + auctionItemId);
  	if (currentPriceElement) {
  		 currentPriceElement.textContent =  new Intl.NumberFormat('ko-KR').format(currentPrice);
  	}
   if (bidCurrentPriceElement) {
	   bidCurrentPriceElement.textContent = new Intl.NumberFormat('ko-KR').format(currentPrice);
   }
   if (randomCurrentPriceElement) {
	   randomCurrentPriceElement.textContent = new Intl.NumberFormat('ko-KR').format(currentPrice);
   }
}


//경매 정보를 업데이트하고 화면에 출력하는 함수
function updateAuctionCountDown(id) {

	const xhr = new XMLHttpRequest();
	
	 xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status == 200){
            const response = JSON.parse(xhr.responseText);

		      const nowDate = new Date();
		
		 	  const timeSpan = document.getElementById("timeSpan_" + id);
		 	  timeSpan.innerHTML = "";
		  		
			  let auctionCountDown;
			  
			  //auctionCountDown = countdownFromEndDate(data.auctionDto.id);
			  
			  const auctionEndDate = new Date(response.auctionItem.auctionDto.end_date); // 경매 종료일
			  
			  auctionCountDown = countdownFromEndDate(auctionEndDate);
			  
			  if (auctionEndDate <= nowDate || response.auctionItem.auctionDto.auction_status == '종료') {
				
					timeSpan.style.backgroundColor = "#6c757d";
					timeSpan.innerText = "경매 종료";
					renewAuctionItemStatusEnd(id);
					
					return;
			  }
		  		
			  else {
			  			
		      if (auctionCountDown.days > 0) {
		          
		          const timeSpan1 = document.createElement("span");
		          timeSpan1.innerText = auctionCountDown.days + "일 ";
		          timeSpan1.classList.add("fw-bold");
		          timeSpan.appendChild(timeSpan1);
		       
		      	}
		     
		      if (auctionCountDown.hours > 0) {
		           
		           const timeSpan2 = document.createElement("span");
		           timeSpan2.classList.add("fw-bold");
		           if (auctionCountDown.hours < 10)  {
		         	  timeSpan2.innerText = "0" + auctionCountDown.hours + ":";
		           } 
		           else {
		        	timeSpan2.innerText = auctionCountDown.hours + ":";
		           }
		         
		           timeSpan.appendChild(timeSpan2);
		       
		         } else {
		         	const timeSpan2 = document.createElement("span");
			        timeSpan2.classList.add("fw-bold");
			        timeSpan2.innerText = "00"+":";
			        timeSpan.appendChild(timeSpan2);
		         }
		      
		      if (auctionCountDown.minutes > 0) {
		          
		           const timeSpan3 = document.createElement("span");
		           timeSpan3.classList.add("fw-bold");
		           if (auctionCountDown.minutes < 10)  {
		        	timeSpan3.innerText = "0" + auctionCountDown.minutes + ":";
		           } else {
		             timeSpan3.innerText = auctionCountDown.minutes + ":";
		           }
		           timeSpan.appendChild(timeSpan3);
		           
		         }  else {
		         	
		          const timeSpan3 = document.createElement("span");
		          timeSpan3.classList.add("fw-bold");
		          timeSpan3.innerText = "00"+":";
		          timeSpan.appendChild(timeSpan3);
		         	
		         }		         
		
			     const timeSpan4 = document.createElement("span");
			     timeSpan4.classList.add("fw-bold");
			     if (auctionCountDown.seconds < 10) {
			     		timeSpan4.innerText = "0" + auctionCountDown.seconds;
			     } else {
			  	   timeSpan4.innerText = auctionCountDown.seconds;
			     }
			     timeSpan.appendChild(timeSpan4);
			  }
		
		
			     setTimeout(function() {
			         updateAuctionCountDown(id);
			       }, 1000);  
	        }
	 }
	 
     xhr.open("get", "/safari/auction/getAuctionItemInfo/" + id);
     xhr.send();
 }
 
 
//경매 정보를 업데이트하고 화면에 출력하는 함수
function updateAuctionBidList(id) {
	
	const xhr = new XMLHttpRequest();
	
	 xhr.onreadystatechange = function () {
       if(xhr.readyState == 4 && xhr.status == 200){
           const response = JSON.parse(xhr.responseText);

           const nowDate = new Date();
           const auctionEndDate = new Date(response.auctionItem.auctionDto.end_date); // 경매 종료일
           
           if (auctionEndDate <= nowDate || response.auctionItem.auctionDto.auction_status == '종료') {
				
				renewAuctionItemStatusEnd(id);
           }

       }
	 }  
	 xhr.open("get", "/safari/auction/getAuctionItemInfo/" + id);
     xhr.send();
}
 
 
 // 인기 있는 경매 출력
function getAuctionOrderByBidCount() {
	 
	const xhr = new XMLHttpRequest();
	
	const bidRankBox = document.querySelector("#bidRankList");
	bidRankBox.innerHTML = "";
	
	 xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status == 200){
            const response = JSON.parse(xhr.responseText);
	        
            let num = 1;
            
            for (data of response.maxBidList) {
            	
            	getCurrentPrice(data.id);
            	updateAuctionBidList(data.id);
            	
            	const row = document.createElement("div");
            	row.classList.add("row", "mb-3");
            	
            	const col1 = document.createElement("div");
            	col1.classList.add("col-auto", "fw-bold", "fs-4", "py-0");
            	col1.style.position = "relative";
            	col1.style.bottom = "4px";
            	col1.innerText = num;
            	num++;
            	
            	const col2 = document.createElement("div");
            	col2.classList.add("col-8");
            	
            	const titleRow = document.createElement("div");
            	titleRow.classList.add("row");
            	
            	const titleLink = document.createElement("a");
            	titleLink.href = "/safari/auction/productDetail/" + data.id;
            	
            	const titleCol = document.createElement("div");
            	titleCol.classList.add("fw-medium");
            	titleCol.innerText = data.title;
            	
            	titleLink.appendChild(titleCol);
            	
            	titleRow.appendChild(titleLink);
            	
            	const priceCategoryRow = document.createElement("div");
            	priceCategoryRow.classList.add("row");
            	
            	const priceCol = document.createElement("div");
            	priceCol.classList.add("col-auto");
            
            	
            	const nowSpan = document.createElement("span");
                nowSpan.classList.add("opacity-90", "fw-bold", "fs-5");
                nowSpan.id = "bidCurrentPrice_" + data.id;
                nowSpan.style.color = "#ff6f0f";
                
                const wonSpan = document.createElement("span");
                wonSpan.classList.add("ms-1");
                wonSpan.innerText = "원";
                
                priceCol.appendChild(nowSpan);
                priceCol.appendChild(wonSpan);
            	
            	const categoryCol = document.createElement("div");
            	categoryCol.classList.add("col", "text-secondary", "mt-2", "px-0");
            	categoryCol.style.fontSize = "13px";
            	
            	const bigSpan = document.createElement("span");
            	bigSpan.innerText = data.main_category_name;
            	
            	const arrowSpan = document.createElement("span");
            	arrowSpan.classList.add("ms-2");
            	arrowSpan.style.fontSize = "12px";
            	arrowSpan.innerText = ">";
            	arrowSpan.classList.add("mt-2");
            	
            	const smallSpan = document.createElement("span");
            	smallSpan.classList.add("ms-2");
            	smallSpan.innerText = data.sub_category_name;
            	
            	categoryCol.appendChild(bigSpan);
            	categoryCol.appendChild(arrowSpan);
            	categoryCol.appendChild(smallSpan);
            	
            	priceCategoryRow.appendChild(priceCol);
            	//priceCategoryRow.appendChild(categoryCol);
            	
            	col2.appendChild(titleRow);
            	col2.appendChild(priceCategoryRow);
            	
            	const col3 = document.createElement("div");
            	col3.classList.add("col");
            	
            	const imgLink = document.createElement("a");
            	imgLink.href = "/safari/auction/productDetail/" + data.id;
            	
            	const img = document.createElement("img");
            	img.classList.add("img-fluid");
            	img.src = "/auctionFiles/" + data.auction_item_img_link;
            	
            	imgLink.appendChild(img);
            	col3.appendChild(imgLink);
            	
            	row.appendChild(col1);
            	row.appendChild(col2);
            	row.appendChild(col3);
            	
            	
            	bidRankBox.appendChild(row);
     
            }

	    }
	 }    
     xhr.open("get", "/safari/auction/getAuctionOrderByBidCount");
     xhr.send();
 }
 
//경매 종료일 지났으면 경매 상태를 종료로 업데이트 (DB에 정보 업데이트)
function renewAuctionItemStatusEnd(auctionItemId) {
	
	 const xhr = new XMLHttpRequest();

	 xhr.onreadystatechange = function() {
	    if (xhr.readyState === 4 && xhr.status === 200) {
	      const response = JSON.parse(xhr.responseText);
		  
	      
	      // 경매 상태 조회 시 종료가 아닐 경우에만 db에 상태 업데이트
	      if (response.auctionItemStatus.auction_status != '종료') {
	    	  
	    	  const xhrUpdateStatus = new XMLHttpRequest();
	    	  xhrUpdateStatus.onreadystatechange = function() {
	    	  if (xhrUpdateStatus.readyState === 4 && xhrUpdateStatus.status === 200) {
	    		  

	    	  }
	        };
	        xhrUpdateStatus.open("get", "/safari/auction/renewAuctionItemStatusEnd/" + auctionItemId);
	        xhrUpdateStatus.send();
	        
	      }
	      

		  }
	 }
	 
    xhr.open("get", "/safari/auction/getAuctionStatusByAuctionItemId/" + auctionItemId); // 수정하기
    xhr.send();  
}

 
 

 // 랜덤 추출 - 현재가 업데이트
function getAuctionListByRandom() {
	
	 const xhr = new XMLHttpRequest();
	
	 const randomListBox = document.querySelector("#randomAuctionList");
	
	 xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status == 200){
            const response = JSON.parse(xhr.responseText);
	 
            for (data of response.ranAuctionList) {
            	
            	const col = document.createElement("div");
            	col.classList.add("col-2");
            	
            	const row1 = document.createElement("div");
            	row1.classList.add("row");
            	
            	const col1 = document.createElement("div");
            	col1.classList.add("col");
            	
            	const imgLink = document.createElement("a");
            	imgLink.href = "/safari/auction/productDetail/" + data.id;
            	
            	const img = document.createElement("img");
            	img.classList.add("img-fluid");
            	img.style.height = "200px";
            	img.src = "/auctionFiles/" + data.auction_item_img_link;
            	
            	imgLink.appendChild(img);
            	
            	col1.appendChild(imgLink);
            	row1.appendChild(col1);
            	
            	const row2 = document.createElement("div");
            	row2.classList.add("row", "mt-1");
            	
            	const col2 = document.createElement("div");
            	col2.classList.add("col", "overflow1", "fw-medium");
            	
            	const titleLink = document.createElement("a");
            	titleLink.href = "/safari/auction/productDetail/" + data.id;
            	titleLink.innerText = data.title;
            	
            	col2.appendChild(titleLink);
            	row2.appendChild(col2);
            	
            	const row3 = document.createElement("div");
            	row3.classList.add("row", "mt-1");
            	
            	const col3 = document.createElement("div");
            	col3.classList.add("col");
            	
            	const price = document.createElement("span");
            	price.classList.add("fw-semibold");
            	price.id = "randomCurrentPrice_" + data.id;
                price.style.color = "#ff6f0f";
                price.style.fontSize = "18px";
    
                getCurrentPrice(data.id); 
                
                const won = document.createElement("span");
                won.classList.add("ms-1");
                won.innerText = "원";
                
               
                col3.appendChild(price);
                col3.appendChild(won);
             
                
                row3.appendChild(col3);
                //row3.appendChild(heartCol);
                
                const row4 = document.createElement("div");
                row4.classList.add("row");
                
                const heartCol = document.createElement("div");
                heartCol.classList.add("col");
                
                const heartSpan = document.createElement("i");
                heartSpan.classList.add("bi", "text-like", "bi-heart-fill");
                
                heartCol.appendChild(heartSpan);
                
                row4.appendChild(heartCol);
               

				col.appendChild(row1);
				col.appendChild(row2);
				col.appendChild(row3);
				//col.appendChild(row4);
            	
				randomListBox.appendChild(col);
            	
           }
      	}
	 }
	 xhr.open("get", "/safari/auction/getAuctionListByRandom");
     xhr.send();
 }
 

window.addEventListener("DOMContentLoaded", function(){

	getDeadlineList();
	getAuctionOrderByBidCount();
	getAuctionListByRandom();
 
});




</script>


</body>
</html>



