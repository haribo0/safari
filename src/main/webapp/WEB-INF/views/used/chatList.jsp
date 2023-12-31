<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
.myContent {
  background-color: rgba(75, 137, 220, 0.25);  /* 배경색 */
  color: #000000; /* 글자색 */
  padding: 10px; /* 여백 */
  border-radius: 10px; /* 테두리의 굴곡 정도 */
  width: auto;
  max-width: 320px;
}

.otherContent {
  background-color: #EAEAEA; /* 배경색 */
  color: #000000; /* 글자색 */
  padding: 10px; /* 여백 */
  border-radius: 10px; /* 테두리의 굴곡 정도 */
  width: auto;
  max-width: 320px;
}

.unreadCount{
	padding :2px;
	width: 15px;
	background: red;
	color: white;
	border-radius: 10px;
	font-size: 12px;
	font-weight: bold;
}

.chatTime {
    font-size: 12px;
}

#modalHeader {
    display: block;
}

#statusButton{
	font-size: 14px;
}
.onlyme{
	font-size: 14px;
}

.btn-bunny {
	cursor: pointer;
}

#reviewImg2 {
    border-radius: 10px 10px 0 0;
    border: 1px;
    width: 100%;
}

.reviewContent {
    background-color: #fff5ee; /* 연한 핑크색 배경색 */
    padding: 10px;
    border-radius: 0 0 10px 10px; /* 둥근 보더 */
}

#reviewImg3{
	border-radius: 10px 10px 10px 10px;
}

/* 버튼 색깔 */
.orangeButton{
	background: #ff6f0f;
	font-weight: bold;
	color: white;
}

</style>
</head>
<body>
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
					<li class="list-group-item border-0"><a href="../used/chatList" class="btn py-0 text-body-secondary">채팅방 목록</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">리스트제목</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">리스트제목</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">리스트제목</a></li>
				</ul>
			</div>
			
		  <li class="list-group-item border border-0 pb-0"><a class="btn fs-5 text fw-bold py-1" href="#">대여</a></li>
		  	<div class="" id="">
				<ul class="list-group ms-4">
					<li class="list-group-item border-0"><a href="./myOrderListPage" class="btn py-0 text-body-secondary">오더리스트</a></li>
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
		<p>중고 > 채팅방목록<p>
		<div class="w-100 border-bottom">
		</div>
		<h3 class="fs-3 mb-3 mt-3">${sessionUser.nickname }님의 채팅방 목록</h3>
		<div class="container mt-1 ps-0" id="chatRoomListStart">
			
		</div>
		<%-- <c:forEach items="${list }" var="map">
		 		<div class="row align-items-center" onclick="modalOn(${map.productRequestDto.id},${map.userDto.id })">
		 			<div class="col-1 pe-0"><i class="bi bi-person-circle fs-3"></i></div>
		 			<div class="col-5 w-0 ms-0">
			 			<div class="row">
			 				<div class="col">
			 				${map.userDto.nickname }
			 				</div>
			 				<div class="col-1 text-secondary">
			 				${map.productTownDto.product_town_name}
			 				</div>
			 				<div class="col text-secondary">
			 				${map.productRequestDto.reg_date }
			 				</div>
			 			</div>
			 			<div class="row">
			 				${map.productChatDto.content }
			 			</div>
		 			</div>
		 			<div class="col-1"><img alt="사진" src="/safarifile/${map.productImgDto.product_img_link}" width="50" height="50"></div>
		 			<div class="col-1">
		 				${map.unreadCount}
		 			</div>
		 			<div class="col"></div>
		 		</div>
		 </c:forEach> --%>
	</div>
</div>
	
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->
		<!-- 채팅창 모달 -->
	<div class="modal" id="chatModal" tabindex="-1" onclick="reloadChatRoomList()">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header position-relative">
 	        <div class="modal-title position-absolute top-50 start-50 translate-middle fw-bold fs-3" id="modalTitle"></div>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-header ms-2" id="modalHeader">
		     <div class="my-custom-header-wrapper" id="modalHeaderWrapper">
		      	<!-- 
		      	<div class="row">
		      		<div class="col-2"><img alt="" src=""></div>
		      		<div class="col">
		      			<div class="row">
		      				<div class="col-4">상품이름</div>
		      				<div class="col">판매중</div>
		      			</div>
		      			<div class="row">0,000원</div>
		      		</div>
		      	</div> -->
		      	<!-- <div class="row mt-2">
		      		<div class="col-2 btn btn-outline-secondary text-dark me-3 ms-2 btn-sm p-1"><i class="bi bi-calendar2-plus-fill"></i><span class="fw-bold"> 약속잡기</span></div>
		      		<div class="col-2 btn btn-outline-secondary text-dark btn-sm p-1"><i class="bi bi-coin"></i><span class="fw-bold"> 송금하기</span></div>
		      		<div class="col"></div>
		      	</div> -->
		      </div>
	      </div>
	      <div class="modal-body" style="height: 400px">
			<div class="chat-container overflow-y-scroll overflow-x-hidden" style="height:380px;" id="getChatList">
			</div>
	      </div>
	      <div class="modal-footer justify-content-start">
	      		<textarea id="chatContent" placeholder="메시지 보내기" rows="1" cols="20" class="form-control" style="width: 80%;"></textarea>
	      	
			    <button class="send-button btn btn-primary ms-3 px-3" id="sendContent">전송</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 채팅창 모달 -->

	<!-- 리뷰작성 모달 -->
	<div class="modal" id="writeReviewModal" tabindex="-1" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header position-relative">
 	        <div class="modal-title position-absolute top-50 start-50 translate-middle fw-bold fs-3">
 	        	<h5 class="modal-title text-center">거래 후기 보내기</h5>
 	        </div>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-header ms-2" id="modalHeader2">
		     <div class="my-custom-header-wrapper" id="modalHeaderWrapper2">
		      	<!-- div class="row">
		      		<div class="col">
		      			에어팟 프로 
		      		</div>
		      	</div>
		      	<div class="row">
		      		<div class="col">
		      			거래한 이웃
		      			<span>피자죠아</span> 
		      		</div>
		      	</div>
		      </div> -->
	        </div>
	       </div>
	      <div class="modal-body ms-2" style="height: 500px">
			<div class="chat-container overflow-y-scroll overflow-x-hidden" style="height:480px;" id="modalBody2">
			<!-- <div class="row">
      			<div class="col">
      				바니바니님,
      			</div>
      		</div>
      		<div class="row">
      			<div class="col">
      				피자죠아님과 거래가 어떠셨나요?
      			</div>
      		</div>
      		<div class="row">
      			<div class="col text-secondary onlyme mt-1">
      				거래 선호도는 나만 볼 수 있어요 
      			</div>
      		</div>
      		<div class="row mt-4">
      			<div class="col-4 text-center">
      				<img class="opacity-25 btn-bunny" alt="soso" src="/safari/resources/img/used/soso1.png" width="70" height="70" onclick="soso1Change()" id="sosoImg">
      				<p class="text-secondary fw-semibold mt-1" id="sosoText">별로예요</p>
      			</div>
      			<div class="col-4 text-center">
      				<img class="opacity-25 btn-bunny" alt="good" src="/safari/resources/img/used/good1.png" width="70" height="70" onclick="good1Change()" id="goodImg">
      				<p class="text-secondary fw-semibold mt-1" id="goodText">좋아요</p>
      			</div>
      			<div class="col-4 text-center">
      				<img class="opacity-25 btn-bunny" alt="best" src="/safari/resources/img/used/best1.png" width="70" height="70" onclick="best1Change()" id="bestImg">
      				<p class="text-secondary fw-semibold mt-1" id="bestText">최고예요</p>
      			</div>
      		</div> -->
      		<!-- <div class="row mt-3">
      			<div class="col fs-6">어떤 점이 별로였나요?</div>
      		</div>
      		<div class="row mt-3">
      			<div class="col">
      				<input type="checkbox" id="myCheckbox">
					<label for="myCheckbox">시간약속을 안 지켜요.</label>
      			</div>
      		</div>
      		<div class="row mt-3">
      			<div class="col">
      				<input type="checkbox" id="myCheckbox">
					<label for="myCheckbox">원하지 않는 가격을 계속 요구해요.</label>
      			</div>
      		</div>
      		<div class="row mt-3">
      			<div class="col">
      				<input type="checkbox" id="myCheckbox">
					<label for="myCheckbox">거래 시간과 장소를 정한 후 연락이 안돼요.</label>
      			</div>
      		</div>
      		<div class="row mt-3">
      			<div class="col">
      				<input type="checkbox" id="myCheckbox">
					<label for="myCheckbox">불친절해요.</label>
      			</div>
      		</div>
      		<div class="row">
      			<div class="col mt-4">
      				아쉬웠던 점을 사파리 팀에 알려주세요.
      			</div>
      		</div>
      		<div class="row">
      			<div class="col onlyme text-secondary mt-1">
      				상대방에게 전달되지 않으니 안심하세요.
      			</div>
      		</div>
      		<div class="row">
      			<div class="col mt-1">
      				<textarea class="form-control" rows="3" cols="35" placeholder=" 여기에 적어주세요. (선택사항)"></textarea>
      			</div>
      		</div>
      		<div class="row">
      			<div class="col">
      				<input class="mt-3 mb-4" type="file">
      			</div>
      		</div>
		  </div> -->
	      </div>
	    </div>
	  </div>
	</div>
	</div>
	<!-- 리뷰 작성  모달 -->

	<!-- 리뷰작성 후  모달 -->
	<div class="modal" id="myWroteReviewModal" tabindex="-1" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header position-relative">
 	        <div class="modal-title position-absolute top-50 start-50 translate-middle fw-bold fs-3">
 	        	<h5 class="modal-title text-center">내가 보낸 거래 후기</h5>
 	        </div>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body ms-3 me-3" style="height: 530px">
			<div class="chat-container overflow-y-scroll overflow-x-hidden" style="height:500px;" id="modalBody3">
      	   <!-- <div class="row mt-3">
      				<div class="col fw-bold">닉네임님에게</div>
      			</div>
				<div class="row">
      				<div class="col fw-bold">따뜻한 후기를 보냈어요.</div>
      			</div>
      			<div class="row mt-1">
      				<div class="col text-secondary onlyme">상대방닉네임과 상품이름을(를) 거래했어요.</div>
      			</div>
      			<div class="row mt-4">
      				<div class="col">
      					<img alt="review" width="100%" height="180" id="reviewImg2" src="/safari/resources/img/used/review2.jpeg">
      				</div>
      			</div>
      			<div class="reviewContent">
	     			<div class="row mt-3 mb-1">
	     				<div class="col ms-3">
	     					거래가 너무 좋았습니다. 앞으로도 이런 분과 거래하고 싶어요~! 
	     				</div>
	     			</div>
	  				<ul>
	  					<li class="mb-1">제가 있는 곳까지 와서 거래했어요.</li>
	  					<li class="mb-1">제가 있는 곳까지 와서 거래했어요.</li>
	  					<li class="mb-1">제가 있는 곳까지 와서 거래했어요.</li>
	  				</ul>
   				</div> -->
		     </div>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 리뷰작성 후 모달 -->
	
	<!-- 상대방 리뷰 모달 -->
	<div class="modal" id="receiverWroteReviewModal" tabindex="-1" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header position-relative">
 	        <div class="modal-title position-absolute top-50 start-50 translate-middle fw-bold fs-3">
 	        	<h5 class="modal-title text-center">받은 거래 후기</h5>
 	        </div>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body ms-3 me-3" style="height: 530px">
			<div class="chat-container overflow-y-scroll overflow-x-hidden" style="height:500px;" id="modalBody4">
      	   <!-- <div class="row mt-3">
      				<div class="col fw-bold">닉네임님에게</div>
      			</div>
				<div class="row">
      				<div class="col fw-bold">따뜻한 후기를 보냈어요.</div>
      			</div>
      			<div class="row mt-1">
      				<div class="col text-secondary onlyme">상대방닉네임과 상품이름을(를) 거래했어요.</div>
      			</div>
      			<div class="row mt-4">
      				<div class="col">
      					<img alt="review" width="100%" height="180" id="reviewImg2" src="/safari/resources/img/used/review2.jpeg">
      				</div>
      			</div>
      			<div class="reviewContent">
	     			<div class="row mt-3 mb-1">
	     				<div class="col ms-3">
	     					거래가 너무 좋았습니다. 앞으로도 이런 분과 거래하고 싶어요~! 
	     				</div>
	     			</div>
	  				<ul>
	  					<li class="mb-1">제가 있는 곳까지 와서 거래했어요.</li>
	  					<li class="mb-1">제가 있는 곳까지 와서 거래했어요.</li>
	  					<li class="mb-1">제가 있는 곳까지 와서 거래했어요.</li>
	  				</ul>
   				</div> -->
		     </div>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 상대방 리뷰 모달 -->

