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

	<div class="container-fluid main_box">
		<div class="row">
		
		
			<div class="col-2" style=""></div>
			<div class="col-2  bg-dark h-100" style="position: fixed;">
				<div class="list-group list-group-flush">
					
					<!-- 왼쪽 카테고리 리스트 -->
					<jsp:include page="../common/navLeft.jsp"></jsp:include>
					<!-- 왼쪽 카테고리 리스트 -->
					
				</div>
				
				<div class="row mt-5 mb-5">
					<div class="col"> </div>
				</div>
			
			</div>
			
			
			<div class="col ms-4 mt-5">
		    	
		    	<h4 class="ps-4  mt-3 mb-4 fw-regular">상품 관리</h4>

				<div class="row mt-5 ms-4">
					<div class="col">
						
					</div>
					<div class="col-2 d-grid">
						<div class="btn btn-dark btn-sm" onclick="openModal('newItemModal')">상품 등록</div>
					</div>
				</div>
					
					
				<div class="row mt-4">
					<div class="col">
					
						<div class="row mt-3 text-center fw-bold">
						      <div class="col-1">#</div>
						      <div class="col-2">광고</div>
						      <div class="col-1">이미지</div>
						      <div class="col-3">제품</div>
						      <div class="col-1">수량</div>
						      <div class="col-2">가격</div>
						      <div class="col-1">수정</div>
						      <div class="col-1">삭제</div>
						</div>
						<hr class="border border-black">
					    <c:forEach items="${list }" var="map" varStatus="idx">
						    <div class="row mt-4 text-center">
						      
						      <div class="col-1 my-auto">${map.product.id}</div>
						      <div class="col-2 my-auto">
						      	<c:choose>
						      		<c:when test="${map.ads}">
						      			<div class="btn btn-outline-secondary btn-sm btn-disalbed" data-index="${idx}" data-product-id="${map.product.id}"  data-bs-toggle="collapse" role="button" >
											 <i class="bi bi-badge-ad"></i> 광고중
										</div>
						      		</c:when>
						      		<c:otherwise>
						      			<div class="btn btn-light btn-sm" data-index="${idx}" data-product-id="${map.product.id}"  data-bs-toggle="collapse" role="button" onclick="checkOutModal(this)">
											 <i class="bi bi-badge-ad"></i> 추가 
										</div>
						      		</c:otherwise>
						      	</c:choose>
						      	
						      
						      
						      </div>
						      <div class="col-1 my-auto">
						          <img class="img-fluid px-2" src="/safariImg/${map.product.main_img_link}">
						      </div>
						      <div class="col-3 my-auto" id="prdTitle${map.product.id}">${map.product.title}</div>
						      <div class="col-1 my-auto">${map.product.quantity}</div>
						      <div class="col-2 my-auto">
						      	<div class="dropdown d-grid">
								  <a class="btn btn-secondary dropdown-toggle custom-dropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
								    
								    <fmt:formatNumber value="${map.product.price}" pattern="#,###" var="formattedPrice" />
						  			${formattedPrice} 원
						  			
								  </a>
									
								  <ul class="dropdown-menu px-3">
								  	<c:forEach items="${map.discountedPriceList}" var="dto">
								  		<li class="f-sm2 text-center mt-1">
								  			
								  			<fmt:formatNumber value="${dto.discounted_price}" pattern="#,###" var="formattedPrice2" />
								  			${formattedPrice2} 원 / ${dto.rental_period}개월
								  			
								  		</li>
								  	</c:forEach>
								  </ul>
								</div>
						      
						      </div>
						      <div class="col-1 my-auto">
						      	<a href="./productEditPage?id=${map.product.id}" class="text-body-tertiary text-decoration-none">
						      	 &nbsp; <i class="bi bi-pencil-square "></i> 
						     	</a>
						     </div>
						      <div class="col-1 my-auto">
						      	<a href="./productDeleteProcess?id=${map.product.id}" class="text-body-tertiary text-decoration-none">
						      	 &nbsp; <i class="bi bi-trash3 "></i>
						       	</a>
						      </div>
						</div>    
						</c:forEach>

					
					</div>
				</div>
			
			</div>
			
			
		
		<div class="col-1"></div>
		</div>
	</div>
	
	
	<!-- 하단 공백 -->
	<div class="row mt-5 mb-5">
		<div class="col"> </div>
	</div>
	<div class="row mt-5 mb-5">
		<div class="col"> </div>
	</div>

	
	
	
	
	<!-- 상품 등록 모달 -->
	<div class="modal modal-lg" id="newItemModal" tabindex="-1">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title"> 상품 등록 </h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      
	     <form action="./productRegisterProcess" id="frm" method="POST" enctype="multipart/form-data">
	     
	      <div class="modal-body">
	       
		        <div class="row">
		        
		        	<div class="col-1"></div>
		        	<div class="col">
		        	
					        <div class="form-group row mt-1">
					            <div class="col-10">
					            	<div class="mb-1"><label for="title" class="col-form-label fw-medium">상품 제목</label></div>
					                <input type="text" class="form-control" id="title" name="title"  placeholder="상품 제목">
					            </div>
					        </div>
					        
					        <div class="form-group row mt-3">
					            
					            <div class="col-3">
					            <div class="mb-1"><label for="mainCategory" class=" col-form-label fw-medium">카테고리 대분류</label></div>
					            	<select class="form-control" id="mainCategory" name="mainCategory">
					            		<option value="0">대분류 선택 </option>
					            		<c:forEach  var="category" items="${mainCategoryList}">
					            			<option value="${category.id}"> ${category.main_category_name} </option>
					            		</c:forEach>
					                </select>
					            </div>
					
					            <div class="col-3">
					            <div class="mb-1"><label for="category" class=" col-form-label fw-medium">카테고리 소분류</label></div>
					                <select class="form-control" id="subCategory" name="sub_category_id">
					                	<option value="0">소분류 선택</option>
					                </select>
					            </div>
					        </div>
					
					        <div class="form-group row mt-3">
					            <div class="col-10">
					            <div class="mb-1"><label for="description" class="col-form-label fw-medium">상품 설명</label></div>
					                <textarea class="form-control" id="description" name="item_description" rows="5" placeholder="상품 설명"></textarea>
					            </div>
					        </div>
							
								
								
					        <div class="form-group row mt-3">
					            <div class="col">
					            	<div class="mb-1"><label for="deposit" class="col-form-label fw-medium">보증금</label></div>
					                <input type="text" class="form-control" id="deposit" name="deposit"  placeholder="보증금">
					            </div>
					            <div class="col">
					            	<div class="mb-1"><label for="price" class="col-form-label fw-medium">대여 가격 (월)</label></div>
					                <input type="text" class="form-control" id="price" name="price"  placeholder="가격">
					            </div>
					            <div class="col">
					            	<div class="mb-1"><label for="quantity" class="col-form-label fw-medium">총 운영 수량</label></div>
					                <input type="text" class="form-control" id="quantity" name="quantity" placeholder="운영 수량">
					            </div>
					            <div class="col-2">
					            </div>
					        </div>
					        
					       <div class="form-group row mt-3">
					            <div class="col-10">
					            	<div class="mb-1"><label for="" class="col col-form-label fw-medium">기간 별 할인 (선택사항)</label></div>
					            	
					            	<div class="form-group row mt-2" id="disc_form">
							        	<div class="row ">
							            	<label for="mon12" class="col-2 col-form-label-sm ps-4 mt-1">12개월</label>
								            <div class="col-4">
								                <input type="text" class="form-control disc_price" id="mon12" name="discountedPrice" placeholder="가격">
								            </div>
								            
							            	<label for="mon24" class="col-2 col-form-label-sm ps-4 mt-1">24개월</label>
								            <div class="col-4">
								                <input type="text" class="form-control disc_price" id="mon24" name="discountedPrice" placeholder="가격">
								            </div>
							            	
							        	</div>
							        	<div class="row mt-2 ">
							            	<label for="mon36" class="col-2 col-form-label-sm ps-4 mt-1">36개월</label>
								            <div class="col-4">
								                <input type="text" class="form-control disc_price" id="mon36" name="discountedPrice" placeholder="가격">
								            </div>
							        	</div>
							        	
							        </div>
					            
					            </div>
					        </div>
					        
					        
					
					        <div class="form-group row mt-4">
					            
					            <div class="col-6">
					            <div class="mb-1"><label for="mainImg" class=" col-form-label fw-medium">상품 대표 이미지</label></div>
					                <input type="file" class="form-control-file" id="mainImg" name="mainImg" accept="images/*">
					            </div>
					            
					            <div class="col-6">
					                <div class="mb-1"><label for="itemImgs" class=" col-form-label fw-medium">상품 상세 이미지</label></div>
					                <input type="file" class="form-control-file" id="itemImgs" name="itemImgs" accept="images/*" multiple>
					            </div>
					            
					        </div>
					
					        <div class="form-group row mt-4">
					            
					        </div>
					        
							
					        <!-- <div class="row mt-5">
					        	<div class="col"></div>
					            <div class="col-2 me-0 d-grid">
					                <button type="submit" class="btn btn-primary btn-block btn-dark">등록</button>
					            </div>
					        </div> -->
					    
		        	
		        	</div>
		        	<div class="col-1"></div>
		        </div>

	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">닫기</button>
	        <button type="button" class="btn btn-dark" onclick="registerProduct()">상품 등록</button>
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
				        	<div class="col d-none" id="selectedProductId">  </div>
				        	
				        	
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
							    				<input type="radio" id="ADS_WEEK" name="price" value="9900" checked="checked">
							    			</div>
							    			<div class="col">
							    				 <label for="WEEK">  9,900원 / 7일  </label> 
							    			</div>
						    			</div>
							    		<div class="row mt-3">
							    			<div class="col-1">
							    				 <input type="radio" id="ADS_MONTH" name="price" value="38900">
							    			</div>
							    			<div class="col">
							    				 <label for="month"> 38,900원 / 1개월  </label> 
							    			</div>
						    			</div>
							    		<div class="row mt-3">
							    			<div class="col-1">
							    				<input type="radio" id="ADS_YEAR" name="price" value="19900"> 
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
	        <button type="button" class="btn btn-dark" onclick="processKakaoPay()">결제하기</button>
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




