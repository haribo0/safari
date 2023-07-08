<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>promotion Review Main Page</title>
<!-- 메타 섹션 -->
<jsp:include page="../../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->
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
			<div class = "col-1">
				<h1 class="text-start fs-3 fw-semibold">
					<b>리워드</b>
				</h1>			
			</div>
			<div class = "col">
				<div class = "row text-start ms-2">
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
			<!-- 검색 -->
			<form action="./allPromotionReviewPage" method="get">
				<div class="row"> 
					<div class="col-4">
						<select name="promoReview_searchType" class="form-select">
							<option value="promotion_review_title" selected>제목</option>
							<option value="promotion_review_content">내용</option>
							<option value="nickname">작성자</option>
						</select>				
					</div>
					<div class="col-5">
						<input name="promoReview_searchWord" type="text" class="form-control">
					</div>
					<div class="col-2 d-grid mx-1">
						 <button type="submit" class="btn btn-outline-dark">
						  	<span class="bi bi-search"></span>
						</button>
					</div>
				</div>
			</form>
			</div>

			<div class = "col-1">
			<c:if test="${!empty sessionUser }">
			<form action="writePromotionReviewPage" method = "post"> <!--  나중에 수정하도록 -->
				<button class = "form-control btn btn-dark">글쓰기</button>
			</form>
			</c:if>
			</div>
		</div>


		
		 <!--  게시물 사진들 나올 곳 -->
		<div class = "row mt-5">
			<div class = "col">
				<div class = "row">
					<div class = "col text-center fw-semibold fs-2">
						BEST
					</div>
				</div>
				<div class = "row mt-2">
					<div class = "col text-center fs-5">
						월간 사람들이 많이 작성한 제품
					</div>
				</div>
		</div>
			<!--  best(인기) 게시물(3개) -->
		<div class = "best container">
		<div class = "row mt-5">
			<div class = "col">
				<div class = "row mb-2">			
					<!--  반복문 foreach 들어갈 자리 -->
					<div class = "col mb-3">
						<div class="card border border-0" style="width: 18rem; height: 350px;">
							<a href="./contentPromotionReviewPage?id=${map.promotionReviewDto.id }"> <%-- 여기에 사진 누르면 들어가는 구매창 링크 --%> 	
						  <img src="/uploadPromoFiles/${map.promotionReviewImgList[0].rental_review_img }"
						  	   class="card-img-top" alt="리워드게시물사진" height="300" >
						  </a>
						  <div class="card-body text-center">
						  	<p class="card-text secondary fs-6 mt-1">${map.promotionReviewDto.rental_item_id }</p> <%-- 나중에 대여 카테고리 가져오면 여기 수정하기 --%>
						    <h5 class="card-title fs-5 mt-1 fw-semibold">${map.promotionReviewDto.promotion_review_title }</h5>
						    <p class="card-text fs-6 mt-3">${map.userDto.nickname }</p>
						  </div>
						</div>
					</div>
					
					
				</div>
			</div>
		</div>
		</div>
		
		
		
			 <!--  최신순 / 공감(인기)순 => 나중에 수정 -->
			 
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
						<div class = "reviewlist container border border-1" style="border-radius: 10px;">
						<div class = "row mt-4">			
							<c:forEach items="${promoReviewList}" var="map" varStatus="status" begin="0" end="4">
								<div class = "col mb-3">
									<div class="card border border-0" style="width:30rem; height: 150px;">
									<div class = "row">
										<div class = "col-4">
										<a href="./contentPromotionReviewPage?id=${map.promotionReviewDto.id }"> <%-- 여기에 사진 누르면 들어가는 구매창 링크 --%> 	
									  <img src="/uploadPromoFiles/${map.promotionReviewImgList[0].rental_review_img }"
									  	   class="card-img-top" alt="리워드게시물사진" height="150" width="100" >
									  </a>
									 	</div>
									 	<div class = "col">
									  <div class="card-body">
									  <div class = "row">
									  	  <div class = "col">
										  	<h5 class="card-title fs-5 mt-1 fw-semibold">
											    <a href="./contentPromotionReviewPage?id=${map.promotionReviewDto.id }" style="text-decoration: none; color: inherit;">
											    ${map.promotionReviewDto.promotion_review_title }
											    </a>
										     	<span class="comment-count">[${map.countPromotionReviewComment}]</span>
										    </h5>
									  	  </div>
									  	  <!--  공감버튼. 내가 누른 하트 유무-->
									  	  <div class = "col-1 text-end">
									  	
									  		<c:choose>
									  			<c:when test="${!empty sessionUser && (map.realCheck != 0)}">
									  				<i id = "heartBox${map.promotionReviewDto.id}" class = "text-danger bi bi-heart-fill fs-5"
									  				onclick="togglePromotionReviewLike(${map.promotionReviewDto.id})"></i>	
									  			</c:when>
									  			<c:otherwise>
									  				<i id = "heartBox${map.promotionReviewDto.id }" class = "text-danger bi bi-heart fs-5"
									  				onclick="togglePromotionReviewLike(${map.promotionReviewDto.id})"></i>
									  			</c:otherwise>
									  		</c:choose>	
							  			  </div>
									  </div>
									    <div class="d-flex align-items-center">
						                    <img src="${data.userDto.profile_img_link}" class="rounded-circle" style="width: 25px; height: 25px;" alt="프로필사진">
						                    <p class="card-text fs-6 mt-2 ms-2">${map.userDto.nickname}</p>
						                </div>
									    <p class="card-text fs-6 mt-2" style="display: -webkit-box; -webkit-line-clamp: 2;
									       -webkit-box-orient: vertical; overflow: hidden;">${map.promotionReviewDto.promotion_review_content }</p>
									  </div>
									  	</div>
									</div>
									</div>
								</div>	<!-- col-4 mb-3 -->		
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
						<div class = "reviewlist container border border-1" style="border-radius: 10px;">
						<div class = "row mt-4">			
							<c:forEach items="${orderByLikePromoReviewList}" var="map" varStatus="status" begin="0" end="4">
								<div class = "col mb-3">
									<div class="card border border-0" style="width:30rem; height: 150px;">
									<div class = "row">
										<div class = "col-4">
										<a href="./contentPromotionReviewPage?id=${map.promotionReviewDto.id }"> 	
									  <img src="/uploadPromoFiles/${map.promotionReviewImgList[0].rental_review_img }"
									  	   class="card-img-top" alt="리워드게시물사진" height="150" width="100" >
									  </a>
									 		 </div>
									 	<div class = "col">
									  <div class="card-body">
									    <div class = "row">
									  	  <div class = "col">
										  	<h5 class="card-title fs-5 mt-1 fw-semibold">
											    <a href="./contentPromotionReviewPage?id=${map.promotionReviewDto.id }" style="text-decoration: none; color: inherit;">
											    ${map.promotionReviewDto.promotion_review_title }
											    </a>
										     	<span class="comment-count">[${map.countPromotionReviewComment}]</span>
										    </h5>
									  	  </div>
									  	  <!--  공감버튼. 내가 누른 하트 유무  밥 먹고와서 하세요-->
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
									    <p class="card-text fs-6 mt-2" style="display: -webkit-box; -webkit-line-clamp: 2;
									       -webkit-box-orient: vertical; overflow: hidden;">${map.promotionReviewDto.promotion_review_content }</p>
									  </div>
									  	</div>
									</div>
									</div>
								</div>	<!-- col-4 mb-3 -->		
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
			
			<div>&nbsp;</div>
				<br>
			<div>&nbsp;</div>
			

















	</div>
	<!-- 푸터 섹션 -->
	<jsp:include page="../../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

</body>
</html>