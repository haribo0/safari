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
	<jsp:include page="../common/headerB.jsp"></jsp:include>
	<!-- 헤더 섹션 -->

<div class="container mt-5">
    <div class="row mt-5">
    <div class="col-3">
    
		<div class="list-group list-group-flush">
			
			<!-- 왼쪽 카테고리 리스트 -->
			<jsp:include page="../common/navLeft.jsp"></jsp:include>
			<!-- 왼쪽 카테고리 리스트 -->
			
		</div>
		
		<div class="row mt-5 mb-5">
			<div class="col"> </div>
		</div>
	
			
    
    </div>
    <div class="col">
    	<!-- <h1 class="fs-3 mt-2 mb-4">  </h1> -->
    	<h4 class="row mt-3 mb-4 fw-regular">정보 수정</h4>
    	
    	<hr class="border ">
    
    <form id="registrationForm" action="./businessRegisterProcess" method="POST" enctype="multipart/form-data">
    
        <div class="form-group row mt-4">
            <label for="businessUserId" class="col-3 col-form-label fw-normal">아이디</label>
            <div class="col-4">
                <input type="text" class="form-control" id="businessUserId" name="business_userid" value="${dto.business_userid}" readonly>
            </div>
        </div>
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
            <div class="col fs-6 mt-1 text-secondary" id="pwCheck"></div>

        </div>
        
        <div class="form-group row mt-3">
            <label for="regNum" class="col-3 col-form-label fw-normal">사업자등록번호</label>
            <div class="col-6">
                <input type="text" class="form-control" id="regNum" name="reg_num" value="${dto.reg_num}">
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
                <input type="text" class="form-control" id="businessOwner" name="business_owner" value="${dto.business_owner }">
            </div>
        </div>
        
        <div class="form-group row mt-3">
            <label for="businessName" class="col-3 col-form-label fw-normal">상호명</label>
            <div class="col-6">
                <input type="text" class="form-control" id="businessName" name="business_name" value="${dto.business_name }">
            </div>
        </div>
        
        <div class="form-group row mt-3">
            <label for="businessAddress" class="col-3 col-form-label fw-normal">회사 주소</label>
            <div class="col-6">
                <input type="text" class="form-control" id="businessAddress" name="business_address" value="${dto.business_address }">
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
                <input type="text" class="form-control" id="phone" name="phone" value="${dto.phone }">
            </div>
        </div>
		
        <div class="row mt-5 mb-5">
        	<div class="col-6"></div>
            <div class="col-3 me-0 d-grid">
                <div class="btn btn-primary btn-block btn-dark" id="registerBtn">수정</div>
            </div>
        </div>
        
        <div class="row mt-5">
        	
        </div>
        
        
    </form>
    </div>
    <div class="col-2"></div>
    </div>
    		
    <div class="row mt-5 mb-5">
    	<div class="col-6"></div>
        <div class="col-3 me-0 d-grid">
        </div>
    </div>
