<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
    
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<link rel="stylesheet" href="/safari/resources/style/common.css" type="text/css">
<link rel="stylesheet" href="/safari/resources/style/auction.css" type="text/css">
<script type="text/javascript" src="/safari/resources/js/bid.js" ></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>


<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 메타 섹션 -->
<jsp:include page="../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->
<style>
thead > tr > td {
	color: #dbdbd9;
}


ul {
	list-style: none;
	position: relative;
	right: 30px;
}

li {
	float: left;
	margin-right: 15px;
}
 
.nav-pills .nav-link.active, .nav-pills .show>.nav-link {
	background-color: #E2E3E5;
}
</style>
</head>
<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->
	
	
	<div class="row">
		<div class="col"></div>
		<%-- 내용 시작 --%>
		<div class="col-8">
			
			<div class="row mt-4">
				<div class="col"></div>
			</div>
			
			<div class="row mb-2">
				<div class="col">
					<%--<a href="/safari/auction/mainPage">홈</a> &nbsp; > &nbsp;
					${productDetail.productMainCategoryDto.main_category_name} &nbsp; > &nbsp;
					${productDetail.productSubCategoryDto.sub_category_name} --%>
					<div class="row">
						<div class="col text-start"> 
							<div class="row">
								<div class="col">
									<ul>
										<li class="fw-bold">
											<a href="/safari/auction/mainPage">홈</a>
										</li>
										<li>></li>
										<li class="fw-bold">
											${productDetail.productMainCategoryDto.main_category_name}
										</li>
										<li>></li>
										<li class="fw-bold">
											${productDetail.productSubCategoryDto.sub_category_name}
										</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="col-6"></div>
						<div class="col-2"></div>
					</div>
				</div>
			</div>
			
			<div class="row mb-5">
				<div class="col rounded-3 border border-1" style="border-color: #e1e6ed" id="auctionItemInfo">
					

				</div>	
			</div>
			<%-- 상품 정보 끝 --%>	
			
			
			<div class="row mt-4">
				<div class="col">
					<div class="row">
					
						<%-- 남은 시간 화면 --%>
						<div class="col">
						
							<div class="row fw-bold fs-5">
							 	<div class="col" id="countDownTable">
							 		
							 		<%-- 내용 --%>
								
							 		<%-- 내용 --%>
							 		
							 	</div>
							</div>
					
						</div>
						<%-- 남은 시간 화면 --%>
						
						<%-- 경매 상황 화면 --%>
						<div class="col">
							
							<div class="row fw-bold fs-4">
								<div class="col">
									경매 진행 상황
								</div>
							</div>
							
							<div class="row mt-3">
								<div class="col">
									<span class=" fs-3">현재가 &nbsp;</span> 
									<span class="text-danger fw-bold fs-2" id="currentPrice"></span>
								</div>
							</div>
							
							<div class="row mt-3 mb-5" <%--id="bidBox" --%>>
								<div class="col">
									<div class="row" id="auctionBidBox">
										
									</div>																				
								</div>
							</div>
							
						
						
						</div>	
						
						<%-- 경매 상황 화면 --%>			
					</div>
				</div>
			</div>
			
		
		
			<div class="row mt-4">
			
				<%-- 입찰 기록 시작 --%>
				<div class="col">
					<div class="row">
						<div class="col fw-bold fs-4">
							입찰 실시간 정보
						</div>
					</div>		
					
					 <div class="row mt-3">
					 	<div class="col-11">
							<table class="table">
								<thead class="table-secondary">
									<tr class="text-center">
										<td class="fw-bold">닉네임</td>
										<td class="fw-bold text-end">입찰가</td>
										<td class="fw-bold">거래일</td>
									</tr>
								</thead>
								<tbody id="bidListBox">
									<%-- 입찰 기록 ajax 출력 --%>
								</tbody>
							</table>					 		
					 	</div>
					 	<div class="col"></div>
					 </div>		
				</div>
				<%-- 입찰 기록 끝 --%>
				
				<%-- 채팅 시작 --%>
				<div class="col">

					<div class="row">
						<div class="col fw-bold fs-4">
							실시간 채팅
						</div>
					</div>				
				
					<div class="row mt-3">
						<div class="col-10">
							<input type="text" 
							id="chatContentBox" class="form-control" placeholder="실시간 채팅에 참여해보세요!"
							onkeydown="checkSendMessage(event)">
						</div>
						<div class="col d-grid">
							<input type="button" class="btn btn-success" value="입력" onclick="sendMessage()">
						</div>
					</div> 	
					
					
					<div class="row mt-4">
						<div class="col">
							 <div class="row">
							 	
								<%--<div class="col border border-1 ms-2 mb-2" style="height: 1000px;"  id="chatMessageBox">
									
								</div>  --%>
								<div class="col ms-2 mb-2"   id="chatMessageBox" style="height: 500px; overflow: auto">	
								</div>	
							</div>								
						</div>
					</div>
				</div>
				<%-- 채팅 끝 --%>
		</div>
		</div>
		<%-- 내용 끝 --%>
		<div class="col"></div>
	</div>
	
	
	

<%--  html 종료 --%>

<%-- auctionInfoModal --%>
<div class="modal modal-dialog modal-lg fade" id="auctionInfoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"
style="position: absolute; transform: translateX(70%);right: 50%;">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <%--<h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1> --%>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
      
		<div class="row">
			<%-- 상품 화면 시작 --%>
			<div class="col ms-2 mt-3 mb-3">	
				<div class="row">
				
					<%--상품 이미지 --%>
					<div class="col text-center"> 
						<img class="img-fluid align-middle" style="height: 120px;"
						src="/auctionFiles/${productDetail.auctionMainImgDto.auction_item_img_link}">
					</div>  
					<%--상품 이미지 --%>
					
					<div class="col-10">
					
						<div class="row">
							<div class="col-10 fw-bold fs-5">
								${productDetail.auctionDto.title}
							</div>
						</div>
						
						<div class="row mt-2">
							<div class="col">
								현재가 
								<span class="text-danger fw-bold">
									<fmt:formatNumber value="${productDetail.auctionDto.start_price}" pattern="#,###"/>원
								</span>
								&nbsp;&nbsp;
								즉시낙찰가
								<span class="fw-bold">
					 				<fmt:formatNumber value="${productDetail.auctionDto.max_price}" pattern="#,###"/>원
					 			</span> 
					 			&nbsp;&nbsp;
					 			(시작가  <fmt:formatNumber value="${productDetail.auctionDto.start_price}" pattern="#,###"/>원)
							</div>										
						</div>
						
						<div class="row mt-2">
							<div class="col">
								경매시작일 <fmt:formatDate value="${productDetail.auctionDto.start_date}"  pattern="yyyy-MM-dd HH:mm"  />
				
							</div>
						</div>
						
						<div class="row mt-2">
							<div class="col">
								<span class="fw-bold">경매종료일</span> <fmt:formatDate value="${productDetail.auctionDto.end_date}"  pattern="yyyy-MM-dd HH:mm"  />
							</div>
						</div>
					</div>
					<%-- 상품 설명 끝 --%>
				</div>
			</div>	
			</div>
				
		</div> 
		<%-- 상품 화면 끝 --%>
		
		<%--탭바 --%>   
		<%-- 탭 바 시작 --%>	
		<div class="row mt-3">
		
			<div class="col text-center nav-pills nav-fill">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active text-dark fw-bold" id="auctioninfo-tab" data-bs-toggle="tab"
						data-bs-target="#auctioninfo" type="button" role="tab" aria-controls="auctioninfo"
						aria-selected="true">상품정보</button>
				</li>	
				<li class="nav-item" role="presentation">
					<button class="nav-link text-dark fw-bold" id="review-tab" data-bs-toggle="tab"
						data-bs-target="#review" type="button" role="tab"
						aria-controls="review" aria-selected="false">구매후기</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link text-dark fw-bold" id="question-tab" data-bs-toggle="tab"
						data-bs-target="#question" type="button" role="tab"
						aria-controls="question" aria-selected="false">상품문의</button>
				</li>
			</ul>	
			
				<%-- 내용 --%>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="auctioninfo" role="tabpanel"
					aria-labelledby="auctioninfo-tab">
					<div class="row mt-4">
						<div class="col"></div>
						<%--이미지 --%>
						<div class="col-10">
							<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
  								<div class="carousel-inner">
  									<c:forEach items="${productDetail.auctionImgDtoList}" var="auctionImgDto">
									   <div class="carousel-item active">
									      <img src="/auctionFiles/${auctionImgDto.auction_item_img_link}" class="d-block w-100" alt="...">
									    </div>  								
									</c:forEach>							
								</div>	
								 <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
								    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
								    <span class="visually-hidden">Previous</span>
								  </button>
								  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
								    <span class="carousel-control-next-icon" aria-hidden="true"></span>
								    <span class="visually-hidden">Next</span>
								  </button>								
							</div>					
						</div>
						<%--이미지 --%>
					<div class="col"></div>
				</div>
					
					
				<div class="tab-pane fade" id="review" role="tabpanel"
					aria-labelledby="review-tab">내리뷰리스트 탭</div>
				<div class="tab-pane fade" id="question" role="tabpanel"
					aria-labelledby="question-tab">위시리스트 탭</div>
			</div>		
					
			
			
			</div>
			<%-- 탭 내용 끝 --%>
		
		</div>	
	
		
		<%-- 탭 바 끝 --%>	  
  
      </div>
   
    </div>
  </div>
