<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 메타 섹션 -->
<jsp:include page="../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->
<style>
/* .btnOrange{
	padding:9px 18px; 
	background: rgba(246, 137, 66, 0.75);
	border:none; 
	color: white; 
	border-radius:8px; 
	font-size: 14px;
	height: 24px;
} */

.btnOrange {
    display: inline-block;
    padding: 8px 14px;
    border: 2px solid #F68942;
    color: #F68942;
    text-decoration: none;
    border-radius:8px; 
    transition: all 0.3s ease;
    font-size: 14px;
    
}

.btnOrange:hover {
    background-color: #F68942;
    color: white;
}


.textOrange {
    color: #F68942;
}


/* 카테고리 버튼 round */
.rnd{
	border-radius: 50px;
}


.myContent {
  background-color: #F68942; /* rgba(75, 137, 220, 0.25);  */ /* 배경색 */
  color: #000000; /* 글자색 */
  padding: 10px; /* 여백 */
  border-radius: 10px; /* 테두리의 굴곡 정도 */
  text-align: end; /* 내용을 오른쪽 정렬 */
  width: auto;
  max-width: 320px;
  color: white;
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
.orangeButton:hover{
   background: #FF812C;
   font-weight: bold;
   color: white;
}


</style>

<style>
.border-left {
  border-left : 1px solid #adb5bd;
}
.circle {
	margin-top: 1px;
    display: inline-block;
    width: 16px;
    height: 20px;
    border-radius: 18px;
    text-align: center;
    color: white;
    font-weight: bold;
    line-height: 20px;
}
.orangeBtn {
	background: #FF6F0F;
	color: white;
}

</style>











</head>
<body>

<!-- 헤더 섹션 -->
<jsp:include page="../common/csTopNav2.jsp"></jsp:include>
<!-- 헤더 섹션 -->







<div class="container-fluid">
	<div class="row mt-0">
		<div class="col"></div>
		<div class="col-10">
		
			
			
			
			<div class="row mb-1">
				<div class="col d-grid">
					<h4 class="fw-bolder">실시간문의</h4>
				</div>
				
				<!-- count -->
				<div class="col-2 text-end" id=""> 
					<div class="btn orangeBtn fw-medium" id="chatCount">  </div>
				</div>
				<!-- count -->
				
			</div>
			<div class="row ">
				<div class="col " style="font-size: 14px;">

						<div class="row my-2 text-secondary rounded" >
							<div class="col-auto fw-bold ">
								<i class="bi bi-info-circle"></i> &nbsp;상담사의 업무 수칙
							</div>
							<div class="col  ">
								고객이 실수하거나 지나친 태도로 기분을 상하게 하더라도 감정을 억제하며 차분하게 응대하는 성숙한 자세를 보이며, 제어가 되지 않는 상황 속에서는 상사를 호출하여 원만한 해결이 이뤄질 수 있도록 합니다.
							</div>
						</div>
						
				</div>
			</div>
			
			
			<div class="row py-2">
			
				<!-- LEFT COL -->
				<div class="col-4">
					<div class="row sticky-top" >
						<div class="col">
							<div class="row  text-center bg-light " style="height: 60px">
								<div class="col fw-bolder my-auto" >실시간 문의 목록</div>
							</div>
							
							<div class="row overflow-y-scroll overflow-x-hidden" id="" style="height: 550px">
								<div class="col" id="">
									
									
									<!-- 문의 리스트 제목 들어갈 곳 -->
									<div class="" id="liveChatListContainer">
										
									</div>
									<!-- 문의 리스트 제목 들어갈 곳 -->
									
									
								</div>
							</div>
						</div>
					</div>
					
				</div>
				<!-- LEFT COL -->
				
				
				<!-- RIGHT COL -->
				<div class="col">
					
					<div class="row  bg-light text-center " style="height: 60px">
						<div class="col text-end my-auto" id="endLiveChat">
							<!-- <div class="btn btn-dark btn-sm">상담 종료</div> -->
						</div>
					</div>
					
					<!-- 글 상세보기 -->
					<div class="row ps-5 pe-3 pt-5 pb-5  border-left">
						<div class="col" id="">
							<div class="chat-container overflow-y-scroll overflow-x-hidden" style="height:500px;" id="chatMsgContainer">
							
							
							
							
							</div>
						</div>
					</div>
					<!-- 글 상세보기 -->
					
					
					<!-- 채팅 메세지 입력 인풋 -->
					<div id="inputBox">
						<div class="row  bg-light text-center py-3 border-left">
							<div class="col text-end ms-2">
								<textarea id="chatText" placeholder="메시지 보내기" rows="1" cols="20" class="form-control ms-2"></textarea>
							</div>
							<div class="col-2 d-grid">
			    				<button class="send-button btn btn-dark ms-3 px-3" id="sendMsg" onclick="sendMsg()">전송</button>
							</div>
						</div>
					</div>
					<!-- 채팅 메세지 입력 인풋 -->
					
				</div>
				<!-- RIGHT COL -->
				
			</div>
			
			
			
			
			
			
		</div>
		<div class="col"></div>
	</div>
</div>



<%-- 
<div class="row">
	<div class="col">
		${user.nickname}
	</div>
</div>

<div class="row">
	<div class="col">
		<img class="img-fluid" src="/safari/resources/img/user.jpg">
	</div>
</div>
 --%>


	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->





<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

 <script>
 
 
 
// 전역변수 
let liveChatId =  null;
let lastChatMsgId = null;
let intervalHandler = null;
let isChatEnded = null;

let chatMsgScrollTop = -1;




//Enter로 메시지 입력 함수 정의  (shift+enter 일 경우 제외)
function keyUpEvent(e) {
	if (e.key === "Enter" && !e.shiftKey) {
		sendMsg();
	}
}

function enter() {
	// 이벤트 리스너 추가 
	const textareaBox = document.getElementById("chatText");
	textareaBox.addEventListener("keyup", keyUpEvent);
}





// 채팅방 리스트 불러오기 + 처리되지 않은 문의 개수 가져오기 
function getLiveChatList() {
	
	const liveChatListContainer = document.getElementById("liveChatListContainer");
	//const inputBox = document.getElementById("inputBox");
	const chatCountBox = document.getElementById("chatCount");
	
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			// 문의 count 
			chatCountBox.innerHTML = "";
			// chatCountBox.classList.add("orangeBg");
			chatCountBox.innerText = "실시간 문의 : "+response.count+"건";
			
			let index = 0;
			
			liveChatListContainer.innerHTML = "";
			response.list.forEach(function(dto){
				
				const row1Div = document.createElement('div');
				row1Div.classList.add('row', 'py-3', 'border-bottom' );
				row1Div.id = "row-"+dto.id;
				// if(dto.id===liveChatId) row1Div.classList.add('bg-light' );
				row1Div.style.cursor = "pointer";
				if(index==0) {
					// getInquiryDetail(map.qna.id);
				}
				row1Div.addEventListener("click", function() {
					getChatMsg(dto);
				});

				const categoryDiv = document.createElement('div');
				categoryDiv.classList.add('col-2','mx-2','me-3', 'text-secondary');
				categoryDiv.textContent = dto.category;
				
				const col1Div = document.createElement('div');
				col1Div.classList.add('col','ps-4', 'text-truncate');
				col1Div.textContent = dto.chatMsg[0].msg;
				
				
				const circle = document.createElement("div");
				circle.id = "unreadCount-"+dto.id;
				circle.className = "circle col-1";
				if(dto.unreadMsgCount > 0 ) {
					circle.style.backgroundColor = "#F68942";
				}
				// Create the span element for the unread message count
				const countSpan = document.createElement("span");
				countSpan.textContent = dto.unreadMsgCount;
				countSpan.style.fontSize = "13px";
				countSpan.style.display = "flex";
				countSpan.style.justifyContent = "center";
				countSpan.style.alignItems = "center";
				// Append the span element to the circle element
				circle.appendChild(countSpan);
				
				
				const col2Div = document.createElement('div');
				col2Div.classList.add('col-2', 'text-secondary', "text-end", "me-1", "my-auto");
				col2Div.style.fontSize = "13px";
				// const regDate = new Date(map.qna.reg_date);
				col2Div.textContent = dateToTimeDifference(dto.reg_date);
/* 				const regDate = new Date(map.qna.reg_date);
			    const formattedRegDate = regDate.toLocaleDateString('en-US', { month: '2-digit', day: '2-digit', year: 'numeric' });
				col2Div.textContent = formattedRegDate */

				row1Div.appendChild(categoryDiv);
				row1Div.appendChild(col1Div);
				row1Div.appendChild(circle);
				row1Div.appendChild(col2Div);
				liveChatListContainer.appendChild(row1Div);
				
				lastChatMsgId = dto.id;
				index++;
				
			});
			
			
		}
	}
	
	xhr.open("get", "./getLiveChatList");
	xhr.send();	
}
 
 
 
