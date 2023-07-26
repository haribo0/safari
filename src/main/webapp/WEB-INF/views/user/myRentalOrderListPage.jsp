<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사파리 | 메인</title>
<!-- 메타 섹션 -->
<jsp:include page="../common/meta.jsp"></jsp:include>
<script src="https://kit.fontawesome.com/a83ecfd9ee.js" crossorigin="anonymous"></script>
<!-- 메타 섹션 -->
<style>
.btn-ordered{padding: 2px 8px; background:#dff5ea; color:#6db590; border-radius: 8px; font-size:12px; font-weight: bold; width: 64px; }
.btn-shipping{padding: 2px 8px; background:#dfebf5; color:#689cdd; border-radius: 8px; font-size:12px; font-weight: bold; width: 64px;}
.btn-finished{padding: 2px 8px; background:#cbcbcb; color:#fff; border-radius: 8px; font-size:12px; width: 64px;}

.listHover{transition: all 0.125s ease;}
.listHover:hover{background-color: #f0f1f3;}

.btnMyReview:hover {
	background: #e1732a !important;
}
.review-reply {
  background-color: #f5f5f5;
  border-radius: 10px;
  position: relative;
}

/*  */ /* 별점 */ /*  */
#full-stars-example-two {
  /* use display:inline-flex to prevent whitespace issues. alternatively, you can put all the children of .rating-group on a single line */
  .rating-group {
    display: inline-flex;
  }
  /* make hover effect work properly in IE */
  .rating__icon {
    pointer-events: none;
  }
  /* hide radio inputs */
  .rating__input {
   position: absolute !important;
   left: -9999px !important;
  }
  /* hide 'none' input from screenreaders */
  .rating__input--none {
    display: none
  }
  /* set icon padding and size */
  .rating__label {
    cursor: pointer;
    padding: 0 0.1em;
    font-size: 2rem;
  }
  /* set default star color */
  .rating__icon--star {
    color: orange;
  }
  /* if any input is checked, make its following siblings grey */
  .rating__input:checked ~ .rating__label .rating__icon--star {
    color: #ddd;
  }
  /* make all stars orange on rating group hover */
  .rating-group:hover .rating__label .rating__icon--star {
    color: orange;
  }
  /* make hovered input's following siblings grey on hover */
  .rating__input:hover ~ .rating__label .rating__icon--star {
    color: #ddd;
  }
}
/*  */ /* 별점 */ /*  */


</style>
</head>
<body>
<!-- 반납 모달 -->
<div class="modal fade" id="modalReturn">
  <div class="modal-dialog">
  	<form method="post">
	    <div class="modal-content">
	      <div class="modal-header position-relative">
	        <h1 class="modal-title position-absolute top-50 start-50 translate-middle fs-5" id="exampleModalLabel">반납신청서</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      	<div class="container">
	      		<div class="row flex-column mt-2 p-1">
	      			<div class="col py-2 px-3 border rounded-1">
	      				<div class="row">
	      					<div class="col ">
			      				<p class="fs-6 fw-bold mb-2"><span class="regiMonthP"></span>개월 정기대여</p>	      					
	      					</div>
	      				</div>
	      				<div class="row">
			      			<div class="col border-top">
			      				<div class="row justify-content-between ">
			      					<div class="col-4 my-auto">
					      				<img class="modalTopImage img-fluid" alt="" src="">
			      					</div>
			      					<div class="col align-items-center my-auto">
					      				<div class="text-secondary  mb-0" style="font-size: 14px;">대여 기간 <span class="startDateP"></span> - <span class="endDateP"></span></div>
					      				<div class="modal-tit fw-bold fs-6 mt-1"></div>
					      				<div><span class="usedPriceP mt-2"></span><small> 원 / 월</small></div>
			      					</div>
			      				</div>
			      			</div>
	      				</div>
	      				
	      			</div>
					<div class="col py-2 px-3 mt-3 border rounded-1">

						<div class="row">
							<div class="col py-2 d-flex justify-content-between">
								<p class="mb-0">약정 할인 해지금액</p>
							</div>
						</div>
						<div class="row">
							<div class="col pt-2 pb-0 d-flex justify-content-between">
								<small class="text-secondary">&#x2514; 월 약정 할인금액</small>
								<p class="mb-0"><span class="minusPriceP"></span>원</p>
							</div>
						</div>
						<div class="row">
							<div class="col pt-2 pb-0 d-flex justify-content-between">
								<small class="text-secondary">&#x2514; 할인 적용 개월수 </small>
								<p class="mb-0">( * ) <span class="usedMonthP"></span>개월</p>
							</div>
						</div>
						<div class="row mt-3 border-top">
							<div class="col py-2 d-flex justify-content-between">
								<p>총계</p>
								<p class="fw-bold fs-5"><span class="finPriceP"></span>원</p>
							</div>
						</div>
					</div>
	      		</div>
	      		
	      		<div class="row justify-content-between">
	      			<div class="col">
	      				<div class="row justify-content-between">
	      					<div class="col d-flex align-items-center">
			      				<p class="modal-tit fw-bold fs-4 mb-0"></p>
	      					</div>
	      					<div class="col d-flex justify-content-end">
			      				<img class="modalTopImage" alt="" src="" style="width: 80px;">
	      					</div>
	      				</div>
	      			</div>
	      		</div>
	      		
	      	</div>
			<!-- <p class="me-5">반납하게 되시는 날은 다음과 같습니다: <span class="date_return"></span></p>  -->
			<p class="return_desc"></p>
	      </div>
	      
	      <div class="modal-footer">
	        <span class="btn btn-outline-dark" data-bs-dismiss="modal">취소</span>
	        <span class="btn btn-dark" id="submitReturn">반납신청</span>
	      </div>
	    </div>
    </form>
  </div>
</div>			
<!-- 반납 모달 -->

<!-- 대여 리뷰 모달  -->
<div class="modal fade" id="modalReview">
  <div class="modal-dialog">
  	<form method="post" enctype="multipart/form-data">
	    <div class="modal-content">
	      <div class="modal-header  bg-light">
	        <h1 class="modal-title fs-5 bg-light" id="exampleModalLabel">리뷰등록</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">

	      	<div class="row mx-3 mt-2 card ">
	      		<div class="col ">
	      			<div class="row border-bottom py-2 fw-medium ">
						<div class="col my-auto">
							상품 정보
						</div>
	      			</div>
	      			<div class="row  py-4   rounded-2" >
						<div class="col-3 my-auto">
		 					<img class="reviewModalTopImage img-fluid" alt="" src="">
						</div>
			      		<div class="col ">
			      			<div class="row">
				      			<div class="col">
				      				<div class="reviewItemTitle mb-1 fw-medium" style="font-size: 20px;"></div>
				      			</div>
			      			</div>
			      			<div class="row">
				      			<div class="col text-truncate">
				      				<div class="reviewItemDesc mb-0 text-secondary text-truncate" style="font-size: 14px;"></div>
				      			</div>
			      			</div>
			      			<div class="row">
				      			<div class="col">
				      				<div class="reviewPeriod"></div>
				      			</div>
			      			</div>
			      			
			      		</div>
	      			</div>
	      		</div>
	      	</div>
	      
	      	<div class="row mt-4 mx-3">
	      		<div class="col">
	      			<div class="row pt-0">
						<div class="col ">
							<p class="mb-0 fw-bold">별점</p>
			      			<div id="full-stars-example-two">
			      			<input type="hidden" value="" name="rental_review_rating" class="ratingVal">
							    <div class="rating-group">
							        <input disabled="" checked="" class="rating__input rating__input--none" name="rating3" id="rating3-none" value="0" type="radio">
							        <label aria-label="1 star" class="rating__label" for="rating3-1"><i class="rating__icon rating__icon--star fa fa-xs fa-star" aria-hidden="true"></i></label>
							        <input class="rating__input" name="rating3" id="rating3-1" value="1" type="radio">
							        <label aria-label="2 stars" class="rating__label" for="rating3-2"><i class="rating__icon rating__icon--star fa fa-xs fa-star" aria-hidden="true"></i></label>
							        <input class="rating__input" name="rating3" id="rating3-2" value="2" type="radio">
							        <label aria-label="3 stars" class="rating__label" for="rating3-3"><i class="rating__icon rating__icon--star fa fa-xs fa-star" aria-hidden="true"></i></label>
							        <input class="rating__input" name="rating3" id="rating3-3" value="3" type="radio">
							        <label aria-label="4 stars" class="rating__label" for="rating3-4"><i class="rating__icon rating__icon--star fa fa-xs fa-star" aria-hidden="true"></i></label>
							        <input class="rating__input" name="rating3" id="rating3-4" value="4" type="radio">
							        <label aria-label="5 stars" class="rating__label" for="rating3-5"><i class="rating__icon rating__icon--star fa fa-xs fa-star" aria-hidden="true"></i></label>
							        <input class="rating__input" name="rating3" id="rating3-5" value="5" type="radio">
							    </div>
							</div>
				      	</div>
					</div>
	      			<div class="row my-3">
	      				<div class="col">
	      				 	<div class="row pb-1"> 
		      				 	<div class="col"> 
	      				 			<span class="fw-bold">제목</span> 
		      				 	</div>
	      				 	</div>
	      				 	<div class="row "> 
		      				 	<div class="col"> 
	      				 			<input type="text" name="rental_review_title" class="form-control mt-1"> 
		      				 	</div>
	      				 	</div>
							      				
	      				</div>
	      			</div>
	      			
	      			<div class="row my-3">
	      				<div class="col">
	      					<div class="row pb-1"> 
		      				 	<div class="col "> 
	      				 			<span class="fw-bold">내용</span>  
		      				 	</div>
	      				 	</div>
	      				 	<div class="row"> 
		      				 	<div class="col"> 
	      				 			<textarea rows="4" cols="" class="form-control" name="rental_review_content mt-1"></textarea>
		      				 	</div>
	      				 	</div>
							
							
	      				</div>
	      			</div>
	      			
					
					
	      			<div class="row my-3 mb-4">
	      				<div class="col fw-bold">
	      					<div class="row mb-1"> 
		      				 	<div class="col"> 
	      				 			<span class="fw-bold">이미지첨부</span>  
		      				 	</div>
	      				 	</div>
	      					<div class="row"> 
		      				 	<div class="col"> 
	      				 			<input name="rental_review_img" type="file" multiple accept="image/*" class="form-control">
		      				 	</div>
	      				 	</div>
							
	      				</div>
	      			</div>
	      			
	      		</div>
	      	</div>
	      </div>
	      
	      <div class="modal-footer  bg-light">
	        <span class="btn btn-outline-dark" data-bs-dismiss="modal">취소</span>
	        <button type="submit" class="btn btn-dark">작성</button>
	      </div>
	      
	    </div>
    </form>
  </div>
</div>
<!-- 대여 리뷰 모달  -->			

<!-- 조건 반납 모달 -->
	<div class="modal" tabindex="-1" id="modalConfirm">
	  <div class="modal-dialog">
	  <form action="">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">대여 반납 확인서</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		      	<div class="row border rounded-2 mx-auto" style="width: 99%;">
		      		<div class="col-3">
		      			<img class="confirmModalImg img-fluid" alt="" src="">
		      		</div>
		      		<div class="col d-flex flex-column justify-content-center">
		      			<p class="mb-0 confirmModalItemTitle fs-5 fw-medium"></p>
		      			<p class="mb-0 confirmModalItemDesc"></p>
		      		</div>
		      	</div>
		      	
		      	<div class="row my-3">
		      		<div class="col mt-3 text-center">
		      			<p class="mb-0 userDesc"></p>
		      		</div>
		      	</div>
		      	
		      </div>
		      
		      <div class="modal-footer flex-column justify-content-start">
		      	<div class="row">
		      		<div class="col px-0">
		        		<small class="text-secondary">일주일 내 대여 제품을 택배로 보내주시면 감사하겠습니다.</small>
		      		</div>
		      	</div>
		      
		      	<div class="row">
		      		<div class="col px-0">
				        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">취소</button>
				        <button type="button" class="btn btn-dark"  id="confirmSubmitReturn">반납</button>
		      		</div>
		      	</div>
		      </div>
		    </div>
	    </form>
	  </div>
	</div>
<!-- 조건충족 반납 모달 -->

	<!-- 헤더 섹션 -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->
	
	<!-- 마이페이지 상단 블럭 -->
	<jsp:include page="../common/myPageTop.jsp"></jsp:include>
	<!-- 마이페이지 상단 블럭 -->

	<div class="container d-flex mt-5 px-0">
		<div class="row w-100">
		<!-- 마이페이지 leftnav -->
		<jsp:include page="../common/myPageNav.jsp"></jsp:include>
		<!-- 마이페이지 leftnav -->
		
		<div class="col ms-4">
			<div class="row" style="border-bottom: 2px solid #222; height: 48px;">
				<div class="col p-0">
					<h5>대여 주문 리스트</h5>						
				</div>
			</div>
			
			<div class="row mt-4">
				<div class="col" style="font-size: 15px;">
					<div class="my-0 text-secondary">· 아래는 대여한 목록 리스트 입니다.</div>
					<div class="my-0 text-secondary">· 렌탈 기간동안 고객의 책임 없는 사유로 상품의 고장·훼손 시 무상으로 수리 및 부품 교환을 해 드립니다.</div>
					<div class="my-0 text-secondary">· 단, 소비자의 귀책으로 인한 경우는 수리비 및 부품 교환 비용을 소비자가 보증금에서 부담해야 합니다.</div>
				</div>
			</div>
			
			<div class="row mt-4" style="border-top: 1px solid #919191; border-bottom: 1px solid #919191; background: #f7f7f7;">
				<div class="col-1 text-center">
					<p class="mb-0 py-3 fw-bold">주문번호</p>
				</div>
				<div class="col-6 text-center">
					<p class="mb-0 py-3 fw-bold">상품정보</p>
				</div>
				<div class="col text-center">
					<p class="mb-0 py-3 fw-bold">월 대여비</p>
				</div>
				<div class="col text-center">
					<p class="mb-0 py-3 fw-bold">주문상태</p>
				</div>
				<div class="col text-center">
					<p class="mb-0 py-3 fw-bold"></p>
				</div>
			</div>
			
			<div class="row">
			
				<div class="col px-0">
				<ul class="list-group myOrderedList pe-0">
					<c:if test="${rentalOrderDtoList.size() == 0}">
						<h3 class="text-center mt-5">주문한 대여 상품이 없습니다!</h3>
					</c:if>
					
					<c:forEach items="${rentalOrderDtoList}" var="data">
						<li class="list-group-item  py-4 border-0 border-bottom listHover">
							<div class="row">
								<div class="col-1 d-flex justify-content-center align-items-center">
									<p class="mb-0">${data.orderedItem.id }</p>
									<%-- <p class="mb-0"><fmt:formatDate value="${data.orderedItem.reg_date}" pattern="yyyy-MM-dd" /></p> --%>
								</div>
								
								<div class="col-6 d-flex justify-content-center align-items-center">
									<div class="row">
										<div class="col-3 d-flex align-items-center" >
											<a href="${pageContext.request.contextPath}/rental/productDescPage?id=${data.product.id}">
												<img alt="" src="/safariImg/${data.product.main_img_link}" class="rounded-1 img-fluid my-auto" >
											</a>
										</div>
										<div class="col my-auto pe-5">
										<a href="${pageContext.request.contextPath}/rental/productDescPage?id=${data.product.id}">
											<p class="mb-0 "><small>${data.rentalBusinessDto.business_name}</small></p>
											<p class="mb-2 fs-5 fw-medium" >${data.product.title }</p>
											<p class="mb-0 " style="font-size: 15px;">대여기간 <fmt:formatDate pattern="yyyy-MM-dd" value="${data.orderedItem.start_date }" /> - <fmt:formatDate pattern="yyyy-MM-dd" value="${data.orderedItem.end_date }" /></p>	
										</a>
										</div>
									</div>
								</div>
								
								<div class="col d-flex justify-content-center align-items-center">
									<p class="mb-0"><span class="fw-bold"><fmt:formatNumber value="${data.orderedItem.price }" pattern="#,##0" />원</span> <small>/월</small></p>
								</div>
								
																						
								<div class="col d-flex justify-content-center align-items-center">
								<c:choose>
										<c:when test="${data.isCompleted == 'Y'}">
											<span class="mb-0 fw-bold text-secondary">대여종료</span>				
									    </c:when>
									    
										<c:when test="${data.rentalItemReturnDto.is_item_returned == 'N'}">
											<span class="mb-0 fw-bold" style="color: #f68a42">회수중</span>				
									    </c:when>
									    
									    <c:when test="${data.rentalItemReturnDto.is_item_returned == 'Y'}">
											<span class="mb-0 fw-bold" style="color: #f68a42">정산중</span>				
									    </c:when>
									    <c:when test="${data.orderedItem.is_shipped == 'N'}">
							                <div class="mb-0 fw-bold" style="color: #f68a42">배송중</div>
							            </c:when>
							            
					            		<c:when test="${data.rentalItemReturnDto.is_item_returned == 'N' && data.isCompleted == 'N' }">
					            			<div class="mb-0 fw-bold" style="color: #f68a42">회수중</div>
					            		</c:when>
									    
									    
										<c:otherwise>
											<c:choose>
												<c:when test="${data.orderedItem.is_shipped == 'N' }">
													<span class="mb-0 fw-bold" style="color: #f68a42">주문완료</span>										
												</c:when>
												<c:when test="${data.orderedItem.is_shipped == 'Y'}">
													<span class="mb-0 fw-bold" style="color: #f68a42">대여중</span>
												</c:when>
											</c:choose>
										</c:otherwise>
									    
									</c:choose>
								</div>
								
								<div class="col d-flex justify-content-center align-items-center">
									<div class="row">
										<div class="col">
											<c:choose>
											    <c:when test="${data.isCompleted == 'Y' && data.myReviewCount == 0}">
											        <button type="button" class="btn btn-outline-dark my-2 px-2 py-1" style="font-size:13px;" data-order-id="${data.orderedItem.id}" data-bs-toggle="modal" data-bs-target="#modalReview">대여리뷰작성</button>																				
											    </c:when>
											    <c:when test="${data.isCompleted == 'Y' && data.myReviewCount >= 1}">
											        <button class="btn btn-outline-dark my-2 px-2 py-1" onclick="placeReviewDate(${data.orderedItem.id})" style="font-size:13px;">내가 쓴 리뷰</button>																				
											    </c:when>
											    
											    
											    
											    <c:when test="${data.isCompleted != 'Y'}">
											        <c:choose>
											            <c:when test="${data.orderedItem.is_shipped == 'N'}">
											                <!-- <div class="p-1" style="font-size:14px;">배송중</div> -->
											            </c:when>
											            
									            		<c:when test="${data.rentalItemReturnDto.is_item_returned == 'N' && data.isCompleted == 'N' }">
									            			<div class=" p-1" style="font-size:14px;">회수중</div>
									            		</c:when>
											            		
											            <c:otherwise>
											            	<c:choose>
											            		<c:when test="${data.rentalItemReturnDto.is_item_returned != 'Y'}">
													                <button type="button" class="btn btn-outline-dark px-2 py-1" style="font-size:13px;" onclick="returnCheck(this)"
													                	data-image-link="${data.product.main_img_link}" 
													                	data-product-title="${data.product.title}" 
													                	data-product-desc="${data.product.item_description}"
													                	data-order-id="${data.orderedItem.id}" 
													                	data-original-price="${data.orderedItem.original_price}" 
													                	data-rego-price="${data.orderedItem.price}" 
													                	data-startdate="${data.orderedItem.start_date }" 
													                	data-enddate="${data.orderedItem.end_date}" 
													                	data-deposit="${data.orderedItem.deposit}" 
													                	>
													               		 대여반납신청
													                </button>
											            		</c:when>
											            		
											            		<c:when test="${data.rentalItemReturnDto.is_item_returned == 'Y' && data.isCompleted != 'Y' }">
											            			<button type="button" class="btn btn-outline-secondary px-2 py-1" style="font-size:13px;" disabled>최종 정산중</button>
											            		</c:when>
											            		
											            		<c:otherwise>
											            			<div class=" p-1" style="font-size:13px;">배송전</div>
											            		</c:otherwise>
											            	</c:choose>
											            </c:otherwise>
											        </c:choose>
											    </c:when>
											</c:choose>
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
	
	<div class="modal modal-lg" id="showMyReviewModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-md modal-dialog-centered"> 
    <div class="modal-content">
      <div class="modal-header bg-light">
     	 <div class="row mb-0">
      			<div class="col fs-5 fw-medium">
      				마이 리뷰
      			</div>
      	 </div>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
      	      
	      <div id="testBox">
	      </div>
	     
	  </div>
	   <div class="modal-footer bg-light">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창닫기</button>
      </div> 
  </div>
</div>
</div>
	
	
	
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->


<script>
	let discList = []
	let itemDiscList = []
	let discPrice
	let finDiscPrice
	let formattedDate
	let userNickname
	//로그인된 세션 초기화
	let mySessionId = null;
	// 세션가져오기
	function getSessionId(){
		const xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				const response = JSON.parse(xhr.responseText);
				if(response.result == "success"){
					mySessionId = response.id; 
					userNickname = response.nickname
				}
			}
		}
		
		xhr.open("get", "../user/getMyId", false);
		xhr.send();		
	}
	
	// 할인 테이블 가져오기
	function getRentalPeriodDisc(id, regiMonth, originPriceVal) {
/*   		console.log("id:: ", id)
		console.log("regiMonth:: ", regiMonth)
		console.log("originPriceVal:: ", originPriceVal) */
		const xhr = new XMLHttpRequest()
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200){
				const response = JSON.parse(xhr.responseText);
				if(response.result == "success"){
					discList = response.rentalPeriodDiscDto
					afterAjaxRequest(regiMonth, originPriceVal);
				}
			}
		}
		xhr.open("get", "../rental/getRentalPeriodDisc?id="+id)
		xhr.send();	
	}
	
	function afterAjaxRequest(regiMonth, originPriceVal) {
		for(let j = 0; j<discList.length; j++){
			let str = originPriceVal;
			let result = str.replace(/,/g, '');
			console.log("디스카운트 테이블:: ", discList[j])
			if(regiMonth >= discList[j].rental_period) {
				discPrice = discList[j].discounted_price
				console.log("원래가격:: ", parseInt(result), "할인기준가격:: ", discPrice)
				console.log("계산가격:: ", parseInt(result) - discPrice)
				finDiscPrice = parseInt(result) - discPrice
				
			}
		}
	}
	
	// 반납시 사용기간 계산 퍼센트 처리
	function calcEarlyReturn(startDate, oiginEndDate, endDate) {
		  const msInDay = 24 * 60 * 60 * 1000;
	
		  const originDayLeft = Math.round(
		    Math.abs(oiginEndDate - startDate) / msInDay 
		  );
		  
		  const returnedLeft = Math.round(
		    Math.abs(endDate - startDate) / msInDay 
		  );
	/* 	  console.log("originDayLeft:: ", originDayLeft)
		  console.log("returnedLeft:: ", returnedLeft)
		  console.log(Math.round(returnedLeft / originDayLeft * 100)); */
		  
		  const percentageValue = `\${Math.round(returnedLeft / originDayLeft * 100)}`
		  
		  return percentageValue
		  
		}
	
