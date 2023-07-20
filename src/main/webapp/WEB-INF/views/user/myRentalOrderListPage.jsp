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
<!-- 메타 섹션 -->
<style>
.btn-ordered{padding: 4px 12px; background:#dff5ea; color:#6db590; border-radius: 8px; font-size:14px; font-weight: bold;}
.btn-shipping{padding: 4px 12px; background:#dfebf5; color:#689cdd; border-radius: 8px; font-size:14px; font-weight: bold;}
.btn-finished{padding: 4px 12px; background:#cbcbcb; color:#fff; border-radius: 8px; font-size:14px;}

.listHover{transition: all 0.125s ease;}
.listHover:hover{background-color: #f0f1f3;}
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
	      					<div class="col">
			      				<p class="fs-6 fw-bold mb-2"><span class="regiMonthP"></span>개월 정기대여</p>	      					
	      					</div>
	      				</div>
	      				<div class="row">
			      			<div class="col">
			      				<div class="row justify-content-between">
			      					<div class="col align-items-center">
					      				<p class="text-secondary pt-2 border-top mb-0" style="font-size: 14px;"><span class="startDateP"></span> ~ <span class="endDateP"></span></p>
					      				<p class="modal-tit fw-bold fs-4 mb-0"></p>
					      				<p><span class="originPriceP"></span><small>/월</small></p>
			      					</div>
			      					<div class="col-1 d-flex justify-content-end">
					      				<img class="modalTopImage" alt="" src="" style="width: 100px;">
			      					</div>
			      				</div>
			      			</div>
	      				</div>
	      				
	      			</div>
					<div class="col py-2 px-3 mt-3 border rounded-1">
						<div class="row">
							<div class="col py-2 d-flex justify-content-between">
								<p>사용중인 월 구독료</p>
								<p class="usedPriceP"></p>
							</div>
						</div>
						<div class="row">
							<div class="col py-2 d-flex justify-content-between">
								<p class="mb-0">할인금액</p>
							</div>
						</div>
						<div class="row">
							<div class="col pt-2 pb-0 d-flex justify-content-between">
								<small class="text-secondary">&#x2514; 할인 금액</small>
								<p class="mb-0">( - ) <span class="minusPriceP"></span>원</p>
							</div>
						</div>
						<div class="row">
							<div class="col pt-2 pb-0 d-flex justify-content-between">
								<small class="text-secondary">&#x2514; 남은 개월수 </small>
								<p class="mb-0">( * ) <span class="regiMonthP"></span>개월</p>
							</div>
						</div>
						<div class="row mt-3 border-top">
							<div class="col py-2 d-flex justify-content-between">
								<p>결제금액</p>
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
	        <span class="btn btn-secondary" data-bs-dismiss="modal">취소</span>
	        <span class="btn btn-primary" id="submitReturn">반납신청</span>
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
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">리뷰등록</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
			제목: <input type="text" name="rental_review_title" class="form-control"><br />
			별점: <input type="number" min="1" max="5" class="form-control" name="rental_review_rating"><br />
			내용: <textarea rows="" cols="" class="form-control" name="rental_review_content"></textarea>
			이미지첨부: <input name="rental_review_img" type="file" multiple accept="image/*" class="form-control">
	      </div>
	      <div class="modal-footer">
	        <span class="btn btn-secondary" data-bs-dismiss="modal">취소</span>
	        <button type="submit" class="btn btn-primary">작성</button>
	      </div>
	    </div>
    </form>
  </div>
</div>
<!-- 대여 리뷰 모달  -->			

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
				<ul class="list-group myOrderedList pe-0">
					<li class="list-group-item border-0 border-bottom border-secondary">
						<div class="row">
							<div class="col text-center">
								대여상품
							</div>
							<div class="col text-center">
								상태
							</div>
						</div>
					</li>
					<c:if test="${rentalOrderDtoList.size() == 0}">
						<h3 class="text-center mt-5">주문한 대여 상품이 없습니다!</h3>
					</c:if>
					<c:forEach items="${rentalOrderDtoList}" var="data">
						<li class="list-group-item px-0 py-4 border-0 border-bottom listHover">
							<div class="row">
								<div class="col-2" style="max-width: 148px;">
									<img alt="" src="/safariImg/${data.product.main_img_link}" class="rounded-1" style="width: 120px;">
								</div>
								<div class="col">
									<p class="mb-1 fs-5">${data.product.title }</p>
									<p class="text-body-secondary" style="font-size: 15px;"><span><fmt:formatDate pattern="yyyy-MM-dd" value="${data.orderedItem.start_date }" /></span> <span class="ms-2"> ~ <fmt:formatDate pattern="yyyy-MM-dd" value="${data.orderedItem.end_date }" /></span></p>
									<p><fmt:formatNumber value="${data.orderedItem.price }" pattern="#,##0" />원 <small>/월</small></p>
								</div>
								
								<div class="col-2 d-flex align-items-center justify-content-center">
									<c:choose>
										<c:when test="${data.isCompleted == 'Y'}">
											<p class="btn-finished mb-0">대여종료</p>				
									    </c:when>
									    
										<c:when test="${data.rentalItemReturnDto.is_item_returned == 'N'}">
											<p class="btn-finished mb-0">회수중</p>				
									    </c:when>
									    
									    <c:when test="${data.rentalItemReturnDto.is_item_returned == 'Y'}">
											<p class="btn-finished mb-0">회수중</p>				
									    </c:when>
									    
									    
										<c:otherwise>
											<c:choose>
												<c:when test="${data.orderedItem.is_shipped == 'N' }">
													<p class="btn-shipping mb-0">주문완료</p>										
												</c:when>
												<c:when test="${data.orderedItem.is_shipped == 'Y'}">
													<p class="btn-ordered mb-0">대여중</p>
												</c:when>
											</c:choose>
										</c:otherwise>
									    
									</c:choose>
								</div>
								
								<div class="col-3 d-flex justify-content-center align-items-center">
									<c:choose>
									    <c:when test="${data.isCompleted == 'Y'}">
									        <button type="button" class="btn btn-outline-dark my-2" data-order-id="${data.orderedItem.id}" data-bs-toggle="modal" data-bs-target="#modalReview">대여리뷰작성</button>																				
									    </c:when>
									    
									    <c:when test="${data.isCompleted != 'Y'}">
									        <c:choose>
									            <c:when test="${data.orderedItem.is_shipped != 'Y'}">
									                <button type="button" class="btn btn-outline-secondary" disabled>배송중</button>
									            </c:when>
									            
									            <c:otherwise>
									            	<c:choose>
									            		<c:when test="${data.rentalItemReturnDto.is_item_returned != 'Y'}">
											                <button type="button" class="btn btn-primary" 
											                	data-image-link="${data.product.main_img_link}" 
											                	data-product-title="${data.product.title}" 
											                	data-order-id="${data.orderedItem.id}" 
											                	data-original-price="${data.orderedItem.original_price}" 
											                	data-rego-price="${data.orderedItem.price}" 
											                	data-startdate="${data.orderedItem.start_date }" 
											                	data-enddate="${data.orderedItem.end_date}" 
											                	data-deposit="${data.orderedItem.deposit}" 
											                	data-bs-toggle="modal" 
											                	data-bs-target="#modalReturn">
											               		 대여반납신청
											                </button>
									            		</c:when>
									            		
									            		<c:when test="${data.rentalItemReturnDto.is_item_returned == 'Y' && data.isCompleted != 'Y' }">
									            			<button type="button" class="btn btn-outline-secondary" disabled>최종 정산중</button>
									            		</c:when>
									            		
									            		<c:otherwise>
									            			<button type="button" class="btn btn-outline-secondary" disabled>회수중</button>
									            		</c:otherwise>
									            	</c:choose>
									            </c:otherwise>
									        </c:choose>
									    </c:when>
									</c:choose>

								</div>	
							</div>
							
						</li>
					</c:forEach>
				</ul>
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
				}
			}
		}
		
		xhr.open("get", "../user/getMyId", false);
		xhr.send();		
	}
	
	// 할인 테이블 가져오기
	function getRentalPeriodDisc(id, regiMonth, originPriceVal) {
/*  		console.log("id:: ", id)
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
			//console.log("discList:: ", discList[j])
			if(regiMonth >= discList[j].rental_period) {
				discPrice = discList[j].discounted_price
				console.log("원래가격:: ", parseInt(result), "할인기준가격:: ", discPrice)
				console.log("계산가격:: ", parseInt(result) - discPrice)
				finDiscPrice = parseInt(result) - discPrice
				
			}
		}
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

// 반납 안내 모달
if (modalReturn) {modalReturn.addEventListener('show.bs.modal', event => {
	
	const returnDesc = document.querySelector(".return_desc")
	returnDesc.innerHTML = ''
    const button = event.relatedTarget
    const orderId = button.getAttribute('data-order-id')
    const endRego = new Date();
    const endDate = button.getAttribute('data-enddate')
    const startDate = button.getAttribute('data-startdate')
    const originalPrice= button.getAttribute('data-original-price')
    const price = button.getAttribute('data-rego-price')
    console.log("regi price", price)
    const deposit = button.getAttribute('data-deposit')
    const productTitle = button.getAttribute('data-product-title')
    const submitReturn = document.getElementById("submitReturn")
    const dataImageLink = button.getAttribute('data-image-link')
    const form = modalReturn.querySelector('form')
    
	let endDateObj = new Date(endDate.replace('KST', 'GMT+0900'));
	let startDateObj = new Date(startDate.replace('KST', 'GMT+0900'));
    
    const yyyy = endDateObj.getFullYear();
    const mm = String(endDateObj.getMonth() + 1).padStart(2, '0');
    const dd = String(endDateObj.getDate()).padStart(2, '0');
    formattedEndDate = `\${yyyy}-\${mm}-\${dd}`;
    
    const yyyy2 = startDateObj.getFullYear();
    const mm2 = String(startDateObj.getMonth() + 1).padStart(2, '0');
    const dd2 = String(startDateObj.getDate()).padStart(2, '0');
    formattedStartedDate = `\${yyyy2}-\${mm2}-\${dd2}`;
    
    setRegDate()
    
    const remainMonth = getMonthDiffer(new Date(formattedDate),new Date(formattedEndDate))
    const refundMoney = (originalPrice - price) * remainMonth
    console.log("originalPrice: ", originalPrice)
    console.log("price: ", price)
    console.log("remainMonth: ", remainMonth)
    
/*     console.log("remainMonth:: ", remainMonth)
    console.log("refundMoney:: ", refundMoney) */
   
    let span = document.createElement('span')
    let modalTit = document.querySelector('.modal-tit')
    let originPriceP = document.querySelector('.originPriceP')
    let originPriceVal = parseInt(originalPrice).toLocaleString('ko-KR')
    let regiMonthP = document.querySelectorAll('.regiMonthP')
    let startDateP = document.querySelector('.startDateP')
    let endDateP = document.querySelector('.endDateP')
    let finPriceP = document.querySelector('.finPriceP')
    let usedPriceP = document.querySelector('.usedPriceP')
   // let usedMonthP = document.querySelector('.usedMonthP')
    let modalTopImage = document.querySelector('.modalTopImage')
    let minusPriceP = document.querySelector('.minusPriceP')
    
    let regiMonth = getMonthDiffer(new Date(formattedStartedDate), new Date(formattedEndDate)) // 남은 달
    let calcMonth = getMonthDiffer(new Date(formattedStartedDate), new Date(formattedDate)) // 사용한 달

    getRentalPeriodDisc(orderId, regiMonth, originPriceVal)
    
    modalTit.innerText = productTitle
    usedPriceP.innerText = parseInt(price).toLocaleString()
    originPriceP.innerText = originPriceVal+"원"
    regiMonthP[0].innerText = regiMonth
    regiMonthP[1].innerText = regiMonth
    startDateP.innerText = formattedStartedDate
    endDateP.innerText = formattedEndDate
    //minusPriceP.innerText = ''
    
    //minusPriceP.innerText = parseInt(discPrice) - parseInt(originPriceVal)
    finPriceP.innerText = parseInt(refundMoney).toLocaleString('ko-KR')
    
    setTimeout(() => {
    	minusPriceP.innerText = finDiscPrice
	}, 200);

   // usedMonthP.innerText = calcMonth
    modalTopImage.setAttribute('src', '/safariImg/'+dataImageLink)
    submitReturn.setAttribute('onclick', 'returnProcess(' + orderId + ',' + refundMoney + ', "'+ productTitle + '")')
    
  })
}

// 리뷰 작성 모달
if (modalReview) {
	modalReview.addEventListener('show.bs.modal', event => {
    const button = event.relatedTarget
    const orderId = button.getAttribute('data-order-id')
    const form = modalReview.querySelector('form')
    
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

window.addEventListener("DOMContentLoaded", function(){
	getSessionId()
	
});

</script>
</body>	
</html>