<script>
	let mySessionId = null;
	let requestId2 = null;
	let receiverId2 = null;
	
	
	// 리뷰 기분 - 별로예요 
	function soso1Change(rateId, senderId, receiverId, requestId) {
		
		const sosoImgBox = document.getElementById("soso1Img");
		sosoImgBox.classList.remove("opacity-25");
		const sosoTextBox = document.getElementById("soso1Text");
		sosoTextBox.classList.remove("text-secondary");
		
		const goodImgBox = document.getElementById("good1Img");
		goodImgBox.classList.add("opacity-25");
		const goodTextBox = document.getElementById("good1Text");
		goodTextBox.classList.add("text-secondary");
		
		const bestImgBox = document.getElementById("best1Img");
		bestImgBox.classList.add("opacity-25");
		const bestTextBox = document.getElementById("best1Text");
		bestTextBox.classList.add("text-secondary");
		
		// 체크 박스 가져오기
		getCheckBoxByRate(rateId, senderId, receiverId, requestId);
	}
	
	// 리뷰 기분 - 좋아요 
	function good1Change(rateId, senderId, receiverId, requestId) {
		const goodImgBox = document.getElementById("good1Img");
		goodImgBox.classList.remove("opacity-25");
		const goodTextBox = document.getElementById("good1Text");
		goodTextBox.classList.remove("text-secondary");
		
		const sosoImgBox = document.getElementById("soso1Img");
		sosoImgBox.classList.add("opacity-25");
		const sosoTextBox = document.getElementById("soso1Text");
		sosoTextBox.classList.add("text-secondary");
		const bestImgBox = document.getElementById("best1Img");
		bestImgBox.classList.add("opacity-25");
		const bestTextBox = document.getElementById("best1Text");
		bestTextBox.classList.add("text-secondary");
		
		// 체크 박스 가져오기
		getCheckBoxByRate(rateId, senderId, receiverId, requestId);
	}
	
	// 리뷰 기분 - 최고예요 
	function best1Change(rateId, senderId, receiverId, requestId) {
		const bestImgBox = document.getElementById("best1Img");
		bestImgBox.classList.remove("opacity-25");
		const bestTextBox = document.getElementById("best1Text");
		bestTextBox.classList.remove("text-secondary");
		
		const goodImgBox = document.getElementById("good1Img");
		goodImgBox.classList.add("opacity-25");
		const goodTextBox = document.getElementById("good1Text");
		goodTextBox.classList.add("text-secondary");
		
		const sosoImgBox = document.getElementById("soso1Img");
		sosoImgBox.classList.add("opacity-25");
		const sosoTextBox = document.getElementById("soso1Text");
		sosoTextBox.classList.add("text-secondary");
		
		// 체크 박스 가져오기
		getCheckBoxByRate(rateId, senderId, receiverId, requestId);
	}
	
	// 리뷰 기분에 따른 체크박스 표시
	function getCheckBoxByRate(rateId, senderId, receiverId, requestId) {
		// 거래후기 모달 창 바디 
		const rateCheckContainerBox = document.getElementById('rateCheckContainer');
		
		const xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
	        if(xhr.readyState == 4 && xhr.status == 200){
	            const response = JSON.parse(xhr.responseText);
	     		
	    		rateCheckContainerBox.innerHTML = "";

	            // Fifth row (Title)
	            const fifthRow = document.createElement("div");
	            fifthRow.classList.add("row");

	            const fifthCol = document.createElement("div");
	            fifthCol.classList.add("col", "fs-6", "fw-bold");
	            fifthCol.textContent = response.map.usedReviewRateCategoryDto.question;

	            fifthRow.appendChild(fifthCol);

	            rateCheckContainerBox.appendChild(fifthRow);

				// check box 
				for(data of response.map.usedReviewCheckboxCategoryDtoList){
	              const checkboxRow = document.createElement("div");
	              checkboxRow.classList.add("row", "mt-1");

	              const checkboxCol = document.createElement("div");
	              checkboxCol.classList.add("col");

	              const checkboxInput = document.createElement("input");
	              checkboxInput.type = "checkbox";
	              checkboxInput.id = data.id;
	              checkboxInput.classList.add("reviewCheckbox");
				  
	           // 변화가 있으면 함수 실행 
				  checkboxInput.addEventListener('change',changeReviewCheckBox);
	              
	              
	              const checkboxLabel = document.createElement("label");
	              checkboxLabel.htmlFor = data.id;
	              checkboxLabel.textContent = data.content;
	              checkboxLabel.classList.add("col", "ms-1");
					
	              checkboxCol.appendChild(checkboxInput);
	              checkboxCol.appendChild(checkboxLabel);

	              checkboxRow.appendChild(checkboxCol);

	              rateCheckContainerBox.appendChild(checkboxRow);
	              
	            };

	            // Additional rows
	            const additionalRow1 = document.createElement("div");
	            additionalRow1.classList.add("row");

	            const additionalCol1 = document.createElement("div");
	            additionalCol1.classList.add("col", "mt-4", "fw-bold");
	            additionalCol1.textContent = response.map.usedReviewRateCategoryDto.textarea_content;

	            additionalRow1.appendChild(additionalCol1);

	            rateCheckContainerBox.appendChild(additionalRow1);

	            const additionalRow2 = document.createElement("div");
	            additionalRow2.classList.add("row");

	            const additionalCol2 = document.createElement("div");
	            additionalCol2.classList.add("col", "onlyme", "text-secondary", "mt-1", "mb-1");
	            additionalCol2.textContent = "남겨주신 거래 후기는 상대방의 프로필에 공개돼요";

	            additionalRow2.appendChild(additionalCol2);

	            rateCheckContainerBox.appendChild(additionalRow2);

	            const additionalRow3 = document.createElement("div");
	            additionalRow3.classList.add("row");

	            const additionalCol3 = document.createElement("div");
	            additionalCol3.classList.add("col", "mt-1");

	            const textarea = document.createElement("textarea");
	            textarea.classList.add("form-control");
	            textarea.rows = 3;
	            textarea.cols = 35;
	            textarea.placeholder = " 여기에 적어주세요. (선택사항)";
	            textarea.id = "reviewTextarea";

	            additionalCol3.appendChild(textarea);

	            additionalRow3.appendChild(additionalCol3);

	            rateCheckContainerBox.appendChild(additionalRow3);

	            const additionalRow4 = document.createElement("div");
	            additionalRow4.classList.add("row", "mt-2");

	            const additionalCol4 = document.createElement("div");
	            additionalCol4.classList.add("col");

	            const inputFile = document.createElement("input");
	            inputFile.type = "file";
	            inputFile.id = "reviewImg"
	            
	            additionalCol4.appendChild(inputFile);

	            additionalRow4.appendChild(additionalCol4);

	            rateCheckContainerBox.appendChild(additionalRow4);

	            const additionalRow5 = document.createElement("div");
	            additionalRow5.classList.add("row");

	            const additionalCol5 = document.createElement("div");
	            additionalCol5.classList.add("col", "mt-3", "d-grid", "mb-4");

	            const sendButton = document.createElement("button");
	            sendButton.classList.add("btn", "btn-secondary");
	            sendButton.id = "sendButton";
	            sendButton.disabled = "true";
	            sendButton.textContent = "후기 보내기";
	            sendButton.setAttribute("onclick", "insertPurchaseReview("+rateId+","+senderId+","+receiverId+","+requestId+")");
	            
	            additionalCol5.appendChild(sendButton);

	            additionalRow5.appendChild(additionalCol5);

	            rateCheckContainerBox.appendChild(additionalRow5);
	            
	        }
	    }
	    //get
		xhr.open("get", "./getCheckBoxByRateId?rateId="+rateId);
		xhr.send();
	}
	
	
	function changeReviewCheckBox(e) {
		// 체크 개수 
		let checkCount = 0;
		// 체크 박스 
		const checkboxes = document.querySelectorAll('.reviewCheckbox');
		// Send 버튼 선택
		const sendButton = document.getElementById('sendButton');
		document.querySelectorAll('.reviewCheckbox').forEach(function(checkbox){
			console.log(checkbox.checked);
			
			if (checkbox.checked) {
				checkCount++;
			}
			console.log(checkCount)
		});
		
		if(checkCount>0){
			sendButton.disabled = false;
		    sendButton.classList.remove('btn-secondary');
		    sendButton.classList.add('orangeButton');
		}else{
			sendButton.disabled = true;
		    sendButton.classList.remove('orangeButton');
		    sendButton.classList.add('btn-secondary');
		}
	}
	
	// 리뷰 작성 insert
	function insertPurchaseReview(rateId,senderId,receiverId,requestId) {
		  // 거래후기 모달 창 바디
			const rateCheckContainerBox = document.getElementById('rateCheckContainer');
		
		  // Input 정보 가져오기
			const reviewCheckboxs = rateCheckContainerBox.querySelectorAll('.reviewCheckbox');
		    const textarea = document.getElementById('reviewTextarea').value;
			const reviewImg = document.getElementById('reviewImg').files[0];
			
			const formData = new FormData();
			
			// 텍스트 데이터 추가
			formData.append('purchase_request_id', requestId);
			formData.append('sender_id', senderId);
			formData.append('receiver_id', receiverId);
		 
			if(textarea){		
				formData.append('review_comment', textarea);
			}		
			if (reviewImg) {
			    formData.append('reviewImg', reviewImg);
			}
			
			  // 저장할 변수 초기화
			const selectedCheckboxes = [];  
			
			// 체크박스 선택 여부 확인
			rateCheckContainerBox.querySelectorAll('.reviewCheckbox').forEach(function(checkboxInput) {
			  if (checkboxInput.checked) {
			    selectedCheckboxes.push(checkboxInput.id);
			  }
			});
			formData.append('selectedCheckboxes', selectedCheckboxes);

			
			/* // 닫을 때 
			modalHide('writeReviewModal');
			// 열 때
			const writeReviewModal = bootstrap.Modal.getOrCreateInstance('#myWroteReviewModal');
			writeReviewModal.show(); */
			
		    const xhr = new XMLHttpRequest();
			
			xhr.onreadystatechange = function(){
		        if(xhr.readyState == 4 && xhr.status == 200){
		            const response = JSON.parse(xhr.responseText);
		            getMyWroteReviewHideAndShow(senderId, receiverId, requestId, 'writeReviewModal');
		        }
		    }
		    //post
		    xhr.open("POST", "./insertPurchaseReview");
 	 	    xhr.send(formData);
 	 		
	}
	
	// 채팅창 닫고 내가 썼던 리뷰 보여주기 
	function getMyWroteReview(senderId, receiverId, requestId) {
		getMyWroteReviewHideAndShow(senderId, receiverId, requestId, 'chatModal');
		
	}
	
	// 현재 모달창 닫고 내가 썼던 리뷰 보여주기 
	function getMyWroteReviewHideAndShow(senderId, receiverId, requestId, modalName){
		const modalBodyBox = document.getElementById('modalBody3');
		// 닫을 때 
		modalHide(modalName);
		// 열 때
		const wroteReviewModal = bootstrap.Modal.getOrCreateInstance('#myWroteReviewModal');
		
		const xhr = new XMLHttpRequest();
		modalBodyBox.innerHTML = "";	
		xhr.onreadystatechange = function(){
	        if(xhr.readyState == 4 && xhr.status == 200){
	        	
	            const response = JSON.parse(xhr.responseText);
	            console.log(response.map.usedPurchaseReviewDto.review_img_link);
	            console.log(response.map.usedPurchaseReviewDto.review_comment);
	         // Create elements
	            const row1 = document.createElement('div');
	            row1.className = 'row';
	            const col1 = document.createElement('div');
	            col1.className = 'col fw-bold';
	            col1.textContent = response.map.receiverDto.nickname+'님에게';
	            row1.appendChild(col1);

	            const row2 = document.createElement('div');
	            row2.className = 'row';
	            const col2 = document.createElement('div');
	            col2.className = 'col fw-bold';
	            col2.textContent = '따뜻한 후기를 보냈어요.';
	            row2.appendChild(col2);

	            const row3 = document.createElement('div');
	            row3.className = 'row mt-1';
	            const col3 = document.createElement('div');
	            col3.className = 'col text-secondary onlyme';
	            col3.textContent = response.map.receiverDto.nickname + '과 '+ response.map.productDto.title +'을(를) 거래했어요.';
	            row3.appendChild(col3);

	            // 리뷰에 사진이 없고 내용도 없을 때 
	            if(response.map.usedPurchaseReviewDto.review_img_link == 'n' && response.map.usedPurchaseReviewDto.review_comment == 'n'){
	            	const row4 = document.createElement('div');
	 	            row4.className = 'row mt-2';
	 	            const col4 = document.createElement('div');
	 	            col4.className = 'col';
	 	            const img = document.createElement('img');
	 	            img.alt = 'review';
	 	            img.height = '180';
	 	            img.id = 'reviewImg2';
	 	            img.className = 'object-fit-cover';
	            	img.src = '/safari/resources/img/used/review2.jpeg';
	            	col4.appendChild(img);
		            row4.appendChild(col4);
		            
		            const reviewContentDiv = document.createElement('div');
		            reviewContentDiv.className = 'reviewContent mb-3';
		            
		            const row5 = document.createElement('div');
		            row5.className = 'row mt-3 mb-1';
		            
		            reviewContentDiv.appendChild(row5);
		            
		            const ul = document.createElement('ul');
		            for (data of response.map.usedReviewCheckboxCategotyDtoList) {
		              const li = document.createElement('li');
		              li.className = 'mb-1';
		              li.textContent = data.content;
		              ul.appendChild(li);
		            }
		            
		            reviewContentDiv.appendChild(ul);
		            
		            modalBodyBox.appendChild(row1);
		            modalBodyBox.appendChild(row2);
		            modalBodyBox.appendChild(row3);
		            modalBodyBox.appendChild(row4);
		            modalBodyBox.appendChild(reviewContentDiv);
		            
		            // 상대방이 쓴 리뷰가 있다면 
		            if(response.map.recevierReviewCount>0){
		            	const row6 = document.createElement('div');
		 	            row6.className = 'row mb-3';
		 	            const col6 = document.createElement('div');
		 	            col6.className = 'col d-grid';
		 	            
		 	            const receiverButton = document.createElement("button");
		 	            receiverButton.classList.add("btn", "orangeButton");
		 	            receiverButton.id = "recieverButton";
		 	            receiverButton.textContent = "받은 거래 후기 보기";
			            receiverButton.setAttribute("onclick", "getReceiverWroteReviewHideAndShow("+receiverId+","+senderId+","+requestId+")");
			            
			            row6.appendChild(col6);
			            col6.appendChild(receiverButton);
			            modalBodyBox.appendChild(row6);
		            }
	            }
	            // 리뷰에 사진이 있을 떄 
	            else if(response.map.usedPurchaseReviewDto.review_img_link != 'n' && response.map.usedPurchaseReviewDto.review_comment == 'n'){
	            	const row4 = document.createElement('div');
	 	            row4.className = 'row mt-2';
	 	            const col4 = document.createElement('div');
	 	            col4.className = 'col';
	 	            const img = document.createElement('img');
	 	            img.alt = 'review';
	 	            img.height = '180';
	 	            img.id = 'reviewImg2';
	            	img.src = '/safarifile/' + response.map.usedPurchaseReviewDto.review_img_link;
	            	img.className = 'object-fit-cover';
	            	
	            	col4.appendChild(img);
		            row4.appendChild(col4);

		            const reviewContentDiv = document.createElement('div');
		            reviewContentDiv.className = 'reviewContent mb-3';
		            
		            const row5 = document.createElement('div');
		            row5.className = 'row mt-3 mb-1';
		            
		            reviewContentDiv.appendChild(row5);
		            
		            const ul = document.createElement('ul');
		            for (data of response.map.usedReviewCheckboxCategotyDtoList) {
		              const li = document.createElement('li');
		              li.className = 'mb-1';
		              li.textContent = data.content;
		              ul.appendChild(li);
		            }
		            
		            reviewContentDiv.appendChild(ul);
		            
		            modalBodyBox.appendChild(row1);
		            modalBodyBox.appendChild(row2);
		            modalBodyBox.appendChild(row3);
		            modalBodyBox.appendChild(row4);
		            modalBodyBox.appendChild(reviewContentDiv);

		         // 상대방이 쓴 리뷰가 있다면 
		            if(response.map.recevierReviewCount>0){
		            	const row6 = document.createElement('div');
		 	            row6.className = 'row';
		 	            const col6 = document.createElement('div');
		 	            col6.className = 'col d-grid';
		 	            
		 	            const receiverButton = document.createElement("button");
		 	            receiverButton.classList.add("btn", "orangeButton");
		 	            receiverButton.id = "recieverButton";
		 	            receiverButton.textContent = "받은 거래 후기 보기";
			            receiverButton.setAttribute("onclick", "getReceiverWroteReviewHideAndShow("+receiverId+","+senderId+","+requestId+")");
			            
			            row6.appendChild(col6);
			            col6.appendChild(receiverButton);
			            modalBodyBox.appendChild(row6);
		            }		            
		            
	            }else if(response.map.usedPurchaseReviewDto.review_img_link == 'n' && response.map.usedPurchaseReviewDto.review_comment != 'n'){
	            	const row4 = document.createElement('div');
	 	            row4.className = 'row mt-2';
	 	            const col4 = document.createElement('div');
	 	            col4.className = 'col';
	 	            const img = document.createElement('img');
	 	            img.alt = 'review';
	 	            img.height = '180';
	 	            img.id = 'reviewImg2';
	            	img.src = '/safari/resources/img/used/review2.jpeg';
	            	img.className = 'object-fit-cover';
	            	col4.appendChild(img);
		            row4.appendChild(col4);
		            
		            const reviewContentDiv = document.createElement('div');
		            reviewContentDiv.className = 'reviewContent mb-3';
		            
		            const row5 = document.createElement('div');
		            row5.className = 'row mt-3 mb-1';
		            
		            const col5 = document.createElement('div');
		            col5.className = 'col ms-3';
		            col5.textContent = response.map.usedPurchaseReviewDto.review_comment;
		            row5.appendChild(col5);
		            
		            reviewContentDiv.appendChild(row5);
		            
		            const ul = document.createElement('ul');
		            for (data of response.map.usedReviewCheckboxCategotyDtoList) {
		              const li = document.createElement('li');
		              li.className = 'mb-1';
		              li.textContent = data.content;
		              ul.appendChild(li);
		            }
		            
		            reviewContentDiv.appendChild(ul);
		            
		            modalBodyBox.appendChild(row1);
		            modalBodyBox.appendChild(row2);
		            modalBodyBox.appendChild(row3);
		            modalBodyBox.appendChild(row4);
		            modalBodyBox.appendChild(reviewContentDiv);

		            // 상대방이 쓴 리뷰가 있다면 
		            if(response.map.recevierReviewCount>0){
		            	const row6 = document.createElement('div');
		 	            row6.className = 'row';
		 	            const col6 = document.createElement('div');
		 	            col6.className = 'col d-grid';
		 	            
		 	            const receiverButton = document.createElement("button");
		 	            receiverButton.classList.add("btn", "orangeButton");
		 	            receiverButton.id = "recieverButton";
		 	            receiverButton.textContent = "받은 거래 후기 보기";
			            receiverButton.setAttribute("onclick", "getReceiverWroteReviewHideAndShow("+receiverId+","+senderId+","+requestId+")");
			            
			            row6.appendChild(col6);
			            col6.appendChild(receiverButton);
			            modalBodyBox.appendChild(row6);
		            }
		           
	            }else{
	            	const row4 = document.createElement('div');
	 	            row4.className = 'row mt-2';
	 	            const col4 = document.createElement('div');
	 	            col4.className = 'col';
	 	            const img = document.createElement('img');
	 	            img.alt = 'review';
	 	            img.height = '180';
	 	            img.id = 'reviewImg2';
	            	img.src = '/safarifile/' + response.map.usedPurchaseReviewDto.review_img_link;
	            	img.className = 'object-fit-cover';
	            	
	            	
	            	col4.appendChild(img);
		            row4.appendChild(col4);

		            const reviewContentDiv = document.createElement('div');
		            reviewContentDiv.className = 'reviewContent mb-3';
		            
		            const row5 = document.createElement('div');
		            row5.className = 'row mt-3 mb-1';
		            
		            const col5 = document.createElement('div');
		            col5.className = 'col ms-3';
		            col5.textContent = response.map.usedPurchaseReviewDto.review_comment;
		            row5.appendChild(col5);
		            
		            reviewContentDiv.appendChild(row5);
		            
		            const ul = document.createElement('ul');
		            for (data of response.map.usedReviewCheckboxCategotyDtoList) {
		              const li = document.createElement('li');
		              li.className = 'mb-1';
		              li.textContent = data.content;
		              ul.appendChild(li);
		            }
		            
		            reviewContentDiv.appendChild(ul);
		            
		            modalBodyBox.appendChild(row1);
		            modalBodyBox.appendChild(row2);
		            modalBodyBox.appendChild(row3);
		            modalBodyBox.appendChild(row4);
		            modalBodyBox.appendChild(reviewContentDiv);
		            
		            // 상대방이 쓴 리뷰가 있다면 
		            if(response.map.recevierReviewCount>0){
		            	const row6 = document.createElement('div');
		 	            row6.className = 'row';
		 	            const col6 = document.createElement('div');
		 	            col6.className = 'col d-grid';
		 	            
		 	            const receiverButton = document.createElement("button");
		 	            receiverButton.classList.add("btn", "orangeButton");
		 	            receiverButton.id = "recieverButton";
		 	            receiverButton.textContent = "받은 거래 후기 보기";
			            receiverButton.setAttribute("onclick", "getReceiverWroteReviewHideAndShow("+receiverId+","+senderId+","+requestId+")");
			            
			            row6.appendChild(col6);
			            col6.appendChild(receiverButton);
			            modalBodyBox.appendChild(row6);
		            }
	            }
	            
	           /*  col4.appendChild(img);
	            row4.appendChild(col4);

	            const reviewContentDiv = document.createElement('div');
	            reviewContentDiv.className = 'reviewContent';
	            
	            // 리뷰에 직접 작성한 내용이 없을 떄 
	            if(response.map.usedPurchaseReviewDto.review_comment == 'n'){
	            	const row5 = document.createElement('div');
		            row5.className = 'row mt-3 mb-1';
	            }
	            // 리뷰에 직접 작성한 내용이 있을 떄 
	            else{
	            	const row5 = document.createElement('div');
		            row5.className = 'row mt-3 mb-1';
		            const col5 = document.createElement('div');
		            col5.className = 'col ms-3';
		            col5.textContent = response.map.usedPurchaseReviewDto.review_comment;
		            row5.appendChild(col5);
	            } */
				
	            /* const ul = document.createElement('ul');
	            // 체크박스 list 
	            for(data of response.map.usedReviewCheckboxCategotyDtoList){
	            	const li = document.createElement('li');
		            li.className = 'mb-1';
		            li.textContent = data.content;
		            console.log(data.content);
		            ul.appendChild(li);
	            }

	            reviewContentDiv.appendChild(row5);
	            reviewContentDiv.appendChild(ul);

	            modalBodyBox.appendChild(row1);
	            modalBodyBox.appendChild(row2);
	            modalBodyBox.appendChild(row3);
	            modalBodyBox.appendChild(row4);
	            modalBodyBox.appendChild(reviewContentDiv);
	             */
	        }
	    }
		//get
		xhr.open("get", "./getMyWroteReview?senderId="+senderId+"&receiverId="+receiverId+"&requestId="+requestId);
		xhr.send();
		
		wroteReviewModal.show();
		
		
	}
	
	// 내가 쓴 리뷰모달 창 닫고 상대방이 쓴 리뷰 열기 
	function getReceiverWroteReviewHideAndShow(senderId, receiverId, requestId) {
		const modalBodyBox = document.getElementById('modalBody4');
		// 닫을 때 
		modalHide('myWroteReviewModal');
		// 열 때 
		const wroteReviewModal = bootstrap.Modal.getOrCreateInstance('#receiverWroteReviewModal');
		
		const xhr = new XMLHttpRequest();
		modalBodyBox.innerHTML = "";
		xhr.onreadystatechange = function(){
	        if(xhr.readyState == 4 && xhr.status == 200){
	        	
	        	
	            const response = JSON.parse(xhr.responseText);
	            console.log(response.map.usedPurchaseReviewDto.review_img_link);
	            console.log(response.map.usedPurchaseReviewDto.review_comment);
	         // Create elements
	            const row1 = document.createElement('div');
	            row1.className = 'row';
	            const col1 = document.createElement('div');
	            col1.className = 'col fw-bold';
	            col1.textContent = response.map.receiverDto.nickname+'님이 보낸';
	            row1.appendChild(col1);

	            const row2 = document.createElement('div');
	            row2.className = 'row';
	            const col2 = document.createElement('div');
	            col2.className = 'col fw-bold';
	            col2.textContent = '따뜻한 후기가 도착했어요.';
	            row2.appendChild(col2);

	            const row3 = document.createElement('div');
	            row3.className = 'row mt-1';
	            const col3 = document.createElement('div');
	            col3.className = 'col text-secondary onlyme';
	            col3.textContent = response.map.receiverDto.nickname + '과 '+ response.map.productDto.title +'을(를) 거래했어요.';
	            row3.appendChild(col3);

	            // 리뷰에 사진이 없고 내용도 없을 때 
	            if(response.map.usedPurchaseReviewDto.review_img_link == 'n' && response.map.usedPurchaseReviewDto.review_comment == 'n'){
	            	const row4 = document.createElement('div');
	 	            row4.className = 'row mt-2';
	 	            const col4 = document.createElement('div');
	 	            col4.className = 'col';
	 	            const img = document.createElement('img');
	 	            img.alt = 'review';
	 	            img.height = '180';
	 	            img.id = 'reviewImg2';
	 	            img.className = 'object-fit-cover';
	            	
	            	img.src = '/safari/resources/img/used/review2.jpeg';
	            	col4.appendChild(img);
		            row4.appendChild(col4);
		            
		            const reviewContentDiv = document.createElement('div');
		            reviewContentDiv.className = 'reviewContent mb-3';
		            
		            const row5 = document.createElement('div');
		            row5.className = 'row mt-3 mb-1';
		            
		            reviewContentDiv.appendChild(row5);
		            
		            const ul = document.createElement('ul');
		            for (data of response.map.usedReviewCheckboxCategotyDtoList) {
		              const li = document.createElement('li');
		              li.className = 'mb-1';
		              li.textContent = data.content;
		              ul.appendChild(li);
		            }
		            
		            reviewContentDiv.appendChild(ul);
		            
		            modalBodyBox.appendChild(row1);
		            modalBodyBox.appendChild(row2);
		            modalBodyBox.appendChild(row3);
		            modalBodyBox.appendChild(row4);
		            modalBodyBox.appendChild(reviewContentDiv);
		            
	            }
	            // 리뷰에 사진이 있을 떄 
	            else if(response.map.usedPurchaseReviewDto.review_img_link != 'n' && response.map.usedPurchaseReviewDto.review_comment == 'n'){
	            	const row4 = document.createElement('div');
	 	            row4.className = 'row mt-2';
	 	            const col4 = document.createElement('div');
	 	            col4.className = 'col';
	 	            const img = document.createElement('img');
	 	            img.alt = 'review';
	 	            img.height = '180';
	 	            img.id = 'reviewImg2';
	            	img.src = '/safarifile/' + response.map.usedPurchaseReviewDto.review_img_link;
	            	img.className = 'object-fit-cover';
	            	
	            	col4.appendChild(img);
		            row4.appendChild(col4);

		            const reviewContentDiv = document.createElement('div');
		            reviewContentDiv.className = 'reviewContent mb-3';
		            
		            const row5 = document.createElement('div');
		            row5.className = 'row mt-3 mb-1';
		            
		            reviewContentDiv.appendChild(row5);
		            
		            const ul = document.createElement('ul');
		            for (data of response.map.usedReviewCheckboxCategotyDtoList) {
		              const li = document.createElement('li');
		              li.className = 'mb-1';
		              li.textContent = data.content;
		              ul.appendChild(li);
		            }
		            
		            reviewContentDiv.appendChild(ul);

		            modalBodyBox.appendChild(row1);
		            modalBodyBox.appendChild(row2);
		            modalBodyBox.appendChild(row3);
		            modalBodyBox.appendChild(row4);
		            modalBodyBox.appendChild(reviewContentDiv);
		            
	            }else if(response.map.usedPurchaseReviewDto.review_img_link == 'n' && response.map.usedPurchaseReviewDto.review_comment != 'n'){
	            	const row4 = document.createElement('div');
	 	            row4.className = 'row mt-2';
	 	            const col4 = document.createElement('div');
	 	            col4.className = 'col';
	 	            const img = document.createElement('img');
	 	            img.alt = 'review';
	 	            img.height = '180';
	 	            img.id = 'reviewImg2';
	            	img.src = '/safari/resources/img/used/review2.jpeg';
	            	img.className = 'object-fit-cover';
	            	col4.appendChild(img);
		            row4.appendChild(col4);
		            
		            const reviewContentDiv = document.createElement('div');
		            reviewContentDiv.className = 'reviewContent mb-3';
		            
		            const row5 = document.createElement('div');
		            row5.className = 'row mt-3 mb-1';
		            
		            const col5 = document.createElement('div');
		            col5.className = 'col ms-3';
		            col5.textContent = response.map.usedPurchaseReviewDto.review_comment;
		            row5.appendChild(col5);
		            
		            reviewContentDiv.appendChild(row5);
		            
		            const ul = document.createElement('ul');
		            for (data of response.map.usedReviewCheckboxCategotyDtoList) {
		              const li = document.createElement('li');
		              li.className = 'mb-1';
		              li.textContent = data.content;
		              ul.appendChild(li);
		            }
		            
		            reviewContentDiv.appendChild(ul);

		            modalBodyBox.appendChild(row1);
		            modalBodyBox.appendChild(row2);
		            modalBodyBox.appendChild(row3);
		            modalBodyBox.appendChild(row4);
		            modalBodyBox.appendChild(reviewContentDiv);
	            }else{
	            	const row4 = document.createElement('div');
	 	            row4.className = 'row mt-2';
	 	            const col4 = document.createElement('div');
	 	            col4.className = 'col';
	 	            const img = document.createElement('img');
	 	            img.alt = 'review';
	 	            img.height = '180';
	 	            img.id = 'reviewImg2';
	            	img.src = '/safarifile/' + response.map.usedPurchaseReviewDto.review_img_link;
	            	img.className = 'object-fit-cover';
	            	
	            	col4.appendChild(img);
		            row4.appendChild(col4);

		            const reviewContentDiv = document.createElement('div');
		            reviewContentDiv.className = 'reviewContent mb-3';
		            
		            const row5 = document.createElement('div');
		            row5.className = 'row mt-3 mb-1';
		            
		            const col5 = document.createElement('div');
		            col5.className = 'col ms-3';
		            col5.textContent = response.map.usedPurchaseReviewDto.review_comment;
		            row5.appendChild(col5);
		            
		            reviewContentDiv.appendChild(row5);
		            
		            const ul = document.createElement('ul');
		            for (data of response.map.usedReviewCheckboxCategotyDtoList) {
		              const li = document.createElement('li');
		              li.className = 'mb-1';
		              li.textContent = data.content;
		              ul.appendChild(li);
		            }
		            
		            reviewContentDiv.appendChild(ul);

		            modalBodyBox.appendChild(row1);
		            modalBodyBox.appendChild(row2);
		            modalBodyBox.appendChild(row3);
		            modalBodyBox.appendChild(row4);
		            modalBodyBox.appendChild(reviewContentDiv);
		            
	            }
	            
	           /*  col4.appendChild(img);
	            row4.appendChild(col4);

	            const reviewContentDiv = document.createElement('div');
	            reviewContentDiv.className = 'reviewContent';
	            
	            // 리뷰에 직접 작성한 내용이 없을 떄 
	            if(response.map.usedPurchaseReviewDto.review_comment == 'n'){
	            	const row5 = document.createElement('div');
		            row5.className = 'row mt-3 mb-1';
	            }
	            // 리뷰에 직접 작성한 내용이 있을 떄 
	            else{
	            	const row5 = document.createElement('div');
		            row5.className = 'row mt-3 mb-1';
		            const col5 = document.createElement('div');
		            col5.className = 'col ms-3';
		            col5.textContent = response.map.usedPurchaseReviewDto.review_comment;
		            row5.appendChild(col5);
	            } */
				
	            /* const ul = document.createElement('ul');
	            // 체크박스 list 
	            for(data of response.map.usedReviewCheckboxCategotyDtoList){
	            	const li = document.createElement('li');
		            li.className = 'mb-1';
		            li.textContent = data.content;
		            console.log(data.content);
		            ul.appendChild(li);
	            }

	            reviewContentDiv.appendChild(row5);
	            reviewContentDiv.appendChild(ul);

	            modalBodyBox.appendChild(row1);
	            modalBodyBox.appendChild(row2);
	            modalBodyBox.appendChild(row3);
	            modalBodyBox.appendChild(row4);
	            modalBodyBox.appendChild(reviewContentDiv);
	             */
	        }
	    }
		//get
		xhr.open("get", "./getMyWroteReview?senderId="+senderId+"&receiverId="+receiverId+"&requestId="+requestId);
		xhr.send();
		
		wroteReviewModal.show();
	}
	
	// 채팅방 룸 목록 열기 
	function reloadChatRoomList() {
		const chatRoomListStartBox = document.getElementById("chatRoomListStart");
		
		const xhr = new XMLHttpRequest();
		
	    xhr.onreadystatechange = function(){
	        if(xhr.readyState == 4 && xhr.status == 200){
	            const response = JSON.parse(xhr.responseText);
	            chatRoomListStartBox.innerHTML = "";
	            for(data of response.chatRoomList){
	  			  const row = document.createElement('div');
	  			  /* console.log("data.productRequestDto.id",data.productRequestDto.id)
	  			  console.log("data.userDto.id",data.userDto.id)
	  			  console.log("data.content",data.chatContent) */
	  			  row.className = 'row align-items-center';
	  			  row.setAttribute("onclick", "modalOn("+data.productRequestDto.id + "," + data.userDto.id + "," + "'" + data.userDto.nickname + "'" + ")");

	  			  const col1 = document.createElement('div');
	  			  col1.className = 'col-1 pe-0';
	  			  const col1Icon = document.createElement('i');
	  			  col1Icon.className = 'bi bi-person-circle fs-1';
	  			  col1.appendChild(col1Icon);

	  			  const col2 = document.createElement('div');
	  			  col2.className = 'col-3 w-0 ms-0';
	  			  
	  			  const row1 = document.createElement('div');
	  			  row1.className = 'row align-items-center';
	  			  
	  			  const row1col1 = document.createElement('div');
	  			  row1col1.className = 'col p-0 fw-bold';
	  			  row1col1.textContent = data.userDto.nickname;
	  			
	  			  const row1col2 = document.createElement('div');
	  			  row1col2.className = 'col-3 text-secondary';
	  			  row1col2.textContent = data.productTownDto.product_town_name;
	  			  
	  			  const row1col3 = document.createElement('div');
	  			  row1col3.className = 'col-2 text-secondary';
	  			  if(data.lastChatDate == ""){
	  				const regDate = data.productRequestDto.reg_date;
		  			const formattedDate = new Date(regDate).toLocaleDateString('ko-KR', { month: 'short', day: '2-digit' });
		  			row1col3.textContent = formattedDate;
	  			  }else{
	  				const currentDate = new Date();
		  			const chatDate = new Date(Date.parse(data.lastChatDate));
		  			const yesterday = new Date(currentDate.getFullYear(), currentDate.getMonth(), currentDate.getDate() - 1);
		  			  // 오늘 날짜인 경우
		  			  if (currentDate.toDateString() === chatDate.toDateString()) {
		  				 const hours = chatDate.getHours();
		  				  const minutes = chatDate.getMinutes();
		  				  const period = hours < 12 ? '오전' : '오후';
		  				  const formattedHours = hours % 12 || 12;
		  				  const formattedMinutes = String(minutes).padStart(2, '0');
		  				  row1col3.textContent = period + " "+  formattedHours+":"+formattedMinutes;
		  			  }
	
		  			  // 어제 날짜인 경우
		  			  else if (yesterday.toDateString() === chatDate.toDateString()) {
		  				row1col3.textContent = '어제';
		  			  }
	
		  			  // 그 외의 경우
		  			  else{
		  				 const month = chatDate.getMonth() + 1;
						  const day = chatDate.getDate();
						  row1col3.textContent = month+"월 "+ day+"일";  
		  			  }
	  				  
	  			  }
	  			  
	  			  
	  			  const row2 = document.createElement('div');
	  			  if(data.chatContent==null || data.chatContent===''){
	  				row2.textContent = ' ';
	  				row2.className = 'mt-3'
	  			  }else{
	  				row2.className = 'row text-truncate d-inline-block';
	  				row2.textContent = data.chatContent;
	  				row2.style.maxWidth = '200px';
	  			  }
	  			  
	  			  
	  			  const col3 = document.createElement('div');
	  			  col3.className = 'col-1';
	  			  const col3Img = document.createElement('img');
	  			  col3Img.alt = '사진';
	  			  col3Img.src = '/safarifile/' + data.productImgDto.product_img_link;
	  			  col3Img.width = '60';
	  			  col3Img.height = '60';
	  			  col3.appendChild(col3Img);

	  			  const col4 = document.createElement('div');
	  			  if(data.unreadCount == 0){
	  				col4.innerText = '';
	  				col4.className = 'col-1';
	  			  }else{
	  				col4.className ='col-1 unreadCount text-center';
	  				col4.innerText = data.unreadCount;
	  			  }
	  			  
	  			  
	  			  
	  			  const col5 = document.createElement('div');
	  			  col5.className = 'col';

	  			  row.appendChild(col1);
	  			  row.appendChild(col2);
	  			  row.appendChild(col3);
	  			  row.appendChild(col4);
	  			  row.appendChild(col5);
	  			  col2.appendChild(row1);
	  			  col2.appendChild(row2);
	  			  row1.appendChild(row1col1);
	  			  row1.appendChild(row1col2);
	  			  row1.appendChild(row1col3);

	  			  chatRoomListStartBox.appendChild(row);
	  		      }
	        }
	    }
		
	    //post
		xhr.open("get", "./chatListAjax");
		xhr.send();
	}
	
	let intervalHandler = null;
	// 모달 열기 
	function  modalOn(requestId, receiverId, userNickname) {
		const userNickname2 = userNickname;
		const myModal = bootstrap.Modal.getOrCreateInstance('#chatModal');
		requestId2=requestId;
		receiverId2=receiverId;
		
		/* console.log("requestId"+requestId);
		console.log("receiverId"+receiverId); */
		const modalTitleBox = document.getElementById("modalTitle");
		modalTitleBox.innerText = userNickname2;
		
		// 상품 정보 및 예약, 결제 상태 
		getProductInformation(requestId);
		
		
		const modalHeaderBox = document.getElementById("modalHeader");
		
		const row1 = document.createElement('div');
		row1.classList.add('row');
		const row1col1 = document.createElement('div');
		row1col1.classList.add('col-1');
		
		// 열 때
		myModal.show();
		// 채팅방 리로딩 
		reloadChatList(requestId);	
		
		// 전송버튼 
 		const sendBox = document.getElementById("sendContent");
		// 텍스트상자
		const textareaBox = document.getElementById("chatContent");
		textareaBox.addEventListener("keyup", keyUpEvent);
		
		// 전송버튼 누르면 해당 메소드 불러오기 
		sendBox.setAttribute("onclick", "insertContent("+requestId+","+receiverId+")");
		
		// 3초마다 채팅 업로드 
		if(intervalHandler != null){
			clearInterval(intervalHandler);
			intervalHandler = null;
		}
		
		intervalHandler = setInterval(() => {
			reloadChatList(requestId);
		}, 3000);
		
		
	}
	
