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
	<div class="row mt-0">
		<div class="col"></div>
		<div class="col-10">
			<!-- <h4>직원 관리</h4> -->
			<h5 class="fw-bolder">직원 관리</h5>
			
			<div class="row">
				<div class="col text-end d-grid "></div>
				<div class="col-2 text-end me-0 pe-0">
					<div class="btn btn-sm btn-dark px-4 py-1" onclick="openModal()">직원 추가</div>
				</div>
			</div>
			
			<!-- <div class="row mt-3 mb-3 text-center bg-secondary-subtle py-2 fw-bolder">
				<div class="col-1">#</div>
				<div class="col">이름</div>
				<div class="col">소속</div>
				<div class="col">직급</div>
				<div class="col">근무일</div>
				<div class="col">출근</div>
				<div class="col">퇴근</div>
				<div class="col">근무상태</div>
			</div> -->
			
			
			<div class="row mt-3 mb-3 text-center bg-secondary-subtle py-2 fw-bolder">
				<div class="col-1">사번</div>
				<div class="col">직급</div>
				<div class="col">이름</div>
				<div class="col">닉네임</div>
				<div class="col">소속</div>
				<div class="col-3">근무일</div>
				<div class="col">출근</div>
				<div class="col">퇴근</div>
				<div class="col">근무상태</div>
			</div>
			
			
			
			
			<div id="listBox"></div>
			
			
		</div>
		<div class="col"></div>
	</div>
	<div class="row my-5">
		<div class="col d-grid">
		</div>
	</div>
</div>







	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->







<!-- 직원 등록 모달 -->
<div class="modal modal" id="registerEmployeeModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title"> 직원 등록 </h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
     <form action="./productRegisterProcess" id="frm" method="POST" enctype="multipart/form-data">
     
      <div class="modal-body">
       
	        <div class="row">
	        
	        	<div class="col-1"></div>
	        	<div class="col">
	        	
				        <div class="form-group row mt-2">
				            <div class="col-10">
				            	<div class="mb-1"><label for="username" class="col-form-label fw-bolder">아이디</label></div>
				                <input type="text" class="form-control" id="username" name="username"  placeholder="아이디">
				            </div>
				        </div>
				
				        <div class="form-group row mt-2">
				            <div class="col-10">
				            	<div class="mb-1"><label for="password" class="col-form-label fw-bolder">비밀번호</label></div>
				                <input type="password" class="form-control" id="password" name="password"  placeholder="비밀번호">
				            </div>
				        </div>
				        <div class="form-group row mt-2">
				            <div class="col-10">
				            	<div class="mb-1"><label for="name" class="col-form-label fw-bolder">이름</label></div>
				                <input type="text" class="form-control" id="name" name="name"  placeholder="이름">
				            </div>
				        </div>
				
				        <div class="form-group row mt-2">
				            <div class="col-10">
				            	<div class="mb-1"><label for="job_position" class="col-form-label fw-bolder">직급</label></div>
				                <input type="text" class="form-control" id="job_position" name="job_position"  placeholder="직급">
				            </div>
				        </div>
				       
				        <div class="form-group row mt-2">
				            <div class="col-10">
				            	<div class="mb-1"><label for="nickname" class="col-form-label fw-bolder">닉네임</label></div>
				                <input type="text" class="form-control" id="nickname" name="nickname"  placeholder="닉네임">
				            </div>
				        </div>
				
				
				       
				        
				        
				
				        <!-- <div class="form-group row mt-4">
				            
				            <div class="col-6">
				            <div class="mb-1"><label for="mainImg" class=" col-form-label fw-medium">프로필사진?</label></div>
				                <input type="file" class="form-control-file" id="mainImg" name="mainImg" accept="images/*">
				            </div>
				            
				        </div> -->
				
				        <div class="form-group row mt-4">
				            
				        </div>
				        
	        	
	        	</div>
	        	<div class="col-1"></div>
	        </div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-dark" onclick="registerEmployee()">직원 등록</button>
      </div>
      </form>
    </div>
  </div>
</div>
<!-- 상품 등록 모달 -->







