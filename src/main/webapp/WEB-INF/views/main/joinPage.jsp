<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사파리 | 회원가입</title>
<!-- 메타 섹션 -->
<jsp:include page="../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<link rel="stylesheet" href="/safari/resources/style/auction.css" type="text/css">
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
	
	<div class="container mb-5">
		<div class="row mt-1 justify-content-center">
			<div class="col-4">
				
			<div class="row">
					<div class="col fw-bold fs-4">회원가입</div>					
				</div> 
				
				
				
				<div class="row ">
					<div class="col">
						회원이 되어 다양한 혜택을 경험해 보세요!
					</div>
				</div>
				
				<form action="/safari/user/userJoinProcess" method="post" id="frm">
					<div class="row mt-4">
						<div class="col">
					
							<div class="row">
								<div class="col">
									<label for="email" class="form-label fw-medium">아이디 <span class="text-danger fw-bold">＊</span></label>
									<input type="text" class="form-control" id="email" name="email"
									placeholder="6~20자">
								</div>
							</div>
							
							<%-- 아이디 중복 --%>
							<div class="row mt-1" style="display: none;" id="existsIdBox">
								<div class="col text-danger">
									이미 존재하는 아이디입니다.
								</div>
							</div>
							<%-- 아이디 중복 --%>
							
							<%-- 아이디 사용 가능 --%>
							<div class="row mt-1" style="display: none;" id="possibleIdBox">
								<div class="col text-success">
									사용 가능한 아이디입니다.
								</div>
							</div>
							<%-- 아이디 사용 가능 --%>
							
							<div class="row mt-4">
								<div class="col">
									<label for="pw" class="form-label fw-medium">비밀번호 <span class="text-danger fw-bold">＊</span></label>
									<input type="password" class="form-control" id="pw" name="pw"
									placeholder="문자, 숫자, 특수문자 포함 8~20자">
									<input type="password" class="form-control mt-2" id="pwCheck"
									placeholder="비밀번호 확인">
								</div>
							</div>
					
							
							
							<div class="row mt-1" style="display: none;" id="pwNotMatchBox">
								<div class="col text-danger">
									입력하신 비밀번호가 일치하지 않습니다.
								</div>
							</div>
							
							
							<div class="row mt-4">
								<div class="col">
									<label for="nickname" class="form-label fw-medium">닉네임 <span class="text-danger fw-bold">＊</span></label>
									<input type="text" class="form-control" id="nickname" name="nickname"
									placeholder="닉네임을 입력해주세요">
								</div>
							</div>								
							
							<div class="row mt-4">
								<div class="col">
									<label for="phone" class="form-label fw-medium">전화번호 <span class="text-danger fw-bold">＊</span></label>
									<input type="text" class="form-control" id="phone" oninput="oninputPhone(this)" maxlength="13" name="phone"
									placeholder="01000000000">
								</div>
							</div>		
							
							<div class="row mt-4">
								<div class="col">
									
									<div class="row">
										<div class="col fw-medium">
											성별 <span class="text-danger fw-bold">＊</span>
										</div>
									</div>
									
									<div class="row mt-3">
										<div class="col">
											 <input class="form-check-input me-2" type="radio" id="gender_M" name="gender" value="m" style="cursor:pointer";>
											  <label class="form-check-label me-4" for="gender">
											    	남
											  </label>	
											   <input class="form-check-input me-2" type="radio" id="gender_W" name="gender" value="w" style="cursor:pointer";>
											  <label class="form-check-label me-4" for="gender">
											    	여
											  </label>	
										</div>
									</div>						
								
								</div>
								<div class="col-7">
								
									<label for="birth" class="form-label fw-medium">생년월일 <span class="text-danger fw-bold">＊</span></label>
									<input type="date" class="form-control" id="birth" name="birth">
								</div>
							
							</div>
							
							
							
							<div class="row mt-4 mb-1">
								<div class="col">
									<label class="form-check-label me-4 fw-medium" for="profile_img_link ">프로필사진</label>
									<input type="file" class="form-control mt-2" id="profile_img_link" name="profile_img_link">						
								</div>
							</div>
							
							<div class="row mt-1">
								<div class="col"></div>
							</div>
							<div class="row mt-4">
								<div class="col d-grid">
									<input type="button" class="btn orangeButton p-2" 
									style="font-size: 20px;" value="가입하기"
									onclick="checkValueAndSubmit()">
								</div>
							</div>
	
						</div>
					</div>
				</form>
				
			</div>
		</div>
	
	
	</div>
	

	
	
	
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->
	
<%-- 아이디 확인 Modal --%>
<div class="modal" id="idCheckModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered"> 
    <div class="modal-content">
      <div class="modal-header bg-light">
      	<h5></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
    	<div class="row mt-2">
    		<div class="col text-center">
    			아이디를 다시 입력해주세요
    		</div>
    	</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창닫기</button>
      </div>      
    </div>
  </div>
</div>
<%--  Modal --%>	

<%-- 비밀번호 확인 Modal --%>
<div class="modal" id="pwCheckModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered"> 
    <div class="modal-content">
      <div class="modal-header bg-light">
      	
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
    	<div class="row mt-2">
    		<div class="col text-center">
    			비밀번호를 다시 입력해주세요
    		</div>
    	</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창닫기</button>
      </div>      
    </div>
  </div>