</div>



<%-- alertModal --%>
<div class="modal" id="alertModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"
>
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
      	
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
      	
      	<div class="row text-center">
    		<div class="col">현재가보다 낮은 가격으로 입찰하실 수 없습니다.</div>
       </div>
  
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창닫기</button>
      </div>      
   
    </div>
  </div>
</div>
<%-- alertModal --%>

<%--  modal-dialog-centered 정중앙 배치 --%>
<%-- bidModal --%>
<div class="modal" id="bidModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered"> 
    <div class="modal-content">
      <div class="modal-header">
      	
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
      	
      	<div class="row text-center">
    		<div class="col">입찰이 완료되었습니다.</div>
       </div>
  
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창닫기</button>
      </div>      
   
    </div>
  </div>
</div>
<%-- bidModal --%>


<%-- 즉시낙찰Modal --%>
<div class="modal" id="immediateBidSuccessModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered"> 
    <div class="modal-content">
      <div class="modal-header">
      	
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
      	
      	<div class="row text-center">
    		<div class="col" id="immediateBidSuccessAlert">낙찰에 성공하여 경매가 종료됩니다.</div>
       </div>
  
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창닫기</button>
      </div>      
   
    </div>
  </div>
</div>
<%-- 낙찰Modal --%>




<%-- updateModal --%>
<div class="modal modal-dialog modal-lg fade" id="modifyProductModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"
style="position: absolute; transform: translateX(70%);right: 50%;">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <%--<h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1> --%>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">

		<div class="row text-center mt-4 fw-bold fs-5 me-1">
				<div class="col">
					경매 물품 수정
				</div>
		</div> 
	
	        	<div class="col-1"></div>
	        				
   				<div class="col ms-2">
   				
			        <div class="form-group row mt-3">
			        	<div class="col-1"></div>
			            <div class="col-10">
			            	<div class="mb-1">
			            		<label for="modifyTitle" class="col-form-label fw-medium">상품 제목</label>
			            	</div>
			                <input type="text" class="form-control" id="modifyTitle" name="title"  placeholder="상품명을 입력하세요"
			                value="${productDetail.auctionDto.title}">
			            </div>
			        </div>
        
			        <div class="form-group row mt-3">
			            <div class="col-1"></div>
			            
			            <div class="col-3">
				            <div class="mb-1">
				            	<label for="modifyMainCategoryDropdown" class="col-form-label fw-medium">카테고리 대분류</label>
				            </div>
				            	<select class="form-control" id="modifyMainCategoryDropdown" onchange="getModifyProductSubcategories()">
				            		<option value="0">대분류 선택 </option>
						        	<c:forEach items="${productMainCategories}" var="productMainCategory">
							            <option value="${productMainCategory.id}">${productMainCategory.main_category_name}</option>
							        </c:forEach>
				                </select>
				         </div>

			            <div class="col-3">
				            <div class="mb-1">
				            	<label for="modifySubCategoryDropdown" class="col-form-label fw-medium">카테고리 소분류</label>
				            </div>
			                <select class="form-control" id="modifySubCategoryDropdown" name="auction_sub_category_id">
			                	<option value="0">소분류 선택</option>
			                </select>
			            </div>
        			</div>

			        <div class="form-group row mt-3">
			            <div class="col-1"></div>
			        
			            <div class="col-10">
			            	<div class="mb-1">
			            		<label for="modifyDescription" class="col-form-label fw-medium">상품 설명</label>
			            	</div>
			            	
			                <textarea class="form-control" id="modifyDescription" name="description" rows="5" placeholder="상품 설명">${productDetail.auctionDto.description}</textarea>
			            </div>
			        </div>
		
			
			
		        <div class="form-group row mt-3">
		            <div class="col-1"></div>
		        
		            <div class="col-3">
		            	<div class="mb-1">
		            		<label for="modifyStartPrice" class="col-form-label fw-medium">시작가격</label>
		            	</div>
		                <input type="text" class="form-control" id="modifyStartPrice" name="start_price"  placeholder="시작가"
		                value="${productDetail.auctionDto.start_price}">
		            </div>
		            <div class="col-3">
		            	<div class="mb-1">
		            		<label for="modifyMaxPrice" class="col-form-label fw-medium">즉시낙찰가 설정</label>
		            	</div>
		                <input type="text" class="form-control" id="modifyMaxPrice" name="max_price"  placeholder="즉시낙찰가"
		                value="${productDetail.auctionDto.max_price}">
		            </div>     
		        </div>
        
		      <div class="form-group row mt-3">
		            <div class="col-1"></div>
		      
		            <div class="col-5">
		            	<div class="mb-1">
		            		<label for="modifyStartDate" class="col-form-label fw-medium">경매시작일</label>
		            	</div>
		            	<input type="datetime-local" id="modifyStartDate" name="start_date" class="form-control"> 
		            </div>
		            <div class="col-5">
		            	<div class="mb-1">
		            		<label for="modifyEndDate" class="col-form-label fw-medium">경매종료일</label>
		            	</div>
		                <input type="datetime-local" id="modifyEndDate" name="end_date" class="form-control">
		            </div>
		        </div>
        
			<div class="form-group row mt-3">
				<div class="col-1"></div>
				
				<div class="col-6">
				  <label for="modifyAuctionItemImgFiles" class="col-form-label fw-medium">제품 이미지</label>
				  <input class="form-control" id="modifyAuctionItemImgFiles"
				  		name="auctionItemImgFiles" type="file" multiple="multiple" accept="image/*">
				</div>
			</div>	               
	   
			
	        <div class="row mt-5 mb-5">
	        	<div class="col"></div>
	        	<div class="col-4 text-center d-grid">
	      
	                <button class="btn  btn-primary btn-block btn-dark text-center  me-5"
	                onclick="return modifyAuctionProduct()">수정</button>
	           </div>    
	        </div>
    
    	</div>      
    
       
  
      </div>
   
    </div>
  </div>
