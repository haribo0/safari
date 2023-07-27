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

  .form-check-input:checked {
   	border-color: black;
      background-color: black; /* 원하는 색상으로 변경 */
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


</style>
<script>
let sessionId = null;

// 세션 아이디 확인
function getSessionId() {
		
    const xhr = new XMLHttpRequest();
 
    xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status == 200){
            const response = JSON.parse(xhr.responseText);

            if(response.result == "success") {
                sessionId = response.id;
            }
            
        }
    }	

    xhr.open("get", "/safari/auction/getUserId",false);
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
  		 currentPriceElement.textContent =  new Intl.NumberFormat('ko-KR').format(currentPrice);
  }
}


//경매 정보를 업데이트하고 화면에 출력하는 함수
function updateAuctionCountDown(id) {
	
  const xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function() {
    if (xhr.readyState === 4 && xhr.status === 200) {
      const response = JSON.parse(xhr.responseText);

      const auctionEndDate = new Date(response.auctionItem.auctionDto.end_date); // 경매 종료일
      const auctionStartDate = new Date(response.auctionItem.auctionDto.start_date); // 경매 시작일
      
      const nowDate = new Date();
   

      let countDownTableBox = document.getElementById("auctionCountDownTime_" + id);
      countDownTableBox.innerHTML = "";
      

	  	// 경매가 종료된 경우
	  	if (auctionEndDate <= nowDate || response.auctionItem.auctionDto.auction_status == '종료') {
	  		
	  		renewAuctionItemStatusEnd(id);
	  		
	  		const colInfo = document.getElementById("col_" + id);
	  			  		
	  		colInfo.classList.add("opacity-75");
	  		
	  		
	  		const timeSpan = document.getElementById("timeSpan_" + id);
	  		
	  		if (timeSpan) {
	  		
		  		timeSpan.innerHTML = "";
		  		
				timeSpan.style.backgroundColor = "#6c757d";
				timeSpan.style.position = "absolute";
				timeSpan.style.top = "10px";
				timeSpan.style.left = "22px";
				timeSpan.style.fontSize = "14px";
				timeSpan.style.border = "none";
				timeSpan.innerText = "경매 종료";
		  		
				colInfo.appendChild(timeSpan);
	  		} else {
	  			const timeSpan = document.createElement("span");
		  		timeSpan.classList.add("rounded-1", "px-2", "py-0", "text-white");
				timeSpan.style.backgroundColor = "#6c757d";
				timeSpan.style.position = "absolute";
				timeSpan.style.top = "10px";
				timeSpan.style.left = "22px";
				timeSpan.style.fontSize = "14px";
				timeSpan.style.border = "none";
				timeSpan.innerText = "경매 종료";
				colInfo.appendChild(timeSpan);
	  		}
	
	  		return;
	  	} 
	  	// 경매가 시작되었거나 준비중인 경우
	  	else {
	  		let auctionCountDown;
	  		// 경매가 시작된 경우
	  		if (auctionStartDate <= nowDate) {
	  			
	  			renewAuctionItemStatusIng(id);
	  			
	  			auctionCountDown = countdownFromEndDate(auctionEndDate);
		        
		        const col = document.getElementById("col_" + id);
		       
		        const timeSpan = document.getElementById("timeSpan_" + id);
		        timeSpan.innerHTML = "";
		        
		        const imageCol = document.getElementById("imageCol_" + id);
		        imageCol.classList.remove("position-relative");
		        
		        const divLink = document.getElementById("divLink_" + id);
	  			if (divLink) {
	  				divLink.style.display = "none";
	  			}
	  			
	  			const clockSpan = document.getElementById("clockSpan_" + id);
	  			if (clockSpan) {
	  				clockSpan.style.display = "none";
	  			}
	 

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
	  		
	  		// 경매가 준비중인 경우
	  		else {
	  			
	  			const colInfo = document.getElementById("col_" + id);
	  			
	  			const clock = document.getElementById("clockSpan_" + id);
	  			
	  			const imageCol = document.getElementById("imageCol_" + id);
	  			imageCol.classList.add("position-relative");
	  			
	  			const divLink = document.createElement("a");
	  			divLink.href = "/safari/auction/productDetail/" + id;
	  			divLink.id = "divLink_" + id;
	  			
	  			
	  		 	const div = document.createElement("div");
	  			div.classList.add("position-absolute");
	  			div.style.background = "rgba(0, 0, 0, 0.25)";
	  			div.style.width = "86%";
	  			div.style.height = "100%";

	  			divLink.appendChild(div);
	  		
	  			if (!clock) {
		  		const clockSpan = document.createElement("span");
		  		clockSpan.classList.add("text-white", "fw-bold", "fs-2")
		  		clockSpan.style.position = "absolute";
		  		clockSpan.style.top = "65px";
		  		clockSpan.style.left = "55px";
		  		clockSpan.style.fontSize = "15px";
		  		clockSpan.innerText = formatDateTimeAuctionBefore(response.auctionItem.auctionDto.start_date);
		  		clockSpan.id = "clockSpan_" + id;
		  	
		  		imageCol.prepend(divLink);
				colInfo.appendChild(clockSpan);
	  			}
	  			
	  		}
	
		        setTimeout(function() {
		            updateAuctionCountDown(id);
		          }, 1000);  
	
	  		}

	    }
	  }

      xhr.open("get", "/safari/auction/getAuctionItemInfo/" + id);
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


//경매 시작되었으면 경매 상태를 진행중으로 업데이트 (DB에 정보 업데이트)
function renewAuctionItemStatusIng(auctionItemId) {
	
	 const xhr = new XMLHttpRequest();
	 
	 xhr.onreadystatechange = function() {
		    if (xhr.readyState === 4 && xhr.status === 200) {
		      const response = JSON.parse(xhr.responseText);
		      
		      
		      // 경매 상태 조회 시 진행중이 아닐 경우에만 db에 상태 업데이트
		      if (response.auctionItemStatus.auction_status != '진행중') {
		    	  
		    	  const xhrUpdateStatus = new XMLHttpRequest();
		    	  xhrUpdateStatus.onreadystatechange = function() {
		    	  if (xhrUpdateStatus.readyState === 4 && xhrUpdateStatus.status === 200) {
		    		  
		    		  
		    	  
		    	  }
		        };
		        xhrUpdateStatus.open("get", "/safari/auction/renewAuctionItemStatusIng/" + auctionItemId);
		        xhrUpdateStatus.send();
		        
		      }
		      
	   
		    }
	 }
    xhr.open("get", "/safari/auction/getAuctionStatusByAuctionItemId/" + auctionItemId);
    xhr.send();  
}

// 경매 진행 상태
let status = null;


document.addEventListener('DOMContentLoaded', function() {
	
    document.getElementById('radioStatus').addEventListener('click', function() {
       	
        reloadAuctionList(null, null);
        
    });	
    // 진행중인 버튼 클릭 시
    document.getElementById('radioStatusIng').addEventListener('click', function() {
        status = 'ing'; // 전역 변수에 'ing' 할당
        reloadAuctionList(null, null);
        status = null;
    });

    // 준비중인 버튼 클릭 시
    document.getElementById('radioStatusReady').addEventListener('click', function() {
        status = 'ready'; // 전역 변수에 'ready' 할당
        reloadAuctionList(null, null);
        status = null;
    });
});

let searchWord = null;


// 검색 enter 이벤트 키 처리
function enterSearchAuction(event) {
  if (event.key == "Enter") {
	  searchAuction();
  }
}

// 검색
function searchAuction() {
	
	 const searchWordBox = document.querySelector("#searchAuctionName");
	 searchWord = searchWordBox.value;
	 reloadAuctionList(null, null);
	
	
}




// 메인 페이지에 경매 리스트 출력
function reloadAuctionList(mainCategoryId, subCategoryId) {
	
	   const nowDate = new Date();

	   let url; 
	   
	   if (status) {
		  url = "/safari/auction/getAuctionListByStatus?status=" + status;
	   } 
	   
	   if (searchWord) {
		   url = "/safari/auction/searchAuction?searchWord=" + searchWord;
	   }
	   
	   else {      
		   
		   // 라디오 버튼 체크 해제
		    document.getElementById('radioStatusIng').checked = false;
		    document.getElementById('radioStatusReady').checked = false;
		    
		    
		   if (mainCategoryId == null && subCategoryId == null) {
		       url = "/safari/auction/getAuctionList";
		   } else if (mainCategoryId != null) {
		       url = "/safari/auction/getAuctionListByMainCategory?id=" + mainCategoryId;
		   } else if (subCategoryId != null) {
			   url = "/safari/auction/getAuctionListBySubCategory?id=" + subCategoryId;
		   }
	   }
	
	   const xhr = new XMLHttpRequest();

	   xhr.onreadystatechange = function() {
	        if (xhr.readyState === 4 && xhr.status === 200) {
	 
	            const response = JSON.parse(xhr.responseText);
	            
	            const auctionProductListBox = document.querySelector("#auctionProductList");
	            auctionProductListBox.innerHTML = "";
	            
	            for(data of response.getAuctionList) {
 	
	            	const col = document.createElement("div");
	            	col.classList.add("col-3", "mb-5", "position-relative");
	            	col.id = "col_" + data.auctionDto.id;
	            	
					
	            	// 여기
	            	if (!(data.auctionDto.end_date <= nowDate)) {
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
	            	}
	 				
	 				
	            	let currentPrice = 0;
	            	
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
	            	imageInfo.style.height = "220px"; 
	            	/* imageInfo.style.width = "220px";  */
	            	imageInfo.src = "/auctionFiles/" + data.auctionImgDto.auction_item_img_link;
	            	imageInfo.id = "imageInfo_" + data.auctionDto.id;
	            	
	            	imageLink.appendChild(imageInfo);
	            	imageCol.appendChild(imageLink);
	            	
	            	imageRow.appendChild(imageCol);
	            	
	            	col.appendChild(imageRow);
	            	
	            	
	            	const titleRow = document.createElement("div");
	            	titleRow.classList.add("row", "mt-2");
	            	
	            	const titleCol = document.createElement("div");
	            	titleCol.classList.add("col" /*"fw-bold"*/, "overflow", "fw-medium");
	            	titleCol.style.width = "200px";
	            	titleCol.style.fontSize = "16px";
	            	
	            	
	            	const titleLink = document.createElement("a");
	         
	            	titleLink.href = "/safari/auction/productDetail/" + data.auctionDto.id;
	            	titleLink.innerText = data.auctionDto.title;
	            	
	            	titleCol.appendChild(titleLink);
	            	
	            	titleRow.appendChild(titleCol);
	            	
	            	col.appendChild(titleRow);
	            	
	                const priceRow = document.createElement("div");
	                priceRow.classList.add("row", "mt-1");
	                
	                const priceCol = document.createElement("div");
	                priceCol.classList.add("col-auto");
	                
	                priceCol.innerText = "현재가 ";
	                
	                const nowSpan = document.createElement("span");
		            nowSpan.classList.add(/*"text-danger",*/ "opacity-90", "fw-bold", "fs-5", "ms-1");
		            nowSpan.id = "currentPrice_" + data.auctionDto.id;
		            //nowSpan.style.color = "#ff6f0f";
		            
		            const wonSpan = document.createElement("span");
		            wonSpan.classList.add("ms-1");
		            wonSpan.innerText = "원";
		            
		            const buttonCol = document.createElement("div");
		            buttonCol.classList.add("col", "px-1");
		
		            
		            const statusButton = document.createElement("span");
		            
		            statusButton.style.position = "relative";
		            statusButton.style.right = "10px";
		            statusButton.id = "auctionStatus_" + data.auctionDto.id;
		            
		            buttonCol.appendChild(statusButton);
		            
		            priceCol.appendChild(nowSpan);
		            priceCol.appendChild(wonSpan);
		            priceRow.appendChild(priceCol);
		            priceRow.appendChild(buttonCol);
		            
		            col.appendChild(priceRow);
		            
		            const immediatePriceRow = document.createElement("div");
		            immediatePriceRow.classList.add("row");
		            
		            const immediatePriceCol = document.createElement("div");
		            immediatePriceCol.classList.add("col");
		            
		            const immediateSpan = document.createElement("span");
		            immediateSpan.style.position = "relative";
		            immediateSpan.style.bottom = "3px";
		            immediateSpan.style.fontSize = "13px";
		            immediateSpan.innerText = "즉시낙찰가 " + new Intl.NumberFormat('ko-KR').format(data.auctionDto.max_price) + "원";
	                
		            immediatePriceCol.appendChild(immediateSpan);
		            immediatePriceRow.appendChild(immediatePriceCol);
		            
		            col.appendChild(immediatePriceRow);
		            
		       
		             const startRow = document.createElement("div");
		             startRow.classList.add("row", "mt-1");
		               
		             const startDateCol = document.createElement("div");
		             startDateCol.classList.add("col");
		             startDateCol.style.fontSize = "13px";
		             startDateCol.innerText = "경매시작일 : " + formatDateTime(data.auctionDto.start_date);
		               
		             startRow.appendChild(startDateCol);
					
		             col.appendChild(startRow);
		               
	           		
		              const endRow = document.createElement("div");
		              endRow.classList.add("row");
		               
		              const endDateCol = document.createElement("div");
		              endDateCol.classList.add("col");
		              endDateCol.style.fontSize = "13px";
		              endDateCol.innerText = "경매종료일 : " + formatDateTime(data.auctionDto.end_date);
		              
		              endRow.appendChild(endDateCol);
		              col.appendChild(endRow);
		               

		              
		              const remainP = document.createElement("p");
		              remainP.classList.add("mt-1");
		              remainP.style.fontSize = "18px";
		              remainP.id = "auctionCountDownTime_" + data.auctionDto.id;
		              
		              col.appendChild(remainP);
		          
		          
	    
		              auctionProductListBox.appendChild(col);
	            }
	            
	        }
	    };
	    xhr.open("get", url, true);
	    xhr.send();

	
}


//날짜 변경    
function formatDateTime(dateTimeString) {
	
  const date = new Date(dateTimeString); // 내용이 업로드된 시간
  const now = new Date(); // 현재 시간
  
  const year = date.getFullYear();
  const month = date.getMonth() + 1;
  const day = date.getDate();
  let hours = date.getHours();
  const minutes = date.getMinutes();
  let period = '오전';

  if (hours >= 12) {
    period = '오후';
    if (hours > 12) {
      hours -= 12;
    }
  } else if (hours === 0) {
    hours = 12;
  }

  const formattedDateTime = year + '.' + month + '.' + day + ' ' + period + '   ' + hours + ':' + minutes.toString().padStart(2, '0');

  return formattedDateTime;
}  


//날짜 변경    
function formatDateTimeAuctionBefore(dateTimeString) {
	
  const date = new Date(dateTimeString); // 내용이 업로드된 시간
  const now = new Date(); // 현재 시간
  
  const year = date.getFullYear();
  const month = date.getMonth() + 1;
  const day = date.getDate();
  let hours = date.getHours();
  const minutes = date.getMinutes();
  let period = '오전';

  if (hours >= 12) {
    period = '오후';
    if (hours > 12) {
      hours -= 12;
    }
  } else if (hours === 0) {
    hours = 12;
  }

  const formattedDateTime =/*  year + '.' + */ month + '월 ' + day + '일\n' + period + '   ' + hours + ':' + minutes.toString().padStart(2, '0');

  return formattedDateTime;
}  


// 물품 등록 모달 페이지 띄우기
function registerProductPage() {
	if (sessionId == null) {
		location.href = "/safari/user/loginPage";
		return;
	} else {		
		const registerProductModal = bootstrap.Modal.getOrCreateInstance("#registerProductModal");
		registerProductModal.show();
			
	}	
}

window.onload = function() {
    // 대분류 카테고리의 기본 선택 값 설정
    const defaultMainCategoryId = 0; // 
   // const defaultSubCategoryId = 0;
    
    // 대분류 카테고리 드롭다운을 기본 선택 값으로 설정
    const mainCategoryDropdown = document.getElementById('mainCategoryDropdown');
    mainCategoryDropdown.value = defaultMainCategoryId;
    
/*     const subCategoryDropdown = document.getElementById('subCategoryDropdown');
    subCategoryDropdown.value = defaultSubCategoryId; */
    // 초기 선택한 대분류 카테고리에 해당하는 소분류 카테고리 리스트 출력
    getProductSubcategories();
}



function getProductSubcategories() {
    const productMainCategoryId = document.getElementById('mainCategoryDropdown').value;
    const xhr = new XMLHttpRequest();
    
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
 
            const response = JSON.parse(xhr.responseText);
            
            getProductSubcategoriesList(response.subCategories);
        }
    };
    xhr.open("get", "/safari/auction/getProductSubCategories/" + productMainCategoryId);
    xhr.send();
}	