/* <div class="modal-header" id="modalHeader">
    <div class="my-custom-header-wrapper" id="modalHeaderWrapper">
    	<div class="row">
    		<div class="col-2"><img></div>
    		<div class="col">
    			<div class="row">
    				<div class="col-4">상품이름</div>
    				<div class="col">판매중</div>
    			</div>
    			<div class="row">0,000원</div>
    		</div>
    	</div>
    	<div class="row mt-2">
    		<div class="col-2 btn btn-outline-secondary text-dark me-3 ms-2 btn-sm p-1"><i class="bi bi-check-circle-fill"></i><span class="fw-bold"> 예약하기</span></div>
    		<div class="col-2 btn btn-outline-secondary text-dark btn-sm p-1"><i class="bi bi-coin"></i><span class="fw-bold"> 송금하기</span></div>
    		<div class="col-2 btn btn-outline-secondary text-dark me-3 btn-sm p-1"><i class="bi bi-calendar2-plus-fill"></i><span class="fw-bold"> 거래완료</span></div>
    		<div class="col"></div>
    	</div>
    </div>
</div> */
	
	
	// 상품 정보 모달 열기 전 불러오기 
	function getProductInformation(requestId) {
		const modalHeaderWrapperBox = document.getElementById('modalHeaderWrapper');
		modalHeaderWrapperBox.innerHTML = "";
		let partner_order_id = null; 
		let partner_user_id = null; 
		let item_name = null; 
		let item_code = null;
		let total_amount = null;
		
		const xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
	        if(xhr.readyState == 4 && xhr.status == 200){
	            const response = JSON.parse(xhr.responseText);
	            const row1 = document.createElement('div');
	            row1.classList.add('row');
	            row1col1 = document.createElement('div');
	            row1col1.classList.add('col-2');
	            row1col1Img = document.createElement('img');
	            row1col1Img.setAttribute('id', 'aTagImg');
	            row1col1Img.alt = '사진';
	            row1col1Img.src = '/safarifile/' + response.map.productImgDto.product_img_link;
	            row1col1Img.height = '65';
	            row1col1Img.width = '65';
	            row1col2 = document.createElement('div');
	            row1col2.classList.add('col');
	            row1col2row1 = document.createElement('div');
	            row1col2row1.classList.add('row', 'mt-2');
	            row1col2row1col1 = document.createElement('div');
	            row1col2row1col1.classList.add('col', 'ms-1');
	            row1col2row1col1.innerText = response.map.productDto.title;
	            row1col2row1col1.setAttribute('id', 'aTagrow1col2row1col1');
	            row1col2row1col2 = document.createElement('span');
	            row1col2row1col2.classList.add('btn', 'py-0', 'btn-outline-success', 'btn-sm', 'ms-2');
 	            row1col2row1col2.disabled = true;
	            row1col2row1col2.setAttribute('id', 'statusButton');
	            row1col2row1col2.innerText = response.map.status;
	            
	            
	            row1col2row2 = document.createElement('div');
	            row1col2row2.classList.add('row', 'ms-1', 'fw-bolder');
	            row1col2row2.innerText = response.map.productDto.price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + '원';
	            
	            /* button */
	            /*예약버튼 */ 
	            
	            const row2 = document.createElement('div');
	            row2.classList.add('row', 'mt-2');

					            
	            // 예약, 완료, 예약취소, 리뷰 버튼 
	            // 판매자일때
	            console.log("response.map.productDto.user_id"+response.map.productDto.user_id);
	            console.log("response.map.sessionId"+response.sessionId);
	            console.log("response.map.productRequestDto.status"+response.productRequestDto.status);
	            console.log("response.map.reservationCount"+response.reservationCount);
	            console.log("response.map.completeCount"+response.completeCount);
	            
	            if(response.map.productDto.user_id == response.sessionId){
	            	if(response.productRequestDto.status == '거래요청' && response.reservationCount == 0 && response.completeCount == 0){
	    	            row2col1 = document.createElement('div');
	    	            row2col1.classList.add('col-2', 'btn', 'btn-outline-secondary', 'text-dark', 'me-3', 'ms-2', 'btn-sm', 'p-1');
	    				row2col1Icon = document.createElement('i');
	    				row2col1Icon.classList.add('bi', 'bi-calendar-check-fill');
	    				const row2col1Span = document.createElement('span');
	    				row2col1Span.innerText = ' 예약하기';
	    				// 예약하기 버튼 누르면 해당 메소드 불러오기 
	    				row2col1Span.setAttribute("onclick", "productRequestStatusReservation("+requestId+")");
	    				
	    				const row2col2 = document.createElement('div');
	    	            row2col2.classList.add('col-2', 'btn', 'btn-outline-secondary', 'text-dark', 'me-3', 'btn-sm', 'p-1');
	    	            const row2col2Icon = document.createElement('i');
	    	            row2col2Icon.classList.add('bi', 'bi-coin');
	    	            const row2col2Span = document.createElement('span');
	    	            row2col2Span.innerText = ' 송금요청';
	    	            //송금하기  버튼 누르면 해당 메소드 불러오기 
	    				/* row2col1Span.setAttribute("onclick", "productRequestStatusReservation("+requestId+")"); */

	    	            const row2col3 = document.createElement('div');
	    	            row2col3.classList.add('col-2', 'btn', 'btn-outline-secondary', 'text-dark', 'btn-sm', 'p-1');
	    	            const row2col3Icon = document.createElement('i');
	    	            row2col3Icon.classList.add('bi', 'bi-check-circle-fill');
	    	            const row2col3Span = document.createElement('span');
	    	            row2col3Span.innerText = ' 거래완료';
	    	            // 거래완료 버튼 누르면 해당 메소드 불러오기 
	    				row2col3Span.setAttribute("onclick", "productRequestStatusComplete("+requestId+")");
	    	            
	    	            const row2col4 = document.createElement('div');
	    	            row2col4.classList.add('col');
	    	            
	    	            row2.appendChild(row2col1);
	    	            row2.appendChild(row2col2);
	    	            row2.appendChild(row2col3);
	    	            row2.appendChild(row2col4);
	    	            
	    	            row2col1.appendChild(row2col1Icon);
	    	            row2col1.appendChild(row2col1Span);

	    	            row2col2.appendChild(row2col2Icon);
	    	            row2col2.appendChild(row2col2Span);

	    	            row2col3.appendChild(row2col3Icon);
	    	            row2col3.appendChild(row2col3Span);
	            	}else if(response.productRequestDto.status == '예약중'){
	            		row2col1 = document.createElement('div');
	    	            row2col1.classList.add('col-2', 'btn', 'btn-outline-secondary', 'text-dark', 'me-3', 'ms-2', 'btn-sm', 'p-1');
	    				row2col1Icon = document.createElement('i');
	    				row2col1Icon.classList.add('bi', 'bi-calendar-check-fill');
	    				const row2col1Span = document.createElement('span');
	    				row2col1Span.innerText = ' 예약취소';
	    				// 예약취소 버튼 누르면 해당 메소드 불러오기 
	    				row2col1Span.setAttribute("onclick", "productRequestStatusCancel("+requestId+")");
	    				
	    				const row2col2 = document.createElement('div');
	    	            row2col2.classList.add('col-2', 'btn', 'btn-outline-secondary', 'text-dark', 'me-3', 'btn-sm', 'p-1');
	    	            const row2col2Icon = document.createElement('i');
	    	            row2col2Icon.classList.add('bi', 'bi-coin');
	    	            const row2col2Span = document.createElement('span');
	    	            row2col2Span.innerText = ' 송금요청';
	    	         // 송금하기 버튼 누르면 해당 메소드 불러오기 
	    				/* row2col3Span.setAttribute("onclick", "productRequestStatusComplete("+requestId+")"); */

	    	            const row2col3 = document.createElement('div');
	    	            row2col3.classList.add('col-2', 'btn', 'btn-outline-secondary', 'text-dark', 'btn-sm', 'p-1');
	    	            const row2col3Icon = document.createElement('i');
	    	            row2col3Icon.classList.add('bi', 'bi-check-circle-fill');
	    	            const row2col3Span = document.createElement('span');
	    	            row2col3Span.innerText = ' 거래완료';
	    	         // 거래완료 버튼 누르면 해당 메소드 불러오기 
	    				row2col3Span.setAttribute("onclick", "productRequestStatusComplete("+requestId+")");
	    	            
	    	            const row2col4 = document.createElement('div');
	    	            row2col4.classList.add('col');
	    	            
	    	            row2.appendChild(row2col1);
	    	            row2.appendChild(row2col2);
	    	            row2.appendChild(row2col3);
	    	            row2.appendChild(row2col4);
	    	            
	    	            row2col1.appendChild(row2col1Icon);
	    	            row2col1.appendChild(row2col1Span);

	    	            row2col2.appendChild(row2col2Icon);
	    	            row2col2.appendChild(row2col2Span);

	    	            row2col3.appendChild(row2col3Icon);
	    	            row2col3.appendChild(row2col3Span);
	    	            
	            	}else if(response.productRequestDto.status == '거래완료' && response.myWroteReviewCount == 0){
	            		row2col1 = document.createElement('div');
	    	            row2col1.classList.add('col-2', 'btn', 'btn-outline-secondary', 'text-dark', 'me-3', 'ms-2', 'btn-sm', 'p-1');
	    				row2col1Icon = document.createElement('i');
	    				row2col1Icon.classList.add('bi', 'bi-chat-dots-fill');
	    				const row2col1Span = document.createElement('span');
	    				row2col1Span.innerText = ' 리뷰쓰기';
	    				row2col1Span.setAttribute("onclick", "writeReview("+response.sessionId+","+response.productRequestDto.user_id+","+response.productRequestDto.id+")");
	    	            
	    	            const row2col4 = document.createElement('div');
	    	            row2col4.classList.add('col');
	    	            
	    	            row2.appendChild(row2col1);
	    	            row2.appendChild(row2col4);
	    	            
	    	            row2col1.appendChild(row2col1Icon);
	    	            row2col1.appendChild(row2col1Span);
	    	            
	    	            row2.appendChild(row2col1);
	    	            row2.appendChild(row2col4);
	            	}else if(response.productRequestDto.status == '거래완료' && response.myWroteReviewCount > 0){
	            		row2col1 = document.createElement('div');
	    	            row2col1.classList.add('col-3', 'btn', 'btn-outline-secondary', 'text-dark', 'me-3', 'ms-2', 'btn-sm', 'p-1');
	    				row2col1Icon = document.createElement('i');
	    				row2col1Icon.classList.add('bi', 'bi-pencil-square');
	    				const row2col1Span = document.createElement('span');
	    				row2col1Span.innerText = ' 보낸 후기 보기';
	    				row2col1Span.classList.add('fw-bold');
	    				row2col1Span.setAttribute("onclick", "getMyWroteReview("+response.sessionId+","+response.productRequestDto.user_id+","+response.productRequestDto.id+")");
	    	            
	    	            const row2col4 = document.createElement('div');
	    	            row2col4.classList.add('col');
	    	            
	    	            row2.appendChild(row2col1);
	    	            row2.appendChild(row2col4);
	    	            
	    	            row2col1.appendChild(row2col1Icon);
	    	            row2col1.appendChild(row2col1Span);
	    	            
	    	            row2.appendChild(row2col1);
	    	            row2.appendChild(row2col4);
	            	}
	            	// 거래요청한 사람인 경우 : 소비자 
	            }else{
	            	if(response.productRequestDto.status == '거래요청' && response.reservationCount == 0 && response.completeCount == 0){
	            		partner_order_id = response.productRequestDto.id; 
	    				partner_user_id = response.productRequestDto.user_id; 
	    				item_name = response.map.productDto.title; 
	    				item_code = response.productRequestDto.product_id;
	    				total_amount = response.map.productDto.price;
	            		
	            		row2col1 = document.createElement('div');
	    	            row2col1.classList.add('col-2', 'btn', 'btn-outline-secondary', 'text-dark', 'me-3', 'ms-2', 'btn-sm', 'p-1');
	    				row2col1Icon = document.createElement('i');
	    				row2col1Icon.classList.add('bi', 'bi-coin');
	    				const row2col1Span = document.createElement('span');
	    				row2col1Span.innerText = ' 송금하기';
	    				row2col1Span.setAttribute("onclick", "processPayment("+partner_order_id+","+partner_user_id+",'"+item_name+"',"+item_code+","+total_amount+")");
	    				
	    	            const row2col4 = document.createElement('div');
	    	            row2col4.classList.add('col');
	    	            
	    	            row2.appendChild(row2col1);
	    	            row2.appendChild(row2col4);
	    	            
	    	            row2col1.appendChild(row2col1Icon);
	    	            row2col1.appendChild(row2col1Span);

	            	}else if(response.productRequestDto.status == '예약중'){
	            		partner_order_id = response.productRequestDto.id; 
	    				partner_user_id = response.productRequestDto.user_id; 
	    				item_name = response.map.productDto.title; 
	    				item_code = response.productRequestDto.product_id;
	    				total_amount = response.map.productDto.price;
	    				
	            		row2col1 = document.createElement('div');
	    	            row2col1.classList.add('col-2', 'btn', 'btn-outline-secondary', 'text-dark', 'me-3', 'ms-2', 'btn-sm', 'p-1');
	    				row2col1Icon = document.createElement('i');
	    				row2col1Icon.classList.add('bi', 'bi-coin');
	    				const row2col1Span = document.createElement('span');
	    				row2col1Span.innerText = ' 송금하기';
	    				row2col1Span.setAttribute("onclick", "processPayment("+partner_order_id+","+partner_user_id+","+item_name+","+item_code+","+total_amount+")");
	    				
	    	            const row2col4 = document.createElement('div');
	    	            row2col4.classList.add('col');
	    	            
	    	            row2.appendChild(row2col1);
	    	            row2.appendChild(row2col4);
	    	            
	    	            row2col1.appendChild(row2col1Icon);
	    	            row2col1.appendChild(row2col1Span);
	    	            
	            	}else if(response.productRequestDto.status == '거래완료' && response.myWroteReviewCount == 0){
	            		row2col1 = document.createElement('div');
	    	            row2col1.classList.add('col-2', 'btn', 'btn-outline-secondary', 'text-dark', 'me-3', 'ms-2', 'btn-sm', 'p-1');
	    				row2col1Icon = document.createElement('i');
	    				row2col1Icon.classList.add('bi', 'bi-chat-dots-fill');
	    				const row2col1Span = document.createElement('span');
	    				row2col1Span.innerText = ' 리뷰쓰기';
	    				row2col1Span.setAttribute("onclick", "writeReview("+response.sessionId+","+ response.map.productDto.user_id+","+response.productRequestDto.id+")");
	    				
	    	            const row2col4 = document.createElement('div');
	    	            row2col4.classList.add('col');
	    	            
	    	            row2.appendChild(row2col1);
	    	            row2.appendChild(row2col4);
	    	            
	    	            row2col1.appendChild(row2col1Icon);
	    	            row2col1.appendChild(row2col1Span);
	    	            
	    	            row2.appendChild(row2col1);
	    	            row2.appendChild(row2col4);
	            	}else if(response.productRequestDto.status == '거래완료' && response.myWroteReviewCount > 0){
	            		row2col1 = document.createElement('div');
	    	            row2col1.classList.add('col-3', 'btn', 'btn-outline-secondary', 'text-dark', 'me-3', 'ms-2', 'btn-sm', 'p-1');
	    				row2col1Icon = document.createElement('i');
	    				row2col1Icon.classList.add('bi', 'bi-pencil-square');
	    				const row2col1Span = document.createElement('span');
	    				row2col1Span.innerText = ' 보낸 후기 보기';
	    				row2col1Span.classList.add('fw-bold');
	    				row2col1Span.setAttribute("onclick", "getMyWroteReview("+response.sessionId+","+response.map.productDto.user_id+","+response.productRequestDto.id+")");
	    	            
	    	            const row2col4 = document.createElement('div');
	    	            row2col4.classList.add('col');
	    	            
	    	            row2.appendChild(row2col1);
	    	            row2.appendChild(row2col4);
	    	            
	    	            row2col1.appendChild(row2col1Icon);
	    	            row2col1.appendChild(row2col1Span);
	    	            
	    	            row2.appendChild(row2col1);
	    	            row2.appendChild(row2col4);
	            	}
	            }
	            
	            
	            
	            /* <c:if test="${sessionUser.getId() == map.productDto.user_id }">
			 	<div class="row mt-1 mb-2">
					<div class="col-1"></div>
					<c:if test="${response.map.productRequestDto.status == '거래요청' && response.map.reservationCount == 0 && response.map.completeCount == 0 }">
						<div class="col-1 text-center">
							<a href="./productRequestStatusReservation?productId=${response.map.productRequestDto.product_id }&userId=${response.map.productRequestDto.user_id}" class="btn btn-dark btn-sm">예약하기</a>
						</div>
						<div class="col-1 text-center">
							<a href="./productRequestStatusComplete?productId=${response.map.productRequestDto.product_id }&userId=${response.map.productRequestDto.user_id}" class="btn btn-dark btn-sm">거래완료</a>
						</div>
					</c:if>
					<c:if test="${response.map.productRequestDto.status == '예약중' }">
						<div class="col-1 text-center">
							<a href="./productRequestStatusCancel?productId=${response.map.productRequestDto.product_id }&userId=${response.map.productRequestDto.user_id}" type="button" class="btn btn-dark btn-sm">예약취소</a>
						</div>
						<div class="col-1 text-center">
							<a href="./productRequestStatusComplete?productId=${response.map.productRequestDto.product_id }&userId=${response.map.productRequestDto.user_id}" type="button" class="btn btn-dark btn-sm">거래완료</a>
						</div>
					</c:if>
					<c:if test="${response.map.productRequestDto.status == '거래완료'}">
						<div class="col-1 text-center">
						</div>
						<div class="col-1 text-center">
							<button type="button" class="btn btn-danger btn-sm">리뷰 쓰기</button>
						</div>
					</c:if>
					<c:if test="${response.map.productRequestDto.status == '거래요청' && response.map.reservationCount != 0}">
						<div class="col-1 text-center">
						</div>
						<div class="col-1 text-center">
						</div>
					</c:if>
					<c:if test="${response.map.productRequestDto.status != '거래완료' && response.map.completeCount != 0}">
						<div class="col-1 text-center">
						</div>
						<div class="col-1 text-center">
						</div>
					</c:if>
			 	</div>
				</c:if> 
	             */
	            /* 상품정보 */
	            
	            row1.appendChild(row1col1);
	            row1col1.appendChild(row1col1Img);
	            row1.appendChild(row1col2);
	            row1col2.appendChild(row1col2row1);
	            row1col2row1.appendChild(row1col2row1col1);
	            row1col2row1col1.appendChild(row1col2row1col2);
	            row1col2.appendChild(row1col2row2);
	            
	            
	            modalHeaderWrapperBox.appendChild(row1);
	            modalHeaderWrapperBox.appendChild(row2);
	            
	            const aTagImg = document.getElementById('aTagImg');
	            const aTagrow1col2row1col1 = document.getElementById('aTagrow1col2row1col1');
	            
	            aTagImg.addEventListener('click', function() {
	                // href로 이동할 페이지 URL
	                const url = './productDetail?productId='+response.map.productDto.id;

	                // 페이지 이동
	                window.location.href = url;
	            });
	            aTagrow1col2row1col1.addEventListener('click', function() {
	                // href로 이동할 페이지 URL
	                const url = './productDetail?productId='+response.map.productDto.id;

	                // 페이지 이동
	                window.location.href = url;
	            });
	            
	        }
	    }
	    //get
		xhr.open("get", "./getProductInformation?requestId="+requestId);
		xhr.send();
	}
	
	
	// Textarea에서 Enter 칠 때도 전송되기(단, shirt+enter 안되게)
	function keyUpEvent(e) {
		console.log(e)
	    if (e.key === "Enter" && !e.shiftKey) {
	    	insertContent(requestId2, receiverId2);
	    }
	}

	function insertContent(requestId, receiverId) {
		const textareaBox = document.getElementById("chatContent");
		/* textareaBox.removeEventListener("keyup", keyUpEvent); */
		console.log("requestId2"+requestId);
		console.log("receiverId2"+receiverId);
		// 메시지 textarea id = chatContent 
		const contentBox = document.getElementById("chatContent");
		// 메시지 내용 
		const contentValue = contentBox.value.trim();
		
		// FYI : 아무것도 안 쓴 상태에서 엔터치면 (값이 null 이 되기 때문에) 아래 동작 실행하지 않고 함수 빠져나가기 
		// 자바스크립트에서 null 값은 false. 그래서 if(!null) 은 if(!false) 와 같다
		if(!contentValue) return;
		
		const xhr = new XMLHttpRequest();
		
	    xhr.onreadystatechange = function(){
	        if(xhr.readyState == 4 && xhr.status == 200){
	            const response = JSON.parse(xhr.responseText);
	            // textarea안에 값 지우기 
	            contentBox.value = "";
	            reloadChatList(requestId);
	        }
	    }
	    //post
		xhr.open("post", "./insertProductChatDto");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("purchase_request_id="+requestId+"&receiver_id="+receiverId+"&content="+contentValue);
		/* xhr.send(`requestId=\${requestId}&receiverId=\${receiverId}`); */
		
	}

