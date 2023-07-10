<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사파리 | 대여메인</title>
<!-- 메타 섹션 -->
<jsp:include page="../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->

<style type="text/css">

.returnTab{
	color: #F68942;
}

</style>

</head>
<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../common/headerB.jsp"></jsp:include>
	<!-- 헤더 섹션 -->

	<div class="container-fluid main_box">
		<div class="row">
		
		
			<div class="col-2" style=""></div>
			<div class="col-2 bg-dark h-100" style="position: fixed;">
			<div class="list-group list-group-flush">
					
					<!-- 왼쪽 카테고리 리스트 -->
					<jsp:include page="../common/navLeft.jsp"></jsp:include>
					<!-- 왼쪽 카테고리 리스트 -->
					
				</div>
				
				<div class="row mt-5 mb-5">
					<div class="col"> </div>
				</div>
			
			</div>
			
			
			
			
			
			<div class="col mt-5 container ms-4" id="listContainer">
			
    			<h4 class="ps-4 mt-3 mb-4 fw-regular">반품 관리</h4>

				<div class="row mt-5 ms-4 fw-medium">
					반품 수취 확인
				</div>
				
				
				<div class="row mt-4 mb-3 fw-medium">
					<div class="col text-center">
						#
					</div> 
					<div class="col-1 text-center">
						사진
					</div>
					<div class="col-3 text-center">
						상품
					</div>
					<div class="col-2 text-center">
						연락처
					</div>
					<div class="col-2 text-center">
						주소
					</div>
					<div class="col text-center">
						반납신청
					</div>
					<div class="col text-center">
						상태
					</div>
				</div>
				
				<hr class="border ms-2 border-black border-1 opacity-100">

				
				
				<div class="" id="listBox">
					




					
				</div>
					

				<div class="row ms-4 mt-5 mb-2 fw-medium">
					반품 정산 
				</div>

				
				<div class="row mt-4 mb-3 fw-medium">
					<div class="col text-center">
						#
					</div>
					<div class="col text-center">
						사진
					</div>
					<div class="col-3 text-center">
						상품
					</div>
					<div class="col-2 text-center">
						연락처
					</div>
					<div class="col-2 text-center">
						주소
					</div>
					<div class="col text-center">
						반납신청
					</div>
					<div class="col text-center">
						상태
					</div>
				</div>
				
				<hr class="border ms-2 border-black border-1 opacity-100">

				
				
				<div class="" id="listBox2">
					




					
				</div>
					
			</div>
				
				<!-- <hr class="border border-1 opacity-50"> -->
					
				
				
				
				<div class="col-1 "></div>
			
			</div>
			
			
		
			
		</div>
	
	
	<!-- Modal -->
			<div class="modal fade" id="checkModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h1 class="modal-title fs-5" id="exampleModalLabel"> 반납 확인 및 정산 </h1>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			       	<div class="row mt-3">
			       		 <div class="col"></div>
			       		 <div class="col-10">
			       		 	
			       		 	 <div class="row">
					        	<div class="col fw-medium">
									상품정보
					       		</div>
					        </div>
					        				        
					        <div class="row mt-3">
					        	<div class="col-10 fw-light fs-5" id="productName">  </div>
					        	<div class="col d-none">  </div>
					        </div>
					        
					        <div class="row mt-3">
					        	<div class="col"> <hr class="border">  </div>
					        </div>
			       		 	
			       		 	 <div class="row">
					        	<div class="col fw-medium">
									보증금
					       		</div>
					        </div>
					        				        
					        <div class="row mt-3">
					        	<div class="col-10 fw-light fs-5" id="deposit">  </div>
					        	<div class="col d-none">  </div>
					        </div>
					        
					        <div class="row mt-3">
					        	<div class="col"> <hr class="border">  </div>
					        </div>
					        
					        <div class="row mt-1">
					        	<div class="col fw-medium">
									추가금
					       		</div>
					        </div>
					        
					        <div class="row mt-3">
					        	<div class="col-4"> 
					        		금액
					        	</div>
					        	<div class="col-6"> 
					        		사유
					        	</div>
					        	<div class="col-2 d-grid"> 
					        		
					        	</div>
					        </div>
					        
					        <div class="row mt-1">
					        	<div class="col" id="inputBox"> 
					        		<div class="row mt-1">
							        	<div class="col-4"> 
							        		<input class="form-control charge" placeholder="추가금" type="number" name="charge">
							        	</div>
							        	<div class="col-6"> 
							        		<input class="form-control reason" placeholder="사유" type="text" name="reason">
							        	</div>
							        	<div class="col-2 d-grid"> 
							        		<div class="btn btn-outline-dark" onclick="appendInputs()">+</div>
							        	</div>
							        </div>
					        	</div>
					        </div>
			       		 	
			       		 	
			       		 	
			       		 	
			       		 	
			       		 	
			       		 	
			       		 	
			       		 	
					        <div class="row mt-5 mb-5">
					        	
					        </div>
			       		 	
			       		 
			       		 </div>
			       		 <div class="col"></div>
			       	</div>
			        
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			        <button type="button" class="btn btn-primary" onclick="getInputData()">정산 확인</button>
			      </div>
			    </div>
			  </div>
			</div>
	
	
	
	
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>




