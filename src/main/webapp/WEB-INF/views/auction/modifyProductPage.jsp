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



<script>
window.onload = function() {
    // 대분류 카테고리의 기본 선택 값 설정
    
    const defaultMainCategoryId =  ${productDetail.productMainCategoryDto.id}; 
    
    // 대분류 카테고리 드롭다운을 기본 선택 값으로 설정
    const modifyMainCategoryDropdown = document.getElementById('modifyMainCategoryDropdown');
    modifyMainCategoryDropdown.value = defaultMainCategoryId;
    
    // 초기 선택한 대분류 카테고리에 해당하는 소분류 카테고리 리스트 출력
    getModifyProductSubcategories();
}



function getModifyProductSubcategories() {
    const productMainCategoryId = document.getElementById('modifyMainCategoryDropdown').value;
    const xhr = new XMLHttpRequest();
    
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
 
            const response = JSON.parse(xhr.responseText);
            
            getModifyProductSubcategoriesList(response.subCategories);
        }
    };
    xhr.open("get", "/safari/auction/getProductSubCategories/" + productMainCategoryId);
    xhr.send();
}	


function getModifyProductSubcategoriesList(subCategories) {
    const subCategoryDropdown = document.getElementById('modifySubCategoryDropdown');
    subCategoryDropdown.innerHTML = '';

    subCategories.forEach(function(subCategory) {
        const option = document.createElement('option');
        option.value = subCategory.id;
        option.text = subCategory.sub_category_name;
        
        if (subCategory.id === '${productSubCategory}') {
            option.selected = true;
        }
        subCategoryDropdown.appendChild(option);
    });
}
</script>

</head>
<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->

	<div class="container main_box">
		<h1 class="text-center fs-3"><b>경매</b> 메인 페이지</h1>
		
	<div class="row mt-5">
		<jsp:include page="./sidemenu.jsp"></jsp:include>
	
	<%-- 메인 페이지 시작 --%>

	<div class="col-10">
	
		<div class="row text-center fw-bold fs-5">
			<div class="col">
				경매 물품 수정
			</div>
		</div>
		
		<div class="row mt-2">
			<div class="col"></div>
			<div class="col-10">
				<form action="/safari/auction/modifyProductProcess" method="post" enctype="multipart/form-data">
					
					<input type="hidden" name="id" value="${auctionDto.auctionDto.id}">
					<div class="row mb-3">
					  	<label class="form-label">대분류 카테고리</label>
					  	
						 <select id="modifyMainCategoryDropdown" onchange="getModifyProductSubcategories()">
						        <c:forEach items="${productMainCategories}" var="productMainCategory">
						            <option value="${productMainCategory.id}">${productMainCategory.main_category_name}</option>
						        </c:forEach>
						  </select>					  	
					  		
					  		
					</div>
					
					<div class="row mb-3">
					  	<label class="form-label">소분류 카테고리</label>
					  		<select id="modifySubCategoryDropdown" name="auction_sub_category_id">
					  		</select>
					</div>					
					
					<div class="row mb-3 fw-normal">
						<label class="form-label">제품명</label>
						<input type="text" name="title" class="form-control" placeholder="상품명을 입력하세요"
						value="${auctionDto.auctionDto.title}">					
					</div>		
		
					<div class="row mb-3">
						<label class="form-label">상세설명</label>
						<textarea class="form-control" name="description" rows="5"				
							placeholder="제품에 대해 쉽게 이해할 수 있도록 자세히 작성해주세요">${auctionDto.auctionDto.description}</textarea>				
					</div>			
					
				
					<div class="row mb-3">
					  <label  class="form-label">제품 이미지</label>
					  <input class="form-control" 
					  		name="auctionItemImgFiles" type="file" multiple="multiple" accept="image/*">
					</div>	
					
					<div class="row mb-3">
						<div class="col">
							<label class="form-label">경매시작일</label>
							<input type="datetime-local" name="start_date" value="${auctionDto.auctionDto.start_date}"> 
						</div>
						<div class="col">
							<label class="form-label">경매종료일</label>
							<input type="datetime-local" name="end_date" value="${auctionDto.auctionDto.end_date}"> 	
						</div>							
					</div>								
		
					<div class="row mb-3">
						<div class="col">
							<label class="form-label">시작가격</label>
							<input type="text" name="start_price" class="form-control" value="${auctionDto.auctionDto.start_price}"> 
						</div>
						<div class="col">
							<label class="form-label">즉시낙찰가 설정</label>
							<input type="text" name="max_price" class="form-control" value="${auctionDto.auctionDto.max_price}"> 	
						</div>							
					</div>																								
							
					<div class="row mt-4">
						<div class="col d-grid">
							<button class="btn text-white fs-5 fw-bold" style="background-color: #000000;">경매 등록</button>
						</div>
					</div>
				</form>					
			
			
			</div>
			<div class="col"></div>

		</div>
		
		</div>
			
		
		
	</div>
	<div class="col"></div>
	
	</div>
	
	


	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>	
</html>