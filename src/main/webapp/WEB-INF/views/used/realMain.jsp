<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사파리 | 중고메인</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<jsp:include page="../common/meta.jsp"></jsp:include>
<style>
	.title{
		font-size: 18px;
    	font-weight: 500;
	}
	.price{
		font-size: 18px;
	}
    .smaller-text {
        font-size: 13px;
    }
    .custom-span {
        display: inline-block;
        height: 0.5cm;
    }
    .btn-sm-custom {
     	font-size : 12px;
        line-height: 0.4cm;
    }
	.reset-button {
	    background: none;
	    border: none;
	    padding: 0;
	    margin: 0;
	    cursor: pointer;
	}
	/* 버튼 색깔 */
   .orangeButton{
	background: #ff6f0f;
	color: white;
    }   
    .overflow {
	  white-space: nowrap; /* 텍스트를 한 줄로 표시 */
	  overflow: hidden; /* 넘친 텍스트를 숨김 */
	  text-overflow: ellipsis; /* 넘친 텍스트를 "..."으로 표시 */
	}
	.btn-qna{position: fixed; bottom: 80px; right: 70px; border-radius: 60px; padding: 0 0;}
	.btn-circle{width: 50px; height: 52px; border-radius: 50%; display: flex; flex-direction:column; justify-content: center; align-items: center; font-size: 2rem; cursor: pointer;}
	.btn-circle i{color: #5e5e5e; font-size: 24px;}
	.btn-tit{font-size:13px;}
</style>

</head>
<body>
	<!-- Chat Box -->
	<jsp:include page="../common/chatBox.jsp"></jsp:include>
	<!-- Chat Box -->
	<!-- 헤더 섹션 -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->
	<div class="row">
		<div class="col text-center">
			<img alt="banner1" src= "/safari/resources/img/used/listBanner.jpeg" class="img-fluid" width="1300px">
		</div>
	</div>
	<div class="container-fluid d-flex align-items-center justify-content-between p-3 px-5 bg-light mb-2">
		<div class="container">
			<div class="row px-4">
				<p class="mb-0 text-body-secondary"><span class="mx-2" style="font-size: 15px;">홈</span> &gt; <span class="mx-2" style="font-size: 15px;">중고</span></p>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
		<div class="container main_box">
			<jsp:include page="../used/categoryNavi.jsp"></jsp:include>
			<div class="col">
				<div class="row" id="listParent"></div>
				<div class="row pt-3">
					<div class="col py-3 d-flex justify-content-center">
						<ul class="d-flex px-0">
							<li class="mx-1 " style="list-style: none;"><a class="btn" href="#"><i class="fa-solid fa-angles-left" style="color: #9ba4ab;"></i></a></li>
							<li class="mx-1 rounded-1 btnNavi" style="background: #8baac1; list-style: none; border: 1px solid #81a3bd;"><a class="btn text-white" href="#">1</a></li>
							<li class="mx-1 " style="list-style: none;"><a class="btn" href="#">2</a></li>
							<li class="mx-1 " style="list-style: none;"><a class="btn" href="#">3</a></li>
							<li class="mx-1 " style="list-style: none;"><a class="btn" href="#">4</a></li>
							<li class="mx-1 " style="list-style: none;"><a class="btn" href="#">5</a></li>
							<li class="mx-1 " style="list-style: none;"><a class="btn" href="#"><i class="fa-solid fa-angles-right" style="color: #9ba4ab;"></i></a></li>
						</ul>
					</div>
	</div>
			</div>
		</div>
			<div class="row mt-1"></div>
		</div>
	</div>
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->
<script>

// 전체상품 클릭할 때 전체상품 보여주기
let mainId = -1;
let subId = -1;
let cityId = -1;
let townId = -1;
let statusId = -1;
let orderId = -1;

const listParent = document.getElementById("listParent");
function getViewAll(mainId2,subId2,cityId2,townId2,statusId2,orderId2){
	
	
    const xhr = new XMLHttpRequest();
    let idx = 0;
    mainId = mainId2==0?mainId:mainId2;
	subId = subId2==0?subId:subId2;
	cityId = cityId2==0?cityId:cityId2;
	townId = townId2==0?townId:townId2;
	statusId = statusId2==0?statusId:statusId2;
	orderId = orderId2==0?orderId:orderId2;
    
	/* console.log(mainId)
	console.log(subId)
	console.log(cityId)
	console.log(townId)
	console.log(statusId)
	console.log(orderId) */
	
    xhr.onreadystatechange = function(){
    	if(xhr.readyState == 4 && xhr.status == 200){
        	const response = JSON.parse(xhr.responseText);
        	listParent.innerHTML = ""; 
        	if(response.result == "success"){
        		const recentOrderBox = document.getElementById("recentOrder");
        		const bestOrderBox = document.getElementById("bestOrder");
        		const lowOrderrBox = document.getElementById("lowOrder");
        		const highOrderBox = document.getElementById("highOrder");
        		if(orderId==-1){
        			recentOrderBox.classList.add("fw-bold");
        			bestOrderBox.classList.remove("fw-bold");
        			lowOrderrBox.classList.remove("fw-bold");
        			highOrderBox.classList.remove("fw-bold");
        		}else if(orderId==1){
        			bestOrderBox.classList.add("fw-bold");
        			recentOrderBox.classList.remove("fw-bold");
        			lowOrderrBox.classList.remove("fw-bold");
        			highOrderBox.classList.remove("fw-bold");
        		}else if(orderId==2){
        			lowOrderrBox.classList.add("fw-bold");
        			recentOrderBox.classList.remove("fw-bold");
        			bestOrderBox.classList.remove("fw-bold");
        			highOrderBox.classList.remove("fw-bold");
        		}else if(orderId==3){
        			highOrderBox.classList.add("fw-bold");
        			recentOrderBox.classList.remove("fw-bold");
        			bestOrderBox.classList.remove("fw-bold");
        			lowOrderrBox.classList.remove("fw-bold");
        		}
        		
        		const list = response.list;
                list.forEach((map) => {
                	const outCol = document.createElement("div");
                	outCol.classList.add("col-3", "p-4");
                	const outRow = document.createElement("div");
                	outRow.classList.add("row");
                	
                	
                	const divCol = document.createElement("div");
                    divCol.classList.add("col", "shadow");
                  
                    const divRow1 = document.createElement("div");
                    divRow1.classList.add("row", "mb-1");
                  
                    const divRow1col = document.createElement("div");
                    divRow1col.classList.add("col", "px-0");
                    
                    
                    
                    const link = document.createElement("a");
                    link.href = `./productDetail?productId=\${map.productDto.id}`;
                    link.classList.add("text-decoration-none", "text-black", "p-0");
                  
                    const img = document.createElement("img");
                    img.alt = "img";
                    img.classList.add("img-fluid");
                    img.src = "/safarifile/" + map.productImgDto.product_img_link;
                  
                    link.appendChild(img);
                    divRow1.appendChild(link);
                    divCol.appendChild(divRow1);
                  
                    const divRow2 = document.createElement("div");
                    divRow2.classList.add("row");
                  
                    const divCol1 = document.createElement("div");
                    divCol1.classList.add("col", "mt-2", "overflow");
                  
                    const link2 = document.createElement("a");
                    link2.href = `./productDetail?productId=\${map.productDto.id}`;
                    link2.classList.add("ms-1", "text-decoration-none", "text-black", "title");
                    link2.textContent = map.productDto.title;
                  
                    divCol1.appendChild(link2);
                    
                  
                    const divCol2 = document.createElement("div");
                    divCol2.classList.add("span", "ms-2", "btn-group", "pb-1");
                  
                    if (map.reservationCount > 0) {
                    	const divReserve = document.createElement("div");

                    	const button = document.createElement("button");
                    	button.type = "button";
                    	button.classList.add("btn", "btn-success", "btn-sm", "p-1", "btn-sm-custom");
                    	button.disabled = true;
                    	button.textContent = "예약중";

                    	divReserve.appendChild(button);
                    	divCol2.appendChild(divReserve);

                    }
                  
                    if (map.completeCount > 0) {
                    	const divReserve = document.createElement("div");

                    	const button = document.createElement("button");
                    	button.type = "button";
                    	button.classList.add("btn", "btn-secondary", "btn-sm", "p-1", "btn-sm-custom");
                    	button.disabled = true;
                    	button.textContent = "거래완료";

                    	divReserve.appendChild(button);
                    	divCol2.appendChild(divReserve);
                    }
                  
                    if (map.completeCount == 0 && map.reservationCount == 0) {
                      const span = document.createElement("span");
                      span.classList.add("custom-span");
                      divCol2.appendChild(span);
                    }
                  
                    link2.appendChild(divCol2);
                    divRow2.appendChild(divCol1);
                    divCol.appendChild(divRow2);
                  
                    const divRow4 = document.createElement("div");
                    divRow4.classList.add("row", "ms-1");
                  
                    const divCol3 = document.createElement("div");
                    divCol3.classList.add("col", "ms-0", "p-0", "w-0", "smaller-text", "text-secondary", "mb-3");
                    divCol3.textContent = map.productCityDto.product_city_name + ' ' + map.productTownDto.product_town_name + ' | ';
                    const timeSpan = document.createElement("span");
                    timeSpan.classList.add("ms-0", "p-0", "w-0", "smaller-text", "text-secondary");
                    timeSpan.id = 'timeSpan';
                    timeSpan.innerText = dateToTimeDifference(map.productDto.reg_date);
                    divCol3.appendChild(timeSpan);
                  	
                	
                    
                    divRow4.appendChild(divCol3);
                    divCol.appendChild(divRow4);
                    
                    const divRow3 = document.createElement("div");
                    divRow3.classList.add("row", "ms-1", "fw-semibold", "price");
                  
                    if (map.productDto.price == 0) {
                      const btnShare = document.createElement("button");
                      btnShare.type = "button";
                      btnShare.classList.add("btn", "btn-warning", "btn-sm", "col-auto");
                      btnShare.disabled = true;
                      btnShare.textContent = "나눔";
                      divRow3.appendChild(btnShare);
                    } else {
                      const fmtNumber = document.createElement("span");
                      fmtNumber.classList.add("p-0")
                      const number = map.productDto.price;
                      const formattedNumber = number.toLocaleString();
                      fmtNumber.textContent = formattedNumber+'원';
                      divRow3.appendChild(fmtNumber);
                    }
                  
                    divCol.appendChild(divRow3);
                  
                  
                    const divRow5 = document.createElement("div");
                    divRow5.classList.add("row", "mb-3", "fw-medium");
                    
                    const divCol4 = document.createElement("div");
                    divCol4.classList.add("col", "ms-1", "text-secondary");
   
                    const heartIcon = document.createElement("i");
                    heartIcon.classList.add("bi", "bi-heart");
					
                    const likeCount = document.createTextNode(" "+map.likeCount);
					
                    const span = document.createElement("span");
                    span.classList.add("ms-2");
                    
                    const chatIcon = document.createElement("i");
                    chatIcon.classList.add("bi", "bi-chat-dots");

                    const requestCount = document.createTextNode(" "+map.requestCount);

                    
                    divRow1.appendChild(divRow1col);
                    divRow1col.appendChild(link);
                    divCol4.appendChild(heartIcon);
                    divCol4.appendChild(likeCount);
                   
                    
                    divCol4.appendChild(span);
                    span.appendChild(chatIcon);
                    span.appendChild(chatIcon);
                    
                    divCol4.appendChild(requestCount);                  
                    divRow5.appendChild(divCol4);
                    divCol.appendChild(divRow5);
                    
                    outRow.appendChild(divCol);
                	outCol.appendChild(outRow);

                  
                    listParent.appendChild(outCol);
                  	
                    if ((idx+1) % 4 === 0) {
                      const divEndRow = document.createElement("div");
                      divEndRow.classList.add("row");
                      listParent.appendChild(divEndRow);
                    }
                    idx++;
                    
                  });
            }
        }
    }

    xhr.open("get", "./getProductByAllCondition?mainId="+mainId+"&subId="+subId+"&cityId="+cityId+"&townId="+townId+"&statusId="+statusId+"&orderId="+orderId);
    xhr.send();
}

// 전체보기 누르면 체크박스 해제 
const viewAllbox = document.getElementById("viewAll");

viewAllbox.addEventListener("click", function() {
	// 체크박스 초기화 	
  const inlineCheckbox1 = document.getElementById("inlineCheckbox1");
  if (inlineCheckbox1.checked) {
    inlineCheckbox1.checked = false;
  }
  // 지역, 동네 초기화 
  const cityBox = document.getElementById("product_city");
  cityBox.value = 0;
  const townBox = document.getElementById("product_town");
  townBox.value = 0;
});

// 체크박스 표시확인 
const inlineCheckbox1 = document.getElementById("inlineCheckbox1");
inlineCheckbox1.addEventListener("change", function() {
	  // 체크박스가 체크되어 있는지 확인
	  /* getViewAll(-1,-1,-1,-1,-1,-1) */
	  console.log(this.checked);
	  if (this.checked) {
		  getViewAll(0,0,0,0,1,0);
	  } else {
		  getViewAll(0,0,0,0,-1,0);
	  }
});


//도시에 따른 동네 
function getTownList() {
    const cityBox = document.getElementById("product_city");
    let cityId = cityBox.value;
    const townBox = document.getElementById("product_town");
    

    const xhr = new XMLHttpRequest();

    xhr.onreadystatechange = function(){
        if(xhr.readyState == 4 && xhr.status == 200){
            const response = JSON.parse(xhr.responseText);
            townBox.innerHTML = "";

            // 동네 옵션에 따른 추가 
            let defaultOption = document.createElement("option");
            defaultOption.value = "0";
            defaultOption.selected = true;
            defaultOption.textContent = "동네를 선택하세요";
            townBox.appendChild(defaultOption);

            response.getTownList.forEach(function(data) {
                const option = document.createElement("option");
                option.value = data.id;
                option.textContent = data.product_town_name;
                townBox.appendChild(option);
            });
        }
    }

    xhr.open("get", "./getTownList?cityId="+cityId);
    xhr.send();
}

// 도시 선택하면 동네 나오게 하기 
const cityBox = document.getElementById("product_city");
cityBox.addEventListener("change", getTownList);
// 도시 선택할 시 해당 물건 리스트 나오게 하기 
cityBox.addEventListener("change", function() {
	  let cityValue = cityBox.value;
	  if(cityValue == 0){
		  cityValue = -1;
	  }
	  getViewAll(0, 0, cityValue, -1, 0, 0);
});
// 동네 선택할 시 , 도시랑 동네에 맞게 물건 리스트 나오게 하기 
const townBox = document.getElementById("product_town");
townBox.addEventListener("change", function() {
	  let townValue = townBox.value;
	  if(townValue == 0){
		  townValue = -1;
	  }
	  getViewAll(0, 0, -1, townValue, 0, 0);
});


//몇 시간/분/초 전 
function dateToTimeDifference(date) {

	// 자바스크립트 날짜로 변환 
	const dateFromDatabase = new Date(date);

	// 현재와 시간차 (밀리초)
	const timeDifference = Date.now() - dateFromDatabase.getTime();
	
	 // 초, 분, 시간, 일, 월, 년 계산 (integer)
	const seconds = Math.floor(timeDifference / 1000);
	const minutes = Math.floor(seconds / 60);
	const hours = Math.floor(minutes / 60);
	const days = Math.floor(hours / 24);
	const months = Math.floor(days / 30);
	const years = Math.floor(months / 12);

	let formattedTime;

	// 시/분/초 중 하나 정해서 표시 
	if (years >= 1) {
	  formattedTime = `\${years}년 전`;
	} else if (months >= 1) {
	  formattedTime = `\${months}개월 전`;
	} else if (days >= 1) {
	  formattedTime = `\${days}일 전`;
	} else if (hours >= 1) {
	  formattedTime = `\${hours}시간 전`;
	} else if (minutes >= 1) {
	  formattedTime = `\${minutes}분 전`;
	} else {
	  formattedTime = `\${seconds}초 전`;
	}

	return formattedTime;
	
}
// 로드할때
window.addEventListener("DOMContentLoaded", function() {
	getViewAll(-1,-1,-1,-1,-1,-1);
});

</script>


</body>
</html>