<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세부</title>
<!-- 메타 섹션 -->
<jsp:include page="../../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->
</head>
<style>
.scroll-container {
  overflow-y: auto; /* 세로 스크롤바를 보여주는 속성 */
  height: 500px; /* 스크롤 영역의 높이 설정 */
}

/* 세로 스크롤 바 */
.scroll-container::-webkit-scrollbar {
  width: 5px; /* 스크롤 바의 너비 */
}

/* 스크롤 바의 트랙 */
.scroll-container::-webkit-scrollbar-track {
  background-color: #ffffff; /* 트랙의 배경색 */
}

/* 스크롤 바의 핸들 */
.scroll-container::-webkit-scrollbar-thumb {
  background-color: #a9a9a9; /* 핸들의 배경색 */
}

/* 스크롤 바의 핸들을 클릭할 때의 스타일 */
.scroll-container::-webkit-scrollbar-thumb:hover {
  background-color: #555; /* 핸들의 배경색 */
}
/*별점 별 색깔 */
.btn.bi.bi-star-fill {
  color: #FACD4C; /* 원하는 아이콘 색상으로 변경 */
}

/* 버튼 색깔 */
.orangeButton{
	background: #ff6f0f;
	font-weight: bold;
	color: white;
}
.orangeButton:hover {
     background: #ff6f0f;
	font-weight: bold;
	color: white;
  }
</style>
<script>
// 좋아요 토글
	const promotionReviewId = new URLSearchParams(location.search).get("id");
	

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

	
	function refreshTotalLikeCount(){
		const xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				const response = JSON.parse(xhr.responseText);
			
				const totalLikeCountBox = document.getElementById("totalPromoReviewLikeCount");
				totalLikeCountBox.innerText = response.count;
			}
		}
		

		
		xhr.open("get", "./getTotalPromoReviewLikeCount?reviewId=" + promotionReviewId);
		xhr.send();
	}
	
	
	function togglePromotionReviewLike(){
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
				
				refreshTotalLikeCount();
				refreshMyHeart();
			}
		}
		
		xhr.open("get", "./togglePromotionReviewLike?review_id=" + promotionReviewId);
		xhr.send();		
	}
	

	function refreshMyHeart(){
		
		if(mySessionId == null) return;	
		
		const xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				const response = JSON.parse(xhr.responseText);
				// js 렌더링... 작업..
				const heartBox = document.getElementById("heartBox");
				
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
		xhr.open("get", "./promoReviewIsLiked?review_id=" + promotionReviewId);
		xhr.send();
		
	}
	
	

// uri 복사
function clip(){

	var url = '';
	var textarea = document.createElement("textarea");
	document.body.appendChild(textarea);
	url = window.document.location.href;
	textarea.value = url;
	textarea.select();
	document.execCommand("copy");
	document.body.removeChild(textarea);
	alert("URL가 복사되었습니다.")
}

function goToLoginPage() {
	  alert("로그인 후 이용가능합니다")
	  window.location.href = "../../user/loginPage"; // 메인 페이지의 주소를 입력해주세요
	}

window.addEventListener("DOMContentLoaded", function(){
	
	getSessionId();
	refreshTotalLikeCount();
	refreshMyHeart();
});

// 페이지 로드 시 스크롤 위치 저장
window.addEventListener("load", function() {
  const scrollPosition = sessionStorage.getItem("scrollPosition");
  if (scrollPosition) {
    document.getElementById("content").scrollTop = parseInt(scrollPosition);
  }
});

// 페이지 unload 시 스크롤 위치 저장
window.addEventListener("beforeunload", function() {
  const scrollPosition = document.getElementById("content").scrollTop;
  sessionStorage.setItem("scrollPosition", scrollPosition);
});
</script>

<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->

	<!--  커뮤니티>써봤어요> 이런 거 -->
	<div class="container-fluid d-flex align-items-center justify-content-between p-3 px-5 mb-3 bg-light">
		<div class="container">
			<div class="row px-4">
				<p class="mb-0 text-body-secondary"><span class="mx-2" style="font-size: 15px;">커뮤니티</span> &gt; <span class="mx-2" style="font-size: 15px;">리워드 리뷰</span> &gt;<span class="mx-2" style="font-size: 15px;">ALL REVIEW</span> </p>
			</div>
		</div>
	</div>
	

