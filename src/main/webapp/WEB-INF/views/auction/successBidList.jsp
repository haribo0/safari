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

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<link rel="stylesheet" href="/safari/resources/style/common.css" type="text/css">
<link rel="stylesheet" href="/safari/resources/style/auction.css" type="text/css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<style>

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
					<h5>낙찰 목록</h5>						
				</div>
			</div>
			
			<div class="row mt-4">
				<div class="col">
				
					<div class="row">
						<div class="col">
							<span>
								<img class="mb-1" src="/safari/resources/img/auction/notice.png"
									style="max-width: 25px; max-height: 25px;"></span>
									<span class="fw-bold fs-5">참고사항</span>
						
						</div>
					</div>	
					
					<div class="row">
						<div class="col">
							낙찰하신 후 <span class="fw-bold text-danger">7일 이내</span>에 결제하셔야 판매자로부터 제품을 수령받으실 수 있습니다.
						</div>
					</div>		
					
					<div class="row mt-4 mb-2">
						<div class="col fw-bold fs-5">
						    내가 낙찰한 경매 목록
						</div>
					</div>										
						
				<div class="row mt-3 ms-1">
					<div class="col">
					
					
						<div class="row fw-medium border-bottom border-black border-2 py-2">
							<div class="col-5 text-center">상품정보</div>
							<div class="col text-center">낙찰가</div>
							<div class="col text-center">낙찰시간</div>
							<div class="col text-center">경매종료일</div>
							<div class="col text-center">상태</div>
						</div>
						
						  <c:if test="${empty successBidList}">
						       <div class="row border-bottom py-2">
							   <div class="col text-center" colspan="5">
						            낙찰 정보가 없습니다.
						        </div>
						       </div>
						    </c:if>	
						
						
						 <c:forEach items="${successBidList}" var="bidDto">
							<input type="hidden" id="user_id_${bidDto.auction_item_id}" value="${sessionUser.id}">
								<div class="row border-bottom py-2">
									<div class="col-5">
										<div class="row">
										
											<input type="hidden" id="bid_${bidDto.auction_item_id}" value="${bidDto.id}">
											<div class="col" id="aid_${bidDto.auction_item_id}" style="float: left;">
												
												<a href="/safari/auction/productDetail/${bidDto.auction_item_id}">
												<img 
												src="/auctionFiles/${bidDto.auction_item_img_link}" style="
												width: 120px; height: 120px;"></a>
											</div>
											<div class="col-8" class="text-start">
												<div class="row mt-4">
													<div class="col" style="font-size: 14px;">
														${bidDto.main_category_name} > ${bidDto.sub_category_name}
													</div>
												</div>
												<div class="row">
													<div class="col fw-bold">
													<input type="hidden" value="${bidDto.auction_item_id}">
														<span style="font-size: 16px;"><a href="/safari/auction/productDetail/${bidDto.auction_item_id}">
														${bidDto.title}</a></span>
													<input type="hidden" id="title_${bidDto.auction_item_id}" value="${bidDto.title}">	
													</div>
												</div>
											</div>									
										</div>
									</div>	
									
									<div class="col mt-3 text-center fw-bold text-danger">
										<div class="row mt-4">
											<div class="col">
												<fmt:formatNumber value="${bidDto.bid_price}"  pattern="#,###"/>원
												<input type="hidden" id="bid_price_${bidDto.auction_item_id}" value="${bidDto.bid_price}">
											</div>
										</div>
									</div>
									
									<div class="col mt-2 text-center">
										<div class="row mt-4">
											<div class="col">
												<fmt:formatDate value="${bidDto.reg_date}" pattern="yyyy.MM.dd" />
												<br>
												<fmt:formatDate value="${bidDto.reg_date}" pattern="a hh:mm" />
												</div>
										</div>
									</div>
									
									<div class="col mt-2 text-center">
										<div class="row mt-4">
											<div class="col">
												<fmt:formatDate value="${bidDto.end_date}" pattern="yyyy.MM.dd" />
												<br>
												<fmt:formatDate value="${bidDto.end_date}" pattern="a hh:mm" />
											</div>
										</div>
									</div>
									
									<div class="col mt-3 text-center" id="myStatus_${bidDto.id}">
									</div>						
								
								</div>
							</c:forEach>
							

						</div>
					</div>						
						
					<div class="row mt-5">
						<div class="col">
							
							<div class="row mt-2 ms-2">
								<div class="col">
									<div class="row fw-bold fs-5">
										<div class="col">
											 
										</div>
									</div>
								
								</div>
							</div>
							
						</div>
						<div class="col-1"></div>
						<div class="col">
							
						</div>			
					</div>						
					
						
				
				
				</div>
			</div>
			
			
		
		
		</div>
	</div>
	</div>
	


	
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->
	


