<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
    
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="/safari/resources/style/common.css" type="text/css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

<link rel="stylesheet" href="/safari/resources/style/auction.css" type="text/css">



<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 메타 섹션 -->
<jsp:include page="../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->
<style>
.text-trophy {
	/*color: #fcba03;*/
	color:#ff6f0f;
}

.text-like {
	color: #FF7777;
}

.modal-dialog .modal-lg  {
	height: 700px;
}
.overflow {
  white-space: nowrap; /* 텍스트를 한 줄로 표시 */
  overflow: hidden; /* 넘친 텍스트를 숨김 */
  text-overflow: ellipsis; /* 넘친 텍스트를 "..."으로 표시 */
}    

.overflow_span {
  white-space: nowrap; /* 텍스트를 한 줄로 표시 */
  overflow: hidden; /* 넘친 텍스트를 숨김 */
  text-overflow: ellipsis; /* 넘친 텍스트를 "..."으로 표시 */
   display: inline-block; 
}    

.myContent {
  background-color: rgba(75, 137, 220, 0.25);  /* 배경색 */
  color: #000000; /* 글자색 */
  padding: 10px; /* 여백 */
  border-radius: 10px; /* 테두리의 굴곡 정도 */
  text-align: end; /* 내용을 오른쪽 정렬 */
  width: auto;
  max-width: 320px;
}

.otherContent {
  background-color: #EAEAEA; /* 배경색 */
  color: #000000; /* 글자색 */
  padding: 10px; /* 여백 */
  border-radius: 10px; /* 테두리의 굴곡 정도 */
  text-align: start; /* 내용을 왼쪽 정렬 */
  width: auto;
  max-width: 320px;
}

div .bidTable {
	height: 300px;
	overflow: auto;
}
 table {
    border-collapse: collapse;
  }