/* document.addEventListener('DOMContentLoaded', function() {
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
}); */



/* function kakaoPay(){

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
} */




// 현재 모달 저장 
let currentModal = document.getElementById('newItemModal');

// 모달 닫기 
function closeModal() {
	  const modalElement = document.getElementById();
	  const myModal = bootstrap.Modal.getOrCreateInstance(currentModal);

	// 테스트 용 

	  myModal.hide();

}
	
function openModal(modalId) {
	currentModal = document.getElementById(modalId);
	console.log(currentModal);
  //const modalElement = document.getElementById();
  const myModal = bootstrap.Modal.getOrCreateInstance(currentModal);
  myModal.show();
}



// 모달 열기 
function checkOutModal(e) {
	
	const myModal = bootstrap.Modal.getOrCreateInstance('#adsModal');
	
	const nameModal = document.getElementById("productName");
	const productId = e.getAttribute("data-product-id");
	const productIdBox = document.getElementById("selectedProductId");
	productIdBox.innerText = productId;
	console.log(productId);
	const nameBox = document.getElementById("prdTitle"+productId);
	productName = nameBox.innerText;
	nameModal.innerText = productName;
	
	myModal.show();
	
}





// 새 창 띄우기 
function openNewWindow(url) {
	  // Define the window features
	  const windowFeatures = "width=600,height=600,resizable=yes,scrollbars=yes";

	  // Open a new window with the specified URL and features
	  window.open(url, "_blank", windowFeatures);
}