</div>
<%-- updateModal --%>







	
	
<script>
let sessionId = null; // 접속한 유저의 pk
let sellerId =  null; // 경매 판매자의 pk


//경로에서 변수 부분 추출
const path = window.location.pathname;
const parts = path.split('/');
//경매 물품 pk
const auctionItemId = parts[parts.length - 1]; 


// 경매 시작일
let startDate = null; 
// 경매 종료일
let endDate = null;

// 즉시 낙찰 여부를 담을 변수 선언
let immeDiateSuccess = null;

// 판매자 여부
let isSeller = null;

// 채팅 전송 시 enter 키 이벤트 처리
function checkSendMessage(event) {
  if (event.key === "Enter") {
    sendMessage();
  }
}

// 입찰 enter 키 이벤트 처리 (아직 안됨)
function checkSendBid(event) {
	 if (event.key === "Enter") {
		    bidRequest();
		}
}


//접속한 유저의 pk 받아오기
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

// 경매 물품 판매자의 pk 받아오기
function getSellerId() {
	
    const xhr = new XMLHttpRequest();

    xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status == 200){
            const response = JSON.parse(xhr.responseText);
            sellerId = response.id;
            
        }
    }	
    xhr.open("get", "/safari/auction/getSellerId/" + auctionItemId);
    xhr.send();
}

// 경매 물품 정보 보여주기
function showAuctionInfo() {
 
	const xhr = new XMLHttpRequest();

   	xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
 
            const response = JSON.parse(xhr.responseText);
            
            if (sellerId == sessionId) {
            	forbidInputBidBox();
            	
            }
            
            const auctionItemInfoBox = document.getElementById("auctionItemInfo");
            auctionItemInfoBox.innerHTML = "";
            
            const item = response.auctionItem; //  rest controller에서 받아온 것
            
            const row = document.createElement("div");
            row.classList.add("row");

            // 상품 화면의 왼쪽 화면 시작
            const col = document.createElement("div");
            col.classList.add("col");
            col.classList.add("mt-2");
            col.classList.add("mb-3");

           // 상품 정보 시작
           const productInfoRow = document.createElement("div");
           productInfoRow.classList.add("row");

           // 상품 이미지 시작
           const productImgCol = document.createElement("div");
           productImgCol.classList.add("col");
           productImgCol.classList.add("text-center");

           const productImg = document.createElement("img");
           productImg.classList.add("img-fluid");
           productImg.classList.add("align-middle");
           productImg.style.position = "relative";
           productImg.style.top = "20px";
           productImg.style.height = "120px";
           productImg.src = "/auctionFiles/" + item.auctionMainImgDto.auction_item_img_link;

           productImgCol.appendChild(productImg);
           // 상품 이미지 끝

           // 상품 제목 시작
           const productDetailCol = document.createElement("div");
           productDetailCol.classList.add("col-8");

           const titleRow = document.createElement("div");
           titleRow.classList.add("row");
           titleRow.classList.add("mt-2");
           titleRow.classList.add("me-2");
           
           
           const titleCol =  document.createElement("div");
           titleCol.classList.add("col");
           titleCol.classList.add("fs-5", "fw-bold");
           // 경매 물품명 텍스트
           titleCol.innerText = item.auctionDto.title;
           // 경매 물품 id 부여 (없어도 될듯?)
           //titleCol.id = "auctionStatus";
           
          const statusSpanCol = document.createElement("span");
       	  statusSpanCol.classList.add("ms-3"); 
       	  // 경매가 종료중, 진행중, 준비중인지 상태 여부를 나타내는 버튼의 id값 부여 (없어도 될듯?)
       	  //statusSpanCol.id = "statusSpan";
       	  
       	 
          const button = document.createElement("button");
          button.classList.add("btn", "btn-sm", "fw-bold", "disabled");
          // 경매가 종료중, 진행중, 준비중인지 상태 여부를 나타내는 버튼의 id값 부여
          button.id = "statusButton";
          
          // statusSpanCol에 button을 담는다
          statusSpanCol.appendChild(button);
       	  
       	  titleCol.appendChild(statusSpanCol);
         
    
           titleRow.appendChild(titleCol);
           // 상품 제목 끝

           // 상품 가격 시작
           const priceRow = document.createElement("div");
           priceRow.classList.add("row");
           priceRow.classList.add("mt-2");

           const priceCol = document.createElement("div");
           priceCol.classList.add("col");
           priceCol.classList.add("fs-5");
  
           priceCol.innerText =
        	   	"즉시낙찰가 "  + new Intl.NumberFormat('ko-KR').format(item.auctionDto.max_price) 
           		+ "원  (시작가 " + new Intl.NumberFormat('ko-KR').format(item.auctionDto.start_price) + "원)";
                                 
  
           priceRow.appendChild(priceCol);
           // 상품 가격 끝

           // 경매 시작일 공간
           const startDateRow = document.createElement("div");
           startDateRow.classList.add("row");
           startDateRow.classList.add("mt-2");

           // 경매시작일 선언
           startDate = new Date(item.auctionDto.start_date); 
 
           const formattedStartDate = startDate.toLocaleString('ko-KR', {
             year: 'numeric',
             month: '2-digit',
             day: '2-digit',
             hour: '2-digit',
             minute: '2-digit',
             
             hour12: true
           });

           const startDateCol = document.createElement("div");
           startDateCol.classList.add("col");
           startDateCol.innerText = "경매시작일 " + formattedStartDate;

           startDateRow.appendChild(startDateCol);
           // 경매 시작일 공간 끝


           // 경매 종료일 선언
           endDate = new Date(item.auctionDto.end_date); 

           const formattedEndDate = endDate.toLocaleString('ko-KR', {
             year: 'numeric',
             month: '2-digit',
             day: '2-digit',
             hour: '2-digit',
             minute: '2-digit',
             //second: '2-digit',
             hour12: true
           });
         

           const endDateRow = document.createElement("div");
           endDateRow.classList.add("row");
           endDateRow.classList.add("mt-2");

           const endDateCol = document.createElement("div");
           endDateCol.classList.add("col");

           const endDateSpan = document.createElement("span");
           endDateSpan.classList.add("fw-bold");
           endDateSpan.innerText = "경매종료일 " + formattedEndDate;
           
           endDateCol.appendChild(endDateSpan);

           endDateRow.appendChild(endDateCol);
           // 경매 종료일 공간 끝


           // 칼럼 더하기
           productDetailCol.appendChild(titleRow);
           productDetailCol.appendChild(priceRow);
           productDetailCol.appendChild(startDateRow);
           productDetailCol.appendChild(endDateRow);


           // 상품 기능 시작
           const productFuncCol = document.createElement("div");
           productFuncCol.classList.add("col");
           productFuncCol.classList.add("ms-2");
           productFuncCol.classList.add("mt-3");
           productFuncCol.classList.add("mb-3");

           const productFuncInfoRow = document.createElement("div");
           productFuncInfoRow.classList.add("row");

           const productFuncInfoCol = document.createElement("div");
           productFuncInfoCol.classList.add("col");

           // 상품 정보 확인 버튼 추가
           const auctionInfoButton = document.createElement("input");
           auctionInfoButton.type = "button";
           auctionInfoButton.classList.add("btn", "btn-success");
           auctionInfoButton.onclick = auctionInfoPage;
           auctionInfoButton.value = "상품정보 확인";
            // 상품 정보 확인 버튼 추가

           productFuncInfoCol.appendChild(auctionInfoButton);

           productFuncInfoRow.appendChild(productFuncInfoCol);

           // 여백
           const spaceRow = document.createElement("div");
           spaceRow.classList.add("row");
           spaceRow.classList.add("mt-2");

           const spaceCol = document.createElement("div");
           spaceCol.classList.add("col");

           spaceRow.appendChild(spaceCol);
           // 여백

           // 수정, 삭제 버튼 공간
           const modifyRow = document.createElement("div");
           modifyRow.classList.add("row");
           modifyRow.classList.add("mt-2");

           // 경매 판매자의 pk와 현재 접속한 유저의 pk가 일치할 경우 수정, 삭제 버튼 보이게 하기
           if (sessionId == item.auctionDto.user_seller_id) {
	            const modifyCol = document.createElement("div");
	            modifyCol.classList.add("col");
	
	            const modifyButton = document.createElement("input");
	            modifyButton.type = "button";
	            modifyButton.classList.add("btn", "btn-secondary");
	            modifyButton.onclick = modifyProductPage;
	            
	            modifyButton.value = "수정";
	
	            const deleteButton = document.createElement("input");
	            deleteButton.type = "button";
	            deleteButton.classList.add("btn", "btn-secondary", "ms-1");
	            deleteButton.onclick = function() {
	                location.href = "/safari/auction/removeProductProcess/" + auctionItemId;
	              };   
	            deleteButton.value = "삭제";
	
	            modifyCol.appendChild(modifyButton);
	            modifyCol.appendChild(deleteButton);
	
	            modifyRow.appendChild(modifyCol);
           } 
           // 구매자의 입장일 경우 찜하기 아이콘 보이게 하기
           else {
	            const heartCol = document.createElement("div");
	            heartCol.classList.add("col", "text-center");
	            heartCol.style.position = "relative";
	            heartCol.style.right = "25px";
	            
	            const heartBox = document.createElement("i");
	            heartBox.id = "heartBox";
	            heartBox.classList.add("fs-5", "text-danger", "bi");
	            refreshMyHeart();
	      		//heartBox.classList.add("bi-heart-fill");//
	      		heartBox.onclick = toggleLikeAuctionProduct;
            
	            heartCol.appendChild(heartBox);
	            modifyRow.appendChild(heartCol);
           }
           // 수정, 삭제 버튼 공간 끝
           
	           productFuncCol.appendChild(productFuncInfoRow);
	           productFuncCol.appendChild(spaceRow);
	           productFuncCol.appendChild(modifyRow);
	           // 상품 기능 끝
	
	           productInfoRow.appendChild(productImgCol);
	           productInfoRow.appendChild(productDetailCol);
	           productInfoRow.appendChild(productFuncCol);
	
	           col.appendChild(productInfoRow);
	
	           row.appendChild(col);
	
	           auctionItemInfoBox.appendChild(row);
           
        }
   	}
    xhr.open("get", "/safari/auction/getAuctionItemInfo/" + auctionItemId);
    xhr.send();   		
}


