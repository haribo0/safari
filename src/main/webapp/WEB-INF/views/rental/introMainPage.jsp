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
.item-box-img:hover{transform: scale(1.02);}

.d-switch:nth-of-type(2) div{
	flex-direction: row-reverse;
}
</style>
</head>
<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->


	<div class="container-fluid">
		<div class="row">
			<div class="col">
				<div id="carouselExample" class="carousel slide">
				  <div class="carousel-inner">
				    <div class="carousel-item active">
				      <img src="${pageContext.request.contextPath}/resources/img/rental/rental_banner_1.jpg" class="d-block w-100" alt="...">
				    </div>
				    <div class="carousel-item">
				      <img src="${pageContext.request.contextPath}/resources/img/rental/rental_banner_2.jpg" class="d-block w-100" alt="...">
				    </div>
				    <div class="carousel-item">
				      <img src="${pageContext.request.contextPath}/resources/img/rental/rental_banner_3.jpg" class="d-block w-100" alt="...">
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
	</div>
	
	<div class="container mt-5">
		<div class="row">
			<div class="col">
				<p class="fw-bold fs-4">카테고리</p>
				 <img src="${pageContext.request.contextPath}/resources/img/rental/banner_category.png" class="d-block w-100" alt="...">
			</div>
		</div>
	</div>
	
	<div class="container mt-5">
		<div class="row justify-content-between">
			<div class="col">
				<p class="fw-bold fs-4 mb-0">대여 상품</p>
			</div>
			<div class="col d-flex justify-content-end align-items-end">
				<a href="${pageContext.request.contextPath}/rental/mainPage" class="btn fw-bold fs-6 mb-0">더보기</a>
			</div>
		</div>
		<div class="row flex-wrap justify-content-between mt-4">
				<c:forEach items="${rentalItemList}" var="map" begin="0" end="3" step="1" varStatus="status">
				<div class="col-3 item-box" style="cursor: pointer;">
					<div class="card border border-0">
						<a href="${pageContext.request.contextPath}/rental/productDescPage?id=${map.rentalItemDto.id}" class="text-decoration-none d-inline-block">
						  <img src="/safariImg/${map.rentalItemDto.main_img_link}" class="card-img-top item-box-img img-fluid" alt="...">
						</a>
					  <div class="card-body p-0 pt-2">
					  	<div class="d-flex justify-content-between">
					    	<p class="text-dark mb-0"><a href="${pageContext.request.contextPath}/rental/productDescPage?id=${map.rentalItemDto.id}" class="text-decoration-none d-inline-block text-dark fw-bold" style="font-size: 18px;">${map.rentalItemDto.title}</a></p>
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
	
	<div class="container mt-5">
		<div class="row">
			<p class="fw-bold fs-4 mb-0">이벤트</p>
			<div class="col mt-4">
				<div id="carouselExample2" class="carousel slide">
				  <div class="carousel-inner">
				    <div class="carousel-item carousel-md carousel-item-md-1 active carousel-item carousel-item-1">
				      <img src="${ pageContext.request.contextPath}/resources/img/rental/rental-banner-2.jpg" class="d-block w-100" alt="...">
				    </div>
				    <div class="carousel-item carousel-md carousel-item-md-2 carousel-item carousel-item-2">
				      <img src="${ pageContext.request.contextPath}/resources/img/rental/rental-banner-1.jpg" class="d-block w-100" alt="...">
				    </div>
				  </div>
				  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample2" data-bs-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Previous</span>
				  </button>
				  <button class="carousel-control-next" type="button" data-bs-target="#carouselExample2" data-bs-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Next</span>
				  </button>
				</div>
			</div>
		</div>
	</div>
		
	<div class="container mt-5">
		<div class="row">
			<p class="fw-bold fs-4 mb-0">후기</p>
			<div class="col">
				<div class="row">
					<div class="col px-0">
				    	<ul class="list-group list-group-flush" id="review_list">
		 		    		<c:forEach items="${reviewData}" var="review">
				    			<li class="list-group-item py-3 my-3 border border-0 d-switch">
				    				<div class="row w-100">
				    					<div class="col-3">
					    					<c:forEach items="${review.reviewImgList}" var="imgList">
					    					 	<img alt="" src="/safariImg/${imgList.rental_review_img}" class="ms-2 img-fluid">			    					
					    					</c:forEach>
					    				</div>	
					    				<div class="col">
						    				<p class="fw-bold mb-2">${review.reviewList.rental_review_title}</p>
						    				<p>${review.reviewList.rental_review_content}</p>
						    				<p class="reviewStarBox mb-0" data-numberof="${review.reviewList.rental_review_rating}"></p>
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


</body>
</html>
