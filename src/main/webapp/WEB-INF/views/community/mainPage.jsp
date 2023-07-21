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
		<div class = "col-auto">
				<h1 class="text-start fs-3 fw-semibold ">
					<b>커뮤니티</b>
				</h1>			
			</div>
			
			<div class = "col mx-3 d-flex align-items-center">
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
		<div class = "col" >
			<img src="/safari/resources/img/community/banerer4.png" class="img-fluid">
		</div>
	</div>
	
	<%-- 첫번째 줄 --%>
	<div class = "row mt-4">
		<div class = "col">
			<div class = "row">
				<%-- 최근 게시글 모음 --%>
				<div class = "col card border border-1 mx-3 shadow-sm"  style="height: 250px;">
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
				<%-- 인기 게시글  --%>
				<div class = "col card border border-1 mx-3 shadow-sm" style=" height: 250px;">
					<div class = "row">
						<div class = "col fs-5 mt-2 mx-2 fw-semibold">
							인기 게시글
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
				
				<%-- 해주세요 --%>
				<div class = "col card border border-1 mx-3 shadow-sm" style="height: 250px;">
					<div class = "row">
						<div class = "col fs-5 mt-2 mx-2 fw-semibold">
							해주세요
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
	</div>

	
	<%-- 두번쨰 줄 --%>
	<div class = "row mt-4">
		<div class = "col-7">
			<div class = "row">
			<%-- 리워드 리뷰 --%>
				<div class = "col card border border-1 mx-3 shadow-sm" style="height: 260px;">
					<div class = "row">
						<div class = "col fs-5 mt-2 mx-2 fw-semibold">
							리워드 리뷰
						</div>
						<div class = "col-1 p-0 me-3 d-flex align-items-center justify-content-end text-secondary">
						<!--  공유버튼 -->
							<a href="./promotion/promotionReviewMainPage" onclick="clip(); return false;" style="text-decoration: none; color: inherit;">
								<span class = "bi bi-three-dots fs-5"></span>
							</a>
						</div>
						<div class = "row">
				 			<c:forEach items="${newPostBypromoReviewList}" var="map" varStatus="status" begin="0" end="3">  
							<div class = "col">
								<div class = "row mt-3">
									<div class = "col mx-2">
										<a href="./contentPromotionReviewPage?id=${map.promotionReviewDto.id}" style="text-decoration: none; color: inherit; display: block;">
								  		<img src="/uploadPromoFiles/${map.promotionReviewImgList[0].rental_review_img }"
								  	   	class="card-img-top" alt="리워드게시물사진" width="90" height="110">	  
								 		</a>
									</div>
								</div>
								<div class = "row mt-2">
									<div class = "col mx-2 pe-2" style = "font-size:15px;">
										${map.promotionReviewDto.promotion_review_title} 
									</div>
								</div>
								<div class = "row">
									<div class = "col mt-1 mx-2 text-secondary text-start" style = "font-size:13px;">
									<fmt:formatDate value="${map.promotionReviewDto.reg_date}" pattern="yyyy/MM/dd" />
									 
									</div>
								</div>
							</div>
						</c:forEach>  
						</div>
					</div>
				</div> 
			</div>
		<div class = "row mt-4">
			<%-- 궁금해요 --%>
			<div class = "col card border border-1 mx-3 shadow-sm" style="height: 250px;">
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
			<%-- 구인구직 --%>

			<div class = "col card border border-1 mx-3 shadow-sm" style="height: 250px;">
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
		<%-- 골라줘요  --%>
		<div class = "col card border border-1 mx-3 shadow-sm" style="height: 530px;">
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
					<div class = "col">
						<div class = "row">
							<div class = "col-3 mx-2">
								사진
							</div>
							<div class = "col-3">
								사진
							</div>
						</div>
					</div>
				</div>
				<div class = "row mt-2">
					<div class = "col">
						<div class = "row">
							<div class = "col-3 mx-2">
								사진
							</div>
							<div class = "col-3">
								사진
							</div>
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