<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사파리 | 골라줘요 상세보기</title>

<!-- 메타 섹션 -->
<jsp:include page="../../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->

</head>


<body>
		<!-- 헤더 섹션 -->
		<div class="row">
			<div class="col">
				<jsp:include page="../../common/header.jsp"></jsp:include>
			</div>
		</div>
		<!-- 헤더 섹션 -->
	
		<!-- 커뮤니티 메뉴바 -->
		<div class="row">
			<div class="col">
				<jsp:include page="../../community/communityTopNavi.jsp"></jsp:include>
			</div>
		</div>
		<!-- 커뮤니티 메뉴바 -->
	
		<!-- 커뮤니티 컨테이너 -->
		<div class="container main_box">
			<div class="row">
			
			<!-- 왼쪽 -->
			<div class="col" style="background-color:lightgrey;">
				왼쪽
			</div>
			<!-- 왼쪽 -->
			
			<!-- 가운데 -->
			<div class="col" >
				<div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-center">
					
					<%-- pickBoardList --%>
					<div class="row">
						<div class="col" style="width:990px;"> 
						
						<div class="row">
							<div class="col" > 
							<%-- <div style="display: inline-flex;"> --%>
								<strong>(프로필사진) ${map.userDto.nickname }</strong>
								</div>
								
							<div class="col">
								<div style="display: flex; justify-content: flex-end;">  
								<c:if test="${sessionUser.id == map.userDto.id}">
									<a href="/safari/community/pick/updateContentPage/${map.pickDto.id}" class="nav-link px-2 text-body-secondary"><i class="bi bi-pencil-square"></i></a>
									<a href="/safari/community/pick/deleteContentProcess/${map.pickDto.id}" class="nav-link px-2 text-body-secondary"><i class="bi bi-eraser-fill"></i></a>
								</c:if><br></div>
							</div>
						</div>
								
								<div style="color: grey; font-size: 12px; font-family: 'Noto Sans', sans-serif;">(프로필사진) <fmt:formatDate value="${map.pickDto.reg_date}" pattern="yyyy.MM.dd"/></div>
								<br><div style="font-size: 24px; font-family: 'Noto Sans', sans-serif;"><strong>${map.pickDto.title }</strong></div><br>
								내용: ${map.pickDto.content }<br>
							
								
								
								<%-- 좋아요 --%>
								<br>
								<div style="text-align: center; font-size: 18px;">
								 <button onclick='location.href="/safari/community/pick/insertPickLikeProcess/${map.pickDto.id}"' style="background: none; border: none; padding: 0;">
									<i id="likeIcon" class="bi-heart${PickBoardLikeCount > 0 ? "-fill" : ""}" style="color: red;"></i>
	  							 </button>
								<span style="color: grey;">${PickBoardLikeCount}</span>
								</div>
								<%-- 좋아요 --%>
								
								<%-- 목록으로 버튼 --%>
								<div class="row">
									<div class="col text-end ms-auto d-grid">
										<a href="/safari/community/pick/mainPage" class="nav-link px-2 text-body-secondary"> 목록으로 </a>
										
									</div>
								</div>
								<%-- 목록으로 버튼 --%>
							
								<%-- 댓글작성 --%>
								<div class="row">
								<div class="col">
								<hr>
								</div>
								</div>
								<%-- 댓글작성 --%>
								
								<%-- 댓글 폼 --%>
								<form action="/safari/community/pick/writeCommentProcess/${map.pickDto.id}" method="post">
									<%-- <input type="hidden" name="user_id" value="${sessionUser.id}">--%>
									<input type="hidden" name="pick_id" value="${map.pickDto.id}">
									
									
									<div class="row mt-2">
									(프로필사진)<div class="col-10">
										<input type="text" class="form-control" name="content">
									</div>
										<div class="col d-grid">
											<button class="btn btn-secondary" type="submit"><i class="bi bi-chat-text"></i></button>
											</div>
									</div>
								</form>
								<%-- 댓글 폼 --%>
								
								<%-- 댓글 조회 --%>
								<div class="row">
								<div class="col">
								<br>
								
								<c:forEach items="${pickCommentsList}" var="pickCommentDto">
								<form action="/safari/community/pick/deleteCommentProcess/${pickCommentDto.pickCommentDto.id}" method="post">
									<span class="fw-bold" style="font-size: 15px">${pickCommentDto.userDto.nickname}</span>&nbsp;

									<span style="color: grey; font-size: 12px; font-family: 'Noto Sans', sans-serif;"><fmt:formatDate value="${pickCommentDto.pickCommentDto.reg_date}" pattern="yyyy.MM.dd HH:mm"/>
									</span> 
									
									<input type="hidden" value="${pickCommentDto.pickCommentDto.id}" name="id"> <%-- 댓글의 ID --%>
									<input type="hidden" value="${map.pickDto.id}" name="pick_id"> <%-- 게시글의 ID --%>
									
									
									<div style="display: flex; align-items: center;">
									  <input type="text" class="form-control border-0 bg-transparent" value="${pickCommentDto.pickCommentDto.content}" style="box-shadow: none; caret-color: transparent; flex-grow: 1; margin-right: -5px;">
									  <button style="background: none; border: none; padding: 0; margin-left: -5px;"> <i class="bi bi-x-circle" style="color: red;"></i> </button>
									</div>
									<hr>
									
								</form>
								</c:forEach>
								</div>
								</div>
								<%-- 댓글 조회 --%>
								
							
								
						</div>	
					</div>	
					<%-- pickBoardList --%>
						
				</div>	
			</div>
			<!-- 가운데 -->
			
			
			<!-- 오른쪽 -->
			<div class="col" style="background-color:lightgrey;">
				오른쪽
			</div>
			<!-- 오른쪽 -->
			
			</div>
		</div>
		<!-- 커뮤니티 컨테이너 -->
	
	
	
		<!-- 푸터 섹션 -->
		<div class="row">
			<div class="col">
				<jsp:include page="../../common/footer.jsp"></jsp:include>
			</div>
		</div>
		<!-- 푸터 섹션 -->	

</body>
</html>