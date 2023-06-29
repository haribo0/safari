<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사파리 | 중고메인</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<jsp:include page="../common/meta.jsp"></jsp:include>
<style>
    .smaller-text {
        font-size: 13px;
    }
    .custom-span {
        display: inline-block;
        height: 0.5cm;
    }
    .btn-sm-custom {
     	font-size : 12px;
        line-height: 0.4cm;
    }
</style>

</head>
<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->

	<div class="container main_box">
		<div class="row"><h1 class="text-center fs-3"><b>중고</b> 메인 페이지</h1></div>
		<div class="row mt-4">
			<div class="col-2">카테고리</div>
			<div class="col mb-1"><h4>전체 상품</h4></div>
			<div class="col-1"><a href="./productRegister" type="button" class="btn btn-dark btn-sm">상품 등록</a></div>
			<div class="col-1"></div>
		</div>
		<div class="row mt-2">
			<div class="col-2"></div>
			<div class="col">
				<div class="row">
					<c:forEach items="${list }" var="map">
					<div class="col-3">
						<div class="row mb-1">
						<a href="./productDetail?productId=${map.productDto.id}" class="text-decoration-none text-black">
						<img alt="img" src="/safarifile/${map.productImgDto.product_img_link }" height="210" width="200">
						</a>
						</div>
						<div class="row">
							<div class="col">
							<a href="./productDetail?productId=${map.productDto.id}" class="ms-1 text-decoration-none text-black">
								${map.productDto.title }
							</a>
							</div>
							<div class="col-5 mt-0">
								<c:if test="${map.reservationCount > 0 }">
    								<div><button type="button" class="btn btn-outline-success btn-sm p-1 m-0 btn-sm-custom" disabled>예약중</button></div>
    							</c:if>
    							<c:if test="${map.completeCount > 0 }">
    								<div><button type="button" class="btn btn-outline-success btn-sm m-0 p-1 btn-sm-custom" disabled>거래완료</button></div>
    							</c:if>
    							<c:if test="${map.completeCount == 0 && map.reservationCount == 0}">
    								<span class="custom-span"></span>
    							</c:if>
							</div>
						</div>
						<div class="row ms-1 fw-semibold">
						<c:choose>
							<c:when test="${map.productDto.price == 0}">
								<button type="button" class="btn btn-warning btn-sm col-2 p-0 text-black" disabled>나눔</button>
							</c:when>
							<c:otherwise>
								<fmt:formatNumber value="${map.productDto.price}" pattern="#,##0" />
							</c:otherwise>
						</c:choose>
						</div>
						<div class="row ms-1">
   							<div class="col ms-0 p-0 w-0 smaller-text">${map.productDto.location }</div>
						</div>
						<div class="row mb-5">
							<div class="col ms-1 text-secondary"><i class="bi bi-heart-fill"></i> ${map.likeCount } <i class="bi bi-chat-dots-fill"></i> ${map.requestCount }
							</div>
							
						</div>
						
					</div>
					<c:if test="${loop.index % 5 == 4}">
            			</div>
           			 <div class="row">
       				 </c:if>
					</c:forEach>
				</div>
			</div>
			<div class="col-1"></div>
		</div>
		
		
		
	</div>
	
	
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>	
</html>