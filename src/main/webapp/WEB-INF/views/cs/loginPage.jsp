<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사파리 | 로그인</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<style>
  body {
    display: flex;
    flex-direction: column;
    min-height: 100vh;
  }
  
  .content {
    flex: 1;
  }
  
  .footer {
    flex-shrink: 0;
  }
</style>


</head>
<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../common/csTopNav2.jsp"></jsp:include>
	<!-- 헤더 섹션 -->
	
	<div class="container d-flex justify-content-center content">
		<!-- <form action="loginProcess" method="post" id="loginForm"> -->
			
		    <div class="row " >
		        <div class="col">
		        </div>
		        <div class="col-10">
		        
		        	  <div class="row my-2" >
				        <div class="col d-grid">
				        	
			        	</div>
				      </div>
		        	  <div class="row " >
				        <div class="col  d-grid">
				        	<div class="row " >
					          <div class="col fw-bold fs-4 d-grid">
					          	  사파리
				        	  </div>
					        </div>
				        	<div class="row " >
					          <div class="col fs-5 d-grid">
					          	  고객지원서비스
				        	  </div>
					        </div>
			        	</div>
				      </div>
		        
		        	 <div class="row mt-5 mb-1" >
				        <div class="col-sm-12">
				          <label for="uid" class="form-label">아이디</label>
				          <input type="text" class="form-control" id="uid" placeholder="" value="" required="" name="username">
				          <div class="invalid-feedback">
				            아이디를 입력해주세요.
				          </div>
				        </div>
				
				        <div class="col-sm-12 mt-4">
				          <label for="upw" class="form-label">비밀번호</label>
				          <input type="password" class="form-control" id="upw" placeholder="" value="" required="" name="password">
				          <div class="invalid-feedback">
				            비밀번호를 입력해주세요.
				          </div>
				        </div>
				        
				      </div>
				      
				      <div class="row mt-5" >
				        <div class="col d-grid">
				        	<button class="btn btn-dark" onclick="loginAjax()">로그인</button>
			        	</div>
				      </div>
		        	  
		        	  
		        	  <div class="row my-5" >
				        <div class="col d-grid">
				        	
			        	</div>
				      </div>
		        
		        </div>
		        <div class="col">
		        </div>
	        </div>
		        
		   
		<!-- </form>		 -->
		

	      
	</div>
	
			
	<div class="row mt-5 justify-content-center">

        <!-- <div class="col-sm-6" style="max-width: 320px; cursor: pointer;">
        	<a href="#">
        		<img class="img-fluid" src="/safari/resources/img/kakao_login_large_wide.png"  alt="">
        	</a>
        </div> -->

        
    </div>
	

<%-- 로그인 실패 Modal --%>
<div class="modal" id="fillOutInputModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered"> 
    <div class="modal-content">
    <div class="modal-header bg-light py-2">
        <button type="button" class="btn-close btn-sm" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
    	<div class="row mt-3">
    		<div class="col text-center" id="modalTxt">
    			아이디를 입력해주세요.
    		</div>
    	</div>
	    <div class="row mt-2">
    		<div class="col text-end">
    			<button type="button" class="btn  btn-sm btn-dark" data-bs-dismiss="modal">확인</button>
    		</div>
    	</div>
      </div>
      <!-- <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-outline-dark" data-bs-dismiss="modal">창닫기</button>
      </div>   -->    
    </div>
  </div>
</div>
<%--  Modal --%>

<%-- 로그인 실패 Modal --%>
<div class="modal" id="loginFailModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered"> 
    <div class="modal-content">
     <div class="modal-header bg-light py-2">
        <button type="button" class="btn-close btn-sm" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
    	<div class="row mt-2">
    		<div class="col text-center">
    			아이디 혹은 비밀번호를 잘못 입력하셨습니다.
    		</div>
    	</div>
    	<div class="row mt-2">
    		<div class="col text-end">
    			<button type="button" class="btn  btn-sm btn-dark" data-bs-dismiss="modal">확인</button>
    		</div>
    	</div>
      </div>
    </div>
  </div>
</div>
<%--  Modal --%>

	
	
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>



<script >

const idBox = document.getElementById("uid");
const pwBox = document.getElementById("upw");

//로그인 실패 modal
function loginFailModal() {
	
	const loginFailModal = bootstrap.Modal.getOrCreateInstance("#loginFailModal");
	loginFailModal.show();
}

// 엔터로 로그인 
function keyUpEvent(e) {
	if (e.key === "Enter" && !e.shiftKey) {
		loginAjax();
	}
}

//엔터로 로그인 
function enter() {
	// 이벤트 리스너 추가 
	idBox.addEventListener("keyup", keyUpEvent);
	pwBox.addEventListener("keyup", keyUpEvent);
}

window.addEventListener("DOMContentLoaded",function(){
	enter();
});

function loginAjax() {

	const id = document.getElementById("uid").value.trim();
	const pw = document.getElementById("upw").value.trim();
	const loginForm = document.getElementById("loginForm");
	const fillOutInputModal = bootstrap.Modal.getOrCreateInstance("#fillOutInputModal");
	const modalTxt = document.getElementById("modalTxt");
	
	if(!id) {
		modalTxt.innerText = "아이디를 입력해주세요.";
		fillOutInputModal.show();
		id.focus();
		return
	}
	if(!pw) {
		modalTxt.innerText = "비밀번호를 입력해주세요.";
		fillOutInputModal.show();
		pw.focus();
		return
	}
	

	
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function() {
	  if (xhr.readyState === 4 && xhr.status === 200) {
	    const response = JSON.parse(xhr.responseText);
	    if (response.result === "success") {
	      console.log(response.result);
	      location.href = "./mainPage";
	    } else {
	      idBox.value = "";
	      pwBox.value = "";
	      loginFailModal();
	
	     // alert("아이디 혹은 비밀번호가 일치하지 않습니다");
	      return;
	    }
	  }
	};
	
	xhr.open("post", "./login");
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.send("username=" + id + "&password=" + pw);
	

}








</script>




</body>	
</html>