// scroll lock
let chatMsgScrollTop = -1;
	
// 채팅 내용 리스트 리로딩 
function reloadChatList(requestId) {
	// chatlisBox 
    const getChatbox = document.getElementById("getChatList");
    
    // 스크롤 위치 저장
	const isScrolledToBottom = getChatbox.scrollHeight - getChatbox.clientHeight <= getChatbox.scrollTop + 10;
	if(chatMsgScrollTop != 1) chatMsgScrollTop = getChatbox.scrollTop;

	
	// 채팅 읽음 표시 update 
	updateIsRead(requestId);
	
    const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			mySessionId = response.sessionId;
			
		    getChatbox.innerHTML = ""; //초기화 얘만 innerHTML 허용... 
			let yearMonthDay = null;
		    
			// 채팅 내용 반복문 돌리기 
			for(data of response.chatList){
				// 시간 몇월
				  const regDate = new Date(data.reg_date);  
				  const year = regDate.getFullYear();
				  const month = regDate.getMonth() + 1;
				  const day = regDate.getDate();
				  const formattedDateHappen = year + '년 ' + month + '월 ' + day + '일';
				  /* console.log(yearMonthDay);
				  console.log(formattedDateHappen);
				   */
				  if(yearMonthDay != formattedDateHappen){
					  const yearMonthDayRow = document.createElement('div');
					  yearMonthDayRow.classList.add('row', 'justify-content-center', 'mt-4', 'mb-4');
					  yearMonthDayRow.innerText = formattedDateHappen;
					  getChatbox.appendChild(yearMonthDayRow);
					  yearMonthDay = formattedDateHappen;
				  }
				
				  const row1 = document.createElement('div');
				  row1.classList.add('row', 'mt-1');
				  
				  if(mySessionId!=data.receiver_id && data.receiver_id != 0){
					  const col1 = document.createElement('div');
					  col1.classList.add('col', 'd-flex', 'flex-column', 'justify-content-end');
					  const col1row1 = document.createElement('div');
					  col1row1.classList.add('row', 'justify-content-end', 'mx-1');
					 
					  if(data.read_unread == 'N'){
						  col1row1.innerText = '1';
					  }else{
						  col1row1.innerText = ' ';
					  }
					  
					  const col1row2 = document.createElement('div');
					  col1row2.classList.add('row', 'justify-content-end', 'mx-1', 'chatTime');
					  const regDate = new Date(data.reg_date);
					  const formattedDate = regDate.toLocaleTimeString('ko-KR', { hour: 'numeric', minute: '2-digit' });
					  col1row2.innerText = formattedDate;
					  
					  
					  const col2 = document.createElement('div');
					  col2.classList.add('col-7', 'me-3', 'myContent', 'text-break');
					  col2.innerText = data.content;
					  
					  row1.appendChild(col1);
					  row1.appendChild(col2);
					  col1.appendChild(col1row1);
					  col1.appendChild(col1row2);
					  
					  getChatbox.appendChild(row1);
				  }else if(mySessionId==data.receiver_id && data.receiver_id != 0) {
					  const colIcon = document.createElement('div');
					  colIcon.classList.add('col-1', 'ms-2', 'text-left');

					  const icon = document.createElement('i');
					  icon.classList.add('bi', 'bi-person-circle', 'fs-4');
					  colIcon.style.lineHeight = 1;
					  colIcon.appendChild(icon);
					  
					  const col3 = document.createElement('div');
					  col3.classList.add('col-7', 'ms-2', 'otherContent', 'text-break');
					  col3.innerText = data.content;
					  
					  const col4 = document.createElement('div');
					  col4.classList.add('col', 'd-flex', 'flex-column', 'justify-content-end');
					  const col4row1 = document.createElement('div');
					  col4row1.classList.add('row', 'justify-content-start', 'mx-1');
					  const col4row2 = document.createElement('div');
					  col4row2.classList.add('row', 'justify-content-start', 'mx-1', 'chatTime');
					  const regDate = new Date(data.reg_date);
					  const formattedDate = regDate.toLocaleTimeString('ko-KR', { hour: 'numeric', minute: '2-digit' });
					  col4row2.innerText = formattedDate;
					  
					  if(data.read_unread == 'N'){
						  col4row1.innerText = '1';
					  }else{
						  col4row1.innerText = ' ';
					  }
					  
					  row1.appendChild(colIcon);
					  row1.appendChild(col3);
					  row1.appendChild(col4);
					  col4.appendChild(col4row1);
					  col4.appendChild(col4row2);
					  
					  getChatbox.appendChild(row1);
				  }
				  // 송금 받았을 때 
				  else{
					  const col3 = document.createElement('div');
					  col3.classList.add('col','text-center');
					  col3.innerText = data.content;
					  
					  row1.appendChild(col3);
					  
					  getChatbox.appendChild(row1);
				  }
			}
			/* // 채팅 화면 마지막으로 맞추기 
			getChatbox.scrollTop = getChatbox.scrollHeight; */
			
			// 스크롤 위치 복원
			if (isScrolledToBottom) {
				getChatbox.scrollTop = getChatbox.scrollHeight;
			} else if (chatMsgScrollTop === -1) {
				getChatbox.scrollTop = getChatbox.scrollHeight;
			} else {
				getChatbox.scrollTop = chatMsgScrollTop
			}

		}
	}
	
	//get
	xhr.open("get", "./reloadChatList?requestId=" + requestId);
	xhr.send();
}