// 몇 시간/분/초 전 
function dateToTimeDifference(date) {

	// 자바스크립트 날짜로 변환 
	const dateFromDatabase = new Date(date);

	// 현재와 시간차 (밀리초)
	const timeDifference = Date.now() - dateFromDatabase.getTime();
	
	// 시/분/초 내림 계산  (integer)
	const seconds = Math.floor(timeDifference / 1000);
	const minutes = Math.floor(seconds / 60);
	const hours = Math.floor(minutes / 60);

	let formattedTime;

	// 시/분/초 중 하나 정해서 표시 
	if (hours >= 1) {
	  formattedTime = `\${hours} 시간 전`;
	} else if (minutes >= 1) {
	  formattedTime = `\${minutes} 분 전`;
	} else {
	  formattedTime = `\${seconds} 초 전`;
	}

	return formattedTime;
	
}
 


// 채팅 메세지 - 상세보기 (채팅방 리스트에서 채팅을 선택했을 때 ) 
function getChatMsg(dto) {

	// 전역변수 저장 
	liveChatId = dto.id;
	isChatEnded = false;
	
	// 메세지 가져오기 
	reloadChatMsg();
	
	// 상담 종료 버튼 만들기 
	const btnBox = document.getElementById("endLiveChat");
	btnBox.innerHTML="";
	const button = document.createElement('div');
	button.classList.add('btn', 'btn-dark', 'btn-sm');
	button.textContent = '상담 종료';
	button.addEventListener('click', endLiveChat);
	btnBox.appendChild(button);

	// 메세지 전송 버튼 활성화 
	const msgBtn = document.getElementById("sendMsg");
	msgBtn.className = "send-button btn btn-dark ms-3 px-3" ;

	
	// 3초마다 채팅 업로드 
	if(intervalHandler != null){
		clearInterval(intervalHandler);
		intervalHandler = null;
	}
	
	intervalHandler = setInterval(() => {
		
		// 리스트 업데이트
		getLiveChatList();
		reloadChatMsg();
		
	}, 3000);
	

	
}