// 입찰하기 입력 폼 생성
function showInputBidBox() {
	
    const auctionBidBox = document.getElementById("auctionBidBox");
    auctionBidBox.innerHTML = "";

	const inputBidBoxCol = document.createElement("div");
	inputBidBoxCol.classList.add("col-9");
	
	const inputBidBox = document.createElement("input");
	inputBidBox.type = "text";
	inputBidBox.classList.add("form-control");	
	// 입찰하기 입력 폼에 id 부여
	inputBidBox.id = "bidPrice";
	// enter 이벤트 (아직 안됨)
	inputBidBox.onkeydown = "checkSendBid(event)";
	
	inputBidBoxCol.appendChild(inputBidBox);

    const bidEnterCol = document.createElement("div");
    bidEnterCol.classList.add("col", "d-grid");
    
    const button = document.createElement("input");
    button.classList.add("btn", "text-white", "fw-bold");
	button.type = "button";
	button.style.backgroundColor = "#FF8200";
	button.value = "입찰하기";
	// 입찰하기 버튼에 id 부여
	button.id = "inputBidButton";
	// 입찰하기 버튼을 클릭하면 bidRequest 함수 실행하도록 설정
	button.onclick = bidRequest;	
    
    bidEnterCol.appendChild(button);
    
    auctionBidBox.appendChild(inputBidBoxCol);
    auctionBidBox.appendChild(bidEnterCol);
    
}

// 판매자일 경우 입찰 버튼 막기
function forbidInputBidBox() {
	
	 const inputBidBox = document.getElementById("bidPrice");
	 const button = document.getElementById("inputBidButton");
	 
 
   	  if(!button.classList.contains("disabled") && inputBidBox.placeholder != "판매자는 입찰하실 수 없습니다." ) {
   		 
   		  
   		 inputBidBox.innerHTML = "";
   		 button.innerHTML = "";
   		 
   		 button.classList.add("disabled");  
   		 inputBidBox.placeholder = "판매자는 입찰하실 수 없습니다."
   		 inputBidBox.setAttribute("readonly", "readonly");
   		 
   		
   	  }

	
}

// 경매 종료 시, 입찰 버튼 종료로 갱신
function renewInputBidBoxEnd() {

	// 입찰하기 입력 폼 id 가져오기
	 const inputBidBox = document.getElementById("bidPrice");
	 // 입찰하기 버튼 id값 가져오기
	 const button = document.getElementById("inputBidButton");
	 
   	 if (inputBidBox.placeholder != "경매가 종료되었습니다." || !button.classList.contains('disabled')) {
		   inputBidBox.innerHTML = "";	   
		   button.innerHTML = "";
		   
	       button.classList.add("disabled");  
	       inputBidBox.placeholder = "경매가 종료되었습니다."
	       inputBidBox.setAttribute("readonly", "readonly");
   	}	
}

// 경매 진행중으로 변경 시, 입찰 버튼 진행중으로 갱신
function renewInputBidBoxIng() {

	 const inputBidBox = document.getElementById("bidPrice");
	 const button = document.getElementById("inputBidButton");
	 
   	 if (inputBidBox.placeholder != "현재가보다 낮은 가격으로 입찰하실 수 없습니다." || button.classList.contains('disabled')) {
  
	   inputBidBox.innerHTML = "";	   
	   button.innerHTML = "";
	   
	   inputBidBox.placeholder = "현재가보다 낮은 가격으로 입찰하실 수 없습니다.";
	   button.classList.remove('disabled');
	   inputBidBox.removeAttribute("readonly");
   	
   	}	
}

// 경매 준비중일 때, 입찰 버튼 준비중 
function renewInputBidBoxBefore() {

	 const inputBidBox = document.getElementById("bidPrice");
	 const button = document.getElementById("inputBidButton");
	 
	 if (inputBidBox.placeholder != "경매 준비중입니다." || !button.classList.contains('disabled')) {
      	
		button.classList.add("disabled");  

      	inputBidBox.placeholder = "경매 준비중입니다.";
   	    inputBidBox.setAttribute("readonly", "readonly");
       	
	 }   
}


