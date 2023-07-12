<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 메타 섹션 -->
<jsp:include page="../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->

</head>
<body>

<!-- 헤더 섹션 -->
<jsp:include page="../common/csTopNav2.jsp"></jsp:include>
<!-- 헤더 섹션 -->

<div class="container-fluid">
	<div class="row mt-5">
		<div class="col">
			
		</div>
		
		
		<div class="col-11">
			<div class="row">
				<%-- <div class="col" id="workBox">
					${workState}   
					<div class="ms-3 btn btn-outline-dark" onclick="startWorking()">출근</div>
					<div class="ms-3 btn btn-outline-dark" onclick="stopWorking()">퇴근</div>
				</div> --%>
				
				
				
			</div>
		</div>
		
		
		<div class="col">
		
		</div>
	</div>
</div>








<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

<script>
/* 
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
	
	const workBox = document.getElementById("workBox");

	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			workBox.innerHTML = "";
			const workState = response.workState
			workBox.innerText = workState;

			if(response.workState != "근무") {
				const button = document.createElement('div');
				button.classList.add('ms-3', 'btn', 'btn-outline-dark');
				if(workState==='휴무') button.classList.add('disabled');
				button.textContent = '출근';
				button.addEventListener('click', startWorking);
				workBox.appendChild(button);
			} else {
				const button = document.createElement('div');
				button.classList.add('ms-3', 'btn', 'btn-outline-dark');
				button.textContent = '퇴근';
				button.addEventListener('click', stopWorking);
				workBox.appendChild(button);
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
 */



</script>


</body>
</html>