</div>

	
	
	
	
	
	
	
	
	
	<!-- 정보 수정 모달 -->
	<div class="modal modal-lg" id="updateInfoModal" tabindex="-1">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title"> 상품 등록 </h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      
	     <form action="./productRegisterProcess" id="frm" method="POST" enctype="multipart/form-data">
	     
	      <div class="modal-body">
	       
		        <div class="row">
		        
		        	<div class="col-1"></div>
		        	<div class="col">
		        	
					        <div class="form-group row mt-1">
					            <div class="col-10">
					            	<div class="mb-1"><label for="title" class="col-form-label fw-medium">상품 제목</label></div>
					                <input type="text" class="form-control" id="title" name="title"  placeholder="상품 제목">
					            </div>
					        </div>
					        
					        <div class="form-group row mt-3">
					            
					            <div class="col-3">
					            <div class="mb-1"><label for="mainCategory" class=" col-form-label fw-medium">카테고리 대분류</label></div>
					            	<select class="form-control" id="mainCategory" name="mainCategory">
					            		<option value="0">대분류 선택 </option>
					            		<c:forEach  var="category" items="${mainCategoryList}">
					            			<option value="${category.id}"> ${category.main_category_name} </option>
					            		</c:forEach>
					                </select>
					            </div>
					
					            <div class="col-3">
					            <div class="mb-1"><label for="category" class=" col-form-label fw-medium">카테고리 소분류</label></div>
					                <select class="form-control" id="subCategory" name="sub_category_id">
					                	<option value="0">소분류 선택</option>
					                </select>
					            </div>
					        </div>
					
					        <div class="form-group row mt-3">
					            <div class="col-10">
					            <div class="mb-1"><label for="description" class="col-form-label fw-medium">상품 설명</label></div>
					                <textarea class="form-control" id="description" name="item_description" rows="5" placeholder="상품 설명"></textarea>
					            </div>
					        </div>
							
								
								
					        <div class="form-group row mt-3">
					            <div class="col">
					            	<div class="mb-1"><label for="deposit" class="col-form-label fw-medium">보증금</label></div>
					                <input type="text" class="form-control" id="deposit" name="deposit"  placeholder="보증금">
					            </div>
					            <div class="col">
					            	<div class="mb-1"><label for="price" class="col-form-label fw-medium">대여 가격 (월)</label></div>
					                <input type="text" class="form-control" id="price" name="price"  placeholder="가격">
					            </div>
					            <div class="col">
					            	<div class="mb-1"><label for="quantity" class="col-form-label fw-medium">총 운영 수량</label></div>
					                <input type="text" class="form-control" id="quantity" name="quantity" placeholder="운영 수량">
					            </div>
					            <div class="col-2">
					            </div>
					        </div>
					        
					       <div class="form-group row mt-3">
					            <div class="col-10">
					            	<div class="mb-1"><label for="" class="col col-form-label fw-medium">기간 별 할인 (선택사항)</label></div>
					            	
					            	<div class="form-group row mt-2" id="disc_form">
							        	<div class="row ">
							            	<label for="mon12" class="col-2 col-form-label-sm ps-4 mt-1">12개월</label>
								            <div class="col-4">
								                <input type="text" class="form-control disc_price" id="mon12" name="discountedPrice" placeholder="가격">
								            </div>
								            
							            	<label for="mon24" class="col-2 col-form-label-sm ps-4 mt-1">24개월</label>
								            <div class="col-4">
								                <input type="text" class="form-control disc_price" id="mon24" name="discountedPrice" placeholder="가격">
								            </div>
							            	
							        	</div>
							        	<div class="row mt-2 ">
							            	<label for="mon36" class="col-2 col-form-label-sm ps-4 mt-1">36개월</label>
								            <div class="col-4">
								                <input type="text" class="form-control disc_price" id="mon36" name="discountedPrice" placeholder="가격">
								            </div>
							        	</div>
							        	
							        </div>
					            
					            </div>
					        </div>
					        
					        
					
					        <div class="form-group row mt-4">
					            
					            <div class="col-6">
					            <div class="mb-1"><label for="mainImg" class=" col-form-label fw-medium">상품 대표 이미지</label></div>
					                <input type="file" class="form-control-file" id="mainImg" name="mainImg" accept="images/*">
					            </div>
					            
					            <div class="col-6">
					                <div class="mb-1"><label for="itemImgs" class=" col-form-label fw-medium">상품 상세 이미지</label></div>
					                <input type="file" class="form-control-file" id="itemImgs" name="itemImgs" accept="images/*" multiple>
					            </div>
					            
					        </div>
					
					        <div class="form-group row mt-4">
					            
					        </div>
					        
							
					        <!-- <div class="row mt-5">
					        	<div class="col"></div>
					            <div class="col-2 me-0 d-grid">
					                <button type="submit" class="btn btn-primary btn-block btn-dark">등록</button>
					            </div>
					        </div> -->
					    
		        	
		        	</div>
		        	<div class="col-1"></div>
		        </div>

	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">닫기</button>
	        <button type="button" class="btn btn-dark" onclick="registerProduct()">상품 등록</button>
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
