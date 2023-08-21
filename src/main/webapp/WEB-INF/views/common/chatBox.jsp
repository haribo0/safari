<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>


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
body1 {
  padding: 1rem;
  text-align: center;
}
/*  */ /* 별점 */ /*  */




/* 카테고리 버튼 round */
.rnd{
	border-radius: 50px;
}


.myContent {
  background-color: #F68942; /*  rgba(75, 137, 220, 0.25) */;  /* 배경색 */
  color: white; /* 글자색 */
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
  text-align: start; /* 내용을 왼쪽 정렬 */
  width: auto;
  max-width: 320px;
}

.unreadCount1{
	padding :2px;
	width: 15px;
	background: red;
	color: white;
	border-radius: 10px;
	font-size: 10px;
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
.chatListTime{
	font-size: 14px;
}
.townName{
	font-size: 14px;
}
.circle {
	margin-top: 1px;
    display: flex;
    justify-content: center;
    align-items: center;
    width: 27px;
    height: 24px;
    padding: 12px;
    border-radius: 30px;
    text-align: center;
    color: white;
    font-weight: bold;
    line-height: 20px;
    background-color: #ff6f0f;
    font-size: 13px;
    transform: scale(0.85);
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

.reviewContent2{
	background-color: #ffefd5; /* 연한 핑크색 배경색 */
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

<!-- font awesome /  -->
<script src="https://kit.fontawesome.com/a83ecfd9ee.js" crossorigin="anonymous"></script>
<!-- font awesome /  -->



<!--  -->
<!--  -->
<!--  -->
<!-- 오른쪽 하단 메세지 아이콘 버튼 -->
<div class="btn-qna shadow-lg bg-white px-1 pt-3 pb-3 mx-0 text-secondary" style="width: 82px; height: 190px; align-content: center">
	<div class="btn-circle mx-auto " id="usedChat" style="margin-top: 11px" onclick="reloadChatRoomList()">
		<!-- <i class="bi bi-chat-dots"></i> -->
		<div class="btn-tit row"><i class="bi bi-chat-dots text-secondary"></i></div>
		<div class="btn-tit row">중고채팅</div>
	</div>

	<div class="btn-circle mx-auto mt-4 " id="liveChat" style="margin-top: 11px" onclick="openLiveChat()">
		<!-- <i class="bi bi-question-circle"></i> -->
		<div class="btn-tit row"><i class="bi bi-question-circle text-secondary"></i></div>
		<div class="btn-tit row">실시간문의</div>
	</div>
</div>
<!-- 오른쪽 하단 메세지 아이콘 버튼 -->
<!--  -->
<!--  -->
<!--  -->


<!--  -->
<!--  -->
<!--  -->
<!-- useChatModal -->
<div class="modal" id="usedChatModal" tabindex="-1">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header position-relative px-3" style="background: #EAEAEA; padding: 20px 0px;">
 	        <div class="modal-title ms-1 position-absolute top-50 start-50 translate-middle">
	        	<h5 class="modal-title ms-1">
					채팅방 목록
	        	</h5>
 	        </div>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body px-0 pb-0 pt-0" style="height: 490px; width: 460px;">
			<!-- Messages -->
			<div class="chat-container overflow-y-scroll overflow-x-hidden" style="height:480px; width:480px" id="usedChatListBox">
			</div>
	      </div>
	      <div class="modal-footer p-0">
	      	<img class="img-fluid m-0" alt="chatAds" src="/safari/resources/img/used/usedChatAds.png">
	      </div>
	    </div>
	  </div>
</div>
<!-- useChatModal -->
<!--  -->
<!-- 채팅창 모달 -->
<div class="modal" id="chatModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header position-relative px-3" style="background: #EAEAEA; padding: 9px 0px;">
      		<i class="bi bi-chevron-left fs-4 p-0" onclick="reloadChatRoomList()"></i>
      		<h5 class="modal-title ms-1 position-absolute top-50 start-50 translate-middle" id="modalTitle">
	        	</h5>
	        <!--<div class="modal-title position-absolute top-50 start-50 translate-middle fw-bold fs-3" id="modalTitle"></div> -->
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
      <div class="modal-body py-2" style="height: 400px">
		<div class="chat-container overflow-y-scroll overflow-x-hidden" style="height:380px;" id="getChatList">
		</div>
      </div>
      <div class="modal-footer justify-content-start" style="background: #EAEAEA;">
      		<textarea id="chatContent" placeholder="메시지 보내기" rows="1" cols="20" class="form-control" style="width: 80%;"></textarea>

		    <button class="send-button btn btn-dark ms-3 px-3" id="sendContent">전송</button>
      </div>
    </div>
  </div>
</div>
<!-- 채팅창 모달 -->

<!--  -->
<!--  -->
<!-- 리뷰작성 모달 -->
<div class="modal" id="writeReviewModal" tabindex="-1" >
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header position-relative px-3" style="background: #EAEAEA; padding: 9px 0px;">
       	<i class="bi bi-chevron-left fs-4 p-0" onclick="modalOnById()"></i>
       	<h5 class="modal-title ms-1 position-absolute top-50 start-50 translate-middle">거래 후기 보내기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-header ms-2" id="modalHeader2">
	     <div class="my-custom-header-wrapper" id="modalHeaderWrapper2">
       </div>
      </div>
     <div class="modal-body ms-2" style="height: 500px">
	<div class="chat-container overflow-y-scroll overflow-x-hidden" style="height:480px;" id="modalBody2">
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
      <div class="modal-header position-relative px-3" style="background: #EAEAEA; padding: 9px 0px;">
        <i class="bi bi-chevron-left fs-4 p-0" onclick="modalOnById()"></i>
       	<h5 class="modal-title ms-1 position-absolute top-50 start-50 translate-middle">내가 보낸 거래 후기</h5>
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
      <div class="modal-footer p-0 mt-1">
      	<img class="img-fluid m-0" alt="chatAds" src="/safari/resources/img/used/usedChatAds3.png">
      </div>
    </div>
  </div>
</div>
<!-- 리뷰작성 후 모달 -->

<!-- 상대방 리뷰 모달 -->
<div class="modal" id="receiverWroteReviewModal" tabindex="-1" >
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header position-relative px-3" style="background: #EAEAEA; padding: 9px 0px;">
      	<i class="bi bi-chevron-left fs-4 p-0" onclick="receiverCloseAndMyOpen()"></i>
        <h5 class="modal-title ms-1 position-absolute top-50 start-50 translate-middle">받은 거래 후기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body ms-3 me-3" style="height: 515px">
		<div class="chat-container overflow-y-scroll overflow-x-hidden" style="height:500px;" id="modalBody4">
	    
	     </div>
      </div>
      <div class="modal-footer p-0 mt-1">
      	<img class="img-fluid m-0" alt="chatAds" src="/safari/resources/img/used/usedChatAds3.png">
      </div>
    </div>
  </div>
</div>
<!-- 상대방 리뷰 모달 -->

<!-- 잔액 부족 경고 모달(코인 보유 금액 < 상품 금액)  -->
<div class="modal" id="bidFailureLowerCoinModal" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered" style="min-height: 67.5vh; background: rgba(0, 0, 0, 0.45);"> 
    <div class="modal-content">
      <div class="modal-header">
      	<h5>송금 실패</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
      	<div class="row text-center">
    		<div class="col">코인이 부족하여 송금하기에 실패하였습니다.</div>
       </div>
      </div>
      <div class="modal-footer">
      	<input type="button" class="btn orangeButton" value="충전하기" onclick="location.href='/safari/user/myCoinPage'">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창닫기</button>
      </div>      
    </div>
  </div>
</div>
<!-- 잔액 부족 경고 모달(코인 보유 금액 < 상품 금액)  -->

<!-- 0원일때 송금하기 경고 모달  -->
<div class="modal" id="bidFailureZeroCoinModal" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered" style="min-height: 67.5vh; background: rgba(0, 0, 0, 0.45);"> 
    <div class="modal-content">
      <div class="modal-header">
      	<h5>송금 실패</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
      	<div class="row text-center">
    		<div class="col">나눔 상품으로 송금할 수 없습니다.</div>
       </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창닫기</button>
      </div>      
    </div>
  </div>
</div>
<!-- 0원일때 송금하기 경고 모달  -->

<!-- 송금 내역  -->
<div class="modal" id="usedTransferSuccess" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered" style="background: rgba(0, 0, 0, 0.45);"> 
    <div class="modal-content">
      <div class="modal-header">
      	<h5>송금 완료</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
	     <div class="modal-body ms-3 me-3" style="height: 515px">
			<div class="chat-container overflow-y-scroll overflow-x-hidden" style="height:500px;" id="modalBody5">
		    	
		    </div>
	     </div>
      
      <div class="modal-footer">
        <button type="button" class="btn orangeButton d-grid" data-bs-dismiss="modal">확인</button>
      </div>      
    </div>
  </div>
</div>
<!-- 잔액 부족 경고 모달(코인 보유 금액 < 상품 금액)  -->

<!-- 중고 끝 -->



<!--  -->
<!--  -->
<!-- LiveChatModal -->
<div class="modal" id="liveChatModal" tabindex="-1" onclick="">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header  position-relative" style="background: #EAEAEA;">
 	        <div class="modal-title">
	        	<h5 class="modal-title ms-1">

	        		실시간 문의
	        	</h5>
 	        </div>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>

	      <!-- <div class="modal-header ms-2 " id="modalHeader">
		     <div class="my-custom-header-wrapper text-secondary text-center" id="liveChatStart" style="font-size: 14px">
		      	실시간 문의가 시작되었습니다.
		      </div>
	      </div> -->
	      <div class="modal-header ms-2 " id="modalHeader">
		     <div class="my-custom-header-wrapper text-secondary" id="" style="font-size: 14px">
		     	<div class="row mb-2 text-center">
			     	<div class="col ms-1 fs-6">
		     			문의 카테고리를 선택하시면 실시간 채팅이 시작됩니다
		     		</div>
		     	</div>
		     	<div class="row text-center">
		     		<div class="col">
		     			<div class="btn btn-sm btn-outline-dark mx-1 rnd categoryBtn"
		     				id="btn1" onclick="startLiveChat(1)">#중고</div>
		     			<div class="btn btn-sm btn-outline-dark mx-1 rnd categoryBtn"
		     				id="btn2" onclick="startLiveChat(2)">#대여</div>
		     			<div class="btn btn-sm btn-outline-dark mx-1 rnd categoryBtn"
		     				id="btn3" onclick="startLiveChat(3)">#경매</div>
		     			<div class="btn btn-sm btn-outline-dark mx-1 rnd categoryBtn"
		     				id="btn4" onclick="startLiveChat(4)">#커뮤니티</div>
		     			<div class="btn btn-sm btn-outline-dark mx-1 rnd categoryBtn"
		     				id="btn5" onclick="startLiveChat(5)">#기타</div>
		     		</div>
		     	</div>
		     </div>
	      </div>

	      <div class="modal-body" style="height: 400px">
			<!-- Messages -->
			<div class="chat-container overflow-y-scroll overflow-x-hidden mb-1 pb-1" style="height:380px;" id="chatMsgBox">

				<!-- <div class="row">
					<div class="col text-secondary text-center"> 상담이 종료되었습니다 </div>
				</div>
 -->

			</div>
			<!-- Messages -->
	      </div>

	      <div class="modal-footer justify-content-start" style="background: #EAEAEA;">
	      		<textarea id="chatText" placeholder="메시지 보내기" rows="1" cols="20" class="form-control" style="width: 80%;"></textarea>

			    <button class="send-button btn btn-dark ms-3 px-3" id="sendMsg" onclick="sendMsg()">전송</button>
	      </div>
	    </div>
	  </div>
	</div>
<!-- LiveChatModal -->
<!--  -->
<!--  -->
<!--  -->





<!--  -->
<!--  -->
<!--  -->
<!-- LiveChatFeedbackModal -->
<div class="modal modal-sm" tabindex="-1" id="feedbackModal">
  <div class="modal-dialog">
    <div class="modal-content selector-for-some-widget px-3 pb-2 pt-3" style="box-sizing: content-box;">
      <div class="modal-header">
        <h5 class="modal-title bg-light">실시간 문의 평가</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">

      	<div class="row mt-2">
    	  	<div class="col text-start text-medium">
				문의 평가
	      	</div>
      	</div>
      	<div class="row py-2">
	      	<div class="col ">
      			<div id="full-stars-example-two">
				    <div class="rating-group">
				        <input disabled checked class="rating__input rating__input--none" name="rating3" id="rating3-none" value="0" type="radio">
				        <label aria-label="1 star" class="rating__label" for="rating3-1"><i class="rating__icon rating__icon--star fa fa-sm fa-star"></i></label>
				        <input class="rating__input" name="rating3" id="rating3-1" value="1" type="radio">
				        <label aria-label="2 stars" class="rating__label" for="rating3-2"><i class="rating__icon rating__icon--star fa fa-sm fa-star"></i></label>
				        <input class="rating__input" name="rating3" id="rating3-2" value="2" type="radio">
				        <label aria-label="3 stars" class="rating__label" for="rating3-3"><i class="rating__icon rating__icon--star fa fa-sm fa-star"></i></label>
				        <input class="rating__input" name="rating3" id="rating3-3" value="3" type="radio">
				        <label aria-label="4 stars" class="rating__label" for="rating3-4"><i class="rating__icon rating__icon--star fa fa-sm fa-star"></i></label>
				        <input class="rating__input" name="rating3" id="rating3-4" value="4" type="radio">
				        <label aria-label="5 stars" class="rating__label" for="rating3-5"><i class="rating__icon rating__icon--star fa fa-sm fa-star"></i></label>
				        <input class="rating__input" name="rating3" id="rating3-5" value="5" type="radio">
				    </div>
				</div>
	      	</div>
      	</div>

      	<!-- <div class="row">

      	</div>
         -->

      	<div class="row mt-2">
    	  	<div class="col text-start text-medium">
				문의에 대한 경험을 공유해주세요
	      	</div>
      	</div>
      	<div class="row mt-2">
    	  	<div class="col">
				<textarea rows="6" cols="" class="form-control" id="textReview" placeholder="선택 사항"></textarea>
	      	</div>
      	</div>


      </div>
      <div class="modal-footer ">
        <button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-dark" onclick="saveFeedback()">평가 남기기</button>
      </div>
    </div>
  </div>
</div>
<!-- LiveChatFeedbackModal -->
<!--  -->
<!--  -->
<!--  -->


<!--
// 프사
					  const colIcon = document.createElement('div');
					  colIcon.classList.add('col-auto', 'my-auto', 'ms-2', 'text-left');
					  const outerDiv2 = document.createElement('div');
					  outerDiv2.className = 'row my-auto';
					  const innerDiv2 = document.createElement('div');
					  innerDiv2.className = 'col text-start ps-1 pt-1';
					  const imageElement = document.createElement('img');
					  imageElement.className = 'img-fluid rounded-circle';
					  imageElement.style.filter = "grayscale(1)";
					  if(true) {
						  imageElement.src = '/safari/resources/img/user.jpg';
					  } else {
						  // imageElement.src = '/safariImg/'+response.user.profile_img_link;
					  }
					  imageElement.style.width = '46px';
					  imageElement.style.height = '46px';
					  innerDiv2.appendChild(imageElement);
					  outerDiv2.appendChild(innerDiv2);
					  colIcon.appendChild(outerDiv2); -->






<script >
/* let mySessionId = null; */
let requestId2 = null;
let receiverId2 = null;
let userNickname2 = null;
let coinBalance = null;

// 받은 거래 후기 닫고, 내가 쓴 리뷰 보이게 하기 
function receiverCloseAndMyOpen() {
	getMyWroteReviewHideAndShow(mySessionId, receiverId2, requestId2, 'receiverWroteReviewModal');
}

// 현재 모달창 닫고 채팅창 보이게 하기 
function modalOnById() {
	modalOn(requestId2,receiverId2,userNickname2);
}
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
	xhr.open("get", "../used/getCheckBoxByRateId?rateId="+rateId);
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
	    xhr.open("POST", "../used/insertPurchaseReview");
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
	
	/* modalHide('writeReviewModalMy'); */
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
	xhr.open("get", "../used/getMyWroteReview?senderId="+senderId+"&receiverId="+receiverId+"&requestId="+requestId);
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

            	img.src = '/safari/resources/img/used/review3.PNG';
            	col4.appendChild(img);
	            row4.appendChild(col4);

	            const reviewContentDiv = document.createElement('div');
	            reviewContentDiv.className = 'reviewContent2 mb-3';

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
	            reviewContentDiv.className = 'reviewContent2 mb-3';

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
            	img.src = '/safari/resources/img/used/review3.PNG';
            	img.className = 'object-fit-cover';
            	col4.appendChild(img);
	            row4.appendChild(col4);

	            const reviewContentDiv = document.createElement('div');
	            reviewContentDiv.className = 'reviewContent2 mb-3';

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
	            reviewContentDiv.className = 'reviewContent2 mb-3';

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
	xhr.open("get", "../used/getMyWroteReview?senderId="+senderId+"&receiverId="+receiverId+"&requestId="+requestId);
	xhr.send();

	wroteReviewModal.show();
}

//채팅방 룸 목록 열기
function reloadChatRoomList() {
	
	const chatRoomListStartBox = document.getElementById("usedChatListBox");

	const xhr = new XMLHttpRequest();

    xhr.onreadystatechange = function(){
        if(xhr.readyState == 4 && xhr.status == 200){
            const response = JSON.parse(xhr.responseText);
            if(!response.sessionUser){
        		window.location.href = '/safari/user/loginPage';
        	}
            // 회원 코인 잔액 확인하기 
            coinBalance = response.coinBalance;
            console.log(coinBalance);
            
            chatRoomListStartBox.innerHTML = "";
            for(data of response.chatRoomList){
  			  const row = document.createElement('div');
  			  /* console.log("data.productRequestDto.id",data.productRequestDto.id)
  			  console.log("data.userDto.id",data.userDto.id)
  			  console.log("data.content",data.chatContent) */
  			  row.className = 'row align-items-center py-2 border-bottom';
  			  row.setAttribute("onclick", "modalOn("+data.productRequestDto.id + "," + data.userDto.id + "," + "'" + data.userDto.nickname + "'" + ")");

  			  const col1 = document.createElement('div');
  			  col1.className = 'col-auto ms-3 pe-1 me-1';
  			  const col1Img = document.createElement('img');
  			  col1Img.className = 'rounded-circle';
  		      col1Img.width = '45';
			  col1Img.height = '45';
  			  // 프로필 사진 없을 때 
  			  console.log(data.userDto.profile_img_link == null)
  			  if(data.userDto.profile_img_link == null){
  				col1Img.src = '/safari/resources/img/user.jpg';
  				col1Img.style = 'filter:grayscale(1)';
  			  }else{
  				col1Img.src = '/safari/resources/img/used/user2.png';
  				/* col1Img.src = '/safarifile/' + data.userDto.product_img_link; */
  			  }
  			  
  			  col1.appendChild(col1Img);

  			  const col2 = document.createElement('div');
  			  col2.className = 'col-8 ms-0';

  			  const row1 = document.createElement('div');
  			  row1.className = 'row align-items-center';

  			  const row1col1 = document.createElement('div');
  			  row1col1.className = 'col-auto fw-bold text-start';
  			  row1col1.textContent = data.userDto.nickname;

  			  const row1col2 = document.createElement('div');
  			  row1col2.className = 'col-auto p-0 pe-1 text-secondary text-start townName';
  			  row1col2.textContent = data.productTownDto.product_town_name;
  			  const row1col2Andcol3 = document.createElement('div');
  			  row1col2Andcol3.className = 'p-0 m-0 col-auto'
  			  row1col2Andcol3.textContent = '∙';


  			  const row1col3 = document.createElement('div');
  			  row1col3.className = 'col-auto ps-1 text-secondary text-start chatListTime';
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
  			  row2.className = 'row';

  			  const row2col = document.createElement('div');

  			  if(data.chatContent==null || data.chatContent===''){
  				row2col.textContent = ' ';
  				row2col.className = 'mt-3 col'
  			  }else{
  				row2col.className = 'col text-start text-truncate d-inline-block m-0';
  				row2col.textContent = data.chatContent;
  				row2col.style.maxWidth = '300px';
  			  }

  			  const row2col2 = document.createElement('div');
  			  if(data.unreadCount == 0){
  				row2col2.innerText = '';
  				row2col2.className = 'col-1';
  			  }else{
  				row2col2.className ='col-1 circle text-center';
  				row2col2.innerText = data.unreadCount;
  			  }


  			  row2.appendChild(row2col);
  			  row2.appendChild(row2col2);

  			  const col3 = document.createElement('div');
  			  col3.className = 'col-2';
  			  const col3Img = document.createElement('img');
  			  col3Img.alt = '사진';
  			  col3Img.src = '/safarifile/' + data.productImgDto.product_img_link;
  			  col3Img.width = '60';
  			  col3Img.height = '60';
  			  col3Img.style = 'border-radius: 2px;';
  			  col3.appendChild(col3Img);




  			  row.appendChild(col1);
  			  row.appendChild(col2);
  			  row.appendChild(col3);
  			  /* row.appendChild(col4); */
  			  col2.appendChild(row1);
  			  col2.appendChild(row2);
  			  row1.appendChild(row1col1);
  			  row1.appendChild(row1col2);
  			  row1.appendChild(row1col2Andcol3);
  			  row1.appendChild(row1col3);

  			  chatRoomListStartBox.appendChild(row);



  		      }
            modalHide('chatModal');
        	const modal = bootstrap.Modal.getOrCreateInstance("#usedChatModal");
        	modal.show();
        }
    }

    //post
	xhr.open("get", "../used/chatListAjax");
	xhr.send();
}


let intervalHandler = null;
// 모달 열기
function  modalOn(requestId, receiverId, userNickname) {
	const myModal = bootstrap.Modal.getOrCreateInstance('#chatModal');
	requestId2=requestId;
	receiverId2=receiverId;
	userNickname2=userNickname;

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
	// 닫을 때
	modalHide('usedChatModal');
	modalHide('myWroteReviewModal');
	modalHide('writeReviewModal');
	// 열 때
	myModal.show();
	// 채팅방 리로딩
	reloadChatList(requestId);

	// 전송버튼
		const sendBox = document.getElementById("sendContent");
	// 텍스트상자
	const textareaBox = document.getElementById("chatContent");
	textareaBox.addEventListener("keyup", keyUpEvent1);

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
            row1col2row1col1.classList.add('col', 'ms-1', 'text-start');
            row1col2row1col1.innerText = response.map.productDto.title;
            row1col2row1col1.setAttribute('id', 'aTagrow1col2row1col1');
            row1col2row1col2 = document.createElement('span');
	        row1col2row1col2.disabled = true;
            row1col2row1col2.setAttribute('id', 'statusButton');
            row1col2row1col2.innerText = response.map.status;
            if(response.map.status == '거래완료'){
            	row1col2row1col2.classList.add('btn', 'py-0', 'btn-outline-secondary', 'btn-sm', 'ms-2');
            }else if(response.map.status == '예약중'){
            	row1col2row1col2.classList.add('btn', 'py-0', 'btn-outline-success', 'btn-sm', 'ms-2');
            }else{
            	row1col2row1col2.classList.add('btn', 'py-0', 'btn-outline-primary', 'btn-sm', 'ms-2');
            }


            row1col2row2 = document.createElement('div');
            row1col2row2.classList.add('row', 'ms-1', 'fw-bolder');
            
            if(response.map.productDto.price == 0){
            	row1col2row2.innerHTML = '<div class="col-3 text-start ps-0 fw-semibold" style="font-size: 10px;"><button type="button" class="btn btn-warning px-2 py-0" disabled="">나눔</button></div>';
            }else{
            	row1col2row2.innerText = response.map.productDto.price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + '원';
            }

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
    	            //송금요청  버튼 누르면 해당 메소드 불러오기
    				row2col2Span.setAttribute("onclick", "productRequestTransfer("+requestId+")");

    	            const row2col3 = document.createElement('div');
    	            row2col3.classList.add('col-2', 'btn', 'btn-outline-secondary', 'text-dark', 'btn-sm', 'p-1');
    	            const row2col3Icon = document.createElement('i');
    	            row2col3Icon.classList.add('bi', 'bi-check-circle-fill');
    	            const row2col3Span = document.createElement('span');
    	            row2col3Span.innerText = ' 거래완료';
    	            // 거래완료 버튼 누르면 해당 메소드 불러오기
    				row2col3Span.setAttribute("onclick", "productRequestStatusComplete("+requestId+")");
    	            

    	            const row2col4 = document.createElement('div');
    	            row2col4.classList.add('col', 'text-end', 'my-auto');
    	            
    	            const row2col4Img = document.createElement("img");
    	            row2col4Img.src = "/safari/resources/img/used/coin2.png";
    	            row2col4Img.width = 26;
    	            row2col4Img.height = 28;

    	            const row2col4span1 = document.createElement("span");
    	            row2col4span1.style.color = "#7d7a7a";
    	            row2col4span1.style.fontSize = "16px";
    	            row2col4span1.classList.add("fw-semibold", "ms-1");
    	            row2col4span1.textContent = response.myCoin.toLocaleString();

    	            const row2col4span2 = document.createElement("span");
    	            row2col4span2.style.color = "gray";
    	            row2col4span2.style.fontSize = "14px";
    	            row2col4span2.textContent = "코인";
    	            
    	            /* row2col4.innerHTML = '<img src="/safari/resources/img/used/coin2.png" width="26" height="28"><span style="color:" #919191cc;font-size:="" 16px;"="" class="fw-semibold"> 1,200</span><span style="color:gray;font-size:14px;"> 코인</span>'; */
    	            	
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
    	            
    	            row2col4.appendChild(row2col4Img);
    	            row2col4.appendChild(row2col4span1);
    	            row2col4.appendChild(row2col4span2);
    	            
    	            
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
    	         // 송금요청 버튼 누르면 해당 메소드 불러오기
    				row2col2Span.setAttribute("onclick", "productRequestTransfer("+requestId+")");

    	            const row2col3 = document.createElement('div');
    	            row2col3.classList.add('col-2', 'btn', 'btn-outline-secondary', 'text-dark', 'btn-sm', 'p-1');
    	            const row2col3Icon = document.createElement('i');
    	            row2col3Icon.classList.add('bi', 'bi-check-circle-fill');
    	            const row2col3Span = document.createElement('span');
    	            row2col3Span.innerText = ' 거래완료';
    	            
    	         // 거래완료 버튼 누르면 해당 메소드 불러오기
    				row2col3Span.setAttribute("onclick", "productRequestStatusComplete("+requestId+")");

    				const row2col4 = document.createElement('div');
    	            row2col4.classList.add('col', 'text-end', 'my-auto');
    	            
    	            const row2col4Img = document.createElement("img");
    	            row2col4Img.src = "/safari/resources/img/used/coin2.png";
    	            row2col4Img.width = 26;
    	            row2col4Img.height = 28;

    	            const row2col4span1 = document.createElement("span");
    	            row2col4span1.style.color = "#7d7a7a";
    	            row2col4span1.style.fontSize = "16px";
    	            row2col4span1.classList.add("fw-semibold", "ms-1");
    	            row2col4span1.textContent = response.myCoin.toLocaleString();

    	            const row2col4span2 = document.createElement("span");
    	            row2col4span2.style.color = "gray";
    	            row2col4span2.style.fontSize = "14px";
    	            row2col4span2.textContent = "코인";
    	         
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
    	            
    	            row2col4.appendChild(row2col4Img);
    	            row2col4.appendChild(row2col4span1);
    	            row2col4.appendChild(row2col4span2);

            	}else if(response.productRequestDto.status == '거래완료' && response.myWroteReviewCount == 0){
            		row2col1 = document.createElement('div');
    	            row2col1.classList.add('col-2', 'btn', 'btn-outline-secondary', 'text-dark', 'me-3', 'ms-2', 'btn-sm', 'p-1');
    				row2col1Icon = document.createElement('i');
    				row2col1Icon.classList.add('bi', 'bi-chat-dots-fill');
    				const row2col1Span = document.createElement('span');
    				row2col1Span.innerText = ' 리뷰쓰기';
    				row2col1Span.setAttribute("onclick", "writeReview("+response.sessionId+","+response.productRequestDto.user_id+","+response.productRequestDto.id+")");

    				const row2col4 = document.createElement('div');
    	            row2col4.classList.add('col', 'text-end', 'my-auto');
    	            
    	            const row2col4Img = document.createElement("img");
    	            row2col4Img.src = "/safari/resources/img/used/coin2.png";
    	            row2col4Img.width = 26;
    	            row2col4Img.height = 28;

    	            const row2col4span1 = document.createElement("span");
    	            row2col4span1.style.color = "#7d7a7a";
    	            row2col4span1.style.fontSize = "16px";
    	            row2col4span1.classList.add("fw-semibold", "ms-1");
    	            row2col4span1.textContent = response.myCoin.toLocaleString();

    	            const row2col4span2 = document.createElement("span");
    	            row2col4span2.style.color = "gray";
    	            row2col4span2.style.fontSize = "14px";
    	            row2col4span2.textContent = "코인";

    	            row2.appendChild(row2col1);
    	            row2.appendChild(row2col4);

    	            row2col1.appendChild(row2col1Icon);
    	            row2col1.appendChild(row2col1Span);

    	            row2.appendChild(row2col1);
    	            row2.appendChild(row2col4);
    	            
    	            row2col4.appendChild(row2col4Img);
    	            row2col4.appendChild(row2col4span1);
    	            row2col4.appendChild(row2col4span2);
    	            
            	}else if(response.productRequestDto.status == '거래완료' && response.myWroteReviewCount > 0){
            		row2col1 = document.createElement('div');
    	            row2col1.classList.add('col-3', 'btn', 'btn-outline-secondary', 'text-dark', 'me-3', 'ms-2', 'btn-sm', 'p-1');
    				row2col1Icon = document.createElement('i');
    				row2col1Icon.classList.add('bi', 'bi-pencil-square');
    				const row2col1Span = document.createElement('span');
    				row2col1Span.innerText = ' 보낸 후기 보기';
    				row2col1Span.setAttribute("onclick", "getMyWroteReview("+response.sessionId+","+response.productRequestDto.user_id+","+response.productRequestDto.id+")");

    				const row2col4 = document.createElement('div');
    	            row2col4.classList.add('col', 'text-end', 'my-auto');
    	            
    	            const row2col4Img = document.createElement("img");
    	            row2col4Img.src = "/safari/resources/img/used/coin2.png";
    	            row2col4Img.width = 26;
    	            row2col4Img.height = 28;

    	            const row2col4span1 = document.createElement("span");
    	            row2col4span1.style.color = "#7d7a7a";
    	            row2col4span1.style.fontSize = "16px";
    	            row2col4span1.classList.add("fw-semibold", "ms-1");
    	            row2col4span1.textContent = response.myCoin.toLocaleString();

    	            const row2col4span2 = document.createElement("span");
    	            row2col4span2.style.color = "gray";
    	            row2col4span2.style.fontSize = "14px";
    	            row2col4span2.textContent = "코인";

    	            row2.appendChild(row2col1);
    	            row2.appendChild(row2col4);

    	            row2col1.appendChild(row2col1Icon);
    	            row2col1.appendChild(row2col1Span);

    	            row2.appendChild(row2col1);
    	            row2.appendChild(row2col4);
    	            
    	            row2col4.appendChild(row2col4Img);
    	            row2col4.appendChild(row2col4span1);
    	            row2col4.appendChild(row2col4span2);
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
    	            row2col4.classList.add('col', 'text-end', 'my-auto');
    	            
    	            const row2col4Img = document.createElement("img");
    	            row2col4Img.src = "/safari/resources/img/used/coin2.png";
    	            row2col4Img.width = 26;
    	            row2col4Img.height = 28;

    	            const row2col4span1 = document.createElement("span");
    	            row2col4span1.style.color = "#7d7a7a";
    	            row2col4span1.style.fontSize = "16px";
    	            row2col4span1.classList.add("fw-semibold", "ms-1");
    	            row2col4span1.textContent = response.myCoin.toLocaleString();

    	            const row2col4span2 = document.createElement("span");
    	            row2col4span2.style.color = "gray";
    	            row2col4span2.style.fontSize = "14px";
    	            row2col4span2.textContent = "코인";

    	            row2.appendChild(row2col1);
    	            row2.appendChild(row2col4);

    	            row2col1.appendChild(row2col1Icon);
    	            row2col1.appendChild(row2col1Span);
    	            
    	            row2col4.appendChild(row2col4Img);
    	            row2col4.appendChild(row2col4span1);
    	            row2col4.appendChild(row2col4span2);

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
    				row2col1Span.setAttribute("onclick", "processPayment("+partner_order_id+","+partner_user_id+",'"+item_name+"',"+item_code+","+total_amount+")");

    				const row2col4 = document.createElement('div');
    	            row2col4.classList.add('col', 'text-end', 'my-auto');
    	            
    	            const row2col4Img = document.createElement("img");
    	            row2col4Img.src = "/safari/resources/img/used/coin2.png";
    	            row2col4Img.width = 26;
    	            row2col4Img.height = 28;

    	            const row2col4span1 = document.createElement("span");
    	            row2col4span1.style.color = "#7d7a7a";
    	            row2col4span1.style.fontSize = "16px";
    	            row2col4span1.classList.add("fw-semibold", "ms-1");
    	            row2col4span1.textContent = response.myCoin.toLocaleString();

    	            const row2col4span2 = document.createElement("span");
    	            row2col4span2.style.color = "gray";
    	            row2col4span2.style.fontSize = "14px";
    	            row2col4span2.textContent = "코인";

    	            row2.appendChild(row2col1);
    	            row2.appendChild(row2col4);

    	            row2col1.appendChild(row2col1Icon);
    	            row2col1.appendChild(row2col1Span);
    	            
    	            row2col4.appendChild(row2col4Img);
    	            row2col4.appendChild(row2col4span1);
    	            row2col4.appendChild(row2col4span2);

            	}else if(response.productRequestDto.status == '거래완료' && response.myWroteReviewCount == 0){
            		row2col1 = document.createElement('div');
    	            row2col1.classList.add('col-2', 'btn', 'btn-outline-secondary', 'text-dark', 'me-3', 'ms-2', 'btn-sm', 'p-1');
    				row2col1Icon = document.createElement('i');
    				row2col1Icon.classList.add('bi', 'bi-chat-dots-fill');
    				const row2col1Span = document.createElement('span');
    				row2col1Span.innerText = ' 리뷰쓰기';
    				row2col1Span.setAttribute("onclick", "writeReview("+response.sessionId+","+ response.map.productDto.user_id+","+response.productRequestDto.id+")");

    				const row2col4 = document.createElement('div');
    	            row2col4.classList.add('col', 'text-end', 'my-auto');
    	            
    	            const row2col4Img = document.createElement("img");
    	            row2col4Img.src = "/safari/resources/img/used/coin2.png";
    	            row2col4Img.width = 26;
    	            row2col4Img.height = 28;

    	            const row2col4span1 = document.createElement("span");
    	            row2col4span1.style.color = "#7d7a7a";
    	            row2col4span1.style.fontSize = "16px";
    	            row2col4span1.classList.add("fw-semibold", "ms-1");
    	            row2col4span1.textContent = response.myCoin.toLocaleString();

    	            const row2col4span2 = document.createElement("span");
    	            row2col4span2.style.color = "gray";
    	            row2col4span2.style.fontSize = "14px";
    	            row2col4span2.textContent = "코인";

    	            row2.appendChild(row2col1);
    	            row2.appendChild(row2col4);

    	            row2col1.appendChild(row2col1Icon);
    	            row2col1.appendChild(row2col1Span);

    	            row2.appendChild(row2col1);
    	            row2.appendChild(row2col4);
    	            
    	            row2col4.appendChild(row2col4Img);
    	            row2col4.appendChild(row2col4span1);
    	            row2col4.appendChild(row2col4span2);
    	            
            	}else if(response.productRequestDto.status == '거래완료' && response.myWroteReviewCount > 0){
            		row2col1 = document.createElement('div');
    	            row2col1.classList.add('col-3', 'btn', 'btn-outline-secondary', 'text-dark', 'me-3', 'ms-2', 'btn-sm', 'p-1');
    				row2col1Icon = document.createElement('i');
    				row2col1Icon.classList.add('bi', 'bi-pencil-square');
    				const row2col1Span = document.createElement('span');
    				row2col1Span.innerText = ' 보낸 후기 보기';
    				row2col1Span.setAttribute("onclick", "getMyWroteReview("+response.sessionId+","+response.map.productDto.user_id+","+response.productRequestDto.id+")");

    				const row2col4 = document.createElement('div');
    	            row2col4.classList.add('col', 'text-end', 'my-auto');
    	            
    	            const row2col4Img = document.createElement("img");
    	            row2col4Img.src = "/safari/resources/img/used/coin2.png";
    	            row2col4Img.width = 26;
    	            row2col4Img.height = 28;

    	            const row2col4span1 = document.createElement("span");
    	            row2col4span1.style.color = "#7d7a7a";
    	            row2col4span1.style.fontSize = "16px";
    	            row2col4span1.classList.add("fw-semibold", "ms-1");
    	            row2col4span1.textContent = response.myCoin.toLocaleString();

    	            const row2col4span2 = document.createElement("span");
    	            row2col4span2.style.color = "gray";
    	            row2col4span2.style.fontSize = "14px";
    	            row2col4span2.textContent = "코인";

    	            row2.appendChild(row2col1);
    	            row2.appendChild(row2col4);

    	            row2col1.appendChild(row2col1Icon);
    	            row2col1.appendChild(row2col1Span);

    	            row2.appendChild(row2col1);
    	            row2.appendChild(row2col4);
    	            
    	            row2col4.appendChild(row2col4Img);
    	            row2col4.appendChild(row2col4span1);
    	            row2col4.appendChild(row2col4span2);
            	}
            }

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
                const url = '../used/productDetail?productId='+response.map.productDto.id;

                // 페이지 이동
                window.location.href = url;
            });
            aTagrow1col2row1col1.addEventListener('click', function() {
                // href로 이동할 페이지 URL
                const url = '../used/productDetail?productId='+response.map.productDto.id;

                // 페이지 이동
                window.location.href = url;
            });

        }
    }
    //get
	xhr.open("get", "../used/getProductInformation?requestId="+requestId);
	xhr.send();
}
// 판매자일때 송금요청하기 
function productRequestTransfer(requestId) {
	
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
	    if(xhr.readyState == 4 && xhr.status == 200){
	        const response = JSON.parse(xhr.responseText);
	        reloadChatList(requestId);
	    }
	}
	//get
	xhr.open("get", "../used/productRequestTransfer?requestId="+requestId);
	xhr.send();
}