</div>
<%--  Modal --%>

<%-- 회원가입 완료 Modal --%>
<div class="modal" id="joinSuccessModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered"> 
    <div class="modal-content">
      <div class="modal-header bg-light">
      	
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
    	<div class="row mt-2">
    		<div class="col text-center">
    			회원가입이 완료되었습니다.
    		</div>
    	</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창닫기</button>
      </div>      
    </div>
  </div>
</div>
<%--  Modal --%>



<script>
function ajaxTemplate() {

	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
		}
	}



	// post 방식 
	xhr.open("post", "url");
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.send("params");

}




// 회원가입 가능 여부 확인
let idChecked = false;
let pwChecked = false;


//아이디 입력 시 중복 체크
document.querySelector("#email").addEventListener("keyup", existsUserId);

//아이디 중복 체크
function existsUserId(){
    const userIdValue = document.querySelector("#email").value;

    const xhr = new XMLHttpRequest();

    xhr.onreadystatechange = function() {
        if(xhr.readyState == 4 && xhr.status == 200){
            const response = JSON.parse(xhr.responseText);

            const existsIdBox = document.getElementById("existsIdBox");
            const possibleIdBox = document.getElementById("possibleIdBox");

            if(response.exists == true) {
                idChecked = false;
                existsIdBox.style.display = "block";
                possibleIdBox.style.display = "none";
                
                
            } else {
                idChecked = true;
                existsIdBox.style.display = "none";
                possibleIdBox.style.display = "block";
                
                // 중복 확인 해놓고 다시 지워버릴 경우
                if (userIdValue == "") {
                	possibleIdBox.style.display = "none";
                	idChecked = false;
                }
            }
        }
    }

    xhr.open("get", "/safari/user/existsUserId?email=" + userIdValue);
    xhr.send();
}


// 비밀번호 확인 입력 시 일치 여부 확인
document.querySelector("#pw").addEventListener("keyup", checkPwValue);
document.querySelector("#pwCheck").addEventListener("keyup", checkPwValue);

// 비밀번호 일치 여부 확인
function checkPwValue() {
	
	const userPwBox = document.getElementById("pw");
	const userPwCheckBox = document.getElementById("pwCheck");
	
	const pwNotMatchBox = document.getElementById("pwNotMatchBox");
	
	if(userPwBox.value != userPwCheckBox.value) {
		pwNotMatchBox.style.display = "block";
		pwChecked = false;
		
		if(userPwCheckBox.value == "") {
			pwNotMatchBox.style.display = "none";
		}
		
	} else {
		pwNotMatchBox.style.display = "none";
		pwChecked = true;
		
		if(userPwBox.value != userPwCheckBox.value) {
			pwNotMatchBox.style.display = "block";
			pwChecked = false;
		} else {
			pwNotMatchBox.style.display = "none";
			pwChecked = true;
		}
		
		
	}
}

//전화번호 형식 변경 함수
function oninputPhone(target) {
    target.value = target.value
        .replace(/[^0-9]/g, '')
        .replace(/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
}

// 회원가입 유효성 검사
function checkValueAndSubmit() {
	
	const email = document.getElementById("email");
	const pw = document.getElementById("pw");
	const pwCheck = document.getElementById("pwCheck");
	const nickname = document.getElementById("nickname");
	const phone = document.getElementById("phone");
	const gender_m = document.getElementById("gender_M");
	const gender_w = document.getElementById("gender_W");
	const birth = document.getElementById("birth");
	
	if (email.value == "") {
		alert("아이디를 입력해주세요");
		email.focus();
		return;
	} else if (pw.value == "") {
		alert("비밀번호를 입력해주세요");
		pw.focus();
		return;
	} else if (pwCheck.value == "") {
		alert("비밀번호 확인란을 입력해주세요");
		pw.focus();
		return;
	} else if (nickname.value == "") {
		alert("닉네임을 입력해주세요");
		nickname.focus();
		return;
	} else if (phone.value == "") {
		alert("전화번호를 입력해주세요");
		phone.focus();
		return;
	} else if (!gender_m.checked && !gender_w.checked) {
	    alert("성별을 선택해주세요");
	    return;
	} else if (birth.value == "") {
		alert("생년월일을 입력해주세요");
		birth.focus();
		return;
	} else if (pw.value != pwCheck.value) {
		alert("비밀번호가 일치하지 않습니다.");
		pw.value = "";
		pwCheck.value = "";
		pw.focus();
		return;
	}
	
	
	if (!idChecked) {
		const idCheckModal = bootstrap.Modal.getOrCreateInstance("#idCheckModal");
		idCheckModal.show();
		setTimeout(function() {
			idCheckModal.hide();
	    }, 1000);
		
		return;
	}
	
	else if (!pwChecked) {
		const pwCheckModal = bootstrap.Modal.getOrCreateInstance("#pwCheckModal");
		pwCheckModal.show();
		setTimeout(function() {
			pwCheckModal.hide();
	    }, 1000);
		
		return;
		
	} else {
		const frm = document.getElementById("frm");
		frm.submit();
		
		const joinSuccessModal = bootstrap.Modal.getOrCreateInstance("#joinSuccessModal");
		joinSuccessModal.show();

	    setTimeout(function() {
	       joinSuccessModal.hide();
	    }, 2000);
	}
	
	
}


</script>	
	

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>	
</html>