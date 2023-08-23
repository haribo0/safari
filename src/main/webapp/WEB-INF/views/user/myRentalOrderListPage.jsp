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
.gray-line{border-top:1px solid #e5e5e5;}
.gray-line-dark{border-top:1.5px solid #838383;}

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

<!--최종 정산 모달 -->
<div class="modal fade" id="modalFinSettlement">
  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header position-relative bg-light">
	        <h1 class="modal-title position-absolute top-50 start-50 translate-middle fs-5">주문 상세</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      	<div class="container">
 	      		<div class="row flex-column mt-2 p-1">
	      			<div class="col py-2 px-3 border rounded-1">
	      				<div class="row ">
	      					<div class="col ">
			      				<p class="fw-bold mb-2" style="font-size: 17px;">상품정보</p>	      					
	      					</div>
	      				</div>
	      				<div class="row">
			      			<div class="col border-top">
			      				<div class="row justify-content-between py-2 ">
			      					<div class="col-3 my-auto">
					      				<img class="modalFinModalTopImage img-fluid" alt="" src="">
			      					</div>
			      					<div class="col align-items-center my-auto">
					      				<div class="text-secondary d-none mb-0" style="font-size: 1px;">대여 기간 <span class="modalFinStartDateP"></span> - <span class="modalFinEndDateP"></span></div>
					      				<div class="modal-tit fw-semibold fs-6 mt-1"></div>
					      				<div><span class="modalFinUsedPriceP mt-2"></span><small> 원 / 월</small></div>
			      					</div>
			      				</div>
			      			</div>
	      				</div>
	      			</div>
	      			
	      			<div class="col pt-0 pb-3 px-3 mt-3 border rounded-1">
	      				<div class="row ">
							<div class="col py-2 d-flex justify-content-between border-bottom">
								<p class="mb-0 fw-bold" style="font-size: 17px;">주문정보</p>
							</div>
						</div>
						<!-- <div class="row mt-1">
							<div class="col pt-2 pb-0 d-flex justify-content-between">
								<small class="text-secondary"> 주문일</small>
								<p class="mb-0"><span class="modalFinStartDateS"></span></p>
							</div>
						</div> -->
						<div class="row mt-1">
							<div class="col pt-2 pb-0 d-flex justify-content-between">
								<small class="text-secondary"> 대여 시작일</small>
								<p class="mb-0"><span class="modalFinStartDateS"></span></p>
							</div>
						</div>
						<div class="row">
							<div class="col pt-2 pb-0 d-flex justify-content-between">
								<small class="text-secondary">대여 종료일</small>
								<p class="mb-0"><span class="modalFinEndDateS"></span></p>
							</div>
						</div>
	      			</div>
	      			
	      			
	      			<div class="col pt-0 pb-3 px-3 mt-3 border rounded-1">
	      				<div class="row">
							<div class="col py-2 d-flex justify-content-between border-bottom">
								<p class="mb-0 fw-bold" style="font-size: 17px;" >배송정보</p>
							</div>
						</div>
						<div class="row mt-1">
							<div class="col pt-2 pb-0 d-flex justify-content-between">
								<small class="text-secondary">수령인</small>
								<p class="mb-0"><span class="" id="delivery_recipient"></span></p>
							</div>
						</div>
						<!-- <div class="row">
							<div class="col pt-2 pb-0 d-flex justify-content-between">
								<small class="text-secondary">연락처</small>
								<p class="mb-0"><span class="" id="delivery_contact"></span></p>
							</div>
						</div> -->
						<div class="row">
							<div class="col pt-2 pb-0 d-flex justify-content-between">
								<small class="text-secondary">주소</small>
								<p class="mb-0"><span class="" id="delivery_address"></span></p>
							</div>
						</div>
						
	      			</div>
	      			
	      			
					<div class="col px-3 mt-3 border rounded-1 " id="returnPart">
						<div class="row">
							<div class="col py-2 d-flex justify-content-between border-bottom ">
								<p class="mb-0 fw-bold" style="font-size: 17px;">반납정보</p>
							</div>
						</div>
						<div class="row mt-1">
							<div class="col ms-1 pt-2 pb-0 d-flex justify-content-between">
								<span class="" style=""> 반납신청일</span>
								<p class="ms-2 mb-1"><span class="modalReturnDate" ></span> </p>
							</div>
						</div>
						<div class="row mt-1">
							<div class="col ms-1 pt-2 pb-0 d-flex justify-content-between">
								<span class="" style=""> 보증금</span>
								<p class="ms-2 mb-1"><span class="modalFinDeposit"></span>원</p>
							</div>
						</div>
						<div class="row " id="">
							<div class="col pt-2 pb-0 d-flex justify-content-between">
								<small class="text-secondary">&#x2514; 약정 할인 취소금 </small>
								<p class="mb-0"> <span class="modalFinCancelFee">( - )</span>원</p>
							</div>
						</div>
						<div class="row">
							<div class="col pt-2 pb-0 d-flex justify-content-between">
								<p class=" mb-1">반환 상품 상태 정산</p>
							</div>
						</div>
						<!-- <div class="row">
							<div class="col pt-2 pb-0 d-flex justify-content-between">
								<small class="text-secondary">&#x2514; 부분 분실 </small>
								<p class="mb-0">( - ) <span class="modalFinPartialLoss"></span>원</p>
							</div>
						</div> -->
						<div id="modalReturnFees">
						<div class="row">
							
							<div class="col pt-2 pb-0 d-flex justify-content-between">
								<small class="text-secondary">&#x2514; 부분 파손 </small>
								<p class="mb-0">( - ) <span class="modalFinPartialDamage"></span>원</p>
							</div>
						</div>
						</div>
						<div class="row mt-3 border-top">
							<div class="col py-3 d-flex justify-content-between">
								<p class="fs-5 fw-bold">총 반환 금액</p>
								<p class="fw-bold fs-5"><span class="modalFinFinPriceP"></span>원</p>
							</div>
						</div>
					</div>
	      		</div>
	      		
	      	</div>
			<p class="modalFinReturn_desc"></p>
	      </div>
	      
	      <div class="modal-footer bg-light" style="padding: 10px 14px">
	        <span class="btn btn-dark" data-bs-dismiss="modal">확인</span>
	      </div>
	    </div>
  </div>
</div>		

<!--최종 정산 모달 -->
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
								<p>총 금액</p>
								<p class="fw-bold fs-5"><span class="finPriceP"></span>원</p>
								
							</div>
						</div>
						
					</div>
	      		</div>
	      		
	      		<div class="text-secondary" style="font-size: 14px;">* 위 금액은 반납 후 정산시 보증금에서 차감됩니다. </div>
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
			      			<input type="hidden" value="" name="rental_review_rating" id="finReviewRating" class="ratingVal">
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
	      				 			<input type="text" name="rental_review_title" id="finReviewTitle" class="form-control mt-1"> 
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
	      				 			<textarea rows="4" cols="" class="form-control" id="finReviewContent" name="rental_review_content"></textarea>
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
	      				 			<input name="rental_review_img" id="finReviewFiles" type="file" multiple accept="image/*" class="form-control">
		      				 	</div>
	      				 	</div>
							
	      				</div>
	      			</div>
	      			
	      		</div>
	      	</div>
	      </div>
	      
	      <div class="modal-footer  bg-light">
	        <span class="btn btn-outline-dark" data-bs-dismiss="modal">취소</span>
	        <button class="btn btn-dark" onclick="doReview()">작성</button>
	      </div>
	      
	    </div>
  </div>
</div>
<!-- 대여 리뷰 모달  -->			

<!-- 조건 반납 모달 -->
	<div class="modal" tabindex="-1" id="modalConfirm">
	  <div class="modal-dialog">
	  <form action="">
		    <div class="modal-content">
		      <div class="modal-header bg-light">
		        <h5 class="modal-title">대여 반납 확인서</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
			      <div class="row px-2">
			      		<div class="col px-4 fw-bold">
			      			상품정보
			      		</div>
			      	</div>
		      		<div class="row px-4 mt-2">
			      		<div class="col gray-line-dark">
			      		</div>
			      	</div>
		      	
		      	<div class="row py-2 mt-1 mx-auto" style="width: 99%;">
		      		<div class="col-3">
		      			<img class="confirmModalImg img-fluid" alt="" src="">
		      		</div>
		      		<div class="col d-flex flex-column justify-content-center">
		      			<div class="mb-0 confirmModalItemTitle fw-medium"></div>
		      			<div class="mb-0 confirmModalItemDesc text-secondary" style="font-size: 14px;"></div>
		      			<div class="mb-0 confirmPrice mt-2" style="font-size: 14px;"></div>
		      		</div>
		      	</div>

		      	
		      	<div class="row mt-3 mx-auto border rounded-2" style="width: 99%; font-size: 13px;">
		      		<div class="col pb-2 mb-1">		      	
				      	<div class="row mt-3">
				      		<div class="col px-4 fw-bold" style="font-size: 16px;">
				      			반납내역
				      		</div>
				      	</div>
				      	<div class="row px-2 mt-3">
				      		<div class="col gray-line">
				      		</div>
				      	</div>
				      	
		      			<div class="row mt-2 justify-content-between">
		      				<div class="col px-4 py-2">
		      					기존반납일
		      				</div>
		      				<div class="col px-4 text-end py-2 userDesc">
		      				</div>
		      			</div>
		      			<div class="row justify-content-between">
		      				<div class="col px-4 py-2">
		      					반환 보증금
		      				</div>
		      				<div class="col px-4 text-end py-2 confirmDeposit fw-medium">
		      				</div>
		      			</div>
		      		</div>
		      	</div>
		      	
		      	<div class="row px-3 mb-2 mt-3" style="margin-top: 6px;">
	        		<div class="text-secondary" style="font-size: 11px;">* 반납 신청 후 반드시 일주일 내에 택배로 물품을 반납하셔야합니다. 일주일 내로 택배 접수<br>&nbsp; 처리가 되지 않을 경우 정기 결제가 계속 진행 될 수 있습니다. </div>	      			
	        		<div class="text-secondary mt-1" style="font-size: 11px;">* 일주일 내로 택배 접수 처리가 되지 않을 경우 정기 결제가 계속 진행 될 수 있습니다. </div>	      			
		      	</div>
<!-- 		      	
  		      	<div class="row my-3">
		      		<div class="col fw-bold text-center">
		      			반납 신청 하시겠습니까?
		      		</div>
		      	</div> -->
		      	
		      </div>
		      
		      <div class="modal-footer justify-content-end bg-light" style="padding: 8px 14px;">
		      	<div class="row">
		      		<div class="col px-0">
				        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">취소</button>
				        <button type="button" class="btn btn-dark"  id="confirmSubmitReturn">반납신청</button>
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
						<h5 class="text-center mt-5">주문한 대여 상품이 없습니다</h5>
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
											<div class="mb-0 my-auto"><small>${data.rentalBusinessDto.business_name}</small>
											
											<c:if test="${data.orderState == '대여중'}">
												<span class="ms-2 mb-0 d-inline-block" style="color: #fff; border:1px solid #f68a42; background:#f68a42; padding:0px 6px; font-size: 10px; border-radius: 12px; position: relative; bottom: 1.2px;">대여중</span>
											</c:if>
											
											</div>
											<div class="mb-2 fs-6 fw-medium" >${data.product.title }</div>
											<div class="mb-0 " style="font-size: 15px;">대여기간 <fmt:formatDate pattern="yyyy-MM-dd" value="${data.orderedItem.start_date }" /> - <fmt:formatDate pattern="yyyy-MM-dd" value="${data.orderedItem.end_date }" /></div>	
										</a>
										</div>
									</div>
								</div>
								
								<div class="col d-flex justify-content-center align-items-center">
									<p class="mb-0"><span class="fw-bold"><fmt:formatNumber value="${data.orderedItem.price }" pattern="#,##0" />원</span> <small>/월</small></p>
								</div>
								
																						
								<div class="col d-flex justify-content-center align-items-center" style="font-size: 15px;">
									${data.orderState}
								</div>
								
								<div class="col d-flex justify-content-center align-items-center">
									<div class="row" style="width: 100%;">
										<div class="col d-flex flex-column justify-content-center">
										
											<button class="btn btn-outline-dark my-2 px-2 py-1" onclick="orderDetail(this)" style="font-size:13px;"
												data-image-link="${data.product.main_img_link}" 
							                	data-product-title="${data.product.title}" 
							                	data-product-desc="${data.product.item_description}"
							                	data-order-id="${data.orderedItem.id}" 
							                	data-order-name="${data.orderedItem.name}" 
							                	data-order-address="${data.orderedItem.address}" 
							                	data-original-price="${data.orderedItem.original_price}" 
							                	data-rego-price="${data.orderedItem.price}" 
							                	data-startdate="${data.orderedItem.start_date }" 
							                	data-enddate="${data.orderedItem.end_date}" 
							                	data-deposit="${data.orderedItem.deposit}" 
											>주문 상세</button>	
											
											<c:if test="${data.orderState == '대여중'}">
								                <button type="button" class="btn btn-dark px-2 py-1" style="font-size:13px;" onclick="returnCheck(this)"
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
								               		 반납신청
								                </button>
						            		</c:if>
											<c:if test="${data.orderState == '반납완료'  && data.myReviewCount == 0}">
								            	<button type="button" class="btn btn-dark px-2 py-1" 
								            	 style="font-size: 13px;"
								            	 data-startdate="${data.orderedItem.start_date }" 
								            	 data-enddate="${data.orderedItem.end_date}"  
								            	 data-image-link="${data.product.main_img_link}" 
								            	 data-product-desc="${data.product.item_description}" 
								            	 data-product-title="${data.product.title}"   
								            	 data-order-id="${data.orderedItem.id}" 
								            	 data-bs-toggle="modal" 
								            	 data-bs-target="#modalReview">리뷰 작성</button>																				
								            	 
						            		</c:if>
											<c:if test="${data.isCompleted == 'Y' && data.myReviewCount >= 1}">
											    <button class="btn btn-dark px-2 py-1" onclick="placeReviewDate(${data.orderedItem.id})" style="font-size:13px;">내가 쓴 리뷰</button>																				
						            		</c:if>
										
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
	
	<div class="modal " id="showMyReviewModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
	  
	   <div class="modal-footer bg-light" style="padding: 10px 10px;">
        <button type="button" class="btn btn-dark" data-bs-dismiss="modal">창닫기</button>
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
	
	let returnPercentage;

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
    usedMonthP.innerText = calcMonth + 1;
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
    const confirmDeposit = document.querySelector('.confirmDeposit')
    const confirmPrice = document.querySelector('.confirmPrice')

    confirmModalImg.setAttribute('src', '/safariImg/'+dataImageLink)
    confirmModalItemTitle.innerText = productTitle
    confirmModalItemDesc.innerText = productDesc
    confirmDeposit.innerText = parseInt(deposit).toLocaleString('ko-KR') + '원'
    confirmPrice.innerText = parseInt(price).toLocaleString('ko-KR') + '원/월'
    
    
    userDesc.innerHTML = formattedEndDate
    confirmSubmitReturn.setAttribute('onclick', 'returnProcessSingle(' + orderId + ')')
    
    /*  최종 정산 모달생성 */
   	const modalFinModalTopImage = document.querySelector('.modalFinModalTopImage') 
   	const modalFinStartDateP = document.querySelector('.modalFinStartDateP') 
   	const modalFinStartDateS = document.querySelector('.modalFinStartDateS') 
   	const modalFinEndDateP = document.querySelector('.modalFinEndDateP') 
   	const modalFinEndDateS = document.querySelector('.modalFinEndDateS') 
   	const modalFinUsedPriceP = document.querySelector('.modalFinUsedPriceP') 
   	const modalFinDeposit = document.querySelector('.modalFinDeposit')
   	const modalFinFinPriceP = document.querySelector('.modalFinFinPriceP')
   	const modalFinCancelFee = document.querySelector('.modalFinCancelFee')
   	const modalFinPartialLoss = document.querySelector('.modalFinPartialLoss')
   	const modalFinPartialDamage = document.querySelector('.modalFinPartialDamage')
    
   	modalFinModalTopImage.setAttribute('src', '/safariImg/'+dataImageLink);
   	modalFinStartDateP.innerText = formattedStartedDate
   	modalFinEndDateP.innerText = formattedEndDate
   	modalFinUsedPriceP.innerText = parseInt(price).toLocaleString()
   	modalFinDeposit.innerText = parseInt(deposit).toLocaleString()
   	modalFinStartDateS.innerText = formattedStartedDate
   	modalFinEndDateS.innerText = formattedEndDate
   	
   	console.log(formattedStartedDate);
   	
/*    	modalFinFinPriceP.innerText =
	modalFinCancelFee.innerText =
	modalFinPartialLoss.innerText =
	modalFinPartialDamage.innerText = */
    
    // 오늘 날짜가 대여 시작일 보다 이전이거나 계약 기간의 90퍼센트 이상인 경우 - 추가 정산 XXX
    if(returnPercentage > 90  || startDateObj > currentDate ) {
    	
    	
    	
    	
    	
    	const returnModal1 = bootstrap.Modal.getOrCreateInstance("#modalConfirm");
    	/* const returnModal3 = bootstrap.Modal.getOrCreateInstance("#modalFinSettlement");
    	returnModal3.show(); */
    	return; 
    	
    } else { // 그 외에는 할인 기간 계산 
    	const returnModal2 = bootstrap.Modal.getOrCreateInstance("#modalReturn");
    	returnModal2.show();
    }
    
}



function orderDetail(e) {
	
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
	 
	const returnDesc = document.querySelector(".return_desc")
	returnDesc.innerHTML = ''
    const endRego = new Date();
    const originalPrice= button.getAttribute('data-original-price')
    const price = button.getAttribute('data-rego-price')
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
    usedMonthP.innerText = calcMonth + 1;
    startDateP.innerText = formattedStartedDate
    endDateP.innerText = formattedEndDate
    minusPriceP.innerText = calcedPrice.toLocaleString()
    finPriceP.innerText = parseInt(refundMoney).toLocaleString('ko-KR')

    modalTopImage.setAttribute('src', '/safariImg/'+dataImageLink)
    submitReturn.setAttribute('onclick', 'returnProcess(' + orderId + ',' + refundMoney + ', "'+ productTitle + '")')
    let days = (endDateObj - startDateObj)
    
    
    
    /*  최종 정산 모달생성 */
   	const modalFinModalTopImage = document.querySelector('.modalFinModalTopImage') 
   	const modalFinStartDateP = document.querySelector('.modalFinStartDateP') 
   	const modalFinStartDateS = document.querySelector('.modalFinStartDateS') 
   	const modalFinEndDateP = document.querySelector('.modalFinEndDateP') 
   	const modalFinEndDateS = document.querySelector('.modalFinEndDateS') 
   	const modalFinUsedPriceP = document.querySelector('.modalFinUsedPriceP') 
   	const modalFinDeposit = document.querySelector('.modalFinDeposit')
   	const modalFinFinPriceP = document.querySelector('.modalFinFinPriceP')
   	const modalFinCancelFee = document.querySelector('.modalFinCancelFee')
   	const modalFinPartialLoss = document.querySelector('.modalFinPartialLoss')
   	const modalFinPartialDamage = document.querySelector('.modalFinPartialDamage')
   	const modalReturnDate = document.querySelector('.modalReturnDate')
   	
   	const modalRecipient = document.getElementById("delivery_recipient");
   	const modalContact = document.getElementById("delivery_contact");
   	const modalAddress = document.getElementById("delivery_address");
   	const modalReturnPart = document.getElementById("returnPart");
   	const modalReturnFees = document.getElementById("modalReturnFees");
   	
    
   	modalFinModalTopImage.setAttribute('src', '/safariImg/'+dataImageLink);
   	modalFinStartDateP.innerText = formattedStartedDate;
   	modalFinEndDateP.innerText = formattedEndDate;
   	modalFinUsedPriceP.innerText = parseInt(price).toLocaleString();
   	modalFinDeposit.innerText = parseInt(deposit).toLocaleString();
   	modalFinStartDateS.innerText = formattedStartedDate;
   	modalFinEndDateS.innerText = formattedEndDate;
   	

    const address = button.getAttribute('data-order-address');
    const name = button.getAttribute('data-order-name');
   	
   	modalRecipient.innerText =  name;
   	modalAddress.innerText =  address;
   		
   		
   	// d-none
   	
	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			const returnDto = response.returnDto;
			const extraCharge = response.returnExtraCharge;
			
			let totalExtraCharge = 0;
			let totalDiscRevoc = 0;
			
			if(returnDto===null || returnDto.is_completed==='N') {
				modalReturnPart.className = 'col px-3 mt-3 border rounded-1 d-none';
				
			} else {
				
				modalReturnPart.className = 'col px-3 mt-3 border rounded-1';
				
				const returnDate = new Date(returnDto.reg_date);
			    modalReturnDate.innerText = formatDate(returnDate);
				
				if(returnDto.discount_revocation>0){
					const formattedNumber1 = returnDto.discount_revocation.toLocaleString();
					modalFinCancelFee.innerText = formattedNumber1;
					totalDiscRevoc += returnDto.discount_revocation;
				} else {
					modalFinCancelFee.innerText = "-"
				}
				
				modalReturnFees.innerHTML = "";
				
				
				if(extraCharge != null){
					
					extraCharge.forEach((data)=>{
						// Create the main container div with the class "row"
						const mainContainer = document.createElement("div");
						mainContainer.classList.add("row");

						// Create the first inner div with the class "col pt-2 pb-0 d-flex justify-content-between"
						const firstInnerDiv = document.createElement("div");
						firstInnerDiv.classList.add("col", "pt-2", "pb-0", "d-flex", "justify-content-between");

						// Create the <small> element with the class "text-secondary" and set its text content
						const smallElement = document.createElement("small");
						smallElement.classList.add("text-secondary");
						smallElement.textContent = "└ "+data.reason;

						// Create the <p> element with the class "mb-0" and set its text content
						const pElement = document.createElement("p");
						pElement.classList.add("mb-0");
						// pElement.textContent = data.charge+" 원";
						const formattedNumber2 = data.charge.toLocaleString(); // Convert the number to a formatted string with commas

						pElement.textContent = formattedNumber2+" 원";

						// Create the <span> element with the class "modalFinCancelFee" and set its text content
						const spanElement = document.createElement("span");
						spanElement.classList.add("modalFinCancelFee");
						// spanElement.textContent = data.charge;
						// Set the content of this span element dynamically as needed (e.g., spanElement.textContent = "1000";)

						firstInnerDiv.appendChild(smallElement);
						firstInnerDiv.appendChild(pElement);
						pElement.appendChild(spanElement);
						mainContainer.appendChild(firstInnerDiv);
						
						modalReturnFees.appendChild(mainContainer);
						
						totalExtraCharge += data.charge;
						
					});
					
				} 
				
				
				
				// modalFinFinPriceP.innerText = parseInt(deposit)-totalDiscRevoc-totalExtraCharge;
				const finalPrice = parseInt(deposit)-totalDiscRevoc-totalExtraCharge;;
				const formattedNumber3 = finalPrice.toLocaleString();
				modalFinFinPriceP.innerText = formattedNumber3;
				
			}
			
			
			
			
			const returnModal3 = bootstrap.Modal.getOrCreateInstance("#modalFinSettlement");
			returnModal3.show();
			
		}
	}

	// get 방식 
	xhr.open("get", "./getRentalReturnDtoByOrderId?orderId="+orderId);
	xhr.send();
   	
	
}

