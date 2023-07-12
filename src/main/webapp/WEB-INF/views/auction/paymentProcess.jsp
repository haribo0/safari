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
.orangeButton{
	background: #ff6f0f;
	font-weight: bold;
	color: white;
}  
  
</style>

</head>
<body>


<%-- 코인 보유 금액 < 결제금액 --%>
<div class="modal" id="payFailureLowerCoinModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered"> 
    <div class="modal-content">
      <div class="modal-header">
      	
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
      	
      	<div class="row text-center">
    		<div class="col">코인이 부족하여 결제하실 수 없습니다.</div>
       </div>
  
      </div>
      
      <div class="modal-footer">
      	<input type="button" class="btn orangeButton" value="충전하기" onclick="location.href='/safari/user/myCoinPage'">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창닫기</button>
      </div>      
   
    </div>
  </div>
</div>
<%-- 코인 보유 금액 < 결제금액 --%>	
	




<script>

let userCoinBalance = null;

//카카오페이 결제 ready 정보 보내주기
function getAuctionKakaoPayReadyInfo() {

	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			const cid = response.auctionReadyInfo.cid;
			const tid = response.auctionReadyInfo.tid;
			const partner_order_id = response.auctionReadyInfo.partner_order_id;
			const partner_user_id = response.auctionReadyInfo.partner_user_id;
			const quantity = 1;
			const item_name = response.auctionReadyInfo.item_name;
			const pg_token = response.auctionReadyInfo.pg_token;
			
			console.log(cid);
			console.log(tid);
			console.log(partner_order_id);
			console.log(partner_user_id);
			console.log(item_name);
			console.log(pg_token);
			
			
			getAuctionApproveData(cid, tid, partner_order_id, partner_user_id, pg_token);
			
			
		}
	}

		// get 방식 
		xhr.open("get", "/safari/auction/getAuctionKakaoPayReadyInfo");
		xhr.send();

	}



//결제 정보 가져오기
function getAuctionApproveData(cid, tid, partner_order_id, partner_user_id, pg_token) {

	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);

			
			console.log(cid);
			console.log(tid);
			console.log(partner_order_id);
			console.log(partner_user_id);
			console.log(pg_token);

			saveAuctionPaymentData(cid, tid, partner_order_id, 
					partner_user_id, pg_token, response.item_name, 
					response.amount.total, response.payment_method_type);
			
			
			
			
		}
	}

	// post 방식 
	xhr.open("post", "https://kapi.kakao.com/v1/payment/approve");
	xhr.setRequestHeader("Authorization", "KakaoAK 88927c6d047da3940394d71e197276c3");
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
	xhr.send("cid="+cid+"&tid="+tid+"&partner_order_id="+partner_order_id+"&partner_user_id="+partner_user_id+"&pg_token="+pg_token);
}


//결제 정보 저장
function saveAuctionPaymentData(cid, tid, partner_order_id, 
		   						partner_user_id, pg_token, item_name,
		   						amount, payment_method_type) {
	
	// 현재 보유 코인이 amount보다 작으면 결제 정보 저장 막기
	if (userCoinBalance < amount) {
		
		const failModal = bootstrap.Modal.getOrCreateInstance("#payFailureLowerCoinModal");
		failModal.show();
		
		setTimeout(function() { // 3초 뒤 모달 창 삭제
			failModal.hide();
		}, 3000);
		
		window.close();
		return;
	}
	

	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			console.log("savePaymentData::"+response.result);
			
		     // 팝업 창 닫기
	         window.close();

		    
	         // 부모 창으로 이동하여 전체 화면으로 결제 완료 페이지 표시
	       if (window.opener) {
	            window.opener.location.href = "http://localhost:8181/safari/auction/paymentSucceed?id=" + partner_order_id;
	         } else {
	            // window.opener가 없을 경우에는 현재 창을 리다이렉트
	            location.href = "http://localhost:8181/safari/auction/paymentSucceed?id=" + partner_order_id;
	         } 
	
		}
	}


	// post 방식 
	xhr.open("post", "/safari/auction/saveAuctionPaymentInfo");
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.send("cid="+cid+"&tid="+tid+"&partner_order_id="+partner_order_id+"&partner_user_id="+partner_user_id+"&pg_token="+pg_token+"&item_name="+item_name+"&amount="+amount+"&payment_method_type="+payment_method_type);

}

//회원의 현재 보유 코인 조회
function getUserCoinBalance() {
	
		const xhr = new XMLHttpRequest();
		
		const coinBalance = document.getElementById("userCoinBalance");
	
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				const response = JSON.parse(xhr.responseText);
				if(response.result == "success"){
					
					userCoinBalance = response.coins;
					
				}
			}
		}
		
		xhr.open("get", "/safari/user/getUserCoinBalance");
		xhr.send();		
	
}



window.addEventListener("DOMContentLoaded", function(){
	//getSessionId();
	getUserCoinBalance(); 
	
});




// 시작시 실행 
window.addEventListener("DOMContentLoaded",function(){
	 getAuctionKakaoPayReadyInfo();
	

	
});



</script>



</body>	
</html>
