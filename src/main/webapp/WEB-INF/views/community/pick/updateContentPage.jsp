<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사파리 | 골라줘요 수정페이지</title>

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
			
			<div class="col-3">
				왼쪽
			</div>
		
			<!-- 왼쪽 -->
			
			<!-- 가운데 -->
			
				<div class="col-6">
					<div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-center">
						
						<%-- getPickBoard --%>
						<div class="row">
							<div class="col">
								<form action="/safari/community/pick/updateContentProcess" method="post" >
									<%-- <input type="hidden" name="user_id" value="${sessionUser.id}"> --%>
									제목: <input type="text" name="title" value="${map.pickDto.title}"><br>
									작성자: ${sessionUser.nickname }<br>
									
									내용: <br>
									<textarea rows="10" cols="60" name="content" >${map.pickDto.content}</textarea>
									<input type="hidden" name="id" value="${map.pickDto.id}">
									
									
									<%-- 글쓰기 버튼 --%>
									<div class="col text-end ms-auto d-grid justify-content-lg-end">
										<button class="nav-link px-2 text-body-secondary">수정</button>
									</div>
									<%--글쓰기 버튼 --%>
								
								</form>
							</div>	
						</div>
						<%-- getPickBoard --%>
						
					</div>	
				</div>	
			<!-- 가운데 -->
			
			<!-- 오른쪽 -->
			
			<div class="col-3">
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