// 반납시 사용기간 계산 퍼센트 처리
function calcPeriodPercentage(startDate, endDate) {
	  

    // 90퍼 계산 방법 
    // (오늘 - 시작일) / (종료일 - 시작일) * 100 
    // 사용기간 / 약정기간 * 100
	
	const currentDate = new Date();
	const percentage = (currentDate - startDate) / (endDate - startDate) * 100;

	return percentage;
	  
}
	
	
// 반납하게되는 날(오늘)
const setRegDate = () => {
      const today = new Date();
      const yyyy = today.getFullYear();
      const mm = String(today.getMonth() + 1).padStart(2, '0');
      const dd = String(today.getDate()).padStart(2, '0');
      formattedDate = `\${yyyy}-\${mm}-\${dd}`;
      const dateReturn = document.querySelector('.date_return')
	 // dateReturn.innerText = formattedDate
  };
  

const modalReturn = document.getElementById('modalReturn')
const modalReview = document.getElementById('modalReview')
const modalConfirm = document.getElementById('modalConfirm') 
// 조건 반납 모달



// 반납 안내 모달
function returnCheck(e) {
	
	let returnPercentage

    const button = e;
    const startDate = button.getAttribute('data-startdate')
    const endDate = button.getAttribute('data-enddate')
    const orderId = button.getAttribute('data-order-id')
    
	let startDateObj = new Date(startDate.replace('KST', 'GMT+0900'));    
	let endDateObj = new Date(endDate.replace('KST', 'GMT+0900'));

    const yyyy2 = startDateObj.getFullYear();
    const mm2 = String(startDateObj.getMonth() + 1).padStart(2, '0');
    const dd2 = String(startDateObj.getDate()).padStart(2, '0');
    formattedStartedDate = `\${yyyy2}-\${mm2}-\${dd2}`;
    
    const yyyy = endDateObj.getFullYear();
    const mm = String(endDateObj.getMonth() + 1).padStart(2, '0');
    const dd = String(endDateObj.getDate()).padStart(2, '0');
    formattedEndDate = `\${yyyy}-\${mm}-\${dd}`;
    
    const currentDate = new Date();
	// returnPercentage = calcEarlyReturn(new Date(formattedStartedDate), new Date(formattedEndDate), new Date(formattedDate))		
	 
	const returnDesc = document.querySelector(".return_desc")
	returnDesc.innerHTML = ''
    const endRego = new Date();
    const originalPrice= button.getAttribute('data-original-price')
    const price = button.getAttribute('data-rego-price')
    // console.log("regi price", price)
    const deposit = button.getAttribute('data-deposit')
    const productTitle = button.getAttribute('data-product-title')
    const submitReturn = document.getElementById("submitReturn")
    const dataImageLink = button.getAttribute('data-image-link')
    const productDesc = button.getAttribute('data-product-desc')
    const form = modalReturn.querySelector('form')

    setRegDate()
    
    const remainMonth = getMonthDiffer(new Date(formattedDate),new Date(formattedEndDate))
    const calcedPrice = originalPrice - price
    const refundMoney = calcedPrice * remainMonth
   
    let span = document.createElement('span')
    let modalTit = document.querySelector('.modal-tit')
    let originPriceVal = parseInt(originalPrice).toLocaleString('ko-KR')
    let regiMonthP = document.querySelector('.regiMonthP')
    let startDateP = document.querySelector('.startDateP')
    let endDateP = document.querySelector('.endDateP')
    let finPriceP = document.querySelector('.finPriceP')
    let usedPriceP = document.querySelector('.usedPriceP')
    let usedMonthP = document.querySelector('.usedMonthP')
    let modalTopImage = document.querySelector('.modalTopImage')
    let minusPriceP = document.querySelector('.minusPriceP')
    
    let regiMonth = getMonthDiffer(new Date(formattedStartedDate), new Date(formattedEndDate)) // 남은 달
    let calcMonth = getMonthDiffer(new Date(formattedStartedDate), new Date(formattedDate)) // 사용한 달

    getRentalPeriodDisc(orderId, regiMonth, originPriceVal)
    
    modalTit.innerText = productTitle
    usedPriceP.innerText = parseInt(price).toLocaleString()
    regiMonthP.innerText = regiMonth
    usedMonthP.innerText = calcMonth
    startDateP.innerText = formattedStartedDate
    endDateP.innerText = formattedEndDate
    minusPriceP.innerText = calcedPrice.toLocaleString()
    finPriceP.innerText = parseInt(refundMoney).toLocaleString('ko-KR')

    modalTopImage.setAttribute('src', '/safariImg/'+dataImageLink)
    submitReturn.setAttribute('onclick', 'returnProcess(' + orderId + ',' + refundMoney + ', "'+ productTitle + '")')
    let days = (endDateObj - startDateObj)
    
   /*  console.log(returnPercentage);
    console.log(startDateObj);
    console.log(endDateObj);
    console.log(regiMonth);
    console.log(calcMonth);
    console.log(startDateObj > currentDate); */
    
    returnPercentage =  calcPeriodPercentage(startDateObj,endDateObj);
    
    // console.log(returnPercentage);
    // console.log(startDateObj > currentDate);
    
    
    /* 조건모달생성 */
    const confirmModalImg = document.querySelector('.confirmModalImg')
    const confirmModalItemTitle = document.querySelector('.confirmModalItemTitle')
    const confirmModalItemDesc = document.querySelector('.confirmModalItemDesc')
    const userDesc = document.querySelector('.userDesc')
    const confirmSubmitReturn = document.querySelector('#confirmSubmitReturn')
    
    confirmModalImg.setAttribute('src', '/safariImg/'+dataImageLink)
    confirmModalItemTitle.innerText = productTitle
    confirmModalItemDesc.innerText = productDesc
    
    userDesc.innerHTML = `기존 반납일은 <span class="fw-medium">\${formattedEndDate}</span> 입니다.`
    confirmSubmitReturn.setAttribute('onclick', 'returnProcessSingle(' + orderId + ')')
    
    // 오늘 날짜가 대여 시작일 보다 이전이거나 계약 기간의 90퍼센트 이상인 경우 - 추가 정산 XXX
    if(returnPercentage > 90  || startDateObj > currentDate ) {
    	const returnModal1 = bootstrap.Modal.getOrCreateInstance("#modalConfirm");
    	returnModal1.show();
    	return; 
    	
    } else { // 그 외에는 할인 기간 계산 
    	const returnModal2 = bootstrap.Modal.getOrCreateInstance("#modalReturn");
    	returnModal2.show();
    }
    

}


