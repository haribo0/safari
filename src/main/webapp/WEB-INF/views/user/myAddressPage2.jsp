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
<style>
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
			
			<div class="row mt-4">
				<div class="col fw-bold fs-5">
					${sessionUser.nickname}님의 배송 주소 목록
				</div>
			</div>
			
			<div class="row mt-4">
				<div class="col">
					* 배송지는 최대 <span style="color: #ff6f0f;" class="fw-bold">5개</span>까지 등록 가능합니다.
				</div>
			</div>
			
			<div class="row mt-2">
				<div class="col">
					
					<div class="row text-center fw-medium border-bottom border-black border-2 py-2">
						<div class="col">받는사람</div>
						<div class="col-5">주소</div>
						<div class="col">연락처</div>
						<div class="col">관리</div>
					</div>
					
					<div class="row border-bottom py-2 text-center">
						<div class="col">
							<div class="row mt-4">
								<div class="col" style="font-size: 18px;">
									${sessionUser.nickname}
								</div>
							</div>
						</div>
						<div class="col-5"></div>
						<div class="col">
							<div class="row mt-4">
								<div class="col" style="font-size: 18px;">
									${sessionUser.phone}
								</div>
							</div>
						</div>
						<div class="col">
							<div class="row text-center">
								<div class="col"></div>
								<div class="col-9">
									<input type="button" class="btn btn-outline-secondary" value="기본 배송지 설정">
								</div>
								<div class="col"></div>
							</div>
							<div class="row mt-1">
								<div class="col ms-4">
									<input type="button" class="btn btn-outline-secondary" value="수정">
								</div>
								<div class="col" style="position: relative; right: 28px;">
									<input type="button" class="btn btn-outline-secondary" value="삭제">
								</div>								
							</div>
						</div>
					
					</div>
					
					
				</div>
			</div>
			
			
			<div class="row mt-4 text-center">
				<div class="col">
					<input type="button" class="btn btn-lg orangeButton" value="배송지 등록"
					onclick="registerAddrPage()">
				</div>
			</div>
			
			
			
			
			<%-- <div class="row mt-3">
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
			</div> --%>
		</div>
	</div>
	</div>
	
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

<%-- 주소 등록 modal --%>
<div class="modal" id="registerAddrModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered"> 
    <div class="modal-content">
      <div class="modal-header">
      	
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
      	
      	<div class="row text-center fw-bold fs-5">
    		<div class="col">배송지 등록</div>
       </div>
       
       <div class="row mt-3">
       		<div class="col"></div>
       			<div class="col-11">
		       		
		       		<table class="table" style="border-top: 1px solid #E2E3E5;">
		       			<tr>
		       				<td class="table table-secondary align-middle text-center" style="width: 150px;">받는분</td>
		       				<td class="align-middle"> 
		       					<div class="row">
		       						<div class="col">
		       							<!-- <input type="text" class="form-control ms-2" style="width: 300px; height: 30px;"> -->
		       							<span class="ms-2">${sessionUser.nickname}</span>
		       						</div>
		       					</div>
		       				</td>
		       			</tr>	
		       			<tr>
							<td class="table table-secondary align-middle text-center" style="width: 150px;">연락처</td>
		       				<td class="align-middle">
		       					<div class="row">
		       						<div class="col">
		       							<!-- <input type="text" class="form-control ms-2" style="width: 300px; height: 30px;"> -->
		       							<span class="ms-2">${sessionUser.phone}</span>
		       						</div>
		       					</div>
		       				</td>		       				
		       			</tr>
						<tr>
							<td class="table table-secondary align-middle text-center" style="width: 150px;">주소</td>
		       				<td>
		       					<div class="row mt-1">
		       						<div class="col-auto">
		       							<input type="text" class="form-control ms-2" style="width: 150px; height: 30px;">
		       						</div>
		       						<div class="col">
		       							<input type="button" class="btn btn-sm btn-outline-secondary" value="우편번호"> 
		       						</div>
		       					</div>
		       					
		       					<div class="row mt-2">
		       						<div class="col">
		       							<input type="text" class="form-control ms-2" style= "height: 50px;">
		       						</div>
		       					</div>
		       					
		       					<div class="row mt-2">
		       						<div class="col">
		       							<input type="text" class="form-control ms-2" style="height: 30px;">
		       						</div>
		       					</div>
		       				</td>		       				
		       			</tr>		       			
		       		</table>
		       
		  
		      </div>
     	    <div class="col"></div>
      </div>
      
      <div class="row mt-4">
      	<div class="col"></div>
      </div>
      
      <div class="modal-footer">
      	<input type="button" class="btn orangeButton" value="등록하기" onclick="">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창닫기</button>
      </div>      
   
    </div>
  </div>
</div>
<%-- 주소 등록 modal --%>



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


// 주소 등록 모달 열기
function registerAddrPage() {
	
	const registerAddrModal = bootstrap.Modal.getOrCreateInstance("#registerAddrModal");
	registerAddrModal.show();
}

// 주소 등록
function addUserAddress() {
	
	const xhr = new XMLHttpRequest();	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			
			
		}
	}
	xhr.open("get", "/safari/user/addUserAddress");
	xhr.send();	
}


//주소 리스트 불러오기
function getMyaddressList() {
	
	const xhr = new XMLHttpRequest();	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			
			
			
		}
	}
	
	xhr.open("get", "/safari/user/getUserAddress");
	xhr.send();	
}


	/* function getMyaddressList() {
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
	} */

window.addEventListener("DOMContentLoaded", function(){
	getSessionId()
	getMyaddressList()
});
</script>
</body>	
</html>