function markAsRead() {
	

	// 읽음 처리 
	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			
			
			
		}
	}

	// get 방식 
	xhr.open("get", "./markMsgAsRead?chatId="+liveChatId);
	xhr.send();
	
	
}








/* 
//채팅 메세지 reload 및 스크롤 위치 유지
function reloadChatMsgAndScroll() {
  // 스크롤 위치 저장
  const chatMsgContainer = document.getElementById("chatMsgContainer");
  chatMsgScrollTop = chatMsgContainer.scrollTop;

  // 채팅 메세지 reload
  reloadChatMsg();
}
 */



// 상담 종료 
function endLiveChat() {
	
	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);

			// Clear right column
			const btnBox = document.getElementById("endLiveChat");
			btnBox.innerHTML="";
			/* const chatMsgContainer = document.getElementById("chatMsgContainer");
			chatMsgContainer.innerHTML = ""; */
			
			// 전역 변수 저장 
			isChatEnded = true;
			
			// 메세지 전송 버튼 disabled 추가 
			const msgBtn = document.getElementById("sendMsg");
			msgBtn.className = "send-button btn btn-dark disabled ms-3 px-3" ;
			
			getLiveChatList();
			reloadChatMsg();
			
		}
	}

	// get 방식 
	xhr.open("get", "./endLiveChatById?chatId="+liveChatId);
	xhr.send();
	
}




// 답변 저장 
function sendMsg() {
	
	const chatInputBox = document.getElementById("chatText");
	const chatText = chatInputBox.value.trim();
	
	if(!chatText) {
		chatInputBox.focus();
		return;
	}
	
	if(isChatEnded){
		return;
	}
	
	
	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			chatInputBox.value="";
			// 새로고침 
			reloadChatMsg();
			
		}
	}

	// post 방식 
	xhr.open("post", "./saveChatMsg");
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.send("chat_id="+liveChatId+"&msg="+chatText);
	
}




