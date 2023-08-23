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
<link rel="stylesheet" href="/safari/resources/style/common.css" type="text/css">
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
				
				<form action="/safari/user/userJoinProcess" method="post" id="frm" enctype="multipart/form-data">
					<div class="row mt-4">
						<div class="col">
					
							<div class="row">
								<div class="col">
									<label for="email" class="form-label fw-medium">아이디 <span class="text-danger fw-bold">＊</span></label>
									<input type="text" class="form-control" id="email" name="email"
									placeholder="이메일 형식으로 입력해주세요">
								</div>
							</div>
							
							<%-- 아이디 중복 --%>
							<div class="row mt-1" style="display: none;" id="existsIdBox">
								<div class="col text-danger">
									이미 존재하는 아이디입니다.
								</div>
							</div>
							<%-- 아이디 중복 --%>
							
							<%-- 이메일 형식 --%>
							<div class="row mt-1" style="display: none;" id="incorrectIdBox">
								<div class="col text-danger">
									올바른 이메일 형식으로 입력해주세요.
								</div>
							</div>
							<%-- 이메일 형식 --%>							
							
							
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
								</div>
							</div>
							
					<!-- 		<div class="row mt-4">
								<div class="col">
									<label for="pw" class="form-label fw-medium">비밀번호 <span class="text-danger fw-bold">＊</span></label>
										<input type="password" class="form-control" id="pw" name="pw"
									placeholder="문자, 숫자, 특수문자 포함 8~20자">
								</div>
							</div> -->
							
							<div class="row mt-1" style="display: none;" id="pwRegNotMatchBox">
								<div class="col text-danger">
									비밀번호는 문자, 숫자, 특수문자 포함 8~20자로 입력하셔야 합니다.
								</div>
							</div>									
							
							<div class="row">
								<div class="col">
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
									placeholder="닉네임을 입력해주세요" >
								</div>
							</div>			
							
							<div class="row mt-1">
								<div class="col text-danger" style="display: none;" id="nicknameBox">
									이미 존재하는 닉네임입니다.					
								</div>	
							</div>
												
							
							<div class="row mt-4">
								<div class="col">
									<label for="phone" class="form-label fw-medium">전화번호 <span class="text-danger fw-bold">＊</span></label>
									<input type="text" class="form-control" id="phone" oninput="oninputPhone(this)" maxlength="13" name="phone"
									placeholder="전화번호를 입력해주세요">
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
									<input type="file" class="form-control mt-2" id="profile_img_link" name="profileImageFile"
									accept="image/*">						
								</div>
							</div>
							
							<div class="row mt-4">
								<div class="col">
								
									<div class="row mt-2">
										<div class="col rounded-1 bg-light py-2 mx-1">
										
											<div class="row ms-3 mt-1">
												<div class="col form-check" >
												  <input class="form-check-input fs-5" type="checkbox" value="" id="flexCheckDefault">
												  <label class="form-check-label" for="flexCheckDefault">
												    <span class="fw-semibold fs-5 ms-2">전체 동의</span>
												  </label>
												</div>
												<div class="col text-end">
												<i class="bi bi-chevron-down"></i>
												</div>
											
											</div>
											
											<div class="row ms-3 mt-1">
												<div class="col ms-3">
													
													<div class="row">
														<div class="col">
															회원 정보와 서비스 이용에 대한 안내와 개인정보 수집,  
														</div>
													</div>
													
													<div class="row">
														<div class="col">
															이용 동의가 포함되어 있습니다.
														</div>
													</div>
												
												</div>
											
											</div>
										
										
										
										
										</div>
									</div>
								
								
								</div>
							</div>
							<div class="row mt-5 mb-5">
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


<%-- 닉네임 확인 Modal --%>
<div class="modal" id="nickCheckModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered"> 
    <div class="modal-content">
      <div class="modal-header bg-light">
      	
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
    	<div class="row mt-2">
    		<div class="col text-center">
    			닉네임을 다시 입력해주세요
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
let nickChecked = false;


// 아이디 입력 시 중복 체크
document.querySelector("#email").addEventListener("keyup", existsUserId);
// 이메일 형식 올바른지 체크
/* document.querySelector("#email").addEventListener("keyup", rightnessUserId); */

//이메일 형식 올바른지 체크
/* function rightnessUserId() {
	
	const userIdValue = document.querySelector("#email").value;

	const idRegEx = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	const incorrectIdBox = document.querySelector("#incorrectIdBox");
	
	if (!idRegEx.test(userIdValue)) {
		idChecked = false;
		incorrectIdBox.style.display = "block";
		
	} else {
		idChecked = true;
		incorrectIdBox.style.display = "none";
	}
	
}
 */


