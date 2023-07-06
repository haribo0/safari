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
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->

	<div class="container main_box">
		<div class="row">
			<div class="col ms-5">
		    	
		    	<!--  <h4 class="row mt-3 mb-4 fw-regular">결제 완료</h4>

				<div class="row mt-4">
					<div class="col">
					
						<div class="card">
						  <div class="card-body">
						  	<div class="row mt-4">
						  		<div class="col">
							  	
							  	</div>
						  		<div class="col-4 text-center">
							  		<span class="fs-2"><i class="bi bi-lg bi-check-circle"></i></span>
							  		<div class="fs-4 fw-medium mt-1">결제 완료</div>
							  		
							  		<div class="fs-6 text-start mt-5">결제 ID</div>
							  		<div class="fs-5 fw-light text-start mt-1">결제 완료</div>
							  		
							  		<div class="fs-6 text-start mt-4">결제 수단</div>
							  		<div class="fs-5 fw-light text-start mt-1">결제 완료</div>
							  		
							  		<div class="fs-6 text-start mt-4">결제 금액</div>
							  		<div class="fs-5 fw-light text-start mt-1">결제 완료</div>
							  		
							  		<div class="fs-6 text-start mt-5"> </div>
							  		<div class="fs-5 fw-light text-start mb-5"> </div>
							  		
							  		<div class=" row">
							  			<div class="  d-grid">
							  				<a href="./productListPage" class="btn btn-dark">확인</a>
							  			</div>
							  		</div>
							  		
							  		
							  		<div class="fs-5 text-start mt-4"> </div>
							  		<div class="fs-5 text-start mb-5"> </div>
							  		
							  	</div>
						  		<div class="col">
							  	
							  	</div>
						  	</div>
						  </div>
						</div>

					
					</div>
				</div>  -->
			
			</div>
		
		</div>
	</div>
	
	
	
	




<script>



/* function getPgToken() {
  // 저장할 결제 토큰 및 관련 정보
  const pg_token = getValueFromQueryString("pg_token"); // query string에서 결제 토큰 추출
  console.log(pg_token);

  
  
  // DB에 결제 토큰 및 관련 정보 저장 로직 - 세션에 나머지 정보가 있으니 토큰만 보내주면 DB에 저장 가능 
  // savePaymentInfoToDB(pg_token);

  // 새로 열린 창 닫기
  window.close();

  // 기존 창으로 리디렉션
  window.location.href = "http://localhost:8181/safari/rental/productListPage";
} */

/* 
function getValueFromQueryString(v) {
	  // 현재 페이지의 query string을 가져옵니다.
	  const queryString = window.location.search;
	  
	  // query string에서 원하는 파라미터 찾기 
	  const urlParams = new URLSearchParams(queryString);
	  const value = urlParams.get(v);
	  
	  return value;
}


function sendPgToken() {
	
	const pgToken = getValueFromQueryString("pg_token");
	
	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			getKakaoPayReadyInfo();
			  
			
		}
	}



	// post 방식 
	xhr.open("post", "./saveTokenToSession");
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.send("pg_token="+pgToken);
} */




function getKakaoPayReadyInfo() {

	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			const cid = response.readyInfo.cid;
			const tid = response.readyInfo.tid;
			const partner_order_id = response.readyInfo.partner_order_id;
			const partner_user_id = response.readyInfo.partner_user_id;
			const pg_token = response.readyInfo.pg_token;
			const item_name = response.readyInfo.item_name;
			const item_code = response.readyInfo.item_code;
			const amount = 1;
			
			console.log(cid);
			console.log(tid);
			console.log(partner_order_id);
			console.log(partner_user_id);
			console.log(pg_token);
			
			getApproveData(cid,tid,partner_order_id,partner_user_id,pg_token,item_name,item_code,amount);
			
			
		}
	}

	// get 방식 
	xhr.open("get", "./getKakaoPayReadyInfo");
	xhr.send();

}






function getApproveData(cid,tid,partner_order_id,partner_user_id,pg_token, item_name, item_code, amount) {
	
	/* console.log(cid);
	console.log(tid);
	console.log(partner_order_id);
	console.log(partner_user_id);
	console.log(pg_token); */
	
	
	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			console.log("getApproveData::"+response);
			
			
			/* console.log(response);
			
			console.log(response.payment_method_type);
			console.log(response.partner_order_id);
			console.log("amount::"+response.amount);
			console.log("amount::"+response.amount.total);
			console.log("card_info::"+response.card_info);
			console.log(response.item_name);
			console.log(response.item_code);
			console.log(response.created_at);
			console.log(response.approved_at); */
			
			savePaymentData(cid,tid,partner_order_id,partner_user_id,pg_token, item_name, item_code, amount, response.payment_method_type)
			
			
		}
	}

	// post 방식 
	xhr.open("post", "https://kapi.kakao.com/v1/payment/approve");
	xhr.setRequestHeader("Authorization", "KakaoAK 462eff64d0b7c3d7f80e563c1c8805e6");
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
	xhr.send("cid="+cid+"&tid="+tid+"&partner_order_id="+partner_order_id+"&partner_user_id="+partner_user_id+"&pg_token="+pg_token);
}


function savePaymentData(cid,tid,partner_order_id,partner_user_id,pg_token,item_name,item_code,amount,payment_method_type) {
	

	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			console.log("savePaymentData::"+response.result);
			
			location.href = "http://localhost:8080/safari/used/paymentSucceeded?orderId="+partner_order_id;
			
		}
	}


	// post 방식 
	xhr.open("post", "./saveOrderAndPaymentInfo");
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.send("cid="+cid+"&tid="+tid+"&partner_order_id="+partner_order_id+"&partner_user_id="+partner_user_id+"&pg_token="+pg_token+"&item_name="+item_name+"&item_code="+item_code+"&amount="+amount+"&payment_method_type="+payment_method_type);

}



/* function closeAndRedirect(partner_order_id) {
	
	function closeAndRedirect(partner_order_id) {
		
		
		// 기존 창으로 리디렉션
		location.href = "http://localhost:8080/safari/used/paymentSucceeded?orderId="+partner_order_id;
		
	}
	
	
} */






// 시작시 실행 
window.addEventListener("DOMContentLoaded",function(){
	getKakaoPayReadyInfo();
	

	
});



</script>



</body>	
</html>
