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
	
	<div class="container text-center mt-2">
	<h2 class="text-center fw-bold fs-3"> 해주세요 게시판 </h2>
	</div>
	
	<!-- 메뉴바 -->
	<div class="container main_box">
		<ul class="nav justify-content-center pb-3 mb-3">
	      <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">공동구매</a></li>
	      <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">살까말까</a></li>
	      <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">골라줘요</a></li>
	      <li class="nav-item"><a href="../community/help/mainPage" class="nav-link px-2 text-body-secondary">해주세요</a></li>
	      <li class="nav-item"><a href="../community/question/mainPage" class="nav-link px-2 text-body-secondary">궁금해요</a></li>
	    </ul>
	</div>

   <%--게시판 시작 --%>
	<div class = "container">
	
   <%--helpBoardList--%>
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
				  	<span class="badge text-bg-secondary">${map.helpDto.points}</span><a class="text-black text-decoration-none" href="/safari/community/help/readContentPage/${map.helpDto.id}">${map.helpDto.title}</a>
				  	<span style="font-size: 15px; color: red;">[${map.helpCommentCount}]</span>
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
		<%-- <button type="button" class="btn btn-primary">글쓰기</button>--%>
		
	<%--글쓰기 버튼 시작 --%>
	<div class="row">
	<div class="col text-end">
		<span class="text-dark"><a href="./writeContentPage"><i class="bi bi-pencil-square fas fa-2x fa-icon"></i></a></span>
	</div>
	</div>
	<%--글쓰기 버튼 끝 --%>	
	
	
	<div class="row"><%--페이지 버튼 --%>
			<div class="col-6 mx-auto">
				<nav aria-label="Page navigation example">
				  <ul class="pagination mb-0">
				   <li class="page-item"><a class="page-link" href="#">&lt;</a></li>   
				   <c:forEach begin="1" end="${totalHelpPage}" var="helpIndex">
				   		<c:choose>
				   			<c:when test="${helpIndex == currentHelpPage}">
				   				<li class="page-item active"><a class="page-link" href="/safari/community/help/mainPage?helpPage=${helpIndex}">${helpIndex}</a></li>
				   			</c:when>
				   			<c:otherwise>
				   				<li class="page-item"><a class="page-link" href="/safari/community/help/mainPage?helpPage=${helpIndex}">${helpIndex}</a></li>
				   			</c:otherwise>
				   		</c:choose>
				   	
				   </c:forEach>
				   <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
				  </ul>
				 </nav>
			</div>
	</div>


<%--오른쪽 시작--%>
	<div class="col-3">
	</div>
	<%--오른쪽 끝--%>
</div>
</div>	
<%--게시판 끝 --%>
	
	</div>

	
	
	
	<!-- 푸터 섹션 -->
	<jsp:include page="../../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>	
</html>	