let orderId

function formatDate(date) {
	const year = date.getFullYear();
	const month = String(date.getMonth() + 1).padStart(2, "0"); // 월은 0부터 시작하므로 1을 더하고 두 자리로 맞춥니다.
	const day = String(date.getDate()).padStart(2, "0"); // 날짜를 두 자리로 맞춥니다.
	return `\${year}-\${month}-\${day}`;
}


//리뷰 작성 모달renew
function doReview() {
	console.log('리뷰 보내기!!')
	const xhr = new XMLHttpRequest();
	const formData = new FormData();
	
	formData.append('rental_id',orderId )
	formData.append('rental_review_title',document.getElementById('finReviewTitle').value )
	formData.append('rental_review_content',document.getElementById('finReviewContent').value )
	formData.append('rental_review_rating',document.getElementById('finReviewRating').value )
	
	
// 파일 데이터 추가

const itemImgs = document.getElementById('finReviewFiles').files;
for (let i = 0; i < itemImgs.length; i++) {
 formData.append('rental_review_img', itemImgs[i]);
}



xhr.onreadystatechange = function() {
 if (xhr.readyState == 4 && xhr.status == 200) {
   const response = JSON.parse(xhr.responseText);
   // 응답 처리
   const modalReview = document.getElementById('modalReview')
   const modalReviewForClose = bootstrap.Modal.getOrCreateInstance("#modalReview");
   modalReviewForClose.hide();
   location.reload();
   
 }
}

xhr.open("POST", "../rental/writeRentalReviewProcess?rental_id="+orderId);
xhr.send(formData);
}




