<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사파리 | 로그인</title>
<!-- 메타 섹션 -->
<jsp:include page="../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->
</head>
<link rel="stylesheet" href="/safari/resources/style/auction.css" type="text/css">
<style>
.orangeButton{
	background: #ff6f0f;
	font-weight: bold;
	color: white;
}
a {
	color: inherit;
	text-decoration: none;
}

 .hr-sect {
        display: flex;
        flex-basis: 100%;
        align-items: center;
        color: rgba(0, 0, 0, 0.35);
        font-size: 18px;
        margin: 10px 0px;
      }
  .hr-sect::before,
  .hr-sect::after {
    content: "";
    flex-grow: 1;
    background: rgba(0, 0, 0, 0.35);
    height: 1px;
    font-size: 0px;
    line-height: 0px;
    margin: 0px 16px;
  }
</style>

<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->
	
	
	<div class="container justify-content-center mb-5">
		<div class="row mb-5">
			<div class="col">
				<div class="row mt-5">
					<div class="col mt-5"></div>
					<div class="col text-center mt-5 mb-3">
						<div class="row">
							<div class="col fs-1 fw-semibold">
								로그인
							</div>
						</div>
						<div class="row">
							<div class="col text-secondary">
								482의 다양한 서비스와 혜택을 누리세요.
							</div>
						</div>
					  	 
					</div>
					<div class="col">
					
					</div>
				</div>
				
				<div class="row mt-2">
					<div class="col"></div>
					<div class="col-4">
						<div class="row">
							<div class="col">
								<input type="text" class="form-control p-3" placeholder="이메일 입력" id="email">
							</div>
						</div>
						
						<div class="row mt-2">
							<div class="col">
								<input type="password" class="form-control p-3 mb-1" placeholder="비밀번호 입력" id="pw" onkeydown="checkSendLogin(event)">
							</div>
						</div>
						
						<div class="row mt-2 mb-1" style="font-size: 15px;">
							
							<div class="col mb-1">
								 <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
								  <label class="form-check-label ms-1" for="flexCheckDefault" style="font-size: 15px;">
								    아이디 저장
								  </label>
							</div>
							
							<div class="col text-end text-secondary">
								<div class="row">
									<div class="col px-0">
										아이디 찾기
									</div>
									
									<div class="col">
										비밀번호 찾기
									</div>
								</div>
							</div>
						
						</div>
						
				
						<div class="row mt-4 mb-1">
							<div class="col d-grid">
								<input type="button" class="btn orangeButton p-2 fs-5" value="로그인" onclick="loginProcess()"
								style="height: 56px">
								
							</div>
						</div>
					
		
						<div class="row">
							<div class="col">
								<div class="row mt-2">
									<div class="col text-center" onclick="kakaoLogin()" style="cursor: pointer;">
										<img src="/safari/resources/img/user/kakaoLoginImg.png" class="img-fluid" style="width: 440px">
									</div>
									<!-- <div class="col-auto">
										<img src="/safari/resources/img/user/naver.png">
									</div>
									<div class="col">
										<img src="/safari/resources/img/user/facebook.png">
									</div> -->
								</div>
							</div>
						</div>
						
						<div class="row mt-5 text-center">
							<div class="col text-secondary" style="font-size: 15px">
								아직 482 계정이 없으신가요? 
								<span class="ms-1 text-primary">
									<a href="./joinPage" style="text-decoration: underline;">회원가입</a>
								</span>
							</div>
							
						
						</div>
						
					
					</div>
					<div class="col"></div>
				</div>
				<div class="row my-5">
					<div class="col">
				
					</div>
				</div>
				

				
			</div>
		
		</div>
	</div>
	
	
	
	
	
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

<%-- 아이디 Modal --%>
<div class="modal" id="emailInputModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered"> 
    <div class="modal-content">
      <div class="modal-header bg-light">
      	<h5></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
    	<div class="row mt-2">
    		<div class="col text-center">
    			아이디를 입력해주세요.
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

<%-- 비밀번호 Modal --%>
<div class="modal" id="pwInputModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered"> 
    <div class="modal-content">
      <div class="modal-header bg-light">
      	<h5></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
    	<div class="row mt-2 text-center">
    		<div class="col">
    			비밀번호를 입력해주세요.
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

<%-- 로그인 실패 Modal --%>
<div class="modal" id="loginFailModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered"> 
    <div class="modal-content">
      <div class="modal-header bg-light">
      	<h5></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
    	<div class="row mt-2">
    		<div class="col text-center">
    			아이디 혹은 비밀번호를 잘못 입력하셨습니다.
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


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>



<script >


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

// enter 처리
function checkSendLogin(event) {
	if (event.key === "Enter") {
	    loginProcess();
	  }
}



// 로그인 실패 modal
function loginFailModal() {
	
	const loginFailModal = bootstrap.Modal.getOrCreateInstance("#loginFailModal");
	loginFailModal.show();
}

// 로그인

function loginProcess() {
  const email = document.getElementById("email");
  const pw = document.getElementById("pw");

  if (email.value === "") {
    // 아이디 입력 modal
   /*  const emailInputModal = bootstrap.Modal.getOrCreateInstance("#emailInputModal");
    emailInputModal.show();

    setTimeout(function() {
      emailInputModal.hide();
    }, 2000);
 */
 
 	alert("아이디를 입력하세요");
    email.focus(); // 포커스 설정
    pw.value = "";
    return;
  }

  if (pw.value === "") {
    // 비밀번호 입력 modal
    /* const pwInputModal = bootstrap.Modal.getOrCreateInstance("#pwInputModal");
    pwInputModal.show();

    setTimeout(function() {
      pwInputModal.hide();
    }, 2000); */
    alert("비밀번호를 입력하세요");

    pw.focus(); // 포커스 설정
    return;
  }

  const xhr = new XMLHttpRequest();

  xhr.onreadystatechange = function() {
    if (xhr.readyState === 4 && xhr.status === 200) {
      const response = JSON.parse(xhr.responseText);
      if (response.result === "success") {
        console.log(response.result);
        location.href = "/safari/main/mainPage";
      } else {
        /* const loginFailModal = bootstrap.Modal.getOrCreateInstance("#loginFailModal");
        loginFailModal.show(); */
       // email.value = "";
        pw.value = "";

       /*  setTimeout(function() {
          loginFailModal.hide();
        }, 2000); */

        alert("아이디 혹은 비밀번호가 일치하지 않습니다");
        pw.focus(); // 포커스 설정
        return;
      }
    }
  };

  xhr.open("post", "/safari/user/loginProcess");
  xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhr.send("email=" + email.value + "&pw=" + pw.value);
}


// 카카오로그인 
function kakaoLogin() {
	
	const client_id = "0bfc8526a72f845c4e47508748e79a4a";
	const redirect_uri = "http://localhost:8181/safari/user/kakaoLogin";

	const KAKAO_AUTH_URL = `https://kauth.kakao.com/oauth/authorize?client_id=\${client_id}&redirect_uri=\${redirect_uri}&response_type=code` ;
	window.location.href = KAKAO_AUTH_URL;
	

}







</script>




</body>	
</html>