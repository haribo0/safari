<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사파리 | 로그인</title>
<!-- 메타 섹션 -->
<jsp:include page="../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->
</head>
<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../common/headerB.jsp"></jsp:include>
	<!-- 헤더 섹션 -->
	
	<div class="container justify-content-center mt-5">
		<div class="row ">
			<div class="col"></div>
			<div class="col-4">
				<div class="row ">
					<div class="col text-center fs-4"> 
					
					    <a href="./mainPage" class="navbar-brand">
					      <img class="img-fluid my-2 ms-4 me-3" width="140px" src="/safari/resources/img/logo0.png">
					    </a>
					
					</div>
				</div>
				<div class="row mt-5 mb-1">
					<div class="col text-center fs-5 fw-medium ">사업자 계정 로그인</div>
				</div>
				<form action="./businessLoginProcess" method="POST">
				<div class="row mt-5">
					<div class="col">
						<label for="uid" class="form-label">아이디</label>
				        <input type="text" class="form-control" id="uid" placeholder="아이디" value="" required="" name="business_userid">
					</div>
				</div>
				<div class="row mt-3">
					<div class="col">
				          <label for="upw" class="form-label">비밀번호</label>
				          <input type="password" class="form-control" id="upw" placeholder="비밀번호" value="" required="" name="pw">
		          	</div>
				</div>
				<div class="row mt-4">
					<div class="col d-grid">
						<input type="submit" class="btn btn-dark" value="로그인">
					</div>
				</div>
				</form>
				<div class="row mt-5">
					<div class="col d-grid">
						<a href="businessRegisterPage" class="text-black text-decoration-none text-center">사업자 회원가입</a>
					</div>
				</div>
				<div class="row my-5">
					<div class="col d-grid">
						 
					</div>
				</div>
				<div class="row my-5">
					<div class="col d-grid">
						 
					</div>
				</div>
			
			</div>
			<div class="col"></div>
		</div>
		
	</div>

	


	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>	
</html>