a {
	color: inherit;
	text-decoration: none;
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

input[type="radio"] {
	
	display: none;
}
.tab_content {font-size:0;}


input[type="radio"] + label {
	display: inline-block;
	padding: 10px;
	background: white;
	width: 230px;
	border: 0.4px solid #E2E3E5;
	color: black;
	font-weight: bold;
	font-size: 17px;
	cursor: pointer; /* 마우스가 올라가면 커서를 바꾸는 속성 */
}

input[type="radio"]:checked + label { /* :checked - 체크가 되었을 때 변화되는 속성*/
	background: #E2E3E5;
	color: #000;
}
input[id="tab01"]:checked ~ .con1 {
	display: block; /* 화면에 보이게 설정 */
}
input[id="tab02"]:checked ~ .con2 {
	display: block;
}
input[id="tab03"]:checked ~ .con3 {
	display: block;
}
.col-auto-width {
  display: inline-block;
  width: auto;
}

.orangeButton{
	background: #ff6f0f;
	font-weight: bold;
	color: white;
}
.orangeButton:hover{
	background: #FF812C;
	font-weight: bold;
	color: white;
}


.chatTime {
    font-size: 12px;
}

.custom-table-secondary {
 background-color: #f4f4f4!important;
 }

.btn_auctionEnd{padding:4px 12px; background: #adb5bd; border:none; color: white; border-radius:8px; font-size: 14px; font-weight: bold;  pointer-events: none; }
.btn_auctionReady{padding:4px 12px; background: #e6edfe; border:none; color: #789efd; border-radius:8px; font-size: 14px; font-weight: bold; pointer-events: none; }
.btn_auctionIng{padding:4px 12px; background: #dff5ea; border:none; color: #6db590; border-radius:8px; font-size: 14px; font-weight: bold; pointer-events: none; }

.btn_delivered{padding:4px 12px; background: #e9ecef; border:none; color: black; border-radius:8px; font-size: 14px; pointer-events: none;}
.btn_canceled{padding:4px 12px; background: #e6edfe; border:none; color: #789efd; border-radius:8px; font-size: 14px; pointer-events: none;}
.btn_ordered{padding:4px 12px; background: #dff5ea; border:none; color: #6db590; border-radius:8px; font-size: 14px; pointer-events: none;}
</style>
</head>
<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->
	
	 <div class="row">
	 	<div class="col"></div>
	 	<%-- 공간 시작 --%>
	 	<div class="col-8">
	 	
	 	
		 	<div class="row">
		 		<div class="col fw-medium" style="font-size: 18px">
		 			<c:if test="${!empty sessionUser }">
		 				<span onclick="myBidListModal()" style="cursor:pointer;"><i class="bi bi-list-ul me-2"></i>내 입찰목록 실시간 확인</span>
		 			</c:if>
		 		</div>
		 		<div class="col text-end" style="font-size: 17px">
		 			<!-- <a href="/safari/auction/mainPage" class="fw-semibold">메인 페이지 이동</a> -->
		 		</div>
		 	</div> 
	 	
	 
	 
	 	<div class="row mt-3">
	 	
	 		<div class="col">
	 			
	 			<div class="row">
	 				<%-- 1열 --%>
	 				<div class="col">
	 				
	 					<div class="row">
							<div class="col-11 px-0 ms-4">
								
								<div class="row mb-1" >
									<div class="col-11" id="countDownTable" >
									
									</div>
									<div class="col"></div>
								</div>
							</div>
							
						</div>
	 					
	 				
	 					
	 					<div class="row">
	 						<div class="col-11 text-center">
	 						
	 						
	 							<img src="/auctionFiles/${productDetail.auctionMainImgDto.auction_item_img_link}"
	 							class="img-fluid" onclick="auctionInfoPage()" style="cursor: pointer;">
	 							
	 						</div>
	 						
	 					</div>
	 					
	 					<div class="row mt-2">
	 						<div class="col ms-1 text-secondary" style="font-size: 14px;">
	 							※ 상품 이미지를 클릭하시면 상세정보와 Q&A를 확인하실 수 있습니다.
	 						</div>
	 					</div>
	 					
	 	<!-- 				<div class="row mt-5">
	 						<div class="col">
	 						
	 							<div class="row">
	 								<div class="col fs-5 fw-bold">
	 									입찰 안내
	 								</div>
	 							</div>
	 							
	 							<div class="row mt-2">
	 								<div class="col"> 
	 									 <div class="row">
	 										<div class="col-auto">
	 											• 최소 <span style="color: #ff6f0f;">1,000원</span> 단위로 입찰하실 수 있습니다.
	 										</div>
	 										<div class="col fw-bold px-0" style="cursor: pointer;" onclick="bidNoticeModal()">
	 											상세보기
	 										</div>
	 									</div>
	 									
	 									 <div class="row">
	 									 	<div class="col">
	 									 		• 현재 보유하신 코인보다 더 높은 금액은 입찰하실 수 없습니다.
	 									 	</div>
	 									 </div>
	 									 
	 									
	 									 
	 									 <div class="row">
	 									 	<div class="col" style="color: #ff6f0f;">
	 									 		• 경매 종료 시간 30초 이전 입찰 시, 경매 종료시간이 30초씩 자동연장됩니다.
	 									 	</div>
	 									 </div>	 									 
	 									
	 									<div class="row">
	 										<div class="col">
	 											• 같은 경매에 다른 회원과 동시에 입찰하였을 경우, 입찰에 실패하실 수 있습니다.
	 										</div>
	 									</div>
	 									
 										<div class="row">
	 										<div class="col">
	 											• 낙찰하신 후, 7일 이내에 결제하지 않으실 경우 유찰 처리되오니 주의하세요.
	 										</div>
	 									</div>	 									
	 				
	 								</div>
	 							</div>
	 
	 						</div>
	 					</div> -->
	 					
	 					
	 					<div class="row mt-5">
	 						<div class="col">
	 						
	 							<div class="row">
	 								<div class="col fw-bold fs-5">
	 									실시간 입찰 현황
	 								</div>
	 							</div>
	 						
	 							<%-- 입찰 표 --%>
								<div class="row mt-2">
									
								 	<div class="col-11">
								 	
									 	<div class="row mt-2 fw-medium border-bottom border-black border-2 py-2">
											<div class="col text-center">
												닉네임
											</div>
											<div class="col text-center">
												입찰가
											</div>
											
											<div class="col text-center">
												거래일
											</div>
										</div>
												 	
									 		
							 			<div class="row">
							 				<div class="col" id="bidListBox" style="height: 500px; overflow: auto">
							 					
							 				</div>
							 			</div>
									 </div>
								   </div>	 	 						
	 								<%-- 입찰 표 --%>
	 							
	 						
	 						</div>
	 					
	 					</div>
	 			
	 				</div>
	 				<%-- 1열 --%>
	 				
	 				<%-- 2열 --%>
	 				<div class="col">
	 				
	 					<div class="row">
	 						<div class="col">
	 							
	 							<%-- 카테고리 --%>
	 							<div class="row">
	 								<div class="col text-secondary">
	 									<a href="/safari/auction/List">홈</a>
	 									<span style="font-size: 14px;" class="m-1"> > </span>
	 									${productDetail.productMainCategoryDto.main_category_name}
	 									<span style="font-size: 14px;" class="m-1"> > </span>
	 									${productDetail.productSubCategoryDto.sub_category_name}
	 								   
	 								</div>
	 								<div class="col text-end text-secondary">
	 									<div class="row">
	 										<div class="col" onclick="sellerInfoModal()" style="cursor: pointer;">
	 											<i class="bi bi-info-circle"></i> <span class="ms-1">판매자 정보 확인하기</span>
	 										</div>
	 									</div>
	 								</div>
	 							</div>
	 							<%-- 카테고리 --%>
	 							
	 							<%-- 상태 --%>
	 							<div class="row mt-2">
	 								<div class="col" id="auctionStatus">
	 									
	 								</div>
	 								<div class="col text-end">
	 								
	 									<i class="bi bi-share fs-5" onclick="clip()" style="cursor: pointer;"></i>
	 								</div>
	 								
	 							</div>
	 							<%-- 상태 --%>
	 							
	 							<%-- 제목 --%>
	 							<div class="row mt-1">
	 								<div class="col fs-4 fw-semibold">
	 									${productDetail.auctionDto.title}
	 								</div>
	 							</div>
	 							<%-- 제목 --%>
	 							
	 							<%-- 하트 --%>
	 							<div class="row mt-1">
	 								<div class="col" id="editBar">
	 									<!-- i id="heartBox" class="bi bi-heart text-danger fs-5"></i> -->
	 								</div>
	 								<div class="col text-end" id="sellerBar">
	 									
	 								</div>
	 							</div>
	 							<%-- 하트 --%>
	 							
	 							<%-- 가격 --%>
	 							<div class="row mt-3">
	 								<div class="col">
	 									
	 									<div class="row">
	 										<div class="col fs-5 mt-2 fw-medium text-secondary" id="priceTitle"
	 										> </div>
	 										<div class="col text-end fw-bold">
	 										
	 											<span style="color: #FF7777" class="fw-bold fs-2 me-1" id="currentPrice"></span>원
	 										</div>
	 									</div>
	 									
	 									<div class="row mt-2" style="border-bottom: 0.8px solid #E2E3E5;">
	 										<div class="col"></div>
	 									</div>
	 									
	 									
	 									<%-- 행 --%>
	 									<div class="row mt-2 mb-2">
	 										<div class="col text-secondary fw-medium">
	 											<div class="row">
	 												<div class="col">
	 													즉시낙찰가
	 													
	 												</div>
	 											</div>
	 											<div class="row mt-1">
	 												<div class="col">경매시작일</div>
	 											</div>
	 											<div class="row">
	 												<div class="col">경매종료일</div>
	 											</div>	 											
	 											
	 										</div>
	 										
	 										
	 										<div class="col text-end">
	 											<div class="row">
	 												<div class="col">
	 													<span class="fw-bold" id="auctionImmediatePrice"></span> 원
	 												</div>
	 											</div>
	 											<div class="row mt-1">
	 												<div class="col">
	 													<span id="auctionStartDate"></span>
	 												</div>
	 											</div>
	 											<div class="row">
	 												<div class="col">
	 													<span id="auctionEndDate"></span>
	 												</div>
	 											</div>	 												 											
	 										</div>
	 									</div>
	 									<%-- 행 --%>
	 									
	 									
			 					<div class="row mt-4">
			 						<div class="col p-1 rounded-1 bg-light">
			 						
			 							<div class="row mt-1">
			 								<div class="col ms-3">
					 							<div class="row mt-1">
					 								<div class="col fw-bold" style="font-size: 18px">
					 									입찰 안내
					 								</div>
					 								<div class="col mt-1 text-end me-4" style="cursor: pointer; font-size: 15px" onclick="bidNoticeModal()">
			 											상세보기 <span class="ms-1" style="font-size: 13px"> > </span>
			 										</div>
					 							</div>
				 							
					 							<div class="row mt-2">
					 								<div class="col"> 
					 									 <div class="row">
					 										<div class="col-auto">
					 											• 최소 <span class="text-danger">1,000원</span> 단위로 입찰하실 수 있습니다.
					 										</div>
					 										<!-- <div class="col fw-bold px-0" style="cursor: pointer;" onclick="bidNoticeModal()">
					 											상세보기
					 										</div> -->
					 									</div>
					 									
					 									 <div class="row">
					 									 	<div class="col">
					 									 		• 현재 보유하신 코인보다 더 높은 금액은 입찰하실 수 없습니다.
					 									 	</div>
					 									 </div>
					 									 
					 									
					 									 
					 									 <div class="row mb-3">
					 									 	<div class="col text-danger"> <!-- style="color: #ff6f0f;" --> 
					 									 		• 경매 종료 시간 1분 이전 입찰 시, 종료 시간이 현재 시간으로부터 <span class="fw-bold">1분 자동연장</span>됩니다.
					 									 	</div>
					 									 </div>	 									 
					 									
					 									<!-- <div class="row mb-1">
					 										<div class="col">
					 											• 같은 경매에 다른 회원과 동시에 입찰하였을 경우, 입찰에 실패하실 수 있습니다.
					 										</div>
					 									</div> -->
					 									
				 									<!-- 	<div class="row">
					 										<div class="col">
					 											• 낙찰하신 후, 7일 이내에 결제하지 않으실 경우 유찰 처리되오니 주의하세요.
					 										</div>
					 									</div>	 		 -->							
					 				
					 								</div>
					 							</div>
				 							</div>
			 							</div>
			 						</div>
			 					</div>
	 									
	 									
	 									<div class="row mt-3">
	 										<div class="col">
 												<div class="row mt-2">
													<div class="col fw-semibold fs-5" id="currentStatus" 
													></div>
												</div>
	 										</div>
	 									</div>
	 									
	 									
	 									
	 									<%-- 행 --%>
	 									<!-- <div class="row mt-1">
	 										<div class="col fw-bold">
	 											
	 											<div class="row">
													<div class="col" id="countDownTable">
														
													</div>
												
												</div>
	 										</div>
	 									</div> -->
	 									<%-- 행 --%>
	 									
	 									
	 									
	 									<div class="row mt-3">
	 										<div class="col px-1">
	 											
	 											<div class="row">
	 												<div class="col ms-2 border border-radius rounded bg-light">
	 													
	 													<div class="row mt-2">
	 														<div class="col-auto ms-1">
	 															<c:choose>
		 															<c:when test="${!empty sessionUser }">
		 															   보유 코인 <span class="fw-bold fs-5 text-primary ms-1 me-1" id="auctionCoin"></span>원
		 															</c:when>
		 															<c:otherwise>
		 																<a href="/safari/user/loginPage" class="ms-1 me-1">로그인하여 나의 보유 코인을 확인하세요.</a>
		 															</c:otherwise>	
	 															</c:choose>
	 														</div>
	 														<div class="col px-0">
	 															 <span id="coinFail" class="text-danger fw-medium" style="position: relative; top: 3px;"
	 															 ></span>
	 															 
	 														</div>
	 													</div>
	 													
	 													<div class="row mt-2" id="auctionBidBox">
	 														
	 														
	 													</div>
	 													
	 													<div class="row mt-3">
	 														<div class="col"></div>
	 													</div>
	 													
	 												</div>
	 											</div>
	 											
	 										</div>
	 									</div>
	 									
			
	 								</div>
	 							</div>
	 							<%-- 가격 --%>
	 							
	 								 <div class="row mt-4">
	 									<div class="col"></div>
	 								</div> 
	 								
	 						
	 								<div class="row mt-5" style="position: relative; top: 15px" >
 										<div class="col fw-bold fs-5">
 											실시간 채팅
 										</div>
 									</div>
 									
 									<div class="row mt-3">
 										<div class="col">
 											<div class="row">
	 											<div class="col ms-2 shadow-sm" id="chatMessageBox" style="height: 500px; overflow: auto">
	 											
	 											</div>
 											</div>
 											
 											<div class="row mt-2">
 												<div class="col-10 pe-2 ps-2">
 													<input type="text" class="form-control" id="chatContentBox" placeholder="실시간 채팅에 참여해보세요!"
													onkeydown="checkSendMessage(event)">
 												</div>
 												<div class="col px-0 d-grid">
 													<input type="button" class="btn btn-dark" value="입력"  onclick="sendMessage()">
 												</div>
 											</div>
 										</div>
 									</div>
 									
 		
	 							
	 							
	 							
	 						</div>
	 					</div>
	 				
	 				
	 				
	 				
	 				
	 				</div>
	 				<%-- 2열 --%>
	 			
	 			</div>
	 			
	 			
	 		</div>
	 	</div>
	 	
	 	
	 	
	 	
	 	</div>
	 	<%-- 공간 끝 --%>
	 	<div class="col"></div>
	 
	 
	 </div>
	
	
	<div class="row mt-5">
		<div class="col"></div>
	</div>
	
	
	
	
	

<%--  html 종료 --%>

<%-- auctionInfoModal --%>
<div class="modal modal-dialog modal-lg fade" id="auctionInfoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"
style="position: absolute; transform: translateX(70%);right: 50%;">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header bg-light">
        <h2 class="modal-title fs-5 fw-bold ms-3" id="exampleModalLabel">상품 정보</h2> 
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
      
		<div class="row">
			<%-- 상품 화면 시작 --%>
			<div class="col ms-4 mt-3 mb-3 ">	
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
								<span class="text-danger fw-bold" id="currentPrice_modal" style="font-size: 18px">
									
								</span> 원
								<span class="ms-1">
									즉시낙찰가
								</span>
								<span class="fw-semibold"  style="font-size: 18px">
					 				<fmt:formatNumber value="${productDetail.auctionDto.max_price}" pattern="#,###"/></span> 
					 				<span> 원</span>
					 			
					 			<span class="ms-1">
					 				(시작가  <fmt:formatNumber value="${productDetail.auctionDto.start_price}" pattern="#,###"/> <span> 원</span>)
								</span>
							</div>										
						</div>
						
						<div class="row mt-2">
							<div class="col">
								경매시작일 <span id="auctionStartDate_Modal"> </span>
				
							</div>
						</div>
						
						<div class="row">
							<div class="col">
								경매종료일 <span id="auctionEndDate_Modal"> </span> <%-- <fmt:formatDate value="${productDetail.auctionDto.end_date}"  pattern="yyyy-MM-dd HH:mm"  />--%>
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
			
				<div class="col nav-pills nav-fill">
					<ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item" role="presentation">
							<button class="ms-5 nav-link active text-dark fw-medium" id="auctioninfo-tab" data-bs-toggle="tab"
								data-bs-target="#auctioninfo" type="button" role="tab" aria-controls="auctioninfo"
								aria-selected="true">상품정보</button>
						</li>	
					   <!-- <li class="nav-item" role="presentation">
		                <button class="nav-link text-dark fw-bold" id="review-tab" data-bs-toggle="tab"
		                    data-bs-target="#review" type="button" role="tab"
		                    aria-controls="review" aria-selected="false">입금/배송정보</button>
	            		</li> -->
			            <li class="nav-item" role="presentation">
			                <button class="nav-link text-dark fw-medium" id="question-tab" data-bs-toggle="tab"
			                    data-bs-target="#question" type="button" role="tab"
			                    aria-controls="question" aria-selected="false">Q&A</button>
			            </li>
					</ul>	
			
				<%-- 내용 --%>
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="auctioninfo" role="tabpanel"
						aria-labelledby="auctioninfo-tab">
						
						<div class="row mt-2">
							<div class="col">
									
								<div class="row mt-2">
									<div class="col"></div>
									<div class="col-10 ms-4">
										${productDetail.auctionDto.description}
									</div>
									<div class="col"></div>
								</div>
								
								
								<div class="row mt-2 mb-3">
									<div class="col">
										<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel" style="overflow-y: auto; height: 500px">
										  <div class="carousel-inner text-center" >
										  	<c:forEach items="${productDetail.auctionImgDtoList}" var="auctionImgDto">
											    <div class="carousel-item active">
											      <img src="/auctionFiles/${auctionImgDto.auction_item_img_link}"  class="img-fluid" style="height: 600px;">
											    </div>
										   </c:forEach>
										  </div>
										  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
										    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
										    <span class="visually-hidden">Previous</span>
										  </button>
										  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
										    <span class="carousel-control-next-icon" aria-hidden="true"></span>
										    <span class="visually-hidden">Next</span>
										  </button>
										</div>
									</div>
								</div>
							
							</div>
						</div>
					</div>
				
		
					<div class="tab-pane fade" id="review" role="tabpanel"
						aria-labelledby="review-tab">
						
						<div class="row mt-2">
							<div class="col text-center">
								
							</div>
						</div>
						
					</div>
						
					
					<%-- 상품문의 --%>	
					<div class="tab-pane fade" id="question" role="tabpanel"
						aria-labelledby="question-tab">
						
						<div class="row mt-4">
							
							<div class="col-11 ms-4">
								<div class="row">
									<div class="col-auto text-start mt-2 ms-1" style="font-size: 16px;">
										<a href="/safari/user/myInquiryPostPage">※ 상품 문의사항이 아닌 반품관련 문의는 고객센터 1:1 문의를 이용해주시기 바랍니다.</a>
									</div>
									<div class="col text-end">
										<button class="btn orangeButton" onclick="toggleInquiryInputBox()">
											  상품문의
											  <i class="bi bi-pencil-square"></i>
											</button>
										
									</div>
								</div>
								
								<div id="inquiryInputBox" class="row mt-3" style="display: none;">
								    <div class="col">
								        <div class="d-flex">
								            <textarea id="inquiryTextarea" class="form-control flex-grow-1 ms-1" rows="3" placeholder="문의 내용을 입력하세요"
								            <%-- onkeydown="checkSendInquiry(event)"--%>></textarea>
								            <input type="button" class="btn btn-dark ms-2" value="등록"
								            onclick="registerAuctionInquiry()">
								        </div>
								    </div>
								</div>
								
							
								
								<div class="row mt-3">
									<div class="col fw-bold fs-5 ms-1">
									 문의 목록
									</div>
								</div>
								
								<div class="row mt-2 border-bottom"></div>
								
								<div class="row">
									<div class="col" id="inquiryList" style="height: 400px; overflow: auto">
									
										
									
										
									
									
									</div>
								</div>
								
								
							
							
							</div>
							<div class="col"></div>
						</div>
						
					</div> 
					<%-- 상품문의 --%>	
					
			
			
			</div>
			<%-- 탭 내용 끝 --%>
		
		</div>	
		
	
		<%-- 탭 바 끝 --%>

      </div>
   	<!-- <div class="modal-footer">
        <button type="button" class="btn btn-dark " data-bs-dismiss="modal">창닫기</button>
      </div>  	
    </div> -->
  </div>
</div>
</div>


<%-- 판매자 정보 Modal --%>
<div class="modal" id="sellerInfoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered"> 
    <div class="modal-content">
      <div class="modal-header bg-light">
      		
      		
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
      	
      	<div class="row mb-2">
    		<div class="col-11 ms-3">
    		
    			<div class="row">
    				<div class="col">닉네임</div>
    				<div class="col text-end">${sellerInfo.nickname}</div>
    			</div>
    			
 				<div class="row mt-1">
    				<div class="col">이메일</div>
    				<div class="col text-end">${sellerInfo.email}</div>
    			</div>
    			
 				<div class="row mt-1">
    				<div class="col">전화번호</div>
    				<div class="col text-end">${sellerInfo.phone}</div>
    				
    			</div>    			    			
    			
    	
    		
    		</div>
       </div>
  
      </div>
      
    
    </div>
  </div>
</div>
<%-- 판매자 정보 Modal --%>



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
    		<div class="col">현재가보다 낮거나 같은 가격으로 입찰하실 수 없습니다.</div>
       </div>
  
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창닫기</button>
      </div>      
   
    </div>
  </div>
</div>
<%-- alertModal --%>

<%-- bidNoticeModal --%>
<div class="modal" id="bidNoticeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered"> 
    <div class="modal-content">
      <div class="modal-header bg-light">
      		<h5 class="fw-bold ms-1">입찰금액 안내</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
      	
      	<div class="row mt-3">
    		<div class="col ms-2">
    			
    			<div class="row">
    				<div class="col">
    					최소 1,000원 단위로 입찰하실 수 있습니다
    				</div>
    			</div>
    			
    			<div class="row mt-1">
    				<div class="col">
    					ex)
    				</div>
    			</div>
    			
    			<div class="row">
    				<div class="col">
    					해당 경매의 현재가가 50,000원일 때 50,001원으로 
    				</div>
    			</div>
    			<div class="row">
    				<div class="col">
    					 금액을 입력하실 경우 입찰이 처리되지 않습니다. 
    				</div>
    			</div>
    			<div class="row mt-1">
    				<div class="col">
    					51,000원으로 입력하셔야 입찰이 처리됩니다.
    				</div>
    			</div>
    			
    			
    			  <div class="row ">
    				<div class="col">
    					50,999원으로 입력하셔도 50,000원으로 내림하여 입찰이 처리되지 않습니다.
    				</div>
    			</div>
    			
    			
    		</div>
       </div>
  
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창닫기</button>
      </div>      
   
    </div>
  </div>
</div>
<%-- bidNoticeModal --%>


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
    		<div class="col" id="immediateBidSuccessAlert"></div>
       </div>
  
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창닫기</button>
      </div>      
   
    </div>
  </div>
</div>
<%-- 낙찰Modal --%>



<%-- 경매종료 modal --%>
<div class="modal" id="auctionEndModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered"> 
    <div class="modal-content">
      <div class="modal-header bg-light">
      		<h5 class="fw-semibold"> 경매종료 안내</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
      	
      	<div class="row">
    		<div class="col">
    		
    			<div class="row">
    				<div class="col fw-semibold text-center" style="font-size:18px;">
    					경매가 종료되었습니다!
    				</div>
    			</div>
    		
    		
    		</div>
       </div>
  
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창닫기</button>
      </div>      
   
    </div>
  </div>
</div>
<%-- 경매종료 modal --%>


<%-- nan 입찰실패 --%>
<div class="modal" id="nanModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered"> 
    <div class="modal-content">
      <div class="modal-header">
      	
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
      	
      	<div class="row text-center">
    		<div class="col">입력한 값이 올바르지 않습니다. 숫자만 입력해주세요.</div>
       </div>
  
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창닫기</button>
      </div>      
   
    </div>
  </div>
</div>
<%-- nan 입찰실패 --%>




<%-- 동시 입찰때문에 입찰실패 --%>
<div class="modal" id="bidFailureSameBidPriceModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered"> 
    <div class="modal-content">
      <div class="modal-header">
      	
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
      	
      	<div class="row text-center">
    		<div class="col">동시에 입찰한 금액이 있어 입찰하실 수 없습니다.</div>
       </div>
  
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창닫기</button>
      </div>      
   
    </div>
  </div>
</div>
<%-- 동시 입찰 실패Modal --%>


<%-- 코인 보유 금액 < 입찰금액 --%>
<div class="modal" id="bidFailureLowerCoinModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered"> 
    <div class="modal-content">
      <div class="modal-header">
      	
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
      	
      	<div class="row text-center">
    		<div class="col">코인이 부족하여 입찰하실 수 없습니다.</div>
       </div>
  
      </div>
      
      <div class="modal-footer">
      	<input type="button" class="btn orangeButton" value="충전하기" onclick="location.href='/safari/user/myCoinPage'">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창닫기</button>
      </div>      
   
    </div>
  </div>
</div>
<%-- 코인 보유 금액 < 입찰금액 --%>




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



<%-- 내용 입력 알림 --%>
<div class="modal" id="inquiryFailModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered"> 
    <div class="modal-content">
      <div class="modal-header">
      	
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
      	
      	<div class="row text-center">
    		<div class="col">내용을 입력하세요.</div>
       </div>
  
      </div>
      
      <div class="modal-footer">
      	
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창닫기</button>
      </div>      
   
    </div>
  </div>
</div>
<%-- 내용 입력 알림 --%>



<%-- 문의 삭제 alert --%>
<div class="modal" id="removeAuctionInquiryModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered"> 
    <div class="modal-content">
      <div class="modal-header">
      		<h5 class="modal-title"></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
      	
      	<div class="row text-center">
    		<div class="col"> 
    			해당 문의를 삭제하시겠습니까?
    		</div>
       </div>
  
      </div>
      
      <div class="modal-footer">
      	<input type="button" class="btn orangeButton" value="확인" onclick="removeAuctionInquiry()">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>      
   
    </div>
  </div>
</div>
<%-- 문의 삭제 alert --%>



<%-- 문의 삭제 실패 alert --%>
<div class="modal" id="removeAuctionFailInquiryModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered"> 
    <div class="modal-content">
      <div class="modal-header">
      		<h5 class="modal-title"></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
      	
      	<div class="row text-center">
    		<div class="col"> 
    			답변이 작성된 문의는 삭제하실 수 없습니다.
    		</div>
       </div>
  
      </div>
      
      <div class="modal-footer">
      	
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창닫기</button>
      </div>      
   
    </div>
  </div>
</div>
<%-- 문의 삭제 실패 alert --%>


<%-- 답변 삭제 alert --%>
<div class="modal" id="removeAuctionReplyModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered"> 
    <div class="modal-content">
      <div class="modal-header">
      		<h5 class="modal-title"></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
      	
      	<div class="row text-center">
    		<div class="col"> 
    			해당 답변을 삭제하시겠습니까?
    		</div>
       </div>
  
      </div>
      
      <div class="modal-footer">
      	<input type="button" class="btn orangeButton" value="확인" onclick="removeAuctionReply()">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>      
   
    </div>
  </div>
</div>
<%-- 답변 삭제 alert --%>



<%-- 채팅 빈 칸 입력 alert --%>
<div class="modal" id="blankChatModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered"> 
    <div class="modal-content">
      <div class="modal-header">
      		<h5 class="modal-title"></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
      	
      	<div class="row text-center">
    		<div class="col"> 
    			내용을 입력해주세요.
    		</div>
       </div>
  
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창닫기</button>
      </div>      
   
    </div>
  </div>
</div>
<%-- 채팅 빈 칸 입력 alert --%>
	
<%-- 내 입찰정보 Modal --%>
<div class="modal" id="myBidListModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered"> 
    <div class="modal-content">
      <div class="modal-header bg-light">
      		<div class="row">
      			<div class="col ms-2 fw-semibold" style="font-size: 18px">
      				내 입찰목록
      			</div>
      		</div>
      		
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body mb-3">
      
      	<div class="row mt-2 mb-3 ms-1">
      		<div class="col">
      		
      			<div class="row">
      				<div class="col">
      					• &nbsp; 입찰하신 경매 목록 중에서 현재 진행중인 경매만 표시됩니다.
      				</div>
      			</div>
      			
      			<div class="row mt-1">
      				<div class="col">
      					• &nbsp; 본인이 최고입찰자일 경우 최고입찰가는 <span class="text-success">초록색</span>으로 표시됩니다.
      				</div>
      			</div>
      			
      			<div class="row mt-1">
      				<div class="col">
      					• &nbsp; 본인이 최고입찰자가 아닐 경우 최고입찰가는 <span class="text-danger">빨간색</span>으로 표시됩니다.
      				</div>
      			</div>
      			
      			 <div class="row mt-1">
      				<div class="col">
      					• &nbsp; 경매 당 최고입찰가(현재가)는 <span class="fw-semibold">실시간으로 업데이트</span>되고 있습니다.
      				</div>
      			</div>
      			
      		</div>
      	</div>
      	
      	<div class="row mt-2 mb-2">
    		<div class="col justify-content-center">
    		
    			
    				<table class="table my-0" style="width: 743px;">
    					<colgroup>
    						<col width = "15%">
    						<col width = "55%">
    						<col width = "15%">
    						<col width = "15%">
    	
    					</colgroup>
						<thead>
							<tr class="text-center fw-medium">
								<td class="custom-table-secondary">번호</td>
								<td class="custom-table-secondary" >상품정보</td>
								<td class="custom-table-secondary">내 입찰가</td>
								<td class="custom-table-secondary">최고입찰가</td>
							</tr>
						</thead>
					</table>
					<div class="bidTable" >
					<table class="table" style = "table-layout: auto; width: 743px; table-layout: fixed;" >
						<colgroup>
    						<col width = "15%">
    						<col width = "55%">
    						<col width = "15%">
    						<col width = "15%">
    					</colgroup>
						<tbody id="myBidList" >
							
						</tbody>
					</table>
					</div>
    			
    			
    
    		</div>
       </div>
  
      </div>
      
      <!-- <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창닫기</button>
      </div>   -->    
   
    </div>
  </div>
</div>	
	
	
	
<script>


// 내 입찰정보 모달
function myBidListModal() {
	
    const xhr = new XMLHttpRequest();
  
    const myBidListBox = document.querySelector("#myBidList");
    myBidListBox.innerHTML = "";
    
    xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status == 200){
            const response = JSON.parse(xhr.responseText);
            
            
            if (response.myBidCount == 0) {
            	
            	const tr = document.createElement("tr");
            	
            	const td = document.createElement("td");
            	td.setAttribute("colspan", "4");
            	td.classList.add("text-center");
            	td.innerText = "진행중인 경매 중에서 입찰하신 정보가 없습니다.";
            	
            	tr.appendChild(td);
            	
            	myBidListBox.appendChild(tr);
            	
            } else {
            
            for (data of response.myBidList) {
   
            	const auctionIdRow = document.createElement("tr");
            	
            	const auctionId = document.createElement("td");
            	auctionId.classList.add("text-center");
            	auctionId.innerText = data.id;
            	
            	
            	const auctionTitle = document.createElement("td");
            	
            	
            	const auctionLink = document.createElement("a");
            	auctionLink.href = "/safari/auction/productDetail/" + data.id;
            	
            	const title = document.createElement("span");
            	title.innerText = data.title;
            	title.classList.add("overflow_span");
            	title.style.width = "390px";
            	
            	auctionLink.appendChild(title);
            	
            	auctionTitle.appendChild(auctionLink);
            		
            	const myBidPrice = document.createElement("td");
            	myBidPrice.classList.add("text-center");
            	
            	const myBidPriceSpan = document.createElement("span");
            	myBidPriceSpan.classList.add("fw-semibold");
            	myBidPriceSpan.style.fontSize = "18px";
            	myBidPriceSpan.id = "bidPrice_" + data.id;
            	
            	myBidPriceSpan.innerText = new Intl.NumberFormat('ko-KR').format(data.bid_price);
            	
            	
            	
            	const wonSpan = document.createElement("span");
            	wonSpan.classList.add("ms-1");
            	wonSpan.innerText = "원";

            	myBidPrice.appendChild(myBidPriceSpan);
            	myBidPrice.appendChild(wonSpan);
            	

            	const maxPrice = document.createElement("td");
            	maxPrice.classList.add("text-center");
            	
            	const maxPriceSpan = document.createElement("span");
            	maxPriceSpan.classList.add("fw-semibold");
            	maxPriceSpan.style.fontSize = "18px";
            	maxPriceSpan.id = "maxPrice_" + data.id;
            	
             
            

            	const wonSpan1 = document.createElement("span");
            	wonSpan1.classList.add("ms-1");
            	wonSpan1.innerText = "원";
            	
            	maxPrice.appendChild(maxPriceSpan);
            	maxPrice.appendChild(wonSpan1);
            	
            	auctionIdRow.appendChild(auctionId);
            	auctionIdRow.appendChild(auctionTitle);
            	auctionIdRow.appendChild(myBidPrice);
            	auctionIdRow.appendChild(maxPrice);
            	
            	myBidListBox.appendChild(auctionIdRow);
            
                getBidPriceMyBidList(data.id);
                
            	
            }
            	
            }
            const myBidListModal = bootstrap.Modal.getOrCreateInstance("#myBidListModal");
        	myBidListModal.show();
            
        }
    }

    xhr.open("get", "/safari/auction/getMyBidListIng");
    xhr.send();	
   
}

// 경매 입찰가 계속 업데이트
function getBidPriceMyBidList(id) {
	
	const xhr = new XMLHttpRequest();
	
	 xhr.onreadystatechange = function () {
	        if(xhr.readyState == 4 && xhr.status == 200){
	            const response = JSON.parse(xhr.responseText);
	            
	            for(data of response.myBidPrice) {
	            
	 
		            const bidPriceBox = document.getElementById("bidPrice_" + data.id);
		            
		            
		            bidPriceBox.innerText = new Intl.NumberFormat('ko-KR').format(data.bid_price);
		            
		            getCurrentPriceMyBidList(data.id, data.bid_price);
		            
	            }
	            
	        }
	 }
	 xhr.open("get", "/safari/auction/getMyBidPrice");
	 xhr.send();
	 setTimeout(function() {
		 getBidPriceMyBidList(id);
	       }, 100); // 10초 간격으로 함수 호출 (1000ms = 1초) */
}


//경매 현재가 계속 업데이트
function getCurrentPriceMyBidList(id, bidPrice) {
	
	const xhr = new XMLHttpRequest();
	
	
	 xhr.onreadystatechange = function () {
	        if(xhr.readyState == 4 && xhr.status == 200){
	            const response = JSON.parse(xhr.responseText);
	            const currentPrice = response.currentPrice;

	            const bidPriceBox = document.getElementById("bidPrice_" + id);
	         
	            const currentPriceBox = document.getElementById("maxPrice_" + id);
	           
	            // bidprice도 주기적으로 호출하는 함수를 만들어야할듯 합니다!!!
	            
	         
	            //console.log(bidPrice);
	            //console.log(currentPrice);
	            if (bidPrice == currentPrice) {
	            	currentPriceBox.style.color = "green";  
	            }
	            
	            else if (bidPrice < currentPrice) { 
	                currentPriceBox.style.color = "red";
	            }
	          
	            currentPriceBox.innerText = new Intl.NumberFormat('ko-KR').format(currentPrice);
	           
	            
	    		  	   
	           
	        }
	  } 
	 
	  xhr.open("get", "/safari/auction/getCurrentPrice?auctionItemId=" + id);
	  xhr.send();	
	
	
}





let sessionId = null; // 접속한 유저의 pk
let sellerId =  null; // 경매 판매자의 pk


//경로에서 변수 부분 추출
const path = window.location.pathname;
const parts = path.split('/');
//경매 물품 pk
const auctionItemId = parts[parts.length - 1]; 


// 경매 시작일
let startDateString = "${productDetail.auctionDto.start_date}";
let formattedStartDateString  = startDateString.replace('KST', '+09:00');
let startDateObject = new Date(formattedStartDateString);

let startDate = startDateObject.getTime();

//경매 종료일
let endDateString = "${productDetail.auctionDto.end_date}";
let formattedEndDateString  = endDateString.replace('KST', '+09:00');
let endDateObject = new Date(formattedEndDateString);

let endDate = endDateObject.getTime();

console.log(startDate); 
console.log(endDate);


// 회원의 코인 보유 금액
let userCoinBalance = null;


// 현재 최고 입찰자는 누구인지?
let nowMaxBider = null;	

//최고 입찰자 정보를 저장할 전역 변수
let highestBidder = null;

// 판매자 여부
let isSeller = null;

// 답변 pk
let replyPk = null;

// 문의 pk
let inquiryPk = null;


// 채팅 전송 시 enter 키 이벤트 처리
function checkSendMessage(event) {
  if (event.key == "Enter") {
    sendMessage();
  }
}

//문의 입력 시 enter 키 이벤트 처리
function checkSendInquiry(event) {
  if (event.key == "Enter") {
	  registerAuctionInquiry();
  }
}  

//답변 입력 시 Enter 키 이벤트 처리
function checkSendReply(event, inquiryId) {
    if (event.key == "Enter") {
        registerAuctionReply(inquiryId);
    }
}

//접속한 유저의 pk 받아오기 (완료)
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

// 경매 물품 판매자의 pk 받아오기 (완료)
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

// 판매자 정보 모달
function sellerInfoModal() {
	
	const sellerInfoModal = bootstrap.Modal.getOrCreateInstance("#sellerInfoModal");
	sellerInfoModal.show();
}



// 현 시간 각 경매의 최고 입찰자가 누구인지 회원pk로 출력하기 (실시간으로 계속)
function getNowMaxBiderId() {
	
   const xhr = new XMLHttpRequest();

    xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status == 200){
            const response = JSON.parse(xhr.responseText);
            nowMaxBider = response.nowMaxBider;
            if (response.result != "fail") {
            	highestBidder = response.nowMaxBiderDto.nickname;
            }
            
        }
    }	
    xhr.open("get", "/safari/auction/checkNowMaxBiderByAuctionItemId/" +auctionItemId);
    xhr.send();
}


// 경매 종료 시간 실시간으로 받아오기
function getAuctionEndTimeInRealTime() {
	
	const xhr = new XMLHttpRequest();

   	xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
        	const response = JSON.parse(xhr.responseText);
        	
        	const endDateBox = document.getElementById("auctionEndDate");
        	const endDateModalBox = document.getElementById("auctionEndDate_Modal");
        	
        	endDateBox.innerHTML = "";
        	endDateModalBox.innerHTML = "";
        	
 	        // 경매 종료일 선언
            endDate = new Date(response.auctionEndTime.end_date); 

            const formattedEndDate = formatTime(endDate);
            
            endDateBox.innerText = formattedEndDate;
            endDateModalBox.innerText = formattedEndDate;
            
           
        }
   	};
    xhr.open("get", "/safari/auction/getAuctionEndTimeInRealTime/" +auctionItemId);
    xhr.send(); 	
}