// 아이디 중복 체크 
function existsUserId() {
    const userIdValue = document.querySelector("#email").value;

    const existsIdBox = document.getElementById("existsIdBox");
    const possibleIdBox = document.getElementById("possibleIdBox");

    const incorrectIdBox = document.querySelector("#incorrectIdBox");
    
    const idRegEx = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;

    if (!idRegEx.test(userIdValue)) {
        idChecked = false;
        incorrectIdBox.style.display = "block";
        possibleIdBox.style.display = "none"; // 추가: 이메일 형식이 맞지 않을 경우 possibleIdBox도 감추기
        return;
    } else {
        idChecked = true;
        incorrectIdBox.style.display = "none";

        if (userIdValue == "") {
            existsIdBox.style.display = "none";
            possibleIdBox.style.display = "none";
            idChecked = false;
            return;
        }
    }

    const xhr = new XMLHttpRequest();

    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
            const response = JSON.parse(xhr.responseText);

            if (response.exists == true) {
                idChecked = false;
                existsIdBox.style.display = "block";
                possibleIdBox.style.display = "none";
            } else {
                idChecked = true;
                existsIdBox.style.display = "none";
                possibleIdBox.style.display = "block";

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
	const pwRegNotMatchBox = document.getElementById("pwRegNotMatchBox");
	
	const passwordRegEx = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@#$%^&!*])[A-Za-z\d@#$%^&!*]{8,20}$/;
	
	
    if (!passwordRegEx.test(userPwBox.value)) {
        pwChecked = false;
        pwRegNotMatchBox.style.display = "block";
        return;
    } else {
    	pwRegNotMatchBox.style.display = "none";
    }
	

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


// 닉네임 중복 여부 확인
document.querySelector("#nickname").addEventListener("keyup", checkNicknameValue);

// 닉네임 중복 체크
function checkNicknameValue() {
	
	 const nicknameBox = document.querySelector("#nicknameBox");
	 const nicknameValue = document.querySelector("#nickname").value;
	 
	 
	 const xhr = new XMLHttpRequest();
	
	 xhr.onreadystatechange = function() {
	       if (xhr.readyState == 4 && xhr.status == 200) {
	           const response = JSON.parse(xhr.responseText);
	           
	           
	           if (response.exists == true) {
	                nickChecked = false;
	                nicknameBox.style.display = "block";
	            } else {
	            	nickChecked = true;
	                nicknameBox.style.display = "none";

	                if (nicknameValue == "") {
	                	//nicknameBox.style.display = "none";
	                    nickChecked = false;
	                }
	            }
	           
	           
	           
	       }
	   }
	 
	  xhr.open("get", "/safari/user/existsNickname?nickname=" + nicknameValue);
	  xhr.send();
}


const setDateInput = () => {
    const today = new Date();

    const yyyy = today.getFullYear();
    const mm = String(today.getMonth() + 1).padStart(2, '0');
    const dd = String(today.getDate()).padStart(2, '0');
    const formattedDate = `\${yyyy}-\${mm}-\${dd}`;
  
    document.getElementById('birth').setAttribute('max', formattedDate);
};




// 회원가입 유효성 검사
function checkValueAndSubmit() {
	
	
/*    const agreeCheckbox = document.getElementById("flexCheckDefault");
  
   // 동의 체크박스를 누르지 않으면 결제 창 띄우지 못하게 방지
   if (!agreeCheckbox.checked) {
    
	   const checkBoxModal = bootstrap.Modal.getOrCreateInstance("#checkBoxModal"); 
	   checkBoxModal.show();
		
		setTimeout(function() { // 1초 뒤 모달 창 삭제
			checkBoxModal.hide();
		}, 2000);
      return;
    }	 */	
	
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
	} 
	
	else if (pw.value == "") {
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
	}
	
	else if (!nickChecked) {
		const nickCheckModal = bootstrap.Modal.getOrCreateInstance("#nickCheckModal");
		nickCheckModal.show();
		setTimeout(function() {
			nickCheckModal.hide();
	    }, 1000);
		
		return;
	} 
	
	else {
		const frm = document.getElementById("frm");
		frm.submit();
		
		const joinSuccessModal = bootstrap.Modal.getOrCreateInstance("#joinSuccessModal");
		joinSuccessModal.show();

	    setTimeout(function() {
	       joinSuccessModal.hide();
	    }, 5000);
	}
	
	
}

window.addEventListener("DOMContentLoaded", function(){

	setDateInput();
   
 
});



</script>	
	

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>	
</html>