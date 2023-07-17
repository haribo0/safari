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
	
	<div class="row">
		<!-- 왼쪽 -->
		<div class="col"></div>
		<!-- 왼쪽 -->
	
		<%-- 내용 공간 --%>
		<div class="col-8">
		
		<!-- 커뮤니티 메뉴바 -->
      <div class="row">
         <div class="col">
           <jsp:include page="../../community/communityTopNavi.jsp"></jsp:include>
         </div>
      </div>
      <!-- 커뮤니티 메뉴바 --> 
      
      <div class="row">
      <div class="col">
     <h4 class="text fw-bold ms-4"> 해주세요 </h4>
      </div>
      </div>
	
	
		<div class="row">
		<%-- helpBoardList forEach  --%>
		<c:forEach items="${helpBoardList}" var="map">
	    <div class="col-6 mb-4 p-3">
	    	<div class="card">
	    	${helpImgDto.help_img_link}
	    	<div class="card-body">
		    	<div class="row">
		    		<div class="col-3">
		    		<%-- img --%>
							<div class="row mt-2">
								<div class="col">
								<c:if test="${map.helpImgCount>=1}">
									<img src="/uploadFiles/${map.helpImgDtoList[0].help_img_link}"
										style="max-width: 100%; max-height: 100%;">
								</c:if>
									<c:if test="${map.helpImgCount==0}">
									<img src="/safari/resources/img/community/no-image.gif"
									style="max-width: 100%; max-height: 100%;">
									</c:if>
								</div>
							</div>						
					<%-- img --%>							
					
					
		    		<%-- <a class="text-black text-decoration-none" href="/safari/community/help/readContentPage/${map.helpDto.id}" > 
		    		 <img src="/safari/resources/img/community/cat2.jpg" style="max-width: 100%; max-height: 100%;"></a> --%>
		    		<%-- img --%>
		    		</div>
		    	
		    	<div class="col-7">
		    		<a class="text-black text-decoration-none" href="/safari/community/help/readContentPage/${map.helpDto.id}">
		    		<span style="font-size: 19px;">
		    		<b>${map.helpDto.title}</b>
		    		<c:if test="${map.helpDto.points>=1}">
				  	<span class="badge rounded-pill text-bg-warning opacity-75" style="font-size: 61%; position: relative; top: -3px;">${map.helpDto.points}p</span>
				  	</c:if></span></a>
				  	<div class="row">
	  				<div class="col">
	  				${map.helpDto.location}
	  				</div>
		  			</div>
		  			 <div class="row">
		  				<div class="col" style="font-size: 15px;">
		  				조회수 ${map.helpDto.views}
		  				</div>
		  			</div> 
			    </div>
		    	
		    	<div class="col text-end">
		    	<i class="bi bi-heart text-danger" style="font-size: 21px;"></i>
		    	<span style="font-size: 12px; position: relative; bottom: 3px; left: 2px;">${map.helpLikeCount}</span>
		    	
		    	<%-- <c:choose>
				<c:when test="${HelpBoardLikeCount >= 1}">
		        	<a class="bi bi-heart-fill text-danger" style="font-size: 21px;" href="/safari/community/help/insertHelpLikeProcess/${map.helpDto.id}"></a>
			        &nbsp;${HelpBoardLikeCount} 
				</c:when>
				<c:otherwise>
			        <a class="bi bi-heart text-danger" style="font-size: 21px;" href="/safari/community/help/insertHelpLikeProcess/${map.helpDto.id}"></a>
			        &nbsp;${HelpBoardLikeCount}
			    </c:otherwise>
			</c:choose>  --%>
		    	</div>
	  			
				  
				  
				  
	  		</div>
	  		</div>
	  		</div></div>
	    	</c:forEach>
		<%-- helpBoardList forEach  --%>
		
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
	<a href="./writeContentPage" style="text-decoration: none; display: flex; align-items: center; justify-content: flex-end;">
		<button type="button" class="btn btn-link orangeButton d-flex align-items-center justify-content-center" style="text-decoration: none; display: flex; align-items: center; justify-content: center;">
			<i class="bi bi-pencil-square fa-icon text-white" style="font-size: 1.5rem;"></i>
			<span class="ms-1 me-5" style="font-size: 0.9rem; line-height: 1;">글쓰기</span>
		</button></a>
	</div>
	</div>
	<%-- 글쓰기 버튼 --%>	
		
		
		<%-- 검색--%>	
	<form action="./mainPage" method="get">
				<div class="row"> 
					<div class="col-2">
						<select name="help_searchType" class="form-select">
							<option value="title" selected>제목</option>
							<option value="content">내용</option>
							<!-- <option value="content">제목+내용</option> -->
							<option value="nickname">작성자</option>
						</select>				
					</div>
					<div class="col-3">
						<input name="help_searchWord" type="text" class="form-control">
					</div>
					<div class="col-1 ms-3" style="position:relative; right: 30px;">
						 <button type="submit" class="btn btn-outline-dark">
						  	<span class="bi bi-search"></span>
						</button>
					</div>
				</div>
	</form>
		<%-- 검색--%>	
		
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
	
	<%--페이지 버튼  --%>
		
		
		</div>
		
		
		
		
		</div>
		<%-- 내용 공간 --%>
		
		
	
		
		<!-- 오른쪽 -->
		<div class="col">
		</div>
		<!-- 오른쪽 -->
	
	</div>
	  
      
   <%--게시판 시작 --%>

	
   <%--helpBoardList--%>
	<!-- <div class="row">
	
	 <div class="container text mt-2">
	 
	 <div class="col">
	<h4 class="text fw-bold ms-4 mb-3"> 해주세요 </h4>
	
	
	
	</div>
	</div> -->

	
	
	<%-- <%-- 
	<div class="col text-center">
		<table class="table">
			<thead class="table-secondary">
			  <tr>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>조회수</th>
				<th>좋아요</th>
				<th>작성일</th>
			  </tr>
			</thead>
			<tbody>
			<c:forEach items="${helpBoardList}" var="map">

				<tr>
				  <td><a class="text-black text-decoration-none" href="/safari/community/help/readContentPage/${map.helpDto.id}">${map.helpDto.id}</a></td>
				  <td>${map.userDto.nickname}</td>
				  <td style="text-align: left;">
				  	<div style="display: inline-block;">
				  	<a class="text-black text-decoration-none" href="/safari/community/help/readContentPage/${map.helpDto.id}" >${map.helpDto.title}</a>
				  	<c:if test="${map.helpDto.points>=1}">
				  	<span class="badge rounded-pill text-bg-warning opacity-75" style="font-size: 61%;">${map.helpDto.points}p</span>
				  	<span class="border border-1 rounded-2 p-1 border-warning" style="color: #000; font-size: 61%;">${map.helpDto.points}p</span>
				  	</c:if>
				  	<c:if test="${map.helpImgCount>=1}">
				  	<i class="bi bi-image"></i>
				  	</c:if>
				  	<c:if test="${map.helpCommentCount>=1}">
				  	<span style="font-size: 12px; color: red;">[${map.helpCommentCount}]</span>
				  	</c:if>
				  	</div>
				  </td>
				  
				  
				  <td>${map.helpDto.views}</td>
				  <td>${map.helpLikeCount}</td>
				  <td><fmt:formatDate value="${map.helpDto.reg_date}" pattern="yyyy.MM.dd"/></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		

		
	글쓰기 버튼 시작
	<div class="row">
	<div class="col text-end" >
		<a href="./writeContentPage"  style="text-decoration: none; display: flex; align-items: center; justify-content: flex-end;" >
			<i class="bi bi-pencil-square fa-icon text-dark" style="font-size: 1.5rem;"></i>
			<span class="text-dark ms-1 me-5" style="font-size: 0.9rem; line-height: 1;">글쓰기</span>
		</a>
	</div>
	</div>
	글쓰기 버튼 끝	
	
	new 검색 
	<form action="./page" method="get">
				<div class="row"> 
					<div class="col-2">
						<select name="promoReview_searchType" class="form-select">
							<option value="title" selected>제목</option>
							<option value="content">내용</option>
							<option value="content">제목+내용</option>
							<option value="nickname">작성자</option>
						</select>				
					</div>
					<div class="col-3">
						<input name="promoReview_searchWord" type="text" class="form-control">
					</div>
					<div class="col-1 ms-1" style="position:relative; right: 30px;">
						 <button type="submit" class="btn btn-outline-dark">
						  	<span class="bi bi-search"></span>
						</button>
					</div>
				</div>
	</form>
	


 
	 검색창
	 
	<style>
	.pagination .page-link {
    color: black !important;
	}
	</style>
	
		<div class="row">페이지 버튼
			<div class="col-5 mx-auto mt-3 mb-3">
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
</div>	 --%> 
<%--게시판 끝 --%>
	
	

	
	
	
	<!-- 푸터 섹션 -->
	<jsp:include page="../../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

</body>	
</html>	