<script>


//새 창 띄우기 
 function openNewWindow(url) {
 	  // Define the window features
 	  const windowFeatures = "width=600,height=600,resizable=yes,scrollbars=yes";

 	  // Open a new window with the specified URL and features
 	  const childWindow = window.open(url, "_blank", windowFeatures);
 	  
 	  // Add an event listener to the child window's unload event
 	  childWindow.addEventListener("unload", function() {
 	     
 	  });
 		  
 	  
 	  // Return the child window object
 	  return childWindow;
 }
 
 

// 카카오페이 결제 창
function kakaoPayModal(index) {
		
   const cid = 'TC0ONETIME';
   const partner_order_id = document.getElementById("bid_" + index).value;
   const partner_user_id = document.getElementById("user_id_" + index).value;
   const item_name = document.getElementById("title_" + index).value;
   //const item_code = document.getElementById("aid_" + index).value;
   const quantity = 1;
   const total_amount = document.getElementById("bid_price_" + index).value;
   const tax_free_amount = 0;
   const approval_url = "http://localhost:8181/safari/auction/paymentProcess";
   const cancel_url = "http://localhost:8181/safari/auction/successBidList";
   const fail_url = "http://localhost:8181/safari/auction/successBidList";
   
   const xhr = new XMLHttpRequest();
   
   xhr.onreadystatechange = function() {
	   if (xhr.readyState === XMLHttpRequest.DONE) {
	   if (xhr.status === 200) {
           const response = JSON.parse(xhr.responseText);

           // tid 무조건 받아와야함.
           const tid = response.tid;
          	
          
           	
            const width = 600;
            const height = 600;
            const left = (window.screen.width - width) / 2;
            const top = (window.screen.height - height) / 2;
            const windowFeatures = "width=" + width + ",height=" + height + ",top=" + top + ",left=" + left + ",location=no,status=no,scrollbars=yes";
            const paymentWindow = window.open(response.next_redirect_pc_url, "_blank", windowFeatures);
            
            if (paymentWindow) {
               // 팝업이 정상적으로 열린 경우
               paymentWindow.focus();
            } else {
               // 팝업이 차단되었을 경우
               alert("팝업 차단이 감지되었습니다. 결제를 진행하려면 팝업 차단을 해제해주세요.");
            }
         	
      
         	
            // tid를 세션에 저장
            saveAuctionTidToSession(cid, partner_order_id, partner_user_id, tid, item_name, response.next_redirect_pc_url);
           
       } else {
    	   
       }
	   }
   };	
   
   
   xhr.open("POST", "https://kapi.kakao.com/v1/payment/ready");
   xhr.setRequestHeader("Authorization", "KakaoAK 88927c6d047da3940394d71e197276c3");
   xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
   xhr.send("cid="+cid+"&partner_order_id="+partner_order_id+"&partner_user_id="+partner_user_id+"&item_name="+item_name+
		   "&quantity="+quantity+"&total_amount="+total_amount+"&tax_free_amount="+tax_free_amount+
		   "&approval_url="+approval_url+"&cancel_url="+cancel_url+"&fail_url="+fail_url);
 
}


// tid 세션에 저장
 function saveAuctionTidToSession(cid, partner_order_id, partner_user_id, tid, item_name, 
		 next_redirect_pc_url) {
	
	 	const xhr = new XMLHttpRequest();


	    xhr.onreadystatechange = function() {
	        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
	            
	        	//openNewWindow(next_redirect_pc_url);
	        	//window.open(next_redirect_pc_url, "_blank");
	        	
	        }
	    };
	    
	    xhr.open("post", "/safari/auction/saveAuctionTidToSession");
	    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	    xhr.send("cid="+cid+"&partner_order_id="+partner_order_id+"&partner_user_id="+partner_user_id+"&tid="+tid+"&item_name="+item_name);	
		
}