function processKakaoPay() {
	
	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			const orderId = response.orderId;
			console.log(response.orderId);

			processPayment(orderId);
			
		}
	}

	// get 방식 
	xhr.open("get", "./getAdsOrderPk");
	xhr.send();
	
	
}



// 결제하기 
function processPayment(orderId) {
	
	const myModal = bootstrap.Modal.getOrCreateInstance('#adsModal');
	myModal.hide();
	
	
	  // Retrieve the selected price from the radio button
	  const selectedRadioButton = document.querySelector('input[name="price"]:checked');
	  const selectedPrice = selectedRadioButton.value;
	  const selectedId = selectedRadioButton.id;
	  const productIdBox = document.getElementById("selectedProductId");
	  const selectedProductId = productIdBox.innerText;
	  
	  const userId = document.getElementById("userId").value;	  
	  
	  
	  console.log(selectedPrice);
	  console.log(userId);
	  console.log(orderId);
	  
	  const cid = "TC0ONETIME";
	  const partner_order_id = orderId;
	  const partner_user_id = userId;
	  const item_name = selectedId;
	  const item_code = selectedProductId;
	  const quantity = 1;
	  const total_amount = selectedPrice;
	  const tax_free_amount = selectedPrice;
	  const approval_url = "http://localhost:8181/safari/rentalBusiness/paymentProcess";
	  const cancel_url = "http://localhost:8181/safari/rentalBusiness/productListPage";
	  const fail_url = "http://localhost:8181/safari/rentalBusiness/productListPage";
	  
	  
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
	        
	       	const tid = response.tid;
	       	
	       	console.log("processPayment");
	       	console.log(cid);
	       	console.log(tid);
	       	console.log(partner_user_id);
	       	console.log(partner_order_id);
	       	
	        saveTidToSession(cid, partner_order_id, partner_user_id, tid, item_name, item_code,response.next_redirect_pc_url);
	        
	        
	      } else {
	        // Payment request failed
	        // Handle the error or display an error message to the user
	      }
	    }
	  };
	  
	  
	  xhr.send("cid="+cid+"&partner_order_id="+partner_order_id+"&partner_user_id="+partner_user_id+"&item_name="+item_name
			  +"&item_code="+item_code+"&quantity="+quantity+"&total_amount="+total_amount+"&tax_free_amount="+tax_free_amount
			  +"&approval_url="+approval_url+"&cancel_url="+cancel_url+"&fail_url="+fail_url);
}


