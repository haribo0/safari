<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<link rel="stylesheet" href="/safari/resources/style/common.css" type="text/css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<style>
/* 버튼 색깔 */
.orangeButton{
	background: #ff6f0f;
	color: white;
}

input[type=file]::file-selector-button {
  background-color: #e5e5e5;
  color: #000;
  border: 0px;
  border-right: 1px solid #e5e5e5;
  padding: 5px 12px;
  margin-right: 20px;
  transition: .5s;
  border-radius: 4px;
  cursor: pointer;
  
}

input[type=file]::file-selector-button:hover {
  background-color: #eee;
  border: 0px;
  border-right: 1px solid #e5e5e5;
  order-radius: 4px;
}

.secondaryButton{
	background : #c0c0c0;
	color: white;
}

</style>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<div class="container mt-5">
    <h3 class="row justify-content-center mb-4">중고거래 상품 수정</h3>
    <div class="row">
    <div class="col-2"></div>
    <div class="col">
    <form action="./updateProductRegisterProcess" method="post" enctype="multipart/form-data" id="updateForm">
        <div class="form-group row mt-1">
            <label for="title" class="col-sm-2 col-form-label fw-bold">상품 제목</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="title" name="title" placeholder="상품 제목" value="${map.productDto.title }">
            </div>
        </div>
        
        <div class="form-group row mt-3">
            <label for="product_main_category" class="col-sm-2 col-form-label fw-bold">카테고리 대분류</label>
            <div class="col-sm-4">
            	<select class="form-control" id="product_main_category">
            		<option value="0" >대분류 선택</option>
            		<c:forEach items="${MainCateogryList}" var="ProductMainCategoryDto">
                    	<option value="${ProductMainCategoryDto.id }">${ProductMainCategoryDto.main_category_name }</option>
                    </c:forEach>
                </select>
            </div>

            <label for="product_sub_category" class="col-sm-2 col-form-label fw-bold">카테고리 소분류</label>
            <div class="col-sm-4">
                <select class="form-control" id="product_sub_category" name="product_sub_category">
                   <option value="0">소분류 선택</option>
                </select>
            </div>
        </div>

        <div class="form-group row mt-3">
            <label for="content" class="col-sm-2 col-form-label fw-bold">상품 설명</label>
            <div class="col-sm-10">
                <textarea class="form-control" name="content" id="content" rows="5" placeholder="상품 설명">${map.productDto.content }</textarea>
            </div>
        </div>
		
			
        <div class="form-group row mt-3">
            <label for="price" class="col-sm-2 col-form-label fw-bold">가격</label>
            <div class="col-sm-4">
            	 <c:choose>
                <c:when test="${map.productDto.price == 0 }">
                	<input type="text" class="form-control text-opacity-25 text-secondary" id="price" name="price1" placeholder="가격" value="${map.productDto.price }" disabled>
            	</c:when>
            	<c:otherwise>
            		<input type="text" class="form-control" id="price" name="price1" placeholder="가격" value="${map.productDto.price }">
            	</c:otherwise>
            	</c:choose>

            </div>
			<div class="col-1"></div>
            <div class="col-3">
                <c:choose>
                <c:when test="${map.productDto.price == 0 }">
                	<input class="form-check-input align-middle" type="checkbox" id="donation" name="donation" checked>
            		<label for="donation" class="col-sm-2 col-form-label align-middle ms-1">나눔</label>
            	</c:when>
            	<c:otherwise>
            		<input class="form-check-input align-middle" type="checkbox" id="donation" name="donation">
            		<label for="donation" class="col-sm-2 col-form-label align-middle ms-1">나눔</label>
            	</c:otherwise>
            	</c:choose>
            </div>
        </div>
        <div class="form-group row mt-3">
            <label for="images" class="col-sm-2 col-form-label fw-bold">상품 이미지</label>
            <div class="col-sm-10 input_container my-auto">
                <input type="file" class="form-control-file" name="images" accept="image/*" id="fileUpload" multiple>
            </div>
        </div>
        <div class="form-group row mt-3">
            <label for="product_city" class="col-sm-2 col-form-label fw-bold">지역</label>
            <div class="col-sm-4">
            	<select class="form-control" id="product_city">
            		<option value="0" selected="selected">지역을 선택하세요</option>
            		<c:forEach items="${cityList}" var="ProductCityDto">
                    	<option value="${ProductCityDto.id }">${ProductCityDto.product_city_name }</option>
                    </c:forEach>
                </select>
            </div>
            <label for="product_town" class="col-sm-2 text-center col-form-label fw-bold">동네</label>
            <div class="col-sm-4">
                <select class="form-control" id="product_town" name="product_town_id">
                   <option value="0" selected="selected">동네를 선택하세요</option>
                </select>
            </div>
        </div>
        <div class="form-group row mt-3">
        	<label for="location" class="col-sm-2 col-form-label fw-bold">거래 희망 장소</label>
            <div class="col-4">
             	<input class="form-control" type="text" name="location" id="location" value="${map.productDto.location }"> 
            </div>
        </div>
		        <input type="hidden" value="${sessionUser.id }" name="user_id">
		        <input type="hidden" value="${map.productDto.id }" name="id">
        <div class="row mb-4">
        	<div class="col"></div>
            <div class="col-2 me-0 d-grid">
                <a href="./productDetail?productId=${map.productDto.id }" type="button" class="btn secondaryButton btn-block">이전</a>
            </div>
            <div class="col-2 me-0 d-grid">
                <div class="btn btn-block orangeButton" id="updateButton">수정</div>
            </div>
        </div>

    </form>
    </div>
    <div class="col-2"></div>
    </div>
</div>
<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	

<script>

