<%--템플릿 시작 --%>
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
</head>
<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->
	
	
<%-- 	<!-- 커뮤니티 메뉴바 -->
      <div class="row">
         <div class="col">
            <jsp:include page="../communityTopNavi.jsp"></jsp:include>
         </div>
      </div>
      <!-- 커뮤니티 메뉴바 --> --%>
	
	<div class="row">
	
	<%--왼쪽 시작--%>
	<div class="col-2"></div>
	<%--왼쪽 끝 --%>
	
	<%--가운데 시작 --%>
		<div class="col ">
		<div class="container">	
	
	<%--수정하기 폼 시작 --%>
	<form action="/safari/community/help/updateContentProcess" method="post" enctype="multipart/form-data">
	<div class="row">
		<div class="col">
			<input type="hidden" name="id" value="${map.helpDto.id}">
			<input type="text" class="form-control" name="title" maxlength="40" value="${map.helpDto.title}" style="margin-top: 10px;">
			<textarea type="text" class="form-control" name="content" maxlength="3000" style="height:400px; margin-top: 10px;">${map.helpDto.content }</textarea>
 			<div style="display: flex; gap: 10px;">
 			<select class="form-select" aria-label="Default select example" name="points" style="margin-top: 10px; max-width: 200px;">
				  <option value="">${map.helpDto.points}</option>
				  <option value="100">100</option>
				  <option value="200">200</option>
				  <option value="300">300</option>
				  <option value="400">400</option>
				  <option value="500">500</option>
				  <option value="600">600</option>
				  <option value="700">700</option>
				  <option value="800">800</option>
				  <option value="900">900</option>
				  <option value="1000">1000</option>
			</select>
 			<input type="text" class="form-control"  name="location" maxlength="30" style="margin-top: 10px; max-width: 200px;" value="${map.helpDto.location }">
 			</div>
		 	<label for="helpBoardFiles" class="file-upload-btn" style="margin-top: 10px;">
			<i class="bi bi-paperclip"></i>
			<span class="sr-only">파일 선택</span>
			</label>
			<input name="helpBoardFiles" type="file" onchange="readURLContent(this)" id="helpBoardFiles" style="margin-top: 10px; display: none;" multiple accept="image/*">
 		</div>
 	</div>

	<%--버튼--%>
	<div class="row">
	<div class="col text-center">
		<br>
		<button class="btn btn-dark">수정하기</button> 
	</div>
	</div>
	<%--버튼--%>
	
</form>
<%--수정하기 폼 끝 --%>
	</div>
	</div>
	<%--가운데 끝 --%>


	
	

<%--오른쪽 시작--%>
	<div class="col-2">
	</div>
	<%--오른쪽 끝--%>	
</div>
	
	
	<!-- 푸터 섹션 -->
	<jsp:include page="../../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>	
</html>	
