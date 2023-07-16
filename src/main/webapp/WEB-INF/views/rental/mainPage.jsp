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
.item-box-img:hover{transform: scale(1.05);}
.item-box-img-ad:hover{transform: scale(1.02);}

.carousel-item{height: 240px;}
.carousel-item-1{background: url("${pageContext.request.contextPath}/resources/img/rental/rental-banner-2.jpg") 50% 50% no-repeat;}
.carousel-item-2{background: url("${pageContext.request.contextPath}/resources/img/rental/rental-banner-1.jpg") 50% 50% no-repeat;}

</style>
</head>
<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->
	
	<div class="container-fluid d-flex align-items-center justify-content-between p-3 px-5 mb-3 bg-light">
		<div class="container">
			<div class="row">
				<p class="mb-0 px-0 text-body-secondary"><a href="${pageContext.request.contextPath}/rental/mainPage" class="btn" style="font-size: 15px;">대여</a> &gt; <span class="mx-2" style="font-size: 15px;">전체보기</span></p>
			</div>
		</div>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-2 mt-4">
				<ul class="list-group sticky-top" style="top: 115.23px; z-index: 50;">
				  <li class="list-group-item border border-0 ps-0 pt-2 pb-0"><a href="${pageContext.request.contextPath}/rental/mainPage" class="btn ps-0 text fw-bold py-1" href="#" style="font-size: 17px;">전체보기</a></li>
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
			
			<div class="col mt-4 px-4">
				<div class="row">
					<div class="col">
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
				</div>
				
				<div class="row border-bottom pb-2">
					<p class="mb-0 mt-3 text-body-tertiary text-end">파워광고상품</p>	
				</div>
				
				<!-- 광고 대여 물품 row 작업중 -->
				<div class="row flex-wrap justify-content-between py-2 my-2">
	 				<c:forEach items="${rentalItemList}" var="map">
						<div class="col-2" style="cursor: pointer;">
							<div class="card border border-0">
								<a href="${pageContext.request.contextPath}/rental/productDescPage?id=${map.rentalItemDto.id}" class="text-decoration-none d-inline-block">
								  <img src="/safariImg/${map.rentalItemDto.main_img_link}" class="card-img-top object-fit-cover item-box-img-ad" alt="..." style="min-height: 200px;" >
								</a>
							  <div class="card-body p-0 mt-2">
							  	<div class="d-flex justify-content-between">
							    	<p class="text-dark mb-0"><a href="${pageContext.request.contextPath}/rental/productDescPage?id=${map.rentalItemDto.id}" class="text-decoration-none d-inline-block text-dark fw-bold" style="font-size: 16px;">${map.rentalItemDto.title}</a></p>
							  	</div>
							    <p class="mb-0"><a href="${pageContext.request.contextPath}/rental/productDescPage?id=${map.rentalItemDto.id}" class="w-100 text-decoration-none d-inline-block text-body-secondary" style="overflow:hidden; text-overflow:ellipsis; white-space:nowrap; font-size: 14px;">${map.rentalItemDto.item_description}</a></p>
							    <div class="d-flex justify-content-between">
								    <p><b class="text-dark"><a href="${pageContext.request.contextPath}/rental/productDescPage?id=${map.rentalItemDto.id}" class="text-decoration-none d-inline-block text-dark" style="font-size: 14px;"><fmt:formatNumber value="${map.rentalItemDto.price}" pattern="#,##0" /> 원 </a></b><span style="font-size: 13px;">/ 월</span></p>
							  		<p class="mb-0"><span class="fw-bold" id="totalLikeCount"></span><i id="heartBox" onclick="toggleLike(${map.rentalItemDto.id})" class="bi bi-heart heart_box text-danger" data-item-id="${map.rentalItemDto.id}" style="font-size: 18px;"></i></p>						    
							    </div>
							  </div>
							 </div>
						</div>
					</c:forEach>
				</div>
				<!-- 광고 대여 물품 row 작업중 -->
				
				<div class="row justify-content-end py-2 border-bottom">
					<div class="col-3 d-flex justify-content-end align-items-center">
						<span class="p-2 mx-3 fw-bold" style="cursor: pointer;">찜</span> |
						<span class="p-2 mx-3" style="cursor: pointer;">리뷰</span> |
						<span class="p-2 ms-3" style="cursor: pointer;">구매</span>
					</div>
				</div>
				
				<div class="row flex-wrap pt-2 mt-3">
	 				<c:forEach items="${rentalItemList}" var="map">
						<div class="col-3 item-box mt-4" style="cursor: pointer;">
							<div class="card border border-0">
								<a href="${pageContext.request.contextPath}/rental/productDescPage?id=${map.rentalItemDto.id}" class="text-decoration-none d-inline-block">
								  <img src="/safariImg/${map.rentalItemDto.main_img_link}" class="card-img-top object-fit-cover item-box-img" alt="..." style="min-height: 260px;" >
								</a>
							  <div class="card-body p-0 pt-2">
							  	<div class="d-flex justify-content-between">
							    	<p class="text-dark mb-0"><a href="${pageContext.request.contextPath}/rental/productDescPage?id=${map.rentalItemDto.id}" class="text-decoration-none d-inline-block text-dark fw-bold" style="font-size: 20px;">${map.rentalItemDto.title}</a></p>
							  	</div>
							    <p class="mb-1"><a href="${pageContext.request.contextPath}/rental/productDescPage?id=${map.rentalItemDto.id}" class="w-100 text-decoration-none d-inline-block text-body-secondary" style="overflow:hidden; text-overflow:ellipsis; white-space:nowrap; font-size: 15px;">${map.rentalItemDto.item_description}</a></p>
							    <div class="d-flex  justify-content-between">
								    <p><b class="text-dark"><a href="${pageContext.request.contextPath}/rental/productDescPage?id=${map.rentalItemDto.id}" class="text-decoration-none d-inline-block text-dark"><fmt:formatNumber value="${map.rentalItemDto.price}" pattern="#,##0" /> 원 </a></b><span style="font-size: 13px;">/ 월</span></p>
							  		<p class="mb-0"><span class="fw-bold" id="totalLikeCount"></span><i id="heartBox" onclick="toggleLike(${map.rentalItemDto.id})" class="bi bi-heart heart_box text-danger" data-item-id="${map.rentalItemDto.id}" style="font-size: 18px;"></i></p>
							    </div>
							  </div>
							 </div>
						</div>
					</c:forEach>
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
//			refreshTotalLikeCount();
		}
	}
	
	xhr.open("get", "${pageContext.request.contextPath}/rental/toggleRentalItemLike?item_id=" + val);
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
				const heartBox = document.querySelectorAll(".heart_box");
				
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
				} 
			}
		}
		
		xhr.open("get", "${pageContext.request.contextPath}/rental/isLiked?item_id="+val);
		xhr.send();
	}

window.addEventListener("DOMContentLoaded", function(){
	getSessionId();

	const heartBox = document.querySelectorAll(".heart_box");
	for(let j =0; j<heartBox.length; j++) {
		let id = heartBox[j].dataset.itemId
		refreshMyHeart(id)
	}
});
</script>

</body>	
</html>