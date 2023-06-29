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
</head>
<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../common/headerB.jsp"></jsp:include>
	<!-- 헤더 섹션 -->

	<div class="container-fluid main_box">
		<div class="row ms-5">
		
		
			<div class="col-2" style=""></div>
			<div class="col-2" style="position: fixed;">
			<div class="list-group list-group-flush">
					
					<!-- 왼쪽 카테고리 리스트 -->
					<jsp:include page="../common/navLeft.jsp"></jsp:include>
					<!-- 왼쪽 카테고리 리스트 -->
					
				</div>
				
				<div class="row mt-5 mb-5">
					<div class="col"> </div>
				</div>
			
			</div>
			
			
			<div class="col  container me-5" id="listContainer">
			
    			<h4 class="row mt-3 mb-4 fw-regular">반품 관리</h4>

				<div class="row mt-3 mb-2 fw-medium">
					반품 수취 확인
				</div>
				
				
				<div class="row mt-4 mb-3 fw-medium">
					<div class="col-1 text-center">
						#
					</div> 
					<div class="col-3 text-center">
						상품
					</div>
					<div class="col-4 text-center">
						주소
					</div>
					<div class="col-2 text-center">
						반납신청
					</div>
					<div class="col-2 text-center">
						상태
					</div>
				</div>
				
				<hr class="border border-black border-1 opacity-100">

				
				
				<div class="" id="listBox">
					




					
				</div>
					

				<div class="row mt-5 mb-2 fw-medium">
					반품 정산 
				</div>

				
				<div class="row mt-4 mb-3 fw-medium">
					<div class="col-1 text-center">
						#
					</div>
					<div class="col-3 text-center">
						상품
					</div>
					<div class="col-4 text-center">
						주소
					</div>
					<div class="col-2 text-center">
						반납신청
					</div>
					<div class="col-2 text-center">
						상태
					</div>
				</div>
				
				<hr class="border border-black border-1 opacity-100">

				
				
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
							        		<input class="form-control" type="number" name="charge">
							        	</div>
							        	<div class="col-6"> 
							        		<input class="form-control" type="text" name="reason">
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
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			        <button type="button" class="btn btn-primary">Save changes</button>
			      </div>
			    </div>
			  </div>
			</div>
	
	
	
	
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>




<script >


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
				col1.classList.add("col-1");
				col1.classList.add("text-center");
				col1.innerText = data.orderDto.id;
				listContainer.appendChild(col1);
				
				const col2 = document.createElement("div");
				col2.classList.add("col-3");
				col2.classList.add("text-center");
				col2.innerText = data.productDto.title;
				listContainer.appendChild(col2);
				
				const col3 = document.createElement("div");
				col3.classList.add("col-4");
				col3.classList.add("text-center");
				col3.innerText = data.orderDto.address;
				listContainer.appendChild(col3);
				
				const col4 = document.createElement("div");
				col4.classList.add("col-2");
				col4.classList.add("text-center");
				const regDate = new Date(data.returnDto.reg_date);
			    const formattedRegDate = regDate.toLocaleDateString('en-US', { month: '2-digit', day: '2-digit', year: 'numeric' });
				col4.innerText = formattedRegDate;
				listContainer.appendChild(col4);
				
				const col5 = document.createElement("div");
				col5.classList.add("col-2");
				col5.classList.add("text-center");
					const btn1 = document.createElement("div");
					btn1.classList.add("col");
					btn1.className = 'btn btn-dark';
					btn1.innerText = "수취확인";
					btn1.setAttribute('data-order-id', data.orderDto.id);
					btn1.setAttribute('data-return-id', data.returnDto.id);
					btn1.setAttribute('onclick', changeReturnShippingStatus);
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



