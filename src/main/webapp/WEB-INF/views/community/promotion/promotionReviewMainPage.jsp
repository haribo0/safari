<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사파리 | 리워드메인</title>
<!-- 메타 섹션 -->
<jsp:include page="../../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->
<link rel="stylesheet" href="/safari/resources/style/common.css" type="text/css">
</head>
<style>
 .truncate {
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
      max-width: 300px; /* 원하는 최대 길이로 조정 */
    }
    
          
 .comment-count {
        font-size: 14px;
        color: darkgray;
    }
    
 /* 버튼 색깔 */
.orangeButton{
	background: #ff6f0f;
	font-weight: bold;
	color: white;
}
.orangeButton:hover {
      outline: 2px solid orange;
      /* hover 상태일 때의 스타일 */
 }
</style>
<script>
//좋아요 토글
let mySessionId = null;

function getSessionId(){
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			if(response.result == "success"){
				mySessionId = response.id;
			}
		}
	}

	xhr.open("get", "../../user/getMyId", false);
	xhr.send();
}


function togglePromotionReviewLike(reviewId){
	if(mySessionId == null){
		if(confirm("로그인을 하셔야 이용가능합니다. 로그인 하시겠습니까?")){
			location.href = "../../user/loginPage";				
		}
		
		return;
	}	
	
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			refreshMyHeart(reviewId);
		}
	}
	
	xhr.open("get", "./togglePromotionReviewLike?review_id=" + reviewId);
	xhr.send();		
}


function refreshMyHeart(reviewId){
	
	if(mySessionId == null) return;	
	
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			// js 렌더링... 작업..
			const heartBox = document.getElementById("heartBox"+reviewId);
			
			if(response.isLiked){
				heartBox.classList.remove("bi-heart");
				heartBox.classList.add("bi-heart-fill");
			}else{
				heartBox.classList.remove("bi-heart-fill");
				heartBox.classList.add("bi-heart");
			}

			
		}
	}
	
	
	//get
	xhr.open("get", "./promoReviewIsLiked?review_id=" + reviewId);
	xhr.send();
	
}

