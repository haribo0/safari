<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<!-- 메타 섹션 -->
<jsp:include page="../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->

<!--  body -->
	<div class = "container main_box">
<div class = "row mt-5">
		<div class = "col-auto">
				<h1 class="text-start fs-3 fw-semibold ">
					<b>커뮤니티</b>
				</h1>			 
			</div>
			
			<div class = "col mx-3 mb-5 d-flex align-items-center">
				<div class = "row text-start">
					<div class = "col">
					<a href="${pageContext.request.contextPath}/community/pick/mainPage" style="text-decoration: none; color: inherit;">
						골라줘요
					</a>
					 <div class="vr mx-3"></div>
					<a href="${pageContext.request.contextPath}/community/help/mainPage" style="text-decoration: none; color: inherit;">
						해주세요 
					</a>
					 <div class="vr mx-3"></div>
					 <a href="${pageContext.request.contextPath}/community/question/mainPage" style="text-decoration: none; color: inherit;">
						궁금해요
					</a>
					 <div class="vr mx-3"></div>
					<a href="${pageContext.request.contextPath}/community/recruit/mainPage" style="text-decoration: none; color: inherit;">
						구인구직
					</a>
					 <div class="vr mx-3"></div>
					<a href="${pageContext.request.contextPath}/community/promotion/promotionReviewMainPage" style="text-decoration: none; color: inherit;">
						리워드
					</a>
					</div>
				</div>
			</div>
	</div>
</div>
</body>
</html>