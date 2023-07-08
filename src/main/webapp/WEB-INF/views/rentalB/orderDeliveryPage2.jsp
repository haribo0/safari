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

.deliveryTab{
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
			
			
			
			
							


			
			<div class="col ms-4 mt-5 container" id="listContainer">
			
    			<h4 class="ps-4  mt-3 mb-4 fw-regular">배송 관리</h4>

				<div class="row mt-5 ms-4 row mb-2 fw-bold">
					배송 전
				</div>
				
				
				<div class="row mt-3 mb-1 fw-medium">
					<div class="col text-center">
						#
					</div>
					<div class="col-1 text-center">
						사진
					</div>
					<div class="col-3 text-center">
						상품
					</div>
					<div class="col text-center">
						연락처
					</div>
					<div class="col-3 text-center">
						주소
					</div>
					<div class="col text-center">
						시작일
					</div>
					<div class="col text-center">
						상태
					</div>
				</div>
				
				
				<div class="row">
					<div class="col">
						<hr class="border ms-4 border-black border-1 opacity-100">
					</div>
				</div>

				
				
				<div class="my-auto" id="listBox">
					




					
				</div>
					

				<div class="row ms-4 mt-5 mb-2 fw-bold">
					배송 완료
				</div>

				
				<div class="row  mt-3 mb-2 fw-medium">
					<div class="col text-center">
						#
					</div>
					<div class="col-1 text-center">
						사진
					</div>
					<div class="col-3 text-center">
						상품
					</div>
					<div class="col text-center">
						연락처
					</div>
					<div class="col-3 text-center">
						주소
					</div>
					<div class="col text-center">
						시작일
					</div>
					<div class="col text-center">
						상태
					</div>
				</div>
				
				<hr class="border ms-4 border-black border-1 opacity-100">

				
				
				<div class="" id="listBox2">
					




					
				</div>
					
			</div>
				
				<!-- <hr class="border border-1 opacity-50"> -->
					
			
				
				
			<div class="col-1"></div>
			
	</div>
	
	


</div>

	
	
	
	
	
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>




<script >



function getProductListToBeShippedList() {
	
	
	const listBox = document.getElementById("listBox");
	
	listBox.innerHTML = "";
	
	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			const listContainer = document.createElement("div");
			listContainer.className = 'row mt-2 mb-4 my-auto';
			
			
			response.list.forEach(function(data){
				
				const col1 = document.createElement("div");
				col1.classList.add("col");
				col1.classList.add("text-center", "my-auto");
				col1.innerText = data.order.id;
				listContainer.appendChild(col1);
				
				const colImgDiv = document.createElement('div');
				colImgDiv.classList.add('col-1', 'my-auto');
				const imgElement = document.createElement('img');
				imgElement.classList.add('img-fluid', 'px-2');
				imgElement.src = "/safariImg/"+ data.product.main_img_link;
				imgElement.style.width = '70px';
				colImgDiv.appendChild(imgElement);
				listContainer.appendChild(colImgDiv);

				
				const col2 = document.createElement("div");
				col2.classList.add("col-3");
				col2.classList.add("text-center","my-auto");
				col2.innerText = data.product.title;
				listContainer.appendChild(col2);
				
				const colContact = document.createElement("div");
				colContact.classList.add("col");
				colContact.classList.add("text-center","my-auto");
				colContact.innerText = data.user.phone;
				listContainer.appendChild(colContact);
				
				const col3 = document.createElement("div");
				col3.classList.add("col-3");
				col3.classList.add("text-center","my-auto");
				col3.innerText = data.order.address;
				listContainer.appendChild(col3);
				
				const col4 = document.createElement("div");
				col4.classList.add("col");
				col4.classList.add("text-center","my-auto");
				const startDate = new Date(data.order.start_date);
			    const formattedStartDate = startDate.toLocaleDateString('en-US', { month: '2-digit', day: '2-digit', year: 'numeric' });
				col4.innerText = formattedStartDate;
				listContainer.appendChild(col4);
				
				const col5 = document.createElement("div");
				col5.classList.add("col");
				col5.classList.add("text-center","my-auto");
					const btn1 = document.createElement("div");
					btn1.classList.add("col");
					btn1.className = 'btn btn-dark';
					btn1.innerText = "배송처리";
					btn1.setAttribute('data-order-id', data.order.id);
					btn1.setAttribute('onclick', 'changeShippingStatus(this)');
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
	xhr.open("get", "./getProductListToBeShippedList");
	xhr.send();
	
	
}



// 배송 완료 리스트 
function getShippedOrderList() {
	
	
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
				col1.classList.add("text-center", "my-auto");
				col1.innerText = data.order.id;
				listContainer.appendChild(col1);
				
				const colImgDiv = document.createElement('div');
				colImgDiv.classList.add('col-1', 'my-auto');
				const imgElement = document.createElement('img');
				imgElement.classList.add('img-fluid', 'px-2');
				imgElement.src = "/safariImg/"+ data.product.main_img_link;
				imgElement.style.width = '70px';
				colImgDiv.appendChild(imgElement);
				listContainer.appendChild(colImgDiv);

				
				const col2 = document.createElement("div");
				col2.classList.add("col-3");
				col2.classList.add("text-center","my-auto");
				col2.innerText = data.product.title;
				listContainer.appendChild(col2);
				
				const colContact = document.createElement("div");
				colContact.classList.add("col");
				colContact.classList.add("text-center","my-auto");
				colContact.innerText = data.user.phone;
				listContainer.appendChild(colContact);
				
				const col3 = document.createElement("div");
				col3.classList.add("col-3");
				col3.classList.add("text-center","my-auto");
				col3.innerText = data.order.address;
				listContainer.appendChild(col3);
				
				const col4 = document.createElement("div");
				col4.classList.add("col");
				col4.classList.add("text-center","my-auto");
				const startDate = new Date(data.order.start_date);
			    const formattedStartDate = startDate.toLocaleDateString('en-US', { month: '2-digit', day: '2-digit', year: 'numeric' });
				col4.innerText = formattedStartDate;
				listContainer.appendChild(col4);
				
				const col5 = document.createElement("div");
				col5.classList.add("col", "text-center","my-auto");
					const btn1 = document.createElement("div");
					btn1.classList.add("col");
					btn1.className = 'btn btn-outline-dark disabled';
					btn1.innerText = "배송완료";
					btn1.setAttribute('data-order-id', data.order.id);
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
	xhr.open("get", "./getShippedOrderList");
	xhr.send();
	
	
}

// 배송 처리 
function changeShippingStatus(e) {
	
	const orderId = e.getAttribute("data-order-id")
	
	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			getProductListToBeShippedList();
			getShippedOrderList();
			
		}
	}

	// get 방식 
	xhr.open("get", "./changeShippingStatus?orderId="+orderId);
	xhr.send();
	
}







function changeTextColor() {
	
	const tab = document.getElementsByClassName('deliveryTab')[0];
	tab.classList.remove("text-white");
	
}



window.addEventListener("DOMContentLoaded",function(){
	getProductListToBeShippedList();
	getShippedOrderList();
	changeTextColor();
	
	// setInterval(reloadCommentList, 3000);	// 3초마다 실행
});


</script>





</body>	
</html>