function getProductSubcategoriesList(subCategories) {
    const subCategoryDropdown = document.getElementById('subCategoryDropdown');
    subCategoryDropdown.innerHTML = '';

 // 대분류 카테고리가 선택되지 않은 경우 "소분류 선택" 옵션 추가
    if (subCategories.length === 0) {
        const option = document.createElement('option');
        option.value = 0;
        option.text = "소분류 선택";
        subCategoryDropdown.appendChild(option);
        return; // 함수 종료
    }
    subCategories.forEach(function(subCategory) {
        const option = document.createElement('option');
        option.value = subCategory.id;
        option.text = subCategory.sub_category_name;
        subCategoryDropdown.appendChild(option);
    });
}

// 물품 등록 가능 여부 확인
let isChecked = false;

// 경매 물품 등록
function registerAuctionProduct() {
	
	   const xhr = new XMLHttpRequest();

	   const titleBox = document.getElementById("title");
	   const mainCategoryBox = document.getElementById("mainCategoryDropdown");
	   const subCategoryBox = document.getElementById("subCategoryDropdown");
	   const descriptionBox = document.getElementById("description");
	   const startPriceBox = document.getElementById("start_price");
	   const maxPriceBox = document.getElementById("max_price");
	   const startDateBox = document.getElementById("start_date");
	   const endDateBox = document.getElementById("end_date");
	   const imageFilesInput = document.getElementById("auctionItemImgFiles");
	   
	   if (titleBox.value == "") {
		   alert("상품명을 입력하세요");
		   titleBox.focus();
		   return;
	   }
	   
	   if (subCategoryBox.value == "") {
		   alert("카테고리를 선택해주세요");
		   mainCategoryBox.focus();
		   return;
	   }
	   
	   if (descriptionBox.value == "") {
		   alert("상품설명을 입력하세요");
		   descriptionBox.focus();
		   return;
	   }
	   
	   if (startPriceBox.value == "") {
		   alert("시작가를 입력하세요");
		   startPriceBox.focus();
		   return;
	   }
	   
	   if (maxPriceBox.value == "") {
		   alert("즉시낙찰가를 입력하세요");
		   maxPriceBox.focus();
		   return;
	   }
	   
	   if (startDateBox.value == "") {
		   alert("경매시작일을 설정해주세요");
		   startDateBox.focus();
		   return; 
	   }
	   
	   if (endDateBox.value == "") {
		   alert("경매종료일을 설정해주세요");
		   endDateBox.focus();
		   return;
	   }
	   if (imageFilesInput.value == "") {
		   alert("상품 이미지를 등록해주세요");
		   imageFilesInput.focus();
		   return;
	   }
	   
	   
	  // const mainCategoryBox =  document.getElementById("mainCategoryDropdown");
	   
	 //  const mainCategoryId = mainCategoryBox.value;
	   const subCategoryId = subCategoryBox.value;
	
	   
	    xhr.onreadystatechange = function () {
	        if(xhr.readyState == 4 && xhr.status == 200){
	            const response = JSON.parse(xhr.responseText);

	            if(response.result == "success") {
	            	const registerProductModal = bootstrap.Modal.getOrCreateInstance("#registerProductModal");
	            	registerProductModal.hide();
	            	reloadAuctionList(null, null);

	            }
	            
	        }
	    }	
	    
	    
	    // 이미지 파일을 포함한 데이터를 생성
	    const formData = new FormData();
	    formData.append("title", titleBox.value);
	    formData.append("auction_sub_category_id", subCategoryBox.value);
	    formData.append("description", descriptionBox.value);
	    formData.append("start_price", startPriceBox.value);
	    formData.append("max_price", maxPriceBox.value);
	    formData.append("start_date", startDateBox.value);
	    formData.append("end_date", endDateBox.value);	    
	    
	    // 이미지 파일 추가
	    const imageFiles = imageFilesInput.files;
	    for (let i = 0; i < imageFiles.length; i++) {
	      formData.append("auctionItemImgFiles", imageFiles[i]);
	    }	    
	    

	    xhr.open("post", "/safari/auction/registerProductProcess");
	    // Content-Type 헤더를 설정하여 multipart/form-data로 전송
	 
	    xhr.send(formData);	
	    
	    titleBox.value == "";
	    descriptionBox.value == "";
	    startPriceBox.value == "";
	    maxPriceBox.value == "";
	    startDateBox.value == "";
	    endDateBox.value == "";
	    

	  }	    



