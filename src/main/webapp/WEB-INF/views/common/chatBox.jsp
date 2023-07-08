<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>

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












<script >





///////////////////
//*  실시간 문의  *//
/////////////////


let liveChatId = null;


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
			
			// 메세지 생성 
			response.list.forEach(function(msg){
				
				const row1 = document.createElement('div');
				  row1.classList.add('row', 'mt-1');
				  
				  // 내가 보낸 메세지 
				  if( msg.sender == 1 ){
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
			msgBox.scrollTop = msgBox.scrollHeight;
			
		}
	}

	// get 방식 
	xhr.open("get", "./getLiveChatMsgList?chatId="+liveChatId);
	xhr.send();
	
}




/* 
//채팅 내용 리스트 리로딩 
function reloadChatMsg(requestId) {
	
	
// chatlisBox 
const getChatbox = document.getElementById("getChatList");

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
				  col2.classList.add('col-7', 'me-3', 'myContent');
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
				  col3.classList.add('col-7', 'ms-2', 'text-left', 'otherContent');
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
			  
		}
		// 채팅 화면 마지막으로 맞추기 
		getChatbox.scrollTop = getChatbox.scrollHeight;
	}
}

//get
xhr.open("get", "./reloadChatList?requestId=" + requestId);
xhr.send();
}

 */

 
window.addEventListener("DOMContentLoaded",function(){
	getMsg();
	 
	 
});




///////////////////
//*  실시간 문의  *//
/////////////////








</script>