//채팅 메세지 reload 
function reloadChatMsg() {
	
	// 스크롤 위치 저장
	const chatMsgContainer = document.getElementById("chatMsgContainer");
	const isScrolledToBottom = chatMsgContainer.scrollHeight - chatMsgContainer.clientHeight <= chatMsgContainer.scrollTop + 10;
	
	// 스크롤 위치 저장
	if(chatMsgScrollTop != 1) chatMsgScrollTop = chatMsgContainer.scrollTop;
	
	
	
	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			// 읽음 처리 
			markAsRead();
			
			// GET MESSAGES BY CHAT ID 
			const chatMsgContainer = document.getElementById("chatMsgContainer");
			// 초기화 
			chatMsgContainer.innerHTML = "";
			
			// 메세지 생성 
			response.list.forEach(function(msg){
				
				const row1 = document.createElement('div');
				  row1.classList.add('row', 'mt-1','py-1');
				  
				  // 내가 보낸 메세지 
				  if( msg.sender === 0 ){
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
					  
					  chatMsgContainer.appendChild(row1);
				  }else {
					  const colIcon = document.createElement('div');
					  colIcon.classList.add('col-auto', 'my-auto', 'ms-2', 'text-left');
					  
					  /* const outerDiv1 = document.createElement('div');
					  outerDiv1.className = 'row';
					  const innerDiv1 = document.createElement('div');
					  innerDiv1.className = 'col text-secondary ps-1';
					  innerDiv1.style.fontSize = "14px";
					  innerDiv1.innerText = response.user.nickname;
					  outerDiv1.appendChild(innerDiv1); */
					   
					  const outerDiv2 = document.createElement('div');
					  outerDiv2.className = 'row my-auto';
					  const innerDiv2 = document.createElement('div');
					  innerDiv2.className = 'col text-start ps-1 pt-1';
					  const imageElement = document.createElement('img');
					  imageElement.className = 'img-fluid rounded-circle';
					  imageElement.style.filter = "grayscale(1)";
					  if(response.user.profile_img_link === null) {
						  imageElement.src = '/safari/resources/img/user.jpg';
					  } else {
						  imageElement.src = '/safariImg/'+response.user.profile_img_link;
					  }
					  imageElement.style.width = '46px';
					  imageElement.style.height = '46px';
					  innerDiv2.appendChild(imageElement);
					  outerDiv2.appendChild(innerDiv2);
					  
					  colIcon.appendChild(outerDiv2);
					  /* colIcon.appendChild(outerDiv1); */
					  
					  /* const icon = document.createElement('i');
					  icon.classList.add('bi', 'bi-person-circle', 'fs-4');
					  colIcon.style.lineHeight = 1;
					  colIcon.appendChild(icon); */
					  
					  
					  // 메세지 
					  const colOuterDiv = document.createElement('div');
					  colOuterDiv.classList.add('col');
						  const rowInnerDiv1 = document.createElement('div');
						  rowInnerDiv1.classList.add('row');
						  const innerDiv1 = document.createElement('div');
						  innerDiv1.className = 'col text-secondary';
						  innerDiv1.style.fontSize = "14px";
						  innerDiv1.innerText = response.user.nickname;
						  rowInnerDiv1.appendChild(innerDiv1);
						  
						  const rowInnerDiv2 = document.createElement('div');
						  rowInnerDiv2.classList.add('row');
						  const col3 = document.createElement('div');
						  col3.classList.add('col-7', 'ms-2', 'text-left', 'text-break', 'otherContent');
						  col3.innerText = msg.msg;
						  rowInnerDiv2.appendChild(col3);
						  
					 
						  
					  
					  /* const col3 = document.createElement('div');
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
					  /* if(msg.is_read == 0){
						  col4row1.innerText = '1';
					  }else{ // 읽음 
						  col4row1.innerText = ' ';
					  } */
					  
					  row1.appendChild(colIcon);
					  row1.appendChild(colOuterDiv);
					  //row1.appendChild(col4);
					  //col4.appendChild(col4row1);
					  //col4.appendChild(col4row2);
					  
					  chatMsgContainer.appendChild(row1);
				  }
				
			});
			
			// 전역변수 저장 
			isChatEnded = response.isChatEnded;
			
			// 만약 채팅 상담이 종료 되었을 경우 
			if(response.isChatEnded) {
				
				// 상담이 종료되었습니다. 
				const rowEndDiv = document.createElement('div');
				rowEndDiv.classList.add('row','py-2');
				const colEndDiv = document.createElement('div');
				colEndDiv.classList.add('col', 'text-secondary', 'text-center');
				colEndDiv.textContent = '상담이 종료되었습니다';
				rowEndDiv.appendChild(colEndDiv);
				chatMsgContainer.appendChild(rowEndDiv);
				
			}
			
			
			// 스크롤 위치 복원
			if (isScrolledToBottom) {
				chatMsgContainer.scrollTop = chatMsgContainer.scrollHeight;
			} else if (chatMsgScrollTop === -1) {
				chatMsgContainer.scrollTop = chatMsgContainer.scrollHeight;
			} else {
				chatMsgContainer.scrollTop = chatMsgScrollTop
			}
			//chatMsgContainer.scrollTop = chatMsgContainer.scrollHeight;
			
			
			
		}
	}

	// get 방식 
	xhr.open("get", "./reloadChatMsgByChatId?chatId="+liveChatId);
	xhr.send();

}




 
 

window.addEventListener("DOMContentLoaded",function(){
	getLiveChatList();
	enter();
	
	// setInterval(getLiveChatList, 3000);	// 3초마다 실행

});
 
 
 
</script>
 

</body>
</html>