// 읽음여부 업데이트 
function updateIsRead(requestId) {
	
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
        if(xhr.readyState == 4 && xhr.status == 200){
            const response = JSON.parse(xhr.responseText);
        }
    }
    //get
	xhr.open("get", "./updateIsRead?requestId="+requestId);
	xhr.send();
}

//예약중으로 상태 업데이트 
function productRequestStatusReservation(requestId) {
	
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
        if(xhr.readyState == 4 && xhr.status == 200){
            const response = JSON.parse(xhr.responseText);
            getProductInformation(requestId);
        }
    }
    //get
	xhr.open("get", "./productRequestStatusReservation?requestId="+requestId);
	xhr.send();
}

//예약취소해서 거래요청으로 상태 업데이트 
function productRequestStatusCancel(requestId) {
	
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
        if(xhr.readyState == 4 && xhr.status == 200){
            const response = JSON.parse(xhr.responseText);
            getProductInformation(requestId);
        }
    }
    //get
	xhr.open("get", "./productRequestStatusCancel?requestId="+requestId);
	xhr.send();
}

//거래완료로 상태 업데이트 
function productRequestStatusComplete(requestId) {
	
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
        if(xhr.readyState == 4 && xhr.status == 200){
            const response = JSON.parse(xhr.responseText);
            getProductInformation(requestId);
        }
    }
    //get
	xhr.open("get", "./productRequestStatusComplete?requestId="+requestId);
	xhr.send();
}

