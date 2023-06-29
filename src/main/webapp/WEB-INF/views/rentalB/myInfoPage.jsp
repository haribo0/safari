<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사파리 | 대여메인</title>
<!-- 메타 섹션 -->
<jsp:include page="../common/meta.jsp"></jsp:include>
<!-- 카카오맵 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1e9b83aad808555fe4c49e65c538d60c&libraries=services"></script>

<!-- 메타 섹션 -->
</head>
<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../common/headerB.jsp"></jsp:include>
	<!-- 헤더 섹션 -->

	<div class="container-fluid main_box">
		<div class="row ms-5">
		
		
			<div class="col-2" style=""></div>
			<div class="col-2" style="position: fixed;">
				<div class="list-group list-group-flush">
					
					<!-- 왼쪽 카테고리 리스트 -->
					<jsp:include page="../common/navLeft.jsp"></jsp:include>
					<!-- 왼쪽 카테고리 리스트 -->
					
				</div>
				
				<div class="row mt-5 mb-5">
					<div class="col"> </div>
				</div>
			
			</div>
			
			
			<div class="col container ">
			
    			<h4 class="row mt-3 mb-4 fw-regular">내 정보</h4>

				<div class="row">
					
				    <div class="col"></div>
				    <div class="col-2 d-grid ">
				    	<div class="btn btn-dark btn-sm" onclick="openModal()">정보 수정</div>
				    </div>
				    
				</div>
				
				<hr class="border">
				
				
				<div class="row mt-2 mb-3 fw-medium">
					
					<div class="col ms-3">
						<div class="row fw-light">
							아이디
						</div>
						<div class="row mt-1">
							${dto.business_userid}
						</div>
					</div>
					<div class="col">
						<div class="row fw-light">
							상호명
						</div>
						<div class="row mt-1">
							${dto.business_name}
						</div>

					</div>
					<div class="col">
						<div class="row fw-light">
							대표자
						</div>
						<div class="row mt-1">
							${dto.business_owner}
						</div>
					</div>
					
					<div class="col">
						<div class="row fw-light">
							연락처
						</div>
						<div class="row mt-1">
							<c:set var="formattedPhone" value="${dto.phone.substring(0, 3)}-${dto.phone.substring(3, 7)}-${dto.phone.substring(7)}" />
							${formattedPhone}
						</div>
					</div>
					
				</div>
				
				
				<div class="row mt-5 mb-3 fw-medium">
				
					<div class="col ms-3">
						<div class="row fw-light">
							사업자 등록번호
						</div>
						<div class="row mt-1">
							
							${dto.reg_num}
							
						</div>
					</div>
					<div class="col">
						<div class="row fw-light">
							등록일
						</div>
						<div class="row mt-1">
							<fmt:formatDate value="${dto.reg_date}" pattern="MM/dd/yyyy" />
						
						</div>

					</div>
					<div class="col">
						<div class="row fw-light">
							주소지
						</div>
						<div class="row mt-1" id="compAddress">
							${dto.business_address}
						</div>
					</div>
					<div class="col ms-3">
						<div class="row fw-light">
							판매 허가
						</div>
						<div class="row mt-1">
							<c:choose>
								<c:when test="${dto.permission == 'Y'}">
									허가 완료
								</c:when>
								<c:otherwise>
									미허가
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					
				</div>
				
				<div class="row mt-5 mb-3 fw-medium">
					
					
				</div>
				
				
				
				
				<hr class="border">
				
			
				<div class="row mt-5 mb-2">
					
					<div id="map" style="width:500px;height:400px;"></div>
				    
				</div>
				
				<div class="row mt-5 mb-5">
					
					
				    
				</div>
				
				<div class="row mt-5 mb-5">
					
					
				    
				</div>
				
				
			
			</div>
			
			
		
			<div class="col-1"></div>
		</div>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<!-- 정보 수정 모달 -->
	<div class="modal modal-lg" id="updateInfoModal" tabindex="-1">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title"> 정보 수정  </h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      
        <form id="registrationForm" action="./businessRegisterProcess" method="POST" enctype="multipart/form-data">
	     
	      <div class="modal-body">
	       
		        <div class="row">
		        
		        	<div class="col-1"></div>
		        	<div class="col">
		        	
				    
				        <div class="form-group row mt-4">
				            <label for="businessUserId" class="col-3 col-form-label fw-normal">아이디</label>
				            <div class="col-4">
				                <input type="text" class="form-control" id="businessUserId" name="business_userid" readonly>
				            </div>
				            <div class="col">
				                <div class="btn btn-outline-dark" id="userIdBtn">중복확인</div>
				            </div>
				        </div>
				        <!-- <div class="form-group row mt-1 ms-1">
				            <div class="col-3">
				            </div>
				            <div class="col text-secondary">
				                중복된 아이디입니다. 
				            </div>
				        </div> -->
				        <div class="form-group row mt-3">
				            <label for="pw" class="col-3 col-form-label fw-normal">비밀번호</label>
				            <div class="col-6">
				                <input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호">
				            </div>
				        </div>
				        <div class="form-group row mt-3">
				            <label for="pwConfirm" class="col-3 col-form-label fw-normal">비밀번호 확인</label>
				            <div class="col-6">
				                <input type="password" class="form-control" id="pwConfirm" name="pwConfirm" placeholder="비밀번호 확인">
				            </div>				
				        </div>
				        
				        <div class="form-group row mt-1">
				            <div class="col-3"></div>
				            <div class="col fs-6 mt-1 ms-2 text-secondary" id="pwCheck">
				            	 
				            </div>
				
				        </div>
				        
				        <div class="form-group row mt-3">
				            <label for="regNum" class="col-3 col-form-label fw-normal">사업자등록번호</label>
				            <div class="col-6">
				                <input type="text" class="form-control" id="regNum" name="reg_num" >
				            </div>
				        </div>
				        
				        <div class="form-group row mt-3">
				            <label for="regImg" class="col-3 col-form-label fw-normal">사업자등록증</label>
				            <div class="col">
				                <input type="file" class="form-control-file" id="regImg" name="regImg" accept="image/*">
				            </div>
				        </div>
				        
				        <div class="form-group row mt-3">
				            <label for="businessOwner" class="col-3 col-form-label fw-normal">대표자 성함</label>
				            <div class="col-6">
				                <input type="text" class="form-control" id="businessOwner" name="business_owner" >
				            </div>
				        </div>
				        
				        <div class="form-group row mt-3">
				            <label for="businessName" class="col-3 col-form-label fw-normal">상호명</label>
				            <div class="col-6">
				                <input type="text" class="form-control" id="businessName" name="business_name">
				            </div>
				        </div>
				        
				        <div class="form-group row mt-3">
				            <label for="businessAddress" class="col-3 col-form-label fw-normal">회사 주소</label>
				            <div class="col-6">
				                <input type="text" class="form-control" id="businessAddress" name="business_address">
				            </div>
				        </div>
				        
				        <div class="form-group row mt-3">
				            <label for="addressDetail" class="col-3 col-form-label fw-normal">상세 주소</label>
				            <div class="col-6">
				                <input type="text" class="form-control" id="addressDetail" name="addressDetail" placeholder="">
				            </div>
				        </div>
						
				        <div class="form-group row mt-3">
				            <label for="phone" class="col-3 col-form-label fw-normal">연락처</label>
				            <div class="col-6">
				                <input type="text" class="form-control" id="phone" name="phone">
				            </div>
				        </div>
						
				        <!-- <div class="row mt-5 mb-5">
				        	<div class="col-6"></div>
				            <div class="col-3 me-0 d-grid">
				                <div class="btn btn-primary btn-block btn-dark" id="registerBtn">수정</div>
				            </div>
				        </div> -->
				        
				        <div class="row mt-5">
				        	
				        </div>
				        
				        

					    
		        	
		        	</div>
		        	<div class="col-1"></div>
		        </div>

	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">닫기</button>
	        <button type="button" class="btn btn-dark" id="registerBtn" >수정 완료</button>
	      </div>
	      </form>
	    </div>
	  </div>
	</div>
	<!-- 정보 수정 모달 -->
	
	
	
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>


