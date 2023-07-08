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
	
	




<script>


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
			//const item_code = response.auctionReadyInfo.item_code;
			const pg_token = response.auctionReadyInfo.pg_token;
			

			
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
			console.log(response.item_name);
			console.log(response.amount);
			console.log(response.payment_method_type);

			saveAuctionPaymentData(cid, tid, partner_order_id, 
					partner_user_id, pg_token, response.item_name, 
					response.amount, response.payment_method_type);
			
			
		}
	}

	// post 방식 
	xhr.open("post", "https://kapi.kakao.com/v1/payment/approve");
	xhr.setRequestHeader("Authorization", "KakaoAK 88927c6d047da3940394d71e197276c3");
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
	xhr.send("cid="+cid+"&tid="+tid+"&partner_order_id="+partner_order_id+"&partner_user_id="+partner_user_id+"&pg_token="+pg_token);
}


function saveAuctionPaymentData(cid, tid, partner_order_id, 
		   						partner_user_id, pg_token,item_name,
		   						amount, payment_method_type) {
	

	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			console.log("savePaymentData::"+response.result);
			
			closeAndRedirect(partner_order_id);
			
		}
	}


	// post 방식 
	xhr.open("post", "/safari/auction/saveAuctionPaymentInfo");
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.send("cid="+cid+"&tid="+tid+"&partner_order_id="+partner_order_id+"&partner_user_id="+partner_user_id+"&pg_token="+pg_token+"&item_name="+item_name+"&amount="+amount+"&payment_method_type="+payment_method_type);

}



function closeAndRedirect(partner_order_id) {
	
	// 새로 열린 창 닫기
	window.close();
	
	// 기존 창으로 리디렉션
	window.location.href = "http://localhost:8181/safari/auction/successBidList";
	
}






// 시작시 실행 
window.addEventListener("DOMContentLoaded",function(){
	getAuctionKakaoPayReadyInfo();
	

	
});



</script>



</body>	
</html>