// 경매 종료일로부터의 카운트다운 함수
function countdownFromEndDate(endDate) {
	  // 현재 시간
	  var current = new Date();

	  // 차이 계산 (밀리초 단위)
	  var difference = endDate.getTime() - current.getTime();

	  // 차이를 일, 시간, 분, 초로 변환
	  var days = Math.floor(difference / (1000 * 60 * 60 * 24));
	  difference -= days * 1000 * 60 * 60 * 24;
	  
	  var hours = Math.floor(difference / (1000 * 60 * 60));
	  difference -= hours * 1000 * 60 * 60;
	  
	  var minutes = Math.floor(difference / (1000 * 60));
	  difference -= minutes * 1000 * 60;
	  
	  var seconds = Math.floor(difference / 1000);

	  // 결과 반환
	  return {
	    days: days,
	    hours: hours,
	    minutes: minutes,
	    seconds: seconds
	  };
	}
	
// 경매 시작일로부터의 카운트다운 함수
function countdownFromStartDate(startDate) {
  // 현재 시간
  var current = new Date();

  // 차이 계산 (밀리초 단위)
  var difference = startDate.getTime() - current.getTime();


  // 차이를 일, 시간, 분, 초로 변환
  var days = Math.floor(difference / (1000 * 60 * 60 * 24));
  difference -= days * 1000 * 60 * 60 * 24;
  
  var hours = Math.floor(difference / (1000 * 60 * 60));
  difference -= hours * 1000 * 60 * 60;
  
  var minutes = Math.floor(difference / (1000 * 60));
  difference -= minutes * 1000 * 60;
  
  var seconds = Math.floor(difference / 1000);

  // 결과 반환
  return {
    days: days,
    hours: hours,
    minutes: minutes,
    seconds: seconds
  };
}

// 경매 종료 시, 제품 정보에서 경매 버튼 상태를 종료로 표시
function renewAuctionButtonStatusEnd() {
	
	const buttonBox = document.getElementById("statusButton");

	if (buttonBox.innerText != '경매 종료') {
		buttonBox.innerHTML = "";
		buttonBox.classList.remove();
		buttonBox.classList.add("btn-outline-danger");
		buttonBox.innerText = "경매 종료";
	}
	
}

// 경매 진행중일 때, 제품 정보에서 경매 상태 버튼을 진행즁로 표시
function renewAuctionButtonStatusIng() {
	
	const buttonBox = document.getElementById("statusButton");
	
	if (buttonBox.innerText != '경매 진행중') {
		buttonBox.innerHTML = "";
		buttonBox.classList.remove();
		buttonBox.classList.add("btn-outline-success");
		buttonBox.innerText = "경매 진행중";
	}
	
}

//제품 정보에서 경매 상태 준비중으로 표시
function renewAuctionButtonStatusBefore() {
	
	const buttonBox = document.getElementById("statusButton");
	
	if (buttonBox.innerText != '경매 준비중') {
		buttonBox.innerHTML = "";
		buttonBox.classList.remove();
		buttonBox.classList.add("btn-outline-primary");
		buttonBox.innerText = "경매 준비중";
	}
	
}


// 경매 준비중으로 덥데이트 추가해야함 !

// 경매 종료일 지났으면 경매 상태를 종료로 업데이트 (DB에 정보 업데이트)
function renewAuctionItemStatusEnd() {
	
	 const xhr = new XMLHttpRequest();
	 
	 xhr.onreadystatechange = function() {
	    if (xhr.readyState === 4 && xhr.status === 200) {
	      const response = JSON.parse(xhr.responseText);
		  }
	 }
	 
    xhr.open("get", "/safari/auction/renewAuctionItemStatusEnd/" + auctionItemId); // 수정하기
    xhr.send();  
}



// 경매 시작되었으면 경매 상태를 진행중으로 업데이트 (DB에 정보 업데이트)
function renewAuctionItemStatusIng() {
	
	 const xhr = new XMLHttpRequest();
	 
	 xhr.onreadystatechange = function() {
		    if (xhr.readyState === 4 && xhr.status === 200) {
		      const response = JSON.parse(xhr.responseText);
		      
		    }
	 }
    xhr.open("get", "/safari/auction/renewAuctionItemStatusIng/" + auctionItemId);
    xhr.send();  
}


// 카운트다운에 관한 경매 상황 제목, 남은 시간 공간 표기
function showAuctionStatusTitle() {
	
   const countDownTableBox = document.getElementById("countDownTable");
   countDownTableBox.innerHTML = "";
    
   const statusRow = document.createElement("div");
   statusRow.classList.add("row");
    
   const statusCol = document.createElement("div");
   statusCol.classList.add("col", "fs-4");
   // 경매 상태에 ID 부여
   statusCol.id = "statusTitle";
   
   statusRow.appendChild(statusCol);
   
   // 남은 시간 카운트 공간
   const remainTimeRow = document.createElement("div");
   remainTimeRow.classList.add("row","mt-2","fs-1", "text-center");
   remainTimeRow.style.fontFamily = 'Lato';
   
   const remainTimeCol = document.createElement("div");
   remainTimeCol.classList.add("col", "fw-bold");
   // 타임어택 ID 부여
   remainTimeCol.id = "timeAttack";
   
   remainTimeRow.appendChild(remainTimeCol);
   
   countDownTableBox.appendChild(statusRow);
   countDownTableBox.appendChild(remainTimeRow);

}


// 경매 종료 제목 표시 (완료)
function showCountDownTableEnd() {
	
    const statusCol = document.getElementById("statusTitle");
    if (statusCol.innerText !== "경매가 종료되었습니다.") { // 현재 텍스트와 동일한 경우에는 업데이트하지 않음
        statusCol.innerHTML = "";
        statusCol.classList.add("text-danger", "fs-5");
        statusCol.innerText = "경매가 종료되었습니다.";
    } 
	
}

//경매 진행중 제목 표시 (완료)
function showCountDownTableIng() {
	
   const statusCol = document.getElementById("statusTitle");
    if (statusCol.innerText !== "경매 종료까지 남은 시간") { // 현재 텍스트와 동일한 경우에는 업데이트하지 않음
        statusCol.innerHTML = "";
    	statusCol.classList.add("text-danger");
        statusCol.innerText = "경매 종료까지 남은 시간";
    }
	
}

//경매 시작전 제목 표시 (완료)
function showCountDownTableBefore() {
	
   const statusCol = document.getElementById("statusTitle");
    if (statusCol.innerText !== "경매 시작까지 남은 시간") { // 현재 텍스트와 동일한 경우에는 업데이트하지 않음
        statusCol.innerHTML = "";
        statusCol.innerText = "경매 시작까지 남은 시간";
    }
	
}