<script>


// 회원 정보 가져오기 
function fillOutInfoForModal() {
	
	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			const userIdBox = document.getElementById("businessUserId");
			userIdBox.value = response.user.business_userid;
			
			const regNumBox = document.getElementById("regNum");
			regNumBox.value = response.user.reg_num;
			
			const businessOwnerBox = document.getElementById("businessOwner");
			businessOwnerBox.value = response.user.business_owner;
			
			const businessNameBox = document.getElementById("businessName");
			businessNameBox.value = response.user.business_name;
			
			const businessAddressBox = document.getElementById("businessAddress");
			businessAddressBox.value = response.user.business_address;
			
			const phoneBox = document.getElementById("phone");
			phoneBox.value = response.user.phone;
			
			
		}
	}

	// get 방식 
	xhr.open("get", "./getBusinessUserDto");
	xhr.send();
	
}




// 주소 가져오기 
function getAddress() {
	
	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			const compAddress = response.user.business_address;
			const compName = response.user.business_name;
			
			openMap(compAddress,compName);
		}
	}

	// get 방식 
	xhr.open("get", "./getBusinessUserDto");
	xhr.send();
	
}
	
function openMap(compAddress,compName) {
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
	    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};  
	
	//지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	//주소로 좌표를 검색합니다
	geocoder.addressSearch(compAddress, function(result, status) {
	
	// 정상적으로 검색이 완료됐으면 
	 if (status === kakao.maps.services.Status.OK) {
	
	    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	    // 결과값으로 받은 위치를 마커로 표시합니다
	    var marker = new kakao.maps.Marker({
	        map: map,
	        position: coords
	    });
	
	    // 인포윈도우로 장소에 대한 설명을 표시합니다
	    var infowindow = new kakao.maps.InfoWindow({
	    		
	        content: '<div style="width:150px;text-align:center;padding:6px 0;">'+compName+'</div>'
	    });
	    infowindow.open(map, marker);
	
	    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	    map.setCenter(coords);
	} 
	}); 
}