function getMySuccessfulBidPayAndDeliveryStatusList() {
	
	
	const xhr = new XMLHttpRequest();
	  xhr.onreadystatechange = function() {
	    if (xhr.readyState === 4 && xhr.status === 200) {
	      const response = JSON.parse(xhr.responseText);
	      
	      for (data of response.myStatusList) {
	    	  
	    	  let myStatus = document.getElementById("myStatus_" + data.id);
	    	  myStatus.innerHTML = "";
	    	  
	    	  // 결제를 하지 않았을 경우
	    	  if (data.payment_exists == 'No') {
	    		  
	    		  
	    		  const row  = document.createElement("div");
	    		  row.classList.add("row", "mt-4");
	    		  
	    		  const col  = document.createElement("div");
	    		  col.classList.add("col");
	    		  
	    		  const payButton = document.createElement("input");
	    		  payButton.type = "button";
	    		  payButton.classList.add("btn", "btn-sm", "btn-dark", "opacity-50");
	    		  payButton.value = "결제하기";
	   
	    		  payButton.onclick = function (id) {
    	                return function () {
    	                	kakaoPayModal(id);
    	                };
    	              }(data.auction_item_id);
    	          
    	          col.appendChild(payButton);
    	          
    	          row.appendChild(col);
	              
    	          myStatus.appendChild(row);    
	    	  } 
	    	  // 결제를 하였을 경우
	    	  else {
	    		  const deliveryRegDate = new Date(data.delivery_reg_date);
	    		  const threeDaysLater = new Date(deliveryRegDate.setDate(deliveryRegDate.getDate() + 2));
	    		  // 나중에 3일로 변경해야함. (임시로 2일로 설정)
	    		  
	    		  const nowDate = new Date();
	    		  
	    		  // 배송처리가 되지 않았을 경우
	    		  if (data.delivery_exists == 'No') {
	    			  	const row = document.createElement("div");
    				  	row.classList.add("row", "mt-4");
    				  	
    				  	const col = document.createElement("div");
    				  	col.classList.add("col");
    				  	
    				  	col.innerText = "배송준비중";
    				  	
    				  	row.appendChild(col);
    				  	myStatus.appendChild(row);
    				  	
    				  	
	    		  } 
	    		  // 배송처리가 되었을 경우
	    		  else if (data.delivery_reg_date){
	    			  // 배송한지 3일이 지났을 때
	    			  if (nowDate > threeDaysLater) {
							
	    				  	// 배송완료 처리하기 전에 db에 배송완료 여부 확인 (중복 insert 방지하기 위함)
	    				    selectAuctionDeliveryStatusBeforeComplete(data.id);
	    				    
	    				    // 구매확정이 되었을 때
	    				    if (data.purchase_confirmed == 'Yes') {
	    				    	
	    				    	
	    				    	const row = document.createElement("div");
		    				  	row.classList.add("row", "mt-4");
		    				  	
		    				  	const col = document.createElement("div");
		    				  	col.classList.add("col");
		    				  	
		    				  	col.innerText = "구매확정";
		    				  	
		    				  	row.appendChild(col);
		    				  	myStatus.appendChild(row);
	    				    } 
	    				    // 구매확정이 아직 되지 않았을 때
	    				    else {
	    				    
	    				    
	    				  	const row = document.createElement("div");
	    				  	row.classList.add("row");
	    				  	
	    				  	const col = document.createElement("div");
	    				  	col.classList.add("col");
	    				  	
	    				  	col.innerText = "배송완료";
	    				  	
	    				  	row.appendChild(col);
	    				  	myStatus.appendChild(row);
	    				  	
	    				  	const row2 = document.createElement("div");
	    				  	row2.classList.add("row", "mt-1");
	    				  	
	    				  	const col2 = document.createElement("div");
	    				  	col2.classList.add("col");
	    				  	
	    					const buyButton = document.createElement("input");
	    					buyButton.type = "button";
	    					buyButton.classList.add("btn", "btn-sm", "btn-outline-secondary");
	    					buyButton.value = "구매확정";
	    				
	    					
	    					buyButton.onclick = function (id) {
		    	                return function () {
		    	                	getDeliverypkByBidpk(id);
		    	                };
		    	              }(data.id);
		    	              
	    					
	    					col2.appendChild(buyButton);
	    					
	    					row2.appendChild(col2);
	    					
	    					myStatus.appendChild(row2);
	    					
	      				  	const row3 = document.createElement("div");
	    				  	row3.classList.add("row", "mt-1");
	    				  	
	    				  	const col3 = document.createElement("div");
	    				  	col3.classList.add("col");
	    				  	
	    					const refundButton = document.createElement("input");
	    					refundButton.type = "button";
	    					refundButton.classList.add("btn", "btn-sm", "btn-outline-secondary");
	    					refundButton.value = "반품신청";
	    					
	    					col3.appendChild(refundButton);
	    					
	    					row3.appendChild(col3);
	    					
	    					myStatus.appendChild(row3);
	    				   }
	    				  	
	    			        
	    			    } 
	    			  // 배송처리는 되었지만 아직 배송완료 x
	    			  else {
	    			    	
	    			    	const row = document.createElement("div");
	    				  	row.classList.add("row", "mt-2");
	    				  	
	    				  	const col = document.createElement("div");
	    				  	col.classList.add("col");
	    				  	col.innerText = "배송중";
	    				  	
	    				  	row.appendChild(col);
	    				  	
	    				 	const row2 = document.createElement("div");
	    				  	row2.classList.add("row", "mt-1");
	    				  	
	    				  	const col2 = document.createElement("div");
	    				  	col2.classList.add("col");
	    				  	
	    					const selectButton = document.createElement("input");
	    					selectButton.type = "button";
	    					selectButton.classList.add("btn", "btn-sm", "btn-outline-secondary");
	    					selectButton.value = "배송조회";
	    					
	    					col2.appendChild(selectButton);
	    					row2.appendChild(col2);
	    					
	    					myStatus.appendChild(row);
	    					myStatus.appendChild(row2);
	    			    }
	    		  }
	    		  
	    	  }
	      }
	      
	      
	    }
	  }
	  xhr.open("get", "/safari/auction/getMySuccessfulBidPayAndDeliveryStatusList");
      xhr.send();
	
}