window.addEventListener("DOMContentLoaded", function(){
	
	getSessionId();

});
</script>
<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->


	

	<div class="container main_box">
		<div class = "row mt-5">
			<div class = "col-auto">
				<h1 class="text-start fs-3 fw-semibold">
				<a href="./promotionReviewMainPage" >
					<b>리워드 리뷰</b>
				</a>
				</h1>			
			</div>
			<div class = "col">
				<div class = "row text-start ms-2 d-flex align-items-center">
					<div class = "col">
					<a href="./allPromotionReviewPage" style="text-decoration: none; color: inherit;">
						전체
					</a>
					 <div class="vr mx-3"></div>
					<a href="#" style="text-decoration: none; color: inherit;">
						BEST
					</a>
					 <div class="vr mx-3"></div>
					 <a href="#" style="text-decoration: none; color: inherit;">
						임시
					</a>
					</div>
				</div>
			</div>
			<div class = "col"></div>
			<div class = "col">		
			
			
			</div>

			
		</div>

		
		
		
		 <!--  게시물 BEST -->
		<div class = "row mt-5">
			<div class = "col">
				<div class = "row">
					<div class = "col text-center fw-bold fs-2" style= "color: #387538;">
						- BEST -
					</div>
				</div>
				<div class = "row mt-1">
					<div class = "col text-center fs-5">
						사람들이 많은 후기를 남긴 제품
					</div>
				</div>
			</div>
		</div>
			<!--  best(인기) 제품(3개) -->
		<div class = "best container">
		<div class = "row mt-5">
			<div class = "col" >
				<div class = "row">			
					<c:forEach items="${bestPromotionReviewPostList}" var="map" varStatus="status" begin="0" end="2">
					<div class = "col" style="width: 18rem; height: 400px;">
						<div class="card border border-0" >
							<a href="./contentPromotionReviewPage?id=${map.promotionReviewDto.id }"> 
						  <img src="/uploadPromoFiles/${map.promotionReviewImgList[0].rental_review_img }"
						  	   class="card-img-top" alt="리워드게시물사진" height="300">
						  </a>
						  <div class="card-body text-center">
						  	<p class="card-text secondary fs-6 mt-1">
						  		${map.rentalItemCategory.main_category_name}
							 	<c:if test="${map.rentalItemCategory.sub_category_name != null}">
							 	> ${map.rentalItemCategory.sub_category_name}
							 	</c:if>
						  	</p> 
						    <h5 class="card-title fs-5 mt-1 fw-semibold">${map.promotionReviewDto.promotion_review_title }</h5>
						  </div>
						</div>
					</div>
					</c:forEach>
					
				</div>
			</div>
		</div>
		</div>
		
		<!--  간이 배너 -->
		<div class = "row mt-4 mb-3">
			<div class = "col">
				<img src="/safari/resources/img/community/banerer3.png" class="img-fluid">
			</div>
		</div>
		
		<!--  여기로 이사 -->
		<div class = "row mt-5">
			<div class = "col-8"></div>
			<div class = "col">
			<!-- 검색 -->
				<form action="./allPromotionReviewPage" method="get">
					<div class="row"> 
						<div class="col-4 pe-1">
							<select name="promoReview_searchType" class="form-select">
								<option value="promotion_review_title" selected>제목</option>
								<option value="promotion_review_content">내용</option>
								<option value="nickname">작성자</option>
							</select>				
						</div>
						<div class="col-5 px-0">
							<input name="promoReview_searchWord" type="text" class="form-control">
						</div>
						<div class="col-1 d-grid px-1">
							 <button type="submit" class="btn btn-outline-dark">
							  	<span class="bi bi-search"></span>
							</button>
						</div>
					</div>
				</form>
			</div>
			<div class = "col-1">
				<c:choose>
					<c:when test="${!empty sessionUser }">
						<form action="writePromotionReviewPage" method = "post">
							<button class = "form-control btn orangeButton">글쓰기</button>
						</form>
					</c:when>
					<c:otherwise>
						<form action="../../user/loginPage" method = "post">
							<button class = "form-control btn orangeButton">글쓰기</button>
						</form>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		
		
		
		<!--  최신순 / 공감(인기)순 -->
			<div class = "row mt-5">
				<!--  최신 순 -->
				<div class = "col">
					<div class = "row">
						<div class = "col fw-semibold fs-4">최신 순</div>
						<div class = "col text-end text-secondary">
							<a href="./allPromotionReviewPage" style="text-decoration: none; color: inherit;">
							더보기
							</a>
						</div>
					</div>
					<div class = "row">
						<div class = "col">		
						<!--  업로드된 게시글 목록들 -->
						 <div class="mt-3">
						<div class = "reviewlist container border border-1 shadow-sm" style="border-radius: 10px;">
						<div class = "row mt-3">			
							<c:forEach items="${promoReviewList}" var="map" varStatus="status" begin="0" end="4">
								<div class = "col mb-3">
									<div class="card border border-0" style="width:32rem; height: 150px;">
									<div class = "row">
										<div class = "col-4">
										<a href="./contentPromotionReviewPage?id=${map.promotionReviewDto.id}" style="text-decoration: none; color: inherit;">
										  <img src="/uploadPromoFiles/${map.promotionReviewImgList[0].rental_review_img }"
										  	   class="card-img-top" alt="리워드게시물사진" height="150" width="150" >
									 	</a>
									 	</div>
									 	<div class = "col">
									  <div class="card-body px-0 pt-1">
									  <div class = "row">
									  	  <div class = "col" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
									  	  	<a href="./contentPromotionReviewPage?id=${map.promotionReviewDto.id}" style="text-decoration: none; color: inherit;">
										  	<h5 class="card-title fw-semibold" style="font-size: 18px;">   
											    ${map.promotionReviewDto.promotion_review_title }
										     	<span class="comment-count">[${map.countPromotionReviewComment}]</span>
										    </h5>
										    </a>
									  	  </div>
									  	  <!--  공감버튼. 내가 누른 하트 유무-->
									  	  <div class = "col-1 text-end">
									  		<c:choose>
									  			<c:when test="${!empty sessionUser && (map.realCheck != 0)}">
									  				<i id = "heartBox${map.promotionReviewDto.id}" class = "text-danger bi bi-heart-fill fs-5"
									  				onclick="togglePromotionReviewLike(${map.promotionReviewDto.id}); location.reload();"></i>	
									  			</c:when>
									  			<c:otherwise>
									  				<i id = "heartBox${map.promotionReviewDto.id }" class = "text-danger bi bi-heart fs-5"
									  				onclick="togglePromotionReviewLike(${map.promotionReviewDto.id}); location.reload();"></i>
									  			</c:otherwise>
									  		</c:choose>	
							  			  </div>
									  </div>
								  		<a href="./contentPromotionReviewPage?id=${map.promotionReviewDto.id}" style="text-decoration: none; color: inherit;">
									    <div class="d-flex align-items-center">
						                    <img src="${data.userDto.profile_img_link}" class="rounded-circle" style="width: 25px; height: 25px;" alt="프로필사진">
						                    <p class="card-text fs-6 mt-2 ms-2">${map.userDto.nickname}</p>
						                </div>
									    <p class="card-text fs-6 mt-2" style="display: -webkit-box; -webkit-line-clamp: 3;
									       -webkit-box-orient: vertical; overflow: hidden;">${map.promotionReviewDto.promotion_review_content }
								       </p>
								       </a>
									  </div>
									  	</div>
									</div>
									</div>
							
								</div>		
							<c:if test="${status.count % 1 == 0}">
						</div>
								<div class = "row mt-3">
							</c:if>							
							</c:forEach>	
						</div>			
					</div>
				</div>

						
						</div>
					</div>
				</div>
				<!--  공감 많은 순 -->
				<div class = "col mx-5">
					<div class = "row">
						<div class = "col fw-semibold fs-4">공감 많은 순</div>
						<div class = "col text-end text-secondary">
							<a href="#" style="text-decoration: none; color: inherit;">
							더보기
							</a>
						</div>
					</div>
					<div class = "row">
						<div class = "col">
							<!--  업로드된 게시글 목록들 -->
						<div class="mt-3">
						<div class = "reviewlist container border border-1 shadow-sm" style="border-radius: 10px;">
						<div class = "row mt-3">			
							<c:forEach items="${orderByLikePromoReviewList}" var="map" varStatus="status" begin="0" end="4">
								<div class = "col mb-3">
								<a href="./contentPromotionReviewPage?id=${map.promotionReviewDto.id}" style="text-decoration: none; color: inherit;">
									<div class="card border border-0" style="width:32rem; height: 150px;">
									<div class = "row">
										<div class = "col-4">
											<a href="./contentPromotionReviewPage?id=${map.promotionReviewDto.id}" style="text-decoration: none; color: inherit;">
											  <img src="/uploadPromoFiles/${map.promotionReviewImgList[0].rental_review_img }"
											  	   class="card-img-top" alt="리워드게시물사진" height="150" width="150" >
								 		</a>
								 		</div>
									 	<div class = "col">
									  <div class="card-body px-0 pt-1">
									    <div class = "row">
									  	  <div class = "col">
										  	<h5 class="card-title fw-semibold" style="font-size: 18px;">
											    ${map.promotionReviewDto.promotion_review_title }
										     	<span class="comment-count">[${map.countPromotionReviewComment}]</span>
										    </h5>
									  	  </div>
									  	  <!-- 공감버튼 -->
									  	  <div class = "col-1 text-end">
									  		<c:choose>
									  			<c:when test="${!empty sessionUser && (map.realCheck != 0)}">
									  			<i id = "heartBox${map.promotionReviewDto.id}" class = "text-danger bi bi-heart-fill fs-5" onclick="togglePromotionReviewLike(${map.promotionReviewDto.id})"></i>	
									  			</c:when>
									  			<c:otherwise>
									  				<i id = "heartBox${map.promotionReviewDto.id }" class = "text-danger bi bi-heart fs-5" onclick="togglePromotionReviewLike(${map.promotionReviewDto.id})"></i>
									  			</c:otherwise>
									  		</c:choose>	
							  			  </div>
									   </div>
									    <div class="d-flex align-items-center">
						                    <img src="${data.userDto.profile_img_link}" class="rounded-circle" style="width: 25px; height: 25px;" alt="프로필사진">
						                    <p class="card-text fs-6 mt-2 ms-2">${map.userDto.nickname}</p>
						                </div>
									    <p class="card-text fs-6 mt-2" style="display: -webkit-box; -webkit-line-clamp: 3;
									       -webkit-box-orient: vertical; overflow: hidden;">${map.promotionReviewDto.promotion_review_content }</p>
									  </div>
									  	</div>
									</div>
									</div>
								</a>
								</div>	
							<c:if test="${status.count % 1 == 0}">
						</div>
								<div class = "row mt-3">
							</c:if>							
							</c:forEach>	
						</div>			
					</div>
				</div>

							
							
						</div>
					</div>
				</div>
			</div>
			
			<div class = "mt-5"></div>
			



	</div>
	<!-- 푸터 섹션 -->
	<jsp:include page="../../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

</body>
</html>