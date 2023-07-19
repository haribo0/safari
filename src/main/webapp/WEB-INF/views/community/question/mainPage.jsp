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
	<!-- 헤더 섹션 -->
	<jsp:include page="../../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->
		
	<!-- 시작 -->
	<div class="row">
		<!-- 왼쪽 -->
		<div class="col"></div>
		<!-- 왼쪽 -->
	
		<%-- 내용 공간 --%>
		<div class="col-8">
		
		 <!-- 커뮤니티 메뉴바 -->
	      <div class="row">
	         <div class="col">
	            <jsp:include page="./communityTopNavi.jsp"></jsp:include>
	         </div>
	      </div>
      	 <!-- 커뮤니티 메뉴바 --> 
		
		<!-- 게시판 제목 글자 -->
	      <div class="row">
	      <div class="col">
	     <h4 class="text fw-bold ms-4"> 궁금해요 </h4>
	      </div>
	      </div>
	  <!-- 게시판 제목 글자 -->
		
		
	
	
<<<<<<< HEAD
=======
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
>>>>>>> 8830acc231d3c798e2b719666d4293616f350014
	
	 <%--게시판 시작 --%>
	<!-- <div class = "container"> -->
	
	<%--QuestionBoardList--%>
	<div class="row">
	
	<div class="col">
		<table class="table">
			<thead class="table-secondary">
			<thead>
			 <tr>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th style="text-align: center;">조회수</th>
				<th style="text-align: center;">좋아요</th>
				<th style="text-align: center;">작성일</th>
			  </tr> 
			</thead>
			<tbody>
			 <%-- best --%>
			<c:forEach items="${questionBestBoardList}" var="map">
				<tr>
				  	<td><a class="text-black text-decoration-none" href="/safari/community/question/questionReadContentPage/${map.questionDto.id}">${map.questionDto.id}</a></td>
					<td>${map.userDto.nickname}</td>
					<td style="text-align: left;">
					<div style="display: inline-block;">
				  	<a class="text-black text-decoration-none" href="/safari/community/question/questionReadContentPage/${map.questionDto.id}">
				  	<span class="badge rounded-pill text-bg-danger opacity-75" style="font-size: 61%; position: relative; top: -3px;">Best</span>
				  	${map.questionDto.title}</a>
				  	<c:if test="${map.questionDto.points>=1}">
				  	<span class="badge rounded-pill text-bg-warning opacity-75" style="font-size: 61%; position:relative; top: -3px;">${map.questionDto.points}p</span>
				  	</c:if>
				  	</div>
			
					<c:if test="${map.questionReplyCount>=1}">
				  	<span style="font-size: 13px; color: red;">[${map.questionReplyCount}]</span>
				  	</c:if>
				  	<c:if test="${map.questionImgCount>=1}">
				  	<i class="bi bi-image"></i>
				  	</c:if>
				  <td style="text-align: center;">${map.questionDto.views}</td>
				  <td style="text-align: center;">${map.questionLikeCount}</td>
				  <td style="text-align: center;"><fmt:formatDate value="${map.questionDto.reg_date}" pattern="yyyy.MM.dd"/></td>
				</tr>
			</c:forEach>
			 <%-- best --%>
			 
			 <%-- 일반 게시물 --%>
			<c:forEach items="${questionBoardList}" var="map">

				<tr>
				  	<td><a class="text-black text-decoration-none" href="/safari/community/question/questionReadContentPage/${map.questionDto.id}">${map.questionDto.id}</a></td>
					<td>${map.userDto.nickname}</td>
					<td style="text-align: left;">
					<div style="display: inline-block;">
				  	<a class="text-black text-decoration-none" href="/safari/community/question/questionReadContentPage/${map.questionDto.id}">${map.questionDto.title}</a>
				  	<c:if test="${map.questionDto.points>=1}">
				  	<span class="badge rounded-pill text-bg-warning opacity-75" style="font-size: 61%; position:relative; top: -3px;">${map.questionDto.points}p</span>
				  	</c:if>
				  	</div>
			
					<c:if test="${map.questionReplyCount>=1}">
				  	<span style="font-size: 13px; color: red;">[${map.questionReplyCount}]</span>
				  	</c:if>
				  	<c:if test="${map.questionImgCount>=1}">
				  	<i class="bi bi-image"></i>
				  	</c:if>
				  	</td>
				  <td style="text-align: center;">${map.questionDto.views}</td>
				  <td style="text-align: center;">${map.questionLikeCount}</td>
				  <td style="text-align: center;"><fmt:formatDate value="${map.questionDto.reg_date}" pattern="yyyy.MM.dd"/></td>
				</tr>
			</c:forEach>
			 <%-- 일반 게시물 --%>
			</tbody>
		</table>
	</div>