//대분류에 따른 소분류 
function getSubCategoryList() {
    const mainCategoryBox = document.getElementById("product_main_category");
    let mainCategoryId = mainCategoryBox.value;
    const subCategoryBox = document.getElementById("product_sub_category");
    

    const xhr = new XMLHttpRequest();

    xhr.onreadystatechange = function(){
        if(xhr.readyState == 4 && xhr.status == 200){
            const response = JSON.parse(xhr.responseText);
            subCategoryBox.innerHTML = "";

            // 소분류 옵션 생성 및 추가
            let defaultOption = document.createElement("option");
            defaultOption.value = "0";
            defaultOption.selected = true;
            defaultOption.textContent = "소분류 선택";
            subCategoryBox.appendChild(defaultOption);

            response.subCategoryList.forEach(function(data) {
                const option = document.createElement("option");
                option.value = data.id;
                option.textContent = data.sub_category_name;
                subCategoryBox.appendChild(option);
            });
        }
    }

    xhr.open("get", "./getSubCategoryList?mainCategoryId="+mainCategoryId);
    xhr.send();
}

const mainCategoryBox = document.getElementById("product_main_category");
mainCategoryBox.addEventListener("change", getSubCategoryList);

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

const cityBox = document.getElementById("product_city");
cityBox.addEventListener("change", getTownList);

//가격 나눔체크하면 변경 
const donationBox = document.getElementById("donation");
const priceInput = document.getElementById("price");
let originalPrice = null;

donationBox.addEventListener("change", function() {
  if (donationBox.checked) {
	originalPrice = priceInput.value ;
    priceInput.classList.add("text-secondary");
    priceInput.classList.add("text-opacity-25");
    priceInput.disabled = true; // 입력 비활성화
    priceInput.value = "0";

  } else {
    priceInput.disabled = false; // 입력 활성화
    priceInput.classList.remove("text-secondary");
    priceInput.classList.remove("text-opacity-25");
    priceInput.value = originalPrice; // 원래 가격으로 복원
  }
});

//가격 1000단위마다 , 가격 쓸때마다 변
const depositInput = document.getElementById("price");
depositInput.addEventListener("input", formatPrice);

function formatPrice() {
	
	// 빈 문자 일 경우 NaN 뜨지 않게 리턴 
	if(this.value === "") return;
	
    // 숫자 아닌 문자 제거 후 빈 문자일 경우 리턴 
    const numericValue = this.value.replace(/\D/g, "");
	if(numericValue === "") return;
    
    let number = parseInt(numericValue, 10);
    // 변환된 가격을 쉼표로 구분하여 다시 설정
    this.value = number.toLocaleString();
}

// #.000 
function formatPrice2(price) {
    return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

// input 가격바로 ,만들
function formatPriceInput() {
	const productId = new URLSearchParams(location.search).get("productId");
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			//map 갖고오기
			const response = JSON.parse(xhr.responseText);
			//js 작업
			if(response.result == "success"){
				const price = response.price;
				if(price != 0){
					const formattedPrice = formatPrice2(price);
					depositInput.value =  formattedPrice;
				}
				
			}
		}
	}
	xhr.open("GET", "./getProductPrice?productId="+productId);
    xhr.send();
}

const updateButton = document.getElementById("updateButton");

//등록 버튼 누를때 정보 입력 안되어있으면 focus 
updateButton.addEventListener("click", function(event) {
	const title = document.getElementById('title');
	const product_main_category = document.getElementById('product_main_category');
	const product_sub_category = document.getElementById('product_sub_category');
	const content = document.getElementById('content');
	const price = document.getElementById('price');
	const fileUpload = document.getElementById('fileUpload').files[0]; 
	const product_city = document.getElementById('product_city');
	const product_town = document.getElementById('product_town');
	const location = document.getElementById('location');
	
	if(!title.value) {
	  event.preventDefault();
	  alert("제목을 입력해주세요.");
	  title.focus();
	  return;
	}
	if(product_main_category.value==0) {
	  event.preventDefault();
	  alert("카테고리 대분류를 선택해주세요.");
	  product_main_category.focus();
	  return;
	}
	if(product_sub_category.value==0) {
	  event.preventDefault();
	  alert("카테고리 대분류를 선택해주세요.");
	  product_sub_category.focus();
	  return;
	}
	if(product_main_category.value==0) {
	  event.preventDefault();
	  alert("카테고리 소분류를 선택해주세요.");
	  product_main_category.focus();
	  return;
	}
	if(!content.value) {
	  event.preventDefault();
	  alert("상품 설명을 입력해주세요.");
	  content.focus();
	  return;
	}
	if(!price.value) {
	  event.preventDefault();
	  alert("가격을 입력해주세요.");
	  price.focus();
	  return;
	}
	if(!fileUpload) {
	  event.preventDefault();
	  alert("파일을 선택해주세요.");
	  document.getElementById('fileUpload').focus();
	  return;
	}
	if(product_city.value==0) {
	  event.preventDefault();
	  alert("지역을 선택해주세요.");
	  product_city.focus();
	  return;
	}
	if(product_town.value==0) {
	  event.preventDefault();
	  alert("동네를 선택해주세요.");
	  product_town.focus();
	  return;
	}
	if(!location.value) {
	  event.preventDefault();
	  alert("거래 희망 장소를 입력해주세요.");
	  location.focus();
	  return;
	}

// 폼 id 	
const updateForm = document.getElementById("updateForm");
updateForm.submit();

});

window.addEventListener("DOMContentLoaded", function() {
	formatPriceInput();
});

</script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js">
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload = function(){
    document.getElementById("location").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("location").value = data.address; // 주소 넣기
                document.querySelector("input[name=location]").focus(); //상세입력 포커싱
            }
        }).open();
    });
}
</script>

</body>
</html>