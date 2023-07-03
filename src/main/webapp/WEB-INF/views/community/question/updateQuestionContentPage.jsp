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
	
	<div class="row">
	
	<%--왼쪽 시작--%>
	<div class="col-3"></div>
	<%--왼쪽 끝 --%>
	
	<div class="col text-center">
	
	
<form action="/safari/community/question/updateQuestionContentProcess" method="post">
	
<%--수정하기 폼 시작 --%>
	<div class="container">
		<table class="table table-hover">
			<tbody>
				<tr>
	  				<td><input type="hidden" name="id" value="${map.questionDto.id}"></td>
	  			</tr>
	  			<tr>
					<td><input type="number" class="form-control" name="question_category_id" maxlength="40" value="${map.questionDto.question_category_id}"></td>
	  			</tr>
				<tr>
					<td><input type="text" class="form-control" name="title" maxlength="40" value="${map.questionDto.title}"></td>
	  			</tr>
	  		 	<tr>
	  				<td><textarea type="text" class="form-control" name="content" maxlength="3000" style="height:400px;">${map.questionDto.content }</textarea></td>
	  			</tr>
	 			<tr> 
	 			 	<td><input type="text" class="form-control"  name="points" maxlength="10" value="${map.questionDto.points }"></td>
	 			</tr>
	 		<%--	<tr>
	 				<td><input name="helpBoardFiles" type="file" onchange="readURLContent(this)" id="helpBoardFiles" multiple accept="image/*"></td>
	 			</tr>	 --%>
			 </tbody>
		</table>
	
 </div>

	<%--버튼 2가지 --%>
	<button class="btn btn-primary">수정하기</button> 
	<input type="submit" class="btn btn-primary" value="수정하기">
</form>

	<%-- 제목: <input type="text" name="title" value="${map.helpDto.title}"><br>
	작성자: ${sessionUser.nickname }<br>
	내용:<br>
	<textarea rows="10" cols="60" name="content">${map.helpDto.content }</textarea><br>
	<input type="hidden" name="id" value="${map.helpDto.id }">
	포인트:<input type="text" name="points" value="${map.helpDto.points }"><br>
	위치:<input type="text" name="location" value="${map.helpDto.location }"><br>
	<br>
	</form>
	--%>
	
</div>
<%--오른쪽 시작--%>
	<div class="col-3">
	</div>
	<%--오른쪽 끝--%>	
</div>
	
	
	<!-- 푸터 섹션 -->
	<jsp:include page="../../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>	
</html>	
