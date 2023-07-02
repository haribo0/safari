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
  		 currentPriceElement.textContent =  new Intl.NumberFormat('ko-KR').format(currentPrice) + "원 \u00A0\u00A0\u00A0";
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
      
      
      let auctionStatusBox = document.getElementById("auctionStatus_" + id);
      auctionStatusBox.innerHTML = "";
      
      const statusButton = document.createElement("button");
      statusButton.classList.add("btn");
      statusButton.classList.add("btn-sm");
      statusButton.classList.add("fw-bold");
      statusButton.classList.add("disabled");
      if (auctionEndDate <= new Date() || response.auctionItem.auctionDto.auction_status == '종료') {  
    	  statusButton.classList.add("btn-outline-danger");
          statusButton.innerText = "경매 종료";
    	  
      } else if (auctionStartDate <= new Date()) {
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
	  	if (auctionEndDate <= new Date() || response.auctionItem.auctionDto.auction_status == '종료') {
	  		return;
	  	} 
	  	// 경매가 시작되었거나 준비중인 경우
	  	else {
	  		let auctionCountDown;
	  		// 경매가 시작된 경우
	  		if (auctionStartDate <= new Date()) {
	  			auctionCountDown = countdownFromEndDate(auctionEndDate);
	  		} else {
	  			auctionCountDown = countdownFromStartDate(auctionStartDate);
	  		}
	  	
	  		
	  	     const auctionTimeRow = document.createElement("div");
	  	     auctionTimeRow.classList.add("row", "mt-4");
	  	     
	  	     const auctionTimeCol = document.createElement("div");
	  	     auctionTimeCol.classList.add("col", "fw-bold");
	  	     
	  	     auctionTimeCol.innerText = "남은 시간";
	  	     
	  	     auctionTimeRow.appendChild(auctionTimeCol);
	  	     
		       	const remainTimeRow = document.createElement("div");
		       	remainTimeRow.classList.add("row");
		        remainTimeRow.classList.add("mt-2");
		        
		        const remainTimeCol = document.createElement("div");
		        remainTimeCol.classList.add("col", "fs-5");
		        
		        const spanTime1 = document.createElement("span");
		        if (auctionCountDown.days >= 1) {
				     spanTime1.innerText = auctionCountDown.days + "일 ";
		        } else {
		        	spanTime1.innerText = "";
		        }
		        
		       	
		        const spanTime2 = document.createElement("span");
		       
		       	spanTime2.innerText = ("0" + auctionCountDown.hours).slice(-2) + ":";
		       	
		        const spanTime3 = document.createElement("span");
		       	spanTime3.innerText = ("0" + auctionCountDown.minutes).slice(-2) + ":";
		       	
		        const spanTime4 = document.createElement("span");
		       	spanTime4.innerText =("0" + auctionCountDown.seconds).slice(-2);
		       	
		       	remainTimeCol.appendChild(spanTime1);
		       	remainTimeCol.appendChild(spanTime2);
		       	remainTimeCol.appendChild(spanTime3);
		       	remainTimeCol.appendChild(spanTime4);
		        
		       	remainTimeRow.appendChild(remainTimeCol);
		       	
		       	countDownTableBox.appendChild(auctionTimeRow);	
		       	countDownTableBox.appendChild(remainTimeRow);	
		       	
		       	
		       	
		        setTimeout(function() {
		            updateAuctionCountDown(id);
		          }, 1000); // 10초 간격으로 함수 호출 (1000ms = 1초)
	
	  		}

	    }
	  }

      xhr.open("get", "/safari/auction/getAuctionItemInfo/" + id);
      xhr.send();

 }

