<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 메타 섹션 -->
<jsp:include page="../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->

</head>
<body>
	<!-- 커뮤니티 메뉴바 -->
	<div class="container main_box">
		<h1 class="text-center fs-3 mt-2"><b>커뮤니티</b> 페이지</h1>
			<ul class="nav justify-content-center pb-3 mb-3">
		      <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">공동구매</a></li>
		      <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">살까말까</a></li>
		      <li class="nav-item"><a href="${pageContext.request.contextPath}/community/pick/mainPage" class="nav-link px-2 text-body-secondary">골라줘요</a></li>
		      <li class="nav-item"><a href="${pageContext.request.contextPath}/community/help/mainPage" class="nav-link px-2 text-body-secondary">해주세요</a></li>
		      <li class="nav-item"><a href="${pageContext.request.contextPath}/community/question/mainPage" class="nav-link px-2 text-body-secondary">궁금해요</a></li>
		      <li class="nav-item"><a href="${pageContext.request.contextPath}/community/recruit/mainPage" class="nav-link px-2 text-body-secondary">구인구직</a></li>
		      <li class="nav-item"><a href="${pageContext.request.contextPath}/community/promotion/promotionReviewMainPage" class="nav-link px-2 text-body-secondary">써봤어요</a></li>
		    </ul>
	</div>

</body>
</html>
