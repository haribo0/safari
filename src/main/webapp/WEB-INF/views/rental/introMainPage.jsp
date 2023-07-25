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
	
	<div class="container pb-4 mt-5">
		<div class="row mt-5">
			<p class="fw-bold fs-4 mb-0">카테고리</p>
		</div>
		<div class="row px-0 mt-4">
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
						<img class="img-fluid" alt="" src="${pageContext.request.contextPath}/resources/img/rental/category/d3.png">
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
						<img class="img-fluid" alt="" src="${pageContext.request.contextPath}/resources/img/rental/category/fan2.png">
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
<%-- 		<div class="row">
			<div class="col">
				<p class="fw-bold fs-4">카테고리</p>
				 <img src="${pageContext.request.contextPath}/resources/img/rental/banner_category.png" class="d-block w-100" alt="...">
			</div>
		</div> --%>
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
			<c:forEach items="${rentalItemList}" var="map" begin="0" end="4" step="1" varStatus="status">
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
			</c:forEach>
		</div>
	</div>
	
	<div class="container mt-5 pb-4">
		<div class="row">
			<p class="fw-bold fs-4 mb-0">이벤트</p>
			<div class="col mt-4">
				<div id="carouselExample2" class="carousel slide">
				  <div class="carousel-inner">
				    <div class="carousel-item carousel-md carousel-item-md-1 active carousel-item carousel-item-1">
				      <img src="${ pageContext.request.contextPath}/resources/img/rental/rental-banner-1.jpg" class="d-block w-100" alt="...">
				    </div>
				    <div class="carousel-item carousel-md carousel-item-md-2 carousel-item carousel-item-2">
				      <img src="${ pageContext.request.contextPath}/resources/img/rental/rental-banner-2.jpg" class="d-block w-100" alt="...">
				    </div>
				  </div>
				  <button class="carousel-control-prev shadow-sm " type="button" data-bs-target="#carouselExample2" data-bs-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Previous</span>
				  </button>
				  <button class="carousel-control-next shadow-sm " type="button" data-bs-target="#carouselExample2" data-bs-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Next</span>
				  </button>
				</div>
			</div>
		</div>
	</div>
		
	<div class="container mt-5 pb-4">
		<div class="row">
			<p class="fw-bold fs-4 mb-0">금주의 스페셜딜</p>
		</div>
		<div class="row mt-4 px-2">
				<div class="col" style="cursor: pointer;">
				<img class="img-fluid rounded-2" alt="" src="${pageContext.request.contextPath}/resources/img/rental/b1.png">
			</div>
				<div class="col" style="cursor: pointer;">
				<img class="img-fluid rounded-2" alt="" src="${pageContext.request.contextPath}/resources/img/rental/b2.png">
			</div>
		</div>
	</div>
	
	<div class="container mt-5 pb-4">
		<div class="row">
			<p class="fw-bold fs-4 mb-0">파워광고상품</p>
		</div>
		<!-- 광고 대여 물품 row 작업중 -->
		<div class="row flex justify-content-between px-2 pt-1 pb-3 my-2 mt-3">
				<c:forEach items="${rentalItemList}" var="map" begin="0" end="5" step="1">
				<div class="col-2 position-relative">
					<div class="position-absolute px-2" style="top: 8px; right: 20px; background:#f68a42; color: #fff; border-radius: 24px; z-index: 50; font-size: 12px;">
						AD
					</div>
					<div class="card border border-0">
						<a href="${pageContext.request.contextPath}/rental/productDescPage?id=${map.rentalItemDto.id}" class="text-decoration-none d-inline-block">
						  <img src="/safariImg/${map.rentalItemDto.main_img_link}" class="card-img-top rounded-0 img-fluid item-box-img-ad" alt="..." style="min-height: 150px;">
						</a>
					  <div class="card-body p-0 mt-2">
						  <div class="row mt-1 descBox">
							<div class="col">
								<p class="text-secondary mb-0" style="font-size: 13px;">${map.rentalBusinessDto.business_name }</p>
						    	<p class="text-dark mb-2"><a href="${pageContext.request.contextPath}/rental/productDescPage?id=${map.rentalItemDto.id}" class="text-decoration-none d-inline-block text-dark" style="font-size: 16px;">${map.rentalItemDto.title}</a></p>
							    <p class="mb-0"><a href="${pageContext.request.contextPath}/rental/productDescPage?id=${map.rentalItemDto.id}" class="text-decoration-none d-inline-block text-dark" style="font-weight: 900; font-size: 18px;"><fmt:formatNumber value="${map.rentalItemDto.price}" pattern="#,##0" /> 원 </a><span style="font-size: 13px;">/ 월</span></p>
								<p class="mb-0"><span style="font-size: 13px; color: #5a5a5a;"><i class="bi bi-heart"></i> </span><span class="fw-bold" style="font-size: 13px; color: #7e7e7e;">${map.itemLikeCount}</span> <span class="ms-1" style="font-size: 13px; color: #5a5a5a;"><i class="bi bi-chat"></i></span> <span class="fw-bold" style="font-size: 13px; color: #7e7e7e;">${map.itemReviewCount}</span></p>
								<p class="mt-1"><span style="background: #e5e5e5; border-radius: 6px; font-size: 12px; padding: 3px 6px;">무료배송</span></p>								
							</div>
						</div>
					  </div>
					 </div>
				</div>
			</c:forEach>
		</div>
		<!-- 광고 대여 물품 row 작업중 -->
	</div>
	


	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->


</body>
</html>