// 경매 물품 정보 보여주기 
function showAuctionInfo() {
 
	const xhr = new XMLHttpRequest();
	
	const nowDate = new Date();
    

   	xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
 
            const response = JSON.parse(xhr.responseText);
            
        	const nowDate = new Date();
            const item = response.auctionItem; //  rest controller에서 받아온 것
            
    
            if (endDate <= nowDate) {
	            const priceTitle = document.querySelector("#priceTitle"); 
	            priceTitle.innerHTML = "";
	       		 priceTitle.innerText = "낙찰가";  
	       		 
	    		const timeAttackBox = document.getElementById("timeAttack");
	    		timeAttackBox.innerHTML = "";
	    		  
	    		const remainTitleRow = document.createElement("div"); 
	    		remainTitleRow.classList.add("row");
	    		 
	    		const remainTitleCol = document.createElement("div"); 
	    		remainTitleCol.classList.add("col");
	    		
	    		remainTitleRow.appendChild(remainTitleCol);
	    		
	    		const remainTimeRow = document.createElement("div"); 
	    		remainTimeRow.classList.add("row");
	    		    
	    	    const timeSpan = document.createElement("div");
	    	    timeSpan.classList.add("col", "rounded-1", "py-1", "text-white", "fs-5", "fw-bold", "text-center");
	    	    timeSpan.style.backgroundColor = "#FF7777";

	    	
	    	 	timeSpan.innerHTML = "";
	    	 	timeSpan.innerText = "경매가 종료되었습니다";

   	 	        remainTimeRow.appendChild(timeSpan);

   	 	        //timeAttackBox.appendChild(remainTitleRow);
   	 	        timeAttackBox.appendChild(remainTimeRow);
	 
            }
            
            // 경매시작일 선언
            //startDate = new Date(item.auctionDto.start_date); 
  
            const formattedStartDate = formatTime(startDate);
            
            // 경매시작일 row 시작//
         	const startDateRow = document.getElementById("auctionStartDate");
            startDateRow.innerText = formattedStartDate;
            // 경매시작일 row 끝 //
            
            const startDateModal = document.getElementById("auctionStartDate_Modal");
            startDateModal.innerText = formattedStartDate;
            
            // 시작가 row  //
           /*  const startPriceRow = document.getElementById("auctionStartPrice");
            startPriceRow.innerText = new Intl.NumberFormat('ko-KR').format(item.auctionDto.start_price) + "원"; */
            
            
            const bidPriceRows = document.querySelectorAll("#auctionImmediatePrice, #immediateBidPrice");

            bidPriceRows.forEach(row => {
              row.innerText = new Intl.NumberFormat('ko-KR').format(item.auctionDto.max_price);
            });
            
        	const editCol = document.getElementById("editBar");
        	editCol.innerHTML = "";
     
	       /*  if (sessionId != item.auctionDto.user_seller_id) { */
	              const heartBox = document.createElement("i");
	              heartBox.id = "heartBox";
	              heartBox.classList.add("fs-5", "text-like", "bi");
	              //heartBox.style.position = "relative";
	              //heartBox.style.top = "5px";
	              refreshMyHeart();
	              refreshTotalLikeCount();
	        		//heartBox.classList.add("bi-heart-fill");//
	        	  heartBox.onclick = toggleLikeAuctionProduct;
	        	  heartBox.style = "cursor";
	        		
	        	  const heartCount = document.createElement("span");
	        	  heartCount.classList.add("ms-1");
	        	  heartCount.id = "totalLikeCount";
	        		
	              editCol.appendChild(heartBox);
	              editCol.appendChild(heartCount);
	       /*  } 
           */
           
           	const bidCountIcon = document.createElement("i");
            bidCountIcon.classList.add("bi", "bi-people", "fs-5", "ms-3");
            
            const bidCount = document.createElement("span");
            bidCount.classList.add("ms-1");
            
            const bidCountWord = document.createElement("span");
            bidCountWord.innerText = "명 참여";
            
            const questionMark = document.createElement("span");
            questionMark.classList.add("ms-2", "text-secondary", "opacity-50");
           
            const questionIcon = document.createElement("i");
            questionIcon.classList.add("bi", "bi-question-circle");
            questionIcon.style.cursor ="pointer";
            
            questionMark.appendChild(questionIcon);
           
            
            bidCount.id = "bidCount";
            
            
            editCol.appendChild(bidCountIcon);
            editCol.appendChild(bidCount);
            editCol.appendChild(bidCountWord);
            editCol.appendChild(questionMark);
            
            
            
           const sellerBar = document.querySelector("#sellerBar");
           sellerBar.innerHTML = "";
           
	          // 경매 판매자의 pk와 현재 접속한 유저의 pk가 일치할 경우 수정, 삭제 버튼 보이게 하기
	          if (sessionId == item.auctionDto.user_seller_id  /*&& nowDate < threeDaysBeforeStartDate*/) { 
	       	   
	        	 //const threeDaysBeforeStartDate = new Date(startDate);
	             //threeDaysBeforeStartDate.setDate(startDate.getDate() - 3);
	             
	             const modifyButton = document.createElement("i");
				 modifyButton.classList.add("bi", "bi-pencil-square", "fs-5", "text-secondary", "ms-4");
				 modifyButton.style.cursor = "pointer";
				 modifyButton.onclick = modifyProductPage;
		
	         	const deleteButton = document.createElement("i");
				deleteButton.classList.add("bi", "bi-trash3", "ms-1", "fs-5", "text-secondary");
				deleteButton.style.cursor = "pointer";
				deleteButton.onclick = function() {
	                 location.href = "/safari/auction/removeProductProcess/" + auctionItemId;
	               };   

	               sellerBar.appendChild(modifyButton);
	               sellerBar.appendChild(deleteButton);
       
          	}
            
           else if (nowDate >= startDate && nowDate <= endDate) {
       	   
          }
           
          // 판매자가 본인이 업로드한 경매 게시물에 접속 시 입찰 입력 폼 비활성화
          	if (sellerId == sessionId) {
            	forbidInputBidBox();
            } 
	             
        }
   	
   	}
    xhr.open("get", "/safari/auction/getAuctionItemInfo/" + auctionItemId);
    xhr.send();   		
}

