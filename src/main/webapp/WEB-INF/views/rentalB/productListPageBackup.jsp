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
<style>

  .my-table-row {
    line-height: 50px; /* 원하는 높이로 설정 */
  }
  .custom-dropdown  {
    background-color: white;
    color : black;
    border: 1px solid #ccc;
  }
  .f-sm  {
    font-size: 13px;
  }
  .f-sm2  {
    font-size: 15px;
  }
  
</style>

</head>
<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../common/headerB.jsp"></jsp:include>
	<!-- 헤더 섹션 -->

	<div class="container main_box">
		<div class="row">
		
			<div class="col-2">
				<div class="list-group list-group-flush">
					
					<!-- 왼쪽 카테고리 리스트 -->
					<jsp:include page="../common/navLeft.jsp"></jsp:include>
					<!-- 왼쪽 카테고리 리스트 -->
					
				</div>
				
				<div class="row mt-5 mb-5">
					<div class="col"> </div>
				</div>
			
			</div>
			
			
			<div class="col ms-5">
		    	
		    	<h4 class="row mt-3 mb-4 fw-regular">상품 관리</h4>

				<div class="row mt-4">
					<div class="col">
					
						<div class="row mt-3 text-center fw-bold">
						      <div class="col-1">#</div>
						      <div class="col-2">광고</div>
						      <div class="col-4">제품</div>
						      <div class="col-1">수량</div>
						      <div class="col-2">가격</div>
						      <div class="col-1">수정</div>
						      <div class="col-1">삭제</div>
						</div>
						<hr class="border border-black">
					    <c:forEach items="${list }" var="map" varStatus="idx">
						    <div class="row mt-4 text-center">
						      
						      <div class="col-1">${map.product.id}</div>
						      <div class="col-2">
						      	<div class="btn btn-light btn-sm" data-index="${idx}" data-product-id="${map.product.id}"  data-bs-toggle="collapse" role="button" onclick="checkOutModal(this)">
									 <i class="bi bi-badge-ad"></i> 추가 
								</div>
						      
						      
						      </div>
						      <div class="col-4" id="prdTitle${map.product.id}">${map.product.title}</div>
						      <div class="col-1">${map.product.quantity}</div>
						      <div class="col-2">
						      	<div class="dropdown d-grid">
								  <a class="btn btn-secondary dropdown-toggle custom-dropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
								    
								    <fmt:formatNumber value="${map.product.price}" pattern="#,###" var="formattedPrice" />
						  			${formattedPrice} 원
						  			
								  </a>
									
								  <ul class="dropdown-menu ps-2 pe-2">
								  	<c:forEach items="${map.discountedPriceList}" var="dto">
								  		<li class="f-sm2 text-center">
								  			<fmt:formatNumber value="${dto.discounted_price}" pattern="#,###" var="formattedPrice2" />
								  			${formattedPrice2} 원 / ${dto.rental_period}개월
								  		</li>
								  	</c:forEach>
								  </ul>
								</div>
						      
						      </div>
						      <div class="col-1">
						      	<a href="./productEditPage?id=${map.product.id}" class="text-body-tertiary text-decoration-none">
						      	 &nbsp; <i class="bi bi-pencil-square "></i> 
						     	</a>
						     </div>
						      <div class="col-1">
						      	<a href="./productDeleteProcess?id=${map.product.id}" class="text-body-tertiary text-decoration-none">
						      	 &nbsp; <i class="bi bi-trash3 "></i>
						       	</a>
						      </div>
						</div>    
						</c:forEach>

					
					</div>
				</div>
			
			</div>
			
			
		
		
		</div>
	</div>
	
	
	
	
	
	<!-- 상품 등록 모달 -->
	<div class="modal" id="newItemModal" tabindex="-1">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title"> 상품 등록 </h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      
	     <form id="paymentForm">
	     
	      <div class="modal-body">
	       
		        <div class="row">
		        
		        	<div class="col-1"></div>
		        	<div class="col">
		        	
		        		<div class="row mt-3">
		        	
				        	<div class="col fs-6 fw-medium"> 상품 </div>
				        	
				        	
				        </div>
				        
				        <div class="row mt-3">
				        	
				        	<div class="col-10 fw-light fs-5" id="productName">  </div>
				        	
				        	
				        </div>
				        
				        <div class="row mt-3">
				        	
				        	<div class="col"> <hr class="border">  </div>
				        	
				        	
				        </div>
				        
				       
				        
				        <div class="row mt-3">
				        	<div class="col">
				        	  
							    <!-- Include necessary input fields for payment information -->
							    <!-- For example: amount, item name, etc. -->
							    <span class="fw-medium">광고 선택 </span>
							    <div class="row mt-3">
							    	<div class="col">
							    		<div class="row mt-3">
							    			<div class="col-1">
							    				<input type="radio" id="day" name="price" value="9900" checked="checked">
							    			</div>
							    			<div class="col">
							    				 <label for="day">  9,900원 / 7일  </label> 
							    			</div>
						    			</div>
							    		<div class="row mt-3">
							    			<div class="col-1">
							    				 <input type="radio" id="month" name="price" value="38900">
							    			</div>
							    			<div class="col">
							    				 <label for="month"> 38,900원 / 1개월  </label> 
							    			</div>
						    			</div>
							    		<div class="row mt-3">
							    			<div class="col-1">
							    				<input type="radio" id="year" name="price" value="19900"> 
							    			</div>
							    			<div class="col">
							    				<label for="year"> 199,900원 / 1년 </label> 
							    			</div>
						    			</div>
						    			<input type="hidden" id="userId" value="${user.id}">
							    	</div>
							    </div>
							    <div class="row mt-5 mb-5">
							    </div>
				        	</div>
				        </div>
		        	
		        	</div>
		        	<div class="col-1"></div>
		        </div>

	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">닫기</button>
	        <button type="button" class="btn btn-dark" onclick="processPayment()">결제하기</button>
	      </div>
	      </form>
	    </div>
	  </div>
	</div>
	<!-- 상품 등록 모달 -->
	
	
	
	
	<!-- 광고 결제 모달 -->
	<div class="modal" id="adsModal" tabindex="-1">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">광고 결제</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      
	     <form id="paymentForm">
	     
	      <div class="modal-body">
	       
		        <div class="row">
		        
		        	<div class="col-1"></div>
		        	<div class="col">
		        	
		        		<div class="row mt-3">
		        	
				        	<div class="col fs-6 fw-medium"> 상품 </div>
				        	
				        	
				        </div>
				        
				        <div class="row mt-3">
				        	
				        	<div class="col-10 fw-light fs-5" id="productName">  </div>
				        	
				        	
				        </div>
				        
				        <div class="row mt-3">
				        	
				        	<div class="col"> <hr class="border">  </div>
				        	
				        	
				        </div>
				        
				       
				        
				        <div class="row mt-3">
				        	<div class="col">
				        	  
							    <!-- Include necessary input fields for payment information -->
							    <!-- For example: amount, item name, etc. -->
							    <span class="fw-medium">광고 선택 </span>
							    <div class="row mt-3">
							    	<div class="col">
							    		<div class="row mt-3">
							    			<div class="col-1">
							    				<input type="radio" id="day" name="price" value="9900" checked="checked">
							    			</div>
							    			<div class="col">
							    				 <label for="day">  9,900원 / 7일  </label> 
							    			</div>
						    			</div>
							    		<div class="row mt-3">
							    			<div class="col-1">
							    				 <input type="radio" id="month" name="price" value="38900">
							    			</div>
							    			<div class="col">
							    				 <label for="month"> 38,900원 / 1개월  </label> 
							    			</div>
						    			</div>
							    		<div class="row mt-3">
							    			<div class="col-1">
							    				<input type="radio" id="year" name="price" value="19900"> 
							    			</div>
							    			<div class="col">
							    				<label for="year"> 199,900원 / 1년 </label> 
							    			</div>
						    			</div>
						    			<input type="hidden" id="userId" value="${user.id}">
							    	</div>
							    </div>
							    <div class="row mt-5 mb-5">
							    </div>
				        	</div>
				        </div>
		        	
		        	</div>
		        	<div class="col-1"></div>
		        </div>

	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">닫기</button>
	        <button type="button" class="btn btn-dark" onclick="processPayment()">결제하기</button>
	      </div>
	      </form>
	    </div>
	  </div>
	</div>
	<!-- 광고 모달 -->
	
	
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>