// 리뷰 작성 모달
if (modalReview) {
	modalReview.addEventListener('show.bs.modal', event => {
    const button = event.relatedTarget
    const orderId = button.getAttribute('data-order-id')
    const form = modalReview.querySelector('form')
    const ratingGroup = document.querySelector('.rating-group')
    let itemTitle = document.querySelector('.reviewItemTitle')
    let itemDesc = document.querySelector('.reviewItemDesc')
    let reviewPeriod = document.querySelector('.reviewPeriod')
    let reviewModalTopImage = document.querySelector('.reviewModalTopImage')
    
    const dataImageLink = button.getAttribute('data-image-link')
    const dataItemTitle = button.getAttribute('data-product-title')
    const dataProduceDesc = button.getAttribute('data-produce-desc')
    const dataStartdate = button.getAttribute('data-startdate')
    
    reviewModalTopImage.setAttribute('src', '/safariImg/'+dataImageLink)
   	itemTitle.innerText = dataItemTitle
    itemDesc.innerText = productDesc
    
    ratingGroup.addEventListener('click', function() {
        let rentalReviewRating = document.querySelector('.ratingVal')
        // Get the star rating group element
    	let ratingGroup = document.querySelector('#full-stars-example-two .rating-group');
    	// Get the checked input element within the rating group
    	let checkedInput = ratingGroup.querySelector('input:checked');
    	// Get the value of the checked input element
    	let ratingValue = checkedInput ? checkedInput.value : null;
    })
	
	
    form.setAttribute('action', `../rental/writeRentalReviewProcess?rental_id=\${orderId}`)
    
    setRegDate()
  })
}