// 클립 복사
function clip(){

	var url = '';
	var textarea = document.createElement("textarea");
	document.body.appendChild(textarea);
	url = window.document.location.href;
	textarea.value = url;
	textarea.select();
	document.execCommand("copy");
	document.body.removeChild(textarea);
	alert("링크가 복사되었습니다.")
}


// 입찰 수 실시간으로 갱신
function getBidCount() {
	
	const xhr = new XMLHttpRequest();

   	xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
 
            const response = JSON.parse(xhr.responseText);
            
            const auctionBidCount = document.querySelector("#bidCount");
            auctionBidCount.innerText = response.bidCount;
            
        }
        
   	}  
    xhr.open("get", "/safari/auction/getBidCount?auctionItemId=" + auctionItemId);
    xhr.send();   	
}


// 입찰하기 입력 폼 생성 (완료)
function showInputBidBox() {
	
	const nowDate = new Date();
	
    const auctionBidBox = document.getElementById("auctionBidBox");
    auctionBidBox.innerHTML = "";

	const inputBidBoxCol = document.createElement("div");
	inputBidBoxCol.classList.add("col-9", "d-grid");
	
	const inputBidBox = document.createElement("input");
	inputBidBox.type = "text";
	inputBidBox.classList.add("form-control");	
	// 입찰하기 입력 폼에 id 부여
	inputBidBox.id = "bidPrice";
    inputBidBox.addEventListener("keydown", function(event) {
        if (event.key && event.key == "Enter") {
            event.preventDefault(); // 엔터 키의 기본 동작 방지
            bidRequest();
        }
    });

	
	inputBidBoxCol.appendChild(inputBidBox);

    const bidEnterCol = document.createElement("div");
    bidEnterCol.classList.add("col", "d-grid");
    
    const button = document.createElement("input");
    button.classList.add("btn", "text-white", "fw-bold", "orangeButton");
	button.type = "button";
	if (endDate <= nowDate) {
		button.classList.add("opacity-50");
		button.value = "경매마감";
	} else {
		button.value = "입찰하기";
	}
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
	
	 const currentStatusBox = document.getElementById("currentStatus");
	 const inputBidBox = document.getElementById("bidPrice");
	 const button = document.getElementById("inputBidButton");
	 
 
   	  if(inputBidBox.placeholder != "판매자는 입찰하실 수 없습니다." ) {
   		  
   		 currentStatusBox.innerHTML = ""; 
   		 inputBidBox.innerHTML = "";
   		 button.innerHTML = "";
   		 
   		 //button.classList.add("disabled");   바꿔야함
   		 inputBidBox.placeholder = "판매자는 입찰하실 수 없습니다."
   		 inputBidBox.setAttribute("readonly", "readonly"); 
   		 
   	     const statusText = document.createElement("span");
         statusText.innerText = "판매자 화면입니다.";
         
         button.classList.add("opacity-50");
         
 
   		 currentStatusBox.appendChild(statusText);
   		 
   	  }

}

// 최고입찰자일 경우 입찰 버튼 막기
function forbidInputBidBoxByMaxBider() { 
	
	 //nowMaxBider = sessionId;
	 const currentStatusBox = document.getElementById("currentStatus");
	 const inputBidBox = document.getElementById("bidPrice");
	 const button = document.getElementById("inputBidButton");
	 
	 button.innerHTML = "";
	 button.classList.remove("opacity-100");
	 
  	  if(inputBidBox.placeholder != "회원님은 현재 최고입찰자입니다." ) {
    		 
  		 currentStatusBox.innerHTML = "";
  
  		 
   		 inputBidBox.innerHTML = "";
   		 
   		 const trophyIcon1 = document.createElement("i");
   		 trophyIcon1.classList.add("bi", "bi-trophy-fill","bolder", "me-2");
   		 trophyIcon1.style.fontSize = "19px";
   		 trophyIcon1.style.fontWeight = "bold";
   		 trophyIcon1.style.color = "#FFCC33";
   		 
         const statusText = document.createElement("span");
         //statusText.style.color = "#ff6f0f";
         statusText.classList.add("fw-semibold");
         statusText.innerText = "회원님은 현재 최고 입찰자입니다.";
         

   		 const trophyIcon2 = document.createElement("i");
   		 trophyIcon2.classList.add("bi", "bi-trophy-fill", "ms-3");
         
   		  currentStatusBox.appendChild(trophyIcon1);
   		  currentStatusBox.appendChild(statusText);
   		 // currentStatusBox.appendChild(trophyIcon2);
   		 
   		 button.classList.add("opacity-50");
   		 
   		 
   		 inputBidBox.placeholder = "회원님은 현재 최고입찰자입니다.";
   		 inputBidBox.setAttribute("readonly", "readonly");
   		 
   		 inputBidBox.style.pointerEvents = "none";
   		 // 마우스 클릭 방지
   		 button.style.pointerEvents = "none";

    	 }

}

// 경매 종료 시, 입찰 버튼 종료로 갱신
function renewInputBidBoxEnd() {

	 const currentStatusBox = document.getElementById("currentStatus");
	// 입찰하기 입력 폼 id 가져오기
	 const inputBidBox = document.getElementById("bidPrice");
	 // 입찰하기 버튼 id값 가져오기
	 const button = document.getElementById("inputBidButton");
	 
	 
   	 if (inputBidBox.placeholder != "경매가 종료되었습니다." ) {
   		   
   		   currentStatusBox.innerHTML = ""
		   inputBidBox.innerHTML = "";	   
		   button.innerHTML = "";
       
	       inputBidBox.placeholder = "경매가 종료되었습니다."
	       inputBidBox.setAttribute("readonly", "readonly");
	       inputBidBox.style.pointerEvents = "none";
	       
	       button.classList.remove("opacity-100");
	       button.classList.add("opacity-50");
	       button.style.pointerEvents = "none";
	       button.value = "경매마감";
	       
	       const trophyIcon1 = document.createElement("i");
	   		trophyIcon1.classList.add("bi", "bi-trophy-fill","bolder", "me-2");
	   		trophyIcon1.style.fontSize = "19px";
	   		trophyIcon1.style.fontWeight = "bold";
	   		trophyIcon1.style.color = "#FFCC33";
	       
	   		const statusText = document.createElement("span");
	   		
	       if (highestBidder !== null) {
	    	   	if (sessionId == nowMaxBider){
	    	   		currentStatusBox.appendChild(trophyIcon1);
	    	   		statusText.innerText = "축하합니다 ! 낙찰에 성공하셨습니다.";
	    	   		currentStatusBox.appendChild(statusText);
	    	   	} else if (sessionId != nowMaxBider) {
	    	   		
	    	   		statusText.innerText = highestBidder + "님께서 " +
		    	      "낙찰에 성공하셨습니다.";
	    	   		currentStatusBox.appendChild(statusText);
	    	    
	    	    } 
	       }
	    	 else {
	    	      statusText.innerText = "입찰 정보가 없습니다.";
	    	      currentStatusBox.appendChild(statusText);
	    	    }
   	}	
}

// 경매 진행중으로 변경 시, 입찰 버튼 진행중으로 갱신
function renewInputBidBoxIng() {

	 const currentStatusBox = document.getElementById("currentStatus");
	 const inputBidBox = document.getElementById("bidPrice");
	 const button = document.getElementById("inputBidButton");
	 button.classList.remove("opacity-50");
	 button.innerHTML = "";
	 
   	 if (inputBidBox.placeholder != "현재가보다 낮은 가격으로 입찰하실 수 없습니다.") {
  
   	   currentStatusBox.innerHTML = "";	 
	   inputBidBox.innerHTML = "";	   

       const statusText = document.createElement("span");
       //statusText.innerText = "경매에 참여하여 갖고 싶은 상품을 받아가세요";

           
	 
 	   currentStatusBox.appendChild(statusText);	   
	   
	   inputBidBox.placeholder = "현재가보다 낮은 가격으로 입찰하실 수 없습니다.";
	   inputBidBox.removeAttribute("readonly");
	   
	   button.classList.add("opacity-100");
	   
       inputBidBox.style.pointerEvents = "auto";
       button.style.pointerEvents = "auto";
	  
   	
   	}	
}

