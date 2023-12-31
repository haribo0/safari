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
	      <div class="modal-header">
	      	<p class="row" style="clear: both;">사진</p>
	      	<div class="row">
	      		<div class="col btn btn-outline-secondary text-dark me-3 ms-2">예약하기</div>
	      		<div class="col btn btn-outline-secondary text-dark me-3">약속잡기</div>
	      		<div class="col btn btn-outline-secondary text-dark">송금하기</div>
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<script>
	let mySessionId = null;
	let requestId2 = null;
	let receiverId2 = null;
	
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
	  			  console.log("data.productRequestDto.id",data.productRequestDto.id)
	  			  console.log("data.userDto.id",data.userDto.id)
	  			  console.log("data.content",data.chatContent)
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
	  			  row1col1.className = 'col-1 p-0 fw-bold fs-4';
	  			  row1col1.textContent = data.userDto.nickname;
	  			
	  			  const row1col2 = document.createElement('div');
	  			  row1col2.className = 'col-3 text-secondary';
	  			  row1col2.textContent = data.productTownDto.product_town_name;
	  			  
	  			  const row1col3 = document.createElement('div');
	  			  row1col3.className = 'col text-secondary';
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
		  			  else if (yesterday === chatDate.toDateString()) {
		  				row1col3.textContent = '어제';
		  			  }
	
		  			  // 그 외의 경우
		  			  else{
		  				 const month = chatDate.getMonth() + 1;
						  const day = chatDate.getDate();
						  row1col3.textContent = month+"월 "+ day+"일";  
		  			  }
	  				  
	  				  
	  				 /* row1col3.textContent = data.lastChatDate; */
	  			  }
	  			  
	  			  
	  			  const row2 = document.createElement('div');
	  			  row2.className = 'row';
	  			  if(data.chatContent==null || data.chatContent===''){
	  				row2.textContent = ' ';
	  				row2.className = 'mt-3'
	  			  }else{
	  				row2.textContent = data.chatContent;
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
		
		console.log("requestId"+requestId);
		console.log("receiverId"+receiverId);
		const modalTitleBox = document.getElementById("modalTitle");
		modalTitleBox.innerText = userNickname2;
		
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
		sendBox.setAttribute("onclick", "insertContent("+requestId+","+receiverId+")")
		
		// 3초마다 채팅 업로드 
		if(intervalHandler != null){
			clearInterval(intervalHandler);
			intervalHandler = null;
		}
		
		intervalHandler = setInterval(() => {
			reloadChatList(requestId);
		}, 3000);
		
		
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
	

// 채팅 내용 리스트 리로딩 
function reloadChatList(requestId) {
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
				  console.log(yearMonthDay);
				  console.log(formattedDateHappen);
				  
				  if(yearMonthDay != formattedDateHappen){
					  const yearMonthDayRow = document.createElement('div');
					  yearMonthDayRow.classList.add('row', 'justify-content-center', 'mt-4');
					  yearMonthDayRow.innerText = formattedDateHappen;
					  getChatbox.appendChild(yearMonthDayRow);
					  yearMonthDay = formattedDateHappen;
				  }
				
				  const row1 = document.createElement('div');
				  row1.classList.add('row', 'mt-1');
				  
				  if(mySessionId!=data.receiver_id){
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
				  }else {
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

//modal 닫을 때
function modalHide(e) {
	const myModal = bootstrap.Modal.getOrCreateInstance('#chatModal');
       myModal.hide();
}
	
window.addEventListener("DOMContentLoaded", function() {
	//사실상 시작 시점...
	reloadChatRoomList();
	
	
	
	
});	
</script>
</body>	
</html>