// 메인 페이지에 경매 리스트 출력
function reloadAuctionList(mainCategoryId, subCategoryId) {
	
	   let url;
	   if (mainCategoryId == null && subCategoryId == null) {
	       url = "/safari/auction/getAuctionList";
	   } else if (mainCategoryId != null) {
	       url = "/safari/auction/getAuctionListByMainCategory?id=" + mainCategoryId;
	   } else if (subCategoryId != null) {
		   url = "/safari/auction/getAuctionListBySubCategory?id=" + subCategoryId;
	   }
	
	   const xhr = new XMLHttpRequest();

	   xhr.onreadystatechange = function() {
	        if (xhr.readyState === 4 && xhr.status === 200) {
	 
	            const response = JSON.parse(xhr.responseText);
	            
	            const auctionProductListBox = document.getElementById("auctionProductList");
	            auctionProductListBox.innerHTML = "";
	            
	            for(data of response.getAuctionList) {
	            	
	            	let currentPrice = 0;
	            	
	            	// !!!!!!!!!!!!!  여기 너무 중요 함수 호출
	            	updateAuctionCountDown(data.auctionDto.id);
	            	getCurrentPrice(data.auctionDto.id);
	            	// 여기 너무 중요 함수 호출

	            	const productInfoRow = document.createElement("div");
	            	productInfoRow.classList.add("row", "mb-4");
	            	
	            	const productInfoCol = document.createElement("div");
	            	productInfoCol.classList.add("col-11", "rounded-3", "border", "border-1");
	            	productInfoCol.style.borderColor = "#e1e6ed";
	            
	            	const productRow = document.createElement("div");
	            	productRow.classList.add("row");
	            	
	            	// 왼쪽 화면 시작
	            	const leftCol = document.createElement("div");
	            	leftCol.classList.add("col-9", "ms-5", "mt-3", "mb-3");
	            	
	            	const leftRow = document.createElement("div");
	            	leftRow.classList.add("row");
	            	
	            	
	            	// 상품 이미지 시작
	            	const imageCol = document.createElement("div");
	            	imageCol.classList.add("col", "text-center");
	            	
	            	const imageLink = document.createElement("a");
	            	imageLink.href = "/safari/auction/productDetail/" + data.auctionDto.id;
	            	
	            	const imageInfo = document.createElement("img");
	            	imageInfo.classList.add("img-fluid", "align-middle");
	            	imageInfo.style.height = "120px";
	            	imageInfo.style.position = "relative";
	            	imageInfo.style.right = "10px";
	            	imageInfo.src = "/auctionFiles/" + data.auctionImgDto.auction_item_img_link;
	            	
	            	imageLink.appendChild(imageInfo);
	            	
	            	imageCol.appendChild(imageLink);
	            	// 상품 이미지 끝
	            	
	            	// 상품 정보 시작
	            	
	            	const infoCol = document.createElement("div");
	            	infoCol.classList.add("col-10");
	            	
	            	// 상품 제목 시작
	            	const titleRow = document.createElement("div");
	            	titleRow.classList.add("row");
	            	
	            	const titleCol = document.createElement("div");
	            	titleCol.classList.add("col-10", "fw-bold", "fs-5");
	            	
	            	const titleLink = document.createElement("a");
	            	titleLink.href = "/safari/auction/productDetail/" + data.auctionDto.id;
	            	titleLink.innerText = data.auctionDto.title;
	            	
	            	titleCol.appendChild(titleLink);
	            	titleRow.appendChild(titleCol);
	            	// 상품 제목 끝
	            	
	            	// 상품 가격 시작
	            	// 현재가
	            	const nowRow = document.createElement("div");
	            	nowRow.classList.add("row", "mt-2");
	            	
	            	
	            	const nowCol = document.createElement("div");
	            	nowCol.classList.add("col", "fw-bold");
	            	nowCol.innerText = "현재가 ";
	            	
	            	
	            	const nowSpan = document.createElement("span");
	            	nowSpan.classList.add("text-danger", "fw-bold", "fs-5");
	            	nowSpan.id = "currentPrice_" + data.auctionDto.id;
	            	
	            	// 현재가
	            	
	            	// 즉시낙찰가
	            	const immediateSpan = document.createElement("span");
	            	immediateSpan.classList.add("fw-bold");
	            	immediateSpan.innerText = "즉시낙찰가 " + new Intl.NumberFormat('ko-KR').format(data.auctionDto.max_price) + "원" + '\u00A0\u00A0\u00A0';
	            	// 즉시낙찰가
	            	

	            	
	            	nowCol.appendChild(nowSpan);
	            	nowCol.appendChild(immediateSpan);
	            	/*nowCol.appendChild(startSpan);*/
	            	
	            	nowRow.appendChild(nowCol);
	            	// 상품 가격 끝
	            	
	            	// 경매 시작일 공간
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
	                
	            	const auctionStartRow = document.createElement("div");
	            	auctionStartRow.classList.add("row", "mt-2");
	            	
	            	const auctionStartCol = document.createElement("div");
	            	auctionStartCol.classList.add("col");
	            	auctionStartCol.innerText = "경매시작일 " + formattedauctionStartDate;
	            	
	            	auctionStartRow.appendChild(auctionStartCol);
	            	
	            	// 경매 시작일 공간
            		const auctionEndDate = new Date(data.auctionDto.end_date); 
	            	//console.log(auctionEndDate); 

	                const formattedauctionEndDate = auctionEndDate.toLocaleString('ko-KR', {
	                  year: 'numeric',
	                  month: '2-digit',
	                  day: '2-digit',
	                  hour: '2-digit',
	                  minute: '2-digit',
	                  //second: '2-digit',
	                  hour12: true
	                });	        
	                
	            	const auctionEndRow = document.createElement("div");
	            	auctionEndRow.classList.add("row", "mt-2");
	            	
	            	const auctionEndCol = document.createElement("div");
	            	auctionEndCol.classList.add("col");
	            	auctionEndCol.innerText = "경매종료일 " + formattedauctionEndDate;
	            	
	            	auctionEndRow.appendChild(auctionEndCol);	            	
	            	// 경매 종료일 공간
	            	

	            	infoCol.appendChild(titleRow);
	            	infoCol.appendChild(nowRow);
	            	infoCol.appendChild(auctionStartRow);
	            	infoCol.appendChild(auctionEndRow);
	            	
	            	leftRow.appendChild(imageCol);
	            	leftRow.appendChild(infoCol);
	            	
	            	leftCol.appendChild(leftRow);
	            	
	            	// 오른쪽 화면 시작
	            	const rightCol = document.createElement("div");
	            	rightCol.classList.add("col", "ms-2", "mt-3", "mb-3");
	            	
	            	// 첫번째 row 시작
	            	const rightFirstRow = document.createElement("div");
	            	rightFirstRow.classList.add("row", "text-end", "me-2");
	            	
	            	const rightFirstCol = document.createElement("div");
	            	rightFirstCol.classList.add("col");
	            	rightFirstCol.id = "auctionStatus_" + data.auctionDto.id;
	

	                rightFirstRow.appendChild(rightFirstCol);
	             	// 첫번째 row 종료
	             	
	             	//두번째 row 시작
		           	const rightSecondRow = document.createElement("div");
		           	rightSecondRow.classList.add("row", "text-end", "mt-2", "me-2");
	            	
	            	const rightSecondCol = document.createElement("div");
	            	rightSecondCol.classList.add("col");
	            	rightSecondCol.id = "auctionCountDownTime_" + data.auctionDto.id;
	            	
	            	rightSecondRow.appendChild(rightSecondCol);	
	            	// 두번째 row 끝
	            	
	            	rightCol.appendChild(rightFirstRow);
	            	rightCol.appendChild(rightSecondRow);
	                
	            	// 오른쪽 화면 끝
	            	
	                productRow.appendChild(leftCol);
	                productRow.appendChild(rightCol);
	                
	                productInfoCol.appendChild(productRow);
	                productInfoRow.appendChild(productInfoCol);
	            	
	            	
	                auctionProductListBox.appendChild(productInfoRow);
				
	                
	        	   
	            }
	            
	        }
	    };
	    xhr.open("get", url);
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
    
    // 대분류 카테고리 드롭다운을 기본 선택 값으로 설정
    const mainCategoryDropdown = document.getElementById('mainCategoryDropdown');
    mainCategoryDropdown.value = defaultMainCategoryId;
    
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
	
		
		
		<div class="row mt-2 mb-3">
			<div class="col">
			
				<input type="button" onclick= "registerProductPage()"
				  class="btn btn-dark" value="경매 물품 등록">				  
			</div>
		</div>
		
		
			<div class="row">
				<div class="col" id="auctionProductList">
				
				</div>
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
	      
	                <button class="btn btn-primary btn-block btn-dark text-center me-5"
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
	

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>	
</html>