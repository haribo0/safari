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
.passBox {
	width: 200px;
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
						<h5>회원정보 수정</h5>		
					</div>
				</div>
				
				<div class="row mt-4">
					<div class="col fs-5 fw-bold">
						회원정보 수정
					</div>
				</div>
				
				<div class="row mt-3">
					<div class="col-10">
						
						
						<div class="row">
							<div class="col">
								
								<table class="table p-2" style="border-top: 1px solid #E2E3E5;">
									<tr>
										<td class="col-3 table-secondary text-center align-middle">아이디(이메일)</td>
										<td>
											<div class="row">
												<div class="col ms-2">
													${userInfo.email}
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td class="col-3 table-secondary text-center align-middle">비밀번호변경</td>
										<td>
											<div class="row">
												<div class="col ms-2">
													
													<div class="row mb-2">
														<div class="col mt-1">
															현재 비밀번호
														</div>
														<div class="col-9 me-3">
															<input type="password" class="form-control passBox me-2" id="nowUserPw" onchange="checkUserPw()"
															style="float: left;">
															<span id="isSame" style="position: relative; top: 3px; left: 3px;"></span>
														</div>
													</div>
													
													<div class="row mb-2">
														<div class="col mt-1">
															새 비밀번호
														</div>
														<div class="col-9 me-3">
															<input type="password" class="form-control passBox me-2" id="newUserPw" onChange="checkUserPw()"
															style="float: left;">
															<span id="isExist" style="position: relative; top: 3px; left: 3px;"></span>
														</div>
													</div>		
													
													<div class="row mb-2">
														<div class="col mt-1">
															새 비밀번호 확인
														</div>
														<div class="col-9 me-3">
															<input type="password" class="form-control passBox me-2" id="newUserPwCheck" onChange="checkNewUserPw()" style="float: left;">
															<span id="isSameNew" style="position: relative; top: 3px; left: 3px;"></span>
														</div>
													</div>																									
												
												</div>
											</div>
										
										</td>
									</tr>										
									<tr>
										<td class="col-3 table-secondary text-center align-middle">닉네임</td>
										<td>
											<div class="row">
												<div class="col ms-2">
													${userInfo.nickname}
												</div>
											</div>
										</td>
									</tr>		
									<tr>
										<td class="col-3 table-secondary text-center align-middle">전화번호</td>
										<td>
											<div class="row" id="phoneInput">
												<div class="col-auto mt-1 ms-2">
													${userInfo.phone}
												</div>
												<div class="col">
													<input type="button" class="btn btn-sm btn-outline-secondary" value="전화번호 변경"
													onclick="changePhoneNumber()" id="phoneButton">
												</div>
											</div>
											
										</td>
									</tr>	
									<tr>
										<td class="col-3 table-secondary text-center align-middle">성별</td>
										<td>
											<div class="row">
												<div class="col ms-2">
													
												 	<input class="form-check-input" type="radio" id=""  value="" <c:if test="${userInfo.gender eq 'm'}">checked</c:if>>
														  <label class="form-check-label me-5" for="">
														    	남
														  </label>		
											 		<input class="form-check-input" type="radio" id="" name="" value="" <c:if test="${userInfo.gender eq 'w'}">checked</c:if>>
														  <label class="form-check-label" for="">
														    	여
														  </label>																  										
												</div>
											</div>
										</td>
									</tr>	
									
									<tr>
										<td class="col-3 table-secondary text-center align-middle">프로필사진</td>
										<td>
											<div class="row">
												<div class="col ms-2">
													  <input class="form-control" id="profileImgFiles"
				  										name="profileImgFiles" type="file"  accept="image/*" style="width: 300px">
												</div>
											</div>
										</td>
									</tr>																																											
								
								</table>
								
								<div class="row mt-2">
									<div class="col">
										<input type="button" class="btn orangeButton" value="정보 수정하기">
									</div>
								</div>
								
							</div>
						</div>
					
					</div>
					<div class="col"></div>
				</div>
				
				
				
			
			
		</div>
		</div>
	</div>
	
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->
	
	


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

// 현재 비밀번호 확인
function checkUserPw() {
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			if(response.result == "success"){
				
				document.getElementById("isSame").innerHTML = "";
				document.getElementById("isExist").innerHTML = "";
				
				if (response.userPw.pw != document.querySelector("#nowUserPw").value) {
					document.getElementById("isSame").innerText = "비밀번호가 일치하지 않습니다.";

				} else if (response.userPw.pw == document.querySelector("#newUserPw").value) {
					document.getElementById("isExist").innerText = "현재 비밀번호와 동일합니다.";
				} 
				
			}
		}
	}

	
	xhr.open("get", "/safari/user/checkUserPw");
	xhr.send();		

}

// 새 비밀번호 확인
function checkNewUserPw() {
	
	  const newUserPw = document.querySelector("#newUserPw").value;
	  const newUserPwCheck = document.querySelector("#newUserPwCheck").value;
		
	  document.getElementById("isSameNew").innerHTML = "";
	  
  	  if(newUserPw != null) {
  	  if (newUserPw !== newUserPwCheck) {
	    document.getElementById("isSameNew").innerText = "입력하신 비밀번호와 일치하지 않습니다.";
	  } else {
	    document.getElementById("isSameNew").innerText = "비밀번호가 일치합니다.";
	  }
  	  }
}

//전화번호 변경 버튼
function changePhoneNumber() {
  const button = document.getElementById("phoneButton");

  if (button.value === "전화번호 변경") {
    // "전화번호 변경" 버튼을 클릭한 경우
    button.value = "전화번호 변경 취소";

    const inputRow = document.createElement("div");
    inputRow.classList.add("row", "mt-2");

    const inputCol = document.createElement("div");
    inputCol.classList.add("col-4", "ms-2");

    const inputBox = document.createElement("input");
    inputBox.type = "text";
    inputBox.classList.add("form-control");
    inputBox.id = "phoneNumberInput";

    inputCol.appendChild(inputBox);
    inputRow.appendChild(inputCol);

    const container = document.getElementById("phoneInput");
    container.appendChild(inputRow);
    
  } else {
    // "전화번호 변경 취소" 버튼을 클릭한 경우
    button.value = "전화번호 변경";

    const inputRow = document.querySelector(".row.mt-2");
    if (inputRow) {
      inputRow.parentNode.removeChild(inputRow);
    }
  }
}


	


window.addEventListener("DOMContentLoaded", function(){
	getSessionId();
	
	
});
</script>
</body>	
</html>