// 경매 준비중일 때, 입찰 버튼 준비중 
function renewInputBidBoxBefore() {

	 const currentStatusBox = document.getElementById("currentStatus");
	 const inputBidBox = document.getElementById("bidPrice");
	 const button = document.getElementById("inputBidButton");
	 
	 if (inputBidBox.placeholder != "경매 준비중입니다." /* || !button.classList.contains('disabled') */) {
      	
		currentStatusBox.innerHTML = ""; 
		 
		//button.classList.add("disabled");  

      	inputBidBox.placeholder = "경매 준비중입니다.";
   	    inputBidBox.setAttribute("readonly", "readonly");
   	    inputBidBox.style.pointerEvents = "none";
   	    
   	    
   	   const statusText = document.createElement("span");
       statusText.innerText = "경매 준비중입니다";

       button.classList.add("opacity-50");
       button.style.pointerEvents = "none";
 

      /*   @@@@@@ 나중에 넣기 */
 	   //currentStatusBox.appendChild(statusText);	
 	   
   	    
   	    
       	
	 }   
}


// 경매 종료일로부터의 카운트다운 함수
function countdownFromEndDate(endDate) {
	  // 현재 시간
	  var current = new Date();

	  // 차이 계산 (밀리초 단위)
//	  var difference = endDate.getTime() - current.getTime();
	  var difference = endDate - current.getTime();

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
	    days: days > 0 ? days : "",
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
  //var difference = startDate.getTime() - current.getTime();
  var difference = startDate - current.getTime();


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


//카운트다운 함수
//타임어택 숫자 (완료) 오로지 시간에 의해서만 (중요!!!!!)
function updateAuctionCountDown() {
	
	const nowDate = new Date();

    let countdownResult;
    

   // 경매 종료
   if(endDate <= nowDate) {
	  renewAuctionItemStatusEnd();
 	  renewInputBidBoxEnd(); // 입찰버튼 업데이트, 한번만 갱신 (o)
 	  renewAuctionButtonStatusEnd(); // 제품 정보 버튼 업데이트 (o)

    return;
   }
   else {
	   
	 const timeAttackBox = document.getElementById("timeAttack");
	 timeAttackBox.innerHTML = "";
	   
	 const priceTitle = document.querySelector("#priceTitle"); 
	 priceTitle.innerText = "현재가";

	 
	 const remainTitleRow = document.createElement("div"); 
	 remainTitleRow.classList.add("row");
	 
	 const remainTitleCol = document.createElement("div"); 
	 remainTitleCol.classList.add("col");
	
	 remainTitleRow.appendChild(remainTitleCol);
	
	 const remainTimeRow = document.createElement("div"); 
	 remainTimeRow.classList.add("row");
	    
     const timeSpan = document.createElement("div");
     timeSpan.classList.add("col", "rounded-1", "py-1", "text-white", "fs-5", "fw-bold", "text-center");
     timeSpan.style.backgroundColor = "#FF7777";
     
 	
     const timeIcon = document.createElement("i");
     timeIcon.classList.add("bi", "bi-clock", "me-2", "fw-bold", "fs-5");
     timeIcon.style.fontSize = "18px";
     //timeIcon.style.bottom = "3px";
     timeSpan.appendChild(timeIcon);
   
	 

   // 경매가 시작된 경우
   	 if (startDate <= nowDate){
   	  
   	  if (sellerId != sessionId) {
   	   	 if(sessionId == nowMaxBider && sessionId != null) { // 현재 최고 입찰자일 경우 입찰 비활성화
         		forbidInputBidBoxByMaxBider(); 
          } else {
   	  			renewInputBidBoxIng(); //(o)
         	}
   	  } else if (sellerId == sessionId) {
   		forbidInputBidBox();
   	  } else {
   		const currentStatusBox = document.getElementById("currentStatus");
        const statusText = document.createElement("span");
        statusText.innerText = "";
        
  		currentStatusBox.appendChild(statusText);

   	  }
   	  

   	  renewAuctionButtonStatusIng(); // (o)
   	  renewAuctionItemStatusIng();
   	  
 	  countdownResult = countdownFromEndDate(endDate);
 	  
 	  const detailSpan = document.createElement("span");
 	  detailSpan.innerText = "경매 종료까지 ";
 	 timeSpan.appendChild(detailSpan);
 	  
 	  // 경매 종료까지 남은 시간
   	} 
   // 경매가 시작되지 않은 경우
  	 else {
 	  	if (sellerId != sessionId) {
 	  	  renewInputBidBoxBefore();//(o)
 	  } else {
 		  forbidInputBidBox();
 	  }
 	  renewAuctionButtonStatusBefore();
 	  
 	  countdownResult = countdownFromStartDate(startDate);
 	  
 	 const detailSpan = document.createElement("span");
	 detailSpan.innerText = "경매 시작까지  ";
	 timeSpan.appendChild(detailSpan);
	  
   }
   
   	const currentPriceBox = document.querySelector("#currentPrice");
   
   
	 
   
    
     // 카운트다운
    if (countdownResult.days > 0) {
      
      const timeSpan1 = document.createElement("span");
      timeSpan1.innerText = countdownResult.days + "일 ";
      timeSpan.appendChild(timeSpan1);
    }
	  
    if (countdownResult.hours > 0) {
       
        const timeSpan2 = document.createElement("span");
        if (countdownResult.hours < 10)  {
      	  timeSpan2.innerText = "0" + countdownResult.hours + ":";
        } 
        else {
        	timeSpan2.innerText = countdownResult.hours + ":";
        }
     
        timeSpan.appendChild(timeSpan2);
      } else {
    	  
   		const timeSpan2 = document.createElement("span");
        timeSpan2.classList.add("fw-bold");
        timeSpan2.innerText = "00"+":";
        timeSpan.appendChild(timeSpan2);
      }
    
    if (countdownResult.minutes > 0) {
        
        const timeSpan3 = document.createElement("span");
        if (countdownResult.minutes < 10)  {
          	timeSpan3.innerText = "0" + countdownResult.minutes + ":";
          } else {
            timeSpan3.innerText = countdownResult.minutes + ":";
          }
        timeSpan.appendChild(timeSpan3);
      }
    
    else {
    	  
     	  const timeSpan3 = document.createElement("span");
          timeSpan3.classList.add("fw-bold");
          timeSpan3.innerText = "00"+":";
          timeSpan.appendChild(timeSpan3);
        }
   

   const timeSpan4 = document.createElement("span");
   if (countdownResult.seconds < 10)  {
     	timeSpan4.innerText = "0" + countdownResult.seconds;
     } else {
       timeSpan4.innerText = countdownResult.seconds;
     }
   timeSpan.appendChild(timeSpan4);
  
   remainTimeRow.appendChild(timeSpan);
    
    timeAttackBox.appendChild(remainTimeRow);
   }

}

// 경매 종료 정보 
function showEndInfo() {
	
	const endInfoBox = document.getElementById("endInfo");
	
	const row = document.createElement("div");
	row.classList.add("row");
	
	const col = document.createElement("div");
	col.classList.add("col");
	
	col.innerText = "경매마감안내";
	
	row.appendChild(col);
	endInfoBox.appendChild(row);
}

// 입찰 금액 정보 모달 띄우기
function bidNoticeModal() {
	const bidNoticeModal = bootstrap.Modal.getOrCreateInstance("#bidNoticeModal");
	bidNoticeModal.show();
}

//상품 정보 모달 띄우기
function auctionInfoPage() {
	
	const auctionInfoModal = bootstrap.Modal.getOrCreateInstance("#auctionInfoModal");
	auctionInfoModal.show();
}

var inquiryInputBox = document.getElementById('inquiryInputBox');
var isOpen = false;

function toggleInquiryInputBox() {
    isOpen = !isOpen;
    if (isOpen) {
        inquiryInputBox.style.display = 'block';
    } else {
        inquiryInputBox.style.display = 'none';
    }
}



// 경매 상품 문의 등록 
function registerAuctionInquiry() {

	const content = document.querySelector("#inquiryTextarea");
	
	const trimContent = content.value.trim(); // 앞뒤 공백 제거

	if (trimContent == "") {
		const inquiryFailModal = bootstrap.Modal.getOrCreateInstance("#inquiryFailModal");
		inquiryFailModal.show();

		setTimeout(function() {
			inquiryFailModal.hide();
		}, 1000);

		content.value = '';
		content.focus();
		return;
	}
	
	if(sessionId == null) {
		location.href = "/safari/user/loginPage";
		return;
	}

	const xhr = new XMLHttpRequest();
   	xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            const response = JSON.parse(xhr.responseText);
            content.value = "";
            reloadInquiryList();
            
            
        }
   	}
	xhr.open("post", "/safari/auction/registerAuctionInquiry");
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.send("&content=" + content.value + "&auction_item_id=" + auctionItemId);	
}


// 문의 삭제 물어보는 모달
function removeAuctionInquiryModal(inquiryId) {
	
	inquiryPk = inquiryId;
	
	const removeAuctionInquiryModal = bootstrap.Modal.getOrCreateInstance("#removeAuctionInquiryModal");
	
	removeAuctionInquiryModal.show();
}

// 문의 삭제 실패 모달
function removeAuctionFailInquiryModal(inquiryId) {
	
	const removeAuctionFailInquiryModal = bootstrap.Modal.getOrCreateInstance("#removeAuctionFailInquiryModal");
	
	removeAuctionFailInquiryModal.show();
	
	setTimeout(function() {
		removeAuctionFailInquiryModal.hide();
	}, 2000);
	
}


// 문의 삭제
function removeAuctionInquiry() {
	
	const id = inquiryPk;
	
	const xhr = new XMLHttpRequest();
   	xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            const response = JSON.parse(xhr.responseText);
            
            inquiryPk = null;
			 
			const removeAuctionInquiryModal = bootstrap.Modal.getOrCreateInstance("#removeAuctionInquiryModal");
			removeAuctionInquiryModal.hide();
			
            reloadInquiryList();
            
            
        }
   	}
	xhr.open("get", "/safari/auction/removeAuctionInquiry?id=" + id);
	xhr.send();	
}





function toggleReplyInputBox(inquiryId) {
    var replyInputBox = document.getElementById('replyInputBox_' + inquiryId);
    if (replyInputBox.style.display == 'none') {
        replyInputBox.style.display = 'block';
    } else {
        replyInputBox.style.display = 'none';
    }
}

// 답변 삭제 물어보는 모달
function removeAuctionReplyModal(replyId) {
	
	replyPk = replyId;
	
	const removeReplyModal = bootstrap.Modal.getOrCreateInstance("#removeAuctionReplyModal");
	
	removeReplyModal.show();
}

// 답변 삭제
function removeAuctionReply() {
	
	const id = replyPk;
	
	const xhr = new XMLHttpRequest();
   	xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            const response = JSON.parse(xhr.responseText);
            
            replyPk = null;
			 
			const removeReplyModal = bootstrap.Modal.getOrCreateInstance("#removeAuctionReplyModal");
			removeReplyModal.hide();
			
            reloadInquiryList();
            
            
        }
   	}
	xhr.open("get", "/safari/auction/removeAuctionReply?id=" + id);
	xhr.send();	
}


// 경매 상품 문의 답변
function registerAuctionReply(inquiryId) {
	

    const replyTextareaId = "replyTextarea_" + inquiryId; 
    const replyTextarea = document.getElementById(replyTextareaId); 
    const replyContent = replyTextarea.value; 
    
    

	if(sessionId == null) {
		location.href = "/safari/user/loginPage";
		return;
	}
		
	const xhr = new XMLHttpRequest();
   	xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            const response = JSON.parse(xhr.responseText);
            replyTextarea.value = ""; // 답변 등록 후에 textarea 초기화
            reloadInquiryList(); // 문의 목록을 다시 조회하여 업데이트
            
            
        }
   	}
   	xhr.open("post", "/safari/auction/registerAuctionReply");
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.send("&content=" + replyContent + "&auction_item_inquiry_id=" + inquiryId);
}


