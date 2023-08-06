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
.orangeButton:hover{
	background: #FF812C;
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
							<span>회원님이 현재 보유하신 코인은 
							<span id="coinBalance" class="fw-bold" style="color:#ff6f0f"> </span>원입니다.</span>
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
					<div class="col fw-bold fs-5">
						코인 사용 내역
					</div>
				</div>
				
				<div class="row mt-2 text-secondary opacity-75" >
					<div class="col-auto" id="allCoinHistory" style="cursor: pointer; font-size: 18px;">
						전체
					</div>
					<div class="col-auto" id="chargeCoinHistory" style="cursor: pointer; font-size: 18px;">
						적립
					</div>
					<div class="col-auto" id="usageCoinHistory" style="cursor: pointer; font-size: 18px;">
						사용
					</div>
					
				</div>
				 
				<div class="row mt-2">
					<div class="col">
					
						<div class="row mt-2 fw-medium border-bottom border-black border-2 py-2">
							<div class="col text-center">
								상태
							</div>
							<div class="col text-center">
								금액
							</div>
							<div class="col-4 text-center">
								사용 내역
							</div>
							<div class="col text-center">
								적용일자
							</div>
						</div>
						
						<div class="row mb-5">
							<div class="col" id="coinHistory"></div>
						
						</div>
					
					
						
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
      <div class="modal-header bg-light text-center">
       		<div class="row">
       			<div class="col ms-1 fw-semibold fs-5">
       				코인 충전하기
       			</div>
       		</div>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<div class="row">
      		<div class="col">
		        <select class="form-select form-select-lg mb-3" id="inputCoin" aria-label=".form-select-lg example">
				  <option selected>금액 선택</option>
				  <option value="5000">5,000원</option>
				  <option value="10000">10,000원</option>
				  <option value="30000">30,000원</option>
				  <option value="50000">50,000원</option>
				  <option value="100000">100,000원</option>
				</select>
			</div>
		</div>
		
		<div class="row">
			<div class="col">
				
			
			</div>
		</div>
		
		<div class="row mt-1 px-1">
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
   
   const item_name = "사파리 코인 " + new Intl.NumberFormat('ko-KR').format(total_amount) + "원 충전";
   
   const approval_url = "http://localhost:8181/safari/user/chargeCoinProcess";
   const cancel_url = "http://localhost:8181/safari/user/myCoinPage";
   const fail_url = "http://localhost:8181/safari/user/myCoinPage";
   
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

// 코인 사용 내역 메뉴

const allCoinHistory = document.querySelector("#allCoinHistory");
const chargeCoinHistory = document.querySelector("#chargeCoinHistory");
const usageCoinHistory = document.querySelector("#usageCoinHistory");

allCoinHistory.style.fontWeight = "bold";
allCoinHistory.style.color = "black";

// 선택된 요소 스타일 초기화
function resetHistoryStyle() {
    allCoinHistory.style.fontWeight = "normal";
    allCoinHistory.style.color = "initial";
 
}


// 전체 메뉴 클릭 
document.querySelector("#allCoinHistory").addEventListener("click", function() {
    getCoinUsageHistory("all");
    allCoinHistory.style.fontWeight = "bold";
    allCoinHistory.style.color = "black";
    chargeCoinHistory.style.fontWeight = "normal";
    chargeCoinHistory.style.color = "initial";
    usageCoinHistory.style.fontWeight = "normal";
    usageCoinHistory.style.color = "initial";
});

// 충전 클릭 이벤트 처리
document.querySelector("#chargeCoinHistory").addEventListener("click", function() {
    getCoinUsageHistory("charge");
    document.querySelector("#chargeCoinHistory").style.font.weight = "bold";
    chargeCoinHistory.style.fontWeight = "bold";
    chargeCoinHistory.style.color = "black";
    allCoinHistory.style.fontWeight = "normal";
    allCoinHistory.style.color = "initial";
    usageCoinHistory.style.fontWeight = "normal";
    usageCoinHistory.style.color = "initial";
});

// 사용 클릭 이벤트 처리
document.querySelector("#usageCoinHistory").addEventListener("click", function() {
    getCoinUsageHistory("usage");
    document.querySelector("#usageCoinHistory").style.font.weight = "bold";
    usageCoinHistory.style.fontWeight = "bold";
    usageCoinHistory.style.color = "black";
    
    allCoinHistory.style.fontWeight = "normal";
    allCoinHistory.style.color = "initial";
    chargeCoinHistory.style.fontWeight = "normal";
    chargeCoinHistory.style.color = "initial";
    
});


// 날짜 변환 함수	
function formatTime(timestamp) {
	  const date = new Date(timestamp);
	  const year = date.getFullYear();
	  const month = String(date.getMonth() + 1).padStart(2, '0');
	  const day = String(date.getDate()).padStart(2, '0');
	  let hours = date.getHours();
	  let period = '오전';

	  if (hours >= 12) {
	    hours -= 12;
	    period = '오후';
	  }

	  if (hours === 0) {
	    hours = 12;
	  }

	  const minutes = String(date.getMinutes()).padStart(2, '0');
	  const formattedDate = year + '-' + month + '-' + day + "\u00a0\u00a0" + period + ' ' + hours + ':' + minutes;
	  return formattedDate;
	}

// 코인 사용 내역 조회
function getCoinUsageHistory(type) {
   
    const xhr = new XMLHttpRequest();
    const url = "/safari/user/getCoinUsageHistory?type=" + type; 

    // 응답 처리
    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                const response = JSON.parse(xhr.responseText);
                
                const coinHistorySpace = document.querySelector("#coinHistory");
                coinHistorySpace.innerHTML = "";
                
            	if (response.coinHistoryCount == 0) {
            	     
                	const row = document.createElement("div");
                	row.classList.add("row", "border-bottom",  'py-2');
                	
                	const col = document.createElement("div");
                	col.classList.add("col", "text-center");
                	col.setAttribute("colspan", "4");
                	col.innerText = "코인 사용 내역이 없습니다.";
                	
                	row.appendChild(col);
         
                	coinHistorySpace.appendChild(row);
                	
               	} else {
                
	                for(const data of response.coinHistoryList) {
	                	
	                	const row = document.createElement("div");
	                	row.classList.add("row", 'border-bottom', "py-2", "mb-1");
	                	
	                	const statusCol = document.createElement("div");
	                	statusCol.classList.add("col", "text-center");
	                	
	                	if (data.transaction_operand == 'P') {
	                		statusCol.innerText = "적립";
	                		statusCol.style.color = "#0377fc";
	                	} else {
	                		statusCol.innerText = "사용";
	                		statusCol.style.color = "#fc3503";
	                	}
	                	
	                	row.appendChild(statusCol);
	                	
	                	const priceCol = document.createElement("div");
	                	priceCol.classList.add("col", "text-center");
	                	
	                 	if (data.transaction_operand == 'P') {
	                 		
	                 		priceCol.innerText = 
	                				"+ " + new Intl.NumberFormat('ko-KR').format(data.coin_transaction) + " 원";
	                 		priceCol.style.color = "#0377fc";
	                		
	                	} else {
	                		priceCol.innerText = 
	                			"- " + new Intl.NumberFormat('ko-KR').format(data.coin_transaction) + " 원";
	                		priceCol.style.color = "#fc3503";
	                	}
	                 	
	                 	row.appendChild(priceCol);
	                 	
	                  	const detailCol = document.createElement("div");
	                  	detailCol.classList.add("col-4" , "text-center");
	                  	
	                  	detailCol.innerText = data.transaction_detail;
	                  	
	                  	row.appendChild(detailCol);
	                  	
	                 	
	                  	const regdateCol = document.createElement("div");
	                  	regdateCol.classList.add("col", "text-center");
	                  	
	                  	regdateCol.innerText = formatTime(data.reg_date);
	                  	
	                  	row.appendChild(regdateCol);
	                  	
	                  	coinHistorySpace.append(row);
                	}
               	}
                
            } else {
                // 에러 처리
                console.error("Error: " + xhr.status);
            }
        }
    };
    
    xhr.open("get", url);
    xhr.send();
}



	
function openModal() {
	const modal = bootstrap.Modal.getOrCreateInstance('#modalCoin');
	modal.show();
}

window.addEventListener("DOMContentLoaded", function(){
	getSessionId();
	getCoinBalance(); 
	getCoinUsageHistory("all");
	
});
</script>
</body>	
</html>