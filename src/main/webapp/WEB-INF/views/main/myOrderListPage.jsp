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
			
	      </div>
	      <div class="modal-footer">
	        <span class="btn btn-secondary" data-bs-dismiss="modal">취소</span>
	        <button type="submit" class="btn btn-primary">반납신청</button>
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

<div class="container d-flex mt-5">
	<div style="width: 24%;">
		<h2 class="fw-bold">마이페이지</h2>
		
		<ul class="list-group mt-4">
		<li class="list-group-item border border-0 pb-0"><a class="btn fs-5 text fw-bold py-1" href="#">회원정보</a></li>
		  	<div class="" id="">
				<ul class="list-group ms-4">
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">회원정보수정</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">배송지관리</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">찜</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">리뷰관리</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">쪽지(?)</a></li>
				</ul>
			</div>
			
		
		  <li class="list-group-item border border-0 pb-0"><a class="btn fs-5 text fw-bold py-1" href="#collapse1">중고</a></li>
		  	<div class="" id="">
				<ul class="list-group ms-4">
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">리스트제목</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">리스트제목</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">리스트제목</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">리스트제목</a></li>
				</ul>
			</div>
			
		  <li class="list-group-item border border-0 pb-0"><a class="btn fs-5 text fw-bold py-1" href="#">대여</a></li>
		  	<div class="" id="">
				<ul class="list-group ms-4">
					<li class="list-group-item border-0"><a href="./myOrderList" class="btn py-0 text-body-secondary">오더리스트</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">1:1문의</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">리스트제목</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">리스트제목</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">리스트제목</a></li>
				</ul>
			</div>
			
		  <li class="list-group-item border border-0 pb-0"><a class="btn fs-5 text fw-bold py-1" href="#" >경매</a></li>
		  	<div class="" id="">
				<ul class="list-group ms-4">
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">리스트제목</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">리스트제목</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">리스트제목</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">리스트제목</a></li>
				</ul>
			</div>
			
		  <li class="list-group-item border border-0 pb-0"><a class="btn fs-5 text fw-bold py-1" href="#" >커뮤니티</a></li>
		  	<div class="" id="">
				<ul class="list-group ms-4">
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">리스트제목</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">리스트제목</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">리스트제목</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">리스트제목</a></li>
				</ul>
			</div>
		</ul>
	</div>
		
	<div class="pt-2 w-100">
		<p>자유롭게 코딩쓰(제목 들어가도 갠춘을듯)<p>
		<div class="w-100 border-bottom">
		</div>
		
		<div class="container mt-4 ps-0">
			<h3 class="fs-3">대여 주문 리스트</h3>
			
			<div class="d-flex mt-3">
				
				<p class="me-5">${sessionUser.nickname }님이 대여한 리스트: </p>
				<ul class="list-group myOrderedList d-flex flex-column-reverse">
				<c:forEach items="${rentalOrderDtoList}" var="data">
					<li class="list-group-item">
						<div class="d-flex justify-content-between">
							<div>
								<h4>${data.product.title }</h4>
								
								<p>시작날: <fmt:formatDate pattern="yyyy-MM-dd" value="${data.orderedItem.start_date }" /> || 반납예정일: <fmt:formatDate pattern="yyyy-MM-dd" value="${data.orderedItem.end_date }" /></p>
								<p>배송지:${data.orderedItem.address} </p>
								<p>배송여부: ${data.orderedItem.is_shipped}</p>
							</div>
							
							<div class="d-flex flex-column">
								<c:if test="${data.orderedItem.is_shipped == 'Y'}">
									<button type="button" class="btn btn-primary" data-order-id="${data.orderedItem.id}" data-bs-toggle="modal" data-bs-target="#modalReturn" data-bs-whatever="대여반납신청">대여반납신청</button>
									<button type="button" class="btn btn-success my-2" data-order-id="${data.orderedItem.id}" data-bs-toggle="modal" data-bs-target="#modalReview" data-bs-whatever="대여리뷰작성"> 대여리뷰작성</button>								
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

<script>

// 반납하게되는 날(금일)
const setRegDate = () => {
      const today = new Date();
      const yyyy = today.getFullYear();
      const mm = String(today.getMonth() + 1).padStart(2, '0');
      const dd = String(today.getDate()).padStart(2, '0');
      const formattedDate = `\${yyyy}-\${mm}-\${dd}`;
      const dateReturn = document.querySelector('.date_return')
		dateReturn.innerText = formattedDate
  };

  
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

window.addEventListener("DOMContentLoaded", function(){
	getSessionId()
	
});

const modalReturn = document.getElementById('modalReturn')
const modalReview = document.getElementById('modalReview')

if (modalReturn) {
	modalReturn.addEventListener('show.bs.modal', event => {
    // Button that triggered the modal
    const button = event.relatedTarget
    // Extract info from data-bs-* attributes
    const recipient = button.getAttribute('data-bs-whatever')
    const orderId = button.getAttribute('data-order-id')
    console.log('오더 아이디:: ', orderId)
    // If necessary, you could initiate an Ajax request here
    // and then do the updating in a callback.

    // Update the modal's content.
    const modalTitle = modalReturn.querySelector('.modal-title')
    const form = modalReturn.querySelector('form')
    
    form.setAttribute('action', `../rental/rentalReturnProcess?rental_order_id=\${orderId}`)

    modalTitle.textContent = `반납신청서`
    
    setRegDate()
  })
}
if (modalReview) {
	modalReview.addEventListener('show.bs.modal', event => {
    // Button that triggered the modal
    const button = event.relatedTarget
    // Extract info from data-bs-* attributes
    const recipient = button.getAttribute('data-bs-whatever')
    const orderId = button.getAttribute('data-order-id')
    // If necessary, you could initiate an Ajax request here
    // and then do the updating in a callback.

    // Update the modal's content.
    const modalTitle = modalReview.querySelector('.modal-title')
    const form = modalReview.querySelector('form')
    
    form.setAttribute('action', `../rental/writeRentalReviewProcess?rental_id=\${orderId}`)

    modalTitle.textContent = `리뷰작성`
    
    setRegDate()
  })
}

</script>
</body>	
</html>