// 문의 목록 조회
function reloadInquiryList() {
	
	const inquiryList = document.querySelector("#inquiryList");
	
	const xhr = new XMLHttpRequest();
   	xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            const response = JSON.parse(xhr.responseText);
            
            // 스크롤
            const shouldAutoScroll = isScrolledToBottom(inquiryList);
            
            inquiryList.innerHTML = "";
            
            
            if(!response.qnaList || response.qnaList.length == 0) {
            	const borderRow = document.createElement("div");
            	borderRow.classList.add("row", "border-bottom", "py-2");
            	
            	
            	const borderCol = document.createElement("div");
            	borderCol.classList.add("col", "text-center");
            	
            	borderCol.innerText = "등록된 문의가 없습니다.";
            	borderRow.appendChild(borderCol);
            	
            	inquiryList.appendChild(borderRow);
            	
            }
            else {
            for(data of response.qnaList) {
            	
            	const borderRow = document.createElement("div");
            	borderRow.classList.add("row", "border-bottom", "py-2");
            	borderRow.id = "inquiryRow_" + data.inquiryId;
            	
            	const borderCol = document.createElement("div");
            	borderCol.classList.add("col");
            	
            	const row = document.createElement("div");
            	row.classList.add("row", "p-2");
            	
  
            	// 답변 완료 여부 상태 //
            	const statusCol = document.createElement("div");
            	statusCol.classList.add("col-2", "px-2");
            	
            	const buttonRow = document.createElement("div");
            	buttonRow.classList.add("row");
            	
               	const buttonCol = document.createElement("div");
            	buttonCol.classList.add("col");
            	
            	const button = document.createElement("input");
            	button.type = "button";
            	
            	button.id = "inquiryStatus_" + data.inquiryId;
            	
            	if(!data.replyId) {
            		button.classList.add("btn", "btn_delivered");
                	button.value = "답변대기중";
            	} else {
            		button.classList.add("btn", "btn_ordered");
                	button.value = "답변완료";
            	}
            	
            	buttonCol.appendChild(button);
            	buttonRow.appendChild(buttonCol);
            	
            	statusCol.appendChild(buttonRow);
            	// 답변 완료 여부 상태 //
            	
            	// 문의 내용 //
            	const contentCol = document.createElement("div");
            	contentCol.classList.add("col-6", "px-0");
            	
            	const cRow = document.createElement("div");
            	cRow.classList.add("row");
            	
            	const cCol = document.createElement("div");
            	cCol.classList.add("col");
            	
 

            	cCol.innerText = data.inquiry_content;
            	
            	if (sessionId == data.buyer_id) {
	            	const delButton = document.createElement("i");
	            	delButton.classList.add("bi", "bi-trash3", "ms-2")
	            	delButton.style.cursor = "pointer"; 
	            
	            	
	            	if (data.replyId) {
	            		delButton.setAttribute("onclick", "removeAuctionFailInquiryModal("+ data.inquiryId + ")");
	            	} else {
	            		delButton.setAttribute("onclick", "removeAuctionInquiryModal("+ data.inquiryId + ")");
	            	}
	            	cCol.appendChild(delButton);
            	}
            	
   
            	 // 답변 box //
                const replyInputBox = document.createElement("div");
                replyInputBox.classList.add("row", "mt-3");
                replyInputBox.style.display = "none";
                replyInputBox.id = "replyInputBox_" + data.inquiryId; 

                const replyCol = document.createElement("div");
                replyCol.classList.add("col");

                const dflex = document.createElement("div");
                dflex.classList.add("d-flex");

                const replyArea = document.createElement("textarea");
                replyArea.classList.add("form-control", "flex-grow-1", "ms-1");
                replyArea.id = "replyTextarea_" + data.inquiryId; 
                replyArea.rows = "3";
                replyArea.placeholder = "답변내용을 입력하세요";
                replyArea.onkeydown = function(event) {
                    checkSendReply(event, data.inquiryId);
                };

                const replyRegisterButton = document.createElement("input");
                replyRegisterButton.type = "button";
                replyRegisterButton.classList.add("btn", "btn-dark", "ms-2");
                replyRegisterButton.value = "등록";
                
                replyRegisterButton.setAttribute("onclick", "registerAuctionReply(" + data.inquiryId + ")");
           
         
       
	            const replyButton = document.createElement("i");
	            if (sessionId == sellerId && !data.replyId) {
	            	replyButton.classList.add("bi", "bi-pencil-square", "ms-2");
	            	replyButton.style.cursor = "pointer";
	            	replyButton.setAttribute("onclick", "toggleReplyInputBox("+data.inquiryId+")");
				  
				    cCol.appendChild(replyButton);
				}
			            	
            	cRow.appendChild(cCol);
            	
            	contentCol.appendChild(cRow);
            	// 문의 내용 //
            	
            	// 작성자 //
            	const userCol = document.createElement("div");
            	userCol.classList.add("col-2" ,"px-3");
            	
            	const uRow = document.createElement("div");
            	uRow.classList.add("row");
            	
            	const uCol = document.createElement("div");
            	uCol.classList.add("col", "overflow", "fw-medium");
            	uCol.style.width = "80px";
            	
            	
            	if (sessionId == data.buyer_id) {
            		uCol.style.color = "#ff6f0f";
            	}
            	
            	uCol.innerText = data.buyer_nickname;
            	
            	uRow.appendChild(uCol);
            	userCol.appendChild(uRow);
            	// 작성자 //
            	
            	// 작성일 //
            	const dateCol = document.createElement("div");
            	dateCol.classList.add("col-2");
            	
            	const dRow = document.createElement("div");
            	dRow.classList.add("row");
            	
            	const dCol = document.createElement("div");
            	dCol.classList.add("col");
            	
            	dCol.innerText = formatDateTimeForQna(data.inquiry_reg_date);
            	
            	dRow.appendChild(dCol);
            	dateCol.appendChild(dRow);
            	// 작성일 //
            	
              	row.appendChild(statusCol);
            	row.appendChild(contentCol);
            	row.appendChild(userCol);
            	row.appendChild(dateCol);
			
            	borderCol.appendChild(row);
            	borderRow.appendChild(borderCol);
            
            	inquiryList.appendChild(borderRow);
            	

            	dflex.appendChild(replyArea);
            	dflex.appendChild(replyRegisterButton);
            	
            	replyCol.appendChild(dflex);
            	replyInputBox.appendChild(replyCol);
            	
            	replyButton.setAttribute("onclick", "toggleReplyInputBox("+ data.inquiryId + ")")
            	borderRow.setAttribute("onclick", "toggleReplyRow("+ data.inquiryId + ")")

            	inquiryList.appendChild(replyInputBox);
            	
            	if (data.replyId) {
                   	const replyBorderRow = document.createElement("div");
                   	replyBorderRow.classList.add("row", "border-bottom", "py-2");
                   	replyBorderRow.id = "replyRow_" + data.inquiryId;
                   	replyBorderRow.style.display = "none";
                	
                	const replyBorderCol = document.createElement("div");
                	replyBorderCol.classList.add("col");
                	
                	const Rrow = document.createElement("div");
                	Rrow.classList.add("row");
                	

                	const RCol = document.createElement("div");
                	RCol.classList.add("col-2");
                	
                	const bRow = document.createElement("div");
                	bRow.classList.add("row");
                	
                   	const bCol = document.createElement("div");
                	bCol.classList.add("col", "text-center", "ms-4");
                	
                	
                	const rIcon = document.createElement("i");
                	rIcon.classList.add("bi", "bi-arrow-return-right");
                	
                	bCol.appendChild(rIcon);
                
                	bRow.appendChild(bCol);
                	
                	RCol.appendChild(bRow);
                	
                	
                	// 문의 내용 //
                	const rbcCol = document.createElement("div");
                	rbcCol.classList.add("col-7", "px-2");
                	
                	const rRow = document.createElement("div");
                	rRow.classList.add("row");
                	
                	const rCol = document.createElement("div");
                	rCol.classList.add("col");
                	
                	rCol.innerText = data.reply_content;
                	
                	if (sessionId == sellerId){
	                	const deleteButton = document.createElement("i");
	                	deleteButton.classList.add("bi", "bi-trash3", "ms-2")
	                	deleteButton.style.cursor = "pointer";
	                	
	                	deleteButton.setAttribute("onclick", "removeAuctionReplyModal("+ data.replyId + ")");
	                	
	                	rCol.appendChild(deleteButton);
                  	}
                	
                	
                	rRow.appendChild(rCol);
                	rbcCol.appendChild(rRow);
                	
                 	// 작성자 //
                	 const sellerCol = document.createElement("div");
                	sellerCol.classList.add("col-1");
                	
                	const sellerReplyRow = document.createElement("div");
                	sellerReplyRow.classList.add("row");
                	
                	const sellerReplyCol = document.createElement("div");
                	sellerReplyCol.classList.add("col", "overflow", "fw-semibold");
                	sellerReplyCol.style.width = "80px";
                	//sellerReplyCol.innerText = "판매자"
                	
                	sellerReplyRow.appendChild(sellerReplyCol);
                	sellerCol.appendChild(sellerReplyRow); 
                	// 작성자 //
                	
                	// 작성일 //
                	const sdateCol = document.createElement("div");
                	sdateCol.classList.add("col-2", "px-2");
                	
                	const sdRow = document.createElement("div");
                	sdRow.classList.add("row");
                	
                	const sdCol = document.createElement("div");
                	sdCol.classList.add("col");
                	sdCol.innerText =  formatDateTimeForQna(data.reply_reg_date);
                	
                	
                	sdRow.appendChild(sdCol);
                	sdateCol.appendChild(sdRow);
                	
	          	    Rrow.appendChild(RCol);
	          	    Rrow.appendChild(rbcCol);
	          	    Rrow.appendChild(sellerCol);
	          	    Rrow.appendChild(sdateCol);
                	
	          	    replyBorderCol.appendChild(Rrow);
	          	    replyBorderRow.appendChild(replyBorderCol);
	          	    
	          	    replyBorderRow.setAttribute("onclick", "toggleReplyRow("+data.inquiryId + ")")
	      
                    //replyBorderRow.style.display = "none"; // 답변이 달린 row를 숨김
	          	    
	          	    inquiryList.appendChild(replyBorderRow);
            	}

            }
        }
            
            if (shouldAutoScroll) {
            	inquiryList.scrollTop = inquiryList.scrollHeight;
         }
            
            
        }
   	}
   	xhr.open("get", "/safari/auction/getAuctionQnAList?auctionItemId=" + auctionItemId);
	xhr.send();
}


//답변이 달린 row toggle 함수
function toggleReplyRow(inquiryId) {
    const replyRowId = "replyRow_" + inquiryId;
    const replyRow = document.getElementById(replyRowId);

    if (replyRow) {
        if (replyRow.style.display == "none" || replyRow.style.display == "") {
            replyRow.style.display = "block";
        } else {
            replyRow.style.display = "none";
        }
    }
}




// 경매 종료 시, 제품 정보에서 경매 상태를 종료로 표시
function renewAuctionButtonStatusEnd() {
	
	const auctionStatusBox = document.getElementById("auctionStatus");
	const statusButton = document.createElement("button");
	
	
	if (auctionStatusBox.innerText != '경매 종료') {
		
		auctionStatusBox.innerHTML = "";
		statusButton.classList.add("btn", "btn_auctionEnd");
		statusButton.innerText = "경매 종료"
		auctionStatusBox.appendChild(statusButton);
	}
	
}

// 경매 진행중일 때, 제품 정보에서 경매 상태 버튼을 진행중으로 표시
function renewAuctionButtonStatusIng() {
	
	const auctionStatusBox = document.getElementById("auctionStatus");
	const statusButton = document.createElement("button");
	
	const liveIcon = document.createElement("i");
	const liveText = document.createElement("span");
	
	
	if (auctionStatusBox.innerText != '진행중') {
		
		auctionStatusBox.innerHTML = "";
		
		statusButton.classList.add("btn", "btn_auctionIng");
		statusButton.innerText = "진행중"
		
	    liveIcon.classList.add("bi", "bi-broadcast", "text-danger", "fs-5", "ms-2", "fw-bold");
		liveIcon.style.position = "relative";
		liveIcon.style.top = "2px";
		liveIcon.style.animation = "pulse 1s infinite"; 
		
		liveText.classList.add("text-danger", "ms-2", "fw-bold");
		liveText.innerText = "Live";
		

		auctionStatusBox.appendChild(statusButton);
		//auctionStatusBox.appendChild(liveIcon);
		//auctionStatusBox.appendChild(liveText);
	}
	
}

//제품 정보에서 경매 상태 준비중으로 표시
function renewAuctionButtonStatusBefore() {

	const auctionStatusBox = document.getElementById("auctionStatus");
	const statusButton = document.createElement("button");
	
	if (auctionStatusBox.innerText != '준비중') {
		
		auctionStatusBox.innerHTML = "";
		statusButton.classList.add("btn", "btn_auctionReady");
		statusButton.innerText = "준비중"
		auctionStatusBox.appendChild(statusButton);
	}
	
}


// 경매 준비중으로 덥데이트 추가해야함 !

// 경매 종료일 지났으면 경매 상태를 종료로 업데이트 (DB에 정보 업데이트)
function renewAuctionItemStatusEnd() {
	
	 const xhr = new XMLHttpRequest();

	 xhr.onreadystatechange = function() {
	    if (xhr.readyState === 4 && xhr.status === 200) {
	      const response = JSON.parse(xhr.responseText);
		  
	      
	      // 경매 상태 조회 시 종료가 아닐 경우에만 db에 상태 업데이트
	      if (response.auctionItemStatus.auction_status != '종료') {
	    	  
	    	  const xhrUpdateStatus = new XMLHttpRequest();
	    	  xhrUpdateStatus.onreadystatechange = function() {
	    	  if (xhrUpdateStatus.readyState === 4 && xhrUpdateStatus.status === 200) {
	    		  
	    		  
	            const priceTitle = document.querySelector("#priceTitle"); 
	            priceTitle.innerHTML = "";
	         	priceTitle.innerText = "낙찰가";  
	         		 
	
	    		  
	    		const timeAttackBox = document.getElementById("timeAttack");
	    		timeAttackBox.innerHTML = "";
	    		  
	    		const remainTitleRow = document.createElement("div"); 
	    		remainTitleRow.classList.add("row");
	    		 
	    		const remainTitleCol = document.createElement("div"); 
	    		remainTitleCol.classList.add("col");
	    		
	    		remainTitleRow.appendChild(remainTitleCol);
	    		
	    		const remainTimeRow = document.createElement("div"); 
	    		remainTimeRow.classList.add("row");
	    		    
	    	    const timeSpan = document.createElement("div");
	    	    timeSpan.classList.add("col", "rounded-1", "py-1", "text-white", "fs-5", "fw-bold", "text-center");
	    	    timeSpan.style.backgroundColor = "#FF7777";

	    	
	    	 	timeSpan.innerHTML = "";
	    	 	timeSpan.innerText = "경매가 종료되었습니다";

   	 	        remainTimeRow.appendChild(timeSpan);

   	 	        //timeAttackBox.appendChild(remainTitleRow);
   	 	        timeAttackBox.appendChild(remainTimeRow);

	    		const auctionEndModal = bootstrap.Modal.getOrCreateInstance("#auctionEndModal");
	    		auctionEndModal.show();
	    		 
	    		setTimeout(function() { // 1초 뒤 모달 창 삭제
	    			auctionEndModal.hide();
				}, 5000);
	    		

	    	  }
	        };
	        xhrUpdateStatus.open("get", "/safari/auction/renewAuctionItemStatusEnd/" + auctionItemId);
	        xhrUpdateStatus.send();
	        
	      }
	      

	      
		  }
	 }
	 
    xhr.open("get", "/safari/auction/getAuctionStatusByAuctionItemId/" + auctionItemId); // 수정하기
    xhr.send();  
}


//경매 시작되었으면 경매 상태를 진행중으로 업데이트 (DB에 정보 업데이트)
function renewAuctionItemStatusIng() {
	
	 const xhr = new XMLHttpRequest();
	 
	 xhr.onreadystatechange = function() {
		    if (xhr.readyState === 4 && xhr.status === 200) {
		      const response = JSON.parse(xhr.responseText);
		      
		      
		      // 경매 상태 조회 시 진행중이 아닐 경우에만 db에 상태 업데이트
		      if (response.auctionItemStatus.auction_status != '진행중') {
		    	  
		    	  const xhrUpdateStatus = new XMLHttpRequest();
		    	  xhrUpdateStatus.onreadystatechange = function() {
		    	  if (xhrUpdateStatus.readyState === 4 && xhrUpdateStatus.status === 200) {
		    		  
		    		  
		    	  
		    	  }
		        };
		        xhrUpdateStatus.open("get", "/safari/auction/renewAuctionItemStatusIng/" + auctionItemId);
		        xhrUpdateStatus.send();
		        
		      }
		      
	   
		    }
	 }
    xhr.open("get", "/safari/auction/getAuctionStatusByAuctionItemId/" + auctionItemId);
    xhr.send();  
}