<script >




document.addEventListener('DOMContentLoaded', function() {
  document.getElementById('paymentForm').addEventListener('submit', function(e) {
    e.preventDefault();

    // Gather the payment information from the form
    var amount = document.getElementById('amountInput').value;
    var itemName = document.getElementById('itemNameInput').value;

    // Make an Ajax request to the KakaoPay API endpoint
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'https://kapi.kakao.com/v1/payment/ready');
    xhr.setRequestHeader('Authorization', 'KakaoAK YOUR_API_KEY');
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

    xhr.onreadystatechange = function() {
      if (xhr.readyState === XMLHttpRequest.DONE) {
        if (xhr.status === 200) {
          // Handle the successful response
          var response = JSON.parse(xhr.responseText);
          // Process the response data accordingly
        } else {
          // Handle the error response
        }
      }
    };

    var formData = new FormData();
    // Add the necessary payment information to the form data
    formData.append('amount', amount);
    formData.append('item_name', itemName);

    xhr.send(formData);
  });
});



function kakaoPay(){

    e.preventDefault();

    // Gather the payment information from the form
    var amount = document.getElementById('amountInput').value;
    var itemName = document.getElementById('itemNameInput').value;

    // Make an Ajax request to the KakaoPay API endpoint
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'https://kapi.kakao.com/v1/payment/ready');
    xhr.setRequestHeader('Authorization', 'KakaoAK YOUR_API_KEY');
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

    xhr.onreadystatechange = function() {
      if (xhr.readyState === XMLHttpRequest.DONE) {
        if (xhr.status === 200) {
          // Handle the successful response
          var response = JSON.parse(xhr.responseText);
          // Process the response data accordingly
        } else {
          // Handle the error response
        }
      }
    };

    var formData = new FormData();
    // Add the necessary payment information to the form data
    formData.append('amount', amount);
    formData.append('item_name', itemName);

    xhr.send(formData);
}