<!-- 	</div> -->
   <%--QuestionBoardList--%>
   
    <%-- 글쓰기 버튼 --%>
		
		<style>
		.orangeButton {
		background: #ff6f0f;
		font-weight: bold;
		color: white;
		}
		</style>
	
	<div class="row">
	<div class="col text-end" >
	<div class="d-flex justify-content-end">
	<a href="./questionWriteContentPage" style="text-decoration: none; display: flex; align-items: center; justify-content: center;">
		<button type="button" class="btn btn-link orangeButton d-flex align-items-center justify-content-center" style="text-decoration: none; display: flex; align-items: center; justify-content: center;">
			<i class="bi bi-pencil-square fa-icon text-white" style="font-size: 1.5rem;"></i>
			<span class="ms-1 me-2" style="font-size: 0.9rem; line-height: 1;">글쓰기</span>
		</button>
	</a>
	</div>
	</div>
	</div>
	<%-- 글쓰기 버튼 --%>	
	
	<%-- 검색--%>	
	<form action="./mainPage" method="get">
				<div class="row"> 
					<div class="col-2">
						<select name="question_searchType" class="form-select">
							<option value="title" selected>제목</option>
							<option value="content">내용</option>
							<option value="nickname">작성자</option>
						</select>				
					</div>
					<div class="col-3">
						<input name="question_searchWord" type="text" class="form-control">
					</div>
					<div class="col-1 ms-3" style="position:relative; right: 30px;">
						 <button type="submit" class="btn btn-outline-dark">
						  	<span class="bi bi-search"></span>
						</button>
					</div>
				</div>
	</form>
		<%-- 검색--%>	
	
	<%-- 페이지 버튼 --%>
	<style>
	.pagination .page-link {
    color: black !important;
	}
	</style>
	
	<div class="row">
			<div class="col-5 mx-auto mt-3 mb-3">
				<nav aria-label="Page navigation example">
				  <ul class="pagination mb-0">
				   <li class="page-item"><a class="page-link" href="#">&lt;</a></li>   
				   <c:forEach begin="1" end="${totalQuestionPage}" var="questionIndex">
				   		<c:choose>
				   			<c:when test="${questionIndex == currentQuestionPage}">
				   				<li class="page-item"><a class="page-link" href="/safari/community/question/mainPage?questionPage=${questionIndex}"><strong>${questionIndex}</strong></a></li>
				   			</c:when>
				   			<c:otherwise>
				   				<li class="page-item"><a class="page-link" href="/safari/community/question/mainPage?questionPage=${questionIndex}">${questionIndex}</a></li>
				   			</c:otherwise>
				   		</c:choose>
				   	
				   </c:forEach>
				   <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
				  </ul>
				 </nav>
			</div>
		</div>
	
	<%--페이지 버튼  --%>
	
	
		
	
	
	</div>
		
		
		</div>
		<%-- 내용 공간 --%>
		
		
		<!-- 오른쪽 -->
		<div class="col"></div>
		<!-- 오른쪽 -->
	</div>
	<!-- 시작 -->
	
	

	
	<!-- 푸터 섹션 -->
	<jsp:include page="../../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>	
</html>	      