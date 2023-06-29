<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사파리 | 대여 상품 등록</title>
<!-- 메타 섹션 -->
<jsp:include page="../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->

</head>
<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->

<div class="container mt-5">
    <h3 class="row justify-content-center mb-4">대여 상품 등록</h3>
    <div class="row">
    <div class="col-2"></div>
    <div class="col">
    <form action="#" method="POST">
        <div class="form-group row mt-1">
            <label for="title" class="col-sm-2 col-form-label fw-bold">상품 제목</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="title" name="title" placeholder="상품 제목">
            </div>
        </div>
        
        <div class="form-group row mt-3">
            <label for="mainCategory" class="col-sm-2 col-form-label fw-bold">카테고리 대분류</label>
            <div class="col-sm-4">
            	<select class="form-control" id="mainCategory" name="mainCategory">
            		<option value="0">대분류 선택 </option>
                </select>
            </div>

            <label for="category" class="col-sm-2 col-form-label fw-bold ml-2">카테고리 소분류</label>
            <div class="col-sm-4">
                <select class="form-control" id="subCategory" name="sub_category_id">
                	<option value="0">소분류 선택</option>
                </select>
            </div>
        </div>

        <div class="form-group row mt-3">
            <label for="description" class="col-sm-2 col-form-label fw-bold">상품 설명</label>
            <div class="col-sm-10">
                <textarea class="form-control" id="description" name="description" rows="5" placeholder="상품 설명"></textarea>
            </div>
        </div>
		
			
			
        <div class="form-group row mt-3">
            <label for="deposit" class="col-sm-2 col-form-label fw-bold">보증금</label>
            <div class="col">
                <input type="text" class="form-control" id="deposit" name="deposit" placeholder="보증금">
            </div>
            <label for="quantity" class="col-sm-2 col-form-label fw-bold ml-2">총 운영 수량</label>
            <div class="col">
                <input type="text" class="form-control" id="quantity" name="quantity" placeholder="운영 수량">
            </div>
        </div>
			
        <div class="form-group row mt-3">
            <label for="price" class="col-sm-2 col-form-label fw-bold">대여 가격 (월)</label>
            <div class="col">
                <input type="text" class="form-control" id="price" name="price" placeholder="가격">
            </div>
            <div class="col">
            </div>
        </div>
        
        
       <div class="form-group row mt-3">
            <label for="" class="col col-form-label fw-bold mt-1">기간 별 할인(선택)</label>
            <div class="col-10">
            	<div class="form-group row mt-1" id="disc_form">
		        	<label for="period" class="col-1 col-form-label fw-bold text-end">기간</label>
		            <div class="col-2">
		                <input type="number" class="form-control" id="" name="period" placeholder="개월 수" >
		            </div>
	            	<label for="disc_price" class="col-1 col-form-label fw-bold text-end">가격</label>
		            <div class="col-4">
		                <input type="text" class="form-control disc_price" id="" name="disc_price" placeholder="가격">
		            </div>
		            <div class="col-1">
		                <div class="btn btn-outline-secondary">+</div>
		            </div>
		            
		        </div>
            
            </div>
        </div>
        
        

        <div class="form-group row mt-3">
            <label for="image" class="col-sm-2 col-form-label fw-bold">상품 대표 이미지</label>
            <div class="col-sm-10">
                <input type="file" class="form-control-file" id="image" name="image" accept="images/*">
            </div>
        </div>

        <div class="form-group row mt-3">
            <label for="image" class="col-sm-2 col-form-label fw-bold">상품 상세 이미지</label>
            <div class="col-sm-10">
                <input type="file" class="form-control-file" id="image" name="image" accept="images/*" multiple>
            </div>
        </div>
        
		
        <div class="row">
        	<div class="col"></div>
            <div class="col-2 me-0 d-grid">
                <button type="submit" class="btn btn-primary btn-block btn-dark">등록</button>
            </div>
        </div>
    </form>
    </div>
    <div class="col-2"></div>
    </div>
</div>

	
	
	
	
	
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

<script>

const priceInput = document.getElementById("price");
priceInput.addEventListener("input", formatPrice);
const depositInput = document.getElementById("deposit");
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

const priceInputs = document.getElementsByClassName("disc_price");
for (let i = 0; i < priceInputs.length; i++) {
    priceInputs[i].addEventListener("input", formatPrice);
}


</script>

</body>	
</html>