<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사파리 | 렌탈 물품 상세</title>
<!-- 메타 섹션 -->
<jsp:include page="../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->
<script>
	// 현재 페이지의 상품 id 가져오기
	const itemId = new URLSearchParams(location.search).get("id")
	// 로그인된 세션 초기화
	let mySessionId = null;
	// 세션가져오기
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
		
		xhr.open("get", "../user/getMyId", false);
		xhr.send();		
	}
	
	// 좋아요 토글
		function toggleLike(){
		if(mySessionId == null){
			if(confirm("로그인을 하셔야 이용하실 수 있습니다. 로그인 하시겠습니까?")){
				location.href = "../user/loginPage";
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
		
		xhr.open("get", "./toggleRentalItemLike?item_id=" + itemId);
		xhr.send();
		
	}
	
	// 좋아요 모든 이용자가 누른 갯수
		function refreshTotalLikeCount(){
		const xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				const response = JSON.parse(xhr.responseText);
				const totalLikeCountBox = document.getElementById("totalLikeCount");
				totalLikeCountBox.innerText = response.count;
			}
		}
		
		xhr.open("get", "./getTotalLikeCount?id=" + itemId);
		xhr.send();		
	}
	
	// 내가(로그인한 사용자)가 좋아요 누름 리프레시
		function refreshMyHeart(){

			console.log("refreshMyHeart 작동? ")
			
			if(mySessionId == null) return;
			const xhr = new XMLHttpRequest();
			
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4 && xhr.status == 200){
					const response = JSON.parse(xhr.responseText);
					const heartBox = document.getElementById("heartBox");
					
					if(response.isLiked){
						heartBox.classList.remove("bi-bookmark");
						heartBox.classList.add("bi-bookmark-fill");
					}else{
						heartBox.classList.remove("bi-bookmark-fill");
						heartBox.classList.add("bi-bookmark");
					}
				}
			}
			xhr.open("get", "./isLiked?item_id="+itemId);
			xhr.send();
		}
	
/* 	function setStarBox() {
		const starBox = document.querySelector('.star-box')
		const ratingNum = ${reviewRating}
		
		for(let i = 0; i < ratingNum; i++) {
			let starIco = document.createElement('i')
			starIco.className ='bi bi-star-fill me-1'
			
			starBox.appendChild(starIco)
		}
	} */
	
/* 	function setRewviewStarBox() {
		const reviewStarBox = document.querySelectorAll('.reviewStarBox')
		
		for(let i = 0; i < reviewStarBox.length; i++) {
			let numberOfStar = reviewStarBox[i].getAttribute('data-numberof')
				for(let j =0; j<numberOfStar; j++) {
					let starIco = document.createElement('i')
					starIco.className ='bi bi-star-fill me-1'
					starIco.style.fontSize='14px'
					
					reviewStarBox[i].appendChild(starIco)
				}
			console.log({numberOfStar})
		}
	} */