// 수추확인 후 - 정산 처리  
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
				col1.classList.add("col-1");
				col1.classList.add("text-center");
				col1.classList.add("text-center");
				col1.innerText = data.orderDto.id;
				listContainer.appendChild(col1);
				
				const col2 = document.createElement("div");
				col2.classList.add("col-3");
				col2.classList.add("text-center");
				col2.innerText = data.productDto.title;
				listContainer.appendChild(col2);
				
				const col3 = document.createElement("div");
				col3.classList.add("col-4");
				col3.classList.add("text-center");
				col3.innerText = data.orderDto.address;
				listContainer.appendChild(col3);
				
				const col4 = document.createElement("div");
				col4.classList.add("col-2");
				col4.classList.add("text-center");
				const regDate = new Date(data.returnDto.reg_date);
			    const formattedRegDate = regDate.toLocaleDateString('en-US', { month: '2-digit', day: '2-digit', year: 'numeric' });
				col4.innerText = formattedRegDate;
				listContainer.appendChild(col4);
				
				const col5 = document.createElement("div");
				col5.classList.add("col-2");
				col5.classList.add("text-center");
					const btn1 = document.createElement("div");
					btn1.classList.add("col");
					btn1.className = 'btn btn-outline-dark';
					btn1.innerText = "정산하기";
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





function check(e) {
	
	const checkModal = bootstrap.Modal.getOrCreateInstance('#checkModal');
	checkModal.show();
	
	const returnId = e.getAttribute("data-return-id");
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
	  chargeInput.className = 'form-control';
	  chargeInput.type = 'number';
	  chargeInput.name = 'charge';

	  // col-6 요소 생성
	  const col6 = document.createElement('div');
	  col6.className = 'col-6';
	  // input 요소 생성
	  const reasonInput = document.createElement('input');
	  reasonInput.className = 'form-control';
	  reasonInput.type = 'text';
	  reasonInput.name = 'reason';

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

/* 
function appendInputs(){
	
	const listBox = document.getElementById("inputBox");
	
	// inputBox 요소를 선택합니다.
	const inputBoxElement = document.getElementById('inputBox');
	const buttonElement = inputBoxElement.querySelector('.btn');
	// 버튼 요소를 부모 요소에서 제거합니다.
	buttonElement.remove();
	

	// 첫 번째 <div> 요소 생성
	const divElement1 = document.createElement('div');
	divElement1.classList.add('col-4');

	// 첫 번째 <input> 요소 생성
	const inputElement1 = document.createElement('input');
	inputElement1.classList.add('form-control');
	inputElement1.setAttribute('type', 'number');
	inputElement1.setAttribute('name', 'charge');
	// 첫 번째 <input> 요소를 <div> 요소에 추가
	divElement1.appendChild(inputElement1);
	// 부모 요소에 첫 번째 <div> 요소 추가
	listBox.appendChild(divElement1);

	// 두 번째 <div> 요소 생성
	const divElement2 = document.createElement('div');
	divElement2.classList.add('col-6');
	// 두 번째 <input> 요소 생성
	const inputElement2 = document.createElement('input');
	inputElement2.classList.add('form-control');
	inputElement2.setAttribute('type', 'text');
	inputElement2.setAttribute('name', 'reason');
	// 두 번째 <input> 요소를 <div> 요소에 추가
	divElement2.appendChild(inputElement2);
	// 부모 요소에 두 번째 <div> 요소 추가
	listBox.appendChild(divElement2);
	

	// 세 번째 <div> 요소 생성
	const divElement3 = document.createElement('div');
	divElement3.classList.add('col-2');
	const newButtonElement = document.createElement('div');
	newButtonElement.className = 'btn btn-outline-dark';
	newButtonElement.textContent = '+';
	newButtonElement.addEventListener('click', appendInputs);
	divElement3.appendChild(newButtonElement);
	// 부모 요소에 새로운 버튼을 추가합니다.
	listBox.appendChild(divElement3);


} */








window.addEventListener("DOMContentLoaded",function(){
	getItemToBeReturnedList();
	getItemReturnedList();
	
	// setInterval(reloadCommentList, 3000);	// 3초마다 실행
});


</script>





</body>	
</html>
