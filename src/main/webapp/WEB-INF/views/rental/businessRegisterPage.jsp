<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사파리 | 대여 사업체 회원 등록</title>
<!-- 메타 섹션 -->
<jsp:include page="../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->

</head>
<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->

<div class="container mt-5">
    <h3 class="row justify-content-center mb-4">대여 사업체 회원 등록</h3>
    <div class="row mt-5">
    <div class="col-3"></div>
    <div class="col">
    <form id="registrationForm" action="./businessRegisterProcess" method="POST" enctype="multipart/form-data">
	
        <div class="form-group row mt-3">
        	<p class="mb-1">아이디</p>
     	    <div class="input_box">
			  <input type="text" id="businessUserId" name="business_userid" autocomplete="off" required />
			  <label for="businessUserId" class="label-name">
			    <span class="content-name ps-2 text-body-tertiary fw-light">
			      example@example.com
			    </span>
			  </label>
			</div>
			
            <div class="row d-flex">
            	<div class="col-3 btn btn-outline-secondary btn-sm mt-1" id="userIdBtn">중복확인</div>
                <div class="col-5 fs-6 mt-1 text-secondary" id="idCheckAlert"></div>
            </div>
            

        </div>
        
        <div class="form-group row mt-3">
        	<p class="mb-1">비밀번호</p>
             <div class="input_box">
			  <input class="password" type="password" id="pw" name="pw" autocomplete="off" required />
			  <label for="pw" class="label-name">
			    <span class="content-name ps-2 pb-1 text-body-tertiary fw-light">
			     8글자 이상
			    </span>
			  </label>
			</div>
        </div>
        
        <div class="form-group row mt-3">
        	<p class="mb-1">비밀번호 확인</p>
            <div class="input_box">
			  <input type="password" id="pwConfirm" name="pwConfirm" autocomplete="off" required />
			  <label for="pwConfirm" class="label-name">
			    <span class="content-name ps-2 text-body-tertiary fw-light">
			      비밀번호 확인
			    </span>
			  </label>
			</div>
			
            <div class="col fs-6 mt-1 text-secondary" id="pwCheck"></div>

        </div>
        
        <div class="form-group row mt-3">
        	<p class="mb-1">사업자등록번호</p>
             <div class="input_box">
			  <input type="text" id="regNum" name="reg_num" autocomplete="off" required />
			  <label for="regNum" class="label-name">
			    <span class="content-name ps-2 text-body-tertiary fw-light">
			      '-없이' 숫자로만
			    </span>
			  </label>
			</div>
        </div>
        
        <div class="form-group row mt-1">
       		<p class="mb-1">사업자등록증 업로드</p>
            <div class="col">
                <input type="file" class="form-control-file" id="regImg" name="regImg" accept="image/*">
            </div>
        </div>
        
        <div class="form-group row mt-3">
        	<p class="mb-1">대표자 성함</p>
             <div class="input_box">
			  <input type="text" id="businessOwner" name="business_owner" autocomplete="off" required />
			  <label for="businessOwner" class="label-name">
			    <span class="content-name ps-2 text-body-tertiary fw-light">
			      사업자등록증상 대표
			    </span>
			  </label>
			</div>
        </div>
        
        <div class="form-group row mt-3">
        	<p class="mb-1">상호명</p>
             <div class="input_box">
			  <input type="text" id="businessName" name="business_name" autocomplete="off" required />
			  <label for="businessName" class="label-name">
			    <span class="content-name ps-2 text-body-tertiary fw-light">
			      상호명
			    </span>
			  </label>
			</div>
        </div>
        
        <div class="form-group row mt-3">
        	<p class="mb-1">회사 주소</p>
             <div class="input_box">
			  <input type="text" id="businessAddress" name="business_address" autocomplete="off" required />
			  <label for="businessAddress" class="label-name">
			    <span class="content-name ps-2 text-body-tertiary fw-light">
			 		클릭하여 검색
			    </span>
			  </label>
			</div>
		
        </div>
        
        <div class="form-group row mt-3">
        	<p class="mb-1">상세 주소</p>
             <div class="input_box">
			  <input type="text" id="addressDetail" name="addressDetail" autocomplete="off" required />
			  <label for="addressDetail" class="label-name">
			    <span class="content-name ps-2 text-body-tertiary fw-light">
			 	 상세 주소
			    </span>
			  </label>
			</div>
        </div>
		
        <div class="form-group row mt-3">
        	<p class="mb-1">연락처</p>
             <div class="input_box">
			  <input type="text" id="phone" name="phone" autocomplete="off" required />
			  <label for="phone" class="label-name text-body-tertiary fw-light">
			    <span class="content-name ps-2">
			 		000-0000-0000
			    </span>
			  </label>
			</div>
        </div>
		
        <div class="row justify-content-center mt-5">
            <div class="btn btn-primary btn-block btn-dark" id="registerBtn">등록</div>
        </div>
        
        
    </form>
    </div>
    <div class="col-3"></div>
    </div>
