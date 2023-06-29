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
</head>
<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../common/headerB.jsp"></jsp:include>
	<!-- 헤더 섹션 -->

	<div class="container main_box">
		<h1 class="text-center fs-3"><b>대여</b> 메인 페이지</h1>
		<div class="row">
			<div class="col-2">
				<!-- <a href="./businessRegisterPage" class="text-black text-decoration-none">판매자 회원가입</a> -->
				<a href="./businessRegisterPage" class="btn btn-dark">판매자 회원가입</a>
			
			</div>
			<div class="col-2">
				<a href="./businessLoginPage" class="btn btn-dark">판매자 로그인</a>
			</div>
			<div class="col-2">
				<a href="./productRegisterPage" class="btn btn-dark">상품 등록</a>
			</div>
		</div>
	</div>
	
	
	
	
	
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>	
</html>