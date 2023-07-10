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
body {
  padding: 1rem;
  text-align: center;
}
/*  */ /* 별점 */ /*  */




/* 카테고리 버튼 round */
.rnd{
	border-radius: 50px;
}


.myContent {
  background-color: rgba(75, 137, 220, 0.25);  /* 배경색 */
  color: #000000; /* 글자색 */
  padding: 10px; /* 여백 */
  border-radius: 10px; /* 테두리의 굴곡 정도 */
  text-align: end; /* 내용을 오른쪽 정렬 */
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

</style>
   
<!-- font awesome / 별점 -->
<script src="https://kit.fontawesome.com/a83ecfd9ee.js" crossorigin="anonymous"></script>
<!-- font awesome / 별점 -->
   
   
   
<!--  -->  
<!--  -->  
<!--  -->  
<!-- 오른쪽 하단 메세지 아이콘 버튼 -->
<div class="btn-qna shadow-lg bg-white px-1 pt-3 pb-3 mx-0 text-secondary" style="width: 82px; height: 190px; align-content: center">
	<div class="btn-circle mx-auto " id="usedChat" style="margin-top: 11px">
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
<!-- LiveChatModal -->
<div class="modal" id="liveChatModal" tabindex="-1" onclick="">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header position-relative">
 	        <div class="modal-title" id="modalTitle">
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
		     	<div class="row mb-2">
			     	<div class="col ms-1 fs-6">
		     			문의 카테고리를 선택하시면 실시간 채팅이 시작됩니다 
		     		</div>
		     	</div>
		     	<div class="row">
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
			<div class="chat-container overflow-y-scroll overflow-x-hidden" style="height:380px;" id="chatMsgBox">
			
				<!-- <div class="row">
					<div class="col text-secondary text-center"> 상담이 종료되었습니다 </div>	
				</div>
 -->
			
			</div>
			<!-- Messages -->
	      </div>
	      
	      <div class="modal-footer justify-content-start">
	      		<textarea id="chatText" placeholder="메시지 보내기" rows="1" cols="20" class="form-control" style="width: 80%;"></textarea>
	      	
			    <button class="send-button btn btn-primary ms-3 px-3" id="sendMsg" onclick="sendMsg()">전송</button>
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
<div class="modal" tabindex="-1" id="feedbackModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">실시간 문의 평가</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      
      	<div class="row py-3">
    	  	<div class="col text-start">
				상담에 대한 피드백을 남겨주세요
	      	</div>
      	</div>
      
      	<div class="row">
    	  	<div class="col">
      			<div id="full-stars-example-two">
				    <div class="rating-group">
				        <input disabled checked class="rating__input rating__input--none" name="rating3" id="rating3-none" value="0" type="radio">
				        <label aria-label="1 star" class="rating__label" for="rating3-1"><i class="rating__icon rating__icon--star fa fa-2xs fa-star"></i></label>
				        <input class="rating__input" name="rating3" id="rating3-1" value="1" type="radio">
				        <label aria-label="2 stars" class="rating__label" for="rating3-2"><i class="rating__icon rating__icon--star fa fa-2xs fa-star"></i></label>
				        <input class="rating__input" name="rating3" id="rating3-2" value="2" type="radio">
				        <label aria-label="3 stars" class="rating__label" for="rating3-3"><i class="rating__icon rating__icon--star fa fa-2xs fa-star"></i></label>
				        <input class="rating__input" name="rating3" id="rating3-3" value="3" type="radio">
				        <label aria-label="4 stars" class="rating__label" for="rating3-4"><i class="rating__icon rating__icon--star fa fa-2xs fa-star"></i></label>
				        <input class="rating__input" name="rating3" id="rating3-4" value="4" type="radio">
				        <label aria-label="5 stars" class="rating__label" for="rating3-5"><i class="rating__icon rating__icon--star fa fa-2xs fa-star"></i></label>
				        <input class="rating__input" name="rating3" id="rating3-5" value="5" type="radio">
				    </div>
				</div>
	      	</div>
      	</div>
        
      
      	<div class="row mt-2">
    	  	<div class="col">
				<textarea rows="3" cols="" class="form-control" id="textReview"></textarea>
	      	</div>
      	</div>
        
        
      </div>
      <div class="modal-footer">
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










<script >





///////////////////
//*  실시간 문의  *//
/////////////////


let liveChatId = null;
let liveChatEnded = null;
let intervalHandler = null;
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
	
	// 모달 열기 
	const modal = bootstrap.Modal.getOrCreateInstance("#liveChatModal");
	/* const liveChatStart = document.getElementById('liveChatStart');
	liveChatStart.innerText= "실시간 문의가 시작되었습니다. "+displayCurrentTime(); */
	
	// 이벤트 리스너 추가 
	const textareaBox = document.getElementById("chatText");
	textareaBox.addEventListener("keyup", keyUpEvent);
	
	
	// TODO : 이미 열린 채팅 중 종료되지 않은 채팅 있는지 확인
	
	// 3초마다 채팅 업로드 
	if(intervalHandler != null){
		clearInterval(intervalHandler);
		intervalHandler = null;
	}
	
	intervalHandler = setInterval(() => {
		getMsg();
	}, 3000);
	
	modal.show();
	
	
	
	
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
	xhr.open("post", "./startLiveChat");
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
	xhr.open("post", "./sendLiveChatMsg");
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
				  row1.classList.add('row', 'mt-1');
				  
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
					  const colIcon = document.createElement('div');
					  colIcon.classList.add('col-1', 'ms-2', 'd-grid', 'text-left');

					  const icon = document.createElement('i');
					  icon.classList.add('bi', 'bi-person-circle', 'fs-4');
					  colIcon.style.lineHeight = 1;
					  colIcon.appendChild(icon);
					  
					  const col3 = document.createElement('div');
					  col3.classList.add('col-7', 'ms-2', 'text-left', 'text-break', 'otherContent');
					  col3.innerText = msg.msg;
					  
					  const col4 = document.createElement('div');
					  col4.classList.add('col', 'd-flex', 'flex-column', 'justify-content-end');
					  const col4row1 = document.createElement('div');
					  col4row1.classList.add('row', 'justify-content-start', 'mx-1');
					  const col4row2 = document.createElement('div');
					  col4row2.classList.add('row', 'justify-content-start', 'mx-1', 'chatTime');
					  const regDate = new Date(msg.reg_date);
					  const formattedDate = regDate.toLocaleTimeString('ko-KR', { hour: 'numeric', minute: '2-digit' });
					  col4row2.innerText = formattedDate;
					  
					  // 안 읽음 
					  if(msg.is_read == 0){
						  col4row1.innerText = '1';
					  }else{ // 읽음 
						  col4row1.innerText = ' ';
					  }
					  
					  row1.appendChild(colIcon);
					  row1.appendChild(col3);
					  row1.appendChild(col4);
					  col4.appendChild(col4row1);
					  col4.appendChild(col4row2);
					  
					  msgBox.appendChild(row1);
				  }
				
			});
			// 메세지 생성 반복문 종료 
			
			
			// 만약 채팅 상담이 종료 되었을 경우 
			if(response.isChatEnded) {
				// 메세지 못 보내게 
				const sendMsgBtn = document.getElementById("sendMsg");
				sendMsgBtn.classList.add("disabled");
				// 상담이 종료되었습니다. 
				const rDiv = document.createElement('div');
				rDiv.classList.add('row','py-2');
				const cDiv = document.createElement('div');
				cDiv.classList.add('col', 'text-secondary', 'text-center','mt-3');
				cDiv.textContent = '상담이 종료되었습니다';
				rDiv.appendChild(cDiv);
				msgBox.appendChild(rDiv);
				// 인터벌 제거  
				if(intervalHandler != null){
					clearInterval(intervalHandler);
					intervalHandler = null;
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
					btn1Div.className = 'btn btn-dark px-3';
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
	xhr.open("get", "./getLiveChatMsgList?chatId="+liveChatId);
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
			feedbackBtnActive = false;
			
			// 문의 평가 모달 닫기  
			const modal = bootstrap.Modal.getOrCreateInstance('#feedbackModal');
			modal.hide();
			
		}
	}

	// post 방식 
	xhr.open("post", "./saveLiveChatRating");
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.send("chat_id="+liveChatId+"&rating="+ratingValue+"&text_review="+textReview);
	
}
 
 
 

// 모달 닫으면 인터벌 핸들러 지우기 
const myModalEl = document.getElementById('liveChatModal')
myModalEl.addEventListener('hide.bs.modal', event => {
	if(intervalHandler != null){
		clearInterval(intervalHandler);
		intervalHandler = null;
	}
})


 
window.addEventListener("DOMContentLoaded",function(){
	getMsg();
	 
	 
});




///////////////////
//*  실시간 문의  *//
/////////////////








</script>
