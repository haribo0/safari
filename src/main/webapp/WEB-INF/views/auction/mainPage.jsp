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
<link rel="stylesheet" href="/safari/resources/style/auction.css" type="text/css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<style>
  .blink-text {
    animation: blink 1.5s infinite;
  }
  
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
  		 currentPriceElement.textContent =  new Intl.NumberFormat('ko-KR').format(currentPrice) + "원";
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
      
      let auctionStatusBox = document.getElementById("auctionStatus_" + id);
      auctionStatusBox.innerHTML = "";
      

      const statusButton = document.createElement("button");
      statusButton.classList.add("btn", "btn-sm", "fw-bold", "disabled");
 
      if (auctionEndDate <= nowDate || response.auctionItem.auctionDto.auction_status == '종료') {  
    	  statusButton.classList.add("btn-outline-secondary");
          statusButton.innerText = "경매 종료";
    	  
      } else if (auctionStartDate <= nowDate) {
    	  statusButton.classList.add("btn-outline-success");
          statusButton.innerText = "진행중";
      } else {
      	 statusButton.classList.add("btn-outline-primary");
      	 statusButton.innerText = "준비중";
      }
      
      auctionStatusBox.appendChild(statusButton);
      
      
      
      let countDownTableBox = document.getElementById("auctionCountDownTime_" + id);
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
	  	
   
	        const timeIcon = document.createElement("i");
	        timeIcon.classList.add("bi", "bi-clock", "me-2");
	        //timeIcon.style.position = "relative";
	        //timeIcon.style.bottom = "3px";
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
		        
		       	
		        setTimeout(function() {
		            updateAuctionCountDown(id);
		          }, 1000); // 10초 간격으로 함수 호출 (1000ms = 1초)
	
	  		}

	    }
	  }

      xhr.open("get", "/safari/auction/getAuctionItemInfo/" + id);
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

