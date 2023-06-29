<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사파리 | 커뮤니티메인</title>

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
						
						<%-- getRecruitBoard --%>
						<div class="row">
							<div class="col">
								<form action="/safari/community/recruit/recruitWriteContentProcess" method="post" enctype="multipart/form-data">
									<input type="hidden" name="user_id" value="${sessionUser.id}">
									작성자: ${sessionUser.nickname }<br>
									제목: <input type="text" name="title"><br>
									내용: <br>
									<textarea rows="10" cols="60" name="content"></textarea>
									<br>
									직업(숫자): <input type="text" name="position_category_id">
									<br>
									연락처: <input type="text" name="phone">
									<br>
									이메일: <input type="text" name="email">
									<br>
									급여: <input type="text" name="salary">
									<br>
									위치: <input type="text" name="location">
									<br>
									모집인원: <input type="text" name="opening">
									<br>
									성별: <input type="text" name="gender">
									<br>
									나이제한: <input type="text" name="age_limit">
									<br>
									<input name="recruitFiles" type="file" multiple accept="image/*">
									<%-- 글쓰기 버튼 --%>
									<div class="col text-end ms-auto d-grid justify-content-lg-end">
										<button class="nav-link px-2 text-body-secondary">글쓰기</button>
									</div>
									<%-- 글쓰기 버튼 --%>
									
								</form>	
							</div>	
						</div>	
						<%-- getRecruitBoard --%>
			
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>