// 리뷰 작성 모달
if (modalReview) {
	modalReview.addEventListener('show.bs.modal', event => {
    const button = event.relatedTarget
    orderId = button.getAttribute('data-order-id')
    const form = modalReview.querySelector('form')
    const ratingGroup = document.querySelector('.rating-group')
    const productDesc = button.getAttribute('data-product-desc')
    const dataImageLink = button.getAttribute('data-image-link')
    const startDate = button.getAttribute('data-startdate')
    const endDate = button.getAttribute('data-enddate')
    
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
    
    let itemTitle = document.querySelector('.reviewItemTitle')
    let itemDesc = document.querySelector('.reviewItemDesc')
    let reviewPeriod = document.querySelector('.reviewPeriod')
    let reviewModalTopImage = document.querySelector('.reviewModalTopImage')
    
    const dataItemTitle = button.getAttribute('data-product-title')
    const dataProduceDesc = button.getAttribute('data-produce-desc')
    const dataStartdate = button.getAttribute('data-startdate')
    
    
    reviewModalTopImage.setAttribute('src', '/safariImg/'+dataImageLink)
   	itemTitle.innerText = dataItemTitle
    itemDesc.innerText = productDesc
    reviewPeriod.innerText = `\${formattedStartedDate} ~ \${formattedEndDate}`
    
    ratingGroup.addEventListener('click', function() {
        let rentalReviewRating = document.querySelector('.ratingVal')
        // Get the star rating group element
    	let ratingGroup = document.querySelector('#full-stars-example-two .rating-group');
    	// Get the checked input element within the rating group
    	let checkedInput = ratingGroup.querySelector('input:checked');
    	// Get the value of the checked input element
    	let ratingValue = checkedInput ? checkedInput.value : null;
    	rentalReviewRating.value = ratingValue
    })
    
    
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


/* 조건반납 */
function returnProcessSingle(orderId) {
	
	const xhr = new XMLHttpRequest()
	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			if(response.result == "success"){
				mySessionId = response.id; 
				
				location.href = '/safari/user/myOrderListPage'
				 
			}
			
		}
	}
	
	xhr.open("get", "../rental/rentalReturnProcessSingle?rental_order_id="+orderId);
	xhr.send();	
}



/* 일반 반납 */
function returnProcess(orderId,refundMoney,productTitle) {
 	console.log('리턴프로세스 매개변수 orderId:: ',orderId )
	console.log('리턴프로세스 매개변수 refundMoney:: ',refundMoney )
	console.log('리턴프로세스 매개변수 productTitle:: ',productTitle )
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