<script >


let returnId = null;


// 수취확인 전 
function getItemToBeReturnedList() {
	
	
	const listBox = document.getElementById("listBox");
	
	listBox.innerHTML = "";
	
	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			const listContainer = document.createElement("div");
			listContainer.className = 'row mt-3 mb-4';
			
			
			response.list.forEach(function(data){
				
				const col1 = document.createElement("div");
				col1.classList.add("col");
				col1.classList.add("text-center","my-auto");
				col1.innerText = data.orderDto.id;
				listContainer.appendChild(col1);
				
				const colImgDiv = document.createElement('div');
				colImgDiv.classList.add('col-1', 'my-auto');
				const imgElement = document.createElement('img');
				imgElement.classList.add('img-fluid', 'px-2');
				imgElement.src = "/safariImg/"+data.productDto.main_img_link;
				imgElement.style.width = '70px';
				colImgDiv.appendChild(imgElement);
				listContainer.appendChild(colImgDiv);
				
				const col2 = document.createElement("div");
				col2.classList.add("col-3");
				col2.classList.add("text-center","my-auto");
				col2.innerText = data.productDto.title;
				listContainer.appendChild(col2);
				
				const colContact = document.createElement("div");
				colContact.classList.add("col-2");
				colContact.classList.add("text-center","my-auto");
				colContact.innerText = data.userDto.phone;
				listContainer.appendChild(colContact);
				
				const col3 = document.createElement("div");
				col3.classList.add("col-2");
				col3.classList.add("text-center","my-auto");
				col3.innerText = data.orderDto.address;
				listContainer.appendChild(col3);
				
				const col4 = document.createElement("div");
				col4.classList.add("col");
				col4.classList.add("text-center","my-auto");
				const regDate = new Date(data.returnDto.reg_date);
			    const formattedRegDate = regDate.toLocaleDateString('en-US', { month: '2-digit', day: '2-digit', year: 'numeric' });
				col4.innerText = formattedRegDate;
				listContainer.appendChild(col4);
				
				const col5 = document.createElement("div");
				col5.classList.add("col");
				col5.classList.add("text-center","my-auto");
					const btn1 = document.createElement("div");
					btn1.classList.add("col");
					btn1.className = 'btn btn-dark';
					btn1.innerText = "수취확인";
					btn1.setAttribute('data-order-id', data.orderDto.id);
					btn1.setAttribute('data-return-id', data.returnDto.id);
					btn1.setAttribute('onclick', "changeReturnShippingStatus(this)");
					col5.appendChild(btn1);
				listContainer.appendChild(col5);
				
			    const newHr = document.createElement('hr');
			    newHr.className = 'border border-1 opacity-50 mt-3';
			    listContainer.appendChild(newHr);
			    
				listBox.appendChild(listContainer);

				
			});
			
			
		}
	}

	// get 방식 
	xhr.open("get", "./getItemToBeReturnedList");
	xhr.send();
	
	
}



