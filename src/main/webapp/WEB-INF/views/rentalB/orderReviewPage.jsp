<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사파리 | 대여메인</title>
<!-- 메타 섹션 -->
<jsp:include page="../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->
<style>
.small-icon {
  font-size: 0.8rem; /* Adjust the size as per your preference */
}
</style>
</head>
<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../common/headerB.jsp"></jsp:include>
	<!-- 헤더 섹션 -->

	<div class="container-fluid main_box">
		<div class="row ms-5">
		
			<div class="col-2 ">
				<div class="list-group list-group-flush">
					
					<!-- 왼쪽 카테고리 리스트 -->
					<jsp:include page="../common/navLeft.jsp"></jsp:include>
					<!-- 왼쪽 카테고리 리스트 -->
					
				</div>
				
				<div class="row mt-5 mb-5">
					<div class="col"> </div>
				</div>
			
			</div>
			
			
			<div class="col container  me-5">
			
    			<h4 class="row mt-3 mb-0 fw-regular">리뷰 관리</h4>

				<div class="row  mb-2">
					<!-- 상품 리스트 -->
					<div class="col-3">
						
						
						<!-- <div class="row" style="height: 31px">
							<div class="col">
								
							</div>
							
						</div> -->
						
						<div class="row mt-4">
								
							<hr class="border border-black opacity-25">
								
						</div>
						
						<div class="row">
								
							<div class="col">
								
								상품 리스트
								
							</div>
								
						</div>
						
						<div class="row mt-3">
								
							<hr class="border border-black opacity-25">
								
						</div>
						
						
						
						<div class="row mt-1">
							<div class="col" id="productList">
								<%-- <c:forEach var="map" items="${list}">
									<div class="row mt-2 mb-2">
										${map.product.title}
									</div>
									<hr class="border">
								
								</c:forEach> --%>
							</div>
						</div>
						
					</div>
					<!-- 리뷰 답변 -->
					<div class="col ms-4">
						
						<div class="row mt-4">
								
							<hr class="border border-black opacity-25">
								
						</div>
						
						<div class="row ">
							<div class="col">
								
								후기 리스트
								
							</div>
						</div>
						
						<div class="row mt-3">
								
							<hr class="border border-black opacity-25">
								
						</div>
						
						<div class="row">
							<div class="col">
								<div class="btn btn-sm btn-outline-dark rounded-5 me-2">전체보기</div>
								<div class="btn btn-sm btn-outline-dark rounded-5 me-2">답변하지 않은 후기</div>
								<div class="btn btn-sm btn-outline-dark rounded-5 me-2">답변한 후기</div>
							</div>
							
						</div>
						
						<hr class="border">
						
						<div class="row mt-1 pt-3 h-75 overflow-y-scroll">
							<div class="col d-grid" id="productList">
								
								
								<div class="card mb-3">
								  <div class="card-body">
								    <div class="row">
								    	<div class="col fs-5 fw-normal">리뷰 제목 </div>
								    </div>
								    <div class="row">
								    	<div class="col fs-6 fw-light text-secondary">UserId2</div>
								    	<div class="col fs-6 fw-light text-secondary text-end">2022/03/12</div>
								    </div>
								    <hr class="border">
								    <div class="row mb-1">
								    	<div class="col text-secondary fw-light">상품 이름</div>
								    </div>
								    <div class="row">
								    	<div class="col"> 
								    		<i class="bi bi-star-fill small-icon"></i>
										    <i class="bi bi-star-fill small-icon"></i>
										    <i class="bi bi-star-fill small-icon"></i>
										    <i class="bi bi-star-fill small-icon"></i>
										    <i class="bi bi-star-fill small-icon"></i>
								    	</div>
								    </div>
								    <div class="row mt-3 mb-5 fw-light">
								    	<div class="col">
								    		Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
								  
								    	</div>
								    </div>
								    <hr class="border">
								    <div class="row mt-4 ">
								    	<div class="col fw-medium">
								    		답글
								    	</div>
								    </div>
								    <div class="row mt-3 fw-light">
								    	<div class="col d-grid">
								    		<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="rental_reply_review"
								    			placeholder="답글을 입력해주세요"></textarea>
								    	</div>
								    </div>
								    <div class="row mt-3 fw-light">
								    	<div class="col">
								    		
								    	</div>
								    	<div class="col-2 d-grid">
								    		<div class="btn btn-sm btn-dark">등록</div>
								    	</div>
								    </div>
								    
								    </div>
								</div>
								
								<div class="card mb-3">
								  <div class="card-body">
								    <div class="row">
								    	<div class="col fs-5 fw-normal">리뷰 제목 </div>
								    </div>
								    <div class="row">
								    	<div class="col fs-6 fw-light text-secondary">UserId2</div>
								    	<div class="col fs-6 fw-light text-secondary text-end">2022/03/12</div>
								    </div>
								    <hr class="border">
								    <div class="row">
								    	<div class="col"> 
								    		<i class="bi bi-star-fill small-icon"></i>
										    <i class="bi bi-star-fill small-icon"></i>
										    <i class="bi bi-star-fill small-icon"></i>
										    <i class="bi bi-star-fill small-icon"></i>
										    <i class="bi bi-star-fill small-icon"></i>
								    	</div>
								    </div>
								    <div class="row mt-3 mb-5 fw-light">
								    	<div class="col">
								    		Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
								  
								    	</div>
								    </div>
								    <hr class="border">
								    <div class="row mt-4 ">
								    	<div class="col fw-medium">
								    		답글
								    	</div>
								    </div>
								    <div class="row mt-3 fw-light">
								    	<div class="col d-grid">
								    		<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="rental_reply_review"
								    			placeholder="답글을 입력해주세요"></textarea>
								    	</div>
								    </div>
								    <div class="row mt-3 fw-light">
								    	<div class="col">
								    		
								    	</div>
								    	<div class="col-2 d-grid">
								    		<div class="btn btn-sm btn-dark">등록</div>
								    	</div>
								    </div>
								    
								    </div>
								</div>
									
								<hr class="border">
							
								<%-- <c:forEach var="map" items="${list.map.product}">
								
									<div class="card" style="width: 18rem;">
									  <div class="card-body">
									    <h5 class="card-title">Card title</h5>
									    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
									    <a href="#" class="btn btn-primary">Go somewhere</a>
									  </div>
									</div>
									
									<hr class="border">
								
								</c:forEach> --%>
							</div>
						</div>
						
						
					</div>
					
				    
				</div>
				
				
				
				
				
				
				
				
			
			</div>
			
			
		
		
		</div>
	</div>
	
	
	
	
	
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>



<script>


const productListBox = document.getElementById("productList");


function getProductList() {
	
	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			response.list.forEach(function(data){
				
				console.log(data.title);
				
				const row = document.createElement("div");
				row.className = "row mt-2";
				const col = document.createElement("div");
				col.className = "col mb-2";
				col.innerText = data.title;
				row.appendChild(col);
				productListBox.appendChild(row);
				
				const hr = document.createElement("hr");
				hr.className = "border";
				productListBox.appendChild(hr);
				
			});
		}
	}

	// get 방식 
	xhr.open("get", "getProductList");
	xhr.send();
	
}



function getReviewsByProductId(itemId, status) {
	
	
	
	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			
			
		}
	}

	// get 방식 
	xhr.open("get", "url");
	xhr.send();
	
}










window.addEventListener("DOMContentLoaded",function(){
	getProductList();
	

	// setInterval(reloadCommentList, 3000);	// 3초마다 실행
});


</script>


</body>	
</html>