function openModal() {
	  const myModal = bootstrap.Modal.getOrCreateInstance('#updateInfoModal');

	  myModal.show();
}



window.addEventListener("DOMContentLoaded",function(){
	getAddress();
	fillOutInfoForModal();
	
});

</script>

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
const registerButton = document.getElementById("registerBtn");



// 아이디 중복체크 관련 로직 수행 

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

// 인풋 값 바뀌면 idCheck 다시

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



// 중복 체크 통과해야지 회원 가입 가능

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
	  if(!document.getElementById('regImg').files[0]) {
		  return;
	  }
	
	  updateUserInfo();

});



function updateUserInfo() {
	
	const modal = bootstrap.Modal.getOrCreateInstance("#updateInfoModal");
  	const xhr = new XMLHttpRequest();
  	const formData = new FormData();
	
	// 텍스트 데이터 추가
	formData.append('business_userid', document.getElementById('businessUserId').value);
	formData.append('pw', document.getElementById('pw').value);
	formData.append('reg_num', document.getElementById('regNum').value);
	formData.append('business_owner', document.getElementById('businessOwner').value);
	formData.append('business_name', document.getElementById('businessName').value);
	formData.append('business_address', document.getElementById('businessAddress').value);
	formData.append('addressDetail', document.getElementById('addressDetail').value);

	// 파일 데이터 추가
	const regImg = document.getElementById('regImg').files[0];
	if (regImg) {
	  formData.append('regImg', regImg);
	}

  
  
  xhr.onreadystatechange = function() {
    if (xhr.readyState == 4 && xhr.status == 200) {
      const response = JSON.parse(xhr.responseText);
      // 응답 처리
      modal.hide();
      
    }
  }

  xhr.open("POST", "./productRegisterProcess");
  xhr.send(formData);
}






</script>

</body>	
</html>
