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
						<h5>회원정보 확인</h5>		
					</div>
				</div>
				
				
				
				<div class="row mt-5">
					<div class="col">
						
						
						<div class="row mb-1 text-center">
							<div class="col">
								 <img src="/safari/resources/img/logo0.png" width="150px">
							</div>
						</div>
						
						<div class="row mt-4 text-center fs-4">
							<div class="col">
								 회원정보를 수정하시려면 비밀번호를 다시 한 번 입력하셔야 합니다.
							</div>
						</div>						
						
						<div class="row mt-2 mb-1 text-center">
							<div class="col" style="font-size: 18px">
								회원님의 개인정보 보호를 위한 본인 확인 절차이오니, 482 회원 로그인 시 사용하시는 비밀번호를 입력해주세요.
							</div>
						</div>
						
						<div class="row mt-4 bg-light p-4">
							<div class="col"></div>
							<div class="col-5">
							
								
									<div class="row">
										<div class="col">
											<input type="text" value="${sessionUser.email}" class="form-control mb-3 p-3" readonly>
											<input type="password" placeholder="비밀번호를 입력하세요" class="form-control mb-2 p-3"
											id="pw" onkeydown="checkSendPw(event)">
										</div>
									</div>
									
									<div class="row mt-3">
										<div class="col d-grid">
											<input type="button" class="btn btn-outline-dark p-2 fs-5" value="취소"
											onclick="location.href='/safari/user/myPage'">
											
										</div>
										<div class="col d-grid">
											<input type="button" class="btn btn-dark p-2 fs-5"
											value="확인" onclick="checkPasswordProcess()">
										</div>
									</div>
								
							</div>
							<div class="col"></div>
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

//enter 처리
function checkSendPw(event) {
	if (event.key === "Enter") {
		checkPasswordProcess();
	  }
}


// 비밀번호 체크
function checkPasswordProcess() {
	
	const pw = document.querySelector("#pw");
	
	const xhr = new XMLHttpRequest();
	
	 xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status == 200){
            const response = JSON.parse(xhr.responseText);
            
            
            if (response.result == "fail") {
            	location.href = "/safari/user/loginPage";
            } else {
            	
	            if (pw.value != response.userPw.pw) {
	            	
	            	alert("비밀번호가 일치하지 않습니다.");
	            	pw.value = "";
	            	pw.focus();
					return;
	            
	            } else {
	            	pw.value = "";
	            	location.href = "/safari/user/modifyProfile";
	            }
	            
        	}
            
        }   
	 }
  
	 xhr.open("get", "/safari/user/checkPasswordProcess");
	 xhr.send();
	
}

	


window.addEventListener("DOMContentLoaded", function(){

	
	
});
</script>
</body>	
</html>