//결제하기 
function processPayment(partner_order_id, partner_user_id,item_name,item_code,total_amount) {
	
	/* const myModal = bootstrap.Modal.getOrCreateInstance('#adsModal');
	myModal.hide(); */
	
	  const cid = "TC0ONETIME";
	  /* const partner_order_id = partner_order_id;
	  const partner_user_id = partner_user_id;
	  const item_name = item_name;
	  const item_code = item_code; */
	  const quantity = 1;
	  /* const total_amount = total_amount; */
	  const tax_free_amount = total_amount;
	  const approval_url = "http://localhost:8080/safari/used/paymentProcess";
	  const cancel_url = "http://localhost:8080/safari/used/chatList";
	  const fail_url = "http://localhost:8080/safari/used/paymentFailed";
	  
	  // Make an AJAX request to the server to initiate the payment using KakaoPay API
	  // Replace the URL and other request parameters with your actual API endpoint and data
	  const xhr = new XMLHttpRequest();
	  
	  xhr.onreadystatechange = function() {
	    if (xhr.readyState === XMLHttpRequest.DONE) {
	      if (xhr.status === 200) {
	        // Payment request succeeded
	        const response = JSON.parse(xhr.responseText);
	        // Handle the response or redirect the user to the payment page
	        const tid = response.tid;
	       	
	        saveTidToSession(cid, partner_order_id, partner_user_id, tid, item_name, item_code,response.next_redirect_pc_url);
	        
	        
	      } else {
	        // Payment request failed
	        // Handle the error or display an error message to the user
	      }
	    }
	  };
	  
	  xhr.open("POST", "https://kapi.kakao.com/v1/payment/ready");
	  xhr.setRequestHeader("Authorization", "KakaoAK 3b87c3c90d2d8e263b4a8ac2422d11ba");
	  xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
	  xhr.send("cid="+cid+"&partner_order_id="+partner_order_id+"&partner_user_id="+partner_user_id+"&item_name="+item_name
			  +"&item_code="+item_code+"&quantity="+quantity+"&total_amount="+total_amount+"&tax_free_amount="+tax_free_amount
			  +"&approval_url="+approval_url+"&cancel_url="+cancel_url+"&fail_url="+fail_url);
}

