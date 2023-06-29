<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사파리 | 경매메인</title>
<!-- 메타 섹션 -->
<jsp:include page="../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<link rel="stylesheet" href="/safari/resources/style/common.css" type="text/css">
<link rel="stylesheet" href="/safari/resources/style/auction.css" type="text/css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<script>
let sessionId = null;

// 세션 아이디 확인
function getSessionId() {
		
    const xhr = new XMLHttpRequest();
 
    xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status == 200){
            const response = JSON.parse(xhr.responseText);

            if(response.result == "success") {
                sessionId = response.id;
            }
            
        }
    }	

    xhr.open("get", "/safari/auction/getUserId",false);
    xhr.send();
  
}

function reloadAuctionList() {
	
		const xhr = new XMLHttpRequest();

	   xhr.onreadystatechange = function() {
	        if (xhr.readyState === 4 && xhr.status === 200) {
	 
	            const response = JSON.parse(xhr.responseText);
	            
	            const auctionProductListBox = document.getElementById("auctionProductList");
	            auctionProductListBox.innerHTML = "";
	            
	            for(data of response.getAuctionList) {
	              	
				
	            }
	            
	        }
	    };
	    xhr.open("get", "/safari/auction/getAuctionList");
	    xhr.send();
	
	
}


// 물품 등록 모달 페이지 띄우기
function registerProductPage() {
	if (sessionId == null) {
		location.href = "/safari/user/loginPage";
		return;
	} else {		
		const registerProductModal = bootstrap.Modal.getOrCreateInstance("#registerProductModal");
		registerProductModal.show();
			
	}	
}

window.onload = function() {
    // 대분류 카테고리의 기본 선택 값 설정
    const defaultMainCategoryId = 0; // 페이지 접속 시 카테고리 1로 설정
    
    // 대분류 카테고리 드롭다운을 기본 선택 값으로 설정
    const mainCategoryDropdown = document.getElementById('mainCategoryDropdown');
    mainCategoryDropdown.value = defaultMainCategoryId;
    
    // 초기 선택한 대분류 카테고리에 해당하는 소분류 카테고리 리스트 출력
    getProductSubcategories();
}



function getProductSubcategories() {
    const productMainCategoryId = document.getElementById('mainCategoryDropdown').value;
    const xhr = new XMLHttpRequest();
    
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
 
            const response = JSON.parse(xhr.responseText);
            
            getProductSubcategoriesList(response.subCategories);
        }
    };
    xhr.open("get", "/safari/auction/getProductSubCategories/" + productMainCategoryId);
    xhr.send();
}	


function getProductSubcategoriesList(subCategories) {
    const subCategoryDropdown = document.getElementById('subCategoryDropdown');
    subCategoryDropdown.innerHTML = '';

    subCategories.forEach(function(subCategory) {
        const option = document.createElement('option');
        option.value = subCategory.id;
        option.text = subCategory.sub_category_name;
        subCategoryDropdown.appendChild(option);
    });
}

// 경매 물품 등록
function registerAuctionProduct() {
	
	   const xhr = new XMLHttpRequest();
	   
	   const titleBox = document.getElementById("title");
	   const subCategoryBox = document.getElementById("subCategoryDropdown");
	   const descriptionBox = document.getElementById("description");
	   const startPriceBox = document.getElementById("start_price");
	   const maxPriceBox = document.getElementById("max_price");
	   const startDateBox = document.getElementById("start_date");
	   console.log(new Date(startDateBox.value))
	   const endDateBox = document.getElementById("end_date");
	   const imageFilesInput = document.getElementById("auctionItemImgFiles");
	   
	    xhr.onreadystatechange = function () {
	        if(xhr.readyState == 4 && xhr.status == 200){
	            const response = JSON.parse(xhr.responseText);

	            if(response.result == "success") {
	            	const registerProductModal = bootstrap.Modal.getOrCreateInstance("#registerProductModal");
	            	registerProductModal.hide();
	            	/*reloadAuctionList();*/
	            }
	            
	        }
	    }	
	    
	    
	    // 이미지 파일을 포함한 데이터를 생성
	    const formData = new FormData();
	    formData.append("title", titleBox.value);
	    formData.append("auction_sub_category_id", subCategoryBox.value);
	    formData.append("description", descriptionBox.value);
	    formData.append("start_price", startPriceBox.value);
	    formData.append("max_price", maxPriceBox.value);
	    formData.append("start_date", startDateBox.value);
	    formData.append("end_date", endDateBox.value);	    
	    
	    // 이미지 파일 추가
	    const imageFiles = imageFilesInput.files;
	    for (let i = 0; i < imageFiles.length; i++) {
	      formData.append("auctionItemImgFiles", imageFiles[i]);
	    }	    
	    

	    xhr.open("post", "/safari/auction/registerProductProcess");
	    // Content-Type 헤더를 설정하여 multipart/form-data로 전송
	   //ㄴ xhr.setRequestHeader("Content-Type", "multipart/form-data");
	    xhr.send(formData);	
	
}

