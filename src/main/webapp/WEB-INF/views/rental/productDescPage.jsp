<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사파리 | 렌탈 물품 상세</title>
<!-- 메타 섹션 -->
<jsp:include page="../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->
<script>
	// 현재 페이지의 상품 id 가져오기
	const itemId = new URLSearchParams(location.search).get("id")
	// 로그인된 세션 초기화
	let mySessionId = null;
	// 세션가져오기
	function getSessionId(){
		const xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				const response = JSON.parse(xhr.responseText);
				if(response.result == "success"){
					mySessionId = response.id; 
				}
			}
		}
		
		xhr.open("get", "../user/getMyId", false);
		xhr.send();		
	}
	
	// 좋아요 토글
		function toggleLike(){
		if(mySessionId == null){
			if(confirm("로그인을 하셔야 이용하실 수 있습니다. 로그인 하시겠습니까?")){
				location.href = "../user/loginPage";
			}
			return;
		}
		
		const xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				const response = JSON.parse(xhr.responseText);
				refreshTotalLikeCount();
				refreshMyHeart();
			}
		}
		
		xhr.open("get", "./toggleRentalItemLike?item_id=" + itemId);
		xhr.send();
		
	}
	
	// 좋아요 모든 이용자가 누른 갯수
		function refreshTotalLikeCount(){
		const xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				const response = JSON.parse(xhr.responseText);
				const totalLikeCountBox = document.getElementById("totalLikeCount");
				totalLikeCountBox.innerText = response.count;
			}
		}
		
		xhr.open("get", "./getTotalLikeCount?id=" + itemId);
		xhr.send();		
	}
	
	// 내가(로그인한 사용자)가 좋아요 누름 리프레시
		function refreshMyHeart(){

			console.log("refreshMyHeart 작동? ")
			
			if(mySessionId == null) return;
			const xhr = new XMLHttpRequest();
			
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4 && xhr.status == 200){
					const response = JSON.parse(xhr.responseText);
					const heartBox = document.getElementById("heartBox");
					
					if(response.isLiked){
						heartBox.classList.remove("bi-heart");
						heartBox.classList.add("bi-heart-fill");
					}else{
						heartBox.classList.remove("bi-heart-fill");
						heartBox.classList.add("bi-heart");
					}
				}
			}
			xhr.open("get", "./isLiked?item_id="+itemId);
			xhr.send();
		}

window.addEventListener("DOMContentLoaded", function(){
	getSessionId();
 	refreshTotalLikeCount();
	refreshMyHeart();
});
</script>
</head>
<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->
	
	<div class="container my-5 py-4">
		<div class="row">
			<div class="col d-flex justify-content-center ">
				<img class="object-fit-cover img-fluid border rounded h-75" alt="" src="/safariImg/${data.rentalItemDto.main_img_link}">
			</div>
			<div class="col">
				<p class="fw-bold fs-5 mb-3">카테고리이름</p>
				<div class="pe-5">
					<h3 class="fw-bold">${data.rentalItemDto.title}</h3>
					<p class="py-2" style="line-height: 1.7; letter-spacing: -0.2px;">
						${data.rentalItemDto.item_description}
					</p>
					
					<div class="d-flex justify-content-between">
 						<p>
							<span class="me-2"><i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i></span> <span class="me-4">${reviewRating}</span> <span>리뷰 수: ${reviewCount}</span>
						</p>
						<p><span class="fw-bold" id="totalLikeCount"></span><i id="heartBox" onclick="toggleLike()" class="fs-1 text-danger bi bi-heart"></i></p>						
					</div>
					
					<div class="d-flex justify-content-end">
						<p class="mb-4 fs-4 fw-bold">${data.rentalItemDto.price} 원 <small class="text-secondary">/ 월</small></p>
					</div>
					
					<div class="d-flex justify-content-between mt-4">
						<p class="text-body-secondary">남은 수량 ${data.rentalItemDto.quantity}</p>
						<a href="./orderConfirmPage?id=${data.rentalItemDto.id}" class="btn btn-dark" style="width: 240px;">주문하기</a>	
					</div>
				</div>
				
					
			</div>
		</div>
		
		<div class="row d-flex">
		   <div>
			  <div class="nav d-flex justify-content-center nav-pills mb-5 pb-4 border-bottom" id="v-pills-tab" role="tablist" aria-orientation="vertical">
			    <button class="btn rounded-1 active" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button" role="tab" aria-controls="v-pills-home" aria-selected="true">상품상세</button>
			    <button class="btn rounded-1" id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#v-pills-profile" type="button" role="tab" aria-controls="v-pills-profile" aria-selected="false">의견/리뷰</button>
			    <button class="btn rounded-1" id="v-pills-messages-tab" data-bs-toggle="pill" data-bs-target="#v-pills-messages" type="button" role="tab" aria-controls="v-pills-messages" aria-selected="false">연관상품</button>
			  </div>
			  
			  <div class="w-100 d-flex justify-content-center tab-content pt-4 mt-5" id="v-pills-tabContent">
			    <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab" tabindex="0">
 					<c:forEach items="${data.rentalItemImgDtoList}" var="img">
						<div>
							<img alt="" src="/safariImg/${img.img_link}" style="width: 400px;">
						</div>
					</c:forEach>
			    </div>
			    
			    <div class="tab-pane fade w-100" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab" tabindex="0">
			    <p>리뷰 수: ${reviewCount}</p>
			    	<ul class="list-group list-group-flush px-5" id="review_list">
	 		    		<c:forEach items="${reviewData}" var="review">
			    			<li class="list-group-item py-3 d-flex justify-content-between border border-0">
			    				<div>
				    				<p>${review.reviewList.rental_review_title}</p>
				    				<p>${review.reviewList.rental_review_content}</p>
				    				<p>${review.reviewList.rental_review_rating}</p>
			    				</div>
			    				<div>
			    					<c:forEach items="${review.reviewImgList}" var="imgList">
			    					 	<img alt="" src="/safariImg/${imgList.rental_review_img}" width="80px;">			    					
			    					</c:forEach>
			    				</div>
							</li>
			    		</c:forEach> 
			    	</ul>
			    </div>
			    <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab" tabindex="0"></div>
			  </div>
			</div>
    	</div>
	</div>
	
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>	
</html>
