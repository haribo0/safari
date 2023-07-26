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
	<jsp:include page="../../common/meta.jsp"></jsp:include>
	<!-- 메타 섹션 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<link rel="stylesheet" href="/safari/resources/style/common.css" type="text/css">
</head>
<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->
	
	
	<div class="row mb-3">
	
	<%--왼쪽 시작--%>
	<div class="col-1"></div>
	<%--왼쪽 끝 --%>
	
	
	<%--가운데 시작 --%>
	<div class="col">
	
		<div class="container">
		
	<%-- 글쓰기 폼 시작 --%>
		<form action="/safari/community/question/writeQuestionReplyProcess" method="post">
		
	<div class="row">
		<div class="col mt-5">
				 ${sessionUser.nickname}님, 답변해주세요! <hr>
			
			  	  <input type="hidden" name="user_id" value="${sessionUser.id}">
			  
			  	  <input type="hidden" name="question_id" value="${board.questionDto.id}">
			  	
			  	  <textarea type="text" class="form-control" placeholder="답변 작성 시 서비스 운영정책을 지켜주세요."  name="content" maxlength="3000" style="height:400px;"></textarea>
			  	
			  
			
		</div>
	</div>
	
	<!-- 버튼 -->
	<div class="row mt-3">
	<div class="col text-center">
	<button class="btn" style="background: #ff6f0f; font-weight: bold; color: white;">등록하기</button>
	</div>
	</div>
	</form>
	
	
	</div>
		
	</div>
	<%--가운데 끝 --%>
	

	
	<%--오른쪽 시작--%>
	<div class="col-1">
	</div>
	<%--오른쪽 끝--%>	

	</div>


	
	
	
	<!-- 푸터 섹션 -->
	<jsp:include page="../../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>	
</html>	
<%--템플릿 끝 --%>
	