</div>

	
	
	
	
	
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload = function(){
    document.getElementById("businessAddress").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("businessAddress").value = data.address; // 주소 넣기
                document.querySelector("input[name=addressDetail]").focus(); //상세입력 포커싱
            }
        }).open();
    });
}
</script>

<script>

const userIdInput = document.getElementById("businessUserId");
const userIdButton = document.getElementById("userIdBtn");
//const registerButtonFake = document.getElementById("registerBtnFake");
const registerButton = document.getElementById("registerBtn");


/* 아이디 중복체크 관련 로직 수행  */

let idChecked = false;

userIdButton.addEventListener("click", checkUserId);

function checkUserId(){
	
	const userIdValue = document.getElementById("businessUserId").value;
	
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function () {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			const idCheckAlert = document.getElementById("idCheckAlert");
			
			if(response.isUserIdTaken == true){
				idCheckAlert.innerText = "사용 불가능한 아이디입니다.";
				idChecked = false;
			}else{
				idCheckAlert.innerText = "사용 가능한 아이디 입니다.";
				idChecked = true;
			}
		}
	};
	
	xhr.open("get", "./isUserIdTaken?userId=" + userIdValue);
	xhr.send();
	
}

/* 인풋 값 바뀌면 idCheck 다시 */

function resetIdCheck() {
  idChecked = false;
  const idCheckAlert = document.getElementById("idCheckAlert");
  idCheckAlert.innerText = "";
}

userIdInput.addEventListener("input", function () {
  if (!idChecked) {
    resetIdCheck();
  }
});

userIdInput.addEventListener("change", function () {
	idCheckAlert.innerText = "";
});


// 비밀번호 확인 체크 

let pwConfirmChecked = false;

const userPwBox = document.getElementById("pw");
const userPwConfirmBox = document.getElementById("pwConfirm");
const pwConfirmAlertBox = document.getElementById("pwCheck");


userPwBox.addEventListener("input", pwCheckReset);

function pwCheckReset(){
    pwConfirmAlertBox.innerText = ""

}


userPwConfirmBox.addEventListener("input", checkPw);

function checkPw(){
    if(userPwBox.value!="" && userPwBox.value != userPwConfirmBox.value){
    
        pwConfirmAlertBox.innerText = "비밀번호가 일치하지 않습니다."

        pwConfirmChecked = false;
        return;
	}
    
    if(userPwBox.value!="" && userPwBox.value === userPwConfirmBox.value){
    
        pwConfirmAlertBox.innerText = "비밀번호가 일치합니다."
        pwConfirmChecked = true;

        return;
	}

}


// 사업자 등록번호 
const regNumBox = document.getElementById("regNum");

regNumBox.addEventListener("blur", function() {
  const inputValue = regNumBox.value;
  const numericValue = inputValue.replace(/\D/g, "");
  regNumBox.value = numericValue;
});


// 연락처 숫자만 
const phoneBox = document.getElementById("phone");

phoneBox.addEventListener("blur", function() {
  const inputValue = phoneBox.value;
  const numericValue = inputValue.replace(/\D/g, "");
  phoneBox.value = numericValue;
});



/* 중복 체크 통과해야지 회원 가입 가능  */

registerButton.addEventListener("click", function(event) {
	
	  if (!idChecked) {
	    event.preventDefault();
	    alert("아이디 중복확인을 해주세요");
	    userIdInput.focus();
	    return;
	  }
	  if (!pwConfirmChecked) {
	    event.preventDefault();
	    alert("비밀번호 확인 후 다시 시도해주세요");
	    userPwBox.focus();
	    return;
	  }
	
	  const registrationForm = document.getElementById("registrationForm");
	  registrationForm.submit();

	});



</script>
</body>
</html>
