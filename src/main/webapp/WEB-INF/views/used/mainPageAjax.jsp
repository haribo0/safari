<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</style>

</head>
<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->
	<div class="container-fluid d-flex align-items-center justify-content-between p-3 px-5 mb-3 bg-light">
		<div class="container">
			<div class="row px-4">
				<p class="mb-0 text-body-secondary"><span class="mx-2" style="font-size: 15px;">중고</span> &gt; <span class="mx-2" style="font-size: 15px;">패션의류</span> &gt;<span class="mx-2" style="font-size: 15px;">상의</span> </p>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
		<div class="container main_box">
			<jsp:include page="../used/categoryNavi.jsp"></jsp:include>
			<div class="col mb-1 mt-4">
				<div class="row" id="listParent"></div>
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
                	const divCol = document.createElement("div");
                    divCol.classList.add("col-3");
                  
                    const divRow1 = document.createElement("div");
                    divRow1.classList.add("row", "mb-1");
                  
                    const link = document.createElement("a");
                    link.href = `./productDetail?productId=\${map.productDto.id}`;
                    link.classList.add("text-decoration-none", "text-black");
                  
                    const img = document.createElement("img");
                    img.alt = "img";
                   
                    img.src = "/safarifile/" + map.productImgDto.product_img_link;
                    img.height = 210;
                    img.width = 200;
                  
                    link.appendChild(img);
                    divRow1.appendChild(link);
                    divCol.appendChild(divRow1);
                  
                    const divRow2 = document.createElement("div");
                    divRow2.classList.add("row");
                  
                    const divCol1 = document.createElement("div");
                    divCol1.classList.add("col");
                  
                    const link2 = document.createElement("a");
                    link2.href = `./productDetail?productId=\${map.productDto.id}`;
                    link2.classList.add("ms-1", "text-decoration-none", "text-black");
                    link2.textContent = map.productDto.title;
                  
                    divCol1.appendChild(link2);
                    divRow2.appendChild(divCol1);
                  
                    const divCol2 = document.createElement("div");
                    divCol2.classList.add("col-5", "mt-0");
                  
                    if (map.reservationCount > 0) {
                    	const divReserve = document.createElement("div");
                    	divReserve.classList.add("btn-group");

                    	const button = document.createElement("button");
                    	button.type = "button";
                    	button.classList.add("btn", "btn-outline-success", "btn-sm", "p-1", "m-0", "btn-sm-custom");
                    	button.disabled = true;
                    	button.textContent = "예약중";

                    	divReserve.appendChild(button);
                    	divCol2.appendChild(divReserve);

                    }
                  
                    if (map.completeCount > 0) {
                    	const divReserve = document.createElement("div");
                    	divReserve.classList.add("btn-group");

                    	const button = document.createElement("button");
                    	button.type = "button";
                    	button.classList.add("btn", "btn-outline-success", "btn-sm", "p-1", "m-0", "btn-sm-custom");
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
                  
                    divRow2.appendChild(divCol2);
                    divCol.appendChild(divRow2);
                  
                    const divRow3 = document.createElement("div");
                    divRow3.classList.add("row", "ms-1", "fw-semibold");
                  
                    if (map.productDto.price == 0) {
                      const btnShare = document.createElement("button");
                      btnShare.type = "button";
                      btnShare.classList.add("btn", "btn-warning", "btn-sm", "col-2", "p-0", "text-black");
                      btnShare.disabled = true;
                      btnShare.textContent = "나눔";
                      divRow3.appendChild(btnShare);
                    } else {
                      const fmtNumber = document.createElement("span");
                      fmtNumber.classList.add("p-0")
                      const number = map.productDto.price;
                      const formattedNumber = number.toLocaleString();
                      fmtNumber.textContent = formattedNumber;
                      divRow3.appendChild(fmtNumber);
                    }
                  
                    divCol.appendChild(divRow3);
                  
                    const divRow4 = document.createElement("div");
                    divRow4.classList.add("row", "ms-1");
                  
                    const divCol3 = document.createElement("div");
                    divCol3.classList.add("col", "ms-0", "p-0", "w-0", "smaller-text");
                    divCol3.textContent = map.productCityDto.product_city_name + ' ' + map.productTownDto.product_town_name;
                  
                    divRow4.appendChild(divCol3);
                    divCol.appendChild(divRow4);
                  
                    const divRow5 = document.createElement("div");
                    divRow5.classList.add("row", "mb-5");
                  
                    const divCol4 = document.createElement("div");
                    divCol4.classList.add("col", "ms-1", "text-secondary");

                    const heartIcon = document.createElement("i");
                    heartIcon.classList.add("bi", "bi-heart-fill");

                    const likeCount = document.createTextNode(map.likeCount +" ");

                    const chatIcon = document.createElement("i");
                    chatIcon.classList.add("bi", "bi-chat-dots-fill");

                    const requestCount = document.createTextNode(map.requestCount);

                    divCol4.appendChild(heartIcon);
                    divCol4.appendChild(likeCount);
                   
                    divCol4.appendChild(chatIcon);
                    divCol4.appendChild(requestCount);                  
                    divRow5.appendChild(divCol4);
                    divCol.appendChild(divRow5);
                  
                    listParent.appendChild(divCol);
                  	
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

// 로드할때
window.addEventListener("DOMContentLoaded", function() {
	getViewAll(-1,-1,-1,-1,-1,-1);
});

</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>


</body>
</html>