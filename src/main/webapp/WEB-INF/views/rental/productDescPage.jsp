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
	
	function setStarBox() {
		const starBox = document.querySelector('.star-box')
		const ratingNum = ${reviewRating}
		
		for(let i = 0; i < ratingNum; i++) {
			let starIco = document.createElement('i')
			starIco.className ='bi bi-star-fill me-1'
			
			starBox.appendChild(starIco)
		}
	}
	
	function setRewviewStarBox() {
		const reviewStarBox = document.querySelectorAll('.reviewStarBox')
		
		for(let i = 0; i < reviewStarBox.length; i++) {
			let numberOfStar = reviewStarBox[i].getAttribute('data-numberof')
				for(let j =0; j<numberOfStar; j++) {
					let starIco = document.createElement('i')
					starIco.className ='bi bi-star-fill me-1'
					starIco.style.fontSize='14px'
					
					reviewStarBox[i].appendChild(starIco)
				}
			console.log({numberOfStar})
		}
	}

window.addEventListener("DOMContentLoaded", function(){
	getSessionId();
 	refreshTotalLikeCount();
	refreshMyHeart();
	setStarBox();
	setRewviewStarBox();
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
				<small class="mb-2 text-secondary">${data.mainCategoryName} &#47; ${data.subCategoryName}</small>
				<div class="pe-5">
					<div class="d-flex justify-content-between">
						<h3 class="fw-bold">${data.rentalItemDto.title}</h3>
						<p><i class="bi bi-share fs-5" style="cursor: pointer" onclick="clipUrl()"></i></p>
					</div>
					<p class="py-2" style="line-height: 1.7; letter-spacing: -0.2px;">
						${data.rentalItemDto.item_description}
					</p>
					
					<div class="d-flex justify-content-between">
 						<p>
							<span class="me-2 star-box"></span><span class="me-4">${reviewRating}</span> <span>리뷰 ${reviewCount}</span>
						</p>
						<p><span class="fs-6 me-2" id="totalLikeCount"></span><i id="heartBox" onclick="toggleLike()" class="fs-4 bi bi-heart text-danger"></i></p>						
					</div>
					
					<div class="d-flex justify-content-end">
						<p class="mb-4 fs-4 fw-bold"> <fmt:formatNumber value="${data.rentalItemDto.price}" pattern="#,##0" />원 <small class="text-secondary">/ 월</small></p>
					</div>
					
					<div>
						<div>
							<small class="text-black-50">*보증금 <fmt:formatNumber value="${data.rentalItemDto.deposit}" pattern="#,##0" />원</small>
						</div>
						<table class="table table-bordered">
						  <thead>
						    <tr>
						    	<c:forEach items="${data.rentalPeriodDiscDtoList}" var="periodItem">
							      <td class="text-center bg-body-tertiary" scope="col">${periodItem.rental_period}개월</td>
						    	</c:forEach>
						    </tr>
						  </thead>
						  <tbody>
						    <tr>
						      	<c:forEach items="${data.rentalPeriodDiscDtoList}" var="periodItem2">
							      <td class="text-center fw-bold" scope="col"><fmt:formatNumber value="${periodItem2.discounted_price}" pattern="#,##0" />원</td>
						    	</c:forEach>
						    </tr>
						  </tbody>
						</table>
					</div>
					 
					<div class="bg-body-tertiary p-3 rounded-1">
						<p class="mb-0 text-black-50" style="font-size: 14px;"><i class="bi bi-truck"></i> <span class="fw-bold">8/4</span> 이내 도착 예정</p>
					</div>
					
					<div class="d-flex justify-content-end mt-5">
						<%-- <p class="text-body-secondary">남은 수량 ${data.rentalItemDto.quantity}</p> --%>
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
			  </div>
			  
			  <div class="w-100 d-flex justify-content-center tab-content pt-4 mt-5" id="v-pills-tabContent">
			    <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab" tabindex="0">
 					<c:forEach items="${data.rentalItemImgDtoList}" var="img">
						<div>
							<img alt="" src="/safariImg/${img.img_link}">
						</div>
					</c:forEach>
			    </div>
			    
			    <div class="tab-pane fade w-100" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab" tabindex="0">
			    <p>리뷰 ${reviewCount}</p>
			    	<ul class="list-group list-group-flush px-5" id="review_list">
	 		    		<c:forEach items="${reviewData}" var="review">
			    			<li class="list-group-item py-3 mt-4 border border-0">
			    				<div class="row w-100">
				    				<div class="col">
				    					<div class="row">
				    						<div class="col">
				    							<div class="row">
				    								<div class="col-1" style="max-width: 68px;">
								    					<div class="rounded-circle bg-secondary-subtle me-0" style="width: 40px; height: 40px;"></div>				    								
				    								</div>
				    								<div class="col px-0">
											    		<p class="mb-0 mt-1"><small>${review.reviewer.nickname}</small> <small class="text-black-50">| <fmt:formatDate value="${review.reviewList.reg_date }" pattern="yyyy.MM.dd"/></small></p>		    				
				    								</div>
				    							</div>
				    						</div>
				    					</div>
				    					
				    					<div class="row mt-3">
				    						<div class="row">
				    							<div class="col">
				    								<p>${review.rentalItemDto.title }</p>
				    							</div>
				    						</div>
				    						<div class="row">
				    							<div class="col px-1">
						    					<c:forEach items="${review.reviewImgList}" var="imgList">
						    					 	<img alt="" src="/safariImg/${imgList.rental_review_img}" class="ms-2" style="width: 100px;">			    					
						    					</c:forEach>
				    							</div>
				    						</div>
				    					</div>
				    					
				    					<div class="row mt-3">
				    						<div class="col">
							    				<p class="fw-bold mb-0 text-dark-emphasis">${review.reviewList.rental_review_title}</p>
							    				<p class="mb-1 text-body-secondary">${review.reviewList.rental_review_content}</p>
							    				<p class="reviewStarBox mb-0" data-numberof="${review.reviewList.rental_review_rating}"></p>
				    						</div>
				    					</div>
				    					
				    				</div>		    				
			    				</div>
							</li>
			    		</c:forEach> 
			    	</ul>
			    </div>
			  </div>
			</div>
    	</div>
	</div>
	
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->
<script>

function clipUrl() {
	let url = '';
	let textarea = document.createElement("textarea");
	document.body.appendChild(textarea);
	url = window.document.location.href;
	textarea.value = url;
	textarea.select();
	document.execCommand("copy");
	document.body.removeChild(textarea);
	alert("주소가 복사되었습니다!")
}
</script>

</body>	
</html>