<div class="container main_box">
	<!--  뒤로가기 버튼 -->
	<div class = "row mt-3 mb-3">
		<div class = "col-1">
		<a href="./allPromotionReviewPage" style="text-decoration: none; color: white;">
			<i class="bi bi-arrow-left-square fs-1" style="color:#525452;"></i>
		</a>
		</div>
		<div class = "col-9"></div>
		
	<!--  session 보고 수정/삭제 버튼 -->
		<c:if test="${!empty sessionUser && sessionUser.id == data.userDto.id }">
			<div class = "col-1 text-end">
				<button class = "form-control btn btn-outline-dark rounded-pill me-2">
				<a href="./updatePromotionReviewPage?id=${data.promotionReviewDto.id }" style="text-decoration: none; color: inherit;">수정</a>
				</button>
			</div>
			<div class = "col-1 text-end">
				<button class = "form-control btn btn-dark rounded-pill me-2">
				<a href="./deletePromotionReviewProcess?id=${data.promotionReviewDto.id }" style="text-decoration: none; color: inherit;">삭제</a>
				</button>
			</div>	
		</c:if>
	
		
	</div>
	
	
	<div class = "row">
	<!--  사진 첨부(게시물 등록자가 올린것들?) -->
		<div class = "col"> 
			<div class = "row mt-2 sticky-top" style="top:115.23px;">
				<div class = "col">
				<!-- 	style="border-radius: 10px;"-->
					<div style = "border-left: 10px solid #72A56C;">
						<!--  대여 상품명 & 상호 -->
						<div class = "row mx-1 mt-2">
							<div class = "col text-secondary" style = "font-size:14px;">
								${rentalPromotionReviewInfoList[0].promoReviewRentalInfoDto.business_name}
							</div>
						</div>
						<div class = "row mx-1">
							<div class = "col mb-1 fw-semibold" style = "font-size:18px;">
								${rentalPromotionReviewInfoList[0].promoReviewRentalInfoDto.title }
							</div>
						</div>
						
					</div>	
		
					<!--  상세 게시물 사진 -->
					<div class="row mt-3">
					    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
					        <div class="carousel-indicators">
					            <c:choose>
					                <c:when test="${data.promotionReviewImgDtoList.size() == 1}">
					                    <!-- 사진이 1개인 경우 -->
					                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
					                </c:when>
					                <c:otherwise>
					                    <!-- 사진이 여러 개인 경우 -->
					                    <c:forEach items="${data.promotionReviewImgDtoList}" var="imgDto" varStatus="status">
					                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${status.index}" class="${status.index == 0 ? 'active' : ''}" aria-current="${status.index == 0 ? 'true' : 'false'}" aria-label="Slide ${status.index+1}"></button>
					                    </c:forEach>
					                </c:otherwise>
					            </c:choose>
					        </div>
					        <div class="carousel-inner">
					            <c:choose>
					                <c:when test="${data.promotionReviewImgDtoList.size() == 1}">
					                    <!-- 사진이 1개인 경우 -->
					                    <div class="carousel-item active">
					                        <img src="/uploadPromoFiles/${data.promotionReviewImgDtoList[0].rental_review_img}" class="d-block w-100" alt="...">
					                    </div>
					                </c:when>
					                <c:otherwise>
					                    <!-- 사진이 여러 개인 경우 -->
					                    <c:forEach items="${data.promotionReviewImgDtoList}" var="imgDto" varStatus="status">
					                        <div class="carousel-item ${status.index == 0 ? 'active' : ''}">
					                            <img src="/uploadPromoFiles/${imgDto.rental_review_img}" class="d-block w-100" alt="...">
					                        </div>
					                    </c:forEach>
					                </c:otherwise>
					            </c:choose>
					        </div>
					        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
					            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					            <span class="visually-hidden">Previous</span>
					        </button>
					        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
					            <span class="carousel-control-next-icon" aria-hidden="true"></span>
					            <span class="visually-hidden">Next</span>
					        </button>
					    </div>
					</div>
					<div class = "row">
						<div class = "col">
							<form action="./rewardPromotionReviewPage?itemId=${data.promotionReviewDto.rental_item_id}&userId=${data.userDto.id}&writerId=${data.promotionReviewDto.user_id}" method="post">
							<button class = "form-control btn orangeButton me-2">
									<i class="bi bi-fast-forward"></i>&nbsp; 더 알아보기 &nbsp;<i class="bi bi-fast-forward"></i>
							</button>
							</form>
						</div>
					</div>	
					
						
				</div>
			</div>
		</div>
	
		
		<!--  중간 바 -->
		<div class = "col-1 mt-5">
			<div class = "row sticky-top" style="top:115.23px;">
				<div class = "col">
					<div class="d-flex" style="height: 400px;">
				  	<div class="vr"></div>
				</div>
			</div>
			</div>
		</div>
		
		<!--  게시물 내용 -->
		<div class = "col-7"> <!--  수습 안 되면 다시 scroll-container 붙이기 --> 
			
			<div class = "row">
				<div class = "col">
					<div class = "row mt-2">
						<div class = "col">
						
							<!--  공감수 + 조회수 top5 -->
							
							<c:forEach items="${bestPromotionReviewPostList}" var="map" varStatus="status">
							<c:if test="${map.promoReviewPostRankDto.promoReview_rank < 5}">
								<span class="badge text-bg-warning">BEST</span>
							</c:if>
							</c:forEach>
					
							${map.promoReivewPostRank.promoReview_rank }
							 
							
							 
						</div>
						<div class = "col"></div>
					</div>
					<%-- 카테고리 --%>
					<div class = "row mt-3">
						<div class = "col fs-6 text-secondary">
							${data.rentalItemCategory.main_category_name}
						 	<c:if test="${data.rentalItemCategory.sub_category_name != null}">
						 	> ${data.rentalItemCategory.sub_category_name}
						 	</c:if>
						</div>
					</div>
					<div class = "row">
						<div class = "col fw-semibold fs-3"> 
							${data.promotionReviewDto.promotion_review_title}
						</div>
					</div>
					
					<!--  프로필 -->
					<div class = "row mt-2">
						<div class = "col-auto">
							<div class="d-flex justify-content-center align-items-center">
							<img src="${data.userDto.profile_img_link }"
								class="rounded-circle" style="width: 50px; height: 50px; border-radius: 50%;"
								alt="프로필사진">						
							</div>
						</div>
						<div class = "col text-start">
							<div class = "row">
								<div class = "col">
									${data.userDto.nickname }
								</div>
							</div>
							<div class = "row">
								<div class = "col fst-italic text-secondary">
									<fmt:formatDate value="${data.promotionReviewDto.reg_date }" pattern="yy.MM.dd"/>		
									&nbsp; · &nbsp;
									<i class="bi bi-eye-fill fs-6 text-secondary">${data.promotionReviewDto.promotion_review_views }</i>			
								</div>
							</div>
						</div>
						<div class = "col"></div>
						<div class = "col-1 mx-2 d-flex justify-content-center align-items-center" style = "cursor: pointer;">
						<!--  공감하트버튼 -->
							<i id = "heartBox" onclick="togglePromotionReviewLike()" class="text-danger bi bi-heart fs-4"></i>
							&nbsp;
							<span id = "totalPromoReviewLikeCount"></span>
						</div>
						
						<div class = "col-1 p-0 d-flex align-items-center ">
						<!--  공유버튼 -->
							<a href="" onclick="clip(); return false;" style="text-decoration: none; color: inherit;">
								<span class = "bi bi-share-fill fs-4"></span>
							</a>
						</div>


					</div>
					<!--  프로필이랑 본문 사이 선 -->
					<div class = "row">
						<div class = "col">
							<hr class="my-4" style="border-color: gray;">
						</div>
					</div>
					
						<!--  본문 내용 -->
					<div class = "row mt-2">
						<div class = "col" style="height: 300px; overflow: auto;">
							${data.promotionReviewDto.promotion_review_content}
						</div>
					</div>
					<%-- 
					<!--  댓글 버튼(dropdown 형식) -->
					<div class = "row mt-5">
						<div class = "col">
							<div class="btn-group">
							  <button class="btn btn-outline-dark btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
							    댓글 n (new)
							  </button>
							  <ul class="dropdown-menu" style="width: 750px; overflow-x: auto;">
							  
								  <li class = "mt-1 fw-semibold">댓글</li>
								  
							   
							  </ul>
							</div>
						</div>
					</div>
					
					--%>
					
					<!--  본문과 댓글 사이 -->
					<div class = "row mt-5">
						<div class = "col">
							<hr class="my-4" style="border-color: gray;">
						</div>
					</div>
					
					<!--  댓글 작성 -->	
					<div class = "row mt-3">
						<div class = "col">
							<div class = "row">
								<div class = "col fw-semibold fst-italic fs-5">
									Comment
									<span class="bi bi-chat-dots-fill fs-5"></span>
								</div>
							</div>
							
							<div class = "row mt-2 card border border-1">
								<div class = "col mb-2 fw-semibold">
									<c:choose>
										<c:when test="${!empty sessionUser}">
											<form action="./writePromotionReivewCommentProcess" method="post">
												<div class = "row mt-3">
													<div class = "col">
													${sessionUser.nickname }
													</div>
												</div>
												<div class = "row mt-1">
													<div class = "col">
													<input class = "form-control" type = "text" name = "promotion_review_comment" placeholder="댓글 작성하기">
													<input type = "hidden" name = "promotion_review_id"  value = "${data.promotionReviewDto.id }" >
													</div>
												</div>
												<div class = "row mt-2">
													<div class = "col-2">
														<input type = "checkbox" name = "private_comment" id = "privateCommentCheckBox">
														<label for="privateCommentCheckbox">비밀글</label>
													</div>
													<div class = "col-8"></div>
													<div class = "col">
													<button class = "form-control btn btn-dark">등록</button>
													</div>
												</div>
											</form>
										</c:when>
										<c:otherwise>
											<form action="../../user/loginPage" method="post">
												<div class = "row mt-3">
													<div class = "col ">
													로그인하지 않은 사용자
													</div>
												</div>
												<div class = "row mt-1">
													<div class = "col">
													<input class = "form-control" type = "text" name = "promotion_review_comment"
														onclick="goToLoginPage(); return false;" placeholder="댓글을 작성하려면 로그인 해주세요.">
													</div>
												</div>
												<div class = "row mt-2">
													<div class = "col-2">
														<input type = "checkbox" name = "private_comment" id = "privateCommentCheckBox">
														<label for="privateCommentCheckbox">비밀글</label>
													</div>
													<div class = "col-8"></div>
													<div class = "col">
													<button class = "form-control btn orangeButton">등록</button>
													</div>
												</div>
											</form>
										</c:otherwise>
									</c:choose>
									
									</div>
								</div>
							</div>
						</div>
					</div>
	
								
					<!--  댓글 리스트 -->
					<div class = "row mt-5" id="content">
						<div class = "col">
							<c:forEach items = "${promoCommentDtoList}" var = "mapPromoComment">
							<div class = "row mt-1">
								<div class = "col-1"> <!--  프로필사진 -->
									<img src = "${mapPromoComment.userDto.profile_img_link}" alt = "UserImage" width="50px">
								</div>
								<div class = "col">
									<div class = "row">
									
										<div class = "col">
											<div class = "row">
												<div class = "col fw-semibold fs-6">
													${mapPromoComment.userDto.nickname}
												</div>
												<div class = "col-1"></div>
												<!--  수정/삭제 버튼 -->
												<div class = "col text-end text-secondary fs-5"> 
													<div class="dropdown">
													  <span class="bi bi-three-dots-vertical" data-bs-toggle="dropdown" aria-expanded="false"></span>		  
													  <c:choose>
													  	<c:when test="${!empty sessionUser}">
														  	 <ul class="dropdown-menu">
															  <li><a class="dropdown-item" href="./updatePromoCommentProcess?id=${mapPromoComment.promotionReviewCommentDto.id}">수정</a></li>
															  <li><a class="dropdown-item" href="./deletePromotionReivewCommentProcess?id=${mapPromoComment.promotionReviewCommentDto.id}">삭제</a></li>
														  </ul>
													  	</c:when>
													  	<c:otherwise>
													  		 <ul class="dropdown-menu">
																  <li><a class="dropdown-item" href="#">신고</a></li>		 
															  </ul>
													  	</c:otherwise>
													  </c:choose>
													 
													</div>											
												</div>
											</div>
											<div class = "row">
												<div class = "col text-secondary " style = "font-size: 12px;">
												<fmt:formatDate value="${mapPromoComment.promotionReviewCommentDto.reg_date}" pattern = "yyyy-MM-dd  HH-mm-ss"/>	
												</div>
											</div>
											<div class ="row mt-2">
					 							<div class = "col mb-5">
					 							<%-- 비밀글 처리
					 							<c:if test="${mapPromoComment.promotionReviewCommentDto.private_comment == 1}">
					 								<c:choose>
					 									<c:when test="${mapPromoComment.userDto.id &&  }">
					 										
					 									</c:when>
					 									<c:otherwise>
					 										
					 									</c:otherwise>
					 								</c:choose>
					 							</c:if>
					 							 --%>
					 							
					 							 <c:choose>
								                    <c:when test="${mapPromoComment.editMode}">
								                      <form action="./updatePromoCommentProcess" method="post">
								                        <input type="hidden" name="commentId" value="${mapPromoComment.promotionReviewCommentDto.id}">
								                        <textarea name="newComment" >${mapPromoComment.promotionReviewCommentDto.promotion_review_comment}</textarea>
								                        <button type="submit">저장</button>
								                      </form>
								                    </c:when>
								                    <c:otherwise>
								                      <span>${mapPromoComment.promotionReviewCommentDto.promotion_review_comment}</span>
								                    </c:otherwise>
								                  </c:choose>	
					 								
					 								
					 								
					 							<!--  내용 	${mapPromoComment.promotionReviewCommentDto.promotion_review_comment } -->
					 							</div>
										</div>
										</div>
									</div>
								</div>
							</div>
							</c:forEach>
						</div>
					</div>
					
					
					
					
				</div> <!--  col -->
			
			</div> <!--  row -->
			

		</div> <!--  col 3번 -->
			
			
			
			
			
	</div> <!--  사진첨부 위  -->
		
	








<div class = "mb-5"></div>
</div> <!--  container div 닫는 곳 -->
	<!-- 푸터 섹션 -->
	<jsp:include page="../../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->
</body>
</html>