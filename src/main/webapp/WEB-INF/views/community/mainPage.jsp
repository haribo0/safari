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
<style>
  .custom-badge {
    font-size: 6px;
    line-height: 1;
    height: 16px;
    padding: 2px 6px;
  }
  
      /* 이미지 크롭 골라줘요 */
	 .cropped-image-pick {
	   width: ;
	   height: ;
	   object-fit: cover;
	 }
</style>
</head>
<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->
	
	<!--  body -->
	<div class = "container main_box">
	<div class = "row mt-5">
		<div class = "col-auto">
				<h1 class="text-start fs-3 fw-semibold">
					<a href="/safari/community/mainPage" style="text-decoration: none; color: inherit;">
						<b>커뮤니티</b>
					</a>
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
						리워드 리뷰
					</a>
					</div>
				</div>
			</div>
	</div>
	
	<%-- 배너 --%>
	<div class = "row mt-4">
		<div class = "col" >
			<div id="carouselExample" class="carousel slide">
				  <div class="carousel-inner">
				    <div class="carousel-item active">
				      <a href="${pageContext.request.contextPath}/community/mainPage">
				      	<img src="${pageContext.request.contextPath}/resources/img/community/banerer4.png" class="img-fluid">
				      </a>
				    </div>
				    <div class="carousel-item">
				      <a href="${pageContext.request.contextPath}/community/mainPage">
				      	<img src="${pageContext.request.contextPath}/resources/img/community/banerer5.png" class="d-block w-100" alt="...">
				      </a>
				    </div>
				    <div class="carousel-item">
				      <a href="${pageContext.request.contextPath}/rental/mainPage">
				      	<img src="${pageContext.request.contextPath}/resources/img/rental/rental_banner_3.jpg" class="d-block w-100" alt="...">
				      </a>
				    </div>
				  </div>
				  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Previous</span>
				  </button>
				  <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Next</span>
				  </button>
				</div>
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
							<div class = "col ms-3">
							<c:forEach items="${newPostByHelpList}" var="map" varStatus="status" begin="0" end="4">  
								<div class = "row mt-1 py-1">
									<div class = "col-auto d-flex align-items-center badge rounded-pill text-bg-warning opacity-75 custom-badge" style="position: relative; top: 6px;">
										${map.helpDto.points }p
									</div> 
									<div class = "col p-0 mx-2" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
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
									<div class = "col mx-2 pe-2 fw-semibold" style = "font-size:15px; height:45px;">
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
						<div class = "col ms-3">
							<c:forEach items="${newPostByQuestionList}" var="map" varStatus="status" begin="0" end="4">  
								<div class = "row mt-1 py-1">
									<c:if test="${map.questionDto.points>=1}">
									<div class = "col-auto d-flex align-items-center badge rounded-pill text-bg-warning opacity-75 custom-badge" style="position: relative; top: 6px;">
										${map.questionDto.points }p
									</div>
									</c:if>
									<div class = "col p-0 mx-2" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
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
									<div class = "col-auto d-flex align-items-center" style = "font-size:13px; color: ; ">
									
										
											<%-- 구인구직 카테고리  --%>
											<span id="positionName_${map.recruitDto.id}" class="badge rounded-pill mt-1 " style="font-size: 12px; position: relative; top: -3px; color: #0095ff; background-color: transparent; border: 1px solid #0095ff;"></span>
									<script>
											 // 시작
											    var positionCode = ${map.recruitDto.position_category_id};

											    // 직무 코드에 따라 직무명 설정
											    var positionName;
											    switch (positionCode) {
											        case 11:
											            positionName= "사무";
											            //document.getElementById("positionName_${recruitDto.recruitDto.id}").style.color = "red";
											            break;
											        case 12:
											            positionName= "연구";
											            break;
											        case 13:
											            positionName= "기술";
											            break;
											        case 14:
											            positionName= "영업";
											            break;
											        
											        case 21:
											            positionName= "서비스";
											            break;
											        case 22:
											            positionName= "예술";
											            break;
											        case 23:
											            positionName= "스포츠";
											            break;
											        
											        case 31:
											            positionName= "보건";
											            break;
											        case 32:
											            positionName= "교육";
											            break;
											        case 33:
											            positionName= "금융";
											            break;

											        case 41:
											            positionName= "물류";
											            break;
											        case 42:
											            positionName= "생산";
											            break;
											             
											        default:
											            positionName= "기타";
											            break;
											    }
											     
											 
											    switch (Math.floor(positionCode/10)) {
										        case 1:
										            document.getElementById("positionName_${map.recruitDto.id}").style.color = "#0095ff";
										            document.getElementById("positionName_${map.recruitDto.id}").style.borderColor = "#0095ff";
										            break;
										        
										        case 2:
										        	document.getElementById("positionName_${map.recruitDto.id}").style.color = "#ff9200";
										        	document.getElementById("positionName_${map.recruitDto.id}").style.borderColor = "#ff9200";
										            break;
										       
										        
										        case 3:
										        	document.getElementById("positionName_${map.recruitDto.id}").style.color = "#93c400";
										        	document.getElementById("positionName_${map.recruitDto.id}").style.borderColor = "#93c400";
										            break;
										       

										        case 4:
										        	document.getElementById("positionName_${map.recruitDto.id}").style.color = "#7a45e6";
										        	document.getElementById("positionName_${map.recruitDto.id}").style.borderColor = "#7a45e6";
										            break;
										        
										             
										        default:
										        	document.getElementById("positionName_${map.recruitDto.id}").style.color = "gray";
										            break;
										    }
											    
											    // 결과를 화면에 출력
											    document.getElementById("positionName_${map.recruitDto.id}").textContent = positionName;
											    //console.log( document.getElementById("positionName_${recruitDto.recruitDto.id}").textContent);
												// 끝
											</script>
											<%-- 구인구직 카테고리  --%>
										
									</div>
									<div class = "col p-0 me-1" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
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
				<!--  포이치 
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
				</div>-->
				
				<%-- 골라줘요 forEach --%>
				<div class="m-2">
				<c:forEach items="${newPostByPickList}" var="map" varStatus="status" begin="0" end="2">  
				<a href="/safari/community/pick/readContentPage/${map.pickDto.id}" style="text-decoration: none; color: inherit;">
										
										
								<div class = "row mt-4 py-1">
								<div class = "col fw-semibold">
								${map.pickDto.title }
								</div>
								
								<div class = "col-auto me-4 text-secondary text-end d-flex align-items-center" style = "font-size:13px;">
									<fmt:formatDate value="${map.pickDto.reg_date}" pattern="yyyy/MM/dd" />
								</div>
								</div>
								
								<div class = "row mt-1 py-1">
								
								<c:forEach items="${map.pickOptionValuesForVoteDtoList}" var="pickOptionValuesForVoteDto">
								<div class = "col">
									<div class="d-flex justify-content-center" style="height: 80px; width: 80px;">
											<img class="img-fluid rounded d-block cropped-image-pick" src="/uploadFiles/${pickOptionValuesForVoteDto.img}" 
													     alt="..." style="height: %; width: %;">
														</div>		  
								</div>
								</c:forEach>
								
								</div>
								
								</a>
							</c:forEach>
							</div>
				<%-- 골라줘요 forEach --%>
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