// 수취확인 후 - 정산 처리  
function getItemReturnedList() {
	
	const listBox = document.getElementById("listBox2");
	listBox.innerHTML = "";
	
	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			const listContainer = document.createElement("div");
			listContainer.className = 'row mt-3 mb-4';
			
			response.list.forEach(function(data){
				
				const col1 = document.createElement("div");
				col1.classList.add("col");
				col1.classList.add("text-center","my-auto");
				col1.innerText = data.orderDto.id;
				listContainer.appendChild(col1);
				
				const colImgDiv = document.createElement('div');
				colImgDiv.classList.add('col-1', 'my-auto');
				const imgElement = document.createElement('img');
				imgElement.classList.add('img-fluid', 'px-2');
				imgElement.src = "/safariImg/"+data.productDto.main_img_link;
				imgElement.style.width = '70px';
				colImgDiv.appendChild(imgElement);
				listContainer.appendChild(colImgDiv);
				
				const col2 = document.createElement("div");
				col2.classList.add("col-3");
				col2.classList.add("text-center","my-auto");
				col2.innerText = data.productDto.title;
				listContainer.appendChild(col2);
				
				const colContact = document.createElement("div");
				colContact.classList.add("col-2");
				colContact.classList.add("text-center","my-auto");
				colContact.innerText = data.userDto.phone;
				listContainer.appendChild(colContact);
				
				const col3 = document.createElement("div");
				col3.classList.add("col-2");
				col3.classList.add("text-center","my-auto");
				col3.innerText = data.orderDto.address;
				listContainer.appendChild(col3);
				
				const col4 = document.createElement("div");
				col4.classList.add("col");
				col4.classList.add("text-center","my-auto");
				const regDate = new Date(data.returnDto.reg_date);
			    const formattedRegDate = regDate.toLocaleDateString('en-US', { month: '2-digit', day: '2-digit', year: 'numeric' });
				col4.innerText = formattedRegDate;
				listContainer.appendChild(col4);
				
				const col5 = document.createElement("div");
				col5.classList.add("col");
				col5.classList.add("text-center","my-auto");
					const btn1 = document.createElement("div");
					btn1.classList.add("col");
					btn1.id = 'btn-'+data.returnDto.id;
					if(data.returnDto.is_completed === 'Y') {
						btn1.innerText = "정산완료";
						btn1.className = 'btn btn-outline-dark disabled';
					} else {
						btn1.innerText = "정산하기";
						btn1.className = 'btn btn-dark';
					}
					btn1.setAttribute('data-order-id', data.orderDto.id);
					btn1.setAttribute('data-return-id', data.returnDto.id);
					btn1.setAttribute('onclick', 'check(this)');
					col5.appendChild(btn1);
				listContainer.appendChild(col5);
				
				
			    const newHr = document.createElement('hr');
			    newHr.className = 'border border-1 opacity-50 mt-3';
			    listContainer.appendChild(newHr);
			    
				listBox.appendChild(listContainer);

				
			});
			
			
		}
	}

	// get 방식 
	xhr.open("get", "./getItemReturnedList");
	xhr.send();
	
	
}


// 배송 처리 
function changeReturnShippingStatus(e) {
	
	const returnId = e.getAttribute("data-return-id")
	
	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			getItemToBeReturnedList();
			getItemReturnedList();
			
		}
	}

	// get 방식 
	xhr.open("get", "./changeReturnShippingStatus?returnId="+returnId);
	xhr.send();
	
}




// 모달에 정보 넣어서 띄워주기 
function check(e) {
	
	const checkModal = bootstrap.Modal.getOrCreateInstance('#checkModal');
	checkModal.show();
	
	// 전역변수에 반납 아이디 저장 
	returnId = e.getAttribute("data-return-id");
	const productNameBox = document.getElementById("productName");
	const depositBox = document.getElementById("deposit");
	
	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			productNameBox.innerText = response.product.title;
			const deposit = response.order.deposit;
			const formattedDeposit = deposit.toLocaleString();
			depositBox.innerText = formattedDeposit + " 원";
			
		}
	}

	// get 방식 
	xhr.open("get", "./getProductAndOrderByReturnId?returnId="+returnId);
	xhr.send();

}