//Save tid to session using AJAX
function saveTidToSession(cid,partner_order_id,partner_user_id,tid, item_name, item_code, next_redirect_pc_url) {
	
   	console.log("saveTidToSession");
   /* 	console.log(cid);
   	console.log(tid);
   	console.log(partner_user_id);
   	console.log(partner_order_id);
   	console.log(next_redirect_pc_url); */
	
    const xhr = new XMLHttpRequest();


    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            
        	 /* location.href = response.next_redirect_pc_url; */
        	 window.open(next_redirect_pc_url, "_blank");
        	
        }
    };
    
    xhr.open("POST", "./saveTidToSession");
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.send("cid="+cid+"&partner_order_id="+partner_order_id+"&partner_user_id="+partner_user_id+"&tid="+tid+"&item_name="+item_name+"&item_code="+item_code);
}

// 리뷰 클릭하면 채팅창 닫고 리뷰쓰기 모달 열기
function writeReview(senderId, receiverId, requestId) {
	modalHide('chatModal');
	reviewModalOn(senderId, receiverId, requestId);
}

// 리뷰모달 열기 
function  reviewModalOn(senderId, receiverId, requestId) {
	
	// 리뷰 모달 열기 전 정보 가져오기
	getReviewInformation(senderId, receiverId, requestId);
	
	// 열 때
	const writeReviewModal = bootstrap.Modal.getOrCreateInstance('#writeReviewModal');
	writeReviewModal.show();
	
}

