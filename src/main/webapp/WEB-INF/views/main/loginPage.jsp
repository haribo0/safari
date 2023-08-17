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
  
  
.nav-pills .nav-link.active, .nav-pills .show>.nav-link {
	background-color: #E2E3E5;
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
							
							<!-- <div class="col mb-1">
								 <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
								  <label class="form-check-label ms-1" for="flexCheckDefault" style="font-size: 15px;">
								    아이디 저장
								  </label>
							</div> -->
							
							<div class="col text-end text-secondary">
								<div class="row">
									<div class="col" onclick="findIdPwModal()" style="cursor: pointer;">
										아이디 ∙ 비밀번호 찾기 
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
					
		
						<div class="row mb-1">
							<div class="col">
								<div class="row mt-2">
									<div class="col text-center" onclick="kakaoLogin()" style="cursor: pointer;">
										<img src="/safari/resources/img/user/kakaoLoginImg.png" class="img-fluid" style="width: 440px">
									</div>
									
								</div>
							</div>
						</div>
						
 						<div class="row">
							<div class="col">
								<div class="row mt-2">
									<div class="col text-center"  style="cursor: pointer;">
										<img src="/safari/resources/img/user/naver.png" class="img-fluid" style="width: 440px">
									</div>
									
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


<%-- Modal --%>
<div class="modal" id="findIdPwModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered"> 
    <div class="modal-content">
      <div class="modal-header bg-light">
      		<div class="row">
      			<div class="col ms-2 fw-semibold" style="font-size: 19px">
      				계정정보 찾기
      			</div>
      		</div>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
      	
      	<%--탭바 --%>   
		<%-- 탭 바 시작 --%>	
			<div class="row mt-3">
			
				<div class="col nav-pills nav-fill">
					<ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item" role="presentation">
							<button class="nav-link active text-dark fw-medium" id="findId-tab" data-bs-toggle="tab"
								data-bs-target="#findId" type="button" role="tab" aria-controls="findId"
								aria-selected="true" style="font-size: 18px">아이디(이메일) 찾기</button>
						</li>	
					  
			            <li class="nav-item" role="presentation">
			                <button class="nav-link text-dark fw-medium" id="question-tab" data-bs-toggle="tab"
			                    data-bs-target="#findPw" type="button" role="tab"
			                    aria-controls="question" aria-selected="false" style="font-size: 18px">비밀번호 찾기</button>
			            </li>
					</ul>	
			
				<%-- 내용 --%>
				
				<div class="tab-content" id="myTabContent">
					<%-- 아이디 찾기 --%>
					<div class="tab-pane fade show active" id="findId" role="tabpanel"
						aria-labelledby="findId-tab">
						
						<div class="row mt-2">
							<div class="col ms-4">
								
								
								<div class="row mt-3 mb-3">
									<div class="col"></div>
									<div class="col-9">
									
										<div class="row">
											<div class="col">
												482는 이메일을 아이디로 사용합니다. 
											</div>
										</div>
										
									
									
										<div class="row">
											<div class="col">
												회원가입 시 설정하였던 닉네임과 휴대폰 번호를 입력해주세요.
											</div>
										</div> 
									
										<div class="row mt-4">
											<div class="col">
												<table class="table">
													<tr class="border-top">
														<td style="background-color: #eef1f8; font-size: 18px" class="align-middle text-center">
															닉네임
														</td>
														<td>
														 	<input type="text" class="form-control" placeholder = "닉네임 입력" id="findIdForNickname">
														 	
														</td>
													</tr>
													<tr>
														<td style="background-color: #eef1f8; font-size: 18px" class="align-middle text-center">
															휴대폰 번호
														</td>
														<td>
															<input type="text" class="form-control" placeholder = "전화번호 입력" id="findIdForPhone"
															oninput="oninputPhone(this)" maxlength="13">
														</td>
													</tr>
												</table>
											</div>
										</div>
										
										<div class="row mt-1 mb-3" style="display: none;" id="nonexistentUserInfo">
											<div class="col text-center text-danger" style="font-size: 18px">
												일치하는 회원 정보가 없습니다.
											</div>
										</div>
										
										<div class="row mt-1 mb-3" style="display: none;" id="showUserIdInfo">
											<div class="col text-center" style="font-size: 18px">
												<span id = "tempNickname"></span>님의 아이디는 <span id="tempEmail" style="color: #ff6f0f"></span> 입니다.
											</div>
										</div>										
										
										<div class="row mt-2">
											<div class="col d-grid">
												<input type="button" class="btn btn-dark p-2" style="font-size: 18px" value="아이디 찾기"
												onclick="findUserId()">
											</div>
										</div>
									</div>
									<div class="col"></div>
								</div>
								
							</div>
						</div>
				
					</div>
					<%-- 아이디 찾기 --%>
		
				
						
					
					
					<div class="tab-pane fade" id="findPw" role="tabpanel"
						aria-labelledby="findPw-tab">
						
						<div class="row mt-2">
							<div class="col ms-4">
								
								
								<div class="row mt-3 mb-3">
									<div class="col"></div>
									<%-- 비밀번호 찾기 box --%>
									<div class="col-10" style="display: block" id="findPwBox">
									
										<div class="row">
											<div class="col">
												 482는 회원님의 비밀번호를 암호화 저장하기 때문에 분실 시 찾아드릴 수 없습니다.
											</div>
										</div>
										
									
									
										<div class="row">
											<div class="col">
												아이디와 닉네임, 휴대폰 번호를 입력해주시면 비밀번호를 새로 설정하실 수 있습니다.
											</div>
										</div> 
									
										<div class="row mt-4">
											<div class="col">
												<table class="table">
													<tr class="border-top">
														<td style="background-color: #eef1f8; font-size: 18px" class="align-middle text-center">
															아이디 (이메일)
														</td>
														<td>
														 	<input type="text" class="form-control" placeholder = "아이디 입력"
														 	id="findPwForId">
														 	
														</td>
													</tr>
													<tr>
														<td style="background-color: #eef1f8; font-size: 18px" class="align-middle text-center">
															닉네임
														</td>
														<td>
															<input type="text" class="form-control" placeholder = "닉네임 입력"
															id="findPwForNickname">
														</td>
													</tr>
													<tr>
														<td style="background-color: #eef1f8; font-size: 18px" class="align-middle text-center">
															휴대폰 번호
														</td>
														<td>
															<input type="text" class="form-control" 
															id="findPwForPhone" placeholder = "전화번호 입력" oninput="oninputPhone(this)" maxlength="13">
														</td>
													</tr>													
												</table>
											</div>
										</div>
										
										<div class="row mt-1 mb-3" style="display: none;" id="nonexistentUserInfo1">
											<div class="col text-center text-danger" style="font-size: 18px">
												일치하는 회원 정보가 없습니다.
											</div>
										</div>
										
										<div class="row mt-2">
											<div class="col d-grid">
												<input type="button" class="btn btn-dark p-2" style="font-size: 18px" value="비밀번호 등록 / 변경"
												onclick="findUserPw()">
											</div>
										</div>
									</div>
									<%-- 비밀번호 찾기 box --%>
									<div class="col-10" style="display: none" id="renewPwBox">
									
										<div class="row">
											<div class="col fw-semibold fs-4 text-center">
												비밀번호 재설정
											</div>
										</div>
										
										<div class="row mt-2">
											<div class="col text-center">
												새로 사용하기를 원하시는 비밀번호를 입력해 주세요.
											</div>
										</div>
										
										<div class="row">
											<div class="col"></div>
											<div class="col-8">
											
											<div class="row mt-4">
												<div class="col d-grid">
												
													<input type="password" class="p-2" placeholder = "비밀번호 입력" id="renewEnterPw">
							
												</div>
											</div>
											
											<div class="row mt-1" style="display: none;" id="pwRegNotMatchBox">
												<div class="col text-danger">
													비밀번호는 문자, 숫자, 특수문자 포함 8~20자로 입력하셔야 합니다.
												</div>
											</div>													
										
											<div class="row mt-2">
												<div class="col d-grid">
												
													<input type="password" class="p-2 text-secondary" placeholder = "비밀번호 확인" id="renewCheckPw">
							
												</div>
											</div>
																
													
										
											<div class="row mt-1" style="display: none;" id="pwNotMatchBox">
												<div class="col text-danger">
													입력하신 비밀번호가 일치하지 않습니다.
												</div>
											</div>										
										
										
											<div class="row mt-4 mb-3">
												<div class="col d-grid">
												
													<input type="button" class="p-2 bg-dark text-white fs-5" value = "완료"
													onclick = "renewUserPw()">
							
												
												</div>
											</div>						
											
											
											</div>
											<div class="col"></div>
										</div>
										
				
									</div>
									
									<div class="col"></div>
								</div>
								
							</div>
						</div>
				
							
							
							
						
						
					</div> 
					<%-- 비번 찾기 --%>
					
			
			
			</div>
			<%-- 탭 내용 끝 --%>
		
		</div>	
		
	
		<%-- 탭 바 끝 --%>

      </div>
      	
      	
      	

      </div>
      
  
    </div>
  </div>
</div>
<%-- Modal --%>

<%-- 회원가입 완료 Modal --%>
<div class="modal" id="renewPwSuccessModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered"> 
    <div class="modal-content">
      <div class="modal-header bg-light">
      	
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
    	<div class="row mt-2">
    		<div class="col text-center">
    			비밀번호가 수정되었습니다.
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


//전화번호 형식 변경 함수
function oninputPhone(target) {
    target.value = target.value
        .replace(/[^0-9]/g, '')
        .replace(/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
}

// 아이디 비밀번호 찾기 modal
function findIdPwModal() {
	
	const findIdPwModal = bootstrap.Modal.getOrCreateInstance("#findIdPwModal");
	findIdPwModal.show();
}


// 아이디 찾기
function findUserId() {
	
	const nickname = document.querySelector("#findIdForNickname");
	const phone = document.querySelector("#findIdForPhone");
	
	if (nickname.value.trim() == "") {
		alert("닉네임을 입력하세요");
		nickname.focus();
		return;
	}
	if (phone.value.trim() == "") {
		alert("전화번호를 입력하세요");
		phone.focus();
		return;
	}
	
	const errorBox = document.querySelector("#nonexistentUserInfo");
	const showUserIdInfo = document.querySelector("#showUserIdInfo");

	const tempNickname = document.querySelector("#tempNickname");
    const tempEmail = document.querySelector("#tempEmail");
	
	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
	    if (xhr.readyState === 4 && xhr.status === 200) {
	      const response = JSON.parse(xhr.responseText);
	      
	      if (response.findUserIdCount == 0) {
	    	  errorBox.style.display = "block";
	    	  showUserIdInfo.style.display = "none";
	    	  return;
	      } else {
	    	  tempNickname.innerText = response.findUserId.nickname;
	    	  tempEmail.innerText = response.findUserId.email;
	    	  errorBox.style.display = "none";
	    	  showUserIdInfo.style.display = "block";

	      }
	
	    }
	    
	}   
   xhr.open("post", "/safari/user/findIdForEmailAndPhone");
   xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
   xhr.send("nickname=" + nickname.value + "&phone=" + phone.value);
	
}

// 비밀번호 찾기 및 새 비밀번호 입력
function findUserPw() {
	
	const email = document.querySelector("#findPwForId");
	const nickname = document.querySelector("#findPwForNickname");
	const phone = document.querySelector("#findPwForPhone");
	
	const errorBox = document.querySelector("#nonexistentUserInfo1");
	
	const findPwBox = document.querySelector("#findPwBox");
	const renewPwBox = document.querySelector("#renewPwBox");
	
	
	if (email.value.trim() == "") {
		alert("아이디를 입력하세요");
		email.focus();
		return;
	}
	if (nickname.value.trim() == "") {
		alert("닉네임을 입력하세요");
		nickname.focus();
		return;
	}
	if (phone.value.trim() == "") {
		alert("전화번호를 입력하세요");
		phone.focus();
		return;
	}	
	
	const xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function() {
	    if (xhr.readyState === 4 && xhr.status === 200) {
	      const response = JSON.parse(xhr.responseText);
	      
	      if (response.findUserPwCount == 0) {
	    	  errorBox.style.display = "block";
	    	  return;
	      } else {
	    	  findPwBox.style.display = "none";
	    	  renewPwBox.style.display = "block";
	      }
	    }
	}
	xhr.open("post", "/safari/user/findPw");
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.send("email=" + email.value +  "&nickname=" + nickname.value + "&phone=" + phone.value);	
}


//비밀번호 확인 입력 시 일치 여부 확인
document.querySelector("#renewEnterPw").addEventListener("keyup", checkPwValue);
document.querySelector("#renewCheckPw").addEventListener("keyup", checkPwValue);


let pwChecked = false;

//비밀번호 일치 여부 확인
function checkPwValue() {
	
	const userPwBox = document.getElementById("renewEnterPw");
	const userPwCheckBox = document.getElementById("renewCheckPw");
	
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

// 비밀번호 찾기 - 변경
function renewUserPw() {
	
	const userPwBox = document.getElementById("renewEnterPw");
	const userPwCheckBox = document.getElementById("renewCheckPw");
	
	const findPwBox = document.querySelector("#findPwBox");
	
	
	if (!pwChecked) {
		alert("비밀번호가 일치하지 않습니다.");
		userPwCheckBox.value = "";
		userPwCheckBox.focus();
		return;
	}
	
	const xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function() {
	    if (xhr.readyState === 4 && xhr.status === 200) {
	      const response = JSON.parse(xhr.responseText);
	      
	  	  const renewPwSuccessModal = bootstrap.Modal.getOrCreateInstance("#renewPwSuccessModal");
	  	  renewPwSuccessModal.show();

		 	const findIdPwModal = bootstrap.Modal.getOrCreateInstance("#findIdPwModal");
			findIdPwModal.hide();
			
	     setTimeout(function() {
	    	 renewPwSuccessModal.hide();
	     }, 1000);
	     
	     renewPwBox.style.display = "none";
	     findPwBox.style.display = "block";

	     
	      
	    }
	    
	}
	xhr.open("post", "/safari/user/renewUserPw");
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.send("pw=" + userPwBox.value);	
}



//모달 닫힐 때 호출할 함수
function resetModalInputs() {
    const nickname = document.querySelector("#findIdForNickname");
    const phone = document.querySelector("#findIdForPhone");
	const errorBox = document.querySelector("#nonexistentUserInfo");
	const errorBox1 = document.querySelector("#nonexistentUserInfo1");
	const showUserIdInfo = document.querySelector("#showUserIdInfo");
	
	const findPwBox = document.querySelector("#findPwBox");
	
	const email = document.querySelector("#findPwForId");
	const nickname1 = document.querySelector("#findPwForNickname");
	const phone1 = document.querySelector("#findPwForPhone");
	
	const userPwBox = document.querySelector("#renewEnterPw");
	const userPwCheckBox = document.querySelector("#renewCheckPw");

    nickname.value = ""; // 닉네임 입력값 초기화
    phone.value = "";    // 전화번호 입력값 초기화
    
    email.value = "";
    nickname1.value = "";
    phone1.value = "";
    
    userPwBox.value = "";
    userPwCheckBox.value = "";
    
    errorBox.style.display = "none";
    errorBox1.style.display = "none";
    showUserIdInfo.style.display = "none";
    
    findPwBox.style.display = "block";
    
 
}

//모달 창을 닫을 때 이벤트 처리
const findIdPwModal1 = bootstrap.Modal.getOrCreateInstance("#findIdPwModal");
findIdPwModal1.hide(); // 모달을 닫기 전에 값 초기화
findIdPwModal1._element.addEventListener("hidden.bs.modal", function () {
    resetModalInputs(); // 모달이 숨겨진 후에 초기화 함수 호출
});



// 로그인 실패 modal
function loginFailModal() {
	
	const loginFailModal = bootstrap.Modal.getOrCreateInstance("#loginFailModal");
	loginFailModal.show();
}

// 로그인

function loginProcess() {
  const email = document.getElementById("email");
  const pw = document.getElementById("pw");

  if (email.value == "") {

 
 	alert("아이디를 입력하세요");
    email.focus(); // 포커스 설정
    pw.value = "";
    return;
  }

  if (pw.value == "") {

    alert("비밀번호를 입력하세요");

    pw.focus(); // 포커스 설정
    return;
  }

  const xhr = new XMLHttpRequest();

  xhr.onreadystatechange = function() {
    if (xhr.readyState === 4 && xhr.status === 200) {
      const response = JSON.parse(xhr.responseText);
      if (response.result === "success") {
        
        location.href = "/safari/main/mainPage";
      } else {
 
        pw.value = "";



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