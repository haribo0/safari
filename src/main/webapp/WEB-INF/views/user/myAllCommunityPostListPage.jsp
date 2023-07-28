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
<style>
.square-img-container {
  width: 120px;
  height: 120px;
  margin: auto;
}

.square-img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}
</style>
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
				</div>	

				<!--  게시물  -->
				<div class = "row mt-3">
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
							
							<!--  내가 쓴 게시물(내용) -->
							<div class = "myPostList mt-3">
							<div class="tab-content" id="myTabContent">
								<!--  골라줘요 내가 쓴 게시글 -->
								<div class="tab-pane fade show active" id="pick-tab-pane" role="tabpanel" aria-labelledby="pick-tab" tabindex="0">		
									<div class= "row mt-1 ">
										<c:if test="${empty pickByMyPost}">
											<div class = "col">
												아직 작성한 게시글이 없습니다.
											</div>
										</c:if>
							 			<c:forEach items="${pickByMyPost}" var="map" varStatus="status"> 
										<div class = "col">
											<div class = "row mb-4 mx-0 card border border-1" style = "width: 500px;" >
												<div class = "col">
													<div class = "row">
														<div class = "col">
															<div class= "row mt-1">
																<div class = "col">
																	카테고리
																</div>
															</div>
											<%-- 	 	<div class= "row mt-1"> 제목이 없어 고민..
														 		<div class = "col fw-semibold fs-6" style="display: -webkit-box; -webkit-line-clamp: 1; -webkit-box-orient: vertical; overflow: hidden;">
															 		<a href="../../safari/community/recruit/readContentPage?id=${map.RecruitDto.id }" style="text-decoration: none; color: inherit;">
															 		<!--  	${map.pickDto.title } -->
															 		</a>
														 		</div>
														 	</div>  --%>
														 	<div class = "row">
														 		<div class = "col" style="display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden;">
															 		<a href="/safari/community/pick/readContentPage/${map.pickDto.id}" style="text-decoration: none; color: inherit;">
															 		  	${map.pickDto.content}
															 		</a>			 		
														 		</div>
														 	</div>
														 	<div class = "row mt-1 mb-1">
														 		<div class = "col" style = "color:gray;">
														 		  		${map.userDto.nickname} 
														 		</div>
														 		<div class = "col text-end text-secondary">
														 			<i class="bi bi-chat-square-dots"></i>
														 				${map.countPickComment }
														 			&nbsp;
														 			<i class="bi bi-heart"></i>
														 				${map.countLikeByPick }
														 		</div>
														 	</div>
														</div>								
													</div>
												</div>
											</div>
										</div>
										<c:if test="${status.count % 2 == 0}">
									</div>
											<div class = "row">
										</c:if>							
										</c:forEach>   
									</div>			
								</div>
								
								<!--  해주세요 내가 쓴 게시글 -->
								<div class="tab-pane fade" id="help-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">	
									<div class= "row mt-1 ">
										<c:if test="${empty helpByMyPost}">
											<div class = "col">
												아직 작성한 게시글이 없습니다.
											</div>
										</c:if>
							  			<c:forEach items="${helpByMyPost}" var="map" varStatus="status"> 
										<div class = "col">
											<div class = "row mb-4 mx-0 card border border-1" style = "width: 500px;">
												<div class = "col">
													<div class = "row">
														<div class = "col">
															<div class= "row mt-1">
																<div class = "col">
																	카테고리
																</div>
															</div>
														 	<div class= "row mt-1">
														 		<div class = "col fw-semibold fs-6" style="display: -webkit-box; -webkit-line-clamp: 1; -webkit-box-orient: vertical; overflow: hidden;">
															 		<a href="/safari/community/help/readContentPage/${map.helpDto.id}" style="text-decoration: none; color: inherit;">
															 		 	${map.helpDto.title } 
															 		</a>
														 		</div>
														 	</div>
														 	<div class = "row">
														 		<div class = "col" style="display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden;">
															 		<a href="/safari/community/help/readContentPage/${map.helpDto.id}" style="text-decoration: none; color: inherit;">
															 		 	${map.helpDto.content} 
															 		</a>			 		
														 		</div>
														 	</div>
														 	<div class = "row mt-1 mb-1">
														 		<div class = "col" style = "color:gray;">
														 		 	${map.userDto.nickname} 
														 		</div>
														 		<div class = "col text-end text-secondary">
														 			<i class="bi bi-chat-square-dots"></i>
														 				${map.countHelpComment }
														 			&nbsp;
														 			<i class="bi bi-heart"></i>
														 				${map.countLikeByHelp }
														 		</div>
														 	</div>
														</div>
														<div class = "col-4 d-flex justify-content-end">
													  		<div class="square-img-container">
														 		<c:choose>
																	<c:when test="${map.helpImgDtoList[0].help_img_link}">
																  		<img src="/uploadPromoFiles/${map.helpImgDtoList[0].help_img_link}"
							  	 										  class="card-img-top" alt="해주세요게시물사진" height="120" width="120" >
															  		</c:when>
															  		<c:otherwise>
																	  	 <img src="/safari/resources/img/community/no-image.gif"
								  	 									  class="card-img-top" alt="해주세요임시사진" height="120" width="120" >
															  		</c:otherwise>
																</c:choose>
				  	 										</div>
														</div>	
														
														
																						
													</div>
												</div>
											</div>
										</div>
										<c:if test="${status.count % 2 == 0}">
									</div>
											<div class = "row">
										</c:if>							
										</c:forEach>  
									</div>							
								</div>
								
								<!--  궁금해요 내가 쓴 게시글 -->
								<div class="tab-pane fade" id="question-tab-pane" role="tabpanel" aria-labelledby="question-tab" tabindex="0">
									<div class= "row mt-1 ">
										<c:if test="${empty questionByMyPost}">
											<div class = "col">
												아직 작성한 게시글이 없습니다.
											</div>
										</c:if>
								<c:forEach items="${questionByMyPost}" var="map" varStatus="status">   
										<div class = "col">
											<div class = "row mb-4 mx-0 card border border-1" style = "width: 500px;" >
												<div class = "col">
													<div class = "row">
														<div class = "col">
															<div class= "row mt-1">
																<div class = "col">
																	카테고리
																</div>
															</div>
														 	<div class= "row mt-1">
														 		<div class = "col fw-semibold fs-6" style="display: -webkit-box; -webkit-line-clamp: 1; -webkit-box-orient: vertical; overflow: hidden;">
															 		<a href="/safari/community/question/readContentPage/${map.recruitDto.id}" style="text-decoration: none; color: inherit;">
															 		  	${map.questionDto.title }
															 		</a>
														 		</div>
														 	</div>
														 	<div class = "row">
														 		<div class = "col" style="display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden;">
															 		<a href="/safari/community/question/readContentPage/${map.recruitDto.id}" style="text-decoration: none; color: inherit;">
															 		  	${map.questionDto.content} 
															 		</a>			 		
														 		</div>
														 	</div>
														 	<div class = "row mt-1 mb-1">
														 		<div class = "col" style = "color:gray;">
														 		  	${map.userDto.nickname} 
														 		</div>
														 		<div class = "col text-end text-secondary">
														 			<i class="bi bi-chat-square-dots"></i>
														 				
														 			&nbsp;
														 				
														 			<i class="bi bi-heart"></i>
														 		</div>
														 	</div>
														</div>								
													</div>
												</div>
											</div>
										</div>
										<c:if test="${status.count % 2 == 0}">
									</div>
											<div class = "row">
										</c:if>							
							 		</c:forEach>     
									</div>								
								</div>
								
								<!--  구인구직 내가 쓴 게시글 -->
								<div class="tab-pane fade" id="recruit-tab-pane" role="tabpanel" aria-labelledby="recruit-tab" tabindex="0">
									<div class= "row mt-1 ">
										<c:if test="${empty recruitByMyPost}">
											<div class = "col">
												아직 작성한 게시글이 없습니다.
											</div>
										</c:if>
							 			<c:forEach items="${recruitByMyPost}" var="map" varStatus="status"> 
										<div class = "col">
											<div class = "row mb-4 mx-0 card border border-1" style = "width: 500px;" >
												<div class = "col">
													<div class = "row">
														<div class = "col">
															<div class= "row mt-1">
																<div class = "col">
																	카테고리
																</div>
															</div>
														 	<div class= "row mt-1">
														 		<div class = "col fw-semibold fs-6" style="display: -webkit-box; -webkit-line-clamp: 1; -webkit-box-orient: vertical; overflow: hidden;">
															 		<a href="/safari/community/recruit/readContentPage/${map.recruitDto.id}" style="text-decoration: none; color: inherit;">
															 		 	${map.recruitDto.title } 
															 		</a>
														 		</div>
														 	</div>
														 	<div class = "row">
														 		<div class = "col" style="display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden;">
															 		<a href="/safari/community/recruit/readContentPage/${map.recruitDto.id}" style="text-decoration: none; color: inherit;">
															 			${map.recruitDto.content} 
															 		</a>			 		
														 		</div>
														 	</div>
														 	<div class = "row mt-1 mb-1">
														 		<div class = "col" style = "color:gray;">
														 				${map.userDto.nickname} 
														 		</div>
														 		<div class = "col text-end text-secondary">
														 			<i class="bi bi-heart"></i>
														 				${map.countLikeByRecruit }
														 		</div>
														 	</div>
														</div>								
													</div>
												</div>
											</div>
										</div>
										<c:if test="${status.count % 2 == 0}">
									</div>
											<div class = "row">
										</c:if>							
									</c:forEach>   
									</div>
								</div>
								
								<!--  리워드 내가 쓴 게시글 -->
								<div class="tab-pane fade" id="proreview-tab-pane" role="tabpanel" aria-labelledby="proreview-tab" tabindex="0">
									<div class= "row mt-1 ">
										<c:if test="${empty proreviewByMyPost}">
											<div class = "col">
												아직 작성한 게시글이 없습니다.
											</div>
										</c:if>
										<c:forEach items="${proreviewByMyPost}" var="map" varStatus="status"> 
										<div class = "col">
											<div class = "row mb-4 mx-0 card border border-1" style = "width: 500px;" >
												<div class = "col">
													<div class = "row">
														<div class = "col">
															<div class= "row mt-2">
															<!--  카테고리 -->
																<div class = "col text-secondary" style = "font-size:13px;">
																	${map.rentalItemCategory.main_category_name}
																 	<c:if test="${map.rentalItemCategory.sub_category_name != null}">
																 	> ${map.rentalItemCategory.sub_category_name}
																 	</c:if>
																</div>
															</div>
														 	<div class= "row">
														 		<div class = "col fw-semibold fs-6" style="display: -webkit-box; -webkit-line-clamp: 1; -webkit-box-orient: vertical; overflow: hidden;">
															 		<a href="../../safari/community/promotion/contentPromotionReviewPage?id=${map.promotionReviewDto.id }" style="text-decoration: none; color: inherit;">
															 			${map.promotionReviewDto.promotion_review_title }
															 		</a>
														 		</div>
														 	</div>
														 	<div class = "row">
														 		<div class = "col" style="display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden;">
															 		<a href="../../safari/community/promotion/contentPromotionReviewPage?id=${map.promotionReviewDto.id }" style="text-decoration: none; color: inherit;">
															 			${map.promotionReviewDto.promotion_review_content}
															 		</a>			 		
														 		</div>
														 	</div>
														 	<div class = "row mt-1 mb-1">
														 		<div class = "col" style = "color:gray;">
														 			${map.userDto.nickname}
														 		</div>
														 		<div class = "col text-end text-secondary">
														 			<i class="bi bi-chat-square-dots"></i>
														 			 ${map.countPromotionReviewComment}
														 			&nbsp;
														 			<i class="bi bi-heart"></i>
														 			${map.countLikeByPromotionReview }
														 		</div>
														 	</div>
														</div>
														<div class = "col-4 d-flex justify-content-end">
															  <div class="square-img-container">
															 <img src="/uploadPromoFiles/${map.promotionReviewImgList[0].rental_review_img }"
						  	 									  class="card-img-top" alt="리워드게시물사진" height="120" width="120" >
						  	 									</div>
														</div>								
													</div>
												</div>
											</div>
										</div>
										<c:if test="${status.count % 2 == 0}">
									</div>
											<div class = "row">
										</c:if>							
										</c:forEach>
									</div>

									
									
								</div> 
							</div>
							</div>
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