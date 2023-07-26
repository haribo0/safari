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
.item-box-img, .item-box-img-ad{transition: 0.3s ease;}
.item-box-img:hover{transform: scale(1.01);}
.item-box-img-ad:hover{transform: scale(1.01);}

.carousel-item{height: 240px;}
.carousel-item-1{background: url("${pageContext.request.contextPath}/resources/img/rental/rental-banner-1.jpg") 50% 50% no-repeat; background-size: cover;}
.carousel-item-2{background: url("${pageContext.request.contextPath}/resources/img/rental/rental-banner-2.jpg") 50% 50% no-repeat; background-size: cover;}

.carousel-control-next, .carousel-control-prev{width: 8%;}
.boxCategory{transition: all 0.2s}
.boxCategory:hover {
	box-shadow: 0px 2px 14px -2px rgba(0, 0, 0, 0.125);
}
</style>
</head>
<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->

	<div class="container">
		<div class="row">
 			<div class="col-2 mt-4">
				<ul class="list-group" style="top: 115.23px; z-index: 50;">
				  <li class="list-group-item border border-0 ps-0 pt-2 pb-0"><a href="${pageContext.request.contextPath}/rental/mainPage" class="btn ps-0 text fw-bold py-1" href="#" style="font-size: 18px;">전체보기</a></li>
				  <c:forEach items="${categoryList}" var="map" varStatus="status">
					  <li class="list-group-item border border-0 ps-0 pb-0 pt-3"><a href="${pageContext.request.contextPath}/rental/mainPage/?main_category_id=${map.categoryItem.id}" class="btn text fw-bold ps-0 py-1" style="font-size: 17px;">${map.categoryItem.main_category_name}</a></li>
	  				  	<div class="" id="">
							<ul class="list-group">
								<c:forEach items="${map.subTitleList}" var="subTitle">
										<li class="list-group-item border-0 ps-0 py-2"><a href="${pageContext.request.contextPath}/rental/mainPage/?sub_category_id=${subTitle.id}" class="btn ps-0 py-0 text-body-secondary" style="font-size: 16px;">${subTitle.sub_category_name}</a></li>
								</c:forEach>
							</ul>
						</div>
				  </c:forEach>
				</ul>
			</div>
			
			<div class="col">
