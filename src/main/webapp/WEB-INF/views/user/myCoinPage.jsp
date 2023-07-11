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
						<h5>코인 관리</h5>		
					</div>
				</div>
				
				<div class="row mt-4">
					<div class="col fs-5 fw-bold">
						코인 보유 금액
					</div>
				</div>
				
				<div class="row mt-2">
					<div class="col fs-5">
						<div>
							<span>회원님이 보유하신 코인은 <span id="coinBalance" style="color:#ff6f0f"> </span>원입니다.</span>
							<span></span>
						</div>
						
						<div class="mt-3">
							<button class="btn orangeButton" onclick="openModal()">충전하기</button>					
						</div>
					</div>
				</div>
				
				<div class="row mt-1">
					<div class="col"></div>
				</div>
				
				<div class="row mt-5">
					<div class="col fs-5 fw-bold">
						코인 충전 내역
					</div>
				</div>
				
				<div class="row mt-2">
					<div class="col">
						
				<div class="row mt-3 mb-2 fw-medium">
					<div class="col text-center">
						번호
					</div>
					<div class="col">
						충전금액
					</div>
					<div class="col-4">
						상세설명
					</div>
					<div class="col">
						충전일자
					</div>
				</div>
				
				<hr class="border border-black border-1 opacity-100">
				
				      <c:if test="${empty chargeCoinHistoryList}">
				            <div class="row mt-3 mb-1">
				                <div class="col text-center colspan="4">
				                    충전하신 내역이 없습니다.
				                </div>
				            </div>
				            <hr class="border border-1 opacity-50">
				        </c:if>

				
					<c:forEach var="map" items="${chargeCoinHistoryList}">
							
						<div class="row mt-3 mb-1">
							
							<div class="col text-center">
								${map.id}
							</div>
							<div class="col">
							<fmt:formatNumber value="${map.coin_transaction}"  pattern="#,###"/>원
								
							</div>
							<div class="col-4">
								${map.transaction_detail}
							</div>
							<div class="col">
								<fmt:formatDate value="${map.reg_date}" pattern="yyyy-MM-dd  a  hh:mm" />
								
							</div>
		
						</div>
						
						<hr class="border border-1 opacity-50">
						
					
					</c:forEach>						
							
						
					</div>
				</div>
				
				
				<div class="row mt-5">
					<div class="col fs-5 fw-bold">
						코인 사용 내역
					</div>
				</div>
				
				
				<div class="row mt-2">
					<div class="col">
						
				<div class="row mt-3 mb-3 fw-medium">
					<div class="col text-center">
						번호
					</div>
					<div class="col">
						사용금액
					</div>
					<div class="col-4">
						상세설명
					</div>
					<div class="col">
						사용일자
					</div>
				</div>
				
				<hr class="border border-black border-1 opacity-100">
				
				      <c:if test="${empty coinTransactions}">
				            <div class="row mt-3 mb-1">
				                <div class="col text-center colspan="4">
				                    사용 내역이 존재하지 않습니다.
				                </div>
				            </div>
				            <hr class="border border-1 opacity-50">
				        </c:if>

				
					<c:forEach var="map" items="${coinTransactions}">
							
						<div class="row mt-3 mb-1">
							
							<div class="col text-center">
								${map.id}
							</div>
							<div class="col">
							<fmt:formatNumber value="${map.coin_transaction}"  pattern="#,###"/>원
								
							</div>
							<div class="col-4">
								${map.transaction_detail}
							</div>
							<div class="col">
								<fmt:formatDate value="${map.reg_date}" pattern="yyyy-MM-dd  a  hh:mm" />
								
							</div>
		
						</div>
						
						<hr class="border border-1 opacity-50">
						
					
					</c:forEach>						
							
						
					</div>
				</div>
				
				
			</div>
		</div>
		
	</div>
	
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->
	
	
<!-- 코인 충전 모달 -->
<div class="modal" id="modalCoin" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">코인 충전하기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<div class="row">
      		<div class="col">
		        <select class="form-select form-select-lg mb-3" id="inputCoin" aria-label=".form-select-lg example">
				  <option selected>금액 선택</option>
				  <option value="5000">5000</option>
				  <option value="10000">10000</option>
				  <option value="30000">30000</option>
				  <option value="50000">50000</option>
				  <option value="100000">100000</option>
				</select>
			</div>
		</div>
		
		<div class="row mt-1 ms-1">
			<div class="col">
				코인은 한 번에 최대 <span class="fw-bold">100,000원</span>까지 충전하실 수 있습니다.
			</div>
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn orangeButton" onclick="onChargeCoin()">충전하기</button>
      </div>
    </div>
  </div>