<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

 <script>
 
 
 
 function openModal() {
	const myModal = bootstrap.Modal.getOrCreateInstance('#registerEmployeeModal');
	myModal.show();
	
	
}
 
 
 

// 직원 등록 
function registerEmployee() {
	
	const modal = bootstrap.Modal.getOrCreateInstance("#registerEmployeeModal");
	
	const xhr = new XMLHttpRequest();
	const formData = new FormData();
	
	// 텍스트 데이터 추가
	formData.append('username', document.getElementById('username').value);
	formData.append('password', document.getElementById('password').value);
	formData.append('name', document.getElementById('name').value);
	formData.append('job_position', document.getElementById('job_position').value);
	formData.append('nickname', document.getElementById('nickname').value);

/* 	// 파일 데이터 추가
	const mainImg = document.getElementById('mainImg').files[0];
	if (mainImg) {
	  formData.append('mainImg', mainImg);
	}
	
	const itemImgs = document.getElementById('itemImgs').files;
	for (let i = 0; i < itemImgs.length; i++) {
	  formData.append('itemImgs', itemImgs[i]);
	} */
	
	
	


	xhr.onreadystatechange = function() {
	  if (xhr.readyState == 4 && xhr.status == 200) {
	    const response = JSON.parse(xhr.responseText);
	    // 응답 처리
	    getEmployeeList();
	    // input 비워주기 
		document.getElementById('username').value = "";
		document.getElementById('password').value = "";
		document.getElementById('name').value = "";
		document.getElementById('job_position').value = "";
		document.getElementById('nickname').value = "";

	    modal.hide();
	    
	    
	  }
	}

	xhr.open("POST", "./registerEmployeeProcess");
	xhr.send(formData);
}
 
 
 
let intervalHandler = null;
 
