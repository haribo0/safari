<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>all review</title>
<!-- 메타 섹션 -->
<jsp:include page="../../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->
</head>
<style>
 .comment-count {
        font-size: 14px;
        color: darkgray;
    }
    
  
</style>
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
				<h1 class="text-center fs-3 fw-semibold">
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

		
	 <!--  최신순 / 공감(인기)순 => 나중에 수정 -->
		<div class = "row mt-5">
			<div class = "col"> <!-- 리스트 카테고리 -->
				<ul class="list-group">
				  <li class="list-group-item border border-0 py-2"><a class="btn fs-5 text fw-bold py-1" href="#">전체보기</a></li>
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
				<!--  정렬 -->
				<div class = "row">
					<div class = "col">
						<div class="d-flex justify-content-start">
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
				<div class = "row mt-5">			
				<c:forEach items="${promoReviewList}" var="map" varStatus="status">
					<div class = "col mb-3">
						<div class="card border border-0" style="width:30rem; height: 150px;">
						<div class = "row">
							<div class = "col-4">
							<a href="./contentPromotionReviewPage?id=${map.promotionReviewDto.id }">
						  <img src="/uploadPromoFiles/${map.promotionReviewImgList[0].rental_review_img }"
						  	   class="card-img-top" alt="실험용1" height="150" width="100" >
						  </a>
						 	</div>
						 	<div class = "col">
						  <div class="card-body">
						    <h5 class="card-title fs-5 mt-1 fw-semibold">
							  	<a href="./contentPromotionReviewPage?id=${map.promotionReviewDto.id }" style="text-decoration: none; color: inherit;">
							   		${map.promotionReviewDto.promotion_review_title } 
							    </a>
							    <a href="./contentPromotionReviewPage?id=${map.promotionReviewDto.id }" style="text-decoration: none; color: inherit;">
							   <span class="comment-count">[${map.countPromotionReviewComment}]</span>
							    </a>
							  	
						    </h5>
						    
						    <div class="d-flex align-items-center">
			                    <img src="${data.userDto.profile_img_link}" class="rounded-circle" style="width: 25px; height: 25px;" alt="프로필사진">
			                    <p class="card-text fs-6 mt-2 ms-2">${map.userDto.nickname}</p>
			                </div>
			                
						    <p class="card-text fs-6 mt-2 text-secondary" style="display: -webkit-box; -webkit-line-clamp: 2;
						       -webkit-box-orient: vertical; overflow: hidden;">${map.promotionReviewDto.promotion_review_content }</p>
						  </div>
						  	</div>
						</div>
						</div>
					</div>	<!-- col-4 mb-3 -->		
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
				    				<li class="page-item active"><a class="page-link" href="./allPromotionReviewPage?page=${index}${promoReview_searchQueryString}">${index}</a></li>
				    			</c:when>
				    			<c:otherwise>
				    				<li class="page-item"><a class="page-link" href="./allPromotionReviewPage?page=${index}${promoReview_searchQueryString}">${index}</a></li>
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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>
</html>