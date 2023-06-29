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
		<div class="container mt-4 ps-0">
			<h3 class="fs-3 mb-3">${sessionUser.nickname }님의 채팅방 목록</h3>
		</div>
		 	<c:forEach items="${list }" var="map">
		 		<div class="row align-items-center" onclick="modalOn(${map.productRequestDto.id},${map.userDto.id })">
		 			<div class="col-1 pe-0"><i class="bi bi-person-circle fs-3"></i></div>
		 			<div class="col-1 w-0 ms-0">${map.userDto.nickname }</div>
		 			<div class="col-1"><img alt="사진" src="/safarifile/${map.productImgDto.product_img_link}" width="50" height="50"></div>
		 			<div class="col ms-0 p-0">${map.productDto.title }</div>
		 			<div class="col-2">${map.productRequestDto.reg_date }</div>
		 			<div class="col-5"></div>
		 		</div>
		 </c:forEach>
	</div>
</div>
	
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->
	
		<!-- 채팅창 모달 -->
	<div class="modal" id="chatModal" tabindex="-1">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">채팅</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
			<div class="chat-container" id="getChat">
				<div class="row">
					<div class="col">
					</div>
					<div class="col-8">
					</div>
				</div>
			</div>
	      </div>
	      <div class="modal-footer">
	        <textarea id="chatContent" placeholder="메시지 보내기" cols="47" rows="1" class="ms-3"></textarea>
			    <button class="send-button me-0" id="insertContent">전송</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 채팅창 모달 -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<script>

	// 모달 열기 
	function  modalOn(requestId, receiverId) {
		const myModal = bootstrap.Modal.getOrCreateInstance('#chatModal');
		// 열 때
		myModal.show();
		
		// 전송버튼 id=insertContent
		const insertBox = document.getElementById("insertContent");
		// 메시지 textarea id = chatContent
		const inputField = document.getElementById("chatContent");
		// Textarea에서 Enter 칠 때 
		  inputField.addEventListener("keyup", function(event) {
		    if (event.key === "Enter") {
		    	// 다른 성능 막는 것 
		    	event.preventDefault();
		    	insertContent(requestId, receiverId);
		    }
		  });
		
		// 전송버튼 누르면 해당 메소드 불러오기 
		insertBox.setAttribute("onclick", "insertContent("+requestId+","+receiverId+")")
		
	}
	
	function insertContent(requestId, receiverId) {
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
	            reloadChatList();
	        }
	    }
	    //post
		xhr.open("post", "./insertProductChatDto");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("purchase_request_id="+requestId+"&receiver_id="+receiverId+"&content="+content);
		/* xhr.send(`requestId=\${requestId}&receiverId=\${receiverId}`); */
		
	}
	
	function dd(e) {
		
		const myModal = bootstrap.Modal.getOrCreateInstance('#chatModal');
		
		// 닫을 때
	       myModal.hide();

	}


	
function reloadChatList() {
    const getChatbox = document.getElementById("getChat");

    const xhr = new XMLHttpRequest();

    xhr.onreadystatechange = function(){
        if(xhr.readyState == 4 && xhr.status == 200){
            const response = JSON.parse(xhr.responseText);
            getChatbox.innerHTML = "";

            // 동네 옵션에 따른 추가 
            let defaultOption = document.createElement("option");
            defaultOption.value = "0";
            defaultOption.selected = true;
            defaultOption.textContent = "동네를 선택하세요";
            townBox.appendChild(defaultOption);

            response.getTownList.forEach(function(data) {
                const option = document.createElement("option");
                option.value = data.id;
                option.textContent = data.product_town_name;
                townBox.appendChild(option);
            });
        }
    }

    xhr.open("get", "./getTownList?cityId="+cityId);
    xhr.send();
}
	
	
</script>
</body>	
</html>