function appendInputs(){
	
	const inputBox = document.getElementById("inputBox");
	// 기존 버튼 제거 
	const buttonElement = inputBox.querySelector('.btn');
	buttonElement.remove();
	
	  // 새로운 row 요소 생성
	  const newRow = document.createElement('div');
	  newRow.className = 'row mt-2';

	  // col-4 요소 생성
	  const col4 = document.createElement('div');
	  col4.className = 'col-4';
	  // input 요소 생성
	  const chargeInput = document.createElement('input');
	  chargeInput.className = 'form-control charge';
	  chargeInput.type = 'number';
	  chargeInput.name = 'charge';
	  chargeInput.placeholder = '추가금';

	  // col-6 요소 생성
	  const col6 = document.createElement('div');
	  col6.className = 'col-6';
	  // input 요소 생성
	  const reasonInput = document.createElement('input');
	  reasonInput.className = 'form-control reason';
	  reasonInput.type = 'text';
	  reasonInput.name = 'reason';
	  reasonInput.placeholder = '사유';

	  // col-2 요소 생성
	  const col2 = document.createElement('div');
	  col2.className = 'col-2 d-grid';
	  // 버튼 요소 생성
	  const btn = document.createElement('div');
	  btn.className = 'btn btn-outline-dark';
	  btn.innerText = '+';
	  btn.addEventListener('click', appendInputs);

	  // 요소들을 구조에 추가
	  col4.appendChild(chargeInput);
	  col6.appendChild(reasonInput);
	  col2.appendChild(btn);
	  newRow.appendChild(col4);
	  newRow.appendChild(col6);
	  newRow.appendChild(col2);

	  // 기존 요소에 새로운 row 추가
	  inputBox.appendChild(newRow);

}



function getInputData() {
	
	// 추가금이랑 사유 인풋 다 가져오기 
	const chargeInputs = document.getElementsByClassName('charge');
	const reasonInputs = document.getElementsByClassName('reason');
	
	
	let extraChargeList = [];
	
		
	// Loop through the input elements and retrieve their values
	for (let i = 0; i < chargeInputs.length; i++) {
		// 둘 다 비었을 경우는 저장 안 하고 반복문 진행하기 (다음으로 넘어가기)
		if(chargeInputs[i].value==null && reasonInputs[i].value==null) continue;
		// 한쪽만 비었을 경우는 인풋 포커스 후 메소드 빠져나가기 
		if (chargeInputs[i].value && !reasonInputs[i].value || !chargeInputs[i].value && reasonInputs[i].value) {
			chargeInputs[i].focus();
			return;
		}
		
		let dto = {
				"return_id":returnId,
				"reason":reasonInputs[i].value,
				"charge":chargeInputs[i].value
		}
		extraChargeList.push(dto);
	}
	
	if(extraChargeList.length==0) {
		let dto = {
				"return_id":returnId
		}
		extraChargeList.push(dto);
	}

	extraChargeList = JSON.stringify(extraChargeList);
	
	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			// 정산완료로 버튼 바꾸고 disabled
			getItemToBeReturnedList();
			getItemReturnedList();

			// 모달 닫기 
			const checkModal = bootstrap.Modal.getOrCreateInstance('#checkModal');
			checkModal.hide();
			
		}
	}

	// post 방식 
	xhr.open("post", "./returnComplete");
	xhr.setRequestHeader("Content-type", "application/json");
	xhr.send(extraChargeList);
}


/* 
function getInputData() {
	
	// 사유랑 금액 input 다 가져오기 (1개 이상)
	const chargeInputs = document.getElementsByClassName('charge');
	const reasonInputs = document.getElementsByClassName('reason');
	
	let chargeValue = [];
	let reasonValue = [];
		
	// Loop through the input elements and retrieve their values
	for (let i = 0; i < chargeInputs.length; i++) {
		if(chargeInputs[i].value==null && reasonInputs[i].value==null) continue;
		if (chargeInputs[i].value && !reasonInputs[i].value || !chargeInputs[i].value && reasonInputs[i].value) {
			chargeInputs[i].focus();
			
			return;
		}
		chargeValue.push(chargeInputs[i].value);
		reasonValue.push(reasonInputs[i].value);
	}
	

	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			// 모달 닫기 
			
			// 정산하기 버튼 disabled
			
		}
	}

	// post 방식 
	xhr.open("post", "url");
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.send("returnId="+returnId+"&chargeValue="+chargeValue+"&reasonValue="+reasonValue);
}
 */




function changeTextColor() {
	
	const tab = document.getElementsByClassName('returnTab')[0];
	tab.classList.remove("text-white");
	
}


window.addEventListener("DOMContentLoaded",function(){
	getItemToBeReturnedList();
	getItemReturnedList();
	changeTextColor();
	
	// setInterval(reloadCommentList, 3000);	// 3초마다 실행
});


</script>





</body>	
</html>