//리뷰 모달 열기 전 정보 가져오기
function getReviewInformation(senderId, receiverId, requestId) {
	// 거래후기 모달 창 헤더 
	const modalHeaderWrapperBox = document.getElementById('modalHeaderWrapper2');
	
	
	// 거래후기 모달 창 바디 
	const modalBodyBox = document.getElementById('modalBody2');
	
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
        if(xhr.readyState == 4 && xhr.status == 200){
            const response = JSON.parse(xhr.responseText);
            
            modalHeaderWrapperBox.innerHTML = "";
            modalBodyBox.innerHTML = "";
            
            // header 
            const row1 = document.createElement('div');
            row1.classList.add('row');
			
            const col1 = document.createElement('div');
            col1.classList.add('col-5', 'p-0');
          	const col1Img = document.createElement("img");
          	col1Img.alt = response.map.productDto.title;
          	col1Img.src = '/safarifile/' + response.map.productImgDto.product_img_link;
          	col1Img.width = 90;
          	col1Img.height = 90;
            
          	const col2 = document.createElement('div');
            col2.classList.add('col', 'mt-3');
            
          	const col2row1 = document.createElement('div');
          	col2row1.classList.add('row');
            const col2row1col1 = document.createElement('div');
            col2row1col1.classList.add('col', 'fw-bold');
            /* col2row1col1.textContent = '에어팟 프로'; */
            col2row1col1.textContent = response.map.productDto.title;

            const col2row2 = document.createElement('div');
          	col2row2.classList.add('row');
            const col2row2col1 = document.createElement('div');
            col2row2col1.classList.add('col');
            col2row2col1.textContent = '거래한 이웃'
            
            const span = document.createElement('span');
            span.classList.add('fw-bold', 'ms-2');
            /* span.textContent = '피자죠아'; */
            span.textContent = response.map.receiverDto.nickname;
            
            row1.appendChild(col1);
            col1.appendChild(col1Img);
            row1.appendChild(col2);
            col2.appendChild(col2row1);
            col2row1.appendChild(col2row1col1);
            col2.appendChild(col2row2);
            col2row2.appendChild(col2row2col1);
            col2row2col1.appendChild(span);
            
            modalHeaderWrapperBox.appendChild(row1);
            
            
           /*  col1.classList.add('col', "fw-bold");
             col1.textContent = '에어팟 프로'; 
            col1.textContent = response.map.productDto.title;

            row1.appendChild(col1);
            modalHeaderWrapperBox.appendChild(row1);

            const row2 = document.createElement('div');
            row2.classList.add('row');
            
            
            const col2 = document.createElement('div');
            col2.classList.add('col');
            col2.textContent = '거래한 이웃';

            const span = document.createElement('span');
            span.classList.add('fw-bold', 'ms-2');
            /* span.textContent = '피자죠아'; 
            span.textContent = response.map.receiverDto.nickname;

            col2.appendChild(span);
            row2.appendChild(col2);
            modalHeaderWrapperBox.appendChild(row2); */
            
            // body 
            // First row
            const firstRow = document.createElement("div");
            firstRow.classList.add("row");

            const firstCol = document.createElement("div");
            firstCol.classList.add("col", "fw-bold");
            /* firstCol.textContent = "바니바니님,"; */
            firstCol.textContent = response.map.senderDto.nickname+"님,";

            firstRow.appendChild(firstCol);

            modalBodyBox.appendChild(firstRow);

            // Second row
            const secondRow = document.createElement("div");
            secondRow.classList.add("row");

            const secondCol = document.createElement("div");
            secondCol.classList.add("col", "fw-bold");
            secondCol.textContent = response.map.receiverDto.nickname+"님과 거래가 어떠셨나요?";

            secondRow.appendChild(secondCol);

            modalBodyBox.appendChild(secondRow);

            // Third row
            const thirdRow = document.createElement("div");
            thirdRow.classList.add("row");

            const thirdCol = document.createElement("div");
            thirdCol.classList.add("col", "text-secondary", "onlyme", "mt-1");
            thirdCol.textContent = "거래 선호도는 나만 볼 수 있어요";

            thirdRow.appendChild(thirdCol);

            modalBodyBox.appendChild(thirdRow);

            // Fourth row
            const fourthRow = document.createElement("div");
            fourthRow.classList.add("row", "mt-4");
			
            // 평가 카테고리 
            for(data of response.map.usedReviewRateCategoryDto){
            	// 평가 list 
                const col4 = document.createElement("div");
                col4.classList.add("col-4", "text-center");

                const img4 = document.createElement("img");
                img4.classList.add("opacity-25", "btn-bunny");
                img4.alt = data.img_title;
                img4.src = "/safari/resources/img/used/"+data.img_title+".png";
                img4.width = 70;
                img4.height = 70;
                img4.setAttribute("onclick", data.img_title+"Change("+data.id+","+senderId+","+receiverId+","+requestId+")");
                img4.id=data.img_title+"Img";
                
                
                const p4 = document.createElement("p");
                p4.classList.add("text-secondary", "fw-semibold", "mt-1");
                p4.textContent = data.content;
                p4.id = data.img_title+"Text";

                col4.appendChild(img4);
                col4.appendChild(p4);

                fourthRow.appendChild(col4);
                
               
            }
            
            const rateCheckContainer = document.createElement("div");
            rateCheckContainer.classList.add("container");
            rateCheckContainer.id = 'rateCheckContainer';
            
            modalBodyBox.appendChild(fourthRow);
            modalBodyBox.appendChild(rateCheckContainer);
            

            

/*             // Fifth row
            const fifthRow = document.createElement("div");
            fifthRow.classList.add("row", "mt-3");

            const fifthCol = document.createElement("div");
            fifthCol.classList.add("col", "fs-6");
            fifthCol.textContent = "어떤 점이 별로였나요?";

            fifthRow.appendChild(fifthCol);

            container.appendChild(fifthRow);

            // Checkboxes
            const checkboxes = [
              {
                id: "checkbox1",
                labelText: "시간약속을 안 지켜요."
              },
              {
                id: "checkbox2",
                labelText: "원하지 않는 가격을 계속 요구해요."
              },
              {
                id: "checkbox3",
                labelText: "거래 시간과 장소를 정한 후 연락이 안돼요."
              },
              {
                id: "checkbox4",
                labelText: "불친절해요."
              }
            ];

            checkboxes.forEach((checkbox) => {
              const checkboxContainer = document.createElement("div");
              checkboxContainer.classList.add("row", "mt-3");

              const checkboxCol = document.createElement("div");
              checkboxCol.classList.add("col");

              const checkboxInput = document.createElement("input");
              checkboxInput.type = "checkbox";
              checkboxInput.id = checkbox.id;

              const checkboxLabel = document.createElement("label");
              checkboxLabel.htmlFor = checkbox.id;
              checkboxLabel.textContent = checkbox.labelText;

              checkboxCol.appendChild(checkboxInput);
              checkboxCol.appendChild(checkboxLabel);

              checkboxContainer.appendChild(checkboxCol);

              container.appendChild(checkboxContainer);
            });

            // Additional rows
            const sixthRow = document.createElement("div");
            sixthRow.classList.add("row", "mt-4");

            const sixthCol = document.createElement("div");
            sixthCol.classList.add("col");
            sixthCol.textContent = "아쉬웠던 점을 사파리 팀에 알려주세요.";

            sixthRow.appendChild(sixthCol);

            container.appendChild(sixthRow);

            const seventhRow = document.createElement("div");
            seventhRow.classList.add("row");

            const seventhCol = document.createElement("div");
            seventhCol.classList.add("col", "onlyme", "text-secondary", "mt-1");
            seventhCol.textContent = "상대방에게 전달되지 않으니 안심하세요.";

            seventhRow.appendChild(seventhCol);

            container.appendChild(seventhRow);

            const eighthRow = document.createElement("div");
            eighthRow.classList.add("row");

            const eighthCol = document.createElement("div");
            eighthCol.classList.add("col", "mt-1");

            const textarea = document.createElement("textarea");
            textarea.classList.add("form-control");
            textarea.rows = 3;
            textarea.cols = 35;
            textarea.placeholder = " 여기에 적어주세요. (선택사항)";

            eighthCol.appendChild(textarea);

            eighthRow.appendChild(eighthCol);

            container.appendChild(eighthRow);

            const ninthRow = document.createElement("div");
            ninthRow.classList.add("row");

            const ninthCol = document.createElement("div");
            ninthCol.classList.add("col");

            const inputFile = document.createElement("input");
            inputFile.classList.add("mt-3", "mb-4");
            inputFile.type = "file";
            */
		
        }
    }
    //get
	xhr.open("get", "./getReviewHeaderAndBody?senderId="+senderId+"&receiverId="+receiverId+"&requestId="+requestId);
	xhr.send();
}	

//modal 닫을 때
function modalHide(id) {
	const modalId = '#'+ id;
	const myModal = bootstrap.Modal.getOrCreateInstance(modalId);
       myModal.hide();
}

	
window.addEventListener("DOMContentLoaded", function() {
	//사실상 시작 시점...
	reloadChatRoomList();
	
	
	
	
});	
</script>
</body>	
</html>