window.addEventListener("DOMContentLoaded", function(){

    //사실상 시작 시점...
    getSessionId();
    getProductMainCategoriesForMenu();
    
    
    reloadAuctionList(mainCategoryId, subCategoryId);
   
 
});

</script>
</head>
<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->

	<div class="container main_box">
		<!-- <h1 class="text-center fs-3">
			<img class="img-fluid" src="/safari/resources/img/auction/auctionBanner.jpg">
		</h1> -->
		
	<!-- <div class="row mt-2">
		<div class="col">
			<div class="row mt-2 mb-1">
				<div class="col">
					
						<i class="bi bi-exclamation-circle fs-5 me-1"></i>
						<span class="fw-semibold fs-5">경매 등록 이용안내</span>
				</div>
			</div>
			
			<div class="row">
				<div class="col">
					경매를 등록하실 때 제품명을 자세히 입력해주세요.
				</div>
			</div>
			<div class="row">
				<div class="col">
					경매종료일은 <span class="fw-semibold">경매시작일로부터 한 달 이내</span>로 설정하실 수 있습니다.
				</div>
			</div>
			
		</div> -->
		
	
		
	<!-- 	<div class="col justify-content-end">
			<div class="row mt-2 mb-1">
				<div class="col">
					<i class="bi bi-exclamation-circle fs-5 me-1"></i>
						<span class="fw-semibold fs-5">경매 이용 시 참고사항</span>
				</div>
			</div>
			
			<div class="row">
				<div class="col">
					진행중인 경매의 <span class="fw-semibold">현재가는 <span class="text-danger">실시간으로</span> 업데이트</span>되고 있습니다.
				</div>
			</div>
		</div>
	</div>	  -->
		
	<div class="row mt-3">
		<jsp:include page="./sidemenu.jsp"></jsp:include>
	
	<%-- 메인 페이지 시작 --%>

	<div class="col-10 justify-content-end ps-5 px-0 pe-2" style="position: relative; left: 42px">
	
		
		<div class="row mt-4 mb-3" style="position: relative; bottom: 10px;">
			<div class="col ms-1">
				<div class="row">
					<div class="col-10">
						<div class="input-group">
		                    <input name="auction_searchWord" type="text" class="form-control"
		                           placeholder="상품명을 입력하세요" id="searchAuctionName"
		                           onkeydown="enterSearchAuction(event)">
		                    	<span class="input-group-text" ">
		                        <span class="bi bi-search" onclick="searchAuction()" style="cursor: pointer;"></span>
		                   		<span class="bi bi-x-circle-fill" onclick="clearSearch()" style="cursor: pointer; display: none;"></span>
		                    </span>
               			 </div>
					</div>
					
				</div>	
 			</div>
			
			<div class="col d-flex justify-content-end" style="position: relative; right: 50px;">

				<input type="button" onclick= "registerProductPage()"
			  class="btn orangeButton" value="경매 물품 등록">	
				  
			</div>
		</div>
		
		
		<div class="row mt-4">
		
			<div class="col mb-3 d-flex justify-content-center" style="position: relative; right: 30px; font-size: 14px;">
			
			 <input class="form-check-input me-2" type="radio" id="radioStatus" name="radioStatus" value="" style="cursor:pointer";>
			  <label class="form-check-label me-4" for="radioStatus">
			    	전체보기
			  </label>			
				
			 <input class="form-check-input me-2" type="radio" id="radioStatusIng" name="radioStatus" value="ing" style="cursor:pointer";>
			  <label class="form-check-label me-4" for="radioStatusIng">
			    	진행중인 경매만 보기
			  </label>
 		  		

				<input class="form-check-input me-2" type="radio" id="radioStatusReady" name="radioStatus" value="ready" style="cursor:pointer";>
				  <label class="form-check-label me-2" for="radioStatusReady">
				    	준비중인 경매만 보기
				  </label>				
			</div>		
			
		
		
			
			<div class="col mb-4 text-end me-5" style="position: relative; top: 3px;">
				<div class="row">	
					<div class="col d-flex justify-content-end text-end">
						<ul>
							<li style="float:left;" class="pe-3 fw-bold">마감임박순</li>
							<li style="float:left;" class="pe-3">입찰순</li>
							<li style="float:left;" class="pe-3">추천순</li>
							<li style="float:left;">최신순</li>
						</ul>
					
					</div>	  	
				  </div>
			</div>
			
			
			
		</div>
		
			<!--  전체 row -->
			<div class="row me-4" id="auctionProductList">
			
			</div>
				
		</div>
	</div>
		
			

