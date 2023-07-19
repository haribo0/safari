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
<style>
.like-item, .like-item img{transition: all 0.2s ease;}
.like-item:hover{box-shadow: 2px 4px 12px #ccc!important; font-weight: bold;}
.like-item:hover img{transform: scale(1.02)}
</style>
</head>
<body>		

	<!-- 헤더 섹션 -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->
	
	<!-- 마이페이지 상단 블럭 -->
	<jsp:include page="../common/myPageTop.jsp"></jsp:include>
	<!-- 마이페이지 상단 블럭 -->

	<div class="container d-flex mt-5 px-0">
		<div class="row w-100">
		<!-- 마이페이지 leftnav -->
		<jsp:include page="../common/myPageNav.jsp"></jsp:include>
		<!-- 마이페이지 leftnav -->
		
		<div class="col ms-4">
			<div class="row" style="border-bottom: 2px solid #222; height: 48px;">
				<div class="col p-0">
					<h5>대여 찜</h5>						
				</div>
			</div>
			
			<div class="row mt-1">
				<c:forEach items="${rentalItemLikeList}" var="data">
					<div class="col-3 d-flex flex-column justify-content-center align-items-center mt-5 shadow-sm me-4 py-3 like-item" style="max-width: 240px;">
						<a href="${pageContext.request.contextPath}/rental/productDescPage?id=${data.rentalItemDto.id}" class="text-decoration-none d-inline-block">
							<div>
								<img alt="" src="/safariImg/${data.rentalItemDto.main_img_link}" class="rounded-1" style="width: 140px;">				
							</div>
							<p class="mt-3 mb-0 text-secondary text-center" style="font-size: 14px;">${data.rentalItemDto.title }</p>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
		</div>
	</div>
	
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

</body>	
</html>