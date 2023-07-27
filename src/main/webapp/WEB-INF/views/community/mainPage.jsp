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
							최신 게시글
						</div>
						<div class = "row mt-3">
							<div class = "col mx-2">
				 			<c:forEach items="${newPostByCommunityList}" var="map" varStatus="status">  
								<div class = "row mt-1 py-1">
									<div class = "col-auto d-flex align-items-center" style = "font-size:13px; color: #387538; ">
										[${map.communityNewPostDto.board }]
									</div>
									<div class = "col p-0 mx-1" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
										<c:if test="${map.communityNewPostDto.board == '리워드리뷰' }">
										<a href="/safari/community/promotion/contentPromotionReviewPage?id=${map.communityNewPostDto.id}" style="text-decoration: none; color: inherit;">
											${map.communityNewPostDto.title }
										</a>
										</c:if>
										<c:if test="${map.communityNewPostDto.board == '구인구직' }">
										<a href="/safari/community/recruit/readContentPage/${map.communityNewPostDto.id}" style="text-decoration: none; color: inherit;">
											${map.communityNewPostDto.title }
										</a>
										</c:if>
										<c:if test="${map.communityNewPostDto.board == '골라줘요' }">
										<a href="/safari/community/pick/readContentPage/${map.communityNewPostDto.id}" style="text-decoration: none; color: inherit;">
											${map.communityNewPostDto.title }
										</a>
										</c:if>
										<c:if test="${map.communityNewPostDto.board == '해주세요' }">
										<a href="/safari/community/help/readContentPage/${map.communityNewPostDto.id}" style="text-decoration: none; color: inherit;">
											${map.communityNewPostDto.title }
										</a>
										</c:if>
										<c:if test="${map.communityNewPostDto.board == '궁금해요' }"> 
										<a href="/safari/community/question/questionReadContentPage/${map.communityNewPostDto.id}" style="text-decoration: none; color: inherit;">
											${map.communityNewPostDto.title }
										</a>
										</c:if>
										
										

									</div>
									<div class = "col-auto p-0 text-secondary text-end d-flex align-items-center" style = "font-size:13px;">
										<fmt:formatDate value="${map.communityNewPostDto.reg_date}" pattern="yyyy/MM/dd" />
									</div>
								</div>
							</c:forEach>  
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
		  					<c:forEach items="${bestPostByCommunityList}" var="map" varStatus="status">  
								<div class = "row mt-1 py-1">
									<div class = "col-auto d-flex align-items-center" style = "font-size:13px; color: #387538; ">
										[${map.communityBestPostDto.board }]
									</div>
									<div class = "col p-0 mx-1" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
										<c:if test="${map.communityBestPostDto.board == '리워드리뷰' }">
										<a href="/safari/community/promotion/contentPromotionReviewPage?id=${map.communityBestPostDto.id}" style="text-decoration: none; color: inherit;">
											${map.communityBestPostDto.title }
										</a>
										</c:if>
										<c:if test="${map.communityBestPostDto.board == '구인구직' }">
										<a href="/safari/community/recruit/readContentPage/${map.communityBestPostDto.id}" style="text-decoration: none; color: inherit;">
											${map.communityBestPostDto.title }
										</a>
										</c:if>
										<c:if test="${map.communityBestPostDto.board == '골라줘요' }">
										<a href="/safari/community/pick/readContentPage/${map.communityBestPostDto.id}" style="text-decoration: none; color: inherit;">
											${map.communityBestPostDto.title }
										</a>
										</c:if>
										<c:if test="${map.communityBestPostDto.board == '해주세요' }">
										<a href="/safari/community/help/readContentPage/${map.communityBestPostDto.id}" style="text-decoration: none; color: inherit;">
											${map.communityBestPostDto.title }
										</a>
										</c:if>
										<c:if test="${map.communityBestPostDto.board == '궁금해요' }"> 
										<a href="/safari/community/question/questionReadContentPage/${map.communityBestPostDto.id}" style="text-decoration: none; color: inherit;">
											${map.communityBestPostDto.title }
										</a>
										</c:if>
										
										

									</div>
									<div class = "col-auto p-0 text-secondary text-end d-flex align-items-center" style = "font-size:13px;">
										<fmt:formatDate value="${map.communityBestPostDto.reg_date}" pattern="yyyy/MM/dd" />
									</div>
								</div>
							</c:forEach> 
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
							<a href="./help/mainPage" onclick="clip(); return false;" style="text-decoration: none; color: inherit;">
								<span class = "bi bi-three-dots fs-5"></span>
							</a>
						</div>
						<div class = "row mt-3">
							<div class = "col mx-2">
							<c:forEach items="${newPostByHelpList}" var="map" varStatus="status" begin="0" end="4">  
								<div class = "row mt-1 py-1">
									<div class = "col-auto d-flex align-items-center" style = "font-size:13px; color: #387538; ">
										[${map.helpDto.points }p]
									</div>
									<div class = "col p-0 mx-1" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
										<a href="/safari/community/help/readContentPage/${map.helpDto.id}" style="text-decoration: none; color: inherit;">
											${map.helpDto.title }
										</a>
									</div>
									<div class = "col-auto p-0 text-secondary text-end d-flex align-items-center" style = "font-size:13px;">
										<fmt:formatDate value="${map.helpDto.reg_date}" pattern="yyyy/MM/dd" />
									</div>
								</div>
							</c:forEach>
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
						<a href="./promotion/promotionReviewMainPage" onclick="clip(); return false;" style="text-decoration: none; color: inherit;">
							리워드 리뷰
						</a>
						</div>
						<div class = "col-1 p-0 me-3 d-flex align-items-center justify-content-end text-secondary">
						<!--  공유버튼 -->
							<a href="./promotion/promotionReviewMainPage" onclick="clip(); return false;" style="text-decoration: none; color: inherit;">
								<span class = "bi bi-three-dots fs-5"></span>
							</a>
						</div>
						<div class = "row">
				 			<c:forEach items="${newPostByPromoReviewList}" var="map" varStatus="status" begin="0" end="3">  
							<div class = "col">
							<a href="./promotion/contentPromotionReviewPage?id=${map.promotionReviewDto.id}" style="text-decoration: none; color: inherit; display: block;">
								<div class = "row mt-3">
									<div class = "col mx-2">
								  		<img src="/uploadPromoFiles/${map.promotionReviewImgList[0].rental_review_img }"
								  	   	class="card-img-top" alt="리워드게시물사진" width="100" height="120">	  
									</div>
								</div>
								<div class = "row mt-2">
									<div class = "col mx-2 pe-2 fw-semibold" style = "font-size:15px;">
										${map.promotionReviewDto.promotion_review_title} 
									</div>
								</div>
								<div class = "row">
									<div class = "col mt-1 mx-2 text-secondary text-start" style = "font-size:13px;">
									<fmt:formatDate value="${map.promotionReviewDto.reg_date}" pattern="yyyy/MM/dd" />
									</div>
								</div>
							</a>
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
							<c:forEach items="${newPostByQuestionList}" var="map" varStatus="status" begin="0" end="4">  
								<div class = "row mt-1 py-1">
									<div class = "col-auto d-flex align-items-center" style = "font-size:13px; color: #387538; ">
										[${map.questionDto.points }p]
									</div>
									<div class = "col p-0 mx-1" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
										<a href="/safari/community/question/questionReadContentPage/${map.questionDto.id}" style="text-decoration: none; color: inherit;">
											${map.questionDto.title }
										</a>
									</div>
									<div class = "col-auto p-0 text-secondary text-end d-flex align-items-center" style = "font-size:13px;">
										<fmt:formatDate value="${map.questionDto.reg_date}" pattern="yyyy/MM/dd" />
									</div>
								</div>
							</c:forEach>
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
							<c:forEach items="${newPostByRecruitList}" var="map" varStatus="status" begin="0" end="4">  
								<div class = "row mt-1 py-1">
									<div class = "col-auto d-flex align-items-center" style = "font-size:13px; color: #387538; ">
										[${map.recruitDto.location }]
									</div>
									<div class = "col p-0 mx-1" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
										<a href="/safari/community/recruit/readContentPage/${map.recruitDto.id}" style="text-decoration: none; color: inherit;">
											${map.recruitDto.title }
										</a>
									</div>
									<div class = "col-auto p-0 text-secondary text-end d-flex align-items-center" style = "font-size:13px;">
										<fmt:formatDate value="${map.recruitDto.reg_date}" pattern="yyyy/MM/dd" />
									</div>
								</div>
							</c:forEach>
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
				<%-- 골라줘요 게시물 --%>
				<!--  포이치 -->
				<div class = "row mt-4">
					<div class = "col fw-semibold" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
						제목
					</div>
					<div class = "col-auto p-0 text-secondary text-end" style = "font-size:13px;">
						날짜
					</div>
				</div>
				<div class = "row mt-2 mx-2">
					<div class = "col-2">
						사진
					</div>
					<div class = "col-2">
						사진
					</div>
					<div class = "col-2">
						사진
					</div>
					<div class = "col-2">
						사진
					</div>
				</div>
				<!--  포이치  끝 -->
			</div>
		</div>

	</div>
	
	
	</div> <!--  <div class = "container main_box"> 닫힘 -->
	<div class = "mb-5"></div>
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->
</body>	
</html>
