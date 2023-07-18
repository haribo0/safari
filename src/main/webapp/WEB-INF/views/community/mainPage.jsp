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
<jsp:include page="../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->

</head>
<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->
	
	<!--  body -->
	<div class = "container main_box">
	<div class = "row mt-5">
		<div class = "col-2">
				<h1 class="text-center fs-3 fw-semibold" style="color:#ff6f0f;">
					<b>커뮤니티</b>
				</h1>			
			</div>
			<div class = "col d-flex align-items-center">
				<div class = "row text-start">
					<div class = "col">
					<a href="./pick/mainPage" style="text-decoration: none; color: inherit;">
						골라줘요
					</a>
					 <div class="vr mx-3"></div>
					<a href="./help/mainPage" style="text-decoration: none; color: inherit;">
						해주세요
					</a>
					 <div class="vr mx-3"></div>
					 <a href="./question/mainPage" style="text-decoration: none; color: inherit;">
						궁금해요
					</a>
					 <div class="vr mx-3"></div>
					<a href="./recruit/mainPage" style="text-decoration: none; color: inherit;">
						구인구직
					</a>
					 <div class="vr mx-3"></div>
					<a href="./promotion/promotionReviewMainPage" style="text-decoration: none; color: inherit;">
						리워드
					</a>
					</div>
				</div>
			</div>
	</div>
	
	<%-- 배너 --%>
	<div class = "row mt-4">
		<div class = "col">
			<img src="#" width = "1220px;" height ="200px;">
		</div>
	</div>
	
	<%-- 첫번째 줄 --%>
	<div class = "row mt-4">
		<%-- 최근게시글 모음 --%>
		<div class="card border border-1 mx-3 shadow-sm" style="width:24rem; height: 250px;">
		<div class = "col">
			<div class = "row">
				<div class = "col fs-5 mt-2 mx-2 fw-semibold">
					최근 게시글
				</div>
				<div class = "row mt-3">
					<div class = "col mx-2">
						게시물 모음
					</div>
				</div>
			</div>
		</div>
		</div>
		<%-- 해주세요  --%>
		<div class="card border border-1 mx-3 shadow-sm" style="width:24rem; height: 250px;">
		<div class = "col">
			<div class = "row">
				<div class = "col fs-5 mt-2 mx-2 fw-semibold">
					해주세요
				</div>
				<div class = "col-1 p-0 me-3 d-flex align-items-center justify-content-end text-secondary">
				<!--  공유버튼 -->
					<a href="./help/mainPage" onclick="clip(); return false;" style="text-decoration: none; color: inherit;">
						<span class = "bi bi-three-dots fs-5"></span>
					</a>
				</div>
				<div class = "row mt-3">
					<div class = "col mx-2">
						게시물 모음
					</div>
				</div>
			</div>
		</div>
		</div>
		<%-- 공지사항(임시) --%>
		<div class="card border border-1 mx-3 shadow-sm" style="width:24rem; height: 250px;">
		<div class = "col">
			<div class = "row">
				<div class = "col fs-5 mt-2 mx-2 fw-semibold">
					공지사항
				</div>
				<div class = "col-1 p-0 me-3 d-flex align-items-center justify-content-end text-secondary">
				<!--  공유버튼 -->
					<a href="" onclick="clip(); return false;" style="text-decoration: none; color: inherit;">
						<span class = "bi bi-three-dots fs-5"></span>
					</a>
				</div>
				<div class = "row mt-3">
					<div class = "col mx-2">
						게시물 모음
					</div>
				</div>
			</div>
		</div>
		</div>
	</div>
	
	<%-- 두번쨰 줄 --%>
	<div class = "row mt-4">
		<div class = "col-auto">
			<div class = "row">
			<%-- 리워드  --%>
			<div class="card border border-1 mx-3 shadow-sm" style="width:50rem; height: 250px;">
			<div class = "col">
				<div class = "row">
					<div class = "col fs-5 mt-2 mx-2 fw-semibold">
						리워드
					</div>
					<div class = "col-1 p-0 me-3 d-flex align-items-center justify-content-end text-secondary">
					<!--  공유버튼 -->
						<a href="./promotion/promotionReviewMainPage" onclick="clip(); return false;" style="text-decoration: none; color: inherit;">
							<span class = "bi bi-three-dots fs-5"></span>
						</a>
					</div>
					<div class = "row mt-3">
						<div class = "col-1 mx-2">
							사진
						</div>
						<div class = "col">
							리뷰 내용
						</div>
					</div>
				</div>
			</div>
			</div> <!--  카드 -->
			</div>
		<div class = "row mt-4">
			<%-- 궁금해요 --%>
			<div class="card border border-1 mx-3 shadow-sm" style="width:24rem; height: 250px;">
			<div class = "col">
				<div class = "row">
					<div class = "col fs-5 mt-2 mx-2 fw-semibold">
						궁금해요
					</div>
					<div class = "col-1 p-0 me-3 d-flex align-items-center justify-content-end text-secondary">
					<!--  공유버튼 -->
						<a href="./question/mainPage" onclick="clip(); return false;" style="text-decoration: none; color: inherit;">
							<span class = "bi bi-three-dots fs-5"></span>
						</a>
					</div>
					<div class = "row mt-3">
						<div class = "col mx-2">
							게시물 모음
						</div>
					</div>
				</div>
			</div>
			</div>
			<%-- 구인구직 --%>
			<div class="card border border-1 mx-3 shadow-sm" style="width:24rem; height: 250px;">
			<div class = "col">
				<div class = "row">
					<div class = "col fs-5 mt-2 mx-2 fw-semibold">
						구인구직
					</div>
					<div class = "col-1 p-0 me-3 d-flex align-items-center justify-content-end text-secondary">
					<!--  공유버튼 -->
						<a href="./recruit/mainPage" onclick="clip(); return false;" style="text-decoration: none; color: inherit;">
							<span class = "bi bi-three-dots fs-5"></span>
						</a>
					</div>
					<div class = "row mt-3">
						<div class = "col mx-2">
							게시물 모음
						</div>
					</div>
				</div>
			</div>
			</div>
		</div>
		</div>
		<%-- 골라줘요  --%>
		<div class="card border border-1 mx-3 shadow-sm" style="width:24rem; height: 550px;">
		<div class = "col">
			<div class = "row">
				<div class = "col fs-5 mt-2 mx-2 fw-semibold">
					골라줘요
				</div>
				<div class = "col-1 p-0 me-3 d-flex align-items-center justify-content-end text-secondary">
				<!--  공유버튼 -->
					<a href="./pick/mainPage" onclick="clip(); return false;" style="text-decoration: none; color: inherit;">
						<span class = "bi bi-three-dots fs-5"></span>
					</a>
				</div>
				<%-- 골라줘요 게시물 1 --%>
				<div class = "row mt-3">
					<div class = "col-3 mx-2">
						사진
					</div>
					<div class = "col-3">
						사진
					</div>
				</div>
				<div class = "row mt-1">
					<div class = "col-3 mx-2">
						사진
					</div>
					<div class = "col-3 ">
						사진
					</div>
				</div>
				<hr class="my-4" style="border-color: gray; width: 80%; margin: 0 auto;">
				<%-- 골라줘요 게시물 2 --%>
				<div class = "row mt-2">
					<div class = "col-3 mx-2">
						사진
					</div>
					<div class = "col-3">
						사진
					</div>
				</div>
				<div class = "row mt-1">
					<div class = "col-3 mx-2">
						사진
					</div>
					<div class = "col-3 ">
						사진
					</div>
				</div>
			</div>
		</div>
		</div>
	</div>
	
	<%-- 세번째 줄 --%>
	
	
	</div> <!--  <div class = "container main_box"> 닫힘 -->
	<div class = "mb-5"></div>
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->
</body>	
</html>