// 카운트다운에 관한 경매 상황 제목, 남은 시간 공간 표기
function showAuctionStatusTitle() {
	
   const countDownTableBox = document.getElementById("countDownTable");
   
   // 남은 시간 카운트 공간
   const remainTimeRow = document.createElement("div");
   remainTimeRow.classList.add("row");
  
  
   const remainTimeCol = document.createElement("div");
   remainTimeCol.classList.add("col", "fw-bold");
   remainTimeCol.style.fontSize = "18px";
   
   
   // 타임어택 ID 부여
   remainTimeCol.id = "timeAttack";

   remainTimeRow.appendChild(remainTimeCol);   
   
   countDownTableBox.innerHTML = "";
    

   countDownTableBox.appendChild(remainTimeRow);
   

}



// 입찰하기 
function bidRequest() {

	let maxBidPrice = 0; // 가장 큰 초기 입찰가 초기값 설정
	
	const bidPriceBox = document.getElementById("bidPrice");
	const buttonBox = document.getElementById("inputBidButton");
	
	 // 1000원 단위로 입력한 가격으로 변환
    const bidAmount = Math.floor(bidPriceBox.value / 1000) * 1000;
    bidPriceBox.value = bidAmount;
    
    // 입력한 값이 숫자가 아닌 경우 입찰 막기
    if (isNaN(bidPriceBox.value)) {
        
        const nanModal = bootstrap.Modal.getOrCreateInstance("#nanModal");
        nanModal.show();
		
		setTimeout(function() { // 3초 뒤 모달 창 삭제
			nanModal.hide();
		}, 2000);
		
        bidPriceBox.value = '';
        bidPriceBox.focus();
        return;
    }
    
 // 현재 보유 코인보다 높은 금액으로 입찰하려는 경우 입찰 막기
	if (bidPriceBox.value > userCoinBalance) {
		
		const failModal = bootstrap.Modal.getOrCreateInstance("#bidFailureLowerCoinModal");
		failModal.show();
		
		setTimeout(function() { // 3초 뒤 모달 창 삭제
			failModal.hide();
		}, 3000);
		
		bidPriceBox.value = '';
		bidPriceBox.focus();
		return;
	}

  // 현재가보다 낮은 가격으로 입찰 시도하였을 때
	if (bidPriceBox.value <= currentPrice) {
		const alertModal = bootstrap.Modal.getOrCreateInstance("#alertModal");
		alertModal.show();

		setTimeout(function() {
			alertModal.hide();
		}, 1000);

		
		bidPriceBox.value = '';
		bidPriceBox.focus();
		return;
	}
	
	
	// 로그인하지 않은 상태로 입찰 시도할 경우
	if(sessionId == null) {
		location.href = "/safari/user/loginPage";
		return;
	}


	const xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200) {
			const response = JSON.parse(xhr.responseText);
			
			// 현재 시간
			const currentTime = new Date(Date.now());
			
			// 입찰 성공할 경우
			if (response.result == "success") {
				// 즉시 낙찰하였을 경우
				if (bidPriceBox.value >= response.auctionItemDto.max_price) {
				/* 	const immediateBidSuccessModal = bootstrap.Modal.getOrCreateInstance("#immediateBidSuccessModal");
					const immediateBidSuccessAlert = document.getElementById("immediateBidSuccessAlert");
					immediateBidSuccessAlert.innerHTML = "";
					immediateBidSuccessAlert.innerText = response.userDto.nickname + "님이 " + 
						new Intl.NumberFormat('ko-KR').format(bidPriceBox.value) + "원으로 즉시 낙찰에 성공하여 경매가 종료됩니다.";
					immediateBidSuccessModal.show(); */
					
					const currentStatusBox = document.getElementById("currentStatus");
					
					
					
					bidPriceBox.value = '';
					
					// 현재가 업데이트 (나중에 낙찰가로 변경)   
					getCurrentPrice();
					
										
					
					// 즉시 낙찰 로직 처리
					renewSuccessfulImmediateBid(auctionItemId); 
					
/* 					setTimeout(function() {
						immediateBidSuccessModal.hide();
					}, 4000); */
				}
				// 즉시 낙찰자는 아니지만 현 시간 최고 입찰자일 경우
				else if (bidPriceBox.value > maxBidPrice) {
					
						// 총 남은 시간이 60초 미만일 때 입찰하였을 경우 종료 시간을 60초 늘리기	
						if (endDate - currentTime < 60000) {
							const xhrUpdateEndTime = new XMLHttpRequest();
							xhrUpdateEndTime.onreadystatechange = function() {
								if (xhrUpdateEndTime.readyState === 4 && xhrUpdateEndTime.status === 200) {
									//getAuctionEndTimeInRealTime();
									const auctionInfoButtonBox = document.getElementById("auctionInfoButton");
									auctionInfoButtonBox.innerHTML = "";
									showAuctionInfo();
									updateAuctionCountDown();
									
									
								}
							};
							xhrUpdateEndTime.open("get", "/safari/auction/renewEndTimeAuctionItem/" + auctionItemId);
							xhrUpdateEndTime.send();
						}
						// 총 남은 시간이 60초 미만일 때 입찰하였을 경우 종료 시간을 60초 늘리기 끝
						
						const bidModal = bootstrap.Modal.getOrCreateInstance("#bidModal"); // 입찰 완료 모달 창 띄우기
						bidModal.show();
						
						setTimeout(function() { // 1초 뒤 모달 창 삭제
							bidModal.hide();
						}, 1000);
						
						nowMaxBider = sessionId; // 최고 입찰자 변경
						//forbidInputBidBoxByMaxBider(); // 최고 입찰자일 경우 입찰 버튼 비활성화

						bidPriceBox.value = '';

						getCurrentPrice(); // 현재가 업데이트
					 
				}
				}else {
					// 동시 입찰 실패
					const bidFailureSameBidPriceModal = bootstrap.Modal.getOrCreateInstance("#bidFailureSameBidPriceModal");
					bidFailureSameBidPriceModal.show();

					setTimeout(function() {
						bidFailureSameBidPriceModal.hide();
					}, 2000);

					bidPriceBox.value = '';
					bidPriceBox.focus();
					return;
				}
			}
		
	};
	xhr.open("post", "/safari/auction/bidRequest/" + auctionItemId);
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.send("&userId=" + sessionId + "&bid_price=" + bidPriceBox.value);
}

// 즉시 낙찰
function renewSuccessfulImmediateBid(auctionItemId) {
    const timeAttackBox = document.getElementById("timeAttack");
    timeAttackBox.innerHTML = "";
    

    const priceTitle = document.querySelector("#priceTitle");
    priceTitle.innerHTML = "";
    priceTitle.innerText = "낙찰가";

    const remainTitleRow = document.createElement("div");
    remainTitleRow.classList.add("row");

    const remainTitleCol = document.createElement("div");
    remainTitleCol.classList.add("col");

    remainTitleRow.appendChild(remainTitleCol);

    const remainTimeRow = document.createElement("div");
    remainTimeRow.classList.add("row");

    const timeSpan = document.createElement("div");
    timeSpan.classList.add("col", "rounded-1", "py-1", "text-white", "fs-5", "fw-bold", "text-center");
    timeSpan.style.backgroundColor = "#FF7777";

    timeSpan.innerText = "경매가 종료되었습니다";

    remainTimeRow.appendChild(timeSpan);

    //timeAttackBox.appendChild(remainTitleRow);
    timeAttackBox.appendChild(remainTimeRow);

    const auctionEndModal = bootstrap.Modal.getOrCreateInstance("#auctionEndModal");
    auctionEndModal.show();

    setTimeout(function() {
        // Hide the modal after 5 seconds
        auctionEndModal.hide();
    }, 5000); // 5 seconds (5000 milliseconds)

    
    
    
/* 
    const spinnerRow = document.createElement("div");
    spinnerRow.classList.add("row");

    const spinnerCol = document.createElement("div");
    spinnerCol.classList.add("col-auto");

    const spinner = document.createElement("div");
    spinner.classList.add("spinner-border");
    spinner.setAttribute("role", "status");

    const spinnerSpan = document.createElement("span");
    spinnerSpan.classList.add("visually-hidden");

    spinner.appendChild(spinnerSpan);
    spinnerCol.appendChild(spinner);
    spinnerRow.appendChild(spinnerCol);

    const messageCol = document.createElement("div");
    messageCol.classList.add("col");
    messageCol.style.fontSize = "18px";
    messageCol.innerText = "경매 종료 확인 중입니다.";

    spinnerRow.appendChild(messageCol);
    timeAttackBox.appendChild(spinnerRow);

    setTimeout(function() {
        // Hide the spinner after 2 seconds
        spinnerRow.style.display = "none";

        // Show the message "경매가 종료되었습니다" after hiding the spinner
        timeAttackBox.innerHTML = "";

        const priceTitle = document.querySelector("#priceTitle");
        priceTitle.innerHTML = "";
        priceTitle.innerText = "낙찰가";

        const remainTitleRow = document.createElement("div");
        remainTitleRow.classList.add("row", "mt-2");

        const remainTitleCol = document.createElement("div");
        remainTitleCol.classList.add("col");

        remainTitleRow.appendChild(remainTitleCol);

        const remainTimeRow = document.createElement("div");
        remainTimeRow.classList.add("row");

        const timeSpan = document.createElement("div");
        timeSpan.classList.add("col", "border", "border-1", "rounded-1", "p-2", "text-white", "fs-4", "fw-bold", "text-center");
        timeSpan.style.backgroundColor = "#FF7777";

        timeSpan.innerText = "경매가 종료되었습니다";

        remainTimeRow.appendChild(timeSpan);

        timeAttackBox.appendChild(remainTitleRow);
        timeAttackBox.appendChild(remainTimeRow);

        const auctionEndModal = bootstrap.Modal.getOrCreateInstance("#auctionEndModal");
        auctionEndModal.show();

        setTimeout(function() {
            // Hide the modal after 5 seconds
            auctionEndModal.hide();
        }, 5000); // 5 seconds (5000 milliseconds)

    }, 4000); // 2 seconds (2000 milliseconds)
 */
    const xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
            const response = JSON.parse(xhr.responseText);
            // Process your response here (if needed)
        }
    };
    xhr.open("get", "/safari/auction/renewImmediateSuccessfulBid?auctionItemId=" + auctionItemId);
    xhr.send();
}

//날짜 변환 함수	
function formatTime(timestamp) {
	  const date = new Date(timestamp);
	  const year = date.getFullYear();
	  const month = String(date.getMonth() + 1).padStart(2, '0');
	  const day = String(date.getDate()).padStart(2, '0');
	  let hours = date.getHours();
	  let period = '오전';

	  if (hours >= 12) {
	    hours -= 12;
	    period = '오후';
	  }

	  if (hours === 0) {
	    hours = 12;
	  }

	  const minutes = String(date.getMinutes()).padStart(2, '0');
	  const formattedDate = year + '-' + month + '-' + day + "\u00a0\u00a0" + period + ' ' + hours + ':' + minutes;
	  return formattedDate;
	}


// 날짜 변경    
function formatDateTime(dateTimeString) {
	
  const date = new Date(dateTimeString); // 내용이 업로드된 시간
  const now = new Date(); // 현재 시간
  
  const timeDiff = now.getTime() - date.getTime(); // 현재 시간과 댓글 작성일과의 차이 (밀리초 단위)
  const minutesDiff = Math.floor(timeDiff / (1000 * 60)); // 분 단위로 변환
  
  // 1시간 이내일 경우
  if (minutesDiff < 60) {
	   // 1분 미만일 경우
	    if (minutesDiff < 1) {
	      return '방금 전';
	    } 
	    // 1분 이상일 경우
	    else {
	      return minutesDiff + '분 전';
	    }
	  }
  //24시간 이내일 경우
  else if (minutesDiff < 1440) {
	    
	    const hoursDiff = Math.floor(minutesDiff / 60);
	    return hoursDiff + '시간 전';
	  }
  
  
  const year = date.getFullYear();
  const month = date.getMonth() + 1;
  const day = date.getDate();
  let hours = date.getHours();
  const minutes = date.getMinutes();
  let period = '오전';

  if (hours >= 12) {
    period = '오후';
    if (hours > 12) {
      hours -= 12;
    }
  } else if (hours === 0) {
    hours = 12;
  }

  const formattedDateTime = year + '.' + month + '.' + day + ' ' + period + ' ' + hours + ':' + minutes.toString().padStart(2, '0');

  return formattedDateTime;
}  


//날짜 변경    
function formatDateTimeForQna(dateTimeString) {
	
  const date = new Date(dateTimeString); // 내용이 업로드된 시간
  const now = new Date(); // 현재 시간
  
  const timeDiff = now.getTime() - date.getTime(); // 현재 시간과 댓글 작성일과의 차이 (밀리초 단위)
  const minutesDiff = Math.floor(timeDiff / (1000 * 60)); // 분 단위로 변환
  
  // 1시간 이내일 경우
  if (minutesDiff < 60) {
	   // 1분 미만일 경우
	    if (minutesDiff < 1) {
	      return '방금 전';
	    } 
	    // 1분 이상일 경우
	    else {
	      return minutesDiff + '분 전';
	    }
	  }
  //24시간 이내일 경우
  else if (minutesDiff < 1440) {
	    
	    const hoursDiff = Math.floor(minutesDiff / 60);
	    return hoursDiff + '시간 전';
	  }
  
  
  const year = date.getFullYear();
  const month = date.getMonth() + 1;
  const day = date.getDate();
  let hours = date.getHours();
  const minutes = date.getMinutes();
  let period = '오전';

  if (hours >= 12) {
    period = '오후';
    if (hours > 12) {
      hours -= 12;
    }
  } else if (hours === 0) {
    hours = 12;
  }

  const formattedDateTime = year + '.' + month + '.' + day;
  return formattedDateTime;
}  