<!-- 				<div class="row">
					<div class="col px-0">
						<div id="carouselExample" class="carousel slide">
						  <div class="carousel-inner">
						    <div class="carousel-item active carousel-item carousel-item-1">
						    </div>
						    <div class="carousel-item carousel-item carousel-item-2">
						    </div>
						  </div>
						  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
						    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
						    <span class="visually-hidden">Previous</span>
						  </button>
						  <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
						    <span class="carousel-control-next-icon" aria-hidden="true"></span>
						    <span class="visually-hidden">Next</span>
						  </button>
						</div>
					</div>
				</div> -->
				

				<div class="row pb-2">
					<p class="mb-0 mt-3 ps-0 fs-5 fw-bold">파워광고상품</p>
					<!-- <p class="mb-0 mt-3 ps-0"><i class="bi bi-badge-ad-fill fs-4" style="color: #f68a42; vertical-align: -2px;"></i> <span style="color: #000;" class="fw-bold">파워광고상품</span></p> -->
				</div>

				<!-- 광고 대여 물품 row 작업중 -->
				<div class="row flex justify-content-between pt-1 pb-3 my-2 mt-1">
	 				<c:forEach items="${rentalItemList}" var="map" begin="0" end="5" step="1">
						<div class="col-2 position-relative">
							<div class="position-absolute px-2" style="top: 8px; right: 14px; background:#B0DDFF; color: #fff; border-radius: 24px; z-index: 50; font-size: 12px;">
								AD
							</div>
							<div class="card border border-0">
								<a href="${pageContext.request.contextPath}/rental/productDescPage?id=${map.rentalItemDto.id}" class="text-decoration-none d-inline-block">
								  <img src="/safariImg/${map.rentalItemDto.main_img_link}" class="card-img-top rounded-0 img-fluid item-box-img-ad" alt="..." style="min-height: 150px;">
								</a>
							  <div class="card-body p-0 mt-2">
								  <div class="row mt-1 descBox">
									<div class="col">
										<div class="text-secondary mb-0 row" style="font-size: 13px;">
											<div class="col">${map.rentalBusinessDto.business_name }</div>
										</div>
								    	<div class="text-dark mb-2 row">
								    		<a href="${pageContext.request.contextPath}/rental/productDescPage?id=${map.rentalItemDto.id}" class="text-decoration-none d-inline-block text-dark text-truncate" style="font-size: 16px;"><div class="col text-truncate">${map.rentalItemDto.title}</div></a>
								    	</div>
								    	
									    <div class=" row mb-0">
									    	<div class="col"><a href="${pageContext.request.contextPath}/rental/productDescPage?id=${map.rentalItemDto.id}" class="text-decoration-none d-inline-block text-dark" style="font-weight: 900; font-size: 18px;"><fmt:formatNumber value="${map.rentalItemDto.price}" pattern="#,##0" /> 원 </a><span style="font-size: 13px;">/ 월</span></div>
									    </div>
										<div class=" row mb-0">
											<div class="col">
												<span style="font-size: 13px; color: #5a5a5a;"><i class="bi bi-heart"></i> </span><span class="fw-bold" style="font-size: 13px; color: #7e7e7e;">${map.itemLikeCount}</span> <span class="ms-1" style="font-size: 13px; color: #5a5a5a;"><i class="bi bi-chat"></i></span> <span class="fw-bold" style="font-size: 13px; color: #7e7e7e;">${map.itemReviewCount}</span>
											</div>
										</div>
										<div class="row mt-1">
											<div class="col">
												<span style="background: #e5e5e5; border-radius: 6px; font-size: 12px; padding: 3px 6px;">무료배송</span>
											</div>
										</div>								
									</div>
								</div>
							
