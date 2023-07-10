<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 메타 섹션 -->
<jsp:include page="../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 --> 
</head>
<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->
	
	<!-- 마이페이지 상단 블럭 -->
	<jsp:include page="../common/myPageTop.jsp"></jsp:include>
	<!-- 마이페이지 상단 블럭 -->

	<div class="container d-flex mt-5 px-0">
		<div class="row w-100">
			<!-- 마이페이지 nav -->
			<jsp:include page="../common/myPageNav.jsp"></jsp:include>
			<!-- 마이페이지 nav -->
			
			<!--  Body -->
			<div class="col ms-4">
				<div class="row" style="border-bottom: 2px solid #222; height: 48px;">
					<div class="col p-0">				
						<h5>작성한 게시글</h5>		
					</div>
					<div class = "col-4 p-0">
						<h5>작성한 댓글</h5>
					</div>
				</div>	

				<div class = "row mt-3">
					<!--  게시물  -->
					<div class = "col">
						<div class = "row mt-3">
							<div class = "col">
							
							<ul class="nav nav-tabs" id="myTab" role="tablist">
							  <li class="nav-item" role="presentation">
							    <button class="nav-link active fw-semibold" id="pick-tab" data-bs-toggle="tab" data-bs-target="#pick-tab-pane"
							    	type="button" role="tab" aria-controls="pick-tab-pane" aria-selected="true" style="color: black;">골라줘요</button>
							  </li>
							  <li class="nav-item" role="presentation">
							    <button class="nav-link fw-semibold" id="help-tab" data-bs-toggle="tab" data-bs-target="#help-tab-pane"
							    	type="button" role="tab" aria-controls="help-tab-pane" aria-selected="false" style="color: black;">해주세요</button>
							  </li>
							  <li class="nav-item" role="presentation">
							    <button class="nav-link fw-semibold" id="question-tab" data-bs-toggle="tab" data-bs-target="#question-tab-pane"
							    	type="button" role="tab" aria-controls="question-tab-pane" aria-selected="false" style="color: black;">궁금해요</button>
							  </li>
							  <li class="nav-item" role="presentation">
							    <button class="nav-link fw-semibold" id="recruit-tab" data-bs-toggle="tab" data-bs-target="#recruit-tab-pane"
							    	type="button" role="tab" aria-controls="recruit-tab-pane" aria-selected="false" style="color: black;">구인구직</button>
							  </li>
							  <li class="nav-item" role="presentation">
							    <button class="nav-link fw-semibold" id="proreview-tab" data-bs-toggle="tab" data-bs-target="#proreview-tab-pane"
							    	type="button" role="tab" aria-controls="proreview-tab-pane" aria-selected="false" style="color: black;">리워드</button>
							  </li>
							</ul>
							
							<div class = "myPostList mt-3">
							<div class="tab-content" id="myTabContent">
								<div class="tab-pane fade show active" id="pick-tab-pane" role="tabpanel" aria-labelledby="pick-tab" tabindex="0">
									골라줘요 내용	
								</div>
								<div class="tab-pane fade" id="help-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
									해주세요 내용
								</div>
								<div class="tab-pane fade" id="question-tab-pane" role="tabpanel" aria-labelledby="question-tab" tabindex="0">
									궁금해요 내용
								</div>
								<div class="tab-pane fade" id="recruit-tab-pane" role="tabpanel" aria-labelledby="recruit-tab" tabindex="0">
									구인구직 내용
								</div>
								<div class="tab-pane fade" id="proreview-tab-pane" role="tabpanel" aria-labelledby="proreview-tab" tabindex="0">
									<!--  리워드 내용 (아직 틀만 잡음) -->
									<div class= "row">
										<div class = "col">
										<c:forEach items="${proreviewByMyPost}" var="map" varStatus="status"> 
											<div class = "row">
												<div class = "col">
												 	<div class= "row">
												 		<div class = "col">
												 			제목 : ${map.promotionReviewDto.promotion_review_title }
												 		</div>
												 		<div class = "col"></div>	 
												 	</div>
												 	<div class = "row mt-2">
												 		<div class = "col">
												 			내용 : ${map.promotionReviewDto.promotion_review_content}
												 		</div>
												 	</div>
												 	<div class = "row mt-2">
												 		<div class = "col">
												 			닉네임 : ${map.userDto.nickname}
												 		</div>
												 	</div>
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
						
						
						
					</div>
					<!--  댓글 -->
					<div class = "col-4">
						<!--  골라줘요 댓글 -->
						<div class = "row">
							<div class = "col fw-semibold">
								골라줘요
							</div>
						</div>
						<div class = "row mt-2">
							<div class = "col">
								댓글 5개
							</div>
						</div>
						<hr class="my-4" style="border-color: gray;">
						<!-- 해주세요 댓글  -->
						<div class = "row">
							<div class = "col fw-semibold">
								해주세요
							</div>
						</div>
						<div class = "row mt-2">
							<div class = "col">
								댓글 5개
							</div>
						</div>
						<hr class="my-4" style="border-color: gray;">
						<!--  궁금해요 댓글 -->
						<div class = "row">
							<div class = "col fw-semibold">
								궁금해요
							</div>
						</div>
						<div class = "row mt-2">
							<div class = "col">
								댓글 5개
							</div>
						</div>
						<hr class="my-4" style="border-color: gray;">
						<!--  구인구직 댓글 -->
						<div class= "row">
							<div class= "col fw-semibold">
								구인구직
							</div>
						</div>
						<div class = "row mt-2">
							<div class = "col">
								댓글 5개
							</div>
						</div>
						<hr class="my-4" style="border-color: gray;">
						<!-- 리워드 댓글 -->
						<div class= "row">
							<div class= "col fw-semibold">
								리워드
							</div>
						</div>
						<div class = "row mt-2">
							<div class = "col">
								댓글 5개
							</div>
						</div>
					</div>
				</div>









			</div>

		</div>
	</div> <!--  <div class="container d-flex mt-5 px-0"> 마지막 -->
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->
</body>
</html>