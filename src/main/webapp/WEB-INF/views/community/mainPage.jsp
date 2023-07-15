<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사파리 | 커뮤니티메인</title>

<!-- 메타 섹션 -->
<jsp:include page="../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->

</head>
<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->

	<!-- 커뮤니티 메뉴바 -->
	<jsp:include page="../community/communityTopNavi.jsp"></jsp:include>
	
	<!--  body -->
	<div class = "container main_box">
	<div class = "row mt-5">
		<div class = "col">
			커뮤니티 메인 페이지 내용
		</div>
	</div>
	
	
	
	
	
	
	
	</div> <!--  <div class = "container main_box"> 닫힘 -->
	<div class = "mb-5"></div>
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->
</body>	
</html>