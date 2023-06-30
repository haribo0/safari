<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<div class="container mt-5">
    <h3 class="row justify-content-center mb-4">중고거래 상품 등록</h3>
    <div class="row">
    <div class="col-2"></div>
    <div class="col">
    <form action="./productRegisterProcess" method="post" enctype="multipart/form-data">
        <div class="form-group row mt-1">
            <label for="title" class="col-sm-2 col-form-label fw-bold">상품 제목</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="title" name="title" placeholder="상품 제목">
            </div>
        </div>
        
        <div class="form-group row mt-3">
            <label for="product_main_category" class="col-sm-2 col-form-label fw-bold">카테고리 대분류</label>
            <div class="col-sm-4">
            	<select class="form-control" id="product_main_category">
            		<option value="0" selected="selected">대분류 선택</option>
            		<c:forEach items="${MainCateogryList}" var="ProductMainCategoryDto">
                    	<option value="${ProductMainCategoryDto.id }">${ProductMainCategoryDto.main_category_name }</option>
                    </c:forEach>
                </select>
            </div>

            <label for="product_sub_category" class="col-sm-2 col-form-label fw-bold">카테고리 소분류</label>
            <div class="col-sm-4">
                <select class="form-control" id="product_sub_category" name="product_sub_category">
                   <option value="0" selected="selected">소분류 선택</option>
                </select>
            </div>
        </div>

        <div class="form-group row mt-3">
            <label for="content" class="col-sm-2 col-form-label fw-bold">상품 설명</label>
            <div class="col-sm-10">
                <textarea class="form-control" name="content" rows="5" placeholder="상품 설명"></textarea>
            </div>
        </div>
		
			
        <div class="form-group row mt-3">
            <label for="price" class="col-sm-2 col-form-label fw-bold">가격</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="price" name="price1" placeholder="가격">
            </div>
			<div class="col-1"></div>
            <div class="col-3">
                <input class="form-check-input align-middle" type="checkbox" id="donation" name="donation">
            	<label for="donation" class="col-sm-2 col-form-label align-middle ms-1">나눔</label>
            </div>
            
        </div>

        <div class="form-group row mt-3">
            <label for="images" class="col-sm-2 col-form-label fw-bold">상품 이미지</label>
            <div class="col-sm-10">
                <input type="file" class="form-control-file" name="images" accept="image/*" multiple>
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
             	<input class="form-control" type="text" name="location"> 
            </div>
            <div class="col-4">
             	<div class="btn btn-light">장소 선택</div>
            </div>
        </div>
		
        <div class="row">
        	<div class="col"></div>
            <div class="col-2 me-0 d-grid">
                <button type="submit" class="btn btn-primary btn-block btn-dark">등록</button>
            </div>
        </div>
        <input type="hidden" value="${sessionUser.id }" name="user_id">
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

//가격 1000단위마다 , 
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

</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>


</body>
</html>