function getEmployeeList() {
	
	const listBox = document.getElementById("listBox");

	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			listBox.innerHTML = "";

			response.list.forEach(function(map){
				
				// 첫 번째 줄 생성
				const rowDiv = document.createElement('div');
				rowDiv.classList.add('row', 'text-center', 'py-1');
				rowDiv.id ='row-'+map.empDto.id;
				
				// 번호 열 생성
				const col1Div = document.createElement('div');
				col1Div.classList.add('col-1');
				col1Div.textContent = map.empDto.id;
				rowDiv.appendChild(col1Div);

				// 직급 열 생성
				const col4Div = document.createElement('div');
				col4Div.classList.add('col');
				col4Div.textContent = map.empDto.job_position;
				rowDiv.appendChild(col4Div);
				
				// 이름 열 생성
				const col2Div = document.createElement('div');
				col2Div.classList.add('col');
				col2Div.textContent = map.empDto.name;
				rowDiv.appendChild(col2Div);

				// 닉네임 열 생성
				const colNickDiv = document.createElement('div');
				colNickDiv.classList.add('col');
				colNickDiv.textContent = map.empDto.nickname;
				rowDiv.appendChild(colNickDiv);

				// 소속 열 생성
				const col3Div = document.createElement('div');
				col3Div.classList.add('col');
				col3Div.textContent = map.empDto.department;
				rowDiv.appendChild(col3Div);

				// 근무일 열 생성
				const col5Div = document.createElement('div');
				col5Div.classList.add('col-3');
				
				const daysOfWeek = ['월', '화', '수', '목', '금', '토', '일'];
				
				for (let i = 0; i < daysOfWeek.length; i++) {
					
				  const checkbox = document.createElement('input');
				  checkbox.type = 'checkbox';
				  checkbox.name = 'weekday';
				  checkbox.className = 'inputWeekday';
				  checkbox.setAttribute("data-emp-id", map.empDto.id);
				  checkbox.value = daysOfWeek[i];
				  checkbox.id = 'checkbox-'+map.empDto.id+"-"+i;
				  
				  // 근무날인지 체크 
				  map.scheduleList.forEach(function(schedule){
					  // console.log("schedule.weekday"+schedule.weekday);
					  if (schedule.weekday==daysOfWeek[i]) {
						  // console.log("schedule.weekday"+schedule.weekday);
						  // console.log("daysOfWeek"+daysOfWeek[i]);
	                      checkbox.checked = true; // Set the checkbox as checked
	                  }
				  });
                  
				  const label = document.createElement('label');
				  label.textContent = daysOfWeek[i];
				  label.className = 'pe-2' ;
				  label.setAttribute('for', 'checkbox-'+map.empDto.id+"-"+i);
				
				  // 변화가 있으면 함수 실행 
				  checkbox.addEventListener('change',changeDataForSchedule);

				  col5Div.appendChild(checkbox);
				  col5Div.appendChild(label);
				}
				rowDiv.appendChild(col5Div);
				

				// 출근 열 생성
				const col6Div = document.createElement('div');
				col6Div.classList.add('col');
				const select1 = document.createElement('select');
				select1.classList.add('col');
				select1.className = 'startTime';
				select1.setAttribute("data-emp-id", map.empDto.id);
				select1.id = 'start_time-'+map.empDto.id;
				select1.name = 'start_time';
				for (let hour = 00; hour <= 24; hour++) {
				    let option = document.createElement('option');
				    let time = ('0' + hour).slice(-2) + ':00';
				    option.value = hour;
				    option.textContent = time;
				    if(map.scheduleList.length>0) {
				    	// 데이터에서 출근 시간 불러와서 같으면 selected 
					    if (hour == map.scheduleList[0].start_time) {
					        option.selected = true; // Set the option as selected
					    }
				    }
				    select1.appendChild(option);
				}
				
				select1.addEventListener('change',changeDataForSchedule);
				col6Div.appendChild(select1);
				rowDiv.appendChild(col6Div);

				// 퇴근 열 생성
				const col7Div = document.createElement('div');
				col7Div.classList.add('col');
				const select = document.createElement('select');
				select.className = 'endTime';
				select.name = 'end_time';
				select.setAttribute("data-emp-id", map.empDto.id);
				for (let hour = 00; hour <= 24; hour++) {
				    let option = document.createElement('option');
				    let time = ('0' + hour).slice(-2) + ':00';
				    option.value = hour;
				    option.textContent = time;
				    if(map.scheduleList.length>0) {
				    	// 데이터에서 퇴근 시간 불러와서 같으면 selected 				    
					    if (hour == map.scheduleList[0].end_time) {
					        option.selected = true; // Set the option as selected
					    }
				    }
				    select.appendChild(option);
				}
				select.addEventListener('change',changeDataForSchedule);
				col7Div.appendChild(select);
				rowDiv.appendChild(col7Div);

				// 근무상태 열 생성
				const col8Div = document.createElement('div');
				col8Div.classList.add('col');
				col8Div.textContent = map.workStatus;
				rowDiv.appendChild(col8Div);

				// 첫 번째 줄과 구분선(hr) 추가
				listBox.appendChild(rowDiv);
				listBox.appendChild(document.createElement('hr'));
			});
			
			
			/* intervalHandler = setInterval(() => {
				getEmployeeList();
			}, 10000); */
			
		}
	}

	// get 방식 
	xhr.open("get", "./getEmployeeList");
	xhr.send();

}


function changeDataForSchedule(e) {

	const empId = e.currentTarget.getAttribute("data-emp-id");
	const rowBox = document.getElementById("row-"+empId);
	
	// 체크 박스 요일 
	const checkboxes = rowBox.querySelectorAll('.inputWeekday');
	let days = []; 
	rowBox.querySelectorAll('.inputWeekday').forEach(function(checkbox){
		if (checkbox.checked) {
			days.push(checkbox.value);
		}
	});
	
	// 출근 시간 숫자 
	const startTimeBox = rowBox.querySelector('.startTime');
	startTime = startTimeBox.value;
	
	// 퇴근 시간 숫자 
	const endTimeBox = rowBox.querySelector('.endTime');
	endTime = endTimeBox.value;
	
	
	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			// 리프레시 
			getEmployeeList();
			
		}
	}

	// post 방식 
	xhr.open("post", "./changeSchedule");
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.send("days="+days+"&startTime="+startTime+"&endTime="+endTime+"&empId="+empId);
	
	
	
}



window.addEventListener("DOMContentLoaded",function(){
	getEmployeeList();

	
});
 
 
 
</script>
 

</body>
</html>