function getMonthDiffer(startMonth, endMonth) {
	  return (
	    endMonth.getMonth() -
	    startMonth.getMonth() +
	    12 * (endMonth.getFullYear() - startMonth.getFullYear())
	  );
}



function returnProcess(orderId,refundMoney,productTitle) {
/* 	console.log('리턴프로세스 매개변수 orderId:: ',orderId )
	console.log('리턴프로세스 매개변수 refundMoney:: ',refundMoney )
	console.log('리턴프로세스 매개변수 productTitle:: ',productTitle ) */
	const xhr = new XMLHttpRequest()

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			if(response.result == "success"){
				mySessionId = response.id; 
				const kakaoResult = JSON.parse(response.kakaoResult)
				
				console.log(kakaoResult.tid)
				
				location.href = kakaoResult.next_redirect_pc_url
				
			}
			
		}
	}
	
	xhr.open("get", "../rental/rentalReturnProcess?rental_order_id="+orderId+"&discount_revocation="+refundMoney+"&product_title="+productTitle);
	xhr.send();	
}

/* 내 리뷰보기 */
function showMyReview() {
	const showMyReviewModal = bootstrap.Modal.getOrCreateInstance("#showMyReviewModal");
	
	showMyReviewModal.show();
	
}

/* 리뷰AJAX호출먼저!! */
function placeReviewDate(id) {
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			if(response.result == "success"){
				let rentalReviewDto = response.rentalReviewDto;
				let rentalItemDto = response.rentalItemDto.rentalItemDto;
				console.log(rentalItemDto)
				
				showMyReview()
				let testBox = document.querySelector('#testBox')
				
					testBox.innerHTML = ''
					// Create the card element
					const card = document.createElement("div");
					card.classList.add("card", "mb-3");

					// Create the card body
					const cardBody = document.createElement("div");
					cardBody.classList.add("card-body");

					// Create the row for review title
					const titleRow = document.createElement("div");
					titleRow.classList.add("row");
					const titleCol = document.createElement("div");
					titleCol.classList.add("col", "fs-5", "fw-medium");
					titleCol.textContent = rentalReviewDto.rental_review_title;
					titleRow.appendChild(titleCol);

					// Create the row for user info
					const userInfoRow = document.createElement("div");
					userInfoRow.classList.add("row", "mt-1");
					const userIdCol = document.createElement("div");
					userIdCol.classList.add("col", "fs-6", "text-secondary");
					userIdCol.textContent = userNickname; 
					const dateCol = document.createElement("div");
					dateCol.classList.add("col", "fs-6", "text-secondary", "text-end");
					const reviewDate = new Date(rentalReviewDto.reg_date);
					const formattedDate = reviewDate.toLocaleDateString('en-US', {
					  year: 'numeric',
					  month: '2-digit',
					  day: '2-digit',
					});

					dateCol.textContent = formattedDate;
					userInfoRow.appendChild(userIdCol);
					userInfoRow.appendChild(dateCol);

					// Create the horizontal rule
					const hr = document.createElement("hr");
					hr.classList.add("border");
					
					const prdRateRow = document.createElement("div");
					prdRateRow.classList.add("row");
					const prdRateCol1 = document.createElement("div");
					prdRateCol1.classList.add("col-2");
					const imgElement = document.createElement("img");
					imgElement.setAttribute("src", `/safariImg/\${rentalItemDto.main_img_link}`); 
					imgElement.classList.add("img-fluid");
					prdRateCol1.appendChild(imgElement);
					prdRateRow.appendChild(prdRateCol1);
					
					const prdRateCol2 = document.createElement("div");
					prdRateCol2.classList.add("col");
					
					const productInfoRow = document.createElement("div");
					productInfoRow.classList.add("row");
					const productNameCol = document.createElement("div");
					productNameCol.classList.add("col");
					productNameCol.textContent = rentalItemDto.title;
					productInfoRow.appendChild(productNameCol);

					// Create the row for star rating
					const ratingRow = document.createElement("div");
					ratingRow.classList.add("row");
					const ratingCol = document.createElement("div");
					ratingCol.classList.add("col");
					for (let i = 0; i < 5; i++) {
					  const starIcon = document.createElement("i");
					  starIcon.style.color = '#f68a42'
					  if(i < rentalReviewDto.rental_review_rating) {
						  starIcon.classList.add("bi", "bi-star-fill", "small-icon");
					  } else {
						  starIcon.classList.add("bi", "bi-star", "small-icon");
					  }
					  ratingCol.appendChild(starIcon);
					}
					ratingRow.appendChild(ratingCol);
					
					prdRateCol2.appendChild(productInfoRow)
					prdRateCol2.appendChild(ratingRow)
					prdRateRow.appendChild(prdRateCol2);

					// Create the row for review content
					const contentRow = document.createElement("div");
					contentRow.classList.add("row", "my-4");
					const contentCol = document.createElement("div");
					contentCol.classList.add("col", "fw-light");
					contentCol.textContent =
						rentalReviewDto.rental_review_content;
					contentRow.appendChild(contentCol);

					// Create the horizontal rule
					const hr2 = document.createElement("hr");
					hr2.classList.add("border");

					// Create the row for reply section
					const replyRow = document.createElement("div");
					replyRow.classList.add("row", "mt-4");
					const replyCol = document.createElement("div");
					replyCol.classList.add("col", "fw-medium");
					replyCol.textContent = "답글";
					replyRow.appendChild(replyCol);

					// 답글 있을 경우 
					// Create the row for review content
					const replyBodyRow = document.createElement("div");
					replyBodyRow.classList.add("row", "mt-3", "mb-2", "fw-light");

					const replyBodyCol = document.createElement("div");
					replyBodyCol.classList.add("col", "review-reply", "p-3", "mx-3");
					replyBodyCol.textContent =rentalReviewDto.rental_reply_review;
					replyBodyRow.appendChild(replyBodyCol);

					// Append all elements to the productBox
					cardBody.appendChild(titleRow);
					cardBody.appendChild(userInfoRow);
					cardBody.appendChild(hr);
					cardBody.appendChild(prdRateRow);
					/* cardBody.appendChild(productInfoRow);
					cardBody.appendChild(ratingRow); */
					cardBody.appendChild(contentRow);
					cardBody.appendChild(hr2);
					cardBody.appendChild(replyRow);
					if(rentalReviewDto.rental_reply_review != null ) {
						cardBody.appendChild(replyBodyRow);
					} 
					card.appendChild(cardBody);
					testBox.appendChild(card);
				
			}
		}
	}
	
	xhr.open("get", "/safari/rental/getMyItemReview?id="+id, false);
	xhr.send();
}


window.addEventListener("DOMContentLoaded", function(){
	getSessionId()
	
});

</script>
</body>	
</html>