<%-- 							  	<div class="d-flex justify-content-between">
							    	<p class="text-dark mb-0"><a href="${pageContext.request.contextPath}/rental/productDescPage?id=${map.rentalItemDto.id}" class="text-decoration-none d-inline-block text-dark fw-bold" style="font-size: 15px;">${map.rentalItemDto.title}</a></p>
							  	</div>
							    <p class="mb-0"><a href="${pageContext.request.contextPath}/rental/productDescPage?id=${map.rentalItemDto.id}" class="w-100 text-decoration-none d-inline-block text-body-secondary" style="overflow:hidden; text-overflow:ellipsis; white-space:nowrap; font-size: 14px;">${map.rentalItemDto.item_description}</a></p>
							    <div class="d-flex justify-content-between">
								    <p class="mb-0"><b class="text-dark"><a href="${pageContext.request.contextPath}/rental/productDescPage?id=${map.rentalItemDto.id}" class="text-decoration-none d-inline-block text-dark" style="font-size: 15px;"><fmt:formatNumber value="${map.rentalItemDto.price}" pattern="#,##0" /> 원 </a></b><span style="font-size: 13px;">/ 월</span></p>
							    </div>
							    <div>
							  		<p class="mb-0">
							  			<!-- <span style="font-size: 12px;">좋아요</span> -->
							  			<i class="bi bi-heart"></i>
							  			<span  onclick="toggleLike(${map.rentalItemDto.id})" class="fw-bold totalLikeCount" style="font-size: 12px;"></span>
							  			<i id="heartBox" onclick="toggleLike(${map.rentalItemDto.id})" class="bi bi-heart heart_box text-danger" data-item-id="${map.rentalItemDto.id}" style="font-size: 18px;"></i>
							  		</p>							    
							    </div> --%>
							    
							  </div>
							 </div>
						</div>
					</c:forEach>
				</div>
				<!-- 광고 대여 물품 row 작업중 -->
				
				<!-- 카테고리 id 를 통한 하드 코딩 참고 -->
				<%-- <a href="${pageContext.request.contextPath}/rental/mainPage/?main_category_id=${map.categoryItem.id}" --%>
				<%-- <a href="${pageContext.request.contextPath}/rental/mainPage/?sub_category_id=${subTitle.id}" --%>
				
				<div class="row mt-1 pb-2">
					<p class="mb-0 mt-3 ps-0 fs-5 fw-bold">금주의 스페셜딜</p>
				</div>
				<div class="row mt-2">
 					<div class="col ps-0" style="cursor: pointer;">
						<img class="img-fluid rounded-2" alt="" src="${pageContext.request.contextPath}/resources/img/rental/b4.png">
					</div>
 					<div class="col pe-0" style="cursor: pointer;">
						<img class="img-fluid rounded-2" alt="" src="${pageContext.request.contextPath}/resources/img/rental/b2.png">
					</div>
				</div>
				
				<div class="row justify-content-between mt-5 pb-2">
					<div class="col px-0">
						<p class="mb-0 mt-3 ps-0 fs-5 fw-bold">카테고리</p>
					</div>
					
					<div class="col px-0 pt-3 text-end">
						<a href="${pageContext.request.contextPath}/rental/mainPage" style="font-size: 14px;">전체보기</a>
					</div>
				</div>
				<div class="row">
					<div class="col text-center boxCategory">
						<a href="${pageContext.request.contextPath}/rental/mainPage/?main_category_id=1" class="btn">
							<div class="row">
								<div>
									<img class="img-fluid" alt="" src="${pageContext.request.contextPath}/resources/img/rental/category/furniture.png">
								</div>
							</div>
							<div class="row mt-2">
								<div>
									<p class="fw-bold">가구</p>
								</div>
							</div>
						</a>
					</div>
					<div class="col text-center boxCategory">
						<a href="${pageContext.request.contextPath}/rental/mainPage/?sub_category_id=1" class="btn">
						<div class="row">
							<div>
								<img class="img-fluid" alt="" src="${pageContext.request.contextPath}/resources/img/rental/category/sofa.png">
							</div>
						</div>
						<div class="row mt-2">
							<div>
								<p class="fw-bold">소파</p>
							</div>
						</div>
						</a>
					</div>
					<div class="col text-center boxCategory">
						<a href="${pageContext.request.contextPath}/rental/mainPage/?sub_category_id=4" class="btn">
						<div class="row">
							<div>
								<img class="img-fluid" alt="" src="${pageContext.request.contextPath}/resources/img/rental/category/closet.png">
							</div>
						</div>
						<div class="row mt-2">
							<div>
								<p class="fw-bold">수납장</p>
							</div>
						</div>
						</a>
					</div>
					<div class="col text-center boxCategory">
						<a href="${pageContext.request.contextPath}/rental/mainPage/?main_category_id=2" class="btn">
						<div class="row">
							<div>
								<img class="img-fluid" alt="" src="${pageContext.request.contextPath}/resources/img/rental/category/lifeIt.png">
							</div>
						</div>
						<div class="row mt-2 boxCategory">
							<div>
								<p class="fw-bold">생활가전</p>
							</div>
						</div>
						</a>
					</div>
					<div class="col text-center boxCategory">
						<a href="${pageContext.request.contextPath}/rental/mainPage/?sub_category_id=12" class="btn">
						<div class="row">
							<div>
								<img class="img-fluid" alt="" src="${pageContext.request.contextPath}/resources/img/rental/category/a1.png">
							</div>
						</div>
						<div class="row mt-2">
							<div>
								<p class="fw-bold">공기청정기</p>
							</div>
						</div>
						</a>
					</div>
					<div class="col text-center boxCategory">
						<a href="${pageContext.request.contextPath}/rental/mainPage/?sub_category_id=13" class="btn">
						<div class="row">
							<div>
								<img class="img-fluid" alt="" src="${pageContext.request.contextPath}/resources/img/rental/category/airConditioner.png">
							</div>
						</div>
						<div class="row mt-2">
							<div>
								<p class="fw-bold">에어컨</p>
							</div>
						</div>
						</a>
					</div>
					<div class="col text-center boxCategory">
						<a href="${pageContext.request.contextPath}/rental/mainPage/?sub_category_id=14" class="btn">
						<div class="row">
							<div>
								<img class="img-fluid" alt="" src="${pageContext.request.contextPath}/resources/img/rental/category/tv1.png">
							</div>
						</div>
						<div class="row mt-2">
							<div>
								<p class="fw-bold">티비</p>
							</div>
						</div>
						</a>
					</div>
					<div class="col text-center boxCategory">
						<a href="${pageContext.request.contextPath}/rental/mainPage/?main_category_id=3" class="btn">
						<div class="row">
							<div>
								<img class="img-fluid" alt="" src="${pageContext.request.contextPath}/resources/img/rental/category/k1.png">
							</div>
						</div>
						<div class="row mt-2">
							<div>
								<p class="fw-bold">주방가전</p>
							</div>
						</div>
						</a>
					</div>
					<div class="col text-center boxCategory">
						<a href="${pageContext.request.contextPath}/rental/mainPage/?sub_category_id=5" class="btn">
						<div class="row">
							<div>
								<img class="img-fluid" alt="" src="${pageContext.request.contextPath}/resources/img/rental/category/water.png">
							</div>
						</div>
						<div class="row mt-2">
							<div>
								<p class="fw-bold">정수기</p>
							</div>
						</div>
						</a>
					</div>
					<div class="col text-center boxCategory">
						<a href="${pageContext.request.contextPath}/rental/mainPage/?sub_category_id=6" class="btn">
						<div class="row">
							<div>
								<img class="img-fluid" alt="" src="${pageContext.request.contextPath}/resources/img/rental/category/r.png">
							</div>
						</div>
						<div class="row mt-2">
							<div>
								<p class="fw-bold">냉장고</p>
							</div>
						</div>
						</a>
					</div>
				</div>
				
				<div class="row justify-content-between mt-3 pb-2">
					<div class="col">
						<p class="mb-0 ps-0 fs-5 fw-bold">대여상품</p>
					</div>
					
					<div class="col d-flex justify-content-end">
						<div class="dropdown">
						  <a class="btn bg-light dropdown-toggle dropdownName" href="#" role="button" data-bs-toggle="dropdown">
						    일반순
						  </a>
						
						  <ul class="dropdown-menu bg-light">
						    <li><a class="dropdown-item btnLikesOrder" href="#">좋아요순</a></li>
						    <li><a class="dropdown-item btnReviewOrder" href="#">리뷰순</a></li>
						    <li><a class="dropdown-item btnRentOrder" href="#">구매순</a></li>
						  </ul>
						</div>
					</div>
				</div>
				
