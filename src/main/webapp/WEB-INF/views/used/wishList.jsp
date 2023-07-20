<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사파리 | 메인</title>
<!-- 메타 섹션 -->
<jsp:include page="../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->
</head>
<style>
	.btn-qna{position: fixed; bottom: 80px; right: 70px; border-radius: 60px; padding: 0 0;}
	.btn-circle{width: 50px; height: 52px; border-radius: 50%; display: flex; flex-direction:column; justify-content: center; align-items: center; font-size: 2rem; cursor: pointer;}
	.btn-circle i{color: #5e5e5e; font-size: 24px;}
	.btn-tit{font-size:13px;}
	
	.coin-box{position: relative;}
	.coin-box::before {content: ''; width:1px; height: 60%; background: #5e5e5e; display:block; position: absolute; top: 50%; transform:translateY(-50%); left: 0px;}
	.overflow {
	  white-space: nowrap; /* 텍스트를 한 줄로 표시 */
	  overflow: hidden; /* 넘친 텍스트를 숨김 */
	  text-overflow: ellipsis; /* 넘친 텍스트를 "..."으로 표시 */
	}
</style>
<body>
	<!-- Chat Box -->
	<jsp:include page="../common/chatBox.jsp"></jsp:include>
	<!-- Chat Box -->
	<!-- 헤더 섹션 -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->
	
	<!-- 마이페이지 상단 블럭 -->
	<jsp:include page="../common/myPageTop.jsp"></jsp:include>
	<!-- 마이페이지 상단 블럭 -->

	<div class="container d-flex mt-5 px-0">
		<div class="row w-100">
		<!-- 마이페이지 nav -->
		<jsp:include page="../common/myPageNav.jsp"></jsp:include>
		<!-- 마이페이지 nav -->
			
		<div class="col ms-4">
			<div class="row" style="border-bottom: 2px solid #222; height: 48px;">
				<div class="col p-0">
					<h5>관심목록</h5>						
				</div>
			</div>
			
			<div class="row" style="position: relative;">
				<div class="col px-0">
			
					<c:if test="${empty list}">
						<div class="row mt-3">
							<div class="col text-center fs-5">
								관심 있는 중고 물품이 없습니다.
							</div>
						</div>	
					</c:if>
						
					<div class="row mt-3">
						<c:forEach items="${list}" var="map">
							<div class="col-3 mb-5">
								<div class="row">
									<div class="col">
										<a href="/safari/used/productDetail/${map.productDto.id }" class="text-decoration-none d-inline-block">
											<img src="/safarifile/${map.productImgDto.product_img_link}" width="245px" alt="..."  style="height: 245px;">
										</a>
									</div>
								</div>
								
								<div class="row mt-2">
									<div class="col fw-bold overflow" style="width: 200px; font-size:17px;">
										<a href="/safari/used/productDetail/${map.productDto.id }">
										   ${map.productDto.title}</a>
									</div>
									<div class="col-2 text-danger fs-5 text-left px-0" style="height: 10px;"><i class="bi bi-heart-fill"></i></div>
								</div>
								
								<div class="row">
									<div class="col text-secondary" style="font-size:15px;">
										${map.productCityDto.product_city_name } | ${map.productTownDto.product_town_name }
									</div>
								</div>
								
								<div class="row mt-2">
									<div class="col fw-semibold" style="font-size: 18px;">
							 			<fmt:formatNumber value="${map.productDto.price}" pattern="#,###"/>원
									</div>
								</div>	
							</div>
						</c:forEach>
					</div>
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