// 타임어택 숫자 (완료) 오로지 시간에 의해서만 (중요!!!!!)
function updateAuctionCountDown() {
	
 
       const timeAttackBox = document.getElementById("timeAttack");
       timeAttackBox.innerHTML = "";
       
       const nowDate = new Date();
       
       let countdownResult;
       
       
      // 경매 종료
      if(endDate <= nowDate || immeDiateSuccess == "ImmediateBidSuccess") {
    	  renewInputBidBoxEnd(); // 입찰버튼 업데이트, 한번만 갱신 (o)
    	  showCountDownTableEnd(); // 카운트다운 제목 업데이트, 한번만 갱신 (o)
    	  renewAuctionButtonStatusEnd(); // 제품 정보 버튼 업데이트 (o)
    	  renewAuctionItemStatusEnd();
    	  return;
      }
      else {
      // 경매가 시작된 경우
      	 if (startDate <= nowDate){  
      	  if (sellerId != sessionId) {
      	  	renewInputBidBoxIng(); //(o)
      	  } else {
      		forbidInputBidBox();
      	  }
      	  showCountDownTableIng(); //(o)
      	  renewAuctionButtonStatusIng(); // (o)
      	  
    	  countdownResult = countdownFromEndDate(endDate);
    	  // 경매 종료까지 남은 시간
      	} 
      // 경매가 시작되지 않은 경우
     	 else {
    	  	if (sellerId != sessionId) {
    	  	renewInputBidBoxBefore();//(o)
    	  } else {
    		  forbidInputBidBox();
    	  }
    	  showCountDownTableBefore();//(o)
    	  renewAuctionButtonStatusBefore();
    	  
    	  countdownResult = countdownFromStartDate(startDate);
      }
      
	  // 카운트다운
      const spanTime1 = document.createElement("span");
      spanTime1.innerText = countdownResult.days + "일 ";
      
      const spanTime2 = document.createElement("span");
      spanTime2.innerText = ("0" + countdownResult.hours).slice(-2) + ":";
     	
      const spanTime3 = document.createElement("span");
      spanTime3.innerText = ("0" + countdownResult.minutes).slice(-2) + ":";
     	
      const spanTime4 = document.createElement("span");
      if(countdownResult.seconds <= 10) {
      	spanTime4.classList.add("text-danger");
      } 
      spanTime4.innerText = ("0" + countdownResult.seconds).slice(-2);      
      
     
       timeAttackBox.appendChild(spanTime1);
       timeAttackBox.appendChild(spanTime2);
       timeAttackBox.appendChild(spanTime3);
       timeAttackBox.appendChild(spanTime4);
      }

}


// 상품 정보 모달 띄우기
function auctionInfoPage() {
	
	const auctionInfoModal = bootstrap.Modal.getOrCreateInstance("#auctionInfoModal");
	auctionInfoModal.show();
}


// 입찰하기 
function bidRequest() {

	const bidPriceBox = document.getElementById("bidPrice");
	const buttonBox = document.getElementById("inputBidButton");
	
	if(sessionId == null) {
		location.href = "/safari/user/loginPage";
		return;
	 }

	 if (bidPriceBox.value < currentPrice) {
	    const alertModal = bootstrap.Modal.getOrCreateInstance("#alertModal");
	    alertModal.show();
	    
	    setTimeout(function() {
	        alertModal.hide();
	      }, 1000);		
	    
	    bidPriceBox.value='';
	    bidPriceBox.focus();
	    return;
	 }
	 
	const xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status == 200){
            const response = JSON.parse(xhr.responseText);
        	if (response.result == "success") {
        		
         		if (bidPriceBox.value >= response.auctionItemDto.max_price) { // 즉시 낙찰하였을 때
        		    const immediateBidSuccessModal = bootstrap.Modal.getOrCreateInstance("#immediateBidSuccessModal");
         			const immediateBidSuccessAlert = document.getElementById("immediateBidSuccessAlert");
         			immediateBidSuccessAlert.innerHTML = "";
         			immediateBidSuccessAlert.innerText = response.userDto.nickname + "님이 " + 
         			new Intl.NumberFormat('ko-KR').format(bidPriceBox.value) +"원으로 즉시 낙찰에 성공하여 경매가 종료됩니다.";
        		    immediateBidSuccessModal.show();
         			
        		    bidPriceBox.value='';
        		    
            		getCurrentPrice();   // 현재가 업데이트 (나중에 낙찰가로 변경)   
            		
            		renewSuccessfulImmediateBid(auctionItemId); // 즉시 낙찰
        			// 누구누구 낙찰되었습니다 모달 띄우기
        			//renewAuctionItemStatusEnd();
        		    
        		    setTimeout(function() {
        		    	immediateBidSuccessModal.hide();
        		      }, 2000);
        		} 
         		else {       		
        		
	        		const bidModal = bootstrap.Modal.getOrCreateInstance("#bidModal"); // 입찰 완료 모달 창 띄우기
	     		   	bidModal.show();
	     		   	
	     		    setTimeout(function() { // 1초 뒤 모달 창 삭제
	     		    	bidModal.hide();
	    		      }, 1000);
	        			
	     		    bidPriceBox.value='';
	     		  
	        		getCurrentPrice(); // 현재가 업데이트
        		
        		}
			 } 
        	}
        }


    xhr.open("post", "/safari/auction/bidRequest/"+auctionItemId);
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); 
    xhr.send("&userId=" + sessionId + "&bid_price=" +  bidPriceBox.value);
}


// 즉시 낙찰 상태 확인 후 업데이트
function checkImmediateBid() {
	
	const xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status == 200){
            const response = JSON.parse(xhr.responseText);	
				if (response.auctionItemStatus.auction_status == '종료') {
					immeDiateSuccess = "ImmediateBidSuccess";
				   
				    
				}
	}
        
   }
    xhr.open("get", "/safari/auction/getAuctionStatusByAuctionItemId/" + auctionItemId); 
    xhr.send();	
	
}


// 즉시 낙찰 및 경매 종료 db 업데이트
function renewSuccessfulImmediateBid(auctionItemId) {
	const xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status == 200){
            const response = JSON.parse(xhr.responseText);
            
            checkImmediateBid();
        }
    }
    xhr.open("get", "/safari/auction/renewImmediateSuccessfulBid?auctionItemId=" + auctionItemId); // 종료로 db에 저장
    xhr.send();
}


/* 날짜 변경 함수*/
function formatDate(date) {
    
    var d = new Date(date),
    
    month = '' + (d.getMonth() + 1) , 
    day = '' + d.getDate(), 
    year = d.getFullYear();
    
    if (month.length < 2) month = '0' + month; 
    if (day.length < 2) day = '0' + day; 
    
    return [year, month, day].join('/');
    
    }
    
// 날짜 변경    
function formatDateTime(dateTimeString) {
	  const date = new Date(dateTimeString);
	  const year = date.getFullYear();
	  const month = date.getMonth() + 1;
	  const day = date.getDate();
	  const hours = date.getHours();
	  const minutes = date.getMinutes();
	  const period = hours >= 12 ? '오후' : '오전';
	  const formattedDateTime = year + '.' + month + '.' + day + ' ' + period + ' ' + (hours % 12) + ':' + minutes.toString().padStart(2, '0');

	  return formattedDateTime;
	}    

/*입찰 기록 리스트 출력*/
function reloadBidList() {
    const xhr = new XMLHttpRequest();
    
    xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status == 200){
            const response = JSON.parse(xhr.responseText);

            const bidListBox = document.getElementById("bidListBox");
            bidListBox.innerHTML = "";

            let maxBidPrice = 0; // 가장 큰 입찰가 초기값 설정
            
            for(data of response.bidList) {
            	const tr = document.createElement("tr");
            	const td1 = document.createElement("td");
            	td1.classList.add("text-center");
            	
            	td1.innerText = data.userDto.nickname;
    	
            	const td2 = document.createElement("td");
            	td2.classList.add("text-end");
            	
              	const bidPrice = data.auctionBidDto.bid_price; 
            	const formattedbidPrice = new Intl.NumberFormat('ko-KR').format(bidPrice);
            	
                // 가장 큰 입찰가인 경우 빨간색으로 표시
                if (bidPrice > maxBidPrice) {
                  maxBidPrice = bidPrice;
                  td2.classList.add("text-danger", "fw-bold");
                }
  
            	
            	td2.innerText = formattedbidPrice + "원";
            	
            	const td3 = document.createElement("td");
            	td3.classList.add("text-center");
            	td3.innerText = formatDate(data.auctionBidDto.reg_date);
            	
            	tr.appendChild(td1);
            	tr.appendChild(td2);
            	tr.appendChild(td3);
            	
            	bidListBox.appendChild(tr);
  
            }
     
        }
    }	
    
    xhr.open("get", "/safari/auction/getBidList?auctionItemId=" + auctionItemId);
    xhr.send();

}