<!-- 				<div class="row py-2 mb-3 mt-5">
					<div class="col-3 px-0 d-flex align-items-center">
						<a href="#" class="btn p-2 mx-3 btnLikesOrder" style="cursor: pointer;">찜</a> |
						<a href="#" class="btn p-2 mx-3 btnReviewOrder" style="cursor: pointer;">리뷰</a> |
						<a href="#" class="btn p-2 ms-3 btnRentOrder" style="cursor: pointer;">구매</a>
					</div>
				</div> -->

				<div class="row flex-wrap pt-2">
	 				<c:forEach items="${rentalItemList}" var="map" varStatus="status">
		 				
						<div class="col mb-5 item-box" style="cursor: pointer;">
							<div class="row imgBox">
								<div class="col">
									<a href="${pageContext.request.contextPath}/rental/productDescPage?id=${map.rentalItemDto.id}" class="text-decoration-none d-inline-block">
									  <img src="/safariImg/${map.rentalItemDto.main_img_link}" class="card-img-top rounded-0 img-fluid item-box-img" alt="..." >
									</a>																
								</div>
							</div>
							
							<div class="row mt-3 descBox">
								<div class="col">
									<p class="text-secondary mb-0" style="font-size: 13px;">${map.rentalBusinessDto.business_name }</p>
							    	<p class="text-dark mb-2"><a href="${pageContext.request.contextPath}/rental/productDescPage?id=${map.rentalItemDto.id}" class="text-decoration-none d-inline-block text-dark" style="font-size: 16px;">${map.rentalItemDto.title}</a></p>
								    <p class="mb-0"><a href="${pageContext.request.contextPath}/rental/productDescPage?id=${map.rentalItemDto.id}" class="text-decoration-none d-inline-block text-dark" style="font-weight: 900; font-size: 18px;"><fmt:formatNumber value="${map.rentalItemDto.price}" pattern="#,##0" /> 원 </a><span style="font-size: 13px;">/ 월</span></p>
									<p class="mb-0"><span style="font-size: 13px; color: #5a5a5a;"><i class="bi bi-heart"></i> </span><span class="fw-bold" style="font-size: 13px; color: #7e7e7e;">${map.itemLikeCount}</span> <span class="ms-1" style="font-size: 13px; color: #5a5a5a;"><i class="bi bi-chat"></i></span> <span class="fw-bold" style="font-size: 13px; color: #7e7e7e;">${map.itemReviewCount}</span></p>
									<p class="mt-1"><span style="background: #e5e5e5; border-radius: 6px; font-size: 12px; padding: 3px 6px;">무료배송</span></p>								
								</div>
							</div>
						</div>
					      <c:if test="${status.index % 4 == 3}">
					        </div><div class="row flex-wrap pt-2">
					      </c:if>
					      <c:if test="${status.last}">
					          <!-- 현재 순서가 마지막인 경우에만 실행될 내용 -->
					          <!-- 만약 나머지가 4일 경우를 제외하고는 col을 더 만들어줘야함 (5-(status%5)) -->
					          <c:forEach begin="0" end="${2-(status.index % 4)}" varStatus="status">
							      <!-- 빈 칼럼 추가  -->
						  	      <div class="col"></div>
							  </c:forEach>

					      </c:if>
					</c:forEach>
					</div>
				</div>
				
				<div class="row mt-5 pt-3">
					<div class="col py-3 d-flex justify-content-center">
						<nav aria-label="Page navigation example">
						  <ul class="pagination">
						    <li class="page-item disabled">
						      <a class="page-link" href="#" aria-label="Previous">
						        <span aria-hidden="true">&laquo;</span>
						      </a>
						    </li>
						    <li class="page-item"><a class="page-link active border bg-secondary" href="#">1</a></li>
						    <li class="page-item"><a class="page-link text-secondary" href="#">2</a></li>
						    <li class="page-item"><a class="page-link text-secondary" href="#">3</a></li>
						    <li class="page-item">
						      <a class="page-link text-secondary" href="#" aria-label="Next">
						        <span aria-hidden="true">&raquo;</span>
						      </a>
						    </li>
						  </ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

