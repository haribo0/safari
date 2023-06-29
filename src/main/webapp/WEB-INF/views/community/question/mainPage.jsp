<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사파리 | 로그인</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body>

	안녕하세요
	<!-- 헤더 섹션 -->
	<jsp:include page="../../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->
	
	 <!-- 커뮤니티 메뉴바 -->
      <div class="row">
         <div class="col">
            <jsp:include page="../../community/communityTopNavi.jsp"></jsp:include>
         </div>
      </div>
      <!-- 커뮤니티 메뉴바 -->
      
    <div class="container text-center mt-2">
	<h2 class="text-center fw-bold fs-3"> 궁금해요 게시판 </h2>
	</div>
	
	 <%--게시판 시작 --%>
	<div class = "container">
	
	<%--QuestionBoardList--%>
	<div class="row">
	
	<div class="col text-center">
		<table class="table">
			<thead>
			  <tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>좋아요</th>
				<th>등록일</th>
			  </tr>
			</thead>
			<tbody>
			<c:forEach items="${helpBoardList}" var="map">

				<tr>
				  <td><a class="text-black text-decoration-none" href="/safari/community/help/readContentPage/${map.helpDto.id}">${map.helpDto.id}</a></td>
				  <td>
				  	<c:if test="${map.helpDto.points>=1}">
				  	<span class="badge text-bg-secondary">${map.helpDto.points}</span>
				  	</c:if>
				  	<a class="text-black text-decoration-none" href="/safari/community/help/readContentPage/${map.helpDto.id}">${map.helpDto.title}</a>
				  	<c:if test="${map.helpCommentCount>=1}">
				  	<span style="font-size: 15px; color: red;">[${map.helpCommentCount}]</span>
				  	</c:if>
				  	<c:if test="${map.helpImgCount>=1}">
				  	<i class="bi bi-image"></i>
				  	</c:if>
				  	
				  </td>
				  	
				  
				  <td>${map.userDto.nickname}</td>
				  <td>${map.helpDto.views}</td>
				  <td>${map.helpLikeCount}</td>
				  <td><fmt:formatDate value="${map.helpDto.reg_date}" pattern="yyyy.MM.dd"/></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	
	
   
     <%--글쓰기 버튼 시작 --%>
	<div class="row">
	<div class="col text-end">
		<a href="./questionWriteContentPage">글쓰기</a>
	</div>
	</div>
	<%--글쓰기 버튼 끝 --%>	
	

	
	<!-- 푸터 섹션 -->
	<jsp:include page="../../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>	
</html>	      