// 경매 현재가 계속 업데이트
function getCurrentPrice() {
	
	const xhr = new XMLHttpRequest();
	
	 xhr.onreadystatechange = function () {
	        if(xhr.readyState == 4 && xhr.status == 200){
	            const response = JSON.parse(xhr.responseText);
	            currentPrice = response.currentPrice;
	           
	            updateCurrentPrice(new Intl.NumberFormat('ko-KR').format(currentPrice));
	        }
	  }    
	  
	  xhr.open("get", "/safari/auction/getCurrentPrice?auctionItemId=" + auctionItemId);
	  xhr.send();	  
}

// 현재가를 업데이트하여 jsp화면에 출력
function updateCurrentPrice(currentPrice) {
  const currentPriceElement = document.getElementById("currentPrice");
  	if (currentPriceElement) {
    	currentPriceElement.textContent = currentPrice.toString() + "원";
  }
}



//찜 아이콘 클릭
function toggleLikeAuctionProduct() {
    if(sessionId == null) {
        location.href = "/safari/user/loginPage";
        return;
    }

    const xhr = new XMLHttpRequest();

    xhr.onreadystatechange = function(){
        if(xhr.readyState == 4 && xhr.status == 200){
            const response = JSON.parse(xhr.responseText);
     
            refreshTotalLikeCount();
            refreshMyHeart();
        }
    }

    xhr.open("get", "/safari/auction/toggleLikeAuctionProduct?auction_item_id=" + auctionItemId);
    xhr.send();
} 

// 찜 아이콘 
function refreshMyHeart(){

    const xhr = new XMLHttpRequest();
    
    xhr.onreadystatechange = function(){
        if(xhr.readyState == 4 && xhr.status == 200){
            const response = JSON.parse(xhr.responseText);
            // js 렌더링... 작업..
            const heartBox = document.getElementById("heartBox");
            
            if(response.checklikeAuctionProductByUser){
            	// 찜한 상태일 경우	
                //heartBox.classList.remove();
                heartBox.classList.remove("bi-heart");
                heartBox.classList.add("bi-heart-fill");
               
            } else {
            	// 찜하지 않은 상태일 경우
                //heartBox.classList.remove();
                heartBox.classList.remove("bi-heart-fill");
                heartBox.classList.add("bi-heart");
             
            }
        }
    }

    //get
    xhr.open("get", "/safari/auction/checklikeAuctionProductByUser?auction_item_id=" + auctionItemId);
    xhr.send();    
}

//찜 개수 갱신
function refreshTotalLikeCount() {
		
    const xhr = new XMLHttpRequest();
    
    xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status == 200){
            const response = JSON.parse(xhr.responseText);
            
            const totalLikeCountBox = document.getElementById("totalLikeCount");
            totalLikeCountBox.innerText = response.count;
            
        }
    }	
    xhr.open("get", "/safari/auction/countLikeAuctionProduct?auctionItemId=" + auctionItemId);
    xhr.send();
}

/* 찜 여부 확인
function checkAuctionLikeByUser(callback) {
	
	const xhr = new XMLHttpRequest();
	
	let isLiked = false;
	
	xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status == 200){
            const response = JSON.parse(xhr.responseText);
            
            if (response.checklikeAuctionProductByUser) {
                callback(true);
              } else {
                callback(false);
              }
        }
    }	
	xhr.open("get", "/safari/auction/checklikeAuctionProductByUser?auction_item_id=" + auctionItemId);
	xhr.send();	
}*/


//수정 모달 페이지 띄우기
function modifyProductPage() {
	
	if (sessionId == null) {
		location.href = "/safari/user/loginPage";
		return;
	} else {
		const modifyProductModal = bootstrap.Modal.getOrCreateInstance("#modifyProductModal");
		modifyProductModal.show();
	}
}

// 수정에 필요한 기능
// 대분류 카테고리의 기본 선택 값 설정

const defaultMainCategoryId =  ${productDetail.productMainCategoryDto.id}; 

// 대분류 카테고리 드롭다운을 기본 선택 값으로 설정
const modifyMainCategoryDropdown = document.getElementById('modifyMainCategoryDropdown');
modifyMainCategoryDropdown.value = defaultMainCategoryId;

// 초기 선택한 대분류 카테고리에 해당하는 소분류 카테고리 리스트 출력
getModifyProductSubcategories();



// 카테고리 수정
function getModifyProductSubcategories() {
const productMainCategoryId = document.getElementById('modifyMainCategoryDropdown').value;
const xhr = new XMLHttpRequest();

xhr.onreadystatechange = function() {
    if (xhr.readyState === 4 && xhr.status === 200) {

        const response = JSON.parse(xhr.responseText);
        
        getModifyProductSubcategoriesList(response.subCategories);
    }
};
xhr.open("get", "/safari/auction/getProductSubCategories/" + productMainCategoryId);
xhr.send();
}	


function getModifyProductSubcategoriesList(subCategories) {
const subCategoryDropdown = document.getElementById('modifySubCategoryDropdown');
subCategoryDropdown.innerHTML ='';
subCategories.forEach(function(subCategory) {
    const option = document.createElement('option');
    option.value = subCategory.id;
    option.text = subCategory.sub_category_name;
    
    /* 나중에 수정 */
    if (option.value == '${productSubCategory}') {
        option.selected = true;
    }
    subCategoryDropdown.appendChild(option);
});
}

//경매 물품 수정
function modifyAuctionProduct() {

   const xhr = new XMLHttpRequest();
   
   const titleBox = document.getElementById("modifyTitle");
   const subCategoryBox = document.getElementById("modifySubCategoryDropdown");
   const descriptionBox = document.getElementById("modifyDescription");
   const startPriceBox = document.getElementById("modifyStartPrice");
   const maxPriceBox = document.getElementById("modifyMaxPrice");
   const startDateBox = document.getElementById("modifyStartDate");
   const endDateBox = document.getElementById("modifyEndDate");
   const imageFilesInput = document.getElementById("modifyAuctionItemImgFiles");
   
    xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status == 200){
            const response = JSON.parse(xhr.responseText);

            if(response.result == "success") {
            	const modifyProductModal = bootstrap.Modal.getOrCreateInstance("#modifyProductModal");
            	modifyProductModal.hide();
            	window.location.href = "/safari/auction/productDetail/" + auctionItemId;
            	
           
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
    formData.append("id", auctionItemId);
    
    // 이미지 파일 추가
    const imageFiles = imageFilesInput.files;
    for (let i = 0; i < imageFiles.length; i++) {
      formData.append("auctionItemImgFiles", imageFiles[i]);
    }	    
    

    xhr.open("post", "/safari/auction/modifyProductProcess");
    // Content-Type 헤더를 설정하여 multipart/form-data로 전송
   //ㄴ xhr.setRequestHeader("Content-Type", "multipart/form-data");
    xhr.send(formData);	

}

//수정 기능 종료


// 채팅 입력
function sendMessage() {
	
    if(sessionId == null) {
    	location.href="/safari/user/loginPage"
        return;
    }
    
    const chatContentBox = document.getElementById("chatContentBox");
    const chatContentValue = chatContentBox.value;
    
	const xhr = new XMLHttpRequest();
	
   	xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status == 200){
            	const response = JSON.parse(xhr.responseText);
           		chatContentBox.value = "";
           		reloadChatList();
        }
    }	
	    	
	xhr.open("post", "/safari/auction/sendMessageInAuctionChatroom/"+auctionItemId);
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); 
	xhr.send("&content=" + chatContentValue);
}