</div>
<!-- 코인 충전 모달 -->

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

// 코인 충전 
/* function onChargeCoin() {
	const inputCoin = document.querySelector('#inputCoin')
	console.log(inputCoin.value)
	
	const xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			if(response.result == "success"){
				console.log(response.resultKakao)
			}
		}
	}
	
	
	xhr.open("post", "./chargeCoinKakao");
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); 
	xhr.send("total="+inputCoin);

	
} */


// 코인 충전 pk 받아오기
function onChargeCoin() {
	
	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			const orderId = response.partnerOrderId;
			
			chargeCoinProcess(orderId);
			
		}
	}

	xhr.open("get", "/safari/user/getOnChargeCoinPk");
	xhr.send();
}



// 코인 충전하기
function chargeCoinProcess(orderId){
		
   
   const cid = 'TC0ONETIME';
   const partner_order_id = orderId;
   const partner_user_id = mySessionId;
  
   
   const quantity = 1;
   const total_amount = document.querySelector('#inputCoin').value; // 충전 금액
   const tax_free_amount = 0;
   
   const item_name = "사파리 코인 " + new Intl.NumberFormat('ko-KR').format(total_amount) + "원 충전하기";
   
   const approval_url = "http://localhost:8181/safari/user/chargeCoinProcess";
   const cancel_url = "http://localhost:8181/safari/user/myCoinPage";
   const fail_url = "http://localhost:8181/safari/user/myCoinPage";
   
   // 잘 찍히는지 확인
   console.log(cid);
   console.log(partner_order_id);
   console.log(partner_user_id);
   console.log(total_amount);
   console.log(quantity);
   console.log(tax_free_amount);
   console.log(approval_url);
   console.log(cancel_url);
   console.log(fail_url);
   
 
   
   const xhr = new XMLHttpRequest();
   
   xhr.onreadystatechange = function() {
	   if (xhr.readyState === XMLHttpRequest.DONE) {
	   if (xhr.status === 200) {
           const response = JSON.parse(xhr.responseText);

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
            saveChargeCoinTidToSession(cid, partner_order_id, partner_user_id, tid, item_name, response.next_redirect_pc_url);
           
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
	
//tid 세션에 저장하기
function saveChargeCoinTidToSession(cid, partner_order_id, partner_user_id, tid, item_name, 
		 next_redirect_pc_url) {
	
	 	const xhr = new XMLHttpRequest();


	    xhr.onreadystatechange = function() {
	        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
	            
	        	
	        	
	        }
	    };
	    
	    xhr.open("post", "/safari/user/saveChargeCoinTidToSession");
	    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	    xhr.send("cid="+cid+"&partner_order_id="+partner_order_id+"&partner_user_id="+partner_user_id+"&tid="+tid+"&item_name="+item_name);	
		
}	
	
	
//회원의 현재 보유 코인 조회
function getCoinBalance() {
	
		const xhr = new XMLHttpRequest();
		
		const coinBalance = document.getElementById("coinBalance");
	
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				const response = JSON.parse(xhr.responseText);
				if(response.result == "success"){
					coinBalance.innerText = new Intl.NumberFormat('ko-KR').format(response.coins);
				}
			}
		}
		
		xhr.open("get", "/safari/user/getUserCoinBalance");
		xhr.send();		
	
}


	
function openModal() {
	const modal = bootstrap.Modal.getOrCreateInstance('#modalCoin');
	modal.show();
}

window.addEventListener("DOMContentLoaded", function(){
	getSessionId();
	getCoinBalance(); 
	
});
</script>
</body>	
</html>