// 배송완료 처리하기 전에 배송 상태 확인
function selectAuctionDeliveryStatusBeforeComplete(id) {
	
	const xhr = new XMLHttpRequest();
	  xhr.onreadystatechange = function() {
	    if (xhr.readyState === 4 && xhr.status === 200) {
	      const response = JSON.parse(xhr.responseText);
	      
	      if (response.deliveryStatus.delivery_status != '배송완료'){
	    	  renewAuctionDeliveryComplete(id);
	      }
	      
	    }
	  }
	  xhr.open("get", "/safari/auction/checkAutionDeliveryStatus?partnerOrderId=" +id);
      xhr.send();
	      
	
}

// 배송완료 처리
function renewAuctionDeliveryComplete(id) {
	
	const xhr = new XMLHttpRequest();
	  xhr.onreadystatechange = function() {
	    if (xhr.readyState === 4 && xhr.status === 200) {
	      if(response.result == "success") {
	      	const response = JSON.parse(xhr.responseText);
	      }
	      
	    }
	  }
	  xhr.open("get", "/safari/auction/completeAuctionDelivery?partnerOrderId=" +id);
      xhr.send();
	      
	
}

// 낙찰 pk로 배송 pk 받아서 구매확정 처리
/* function getDeliverypkByBidpkByPurchageCheck(id) {
	
	const xhr = new XMLHttpRequest();
	  xhr.onreadystatechange = function() {
	    if (xhr.readyState === 4 && xhr.status === 200) {
	      const response = JSON.parse(xhr.responseText);
	      
	      // 배송 pk 받고 구매 확정 처리
	      purchageConfirmed(id, response.deliveryStatus.id);
	    }
	  } 
	
      xhr.open("get", "/safari/auction/checkAutionDeliveryStatus?partnerOrderId=" +id);
      xhr.send();
}
  */


// 구매확정 - 낙찰 pk를 받아와서 배송 pk 받아오기
function getDeliverypkByBidpk(id) {
	
	const xhr = new XMLHttpRequest();
	  xhr.onreadystatechange = function() {
	    if (xhr.readyState === 4 && xhr.status === 200) {
	      const response = JSON.parse(xhr.responseText);
	      
	      // 배송 pk 받고 구매 확정 처리
	      purchageConfirmed(id, response.deliveryStatus.id);
	    }
	  } 
	
      xhr.open("get", "/safari/auction/checkAutionDeliveryStatus?partnerOrderId=" +id);
      xhr.send();
}


// 구매 확정 여부 조회
/* function checkPurchaseConfirmed(id) {
	
	const xhr = new XMLHttpRequest();
	  xhr.onreadystatechange = function() {
	    if (xhr.readyState === 4 && xhr.status === 200) {
	    
	    	const response = JSON.parse(xhr.responseText);
	    	
	    	if (response.checkYn >= 1) {
	    		
	    	} else {
	    		
	    	}
	    	
	    }
	  } 
	
	  xhr.open("get", "/safari/auction/checkPurchaseConfirmed?partnerOrderId=" + id);
	  xhr.send();
} */


// 구매 확정 처리
function purchageConfirmed(id, deliveryId) {
	
	const xhr = new XMLHttpRequest();
	  xhr.onreadystatechange = function() {
	    if (xhr.readyState === 4 && xhr.status === 200) {
	    
	      	
	        let myStatusNew = document.getElementById("myStatus_" + id);
	        myStatusNew.innerHTML = ""; 

	        const buyRow = document.createElement("div");
	        buyRow.classList.add("row", "mt-4");
	        
	        const buyCol = document.createElement("div");
	        buyCol.classList.add("col");
	        
	        
	        buyCol.innerText = "구매확정";
	        
	        buyRow.appendChild(buyCol);
	        
	        myStatusNew.appendChild(buyRow);
	      	
	      	
	      
	    }
	  }
	  
     xhr.open("get", "/safari/auction/registerPurchaseConfirmed?auctionDeliveryAfterPaymentId=" + deliveryId + "&id="+id);
     xhr.send();
}



window.addEventListener("DOMContentLoaded", function(){

	getMySuccessfulBidPayAndDeliveryStatusList();
});





</script>




<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	
</body>
</html>