// 채팅 삭제
/*function removeChat(id) {
	const xhr = new XMLHttpRequest();
	
   	xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status == 200){
           	const response = JSON.parse(xhr.responseText);
          	reloadChatList();
        }
    }
   	xhr.open("get", "/safari/auction/removeMessageInAuctionChatroom/" + id);
   	xhr.send();   	
}*/

//채팅 기록 조회
function reloadChatList() {

   const xhr = new XMLHttpRequest();
   
   xhr.onreadystatechange = function () {
       if(xhr.readyState == 4 && xhr.status == 200){
           const response = JSON.parse(xhr.responseText);

           const chatMessageBox = document.getElementById("chatMessageBox");
           const shouldAutoScroll = isScrolledToBottom(chatMessageBox); // 스크롤 여부 확인
           chatMessageBox.innerHTML = "";
           
         
          <%--.reverse() --%>
           for(data of response.chatList.reverse()) {
               // 댓글 작성자와 현재 사용자 비교
               let row = "";
               
               if (data.userDto.id != sessionId) {                 
                   row = document.createElement("div");
                   row.classList.add("row");
                   row.classList.add("mt-2");

                   const col = document.createElement("div");
                   col.classList.add("col");
                   col.classList.add("ms-3");
                   
                   const row1 = document.createElement("div");
                   row1.classList.add("row");
                   row1.classList.add("mb-1");

                   const col1 = document.createElement("div");
                   col1.classList.add("col");
                   col1.style.fontSize = "14px";
                   
                   if(data.userDto.id == sellerId) {
                	   col1.innerText = data.userDto.nickname + " (판매자)";
                   } else {
                   col1.innerText = data.userDto.nickname;
                   }
                   
                   row1.appendChild(col1);

                   const row2 = document.createElement("div");
                   row2.classList.add("row");

                   const col2= document.createElement("div");
                   col2.classList.add("col");
               
                   col2.classList.add("speech-bubble");
                   
                   col2.classList.add("ms-2");
                   col2.style.fontSize = "14px";
                   col2.innerText = data.chatDto.content;

                   row2.appendChild(col2);
                   
                   const row3 = document.createElement("div");
                   row3.classList.add("row");
                   
                   const col3 = document.createElement("div");
                   col3.classList.add("col");
                   col3.style.fontSize = "12px";
                   col3.style.color = "#929693";
                   col3.innerText = formatDateTime(data.chatDto.reg_date);
                   
                   
                   row3.appendChild(col3);

                   col.appendChild(row1);
                   col.appendChild(row2);
                   col.appendChild(row3);

                   const col4 = document.createElement("div");
                   col4.classList.add("col");
                   
                   

                   row.appendChild(col);
                   row.appendChild(col4);

               } else {
                   row = document.createElement("div");
                   row.classList.add("row");
                   row.classList.add("mt-2");

                   const col = document.createElement("div");
                   col.classList.add("col");

                   const col1 = document.createElement("div");
                   col1.classList.add("col");
                   col1.classList.add("me-3");

                   const row1 = document.createElement("div");
                   row1.classList.add("row");
                  
                   row1.classList.add("mb-1");

                   const col2 = document.createElement("div");
                   col2.classList.add("col");
                   col2.classList.add("fw-bold");
                   col2.style.fontSize = "14px";
                   
                   col2.innerText = "";

                   row1.appendChild(col2);

                   const row2 = document.createElement("div");
                   row2.classList.add("row");
                  

                   const col3 = document.createElement("div");
                   col3.classList.add("col");
                   col3.style.display = "flex";
                   col3.style.justifyContent = "end";
                   col3.classList.add("my-speech-bubble", "me-2");
                   
                   /*col3.classList.add("text-end");*/
                   col3.innerText = data.chatDto.content;
                   
    
                   row2.appendChild(col3);
                   
                   
                   const row3 = document.createElement("div");
                   row3.classList.add("row", "text-end");
                   
                   
                   const col4 = document.createElement("div");
                   col4.classList.add("col");
                   col4.style.fontSize = "12px";
                   col4.style.color = "#929693";
                   col4.innerText = formatDateTime(data.chatDto.reg_date);
                   
                   
                   row3.appendChild(col4);
                   
                   
                   <%--const timeRow = document.createElement("div");
                   timeRow.classList.add("row");
                   
                   const timeCol = document.createElement("div");
                   timeCol.classList.add("col");
                   timeCol.classList.add("text-end");
                   timeCol.innerText =  --%>
                   
                   <%-- 수정 --%>
                
                   <%--const deleteRow = document.createElement("div");
                   deleteRow.classList.add("row");
                   
                   const deleteCol = document.createElement("div");
                   deleteCol.classList.add("col");
                   deleteCol.classList.add("text-end");
                   
                  
                   const deleteButton = document.createElement("button");
                   deleteButton.classList.add("btn");
                   deleteButton.classList.add("btn-sm");
                   deleteButton.classList.add("btn-white");
                   deleteButton.classList.add("text-danger");
                   deleteButton.innerText = "삭제";
                   deleteButton.addEventListener("click", function() {
                       removeChat(data.chatDto.id); // 삭제 동작을 수행하는 함수 호출
                   });
                   
                   deleteCol.appendChild(deleteButton);
                  
                   
                   deleteRow.appendChild(deleteCol);--%>
                   
    
                   <%-- 수정 --%>                   

                   col1.appendChild(row1);
                   col1.appendChild(row2);        
                   col1.appendChild(row3);        
                   <%--col1.appendChild(deleteRow); --%>
                  

                   row.appendChild(col);
                   row.appendChild(col1);
               }
               chatMessageBox.appendChild(row);

        }
           if (shouldAutoScroll) {
               chatMessageBox.scrollTop = chatMessageBox.scrollHeight;
             }
           
   }
   }
   xhr.open("get", "/safari/auction/getChatHistoryInAuctionChatroom?auctionItemId=" + auctionItemId);
   xhr.send();
}


//스크롤이 맨 아래에 있는지 확인하는 함수
function isScrolledToBottom(element) {
  return element.scrollHeight - element.clientHeight <= element.scrollTop + 1;
}

// 사용자가 스크롤을 조작할 때 자동 스크롤을 비활성화하는 이벤트 핸들러
document.getElementById("chatMessageBox").addEventListener("scroll", function (event) {
  const chatMessageBox = event.target;
  const shouldAutoScroll = isScrolledToBottom(chatMessageBox);

  // 스크롤이 맨 아래에 있을 경우에만 자동 스크롤 활성화
  if (shouldAutoScroll) {
    chatMessageBox.scrollTop = chatMessageBox.scrollHeight;
  }
});
	

window.addEventListener("DOMContentLoaded", function(){
    //사실상 시작 시점...
 
    getSessionId();
    getSellerId();
    setInterval(checkImmediateBid, 100); // 즉시낙찰여부확인
    checkImmediateBid();
    showAuctionInfo();
    showAuctionStatusTitle();
    //checkImmediateBid();
    setInterval(updateAuctionCountDown, 100);

    setInterval(reloadBidList, 100);
 
    //refreshTotalLikeCount();
    refreshMyHeart();
    setInterval(reloadChatList, 100);
    setInterval(getCurrentPrice, 100);

    showInputBidBox(); // 입찰 버튼 기본 설정 보여주기
    //getStatusForRenewInputBidBox();
    
 
    //getAuctionButtonStatus();
    //setInterval(getAuctionButtonStatus, 100); // 이렇게 해줘야 상태 버튼 생성
    

 
});


</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>