// Textarea에서 Enter 칠 때도 전송되기(단, shirt+enter 안되게)
function keyUpEvent1(e) {
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
	xhr.open("post", "../used/insertProductChatDto");
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send("purchase_request_id="+requestId+"&receiver_id="+receiverId+"&content="+contentValue);
	/* xhr.send(`requestId=\${requestId}&receiverId=\${receiverId}`); */

}

//scroll lock
let chatMsgScrollTop = -1;

//채팅 내용 리스트 리로딩
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
				  row1.classList.add('row', 'mt-1', 'mb-2');
				  // 보내는 사람일때	
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
				     // 받는 사람일 떄 
			      }else {
				  
				  const colIcon = document.createElement('div');
				  colIcon.className = 'col-1 ms-1 text-left ms-0';
	  			  const col1Img = document.createElement('img');
	  			  col1Img.className = 'rounded-circle';
	  			  col1Img.width = 40;
	  			  col1Img.height = 40;
	  			  // 상대방이  프로필 사진 있을 떄
	  			  console.log(response.receiverDto.profile_img_link == null);
	  			  if(response.receiverDto.profile_img_link == null){
	  				col1Img.src = '/safari/resources/img/user.jpg';
	  				col1Img.style = 'filter:grayscale(1)';
	  			  }else{
	  				col1Img.src = '/safari/resources/img/used/user2.png';
	  				/* col1Img.src = '/safarifile/' + data.userDto.product_img_link;  */
	  			  }
	  			  colIcon.appendChild(col1Img);

				  const col3 = document.createElement('div');
				  col3.classList.add('col-7', 'ms-3', 'otherContent', 'text-break');
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
				  /* // 송금 받았을 때
				  else{
					  const col3 = document.createElement('div');
					  col3.classList.add('col','text-center');
					  col3.innerText = data.content;
	
					  row1.appendChild(col3);
	
					  getChatbox.appendChild(row1);
				  } */
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
	xhr.open("get", "../used/reloadChatList?requestId=" + requestId+"&receiverId="+receiverId2);
	xhr.send();
}

