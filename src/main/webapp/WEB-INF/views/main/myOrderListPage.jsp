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
</head>
<body>
<!-- 반납 모달 -->
<div class="modal fade" id="modalReturn">
  <div class="modal-dialog">
  	<form method="post">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">반납신청서</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
			<p class="me-5">반납하게 되시는 날은 다음과 같습니다: <span class="date_return"></span></p> 
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
			
			<div class="row">
				<p class="me-5">${sessionUser.nickname }님이 대여한 리스트: </p>
				<ul class="list-group myOrderedList d-flex flex-column-reverse">
				<c:forEach items="${rentalOrderDtoList}" var="data">
					<li class="list-group-item py-3">
						<div class="d-flex justify-content-between">
							<div>
								<h1></h1>
								<h5>${data.product.title }</h5>
								<p>시작일: <fmt:formatDate pattern="yyyy-MM-dd" value="${data.orderedItem.start_date }" /></p>
								<p>반납예정일: <fmt:formatDate pattern="yyyy-MM-dd" value="${data.orderedItem.end_date }" /></p>
								<p>배송지:${data.orderedItem.address} </p>
								<p class="mb-0">배송여부: ${data.orderedItem.is_shipped}</p>
							</div>
							
							<div class="d-flex flex-column">
								<c:if test="${data.orderedItem.is_shipped == 'Y'}">
									<button type="button" class="btn btn-primary" data-product-title="${data.product.title}" data-order-id="${data.orderedItem.id}" data-original-price="${data.orderedItem.original_price}" data-rego-price="${data.orderedItem.price }" data-enddate="${data.orderedItem.end_date }" data-deposit="${data.orderedItem.deposit}" data-bs-toggle="modal" data-bs-target="#modalReturn">대여반납신청</button>
								</c:if>
								${data.isCompleted}
								<c:if test="${data.isCompleted == 'Y'}">
									<button type="button" class="btn btn-success my-2" data-order-id="${data.orderedItem.id}" data-bs-toggle="modal" data-bs-target="#modalReview"> 대여리뷰작성</button>																
								</c:if>
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
	

// 반납하게되는 날(오늘)
const setRegDate = () => {
      const today = new Date();
      const yyyy = today.getFullYear();
      const mm = String(today.getMonth() + 1).padStart(2, '0');
      const dd = String(today.getDate()).padStart(2, '0');
      formattedDate = `\${yyyy}-\${mm}-\${dd}`;
      const dateReturn = document.querySelector('.date_return')
	  dateReturn.innerText = formattedDate
  };

const modalReturn = document.getElementById('modalReturn')
const modalReview = document.getElementById('modalReview')

// 반납 안내 모달
if (modalReturn) {modalReturn.addEventListener('show.bs.modal', event => {
	const returnDesc = document.querySelector(".return_desc")
	returnDesc.innerHTML = ''
    const button = event.relatedTarget
    const recipient = button.getAttribute('data-bs-whatever')
    const orderId = button.getAttribute('data-order-id')
    const endRego = new Date();
    const endDate = button.getAttribute('data-enddate')
    const originalPrice= button.getAttribute('data-original-price')
    const price = button.getAttribute('data-rego-price')
    const deposit = button.getAttribute('data-deposit')
    const productTitle = button.getAttribute('data-product-title')
    const submitReturn = document.getElementById("submitReturn")
    const form = modalReturn.querySelector('form')
    
	let endDateObj = new Date(endDate.replace('KST', 'GMT+0900'));
    
    const yyyy = endDateObj.getFullYear();
    const mm = String(endDateObj.getMonth() + 1).padStart(2, '0');
    const dd = String(endDateObj.getDate()).padStart(2, '0');
    formattedEndDate = `\${yyyy}-\${mm}-\${dd}`;
    
    setRegDate()
    
    const remainMonth = getMonthDiffer(new Date(formattedDate),new Date(formattedEndDate))
    const refundMoney = (originalPrice - price) * remainMonth
    
    //returnProcess(orderId,refundMoney,productTitle)
    
    //form.setAttribute('action', `../rental/rentalReturnProcess?rental_order_id=\${orderId}&discount_revocation=\${refundMoney}&product_title=\${productTitle}`)
    
    const span = document.createElement('span')
    
    span.innerText = `남은 결제 비용은 기존가격(\${originalPrice}) - 계약된 가격(\${price}) * 남은 개월수(\${remainMonth}) 계산되어 \${(originalPrice - price) * remainMonth}원 입니다`
    
    returnDesc.appendChild(span)
    
    //submitReturn.setAttribute("onclick",`returnProcess(\${orderId},\${refundMoney},\${productTitle})`)
    submitReturn.setAttribute('onclick', 'returnProcess(' + orderId + ',' + refundMoney + ', "'+ productTitle + '")')
    
  })
}

// 리뷰 작성 모달
if (modalReview) {
	modalReview.addEventListener('show.bs.modal', event => {
    const button = event.relatedTarget
    const recipient = button.getAttribute('data-bs-whatever')
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
	console.log(orderId,refundMoney,productTitle)

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