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
			<div class="col" style="background-color:lightgrey;">
				왼쪽
			</div>
			<!-- 왼쪽 -->
			
			<!-- 가운데 -->
			<div class="col">
				<div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-center">
					
					<%-- getPickBoard --%>
					<div class="row">
						<div class="col" style="width:990px; margin: 0 auto;">
						
						
						<%-- write from--%>
						<form action="/safari/community/pick/updateContentProcess" method="post">
							   
							<%-- headline --%>
							<div class="row">
								
								<div class="col-10">
									<strong style="font-size: 24px;">글쓰기 페이지<br></strong>
								</div>
								
								<div class="col d-grid justify-content-end mr-2">
									<button class="nav-link px-2 text-body-secondary"><i class="bi bi-pencil-square"></i></button>
								</div>
							</div><hr>
							<%-- headline --%>
								
							<%-- write content --%>
							<div class="row">
								<div class="col d-grid">
								
									<input type="hidden" name="user_id" value="${sessionUser.id}">
								    
								    <div class="form-group">
								      <div class="form-control justify-content-end mt-2 mb-2" style="font-size: ; font-family: 'Noto Sans', sans-serif; box-shadow: none;">
								        <textarea rows="10" name="content"  style="width: 100%; border: none; outline: none; padding: 0;">${map.pickDto.content.trim()}</textarea>
								        <input type="hidden" name="id" value="${map.pickDto.id}">
								      </div>
								    </div>
									
								</div>	
							</div>
							<%-- write content --%>
							
							</form>
							<%-- write from--%>	
						
						</div>	
					</div>
					<%-- getPickBoard --%>
					
				</div>	
			</div>	
			<!-- 가운데 -->
			
			<!-- 오른쪽 -->
			<div class="col" style="background-color:lightgrey;">
				오른쪽
			</div>
			<!-- 오른쪽 -->
			
			</d iv>
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