//읽음여부 업데이트
function updateIsRead(requestId) {

	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
	    if(xhr.readyState == 4 && xhr.status == 200){
	        const response = JSON.parse(xhr.responseText);
	    }
	}
	//get
	xhr.open("get", "../used/updateIsRead?requestId="+requestId);
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
	xhr.open("get", "../used/productRequestStatusReservation?requestId="+requestId);
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
xhr.open("get", "../used/productRequestStatusCancel?requestId="+requestId);
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
xhr.open("get", "../used/productRequestStatusComplete?requestId="+requestId);
xhr.send();
}

//결제하기
function processPayment(partner_order_id, partner_user_id,item_name,item_code,total_amount) {
	if(total_amount>coinBalance){
		const coinAlertwModal = bootstrap.Modal.getOrCreateInstance('#bidFailureLowerCoinModal');
		coinAlertwModal.show();
	}else if(total_amount == 0){
		const coinZeroModal = bootstrap.Modal.getOrCreateInstance('#bidFailureZeroCoinModal');
		coinZeroModal.show();
		
	}else{
		getProductInformation(partner_order_id);
		successPayment(partner_order_id, partner_user_id,item_name,item_code,total_amount);
	}

}

function successPayment(partner_order_id, partner_user_id,item_name,item_code,total_amount) {
	
	
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
	    if(xhr.readyState == 4 && xhr.status == 200){
	        const response = JSON.parse(xhr.responseText);
	        reloadChatList(partner_order_id);
	    }
	}
	//get
	xhr.open("get", "../used/reduceAndPlusUserCoinByUsed?user_id="+partner_user_id+"&coin_transaction="+total_amount+"&productId="+item_code+"&requestId="+partner_order_id);
	xhr.send();
	
	/* const myModal = bootstrap.Modal.getOrCreateInstance('#adsModal');
	myModal.hide(); 

	  const cid = "TC0ONETIME";
	  const partner_order_id = partner_order_id;
	  const partner_user_id = partner_user_id;
	  const item_name = item_name;
	  const item_code = item_code; 
	  const quantity = 1;
	  const total_amount = total_amount; 
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
			  +"&approval_url="+approval_url+"&cancel_url="+cancel_url+"&fail_url="+fail_url); */
	  
}

