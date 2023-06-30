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
	<div class="row mt-2">
		<div class="col"></div>
		<div class="col-8">
			<h4>직원 관리</h4>
			<div class="row">
				<div class="col text-end d-grid"></div>
				<div class="col-2 text-end ">
					<div class="btn btn-sm btn-dark px-4 py-1" onclick="registerEmployee()">직원 추가</div>
				</div>
			</div>
			
			<div class="row mt-3 text-center bg-secondary-subtle py-2 fw-bolder">
				<div class="col-1">#</div>
				<div class="col-2">이름</div>
				<div class="col-2">소속</div>
				<div class="col-2">직급</div>
				<div class="col-3">근무일</div>
				<div class="col-2">근무상태</div>
			</div>
			
			
			
			
			
			
		</div>
		<div class="col"></div>
	</div>
</div>















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
				                <input type="text" class="form-control" id="password" name="password"  placeholder="비밀번호">
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
				
				
				       
				        
				        
				
				        <div class="form-group row mt-4">
				            
				            <div class="col-6">
				            <div class="mb-1"><label for="mainImg" class=" col-form-label fw-medium">프로필사진?</label></div>
				                <input type="file" class="form-control-file" id="mainImg" name="mainImg" accept="images/*">
				            </div>
				            
				        </div>
				
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
 
 
 
 function registerEmployee() {
	const myModal = bootstrap.Modal.getOrCreateInstance('#registerEmployeeModal');
	myModal.show();
	
	
	
	
}
 

//상품 등록 

function registerProduct() {
	const modal = bootstrap.Modal.getOrCreateInstance("#newItemModal");
	const xhr = new XMLHttpRequest();
	const formData = new FormData();
	
	// 텍스트 데이터 추가
	formData.append('title', document.getElementById('title').value);
	// formData.append('mainCategory', document.getElementById('mainCategory').value);
	formData.append('sub_category_id', document.getElementById('subCategory').value);
	formData.append('item_description', document.getElementById('description').value);
	formData.append('deposit', document.getElementById('deposit').value);
	formData.append('price', document.getElementById('price').value);
	formData.append('quantity', document.getElementById('quantity').value);

	// HTML 코드에서 할인 가격(input 요소)들을 선택합니다.
	const discPriceInputs = document.querySelectorAll('.disc_price');
	// 입력된 값을 추출하여 Integer 배열로 변환합니다.
	const discPrices = Array.from(discPriceInputs).map(input => parseInt(input.value));
	formData.append('discountedPrice', discPrices);


// 파일 데이터 추가
const mainImg = document.getElementById('mainImg').files[0];
if (mainImg) {
  formData.append('mainImg', mainImg);
}

const itemImgs = document.getElementById('itemImgs').files;
for (let i = 0; i < itemImgs.length; i++) {
  formData.append('itemImgs', itemImgs[i]);
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