<script>

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

	xhr.open("get", "${pageContext.request.contextPath}/user/getMyId", false);
	xhr.send();
}

// 좋아요 토글
	function toggleLike(val){
		console.log('아이템:: ', val)
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
			refreshMyHeart(val);
			refreshTotalLikeCount(val);
		}
	}

	xhr.open("get", "${pageContext.request.contextPath}/rental/toggleRentalItemLike?item_id=" + val);
	xhr.send();

}

	// 좋아요 모든 이용자가 누른 갯수
	function refreshTotalLikeCount(val){
		if(!val) {
			return
		}
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			const totalLikeCountBox = document.querySelectorAll(".totalLikeCountBox");
			
			for(let i =0; i<totalLikeCountBox.length; i++){
				let likeItemId = heartBox[i].dataset.itemId
				if(val == likeItemId){
					totalLikeCountBox.innerText = response.count;					
				}
			}
			
		}
	}
	
	xhr.open("get", "./getTotalLikeCount?id=" + itemId);
	xhr.send();		
}

// 내가(로그인한 사용자)가 좋아요 누름 리프레시
	function refreshMyHeart(val){
		if(!val) {
			return
		}

		if(mySessionId == null) return;
		const xhr = new XMLHttpRequest();

		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				const response = JSON.parse(xhr.responseText);
				
				if(val == itemId) {
					if(response.isLiked) {
						console.log('좋아요')
					}else{
						console.log('안안좋아요')						
					}
				}
				
/* 				const heartBox = document.querySelectorAll(".heart_box");

 				for(let i =0; i<heartBox.length; i++){
					let itemId = heartBox[i].dataset.itemId
					if(val == itemId){
						if(response.isLiked){
							heartBox[i].classList.remove("bi-heart");
							heartBox[i].classList.add("bi-heart-fill");
						}else{
							heartBox[i].classList.remove("bi-heart-fill");
							heartBox[i].classList.add("bi-heart");
						}
					}
				} */
			}
		}

		xhr.open("get", "${pageContext.request.contextPath}/rental/isLiked?item_id="+val);
		xhr.send();
	}
	
 	function setOrderLink() {
 		const dropdownName = document.querySelector('.dropdownName')
 		
 		const orderlyObj = [
 			{orderly: "likes"},
 			{orderly: "reviews"},
 			{orderly: "purchase"}
 		]
	
		const btnLikesOrder = document.querySelector('.btnLikesOrder')
		const btnReviewOrder = document.querySelector('.btnReviewOrder')
		const btnRentOrder = document.querySelector('.btnRentOrder')
		
		let url = new URL(window.location.href)
 		//console.log(url)
 		let isIncludeMainCat = url.search.includes('main_category_id')
 		let isIncludeSubCat = url.search.includes('sub_category_id')
 		let originUrl
 		let querySign
 		
 		if(url.search.includes('likes')) {
			dropdownName.innerText = '좋아요순'
 		} else if(url.search.includes('reviews')) {		
			dropdownName.innerText = '리뷰순'
 		} else if(url.search.includes('purchase')) {	
			dropdownName.innerText = '구매순'
 		}
 		
  		if(isIncludeMainCat || isIncludeSubCat) {
  			let urlSearch = url.search
  			let queryString = urlSearch.split("?")[1];
  			let firstQuery = queryString.split("&")[0];
  			let firstParam = "?" + firstQuery;

 			originUrl = url.origin + url.pathname + firstParam

			querySign ="&"
			console.log(originUrl) 			
 		}else {
	 		originUrl = url.origin + url.pathname 			
			console.log(originUrl)
			querySign ="?"
 		} 
 

		btnLikesOrder.addEventListener('click',(e) => {
			const oderlyParams = new URLSearchParams(orderlyObj[0])
			e.preventDefault();
			window.location.href = originUrl + querySign + oderlyParams
		})
		
		btnReviewOrder.addEventListener('click',(e) => {
			const oderlyParams = new URLSearchParams(orderlyObj[1])
			e.preventDefault();
			window.location.href = originUrl + querySign + oderlyParams
		})
				
		btnRentOrder.addEventListener('click',(e) => {
			const oderlyParams = new URLSearchParams(orderlyObj[2])
			e.preventDefault();
			window.location.href = originUrl + querySign + oderlyParams	
		})
		

	}

window.addEventListener("DOMContentLoaded", function(){
	getSessionId();
	setOrderLink();
	const heartBox = document.querySelectorAll(".heart_box");
	for(let j =0; j<heartBox.length; j++) {
		let id = heartBox[j].dataset.itemId
		refreshMyHeart(id)
	}
});
</script>

</body>
</html>