/*
//Save tid to session using AJAX
function saveTidToSession(cid,partner_order_id,partner_user_id,tid, item_name, item_code, next_redirect_pc_url) {

	console.log("saveTidToSession");

const xhr = new XMLHttpRequest();


xhr.onreadystatechange = function() {
    if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {

    	 location.href = response.next_redirect_pc_url; 
    	 window.open(next_redirect_pc_url, "_blank");

    }
};

xhr.open("POST", "../used/saveTidToSession");
xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
xhr.send("cid="+cid+"&partner_order_id="+partner_order_id+"&partner_user_id="+partner_user_id+"&tid="+tid+"&item_name="+item_name+"&item_code="+item_code);
}
*/

//리뷰 클릭하면 채팅창 닫고 리뷰쓰기 모달 열기
function writeReview(senderId, receiverId, requestId) {
	modalHide('chatModal');
	reviewModalOn(senderId, receiverId, requestId);
}

//리뷰모달 열기
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
	        col1.classList.add('col-2', 'p-0');
	      	const col1Img = document.createElement("img");
	      	col1Img.alt = response.map.productDto.title;
	      	col1Img.src = '/safarifile/' + response.map.productImgDto.product_img_link;
	      	col1Img.classList.add('img-fluid');
	
	      	const col2 = document.createElement('div');
	        col2.classList.add('col', 'mt-3', 'ms-1');
	
	      	const col2row1 = document.createElement('div');
	      	col2row1.classList.add('row');
	        const col2row1col1 = document.createElement('div');
	        col2row1col1.classList.add('col', 'fw-bold');
	        /* col2row1col1.textContent = '에어팟 프로'; */
	        col2row1col1.textContent = response.map.productDto.title;
	
	        const col2row2 = document.createElement('div');
	      	col2row2.classList.add('row');
	        const col2row2col1 = document.createElement('div');
	        col2row2col1.classList.add('col-auto');
	        col2row2col1.textContent = '거래한 이웃'
	
	        const col2row2col2 = document.createElement('div');
	        col2row2col2.classList.add('fw-bold', 'm-0', 'col-auto', 'p-0');
	        /* span.textContent = '피자죠아'; */
	        col2row2col2.textContent = response.map.receiverDto.nickname;
	
	        row1.appendChild(col1);
	        col1.appendChild(col1Img);
	        row1.appendChild(col2);
	        col2.appendChild(col2row1);
	        col2row1.appendChild(col2row1col1);
	        col2.appendChild(col2row2);
	        col2row2.appendChild(col2row2col1);
	        col2row2.appendChild(col2row2col2);
	
	        modalHeaderWrapperBox.appendChild(row1);
	
	
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
	
	
	    }
	}
	//get
	xhr.open("get", "../used/getReviewHeaderAndBody?senderId="+senderId+"&receiverId="+receiverId+"&requestId="+requestId);
	xhr.send();
}

