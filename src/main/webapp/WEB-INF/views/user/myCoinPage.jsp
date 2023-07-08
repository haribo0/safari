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
				
				<div class="row mt-5">
					<div class="col">
						<div>
							<span>보유한 코인: 5000코인</span>
							<span></span>
						</div>
						
						<div class="mt-3">
							<button class="btn btn-outline-dark mt-2" onclick="openModal()">충전</button>					
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
      <div class="modal-header">
        <h5 class="modal-title">코인 충전 하기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <select class="form-select form-select-lg mb-3" id="inputCoin" aria-label=".form-select-lg example">
		  <option selected>충전금액선택</option>
		  <option value="5000">5000</option>
		  <option value="10000">10000</option>
		  <option value="30000">30000</option>
		  <option value="50000">50000</option>
		  <option value="100000">100000</option>
		</select>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" onclick="onChargeCoin()">충전하기</button>
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
function onChargeCoin() {
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

	
}
	
	
function openModal() {
	const modal = bootstrap.Modal.getOrCreateInstance('#modalCoin');
	modal.show();
}

window.addEventListener("DOMContentLoaded", function(){
	getSessionId()
	
});
</script>
</body>	
</html>