function closeModal() {
	  const modalElement = document.getElementById('adsModal');
	  const myModal = bootstrap.Modal.getOrCreateInstance(modalElement);

	// 테스트 용 

	  myModal.hide();

	}
	
function openModal() {
  const modalElement = document.getElementById('adsModal');
  const myModal = bootstrap.Modal.getOrCreateInstance(modalElement);
  myModal.show();
}



// 모달 열기 
function checkOutModal(e) {

	const nameModal = document.getElementById("productName");
	const productId = e.getAttribute("data-product-id");
	console.log(productId);
	const nameBox = document.getElementById("prdTitle"+productId);
	productName = nameBox.innerText;
	nameModal.innerText = productName;
	
	openModal();
	
}


/* // 새창 띄우기
function openNewWindow(url) {
	  // Open a new window with a specified URL
	  window.open(url);
} */

// 새 창 띄우기 
function openNewWindow(url) {
	  // Define the window features
	  const windowFeatures = "width=600,height=600,resizable=yes,scrollbars=yes";

	  // Open a new window with the specified URL and features
	  window.open(url, "_blank", windowFeatures);
}


function getOrderId() {
	
	
	
	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			return response.orderId;
		}
	}

	// get 방식 
	xhr.open("get", "./getAdsOrderPk");
	xhr.send();
	
	
}



// 결제하기 

function processPayment() {
	
	
	
	  // Retrieve the selected price from the radio button
	  const selectedPrice = document.querySelector('input[name="price"]:checked').value;
	  const userId = document.getElementById("userId").value;
	  const orderId = getOrderId();
	  
	  console.log(selectedPrice);
	  console.log(userId);
	  console.log(orderId);
	  
	  const cid = "TC0ONETIME";
	  const partner_order_id = orderId;
	  const partner_user_id = userId;
	  const item_name = "TC0ONETIME";
	  const quantity = 1;
	  const total_amount = selectedPrice;
	  const tax_free_amount = selectedPrice;
	  const approval_url = "http://localhost:8181/safari/rental/paymentSucceeded";
	  const cancel_url = "http://localhost:8181/safari/rental/productListPage";
	  const fail_url = "http://localhost:8181/safari/rental/paymentFailed";
	  
	  
	  // Make an AJAX request to the server to initiate the payment using KakaoPay API
	  // Replace the URL and other request parameters with your actual API endpoint and data
	  const xhr = new XMLHttpRequest();
	  
	  
	  xhr.open("POST", "https://kapi.kakao.com/v1/payment/ready");
	  xhr.setRequestHeader("Authorization", "KakaoAK 462eff64d0b7c3d7f80e563c1c8805e6");
	  xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
	  
	  
	  
	  
	  xhr.onreadystatechange = function() {
	    if (xhr.readyState === XMLHttpRequest.DONE) {
	      if (xhr.status === 200) {
	        // Payment request succeeded
	        const response = JSON.parse(xhr.responseText);
	        // Handle the response or redirect the user to the payment page
	        console.log(response);
	        console.log(response.tid);
	        
	        openNewWindow(response.next_redirect_pc_url);
	        
	        
	      } else {
	        // Payment request failed
	        // Handle the error or display an error message to the user
	      }
	    }
	  };
	  
	  
	  const requestBody = {
	    cid: cid,
	    partner_order_id: partner_order_id,
	    partner_user_id: selectedPrice,
	    item_name: item_name,
	    quantity: quantity,
	    total_amount: selectedPrice,
	    tax_free_amount: selectedPrice*.9,
	    approval_url: approval_url,
	    cancel_url: cancel_url,
	    fail_url: fail_url
	  };
	  
	  xhr.send("cid="+cid+"&partner_order_id="+partner_order_id+"&partner_user_id="+partner_user_id+"&item_name="+item_name
			  +"&quantity="+quantity+"&total_amount="+total_amount+"&tax_free_amount="+tax_free_amount
			  +"&approval_url="+approval_url+"&cancel_url="+cancel_url+"&fail_url="+fail_url);
	
}





function savePaymentDetails() {

	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
		}
	}

	

	// post 방식 
	xhr.open("post", "url");
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.send("params");

}





</script>




</body>	
</html>