//modal 닫을 때
function modalHide(id) {
	const modalId = '#'+ id;
	const myModal = bootstrap.Modal.getOrCreateInstance(modalId);
	   myModal.hide();
}



///////////////////
//*  실시간 문의  *//
/////////////////


let liveChatId = null;
let liveChatEnded = null;
let intervalHandler1 = null;
let feedbackBtnActive = true;



function displayCurrentTime() {
	const currentDate = new Date();
	const year = currentDate.getFullYear();
	const month = String(currentDate.getMonth() + 1).padStart(2, '0');
	const day = String(currentDate.getDate()).padStart(2, '0');
	const hours = String(currentDate.getHours()).padStart(2, '0');
	const minutes = String(currentDate.getMinutes()).padStart(2, '0');
	const seconds = String(currentDate.getSeconds()).padStart(2, '0');

	const currentTimeString = year + '/' + month + '/' + day + ' ' + hours + ':' + minutes ;


	return currentTimeString;


}


function openLiveChat() {
	
	
	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			
			if(response.result === "fail"){
				window.location.href = '/safari/user/loginPage';
				return;
			}

			// 모달 열기
			const modal = bootstrap.Modal.getOrCreateInstance("#liveChatModal");
			/* const liveChatStart = document.getElementById('liveChatStart');
			liveChatStart.innerText= "실시간 문의가 시작되었습니다. "+displayCurrentTime(); */

			// 이벤트 리스너 추가
			const textareaBox = document.getElementById("chatText");
			textareaBox.addEventListener("keyup", keyUpEvent);


			// TODO : 이미 열린 채팅 중 종료되지 않은 채팅 있는지 확인

			// 3초마다 채팅 업로드
			if(intervalHandler1 != null){
				clearInterval(intervalHandler1);
				intervalHandler1 = null;
			}

			intervalHandler1 = setInterval(() => {
				getMsg();
			}, 3000);

			modal.show();
			
			
		}
	}

	// get 방식 
	xhr.open("get", "../user/getMyId");
	xhr.send();

}




