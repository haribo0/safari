<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사파리 | 회원가입</title>
<!-- 메타 섹션 -->
<jsp:include page="../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<style>
.orangeButton{
	background: #ff6f0f;
	font-weight: bold;
	color: white;
}
</style>

</head>


<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->
	
	<div class="container mb-5">
		<div class="row mt-5 justify-content-center">
			<div class="col-4">
				
				<div class="row">
					<div class="col fw-bold fs-5 text-center">회원가입</div>					
				</div>
				
				<div class="row mt-4">
					<div class="col">
				
						<div class="row">
							<div class="col">
								<label for="email" class="form-label">아이디</label>
								<input type="text" class="form-control" id="email">
							</div>
						</div>
						
						<div class="row mt-2">
							<div class="col">
								<label for="pw" class="form-label">비밀번호</label>
								<input type="password" class="form-control" id="pw">
							</div>
						</div>
				
						<div class="row mt-2">
							<div class="col">
								<label for="pwCheck" class="form-label">비밀번호 확인</label>
								<input type="password" class="form-control" id="pwCheck">
							</div>
						</div>
						
						<div class="row mt-2">
							<div class="col">
								<label for="phone" class="form-label">전화번호</label>
								<input type="text" class="form-control" id="phone">
							</div>
						</div>		
						
						<div class="row mt-2">
						
							<div class="row">
								<div class="col">성별</div>
								
							</div>
							<div class="row mt-2">
								<div class="col">
									 <input class="form-check-input me-2" type="radio" id="gender" name="gender" value="" style="cursor:pointer";>
									  <label class="form-check-label me-4" for="gender">
									    	남
									  </label>	
									   <input class="form-check-input me-2" type="radio" id="gender" name="gender" value="" style="cursor:pointer";>
									  <label class="form-check-label me-4" for="gender">
									    	여
									  </label>	
								</div>
							</div>
						</div>		
						
						<div class="row mt-3">
							<div class="col">
								<label for="birth" class="form-label">생년월일</label>
								<input type="date" class="form-control" id="birth">
							</div>
						</div>			
						
						<div class="row mt-3">
							<div class="col">
								<input type="file" class="form-control" id="profile_img_link">						
							</div>
						</div>
						
						<div class="row mt-3">
							<div class="col d-grid">
								<input type="button" class="btn orangeButton" value="회원가입">
							</div>
						</div>
				
				
				
				
				
				
					</div>
				</div>
				
				
				
				
				
				
				
				
			</div>
		</div>
	
	
	</div>
	

	
	
	
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>	
</html>