window.addEventListener("DOMContentLoaded", function(){
    //사실상 시작 시점...
    getSessionId();
    /*reloadAuctionList();*/
 
});

</script>
</head>
<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->

	<div class="container main_box">
		<h1 class="text-center fs-3"></h1>
		
	<div class="row mt-5">
		<jsp:include page="./sidemenu.jsp"></jsp:include>
	
	<%-- 메인 페이지 시작 --%>

	<div class="col-10 justify-content-center ps-5">
	
		
		
		<div class="row mt-2 mb-3">
			<div class="col">
			
				<input type="button" onclick= "registerProductPage()"
				  class="btn btn-dark" value="경매 물품 등록">				  
			</div>
		</div>
		
		
			
			<%-- --%>
			<c:forEach items="${auctionList}" var="auction">
			
			
			<div class="row mb-4">
			
			
			<div class="col-11 rounded-3 border border-1" style="border-color: #e1e6ed">
				
				<div class="row">
					<%-- 왼쪽 화면 시작 --%>
					<div class="col-10 ms-5 mt-3 mb-3">	
						<div class="row">
						
							<%--상품 이미지 --%>
							<div class="col text-center"> 
								<a href="/safari/auction/productDetail/${auction.auctionDto.id}">
									<img class="img-fluid align-middle" style="height: 120px;"
									src="/auctionFiles/${auction.auctionImgDto.auction_item_img_link}">
								</a>	
							</div>  
							<%--상품 이미지 --%>
							
							<div class="col-10">
							
								<div class="row">
									<div class="col-10 fw-bold fs-5">
										<a href="/safari/auction/productDetail/${auction.auctionDto.id}">${auction.auctionDto.title}</a>
									</div>
								</div>
								
								<div class="row mt-2">
									<div class="col">
										현재가 
										<span class="text-danger fw-bold">
											<fmt:formatNumber value="${auction.auctionDto.start_price}" pattern="#,###"/>원
										</span>
										&nbsp;&nbsp;
										즉시낙찰가
										<span class="fw-bold">
							 				<fmt:formatNumber value="${auction.auctionDto.max_price}" pattern="#,###"/>원
							 			</span> 
							 			&nbsp;&nbsp;
							 			(시작가  <fmt:formatNumber value="${auction.auctionDto.start_price}" pattern="#,###"/>원)
									</div>										
								</div>
								
								<div class="row mt-2">
									<div class="col">
										경매시작일 <fmt:formatDate value="${auction.auctionDto.start_date}"  pattern="yyyy-MM-dd HH:mm"  />
						
									</div>
								</div>
								
								<div class="row mt-2">
									<div class="col">
										<span class="fw-bold">경매종료일</span> <fmt:formatDate value="${auction.auctionDto.end_date}"  pattern="yyyy-MM-dd HH:mm"  />
									</div>
								</div>
		
							</div>
						</div>

					</div>
					<%-- 왼쪽 화면 끝 --%>
					
					<%-- 오른쪽 화면 시작 --%>
					<div class="col ms-2 mt-3 mb-3">
						<c:choose>
							<c:when test="${auction.auctionDto.auction_status == '진행중'}">
								<button class="btn btn-sm btn-outline-success" disabled="disabled">진행중</button>
							</c:when>
							<c:otherwise>
								<button class="btn btn-sm btn-outline-danger" disabled="disabled">경매 종료</button>
							</c:otherwise>
						</c:choose>
					</div>
					<%-- 오른쪽 화면 끝 --%>
					
					
				</div>		
			</div>
			
		
		</div>				
		</c:forEach>	
				
			<%-- --%>		
				

	</div>	
	
	</div>
	</div>
	
	
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->
	
	
<!-- Modal -->
<div class="modal modal-dialog modal-lg fade" id="registerProductModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"
style="position: absolute; transform: translateX(70%);right: 50%;">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <%--<h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1> --%>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
  		<%-- 시작 --%>   
  			<div class="row text-center mt-4 fw-bold fs-5 me-1">
				<div class="col">
					경매 물품 등록
					
					
				</div>
			</div> 
	
	        	<div class="col-1"></div>
	        				
   				<div class="col ms-2">
   				
			        <div class="form-group row mt-3">
			        	<div class="col-1"></div>
			            <div class="col-10">
			            	<div class="mb-1">
			            		<label for="title" class="col-form-label fw-medium">상품 제목</label>
			            	</div>
			                <input type="text" class="form-control" id="title" name="title"  placeholder="상품명을 입력하세요">
			            </div>
			        </div>
        
			        <div class="form-group row mt-3">
			            <div class="col-1"></div>
			            
			            <div class="col-3">
				            <div class="mb-1">
				            	<label for="mainCategoryDropdown" class="col-form-label fw-medium">카테고리 대분류</label>
				            </div>
				            	<select class="form-control" id="mainCategoryDropdown" onchange="getProductSubcategories()">
				            		<option value="0">대분류 선택 </option>
						        	<c:forEach items="${productMainCategories}" var="productMainCategory">
							            <option value="${productMainCategory.id}">${productMainCategory.main_category_name}</option>
							        </c:forEach>
				                </select>
				         </div>

			            <div class="col-3">
				            <div class="mb-1">
				            	<label for="subCategoryDropdown" class=" col-form-label fw-medium">카테고리 소분류</label>
				            </div>
			                <select class="form-control" id="subCategoryDropdown" name="auction_sub_category_id">
			                	<option value="0">소분류 선택</option>
			                </select>
			            </div>
        			</div>

			        <div class="form-group row mt-3">
			            <div class="col-1"></div>
			        
			            <div class="col-10">
			            	<div class="mb-1">
			            		<label for="description" class="col-form-label fw-medium">상품 설명</label>
			            	</div>
			                <textarea class="form-control" id="description" name="description" rows="5" placeholder="상품 설명"></textarea>
			            </div>
			        </div>
		
			
			
		        <div class="form-group row mt-3">
		            <div class="col-1"></div>
		        
		            <div class="col-3">
		            	<div class="mb-1">
		            		<label for="start_price" class="col-form-label fw-medium">시작가격</label>
		            	</div>
		                <input type="text" class="form-control" id="start_price" name="start_price"  placeholder="시작가">
		            </div>
		            <div class="col-3">
		            	<div class="mb-1">
		            		<label for="max_price" class="col-form-label fw-medium">즉시낙찰가 설정</label>
		            	</div>
		                <input type="text" class="form-control" id="max_price" name="max_price"  placeholder="즉시낙찰가">
		            </div>     
		        </div>
        
		      <div class="form-group row mt-3">
		            <div class="col-1"></div>
		      
		            <div class="col-5">
		            	<div class="mb-1">
		            		<label for="start_date" class="col-form-label fw-medium">경매시작일</label>
		            	</div>
		            	<input type="datetime-local" id="start_date" name="start_date" class="form-control"> 
		            </div>
		            <div class="col-5">
		            	<div class="mb-1">
		            		<label for="end_date" class="col-form-label fw-medium">경매종료일</label>
		            	</div>
		                <input type="datetime-local" id="end_date" name="end_date" class="form-control">
		            </div>
		        </div>
        
			<div class="form-group row mt-3">
				<div class="col-1"></div>
				
				<div class="col-6">
				  <label for="auctionItemImgFiles" class="col-form-label fw-medium">제품 이미지</label>
				  <input class="form-control" id="auctionItemImgFiles"
				  		name="auctionItemImgFiles" type="file" multiple="multiple" accept="image/*">
				</div>
			</div>	               
	   
			
	        <div class="row mt-5 mb-5">
	        	<div class="col"></div>
	        	<div class="col-4 text-center d-grid">
	      
	                <button class="btn  btn-primary btn-block btn-dark text-center  me-5"
	                onclick="return registerAuctionProduct()">등록</button>
	           </div>    
	        </div>
    
    	</div>
  		<%-- 끝 --%>
      </div>
   
    </div>
  </div>
</div>
<!-- Modal -->
	

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>	
</html>