function startLiveChat(categoryId) {

	// 필요한 것
	// userid / categoryid / empid(보낸 후 자바에서 배정) / reg_date / end_date

	// 실시간 문의 시작
	const xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);

			// 선택된 버튼 표시
			const selectedBtn = document.getElementById("btn"+categoryId);
			selectedBtn.classList.add("btn-dark");
			selectedBtn.classList.remove("btn-outline-dark");

			liveChatId = response.chatId;

			// 보낸 후 이벤트 리스너 삭제 (중복클릭 방지)
		    removeClickEventListeners();

		}
	}


	// post 방식
	xhr.open("post", "../user/startLiveChat");
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.send("categoryId="+categoryId);
}



// 카테고리 버튼에 클릭 이벤트 리스너 삭제
function removeClickEventListeners() {

    const buttons = document.getElementsByClassName("categoryBtn");
    for (let i = 0; i < buttons.length; i++) {
      buttons[i].removeAttribute("onclick");
    }

}





//  실시간 문의 메세지 보내기
function sendMsg() {
	// 채팅 시작 전이면 리턴
	if(!liveChatId) return;

	const inputBox = document.getElementById("chatText");
	const inputValue = inputBox.value.trim();

	// 내용 없을 경우 인서트 하지 않고 리턴
	if(!inputValue) return;


	const xhr = new XMLHttpRequest();

    xhr.onreadystatechange = function(){
        if(xhr.readyState == 4 && xhr.status == 200){
            const response = JSON.parse(xhr.responseText);


            // textarea안에 값 지우기
            inputBox.value = "";

            getMsg();
        }
    }

    //post
	xhr.open("post", "../user/sendLiveChatMsg");
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send("sendLiveChatMsg="+inputValue+"&chatId="+liveChatId);

}


