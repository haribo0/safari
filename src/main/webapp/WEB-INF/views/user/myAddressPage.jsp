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
	
	<!-- 마이페이지 상단 블럭 -->
	<jsp:include page="../common/myPageTop.jsp"></jsp:include>
	<!-- 마이페이지 상단 블럭 -->

	<div class="container d-flex mt-5 px-0">
		<div class="row w-100">
		<!-- 마이페이지 nav -->
		<jsp:include page="../common/myPageNav.jsp"></jsp:include>
		<!-- 마이페이지 nav -->
			
		<div class="col ms-4">
			<div class="row" style="border-bottom: 2px solid #222; height: 48px;">
				<div class="col p-0">
					<h5>배송지 관리</h5>						
				</div>
			</div>
			
			<div class="row mt-3">
				<p class="me-5">${sessionUser.nickname }님의 배송 주소 리스트: </p>
				<ul class="list-group list_addr_box">
				</ul>
			</div>
			<div class="row mt-3">
				<p class="me-5">배송지추가: </p> 
				<p> 
					<input type="text"  id="usr_address" name="prd_address" placeholder="주소입력" class="form-control ms-3" style="width: 400px;"/> <button onclick="searchAddr()" class="btn btn-secondary mt-2 ms-3">주소찾기</button>
				</p>
				<p><button class="btn btn-dark ms-2" onclick="addMyAddr()">추가</button></p>
			</div>
		</div>
	</div>
	</div>
	
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

<script>
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



//주소 리스트 불러오기
	function getMyaddressList() {
		let inputAddr = document.querySelector("#usr_address")
		let listAddrBox = document.querySelector('.list_addr_box')
		const item = document.querySelector('.list-group-item')
		const xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				const response = JSON.parse(xhr.responseText);
				inputAddr.value = ''
				listAddrBox.textContent=''
				for(data of response.addressList) {
					let li = document.createElement('li')
					li.classList.add("list-group-item")
					li.innerText = data.address
					listAddrBox.appendChild(li)
				}
			}
		}
		
		xhr.open("get", "./getUserAddress");
		xhr.send();	
	}

window.addEventListener("DOMContentLoaded", function(){
	getSessionId()
	getMyaddressList()
});
</script>
</body>	
</html>