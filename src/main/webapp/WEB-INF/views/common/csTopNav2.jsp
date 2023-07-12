<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>




<nav class="navbar navbar-expand navbar-dark bg-dark">
  <div class="container-fluid">
    <a href="./mainPage" class="navbar-brand">
      <img class="img-fluid my-2 ms-4 me-3" width="74px" src="/safari/resources/img/logo0.png">
    </a>
    
    <a class="navbar-brand" href="./mainPage">고객관리서비스</a>
    
    <!-- 왼쪽 메뉴 -->
    <ul class="navbar-nav  me-auto mb-lg-0">
      <%-- <c:if test="${!empty empUser && empUser.master == 1}">
      
        <li class="nav-item">
          <a class="nav-link" href="#">대시보드</a>
        </li>
      </c:if> --%>
      
      
    
		<li class="nav-item ms-3">
		  <a class="nav-link" href="./inquiries"> 1대1 문의</a>
		</li>
		
		<li class="nav-item ms-3">
		  <a class="nav-link" href="./liveChat"> 실시간 채팅</a>
		</li>
		
		<c:if test="${!empty empUser && empUser.master == 1}">
		  <li class="nav-item ms-3">
		    <a class="nav-link" href="./employees">직원 관리</a>
		  </li>
		</c:if>
    
    </ul>
    
    
    
    <!-- 오른쪽 메뉴 -->
	<ul class="navbar-nav ml-auto">
		<c:if test="${!empty empUser}">
		  <li class="nav-item">
		    <a class="nav-link" href="#">
		    	<div class="form-check form-switch">
				  <input class="form-check-input" type="checkbox" role="switch" id="workStateCheckbox" checked>
				  <label class="form-check-label" id="workStateText" for="workStateCheckbox" >근무</label>
				</div>
		    </a>
		  </li>
		</c:if>
		  <!-- 알림 -->
		  <!-- 
		  <li class="nav-item me-1">
		    <a class="nav-link" href="#"><i class="bi bi-bell"></i></a>
		  </li>
		   -->
	  
	  <c:if test="${!empty empUser && true}">
		  <li class="nav-item me-1">
		    <a class="nav-link" href="#"></i></a>
		  </li>
	  </c:if>
	  
	  
	  <li class="nav-item me-4">
	    <c:if test="${!empty empUser}">
	      <div class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	          ${empUser.nickname}님
	        </a>
	        <ul class="dropdown-menu" aria-labelledby="userDropdown">
	          <li><a class="dropdown-item" href="#"> 근무중 </a></li>
	          <li><a class="dropdown-item" href="${pageContext.request.contextPath}/cs/logoutProcess">로그아웃</a></li>
	        </ul>
	      </div>
	    </c:if>
	  </li>
	  
	  <li class="nav-item me-3">
	    <c:choose>
	      <c:when test="${empty empUser}">
	        <a href="${pageContext.request.contextPath}/cs/loginPage" class="nav-link me-2">로그인</a>
	      </c:when>
	    </c:choose>
	  </li>
	</ul>

    
    
    
  </div>
</nav>


<div class="row  mb-5">
<div class="col"> </div>
</div>




<script>

const checkbox = document.getElementById("workStateCheckbox");
const workStateBox = document.getElementById("workStateText");



checkbox.addEventListener("change", function() {
  if (checkbox.checked) {
    // 출근 시간을 디비에 저장하는 로직을 작성합니다.
    startWorking();
  } else {
    // 퇴근 시간을 디비에 저장하는 로직을 작성합니다.
    stopWorking();
  }
});



function startWorking() {

	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			getWorkStateByEmpId();
		}
	}

	// post 방식 
	xhr.open("post", "./startWorking");
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.send();

}

function stopWorking() {

	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			getWorkStateByEmpId();
		}
	}

	// post 방식 
	xhr.open("post", "./stopWorking");
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.send();

}

function getWorkStateByEmpId() {
	

	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			console.log(response.workState);
			
			workStateBox.innerHTML = "";
			workStateBox.innerText = response.workState;

			if(response.workState != "근무") {
				checkbox.checked = false;

			} else {
				checkbox.checked = true;

			}
			
			
		}
	}

	// get 방식 
	xhr.open("get", "./getWorkStateByEmpId");
	xhr.send();

}



window.addEventListener("DOMContentLoaded",function(){
	getWorkStateByEmpId();
	

});







</script>