//Enter로 메시지 입력 함수 정의  (shift+enter 일 경우 제외)
function keyUpEvent(e) {
	if (e.key === "Enter" && !e.shiftKey) {
		sendMsg();
	}
}






// 메세지 리스트 가져오기

function getMsg() {

	if(!liveChatId) return;

	const msgBox = document.getElementById("chatMsgBox");


	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);

			// 초기화
			msgBox.innerHTML = "";

			// 메세지 생성 반복 시작
			response.list.forEach(function(msg){

				const row1 = document.createElement('div');
				  row1.classList.add('row', 'mt-1', 'py-1');

				  // 내가 보낸 메세지
				  if( msg.sender === 1 ){
					  const col1 = document.createElement('div');
					  col1.classList.add('col', 'd-flex', 'flex-column', 'justify-content-end');
					  const col1row1 = document.createElement('div');
					  col1row1.classList.add('row', 'justify-content-end', 'mx-1');

					  // 안 읽음
					  if(msg.is_read == 0){
						  col1row1.innerText = '1';
					  } else { // 읽음
						  col1row1.innerText = ' ';
					  }

					  const col1row2 = document.createElement('div');
					  col1row2.classList.add('row', 'justify-content-end', 'mx-1', 'chatTime');
					  const regDate = new Date(msg.reg_date);
					  const formattedDate = regDate.toLocaleTimeString('ko-KR', { hour: 'numeric', minute: '2-digit' });
					  col1row2.innerText = formattedDate;

					  const col2 = document.createElement('div');
					  col2.classList.add('col-7', 'me-3', 'myContent', 'text-start', 'text-break');
					  col2.innerText = msg.msg;

					  row1.appendChild(col1);
					  row1.appendChild(col2);
					  col1.appendChild(col1row1);
					  col1.appendChild(col1row2);

					  msgBox.appendChild(row1);

				  }else {

					  // 프사
					  const colIcon = document.createElement('div');
					  colIcon.classList.add('col-auto', 'my-auto', 'ms-2', 'text-left');
					  const outerDiv2 = document.createElement('div');
					  outerDiv2.className = 'row my-auto';
					  const innerDiv2 = document.createElement('div');
					  innerDiv2.className = 'col text-start ps-1 pt-1';
					  const imageElement = document.createElement('img');
					  imageElement.className = 'img-fluid rounded-circle';
					  imageElement.style.filter = "grayscale(1)";
					  if(true) {
						  imageElement.src = '/safari/resources/img/user.jpg';
					  } else {
						  // imageElement.src = '/safariImg/'+response.user.profile_img_link;
					  }
					  imageElement.style.width = '46px';
					  imageElement.style.height = '46px';
					  innerDiv2.appendChild(imageElement);
					  outerDiv2.appendChild(innerDiv2);
					  colIcon.appendChild(outerDiv2);


					  // 메세지
					  const colOuterDiv = document.createElement('div');
					  colOuterDiv.classList.add('col');
						  const rowInnerDiv1 = document.createElement('div');
						  rowInnerDiv1.classList.add('row');
						  const innerDiv1 = document.createElement('div');
						  innerDiv1.className = 'col text-secondary text-start';
						  innerDiv1.style.fontSize = "14px";
						  innerDiv1.innerText = response.emp;
						  rowInnerDiv1.appendChild(innerDiv1);

						  const rowInnerDiv2 = document.createElement('div');
						  rowInnerDiv2.classList.add('row');
						  const col3 = document.createElement('div');
						  col3.classList.add('col-7', 'ms-2', 'text-left', 'text-break', 'otherContent');
						  col3.innerText = msg.msg;
						  rowInnerDiv2.appendChild(col3);


					 /*  const colIcon = document.createElement('div');
					  colIcon.classList.add('col-1', 'ms-2', 'd-grid', 'text-left'); */

					  /* const icon = document.createElement('i');
					  icon.classList.add('bi', 'bi-person-circle', 'fs-4');
					  colIcon.style.lineHeight = 1;
					  colIcon.appendChild(icon);

					  const col3 = document.createElement('div');
					  col3.classList.add('col-7', 'ms-2', 'text-left', 'text-break', 'otherContent');
					  col3.innerText = msg.msg; */


					  const col4 = document.createElement('div');
					  col4.classList.add('col', 'd-flex', 'flex-column','text-start', 'justify-content-end');
					  const col4row1 = document.createElement('div');
					  col4row1.classList.add('row', 'justify-content-start', 'mx-1');
					  const col4row2 = document.createElement('div');
					  col4row2.classList.add('row', 'justify-content-start', 'mx-1', 'chatTime', 'text-start');
					  const regDate = new Date(msg.reg_date);
					  const formattedDate = regDate.toLocaleTimeString('ko-KR', { hour: 'numeric', minute: '2-digit' });
					  col4row2.innerText = formattedDate;

					  col4.appendChild(col4row1);
					  col4.appendChild(col4row2);
					  rowInnerDiv2.appendChild(col4);
					  colOuterDiv.appendChild(rowInnerDiv1);
					  colOuterDiv.appendChild(rowInnerDiv2);





					  // 안 읽음
					  if(msg.is_read == 0){
						  col4row1.innerText = '1';
					  }else{ // 읽음
						  col4row1.innerText = ' ';
					  }

					  row1.appendChild(colIcon);
					  row1.appendChild(colOuterDiv);
					  // row1.appendChild(col3);
					  // row1.appendChild(col4);
					  //col4.appendChild(col4row1);
					  //col4.appendChild(col4row2);

					  msgBox.appendChild(row1);
				  }

			});
			// 메세지 생성 반복문 종료


			// 만약 채팅 상담이 종료 되었을 경우
			if(response.isChatEnded) {
				// 메세지 못 보내게
				const sendMsgBtn = document.getElementById("sendMsg");
				
				sendMsgBtn.className = "send-button disabled btn btn-dark ms-3 px-3";
				// 상담이 종료되었습니다.
				const rDiv = document.createElement('div');
				rDiv.classList.add('row','py-2');
				const cDiv = document.createElement('div');
				cDiv.classList.add('col', 'text-secondary', 'text-center','mt-3');
				cDiv.textContent = '상담이 종료되었습니다';
				rDiv.appendChild(cDiv);
				msgBox.appendChild(rDiv);
				// 인터벌 제거
				if(intervalHandler1 != null){
					clearInterval(intervalHandler1);
					intervalHandler1 = null;
				}
				// 후기 남기기
				const r1Div = document.createElement('div');
				r1Div.classList.add('row','py-2');
				const c1Div = document.createElement('div');
				c1Div.classList.add('col', 'text-secondary', 'text-center');
				c1Div.textContent = '문의가 만족스러우셨나요?';
				r1Div.appendChild(c1Div);

				const r2Div = document.createElement('div');
				r2Div.className = 'row py-2 text-center';
				const c2Div = document.createElement('div');
				c2Div.classList.add('col', 'text-secondary', 'text-center');
				const btn1Div = document.createElement('div');
				if(feedbackBtnActive) {
					btn1Div.className = 'btn btn-dark px-3';
				} else {
					btn1Div.className = 'btn btn-dark px-3 disabled';
				}
				btn1Div.textContent = "문의 평가하기";
				btn1Div.id = "feedbackBtn";
				btn1Div.addEventListener('click', feedback);

				c2Div.appendChild(btn1Div);
				r2Div.appendChild(c2Div);

				msgBox.appendChild(r1Div);
				msgBox.appendChild(r2Div);

			}

			// 스크롤 처리
			msgBox.scrollTop = msgBox.scrollHeight;

		}
	}

	// get 방식
	xhr.open("get", "../user/getLiveChatMsgList?chatId="+liveChatId);
	xhr.send();

}





