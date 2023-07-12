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


// 코인 충전 정보 보내주기
function getOnChargeCoinKakaoPayReadyInfo() {

	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			const cid = response.coinReadyInfo.cid;
			const tid = response.coinReadyInfo.tid;
			const partner_order_id = response.coinReadyInfo.partner_order_id;
			const partner_user_id = response.coinReadyInfo.partner_user_id;
			const quantity = 1;
			const item_name = response.coinReadyInfo.item_name;
			const pg_token = response.coinReadyInfo.pg_token;
			
	/* 		console.log(cid);
			console.log(tid);
			console.log(partner_order_id);
			console.log(partner_user_id);
			console.log(item_name);
			console.log(pg_token);
			 */
			
			getChargeCoinApproveData(cid, tid, partner_order_id, partner_user_id, pg_token);
			
			
		}
	}


		xhr.open("get", "/safari/user/getOnChargeCoinKakaoPayReadyInfo");
		xhr.send();

}



//충전 정보 가져오기
function getChargeCoinApproveData(cid, tid, partner_order_id, partner_user_id, pg_token) {

	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);

			
			console.log(cid);
			console.log(tid);
			console.log(partner_order_id);
			console.log(partner_user_id);
			console.log(pg_token);

			saveChargeCoinData(cid, tid, partner_order_id, 
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
function saveChargeCoinData(cid, tid, partner_order_id, 
		   						partner_user_id, pg_token, item_name,
		   						amount, payment_method_type) {
	

	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			console.log(partner_order_id);
			
		     // 팝업 창 닫기
	         window.close();

		    
	         // 부모 창으로 이동하여 전체 화면으로 결제 완료 페이지 표시
	       if (window.opener) {
	            window.opener.location.href = "http://localhost:8181/safari/user/chargeCoinSucceed?id=" + partner_order_id;
	         } else {
	            // window.opener가 없을 경우에는 현재 창을 리다이렉트
	            location.href = "http://localhost:8181/safari/user/chargeCoinSucceed?id=" + partner_order_id;
	         } 
	
		}
	}


	// post 방식 
	xhr.open("post", "/safari/user/saveChargeCoinData");
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.send("cid="+cid+"&tid="+tid+"&partner_order_id="+partner_order_id+"&partner_user_id="+partner_user_id+"&pg_token="+pg_token+"&item_name="+item_name+"&amount="+amount+"&payment_method_type="+payment_method_type);

}






// 시작시 실행 
window.addEventListener("DOMContentLoaded",function(){
	 getOnChargeCoinKakaoPayReadyInfo();
	

	
});



</script>



</body>	
</html>
