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
</head>
<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->
	
	
	
	  <!-- 커뮤니티 메뉴바 -->
      <div class="row">
         <div class="col">
            <jsp:include page="./communityTopNavi.jsp"></jsp:include>
         </div>
      </div>
      <!-- 커뮤니티 메뉴바 --> 
      
   <%--게시판 시작 --%>
	<div class = "container">
	
   <%--helpBoardList--%>
	<div class="row">
	
	 <div class="container text mt-2">
	 
	 <div class="col">
	<h4 class="text ms-3 mb-3"> 해주세요 </h4>
	
	
	
	</div>
	</div>
	
	<div class="col text-center">
		<table class="table">
			<thead class="table-secondary">
			  <tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>좋아요</th>
				<th>작성일</th>
			  </tr>
			</thead>
			<tbody>
			<c:forEach items="${helpBoardList}" var="map">

				<tr>
				  <td><a class="text-black text-decoration-none" href="/safari/community/help/readContentPage/${map.helpDto.id}">${map.helpDto.id}</a></td>
				  <td style="text-align: left;">
				  	<div style="display: inline-block;">
				  	<a class="text-black text-decoration-none" href="/safari/community/help/readContentPage/${map.helpDto.id}" >${map.helpDto.title}</a>
				  	<%-- <c:if test="${map.helpCommentCount>=1}">
				  	<span style="font-size: 14px; color: red;">[${map.helpCommentCount}]</span>
				  	</c:if> --%>
				  	
				  	<c:if test="${map.helpDto.points>=1}">
				  	<span class="badge rounded-pill text-bg-warning" style="font-size: 61%;">${map.helpDto.points}</span>
				  	</c:if>
				  	<c:if test="${map.helpImgCount>=1}">
				  	<i class="bi bi-image"></i>
				  	</c:if>
				  	<c:if test="${map.helpCommentCount>=1}">
				  	<span style="font-size: 12px; color: red;">[${map.helpCommentCount}]</span>
				  	</c:if>
				  	</div>
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
	<div class="col text-end" >
		<a href="./writeContentPage"  style="text-decoration: none; display: flex; align-items: center; justify-content: flex-end;" >
			<i class="bi bi-pencil-square fa-icon text-dark" style="font-size: 1.5rem;"></i>
			<span class="text-dark ms-1 me-5" style="font-size: 0.9rem; line-height: 1;">글쓰기</span>
		</a>
	</div>
	</div>
	<%--글쓰기 버튼 끝 --%>	
	
	<%--검색  --%>
	<div class="container">
	<div class="row">
	<div class="col-1" style="padding:0px;">
 <div class="dropdown">
  <button class="btn btn-secondary dropdown-toggle" type="button" style="background-color: transparent; color: inherit;" data-bs-toggle="dropdown" aria-expanded="false">
   제목
  </button>
  <ul class="dropdown-menu">
    <li><button class="dropdown-item" type="button">제목</button></li>
    <li><button class="dropdown-item" type="button">내용</button></li>
    <li><button class="dropdown-item" type="button">제목+내용</button></li>
    <li><button class="dropdown-item" type="button">작성자</button></li>
  </ul>
  </div></div>
  <div class="col-5 d-grid"  style="padding:0px;">
  <form class="col-12 col-lg-auto me-lg-4" role="search">
    <input type="search" class="form-control search_box" placeholder="검색" aria-label="Search">
  </form>
</div></div>
</div>




 
	 <%--검색창 --%>
	 
	<style>
	.pagination .page-link {
    color: black !important;
	}
	</style>
	
		<div class="row"><%--페이지 버튼 --%>
			<div class="col-5 mx-auto">
				<nav aria-label="Page navigation example">
				  <ul class="pagination mb-0">
				   <li class="page-item"><a class="page-link" href="#">&lt;</a></li>   
				   <c:forEach begin="1" end="${totalHelpPage}" var="helpIndex">
				   		<c:choose>
				   			<c:when test="${helpIndex == currentHelpPage}">
				   				<li class="page-item"><a class="page-link" href="/safari/community/help/mainPage?helpPage=${helpIndex}"><strong>${helpIndex}</strong></a></li>
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



</div>
</div>	
</div>
<%--게시판 끝 --%>
	
	

	
	
	
	<!-- 푸터 섹션 -->
	<jsp:include page="../../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

</body>	
</html>	