// 상담 평가 모달 열기
function feedback() {

	// 기존 채팅 모달 닫기
	const modal = bootstrap.Modal.getOrCreateInstance('#liveChatModal');
	modal.hide();

	// 문의 평가 모달 열기
	const newModal = bootstrap.Modal.getOrCreateInstance('#feedbackModal');
	newModal.show();


}





// 상담 평가 보내기
function saveFeedback() {

	const ratingGroup = document.querySelector('#full-stars-example-two .rating-group');
	const checkedInput = ratingGroup.querySelector('input:checked');
	const ratingValue = checkedInput ? checkedInput.value : null;

	const textAreaBox = document.getElementById("textReview");
	const textReview = textAreaBox.value.trim();

	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);

			// 평가 후에는 평가 남기기 버튼 disable
			const feedbackBtn = document.getElementById("feedbackBtn");
			feedbackBtn.classList.add("disabled");
			feedbackBtn.removeEventListener('click', feedback);
			feedbackBtnActive = false;

			// 문의 평가 모달 닫기
			const modal = bootstrap.Modal.getOrCreateInstance('#feedbackModal');
			modal.hide();

		}
	}

	// post 방식
	xhr.open("post", "../user/saveLiveChatRating");
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.send("chat_id="+liveChatId+"&rating="+ratingValue+"&text_review="+textReview);

}




// 모달 닫으면 인터벌 핸들러 지우기
const myModalEl = document.getElementById('liveChatModal')
myModalEl.addEventListener('hide.bs.modal', event => {
	if(intervalHandler1 != null){
		clearInterval(intervalHandler1);
		intervalHandler1 = null;
	}
})



window.addEventListener("DOMContentLoaded",function(){
	getMsg();


});




///////////////////
//*  실시간 문의  *//
/////////////////








</script>
