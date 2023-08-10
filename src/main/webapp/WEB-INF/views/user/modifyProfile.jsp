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
						<h5>회원정보 수정</h5>		
					</div>
				</div>
				
				<div class="row mt-4">
					<div class="col fs-5 fw-bold">
						회원정보 수정
					</div>
				</div>
				
				<div class="row mt-3">
					<div class="col-9">
						
						<div class="row border-top border-bottom p-3">
							<div class="col fw-semibold" style="font-size: 18px;">
								닉네임
							</div>
							<div class="col-9">
								
								<input type="text" 
								id="nickname" class="form-control py-2" value="${userInfo.nickname}"
								 style="width: 250px; pointer-events: none;">
							</div>	
						</div>
						
						<div class="row border-bottom p-3">
							<div class="col fw-semibold" style="font-size: 18px">
								아이디 (이메일)
							</div>
							<div class="col-9">
								
								<input type="text" class="form-control py-2" value="${userInfo.email}" 
								style="pointer-events: none;" id="email">
							</div>	
						</div>			

	
						
						<div class="row border-bottom p-3">
							<div class="col fw-semibold" style="font-size: 18px">
								비밀번호
							</div>
							<div class="col-9">
								<div class="row">
									<div class="col-auto">
										<input type="password" class="form-control me-2 py-2" id="userPw"
																	style="width: 250px; float: left;" value="${sessionUser.pw}">
									</div>
									<div class="col">
										<span id="pwRegNotMatch"
										class="text-danger" style="display: none; position: relative; left: 1px; font-size: 17px">
										비밀번호는 문자, 숫자, 특수문자 포함 8~20자로 입력하셔야 합니다.</span>
									</div>	
								
								</div>
							</div>	
						</div>		
						
						<div class="row border-bottom p-3">
							<div class="col fw-semibold" style="font-size: 18px">
								비밀번호 확인
							</div>
							<div class="col-9">
								<div class="row">
									<div class="col-auto">
										<input type="password" class="form-control me-2 py-2" id="userPwCheck"
																style="width: 250px; float: left;">
									</div>
									<div class="col">
										<span id="pwNotMatch"
										class="text-danger" style="display: none; position: relative; top: 3px; left: 1px; font-size: 17px">
										비밀번호가 일치하지 않습니다.</span>
									</div>
								</div>
							
							</div>	
						</div>								
						
						
						
						<div class="row border-bottom p-3">
							<div class="col fw-semibold" style="font-size: 18px">
								연락처
							</div>
							<div class="col-9">
								
								<input style="width: 250px"
								type="text" class="form-control py-2" value="${userInfo.phone}" maxlength="13" oninput="oninputPhone(this)"
								id="phone">
							</div>	
						</div>		
						
						<div class="row border-bottom p-3">
							<div class="col fw-semibold" style="font-size: 18px">
								프로필 사진
							</div>
							<div class="col-9">
								
								 <input class="form-control py-2" id="profileImgFile"
				  										name="profileImgFile" type="file"  accept="image/*" style="width: 300px">
							</div>	
						</div>		
						
	
					
					</div>
					<div class="col"></div>
				</div>
				
				<div class="row mt-4">
					<div class="col-5">
						<div class="row">
							<div class="col d-grid">
								<input type="button" class="btn btn-outline-dark p-2 fs-5" value="취소"
								onclick="location.href='/safari/user/myPage'">
								
							</div>
							<div class="col d-grid">
								<input type="button" class="btn btn-dark p-2 fs-5"
								value="확인" onclick="modifyUserInfo()">
							</div>
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
// 로그인된 세션 초기화
let mySessionId = null;

let nickChecked = false;
let pwChecked = false;

document.querySelector("#userPw").addEventListener("keyup", checkNewPwValue);
document.querySelector("#userPwCheck").addEventListener("keyup", checkNewPwValue);

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

//전화번호 형식 변경 함수
function oninputPhone(target) {
    target.value = target.value
        .replace(/[^0-9]/g, '')
        .replace(/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
}



	
// 비밀번호 확인
function checkNewPwValue() {
	
	const pw = document.querySelector("#userPw");
	const pwCheck = document.querySelector("#userPwCheck");
	const pwRegNotMatchBox = document.querySelector("#pwRegNotMatch");
	
	const passwordRegEx = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@#$%^&!*])[A-Za-z\d@#$%^&!*]{8,20}$/;
	
    if (!passwordRegEx.test(pw.value)) {
        pwChecked = false;
        pwRegNotMatchBox.style.display = "block";
        return;
    } else {
    	pwRegNotMatchBox.style.display = "none";
    }
	
	const pwNotMatchBox = document.querySelector("#pwNotMatch");
	
	if (pw.value != pwCheck.value) {
		pwChecked = false;
		pwNotMatchBox.style.display = "block";
	} else {
		pwChecked = true;	
		pwNotMatchBox.style.display = "none";
	}
	
}

// 회원정보 수정
function modifyUserInfo() {
	
	  const pw = document.querySelector("#userPw");
	  const pwCheck = document.querySelector("#userPwCheck");
	  const phone = document.querySelector("#phone");
	  const profileImgFileInput = document.querySelector("#profileImgFile");
	  
	  if (pw.value == "") {
		   alert("비밀번호를 입력하세요.");
		   pw.focus();
		   return;
	   }
	  if (pwCheck.value == "") {
		   alert("비밀번호 확인란을 입력하세요.");
		   pwCheck.focus();
		   return;
	   }
	  if (phone.value == "") {
		   alert("전화번호를 입력하세요.");
		   phone.focus();
		   return;
	   }
	  if (!pwChecked) {
		  alert("비밀번호를 다시 입력해주세요.");
		  pwCheck.value = "";
		  pwCheck.focus();
		  return;
	  }
	
	
	  const xhr = new XMLHttpRequest();
	  
	  xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status == 200){
            const response = JSON.parse(xhr.responseText);
            
            window.location.href = "/safari/user/myPage";
            
            
        }
	  }
	  
	  const formData = new FormData();
	  formData.append("pw", pw.value);
	  formData.append("phone", phone.value);
	
	  // 이미지 파일 추가
	  const imageFile = profileImgFileInput.files[0];
	  formData.append("profileImgFile", imageFile);
	  
	  xhr.open("post", "/safari/user/modifyUserInfo");
	  xhr.send(formData);	
}



window.addEventListener("DOMContentLoaded", function(){
	getSessionId();
	
	
});
</script>
</body>	
</html>