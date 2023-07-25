<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/safari/resources/style/auction.css" type="text/css">
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
.orangeButton:hover{
	background: #FF812C;
	font-weight: bold;
	color: white;
}

</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
			
			
			
			<div class="row mt-2">
				<div class="col">
					
					<div class="row text-center fw-medium border-bottom border-black border-2 py-2">
						<!-- <div class="col">기본 배송지</div> -->
						<div class="col">배송지명</div>
						<div class="col-5">주소</div>
						<div class="col">연락처</div>
						<div class="col">관리</div>
					</div>
					
					<div class="row text-center">
						<div class="col" id="userAddrRow">
						
						
						
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
     	 <div class="row mb-0">
      			<div class="col ms-4 fs-5 fw-bold">배송지 등록</div>
      		</div>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
      	
      	<div class="row text-center fw-bold fs-5">
    		
       </div>
       
       <div class="row mt-3">
       		<div class="col"></div>
       			<div class="col-11">
		       		
		       		<table class="table" style="border-top: 1px solid #E2E3E5;">
		       			<tr>
		       				<td class="table table-light align-middle text-center " style="width: 150px;">배송지명</td>
		       				<td class="align-middle"> 
		       					<div class="row">
		       						<div class="col">
		       							 <input type="text" class="form-control ms-2" style="width: 200px; height: 30px;"
		       							 id="address_name" > 
		       							
		       						</div>
		       					</div>
		       				</td>
		       			</tr>	
		       			<tr>
							<td class="table table-light align-middle text-center" style="width: 150px;">연락처</td>
		       				<td class="align-middle">
		       					  <div class="row">
				                    <div class="col">
				                       <input type="text" class="form-control ms-2" oninput="oninputPhone(this)" maxlength="14" id="phone"
				                      style="width: 200px; height: 30px;">
				                    </div>
				                  </div>
		       				</td>		       				
		       			</tr>
						<tr>
							<td class="table table-light align-middle text-center" style="width: 150px;">주소</td>
		       				<td>
		       					<div class="row mt-1">
		       						<div class="col-auto">
		       							<input type="text" class="form-control ms-2" id="postcode" style="width: 150px; height: 30px;">
		       						</div>
		       						<div class="col">
		       							<input type="button" class="btn btn-sm btn-outline-secondary" value="우편번호 찾기"
		       							onclick="daumPost()" > 
		       						</div>
		       					</div>
		       					
		       					<div class="row mt-2">
		       						<div class="col">
		       							<input type="text" id="address" class="form-control ms-2" style= "height: 50px;">
		       						</div>
		       					</div>
		       					
		       					<div class="row mt-2">
		       						<div class="col">
		       							<input type="text" id="detail_address" class="form-control ms-2" style="height: 30px;">
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
      	<input type="button" class="btn orangeButton" value="등록하기" onclick="addUserAddress()">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창닫기</button>
      </div>      
   
    </div>
  </div>
</div>
</div>
<%-- 주소 등록 modal --%>


<%-- 주소 수정 modal --%>
<div class="modal" id="modifyAddrModal"  data-id="" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered"> 
    <div class="modal-content">
      <div class="modal-header">
      		<div class="row mb-0">
      			<div class="col ms-4 fs-5 fw-bold">배송지 수정</div>
      		</div>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
      	
      	<div class="row text-center fw-bold fs-5">
    		<div class="col"></div>
       </div>
       
       <div class="row mt-3">
       		<div class="col"></div>
       			<div class="col-11">
		       		
		       		<table class="table" style="border-top: 1px solid #E2E3E5;">
		       			<tr>
		       				<td class="table table-light align-middle text-center " style="width: 150px;">배송지명</td>
		       				<td class="align-middle"> 
		       					<div class="row">
		       						<div class="col">
		       							 <input type="text" class="form-control ms-2" style="width: 200px; height: 30px;"
		       							 id="address_name" > 
		       							
		       						</div>
		       					</div>
		       				</td>
		       			</tr>	
		       			<tr>
							<td class="table table-light align-middle text-center" style="width: 150px;">연락처</td>
		       				<td class="align-middle">
		       					  <div class="row">
				                    <div class="col">
				                      <input type="text" class="form-control ms-2" oninput="oninputPhone(this)" maxlength="14" id="original_phone"
				                      style="width: 200px; height: 30px;">
				                    </div>
				                  </div>
		       				</td>		       				
		       			</tr>
						<tr>
							<td class="table table-light align-middle text-center" style="width: 150px;">주소</td>
		       				<td>
		       					<div class="row mt-1">
		       						<div class="col-auto">
		       							<input type="text" class="form-control ms-2" id="original_postcode" style="width: 150px; height: 30px;">
		       						</div>
		       						<div class="col">
		       							<input type="button" class="btn btn-sm btn-outline-secondary" value="우편번호"
		       							onclick="daumPost()"> 
		       						</div>
		       					</div>
		       					
		       					<div class="row mt-2">
		       						<div class="col">
		       							<input type="text" id="original_address" class="form-control ms-2" style= "height: 50px;">
		       						</div>
		       					</div>
		       					
		       					<div class="row mt-2">
		       						<div class="col">
		       							<input type="text" id="original_detail_address" class="form-control ms-2" style="height: 30px;">
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
      	<input type="button" class="btn orangeButton" value="등록하기" onclick="modifyUserAddress()">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창닫기</button>
      </div>      
   
    </div>
  </div>
