<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>promo 세부 작성</title>
<!-- 메타 섹션 -->
<jsp:include page="../../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->
</head>
<style>
/* 버튼 색깔 */
.orangeButton{
	background: #ff6f0f;
	font-weight: bold;
	color: white;
}
.orangeButton:hover {
    background: #ff6f0f;
	font-weight: bold;
	color: white;
  }
</style>

<script>
function selectSubCategory(targetElement) {
    // 대분류 카테고리 선택값 가져오기
    
	const mainCategoryId = targetElement.selectedOptions[0].value;
    
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			const rentalProReview_sub_category = document.getElementById("rentalProReview_sub_category");
			
			rentalProReview_sub_category.innerHTML = "";

			
			const baseOption = document.createElement("option");
			baseOption.value = 0;
			baseOption.innerText = "소분류 카테고리 선택";
			
			rentalProReview_sub_category.appendChild(baseOption);
			
			for(x of response.subCategoryList){
				const option = document.createElement("option");
				option.value = x.id;
				option.innerText = x.sub_category_name;
				rentalProReview_sub_category.appendChild(option);
			}
			
			reloadRentalItemList();
			
		}
	}
	
	xhr.open("get", "./getSubCategoryList?mainCategoryId=" + mainCategoryId);
	xhr.send();		    
    
    
}

function reloadRentalItemList(){
	const mainCategoryId = document.getElementById("rentalProReview_main_category").selectedOptions[0].value;
	const subCategoryId = document.getElementById("rentalProReview_sub_category").selectedOptions[0].value;
	
	console.log("mainCategoryId: " + mainCategoryId);
	console.log("subCategoryId: " + subCategoryId);
	
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			const rental_item_id = document.getElementById("rental_item_id");
			rental_item_id.innerHTML = "";

			const baseOption = document.createElement("option");
			baseOption.value = 0;
			baseOption.innerText = "리뷰할 제품 선택하기";
			
			rental_item_id.appendChild(baseOption);
			
			for(x of response.rentalItemCategoryList){
				
				const option = document.createElement("option");
				option.value = x.id;
				option.innerText = x.title;
				
				rental_item_id.appendChild(option);
			}
			
		}
	}
	
	xhr.open("get", "./getRentalItemList?mainCategoryId=" + mainCategoryId + "&subCategoryId=" + subCategoryId);
	xhr.send();	
}


window.addEventListener("DOMContentLoaded" , () => {
	reloadRentalItemList();
});


</script>


<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->

	<div class="container main_box">
	<div class = "row mt-5">
		<div class = "col"></div>
		<div class = "col-8">
		<form action="./writePromotionReviewProcess" method = "post" enctype = "multipart/form-data">
			
			<div class = "row mt-3">
				<div class = "col fs-6 text-center text-secondary">리워드</div>
			</div>
			<div class = "row mt-2">
				<div class = "col fw-semibold fs-3 text-center">리워드 리뷰 작성 </div>
			</div>
			
			<hr class="my-1 mt-3" style="border-color: gray;">
			
			<div class = "row mt-5">
				<div class = "col-2 fw-semibold my-auto">제목</div>
				<div class = "col">
					<input class = "form-control"  type = "text" name = "promotion_review_title" placeholder = "제목을 작성해주세요.">
				</div>
			</div>
			<div class = "row mt-4">
				<div class = "col-2 fw-semibold">작성자</div>
				<div class = "col">
				  	${sessionUser.nickname }
				</div>
			</div>
			
			<!--  대분류 카테고리 (대여 카테고리를 가져와서 리워드 카테고리에 입력) -->
			<div class = "row mt-4">
				<div class = "col-2 fw-semibold my-auto">제품 카테고리</div>
				<div class = "col">
					<select class="form-select" id="rentalProReview_main_category" name="rentalProReview_main_category" onchange="selectSubCategory(this)">
	            		<option value="0" selected="selected">대분류 카테고리 선택</option>
	            		<c:forEach items="${mainCategoryList}" var="rentalProReviewMain">
	                    	<option value="${rentalProReviewMain.id }">${rentalProReviewMain.main_category_name }</option>
	                    </c:forEach>
               		</select>	
				</div>
				<!--  소분류 카테고리 -->
				<div class = "col">
		  			<select class="form-select" id="rentalProReview_sub_category" onchange="reloadRentalItemList()">
					    <option value="0">소분류 카테고리 선택</option>
					</select>
				</div>
			</div>			
			<!--  리워드 제품 끌어오기  -->
			<div class = "row mt-3">
				<div class = "col-2 fw-semibold my-auto">제품명</div>
				<div class = "col">
					<select name="rental_item_id" id="rental_item_id" class="form-select">
						<c:forEach items="${rentalItemList }" var="item">
							<option value="${item.id }">${item.title }</option>
						</c:forEach>
						
					</select>
				</div>
			</div>
			
			<div class = "row mt-4">
				<div class = "col-2 fw-semibold my-0">내용</div>
				<div class = "col">
					<textarea id = "promotionReviewBox" name = "promotion_review_content" class = "form-control"
							  style = "height: 200px;"  wrap="soft" placeholder = "내용을 작성해주세요."></textarea>
				</div>
			</div>
			<div class = "row mt-4">
				<div class = "col-2 fw-semibold my-auto">이미지 등록</div>
				<div class = "col">
					<input class = "form-control" type = "file" name = "promoFiles" accept="image/*" multiple>
				</div>
			</div>
			<div class = "row mt-5">
				<div class = "col"></div>
				<div class = "col-3">
					<button class = "form-control btn orangeButton me-2">등록하기</button>
				</div>
			</div>
		</form>
	</div>
		<div class = "col"></div>
	</div>













</div> <!--  container div 닫는 곳 -->
	<div class = "row mt-5">
		<div class = "col">
	<!-- 푸터 섹션 -->
	<jsp:include page="../../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->
		</div>
	</div>
<script>
</script>
</body>
</html>