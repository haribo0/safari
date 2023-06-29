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
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->
	
	<div class="container d-flex flex-column align-items-center justify-content-center mt-5">
		<h2>LOGO(사파리) <small class="fs-5">사업자 로그인</small></h2>
		<form action="businessLoginProcess" method="post">
		    <div class="row g-3 pb-5 mt-3" style="max-width: 480px;">
		        <div class="col-sm-12">
		          <label for="uid" class="form-label">아이디(이메일)</label>
		          <input type="text" class="form-control" id="uid" placeholder="" value="" required="" name="business_userid">
		          <div class="invalid-feedback">
		            아이디를 입력해주세요.
		          </div>
		        </div>
		
		        <div class="col-sm-12 mt-4">
		          <label for="upw" class="form-label">비밀번호</label>
		          <input type="password" class="form-control" id="upw" placeholder="" value="" required="" name="pw">
		          <div class="invalid-feedback">
		            비밀번호를 입력해주세요.
		          </div>
		        </div>
		        
		      </div>
		      <div class="row" style="max-width: 480px;">
		        <button class="btn btn-secondary">로그인</button>
		      </div>
		</form>		
	</div>


	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>	
</html>