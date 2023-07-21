<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사파리 | 리워드</title>
<!-- 메타 섹션 -->
<jsp:include page="../../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->
</head>
<style>
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
// const promotionReviewId = new URLSearchParams(location.search).get("id"); => id를 여러개 가져와야하기 때문에 필요X

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

	<!--  커뮤니티 > 써봤어요 > 이런거.. -->
	<div class="container-fluid d-flex align-items-center justify-content-between p-3 px-5 mb-3 bg-light">
		<div class="container">
			<div class="row px-4">
				<p class="mb-0 text-body-secondary"><span class="mx-2" style="font-size: 15px;">커뮤니티</span> &gt; <span class="mx-2" style="font-size: 15px;">써봤어요</span> &gt;<span class="mx-2" style="font-size: 15px;">ALL REVIEW</span> </p>
			</div>
		</div>
	</div>


	<div class="container main_box">
		<!--  타이틀 -->
		<div class = "row mt-5">
			<div class = "col">
				<h1 class="text-start fs-3 fw-semibold">
				<a href="./allPromotionReviewPage" style="text-decoration: none; color: inherit;">
					<b>ALL REVIEW</b>
				</a>
				</h1>			
			</div>
			<div class = "col"></div>
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

		
	 <!--  최신순 / 공감(인기)순 => 나중에 수정 -->
		<div class = "row mt-5">
			<div class = "col"> <!-- 리스트 카테고리 -->
				<ul class="list-group">
				  <li class="list-group-item border border-0 py-2"><a class="btn fs-5 text fw-bold py-1" href="./promotionReviewMainPage">메인으로</a></li>
				  <li class="list-group-item border border-0 py-2"><a class="btn fs-5 text fw-bold py-1" href="#collapse1" data-bs-toggle="collapse">가구</a></li>
				  	<div>
						<ul class="list-group ms-4">
							<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">침대</a></li>
							<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">테이블</a></li>
							<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">소파</a></li>
							<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">서랍장</a></li>
						</ul>
					</div>
					
				  <li class="list-group-item border border-0 py-2"><a class="btn fs-5 text fw-bold py-1" href="#collapse2" data-bs-toggle="collapse">생활가전</a></li>
				  	<div>
						<ul class="list-group ms-4">
							<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">커피머신</a></li>
							<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">선풍기</a></li>
							<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">공기청정기</a></li>
							<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">에어컨</a></li>
							<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">안마의자</a></li>
						</ul>
					</div>
					
				  <li class="list-group-item border border-0 py-2"><a class="btn fs-5 text fw-bold py-1" href="#collapse3" data-bs-toggle="collapse">주방가전</a></li>
				  	<div>
						<ul class="list-group ms-4">
							<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">레인지</a></li>
							<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">밥솥</a></li>
							<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">식기세척기</a></li>
						</ul>
					</div>
					
				  <li class="list-group-item border border-0 py-2"><a class="btn fs-5 text fw-bold py-1" href="#collapse4" data-bs-toggle="collapse">전자기기</a></li>
				  	<div>
						<ul class="list-group ms-4">
							<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">노트북</a></li>
							<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">태블릿pc</a></li>
							<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">프로젝터</a></li>
							<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">스피커</a></li>
						</ul>
					</div> 
				</ul>
			</div>
			<!--  리뷰 -->
			<div class = "col-10">
			
				<!--  조회수 타이틀 -->
				<div class = "row mt-3">
					<div class = "col fs-5 fw-semibold fst-italic text-start">
						현재 사람들이 많이 보고 있는 게시물이에요
						<hr class="my-1 mb-2" style="border-color: gray;">
					</div>
				</div>

				
				<!--  조회수 높은거 4개 -->
				<div class = "row mt-3 mb-5">
					<div class = "col">
						<div class = "row">
						<c:forEach items="${topViewCount}" var="map" varStatus="status" begin="0" end="3"> 
							<div class = "col">
							
							<div class="card border border-1 shadow-sm mx-1 pb-4" style="width:15rem; height: 460px; background-color: #FAFAFA;">
								<div class = "row">
									<div class = "col">
									<a href="./contentPromotionReviewPage?id=${map.promotionReviewDto.id}" style="text-decoration: none; color: inherit;">				
										<img src="/uploadPromoFiles/${map.promotionReviewImgList[0].rental_review_img }"
									  	   class="card-img-top" alt="리워드게시물사진" height="200" width="200" >
									</a>
									</div>
								</div>
								<div class = "row mt-1 mx-1 px-1">
									<div class = "col text-end">
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
								<div class = "row px-1">
									<div class = "col text-start text-secondary mx-2">
									 	${map.rentalItemCategory.main_category_name}
									 	<c:if test="${map.rentalItemCategory.sub_category_name != null}">
									 	> ${map.rentalItemCategory.sub_category_name}
									 	</c:if>
									</div>
								</div>
								<div class = "row px-1">
								<a href="./contentPromotionReviewPage?id=${map.promotionReviewDto.id}" style="text-decoration: none; color: inherit;">
									<div class = "col text-start mx-2">
										<h5 class="card-title mt-1 fw-semibold" style="font-size: 18px;">		    
										    ${map.promotionReviewDto.promotion_review_title }   
									     	<span class="comment-count">[${map.countPromotionReviewComment}]</span>
										</h5>
									</div>
								</a>
								</div>
								<a href="./contentPromotionReviewPage?id=${map.promotionReviewDto.id}" style="text-decoration: none; color: inherit;">
								<div class = "row mt-1 mx-0 px-1">
									<div class = "col d-flex align-items-start">
										<img src="${data.userDto.profile_img_link}" class="rounded-circle" style="width: 25px; height: 25px;" alt="프로필사진">
										<p class="card-text fs-6 mt-2 ms-2 text-center">${map.userDto.nickname}</p>
									</div>
								</div>
								<div class = "row mt-1 mx-0 fs-6 text-secondary px-1">
									<div class = "col">
										<p class="card-text fs-6 mt-2 mb-1 text-secondary" style="display: -webkit-box; -webkit-line-clamp: 3;
									       -webkit-box-orient: vertical; overflow: hidden;">
									       ${map.promotionReviewDto.promotion_review_content}
									    </p>
									</div>
								</div>
								</a>
								</div>
							</div>
						</c:forEach>	
						</div>
					</div>
				</div>
				
				<div class = "row mt-3"></div>
				
				<!--  조회수 높은 순과 게시물 리스트의 선 -->
					<div class = "row mt-5 mb-3">
						<div class = "col fs-5 fw-semibold fst-italic text-start">
						모든 게시물
						<hr class="my-1 mb-2" style="border-color: gray;">
					</div>
					</div>
				
				<!--  정렬 -->
				<div class = "row">
					<div class = "col">
						<div class="d-flex justify-content-end">
							<div class="btn-group">
							  <button type="button" class="btn btn-secondary dropdown-toggle py-1" data-bs-toggle="dropdown" data-bs-display="static" aria-expanded="false">
							  	최신순
							  </button>
							  <ul class="dropdown-menu dropdown-menu-lg-end">
							    <li><a class="dropdown-item" href="#">공감순</a></li>
							    <li><a class="dropdown-item" href="#">대여리뷰순</a></li>
							  </ul>
							 </div>
						</div>
					</div> 
				</div>
				
				
				
				
				<!--  어쩜조아... 리뷰 게시글들 -->
				<div class = "row mt-3">			
				<c:forEach items="${promoReviewList}" var="map" varStatus="status">
					<div class = "col mb-3 mt-1"> 
						<div class="card border border-0" style="width:30rem; height: 150px;">
				
						<div class = "row">
							<div class = "col-4">			
								<a href="./contentPromotionReviewPage?id=${map.promotionReviewDto.id}" style="text-decoration: none; color: inherit; display: block;">
						  		<img src="/uploadPromoFiles/${map.promotionReviewImgList[0].rental_review_img }"
						  	   	class="card-img-top" alt="리워드게시물사진" height="150" width="100" >	  
						 		</a>
						 	</div>
						 	<div class = "col">
						  <div class="card-body px-0 pt-1">
							<div class = "row">
							 	<div class = "col">
							 		<a href="./contentPromotionReviewPage?id=${map.promotionReviewDto.id}" style="text-decoration: none; color: inherit; display: block;">		  		
							  		<h5 class="card-title fw-semibold" style="font-size: 18px;">	
								   		${map.promotionReviewDto.promotion_review_title} 
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
							<a href="./contentPromotionReviewPage?id=${map.promotionReviewDto.id}" style="text-decoration: none; color: inherit; display: block;">	    
						    <div class="d-flex align-items-center">
			                    <img src="${data.userDto.profile_img_link}" class="rounded-circle" style="width: 25px; height: 25px;" alt="프로필사진">
			                    <p class="card-text fs-6 mt-2 ms-2">${map.userDto.nickname}</p>
			                </div>
						    <p class="card-text fs-6 mt-2 text-secondary" style="display: -webkit-box; -webkit-line-clamp: 2;
						       -webkit-box-orient: vertical; overflow: hidden;">
						       ${map.promotionReviewDto.promotion_review_content}
						    </p>
						 	</a>
						  </div>
						  	</div>
						</div>
						
						</div>
					</div>	
				<c:if test="${status.count % 2 == 0}">
			</div>
					<div class = "row mt-3">
				</c:if>							
				</c:forEach>	
			</div>		

		
		
			</div> <!-- <div class = "col-10"> 닫는곳 -->
		</div>
	
		
	
		<!-- 페이징-->
		<div class = "row mt-3 d-flex justify-content-center">
			<div class = "col-2 ms-0">
				<nav aria-label="Page navigation">
				    <ul class="pagination mb-0">
				    	<c:choose>
				    		<c:when test="${startPage <= 1}">
				    			<li class="page-item disabled"><a class="page-link" href="./allPromotionReviewPage?page=${startPage-1}${promoReview_searchQueryString}">&lt;</a></li>
				    		</c:when>
				    		<c:otherwise>
				    			<li class="page-item"><a class="page-link" href="./allPromotionReviewPage?page=${startPage-1}${promoReview_searchQueryString}">&lt;</a></li>
				    		</c:otherwise>
				    	</c:choose>
				    	
				    	<c:forEach begin="${startPage}" end="${endPage}" var="index">
				    		<c:choose>
				    			<c:when test="${index == currentPageNum}">
				    				<li class="page-item active"><a class="page-link bg-secondary" style="border-color:gray;" href="./allPromotionReviewPage?page=${index}${promoReview_searchQueryString}">${index}</a></li>
				    			</c:when>
				    			<c:otherwise>
				    				<li class="page-item"><a class="page-link" style="border-color:gray;" href="./allPromotionReviewPage?page=${index}${promoReview_searchQueryString}">${index}</a></li>
				    			</c:otherwise>
				    		</c:choose>
				    	</c:forEach>
				    	
				    	<c:choose>
				    		<c:when test="${endPage >= totalPage}">
				    			<li class="page-item disabled"><a class="page-link" href="./allPromotionReviewPage?page=${endPage+1}${promoReview_searchQueryString}">&gt;</a></li>
				    		</c:when>
				    		<c:otherwise>
				    			<li class="page-item"><a class="page-link" href="./allPromotionReviewPage?page=${endPage+1}${promoReview_searchQueryString}">&gt;</a></li>
				    		</c:otherwise>
				    	</c:choose>
				    </ul>
				</nav>
			</div>
		</div>
		
		








</div> <!--  container div 닫는 곳 -->
	<div class = "row mt-5">
		<div class = "col">
	<!-- 푸터 섹션 -->
	<jsp:include page="../../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->
		</div>
	</div>
</body>
</html>