</div>
</div>
<%-- 주소 수정 modal --%>


<%-- 주소 등록 alert --%>
<div class="modal" id="addrValidateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered"> 
    <div class="modal-content">
      <div class="modal-header">
      	
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
      	
      	<div class="row text-center">
    		<div class="col" id="validateContent"> </div>
       </div>
  
      </div>
      
      <div class="modal-footer">
      	
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창닫기</button>
      </div>      
   
    </div>
  </div>
</div>
<%-- 주소 등록 alert --%>


<%-- 주소 삭제 alert --%>
<div class="modal" id="removeAddrModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered"> 
    <div class="modal-content">
      <div class="modal-header">
      		<h5 class="modal-title">주소 삭제</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
      	
      	<div class="row text-center">
    		<div class="col"> 
    			선택한 배송지를 삭제하시겠습니까?
    		</div>
       </div>
  
      </div>
      
      <div class="modal-footer">
      	<input type="button" class="btn orangeButton" value="확인" onclick="removeUserAddress()">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>      
   
    </div>
  </div>
</div>
<%-- 주소 삭제 alert --%>




<script>

let selectedAddressId = null;


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

// 다음 주소 api
function daumPost(){
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
            
            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById('address').value = addr;
            document.getElementById('detail_address').focus();
        }
    }).open();
}


// 주소 등록 모달 열기
function registerAddrPage() {
	
	const registerAddrModal = bootstrap.Modal.getOrCreateInstance("#registerAddrModal");
	
	registerAddrModal.show();
}


//주소 수정 모달 열기
function modifyAddrPage(id) {
	
	const xhr = new XMLHttpRequest();	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
	
	
			const modifyAddrModal = bootstrap.Modal.getOrCreateInstance("#modifyAddrModal");
			modifyAddrModal._element.dataset.id = id; // id 값을 data-id 속성에 설정
			modifyAddrModal.show();
		}
	}
	xhr.open("get", "/safari/user/getAddressInfoByPk?id=" +id);
	xhr.send();	
	
}

// 전화번호 형식 변경 함수
function oninputPhone(target) {
    target.value = target.value
        .replace(/[^0-9]/g, '')
        .replace(/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
}

// 주소 등록
function addUserAddress() {
	
	const address_name = document.getElementById("address_name");
	const phone = document.getElementById("phone");
	const postcode = document.getElementById("postcode");
	const address = document.getElementById("address");
	const detail_address = document.getElementById("detail_address");
	
	if (address_name.value == "" || phone.value == "" || address.value == "") {
		
		const content = document.getElementById("validateContent");
		content.innerHTML = "";
		
		const validateModal = bootstrap.Modal.getOrCreateInstance("#addrValidateModal");
		if (address_name.value == "") {
			content.innerText = "배송지명을 입력하세요";
		} else if (phone.value == "") {
			content.innerText = "연락처를 입력하세요";
		} else if (address.value == "") {
			content.innerText = "주소를 입력하세요";
		}
		
		validateModal.show();
		
		setTimeout(function() {
			validateModal.hide();
		}, 1000);
		
		return;
	}
	
	
	
	const xhr = new XMLHttpRequest();	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			const registerAddrModal = bootstrap.Modal.getOrCreateInstance("#registerAddrModal");
			registerAddrModal.hide();
			
			address_name.value = "";
			phone.value = "";
			postcode.value = "";
			address.value = "";
			detail_address.value ="";
			
			getMyaddressList();
			
		}
	}
	xhr.open("post", "/safari/user/addUserAddress");
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
	xhr.send("address_name=" + address_name.value + "&phone=" + phone.value + "&address=" + address.value + "  " + detail_address.value);	
}

// 주소 수정
function modifyUserAddress(id) {
	
	const address_name = document.getElementById("original_address_name");
	const phone = document.getElementById("original_phone");
	const postcode = document.getElementById("original_postcode");
	const address = document.getElementById("original_address");
	const detail_address = document.getElementById("original_detail_address");
	
	if (address_name.value == "" || phone.value == "" || address.value == "") {
		
		const content = document.getElementById("validateContent");
		content.innerHTML = "";
		
		const validateModal = bootstrap.Modal.getOrCreateInstance("#addrValidateModal");
		if (address_name.value == "") {
			content.innerText = "배송지명을 입력하세요";
		} else if (phone.value == "") {
			content.innerText = "연락처를 입력하세요";
		} else if (address.value == "") {
			content.innerText = "주소를 입력하세요";
		}
		
		validateModal.show();
		
		setTimeout(function() {
			validateModal.hide();
		}, 1000);
		
		return;
	}
	
	
	
	const xhr = new XMLHttpRequest();	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			const modifyAddrModal = bootstrap.Modal.getOrCreateInstance("#modifyAddrModal");
			modifyAddrModal.hide();
			
			address_name.value = "";
			phone.value = "";
			postcode.value = "";
			address.value = "";
			detail_address.value ="";
			
			getMyaddressList();
		}
	}
			
	xhr.open("post", "/safari/user/modifyUserAddress");
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
	xhr.send("address_name=" + address_name.value + "&phone=" + phone.value + "&address=" + address.value +
			  " " + detail_address.value + "&id=" + id);
	
	
}