//Save tid to session using AJAX
function saveTidToSession(cid,partner_order_id,partner_user_id,tid, item_name, item_code, next_redirect_pc_url) {
	

   	console.log("saveTidToSession");
   /* 	console.log(cid);
   	console.log(tid);
   	console.log(partner_user_id);
   	console.log(partner_order_id);
   	console.log(next_redirect_pc_url); */
	
    const xhr = new XMLHttpRequest();


    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            
        	openNewWindow(next_redirect_pc_url);
        	
        	
        }
    };
    
    xhr.open("POST", "./saveTidToSession");
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.send("cid="+cid+"&partner_order_id="+partner_order_id+"&partner_user_id="+partner_user_id+"&tid="+tid+"&item_name="+item_name+"&item_code="+item_code);
}







/* 
function savePaymentDetails() {

	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
		}
	}

	

	// post 방식 
	xhr.open("post", "https://kapi.kakao.com/v1/payment/approve");
	xhr.setRequestHeader("Authorization", "KakaoAK 462eff64d0b7c3d7f80e563c1c8805e6");
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
	xhr.send("params");

}
 */




// 상품 등록 

function registerProduct() {
	const modal = bootstrap.Modal.getOrCreateInstance("#newItemModal");
  	const xhr = new XMLHttpRequest();
  	const formData = new FormData();
	
	// 텍스트 데이터 추가
	formData.append('title', document.getElementById('title').value);
	// formData.append('mainCategory', document.getElementById('mainCategory').value);
	formData.append('sub_category_id', document.getElementById('subCategory').value);
	formData.append('item_description', document.getElementById('description').value);
	formData.append('deposit', document.getElementById('deposit').value);
	formData.append('price', document.getElementById('price').value);
	formData.append('quantity', document.getElementById('quantity').value);
 
  	// HTML 코드에서 할인 가격(input 요소)들을 선택합니다.
	const discPriceInputs = document.querySelectorAll('.disc_price');
	// 입력된 값을 추출하여 Integer 배열로 변환합니다.
	const discPrices = Array.from(discPriceInputs).map(input => parseInt(input.value));
	formData.append('discountedPrice', discPrices);


  // 파일 데이터 추가
  const mainImg = document.getElementById('mainImg').files[0];
  if (mainImg) {
    formData.append('mainImg', mainImg);
  }

  const itemImgs = document.getElementById('itemImgs').files;
  for (let i = 0; i < itemImgs.length; i++) {
    formData.append('itemImgs', itemImgs[i]);
  }

  
  
  xhr.onreadystatechange = function() {
    if (xhr.readyState == 4 && xhr.status == 200) {
      const response = JSON.parse(xhr.responseText);
      // 응답 처리
      modal.hide();
      
    }
  }

  xhr.open("POST", "./productRegisterProcess");
  xhr.send(formData);
}




//대분류 카테고리 가져오기

function getMainCategory() {
	
	const mainCategoryBox = document.getElementById("mainCategory");

	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			response.mainCategoryList.forEach(function(category){
				const optionElement = document.createElement('option');
				optionElement.value = category.id;
				optionElement.textContent = category.main_category_name;
				mainCategoryBox.appendChild(optionElement);
			})
			
		}
	}

	// get 방식 
	xhr.open("get", "./getMainCategoryList");
	xhr.send();
	
}


//대분류 카테고리 선택에 따른 소분류 카테고리 가져오기 

const mainCategoryBox = document.getElementById("mainCategory");
mainCategoryBox.addEventListener("change", getSubCategory);
const subCategoryBox = document.getElementById("subCategory");

function getSubCategory() {
	
	let mainCategoryId = mainCategoryBox.value;
	
	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			subCategoryBox.innerHTML = "";
			const option0 = document.createElement("option");
			option0.value = "0";
			option0.textContent = "소분류 선택";
			subCategoryBox.appendChild(option0);
			
			response.subCategoryList.forEach(function(data){
				const option = document.createElement("option");
				option.value = data.id;
				option.textContent = data.sub_category_name;
				subCategoryBox.appendChild(option);
			})
			
			
			
		}
	}

	// get 방식 
	xhr.open("get", "getSubCategoryList?mainCategoryId="+mainCategoryId);
	xhr.send();
	
}



window.addEventListener("DOMContentLoaded",function(){
	getMainCategory();
	
	
	
});


</script>




</body>	
</html>