// 메인 페이지에 경매 리스트 출력
function reloadAuctionList(mainCategoryId, subCategoryId) {
	

	   let url;
	   
	   /*if (document.getElementById('radioStatusIng').checked) {
	      status = document.getElementById('radioStatusIng').value;
	      console.log(status);
	   } else if (document.getElementById('radioStatusReady').checked) {
	      status = document.getElementById('radioStatusReady').value;
	   }*/
	   
	   if (status) {
		  url = "/safari/auction/getAuctionListByStatus?status=" + status;
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
	            	
	            	let currentPrice = 0;
	            	
	            	// !!!!!!!!!!!!!  여기 너무 중요 함수 호출
	            	updateAuctionCountDown(data.auctionDto.id);
	            	getCurrentPrice(data.auctionDto.id);
	            	// 여기 너무 중요 함수 호출
	            	
	            	
	            	const col = document.createElement("div");
	            	col.classList.add("col-3", "mt-4");
	            	
	            	
	            	const imageRow = document.createElement("div");
	            	imageRow.classList.add("row");
	            	
	            	const imageCol = document.createElement("div");
	            	imageCol.classList.add("col");
	            	
	            	const imageLink =  document.createElement("a");
	            	imageLink.classList.add("text-decoration-none", "d-inline-block");
	            	imageLink.href = "/safari/auction/productDetail/" + data.auctionDto.id;
	            	
	            	const imageInfo = document.createElement("img");
	            	imageInfo.classList.add("img-fluid", "align-middle", "text-center");
	            	imageInfo.style.height= "auto";
	            	imageInfo.style.height = "220px"; 
	            	/* imageInfo.style.width = "220px";  */
	            	imageInfo.src = "/auctionFiles/" + data.auctionImgDto.auction_item_img_link;
	            	
	            	imageLink.appendChild(imageInfo);
	            	imageCol.appendChild(imageLink);
	            	
	            	imageRow.appendChild(imageCol);
	            	
	            	col.appendChild(imageRow);
	            	
	            	const titleRow = document.createElement("div");
	            	titleRow.classList.add("row", "mt-2");
	            	
	            	const titleCol = document.createElement("div");
	            	titleCol.classList.add("col", "fw-bold", "overflow");
	            	titleCol.style.width = "200px";
	            	titleCol.style.fontSize = "18px";
	            	
	            	
	            	const titleLink = document.createElement("a");
	         
	            	titleLink.href = "/safari/auction/productDetail/" + data.auctionDto.id;
	            	titleLink.innerText = data.auctionDto.title;
	            	
	            	titleCol.appendChild(titleLink);
	            	
	            	titleRow.appendChild(titleCol);
	            	
	            	col.appendChild(titleRow);
	            	
	                const priceRow = document.createElement("div");
	                priceRow.classList.add("row", "mt-1");
	                
	                const priceCol = document.createElement("div");
	                priceCol.classList.add("col-auto", "text-secondary");
	                
	                priceCol.innerText = "현재가 ";
	                
	                const nowSpan = document.createElement("span");
		            nowSpan.classList.add("text-danger", "opacity-90", "fw-bold", "fs-5", "ms-1");
		            nowSpan.id = "currentPrice_" + data.auctionDto.id;
		            
		            const buttonCol = document.createElement("div");
		            buttonCol.classList.add("col");

		            
		            const statusButton = document.createElement("span");
		            statusButton.style.position = "relative";
		            statusButton.style.right = "8px";
		            statusButton.id = "auctionStatus_" + data.auctionDto.id;
		            
		            buttonCol.appendChild(statusButton);
		            
		            priceCol.appendChild(nowSpan);
		            priceRow.appendChild(priceCol);
		            priceRow.appendChild(buttonCol);
		            
		            col.appendChild(priceRow);
		            
		            const immediatePriceRow = document.createElement("div");
		            immediatePriceRow.classList.add("row");
		            
		            const immediatePriceCol = document.createElement("div");
		            immediatePriceCol.classList.add("col");
		            
		            const immediateSpan = document.createElement("span");
		            //immediateSpan.style.position = "relative";
		            //immediateSpan.style.top = "1.5px";
		            immediateSpan.style.fontSize = "13px";
		            immediateSpan.innerText = "즉시낙찰가 " + new Intl.NumberFormat('ko-KR').format(data.auctionDto.max_price) + "원";
	                
		            immediatePriceCol.appendChild(immediateSpan);
		            immediatePriceRow.appendChild(immediatePriceCol);
		            
		            col.appendChild(immediatePriceRow);
		            
		            
		            const auctionStartDate = new Date(data.auctionDto.start_date); 

	                const formattedauctionStartDate = auctionStartDate.toLocaleString('ko-KR', {
	                  year: 'numeric',
	                  month: '2-digit',
	                  day: '2-digit',
	                  hour: '2-digit',
	                  minute: '2-digit',
	                  //second: '2-digit',
	                  hour12: true
	                });	        
		                
		             const startRow = document.createElement("div");
		             startRow.classList.add("row", "mt-1");
		               
		             const startDateCol = document.createElement("div");
		             startDateCol.classList.add("col");
		             startDateCol.style.fontSize = "13px";
		             startDateCol.innerText = "경매시작일 : " + formattedauctionStartDate;
		               
		             startRow.appendChild(startDateCol);
					
		             col.appendChild(startRow);
		               
	           		  const auctionEndDate = new Date(data.auctionDto.end_date); 
		            	 
		              const formattedauctionEndDate = auctionEndDate.toLocaleString('ko-KR', {
		                  year: 'numeric',
		                  month: '2-digit',
		                  day: '2-digit',
		                  hour: '2-digit',
		                  minute: '2-digit',
		                  //second: '2-digit',
		                  hour12: true
		                });	        
		                
		              const endRow = document.createElement("div");
		              endRow.classList.add("row");
		               
		              const endDateCol = document.createElement("div");
		              endDateCol.classList.add("col");
		              endDateCol.style.fontSize = "13px";
		              endDateCol.innerText = "경매종료일 : " + formattedauctionEndDate;
		              
		              endRow.appendChild(endDateCol);
		              col.appendChild(endRow);
		               

		              
		              const remainP = document.createElement("p");
		              remainP.classList.add("mt-1");
		              remainP.style.fontSize = "18px";
		              remainP.id = "auctionCountDownTime_" + data.auctionDto.id;
		              
		              col.appendChild(remainP);
		          
		              
		              //const statusP = document.createElement("p");
		               
		            
		               
		             // statusP.appendChild(statusButton);
		             
		              //col.appendChild(statusP);
	    
		              auctionProductListBox.appendChild(col);
	            }
	            
	        }
	    };
	    xhr.open("get", url, true);
	    xhr.send();

	
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

    subCategories.forEach(function(subCategory) {
        const option = document.createElement('option');
        option.value = subCategory.id;
        option.text = subCategory.sub_category_name;
        subCategoryDropdown.appendChild(option);
    });
}