//주소 리스트 불러오기
function getMyaddressList() {
	
	const xhr = new XMLHttpRequest();	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			const addrBox = document.querySelector("#userAddrRow");
			addrBox.innerHTML = "";
			
			if (response.addressCount == 0) {
				 
            	const row = document.createElement("div");
            	row.classList.add("row", "border-bottom",  'py-2');
            	
            	const col = document.createElement("div");
            	col.classList.add("col", "text-center");
            	col.setAttribute("colspan", "4");
            	col.innerText = "등록된 배송지가 없습니다.";
            	
            	row.appendChild(col);
     
            	addrBox.appendChild(row);
   
				
			}
			
			else {
			for (data of response.addressList) {
			
				const row = document.createElement("div");
				row.classList.add("row", "border-bottom", "py-2");
	
				// 배송지명
				const adNameCol = document.createElement("div");
				adNameCol.classList.add("col");
				
				const adNameRow = document.createElement("div");
				adNameRow.classList.add("row");
				
				const adCol = document.createElement("div");
				adCol.classList.add("col");
				adCol.style.fontSize = "18px";
				adCol.innerText = data.address_name; 
				
				adNameRow.appendChild(adCol);
				adNameCol.appendChild(adNameRow);
				
				row.appendChild(adNameCol);
				// 배송지명
				
				// 주소
				const addrCol = document.createElement("div");
				addrCol.classList.add("col-5");
				
				const addrRow = document.createElement("div");
				addrRow.classList.add("row");
				
				const aCol = document.createElement("div");
				aCol.classList.add("col");
				aCol.style.fontSize = "16px";
				aCol.innerText = data.address;
				
				addrRow.appendChild(aCol);
				addrCol.appendChild(addrRow);
				
				row.appendChild(addrCol);
				// 주소
				
				
				// 연락처
				const phoneCol = document.createElement("div");
				phoneCol.classList.add("col");
				
				const phoneRow = document.createElement("div");
				phoneRow.classList.add("row");
				
				const pCol = document.createElement("div");
				pCol.classList.add("col");
				pCol.style.fontSize = "18px";
				pCol.innerText = data.phone;
				
				phoneRow.appendChild(pCol);
				phoneCol.appendChild(phoneRow);
				
				row.appendChild(phoneCol);
				// 받는 사람
				
				// 관리
				const manageCol = document.createElement("div");
				manageCol.classList.add("col");
				
				const manageRow = document.createElement("div");
				manageRow.classList.add("row");
				
				
				const mCol = document.createElement("div");
				mCol.classList.add("col");
				
				const modifyButton = document.createElement("i");
				modifyButton.classList.add("bi", "bi-pencil-square", "fs-5", "text-secondary");
				modifyButton.style.cursor = "pointer";
				
				modifyButton.onclick = function (id) {
  	                return function () {
  	                	modifyAddrPage(id);
  	                };
  	              }(data.id);
				
				
				// onclick 이벤트 적기
				
				const deleteButton = document.createElement("i");
				deleteButton.classList.add("bi", "bi-trash3", "ms-4", "fs-5", "text-secondary");
				deleteButton.style.cursor = "pointer";
				
				deleteButton.onclick = function (id)  {
  	                return function () {
  	                	removeAddrPage(id);
  	                };
  	              }(data.id);
					
				
				// onclick 이벤트 적기
				
				mCol.appendChild(modifyButton)
				mCol.appendChild(deleteButton);
				

				manageRow.appendChild(mCol);
				manageCol.appendChild(manageRow);
				row.appendChild(manageCol);
				
				// 관리
				
				addrBox.appendChild(row);
			}
		  }
		}
	}
	
	xhr.open("get", "/safari/user/getUserAddress");
	xhr.send();	
}

// 주소 삭제 물어보는 모달
function removeAddrPage(id) {
	
	 selectedAddressId = id;
	 
	const removeAddrModal = bootstrap.Modal.getOrCreateInstance("#removeAddrModal");
	
	removeAddrModal.show();
}

// 주소 삭제
function removeUserAddress() {
	
	const id = selectedAddressId;
	console.log(id);
	
	const xhr = new XMLHttpRequest();	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			selectedAddressId = null;
			 
			const removeAddrModal = bootstrap.Modal.getOrCreateInstance("#removeAddrModal");
			removeAddrModal.hide();
			
			getMyaddressList();
			
		}
	}
	xhr.open("get", "/safari/user/removeUserAddress?id=" + id);
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
	getSessionId();
	getMyaddressList();
});
</script>
</body>	
</html>