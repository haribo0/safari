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
	
	<%--가운데 시작 --%>
	<div class="col ">
		<div class="container">	
	
	<!-- 만약 파일 보내는 경우 - enctype="multipart/form-data" 꼭 변경해야 함, 무조건 post방식-->
	<%--글쓰기 폼 시작 --%>
	<form action="/safari/community/question/questionWriteContentProcess" method="post">
		
		<div class="row">
			<div class="col">
				<table class="table table-hover">
				 <tbody>
				  <tr>
				  	<td><input type="hidden" name="user_id" value="${sessionUser.id}"></td>
				  </tr>
				  <tr>
					<td><input type="text" class="form-control" placeholder="제목을 입력해주세요" name="title" maxlength="40"></td>
				  </tr>
				  <tr>
				  	<td>작성자: ${sessionUser.nickname}</td>
				  </tr>
				  <tr>
				  	<td><input type="number" class="form-control" placeholder="카테고리"  name="question_category_id" maxlength="10"></td>
				  </tr>
				  <tr>
				  	<td><textarea type="text" class="form-control" placeholder="내용을 입력해주세요" name="content" maxlength="3000" style="height:400px;"></textarea></td>
				  </tr>
				  <tr> 
				  	<td><input type="text" class="form-control" placeholder="포인트"  name="points" maxlength="10"></td>
				  </tr>
				</tbody>
				</table>
				<!-- <input name="helpBoardFiles" type="file" onchange="readURLContent(this)" id="helpBoardFiles" multiple accept="image/*">-->
				</div>
			</div> 
			
			<div class="row">
			<div class="col text-center">
				<br>
				<button>등록하기</button>
			</div>
			</div>
			</form>
			<%--글쓰기 폼 끝 --%>
		</div>
	</div>
	<%--가운데 끝 --%>
	
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
<%--템플릿 끝 --%>
	