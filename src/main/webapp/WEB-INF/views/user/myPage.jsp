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
	.btn-qna{position: fixed; bottom: 80px; right: 70px; border-radius: 60px; padding: 0 0;}
	.btn-circle{width: 50px; height: 52px; border-radius: 50%; display: flex; flex-direction:column; justify-content: center; align-items: center; font-size: 2rem; cursor: pointer;}
	.btn-circle i{color: #5e5e5e; font-size: 24px;}
	.btn-tit{font-size:13px;}
	
	.coin-box{position: relative;}
	.coin-box::before {content: ''; width:1px; height: 60%; background: #5e5e5e; display:block; position: absolute; top: 50%; transform:translateY(-50%); left: 0px;}
</style>
</head>
<body>

<!-- 	<div class="btn-qna shadow-lg bg-white px-3 pt-4 pb-3">
		<div class="btn-circle" id="usedChat">
			<i class="bi bi-chat-dots"></i>
			<p class="btn-tit">중고채팅</p>
		</div>
		
		<div class="btn-circle mt-4" id="liveChat">
			<i class="bi bi-question-circle"></i>
			<p class="btn-tit">1대1문의</p>
		</div>
	</div> -->
	
	<!-- Chat Box -->
	<jsp:include page="../common/chatBox.jsp"></jsp:include>
	<!-- Chat Box -->
	
	<!-- 헤더 섹션 -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->

	<!-- 마이페이지 상단 블럭 -->
	<jsp:include page="../common/myPageTop.jsp"></jsp:include>
	<!-- 마이페이지 상단 블럭 -->
	
	<div class="container d-flex mt-5 px-0">
		<div class="row w-100">
		<!-- 마이페이지 nav-->
		<jsp:include page="../common/myPageNav.jsp"></jsp:include>
		<!-- 마이페이지 nav-->
			
		<div class="col ms-4">
			<div class="row" style="border-bottom: 2px solid #222; height: 48px;">
				<div class="col p-0">
					<h5>마이페이지</h5>						
				</div>
			</div>
		</div>
		</div>
	</div>
		
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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



window.addEventListener("DOMContentLoaded", function(){
	getSessionId()
	
});
</script>
</body>	
</html>