window.addEventListener("DOMContentLoaded", function(){
	getSessionId();
 	refreshTotalLikeCount();
	refreshMyHeart();
	//setStarBox();
	//setRewviewStarBox();
});
</script>
<style>
.btn.active{background: #eff1f5; border: none; color: #2a4158;}
</style>
</head>
<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->
	
	<div class="container mb-5 py-4 border-top"> 
		<div class="row">
			<div class="col px-3">
				<p class="mb-2 text-secondary">${data.mainCategoryName} &gt; ${data.subCategoryName}</p>
			</div>
		</div>
		
		<div class="row mt-3">
			<div class="col d-flex justify-content-center pe-4" style="max-height: 612px;">
				<img class="img-fluid rounded-3" alt="" src="/safariImg/${data.rentalItemDto.main_img_link}">
			</div>
			
			<div class="col px-2">
				<div class="row">
					<div class="col">
						<p class="mb-0" style="font-weight: 700; color: #858585;">${data.rentalBusinessDto.business_name}</p>					
					</div>
				</div>
				
				<div class="row justify-content-between">
					<div class="col">
						<h3>${data.rentalItemDto.title}</h3>				
					</div>
					<div class="col d-flex justify-content-end">
						<div class="row">
							<div class="col">
								<div style="height: 26px;">
									<i id="heartBox" onclick="toggleLike()" class="fs-4 bi bi-bookmark"></i>
								</div>
								<div class="text-center">
									<span id="totalLikeCount" style="font-size: 12px;"></span>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<p class="ms-4"><i class="bi bi-share fs-5" style="cursor: pointer" onclick="clipUrl()"></i></p>				
							</div>
						</div>
					</div>
				</div>
				
				<div class="row">
				   <div class="col-2 pe-0" style="min-width: 120px; color: #f68a42;">
					<c:set var="avgRating" value="${reviewRating}" /> <!-- 가져온 평균 평점 (예시) -->
					<c:set var="maxRating" value="5" /> <!-- 최대 평점 -->
												    
				    <c:set var="wholeStars" value="${avgRating - avgRating % 1}" /> <!-- 정수 부분 (예: 4.6 -> 4) -->
					<c:set var="halfStar" value="${avgRating - wholeStars}" /> <!-- 소수 부분 (예: 4.6 -> 0.6) -->
						
						<c:forEach begin="1" end="${maxRating}" varStatus="loop">
						  <c:choose>
						    <c:when test="${loop.index le wholeStars}">
						      <i class="bi bi-star-fill"></i> <!-- 평점의 정수 부분만큼 채워진 별 아이콘을 출력 -->
						    </c:when>
						    <c:when test="${loop.index eq wholeStars + 1 and halfStar gt 0}">
						      <i class="bi bi-star-half"></i>  <!-- 평점의 정수 부분에 반개짜리 별 아이콘을 출력 -->
						    </c:when>
						    <c:otherwise>
						      <i class="bi bi-star"></i> <!-- 나머지 빈 별 아이콘을 출력 -->
						    </c:otherwise>
						  </c:choose>
						</c:forEach>
				    </div>
				    <div class="col">
				    	<span style="font-weight: 900; font-size: 14px; color: #f68a42">${reviewCount}개 리뷰</span>
				    </div>
			    </div>
			    
			    <div class="row">
			    	<div class="col">
				    	<p class="py-2" style="line-height: 1.7; letter-spacing: -0.2px;">
							${data.rentalItemDto.item_description}
						</p>
			    	</div>
			    </div>
				
				<div class="row">
					<div class="col">
						<p class="mb-3"><span style="font-weight: 900; font-size: 28px; letter-spacing: -0.6px;"><fmt:formatNumber value="${data.rentalItemDto.price}" pattern="#,##0" />원 </span><span class="text-secondary">/ 월</span></p>						
						<p class="text-black-50">무료배송(업체직접배송)</p>	
					</div>
				</div>
				
				<div class="row">
					<div class="col px-0">
						<div class="bg-body-tertiary p-3 rounded-1">
							<p class="mb-0" style="font-size: 14px;"><i class="bi bi-truck"></i> <span class="fw-bold">8/4</span> 이내 도착 예정</p>
						</div>
					</div>
				</div>
				
				<div class="row mt-4">
					<p class="mb-1">*보증금 <fmt:formatNumber value="${data.rentalItemDto.deposit}" pattern="#,##0" />원</p>	
					<table class="table table-bordered">
					  <thead>
					    <tr>
					    	<c:forEach items="${data.rentalPeriodDiscDtoList}" var="periodItem">
						      <td class="text-center bg-body-tertiary" scope="col">${periodItem.rental_period}개월</td>
					    	</c:forEach>
					    </tr>
					  </thead>
					  <tbody>
					    <tr>
					      	<c:forEach items="${data.rentalPeriodDiscDtoList}" var="periodItem2">
						      <td class="text-center fw-bold" scope="col"><fmt:formatNumber value="${periodItem2.discounted_price}" pattern="#,##0" />원</td>
					    	</c:forEach>
					    </tr>
					  </tbody>
					</table>
				</div>

				
				<div class="row mt-3 pt-3 justify-content-between border-top">
					<div class="col">
						<i class="bi bi-house"></i> <span class="mb-0" style="font-weight: 700; color: #585858;"> ${data.rentalBusinessDto.business_name}</span>
					</div>
					<div class="col text-end">
						<span style="padding: 4px 6px; border-radius: 8px; background: #e7e7e7; font-size: 13px; color: #8d8d8d; font-weight: bold; cursor: pointer" onclick="alert_warning()">브랜드홈 &gt;</span>
					</div>
				</div>
				
				<div class="row mt-3">
					<div class="col rounded-3" style="background: #f4f4f4;">
						<div class="row p-3">
							<div class="col">
								<p class="mb-0 fw-bold fs-5">제휴카드 할인 혜택 ></p>
								<p class="mb-0 mt-2">(총 8개)</p>
							</div>
							<div class="col text-end">
								<p class="mb-0">월 최대</p>
								<p class="mb-0  mt-2 fw-bold fs-5">-23,000원</p>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row mb-4">
					<div class="col">
						<div class="d-flex justify-content-end mt-5">
							<%-- <p class="text-body-secondary">남은 수량 ${data.rentalItemDto.quantity}</p> --%>
							<a href="./orderConfirmPage?id=${data.rentalItemDto.id}" class="btn btn-dark" style="width: 240px;">주문하기</a>	
						</div>
					</div>
				</div>
				
<%-- 				<div class="row mt-5" >
					<div class="col mt-3 px-0">
						<img class="img-fluid rounded-3" alt="" src="${pageContext.request.contextPath}/resources/img/rental/desc_banner.png">
					</div>
				</div> --%>
					
			</div>
		</div>
		
		<div class="row mt-5">
			<div class="col">
				<img class="img-fluid rounded-3" alt="" src="${pageContext.request.contextPath}/resources/img/rental/banner_m.png">
			</div>
		</div>
		
		<div class="row">
			<div class="col mt-5">
				<div class="row nav d-flex justify-content-center nav-pills mb-5 pb-4 border-bottom" id="v-pills-tab">
					<div class="col">
				    	<button class="btn w-100 rounded-1 active" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button" role="tab" style="font-size: 20px;">상품상세</button>
					</div>
					<div class="col">
				    	<button class="btn w-100 rounded-1" id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#v-pills-profile" type="button" role="tab" style="font-size: 20px;">의견/리뷰</button>
					</div>
			 	</div>
			</div>
		</div>
		
		  <div class="row mt-1 pt-1">
		  	<div class="col">
			  <div class="w-100 d-flex justify-content-center tab-content pt-4" id="v-pills-tabContent">
			    <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab" tabindex="0">
 					<c:forEach items="${data.rentalItemImgDtoList}" var="img">
						<div>
							<img class="img-fluid" alt="" src="/safariImg/${img.img_link}">
						</div>
					</c:forEach>
			    </div>
			    
			    <div class="tab-pane fade w-100" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab" tabindex="0">
				    <div class="container">
				    	<div class="row px-5">
				    		<div class="col">
				    			<div class="row">
				    				<div class="col">
				    					<p class="fw-bold fs-5">리뷰 <span style="color: #f68a42;">${reviewCount}</span></p>
				    				</div>
				    			</div>
				    		</div>
				    	</div>
				    	
				    	<div class="row px-5">
				    		<div class="col p-5 rounded-3" style="max-width: 480px; background: #f2f5fb;">
				    			<div class="row">
					    			<div class="col	mt-1">
						    			<div class="row">
											<div class="col fs-3 text-warning">
												<c:set var="avgRating" value="${reviewRating}" />
												<c:set var="maxRating" value="5" />
																			    
											    <c:set var="wholeStars" value="${avgRating - avgRating % 1}" />
												<c:set var="halfStar" value="${avgRating - wholeStars}" />
													
													<c:forEach begin="1" end="${maxRating}" varStatus="loop">
													  <c:choose>
													    <c:when test="${loop.index le wholeStars}">
													      <i class="bi bi-star-fill"></i>
													    </c:when>
													    <c:when test="${loop.index eq wholeStars + 1 and halfStar gt 0}">
													      <i class="bi bi-star-half"></i>
													    </c:when>
													    <c:otherwise>
													      <i class="bi bi-star"></i>
													    </c:otherwise>
													  </c:choose>
													</c:forEach>
										   		 </div>
									    	</div>
							    		</div>
							    		<div class="col">
							    			<p class="fs-2 mb-0" style="font-weight: 900;">${reviewRating}</p>
							    		</div>
				    			</div>
				    		</div>
				    	</div>
				    	
				    	<div class="row">
				    		<div class="col">
				    			<ul class="list-group list-group-flush px-5" id="review_list">
				 		    		<c:forEach items="${reviewData}" var="review">
						    			<li class="list-group-item py-3 mt-4 border border-0">
						    				<div class="row w-100">
							    				<div class="col">
							    					<div class="row">
							    						<div class="col">
							    							<div class="row">
							    								<div class="col-1 d-flex justify-content-center align-items-center" style="max-width: 68px;">
											    					<div class="rounded-circle bg-secondary-subtle me-0" style="width: 40px; height: 40px;"></div>				    								
							    								</div>
							    								<div class="col px-0">
							    									<div class="row">
							    										<div class="col">
																    		<p class="mb-0 mt-1"><small>${review.reviewer.nickname}</small> <small class="text-black-50">| <fmt:formatDate value="${review.reviewList.reg_date }" pattern="yyyy.MM.dd"/></small></p>		    											    										
							    										</div>
							    									</div>
							    									<div class="row">
							    										<div class="col">
																			<div class="row">
																				<div class="col text-warning" style="font-size: 13px;">
																					<c:set var="avgRating" value="${review.reviewList.rental_review_rating}" />
																					<c:set var="maxRating" value="5" />
																												    
																				    <c:set var="wholeStars" value="${avgRating - avgRating % 1}" />
																					<c:set var="halfStar" value="${avgRating - wholeStars}" />
																						
																						<c:forEach begin="1" end="${maxRating}" varStatus="loop">
																						  <c:choose>
																						    <c:when test="${loop.index le wholeStars}">
																						      <i class="bi bi-star-fill"></i>
																						    </c:when>
																						    <c:when test="${loop.index eq wholeStars + 1 and halfStar gt 0}">
																						      <i class="bi bi-star-half"></i>
																						    </c:when>
																						    <c:otherwise>
																						      <i class="bi bi-star"></i>
																						    </c:otherwise>
																						  </c:choose>
																						</c:forEach>
																			   		 </div>
																		    	</div>
							    										</div>
							    									</div>
							    								</div>
							    							</div>
							    						</div>
							    					</div>
							    					
							    					<div class="row mt-3">
							    						<div class="row">
							    							<div class="col">
							    								<p class="text-body-secondary"><span>&#124; </span>${review.rentalItemDto.title }</p>
							    							</div>
							    						</div>
							    						<div class="row">
							    							<div class="col px-1">
									    					<c:forEach items="${review.reviewImgList}" var="imgList">
									    					 	<img alt="" src="/safariImg/${imgList.rental_review_img}" class="ms-2" style="width: 100px;">			    					
									    					</c:forEach>
							    							</div>
							    						</div>
							    					</div>
							    					
							    					<div class="row mt-3">
							    						<div class="col">
										    				<p class="fw-bold mb-0 text-dark-emphasis">${review.reviewList.rental_review_title}</p>
										    				<p class="mb-1 text-body-secondary">${review.reviewList.rental_review_content}</p>
										    				<p class="reviewStarBox mb-0" data-numberof="${review.reviewList.rental_review_rating}"></p>
							    						</div>
							    					</div>
							    					
							    				</div>		    				
						    				</div>
										</li>
						    		</c:forEach> 
			    				</ul>
				    		</div>
				    	</div>
				    </div>
				    
			    </div>
			  </div>
			  </div>
			</div>
    	</div>
	
	
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->
<script>

function clipUrl() {
	let url = '';
	let textarea = document.createElement("textarea");
	document.body.appendChild(textarea);
	url = window.document.location.href;
	textarea.value = url;
	textarea.select();
	document.execCommand("copy");
	document.body.removeChild(textarea);
	alert("주소가 복사되었습니다!")
}

function alert_warning(){
	alert('준비중 입니다!')
}
</script>

</body>	
</html>
