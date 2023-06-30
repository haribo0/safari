<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사파리 | 회원가입</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->
	
	<div class="container d-flex justify-content-center">
		<form action="userJoinProcess" method="post">
		    <div class="row g-3 pb-5" style="max-width: 480px;">
		        <div class="col-sm-12">
		          <label for="uid" class="form-label">아이디(이메일)</label>
		          <input type="text" class="form-control" id="uid" placeholder="" value="" required="" name="email">
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
		        
		        <div class="col-sm-12 mt-4">
		          <label for="unick" class="form-label">닉네임</label>
		          <input type="text" class="form-control" id="unick" placeholder="" value="" required="" name="nickname">
		          <div class="invalid-feedback">
		            닉네임을 입력해주세요.
		          </div>
		        </div>
		        
		       	<div class="col-sm-12 mt-4">
		          <label for="uphone" class="form-label">전화번호</label>
		          <input type="text" class="form-control" id="uphone" placeholder="" value="" required="" name="phone">
		          <div class="invalid-feedback">
		            전화번호를 입력해주세요.
		          </div>
		        </div>
		        
		        <div class="col-sm-12 mt-4">
		        	<p>성별</p>
		          <label for="ugender_m">남자</label>
		          <input type="radio" id="ugender_m" placeholder="" value="m" required="" name="gender">
		          <div class="invalid-feedback">
		            남
		          </div>
		          
		          <label for="ugender_w">여자</label>
		          <input type="radio" id="ugender_w" placeholder="" value="w" required="" name="gender">
		          <div class="invalid-feedback">
		            여
		          </div>
		        </div>
		        
		        <div class="col-sm-12 mt-4">
		          <label for="ubirth" class="form-label">생일</label>
		          <input type="date" class="form-control" id="ubirth" placeholder="" value="" required="" name="birth">
		          <div class="invalid-feedback">
		            비밀번호를 입력해주세요.
		          </div>
		        </div>
		        
		        <div class="col-sm-12 mt-4">
		          <label for="upic" class="form-label">프로필사진</label>
		          <input type="file" class="form-control" id="upic" placeholder="" value="" name="profile_img_link">
		          <div class="invalid-feedback">
		            프로필사진
		          </div>
		        </div>
		        
		      </div>
		      <div class="row" style="max-width: 480px;">
		        <button class="btn btn-secondary">회원가입</button>
		      </div>
		</form>
	</div>
	
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>	
</html>