/*입찰 기록 리스트 출력*/
function reloadBidList() {
    const xhr = new XMLHttpRequest();
    
    xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status == 200){
            const response = JSON.parse(xhr.responseText);

            const bidListBox = document.getElementById("bidListBox");
            const shouldAutoScroll = isScrolledToBottom(bidListBox); // 스크롤 여부 확인
            bidListBox.innerHTML = "";
            
           	if (response.bidCount == 0) {
     
            	const bidRow = document.createElement("div");
            	bidRow.classList.add("row", "border-bottom", 'py-2');
            	
            	
            	const bidCol = document.createElement("div");
            	bidCol.classList.add("col", "text-center");
            	bidCol.setAttribute("colspan", "3");
            	bidCol.innerText = "입찰 정보가 없습니다.";
            	
            	bidRow.appendChild(bidCol);
     
            	bidListBox.appendChild(bidRow);
   
            	
           	}
            
           	else {
            	for(data of response.bidList) {
            	
             	const bidpriceRow = document.createElement("div");
            	bidpriceRow.classList.add("row", 'border-bottom', "py-2");
            	//bidpriceRow.style.width = "530px";
            	
            	const nicknameCol = document.createElement("div");
            	nicknameCol.classList.add("col", "text-center");
            	
            	nicknameCol.innerText =  data.userDto.nickname;
            	
            	if (sessionId == data.userDto.id) {
            		nicknameCol.style.color = "#ff6f0f";
            	}
            	
            	const bidPrice = data.auctionBidDto.bid_price; 
            	const formattedbidPrice = new Intl.NumberFormat('ko-KR').format(bidPrice);
            	
            	const bidpriceCol = document.createElement("div");
            	bidpriceCol.classList.add("col", "text-center");
            	
            	bidpriceCol.innerText = formattedbidPrice + "원";
            	
            	const regdateCol = document.createElement("div");
            	regdateCol.classList.add("col", "text-center");
            	
            	regdateCol.innerText = formatDateTime(data.auctionBidDto.reg_date);
            	
            	bidpriceRow.appendChild(nicknameCol);
            	bidpriceRow.appendChild(bidpriceCol);
            	bidpriceRow.appendChild(regdateCol);
            	
            
            	bidListBox.appendChild(bidpriceRow);
            
              }
           	}
            
            if (shouldAutoScroll) {
                bidListBox.scrollTop = bidListBox.scrollHeight;
            }
     
        }
    }	
    
    xhr.open("get", "/safari/auction/getBidList?auctionItemId=" + auctionItemId);
    xhr.send();

}

// 한 경매의 입찰 순위 3위까지 출력
function getTop3BidList() {
	
	const xhr = new XMLHttpRequest();
	
	 xhr.onreadystatechange = function () {
	        if(xhr.readyState == 4 && xhr.status == 200){
	            const response = JSON.parse(xhr.responseText);
	            
	            updateBidRanking(response.top3BidList);
  	
	        }
	   } 
	  xhr.open("get", "/safari/auction/getTop3BidList?auctionItemId=" + auctionItemId);
	  xhr.send();	  	
}

// 랭킹 업데이트
function updateBidRanking(top3BidList) {
  const rankingElement = document.getElementById("bidRanking");

  // 기존 순위 삭제
  rankingElement.innerHTML = "";

  // 새로운 순위 생성
  for (let i = 0; i < top3BidList.length; i++) {
	  
    const bidData = top3BidList[i];
    
    const rankRowElement = document.createElement("div");
    rankRowElement.classList.add("row");
    
    const rankColElement = document.createElement("div");
    rankColElement.classList.add("col", "me-2");
    
    const rankImage = document.createElement("img");
    
    rankImage.style.Width = "50px";
    rankImage.style.height = "50px";
    const rankUserText = document.createElement("span");
    rankUserText.classList.add("fw-medium");
    const rankPriceText = document.createElement("span");
    

    // 순위에 따라 이미지 설정
    if (i == 0) {
      rankImage.src = "/safari/resources/img/auction/gold.png";
      rankPriceText.classList.add("fw-bold", "text-danger");
    } else if (i == 1) {
        rankImage.src = "/safari/resources/img/auction/silver.png";
       
    } else if (i == 2) {
        rankImage.src = "/safari/resources/img/auction/bronze.png";
  
    }

    
    rankUserText.innerText = bidData.userDto.nickname + "       ";
    rankPriceText.innerText = "(" + 
					new Intl.NumberFormat('ko-KR').format(bidData.auctionBidDto.bid_price)+ " 원)";
    
    

    rankColElement.appendChild(rankImage);
    rankColElement.appendChild(rankUserText);
    rankColElement.appendChild(rankPriceText);

    rankRowElement.appendChild(rankColElement);
    
    rankingElement.appendChild(rankRowElement);
  }
}


// 경매 현재가 계속 업데이트
function getCurrentPrice() {
	
	const xhr = new XMLHttpRequest();
	
	 xhr.onreadystatechange = function () {
	        if(xhr.readyState == 4 && xhr.status == 200){
	            const response = JSON.parse(xhr.responseText);
	            currentPrice = response.currentPrice;
	            
	         	 const coinFailBox = document.getElementById("coinFail");
	           	 coinFailBox.innerHTML = "";
	           	 
	           	/*  const chargeLink = document.createElement("a");
	           	 chargeLink.innerText = "충전하기";
	           	 chargeLink.classList.add("ms-2", "text-black");
	           	 chargeLink.href = '/safari/user/myCoinPage'; */
	           	 
	           	 
	           	 
	           	 
	        	 if (userCoinBalance < currentPrice && sessionId != sellerId && sessionId != null) {
	        	    coinFailBox.innerText = "* 코인이 부족합니다";
	        	    //coinFailBox.appendChild(chargeLink);
	        	  }
	        	 
	           
	            updateCurrentPrice(new Intl.NumberFormat('ko-KR').format(currentPrice));
	            
	            
	            
	        }
	  }    
	  
	  xhr.open("get", "/safari/auction/getCurrentPrice?auctionItemId=" + auctionItemId);
	  xhr.send();	  
}

// 현재가를 업데이트하여 jsp화면에 출력
function updateCurrentPrice(currentPrice) {
  const currentPriceElement = document.getElementById("currentPrice");
  const currentPriceModalElement = document.getElementById("currentPrice_modal");
  
  if (currentPriceElement) {
    	currentPriceElement.textContent = currentPrice.toString();
  }
  
  if (currentPriceModalElement) {
	    currentPriceModalElement.textContent = currentPrice.toString();
  }
  
  
}


function getCurrentPriceModal() {
	
	const currentPriceElement = document.getElementById("currentPrice_modal");
	getCurrentPrice();
	
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
    const chatContentValue = chatContentBox.value.trim();

    if (chatContentValue == "") {
    	// 채팅 아무것도 입력 안했을 때 모달 띄우기
    	const blankChatModal = bootstrap.Modal.getOrCreateInstance("#blankChatModal");
    	blankChatModal.show();
    	setTimeout(function() {
    		blankChatModal.hide();
		}, 2000);
    	chatContentBox.value = "";
    	return;
    }
    
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

// 채팅조회
function reloadChatList() {

	   const msgBox = document.getElementById("chatMessageBox");
	   const xhr = new XMLHttpRequest();
	   
	   xhr.onreadystatechange = function () {
	       if(xhr.readyState == 4 && xhr.status == 200){
	           const response = JSON.parse(xhr.responseText);

	           const shouldAutoScroll = isScrolledToBottom(msgBox); // 스크롤 여부 확인
	           msgBox.innerHTML = "";
	           let yearMonthDay = null;
	            
	           
				// 메세지 생성 반복 시작 
				response.chatList.forEach(function(msg){
					
					  const entireRegDate = new Date(msg.chatDto.reg_date);  
					  const year = entireRegDate.getFullYear();
					  const month = entireRegDate.getMonth() + 1;
					  const day = entireRegDate.getDate();
					  const formattedDateHappen = year + '년 ' + month + '월 ' + day + '일';
					  /* console.log(yearMonthDay);
					  console.log(formattedDateHappen);
					   */
					  if(yearMonthDay != formattedDateHappen){
						  const yearMonthDayRow = document.createElement('div');
						  yearMonthDayRow.classList.add('row', 'justify-content-center', 'mt-4', 'mb-4');
						  yearMonthDayRow.innerText = formattedDateHappen;
						  msgBox.appendChild(yearMonthDayRow);
						  yearMonthDay = formattedDateHappen;
					  }
					
					
					  const row1 = document.createElement('div');
					  row1.classList.add('row', 'mt-1', 'py-1');
					  
					  // 내가 보낸 메세지 
					  if(msg.userDto.id == sessionId){
						  const col1 = document.createElement('div');
						  col1.classList.add('col', 'd-flex', 'flex-column', 'justify-content-end');
				
						  const col1row1 = document.createElement('div');
						  col1row1.classList.add('row', 'justify-content-end', 'mx-1', 'chatTime');
						  const regDate = new Date(msg.chatDto.reg_date);
						  const formattedDate = regDate.toLocaleTimeString('ko-KR', { hour: 'numeric', minute: '2-digit' });
						  col1row1.innerText = formattedDate;
						  
						  const col2 = document.createElement('div');
						  col2.classList.add('col-7', 'me-3', 'myContent', 'text-start', 'text-break');
						  col2.innerText = msg.chatDto.content;
						  
						  row1.appendChild(col1);
						  row1.appendChild(col2);
						  col1.appendChild(col1row1);
						  
						  msgBox.appendChild(row1);
						  
					  }else {
						 
						  // 프사 
						  const colIcon = document.createElement('div');
						  colIcon.classList.add('col-auto', 'my-auto', 'ms-2', 'text-left');
						  const outerDiv2 = document.createElement('div');
						  outerDiv2.className = 'row my-auto';
						  const innerDiv2 = document.createElement('div');
						  innerDiv2.className = 'col text-start ps-1 pt-1';
						  const imageElement = document.createElement('img');
						  imageElement.className = 'img-fluid rounded-circle';
						  imageElement.style.filter = "grayscale(1)";
						  if(true) {
							  imageElement.src = '/safari/resources/img/user.jpg';
						  } else {
							  // imageElement.src = '/safariImg/'+response.user.profile_img_link;
						  }
						  imageElement.style.width = '46px';
						  imageElement.style.height = '46px';
						  innerDiv2.appendChild(imageElement);
						  outerDiv2.appendChild(innerDiv2);
						  colIcon.appendChild(outerDiv2);
						  
						  
						  // 메세지 
						  const colOuterDiv = document.createElement('div');
						  colOuterDiv.classList.add('col');
						  const rowInnerDiv1 = document.createElement('div');
						  rowInnerDiv1.classList.add('row');
						  const innerDiv1 = document.createElement('div');
						  
						  innerDiv1.className = 'col text-secondary text-start';
						  innerDiv1.style.fontSize = "14px";
						  if (msg.userDto.id == sellerId) {
							  innerDiv1.innerText = "판매자";
							  innerDiv1.className = 'fw-semibold';
						  } else {
						 	 innerDiv1.innerText = msg.userDto.nickname;
						  }
						  rowInnerDiv1.appendChild(innerDiv1);
						  
						  const rowInnerDiv2 = document.createElement('div');
						  rowInnerDiv2.classList.add('row');
						  const col3 = document.createElement('div');
						  col3.classList.add('col-7', 'ms-2', 'text-left', 'text-break', 'otherContent');
						  col3.innerText = msg.chatDto.content;
						  rowInnerDiv2.appendChild(col3);
							  
					
						  
						  const col4 = document.createElement('div');
						  col4.classList.add('col', 'd-flex', 'flex-column','text-start', 'justify-content-end');
				
						  const col4row2 = document.createElement('div');
						  col4row2.classList.add('row', 'justify-content-start', 'mx-1', 'chatTime', 'text-start');
						  const regDate = new Date(msg.chatDto.reg_date);
						  const formattedDate = regDate.toLocaleTimeString('ko-KR', { hour: 'numeric', minute: '2-digit' });
						  col4row2.innerText = formattedDate;
						  
						
						  col4.appendChild(col4row2);
						  rowInnerDiv2.appendChild(col4);
						  colOuterDiv.appendChild(rowInnerDiv1);
						  colOuterDiv.appendChild(rowInnerDiv2);
						  
						  
					
						  row1.appendChild(colIcon);
						  row1.appendChild(colOuterDiv);
						
						  
						  msgBox.appendChild(row1);
					  }
					  
					
				});
				// 메세지 생성 반복문 종료 

				if (shouldAutoScroll) {
               		msgBox.scrollTop = msgBox.scrollHeight;
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
	

//회원의 현재 보유 코인 조회
function getAuctionCoinBalance() {
	
		const xhr = new XMLHttpRequest();
		
		const coinBalance = document.getElementById("auctionCoin");
	
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				const response = JSON.parse(xhr.responseText);
				if(response.result == "success"){
					coinBalance.innerText = new Intl.NumberFormat('ko-KR').format(response.coins);
					userCoinBalance = response.coins;
					//console.log(userCoinBalance);
				}
			}
		}
		
		xhr.open("get", "/safari/user/getUserCoinBalance");
		xhr.send();		
	
}




window.addEventListener("DOMContentLoaded", function(){
    //사실상 시작 시점...
    setInterval(getAuctionEndTimeInRealTime, 20);
    
    const bidListBox = document.getElementById("bidListBox");
    bidListBox.scrollTop = 0;
 
    getSessionId();
    getAuctionCoinBalance();
    getSellerId();
    reloadInquiryList();
    
    setInterval(updateAuctionCountDown, 100); 
    
   
    setInterval(getNowMaxBiderId, 20);
    showInputBidBox();
    
   
    
    
    showAuctionStatusTitle();
    refreshTotalLikeCount();

    setInterval(reloadBidList, 100);
 
    refreshMyHeart();

    setInterval(getCurrentPrice, 100);
 
    setInterval(getBidCount, 100);
    
   

    showInputBidBox();  
    
    setInterval(reloadChatList,100);
    
    
    showAuctionInfo();
});


</script>
</body>
</html>