// 경매 물품 등록
function registerAuctionProduct() {
	
	   const xhr = new XMLHttpRequest();

	   const titleBox = document.getElementById("title");
	   const subCategoryBox = document.getElementById("subCategoryDropdown");
	   const descriptionBox = document.getElementById("description");
	   const startPriceBox = document.getElementById("start_price");
	   const maxPriceBox = document.getElementById("max_price");
	   const startDateBox = document.getElementById("start_date");
	   const endDateBox = document.getElementById("end_date");
	   const imageFilesInput = document.getElementById("auctionItemImgFiles");
	   
	   
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
		<h1 class="text-center fs-3"></h1>
		
	<div class="row mt-5">
		<jsp:include page="./sidemenu.jsp"></jsp:include>
	
	<%-- 메인 페이지 시작 --%>

	<div class="col-10 justify-content-center ps-5">
	
	
	
	<div class="row mt-3">
		<div class="col"></div>
	</div>
	
	<div class="row mt-5">
		<div class="col">
			<div class="row mt-2 mb-1">
				<div class="col">
					<span>
					<img class="mb-1" src="/safari/resources/img/auction/notice.png"
						style="max-width: 25px; max-height: 25px;"></span>
						<span class="fw-bold fs-5">경매 등록 시 참고사항</span>
				</div>
			</div>
			
			<div class="row">
				<div class="col">
					경매를 등록하실 때 제품명을 자세히 입력해주세요.
				</div>
			</div>
			<div class="row">
				<div class="col">
					경매종료일은 <span class="fw-bold">경매시작일로부터 한 달 이내</span>로 설정하실 수 있습니다.
				</div>
			</div>
			
		</div>
		
	
		
		<div class="col">
			<div class="row mt-2 mb-1">
				<div class="col">
					<span>
					<img class="mb-1" src="/safari/resources/img/auction/notice.png"
						style="max-width: 25px; max-height: 25px;"></span>
						<span class="fw-bold fs-5">경매 이용 시 참고사항</span>
				</div>
			</div>
			
			<div class="row">
				<div class="col">
					진행중인 경매의 <span class="fw-bold">현재가는 <span class="text-danger">실시간으로</span> 업데이트</span>되고 있습니다.
				</div>
			</div>
		</div>
	</div>	
		
		
		<div class="row mt-5 mb-3">
		
			<div class="col mt-4 d-flex justify-content-center" style="position: relative; right: 10px;">
			
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
		
			<div class="col mt-3 text-end me-5">
			
				<input type="button" onclick= "registerProductPage()"
				  class="btn orangeButton" value="경매 물품 등록">				  
			</div>
			
			
			
		</div>
		
			<!--  전체 row -->
			<div class="row mt-3 me-4" id="auctionProductList">
				<!-- <div class="col-11" >
					
			
						
						
				</div> -->
			</div>
				<!--  전체 row -->
				
				
				<!--  끝 -->
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