</div>	


	
	
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->
	
	<%--style="position: absolute; transform: translateX(70%);right: 50%;" --%>
	
	<%-- modal-dialog modal-lg fade --%>
	<%-- modal-dialog-centered--%>
<!-- Modal -->
<div class="modal modal-lg" id="registerProductModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <%--<h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1> --%>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
  		<%-- 시작 --%>   
  			<div class="row text-center mt-4 fw-bold fs-5 me-1">
				<div class="col">
					경매 물품 등록 
				</div>
				
			</div> 
	
	        	<div class="col-1"></div>
	        				
   				<div class="col ms-2">
   				
			        <div class="form-group row mt-3">
			        	<div class="col-1"></div>
			            <div class="col-10">
			            	<div class="mb-1">
			            		<label for="title" class="col-form-label fw-medium">상품 제목</label>
			            	</div>
			                <input type="text" class="form-control" id="title" name="title"  placeholder="상품명을 입력하세요">
			            </div>
			        </div>
        
			        <div class="form-group row mt-3">
			            <div class="col-1"></div>
			            
			            <div class="col-3">
				            <div class="mb-1">
				            	<label for="mainCategoryDropdown" class="col-form-label fw-medium">카테고리 대분류</label>
				            </div>
				            	<select class="form-control" id="mainCategoryDropdown" onchange="getProductSubcategories()">
				            		<option value="0">대분류 선택 </option>
						        	<c:forEach items="${productMainCategories}" var="productMainCategory">
							            <option value="${productMainCategory.id}">${productMainCategory.main_category_name}</option>
							        </c:forEach>
				                </select>
				         </div>

			            <div class="col-3">
				            <div class="mb-1">
				            	<label for="subCategoryDropdown" class=" col-form-label fw-medium">카테고리 소분류</label>
				            </div>
			                <select class="form-control" id="subCategoryDropdown" name="auction_sub_category_id">
			                	<option value="0">소분류 선택</option>
			                </select>
			            </div>
        			</div>

			        <div class="form-group row mt-3">
			            <div class="col-1"></div>
			        
			            <div class="col-10">
			            	<div class="mb-1">
			            		<label for="description" class="col-form-label fw-medium">상품 설명</label>
			            	</div>
			                <textarea class="form-control" id="description" name="description" rows="5" placeholder="상품 설명"></textarea>
			            </div>
			        </div>
		
			
			
		        <div class="form-group row mt-3">
		            <div class="col-1"></div>
		        
		            <div class="col-3">
		            	<div class="mb-1">
		            		<label for="start_price" class="col-form-label fw-medium">시작가격</label>
		            	</div>
		                <input type="text" class="form-control" id="start_price" name="start_price"  placeholder="시작가">
		            </div>
		            <div class="col-3">
		            	<div class="mb-1">
		            		<label for="max_price" class="col-form-label fw-medium">즉시낙찰가 설정</label>
		            	</div>
		                <input type="text" class="form-control" id="max_price" name="max_price"  placeholder="즉시낙찰가">
		            </div>     
		        </div>
        
		      <div class="form-group row mt-3">
		            <div class="col-1"></div>
		      
		            <div class="col-5">
		            	<div class="mb-1">
		            		<label for="start_date" class="col-form-label fw-medium">경매시작일</label>
		            	</div>
		            	<input type="datetime-local" id="start_date" name="start_date" class="form-control"> 
		            </div>
		            <div class="col-5">
		            	<div class="mb-1">
		            		<label for="end_date" class="col-form-label fw-medium">경매종료일</label>
		            	</div>
		                <input type="datetime-local" id="end_date" name="end_date" class="form-control">
		            </div>
		        </div>
        
			<div class="form-group row mt-3">
				<div class="col-1"></div>
				
				<div class="col-6">
				  <label for="auctionItemImgFiles" class="col-form-label fw-medium">제품 이미지</label>
				  <input class="form-control" id="auctionItemImgFiles"
				  		name="auctionItemImgFiles" type="file" multiple="multiple" accept="image/*">
				</div>
			</div>	               
	   
			
	        <div class="row mt-5 mb-5">
	        	<div class="col"></div>
	        	<div class="col-4 text-center d-grid">
	      
	                <button class="btn orangeButton text-center me-5"
	                	onclick="return registerAuctionProduct()">등록</button>
	           </div>    
	        </div>
    
    	</div>
  		<%-- 끝 --%>
      </div>
   
    </div>
  </div>
</div>
<!-- Modal -->
	

</body>	
</html>