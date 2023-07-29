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
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<div class="container mt-5">
    <h3 class="row justify-content-center mb-4">중고거래 상품 등록11</h3>
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
            <label for="product_main_category" class="col-sm-2 col-form-label fw-bold">카테고리 대분류</label>
            <div class="col-sm-4">
            	<select class="form-control" id="product_main_category" name="product_main_category">
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
            		<c:forEach items="${SubCateogryList}" var="ProductSubCategoryDto">
                    	<option value="${ProductSubCategoryDto.id}" class="mall${ProductSubCategoryDto.product_main_category_id}">${ProductSubCategoryDto.sub_category_name }</option>
                    </c:forEach>
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
            <label for="price" class="col-sm-2 col-form-label fw-bold">가격</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="price" name="price" placeholder="가격">
            </div>
			<div class="col-1"></div>
            <div class="col-3">
                <input class="form-check-input align-middle" type="checkbox" id="donation" name="donation" value="true">
            	<label for="donation" class="col-sm-2 col-form-label align-middle ms-1">나눔</label>
            </div>
            
        </div>

        <div class="form-group row mt-3">
            <label for="image" class="col-sm-2 col-form-label fw-bold">상품 이미지</label>
            <div class="col-sm-10">
                <input type="file" class="form-control-file" id="image" name="image" accept="./images" multiple>
            </div>
        </div>
        
        <div class="form-group row mt-3">
        	<label for="image" class="col-sm-2 col-form-label fw-bold">거래 희망 장소</label>
            <div class="col-4">
             	<input class="form-control" type="text"> 
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
    </form>
    </div>
    <div class="col-2"></div>
    </div>
</div>
<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js">
var mainCategoryList = [
  <c:forEach items="${MainCateogryList}" var="ProductMainCategoryDto" varStatus="loop">
    {
      id: "${ProductMainCategoryDto.id}",
      main_category_name: "${ProductMainCategoryDto.main_category_name}"
    }${!loop.last ? ',' : ''}
  </c:forEach>
];

var subCategoryList = [
  <c:forEach items="${SubCateogryList}" var="ProductSubCategoryDto" varStatus="loop">
    {
      id: "${ProductSubCategoryDto.id}",
      product_main_category_id: "${ProductSubCategoryDto.product_main_category_id}",
      sub_category_name: "${ProductSubCategoryDto.sub_category_name}"
    }${!loop.last ? ',' : ''}
  </c:forEach>
];

// 대분류 선택 시 소분류 업데이트
function updateSubCategories() {
  var mainCategoryId = document.getElementById("product_main_category").value;
  var subCategorySelect = document.getElementById("product_sub_category");
  subCategorySelect.innerHTML = ""; // 기존 옵션 초기화

  if (mainCategoryId !== "0") {
    var subCategories = subCategoryList.filter(function(subCategory) {
      return subCategory.product_main_category_id === mainCategoryId;
    });

    // 소분류 옵션 생성 및 추가
    var defaultOption = document.createElement("option");
    defaultOption.value = "0";
    defaultOption.selected = "selected";
    defaultOption.textContent = "소분류 선택";
    subCategorySelect.appendChild(defaultOption);

    for (var i = 0; i < subCategories.length; i++) {
      var option = document.createElement("option");
      option.value = subCategories[i].id;
      option.textContent = subCategories[i].sub_category_name;
      subCategorySelect.appendChild(option);
    }
  }
}

// 대분류 선택 이벤트 리스너 등록
document.getElementById("product_main_category").addEventListener("change", updateSubCategories);
</script>

</body>
</html>