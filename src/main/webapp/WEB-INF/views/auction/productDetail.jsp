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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">


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
	
	
	<div class="row mt-4">
		<div class="col">
               
            <div class="row">
            	<div class="col"></div>
            	<div class="col-11">
            	<div class="row">
				<%-- 상품 정보 화면 시작 --%>
	                <div class="col ms-2">
	                	
	                	<%-- 카테고리 목록 --%>
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
	                	<%-- 카테고리 목록 --%>
	                	
	                	<%-- 상품 화면 시작 --%>
	                	<div class="row mt-2">
	                		<div class="col rounded-3 border border-1" style="border-color: #e1e6ed" id="auctionItemInfo">
								                		
	                		</div>
	                	</div>
	                	<%-- 상품 화면 끝 --%>
	                	
	                	<div class="row mt-2">
	                		<div class="col" id="auctionProductInfo">
	                		</div>
	                	</div>
	                	
	                	<%-- 경매 주의사항 화면 시작 --%>
	                	<div class="row mt-2">
	                		<div class="col"></div>
	                	</div>
	                	<%-- 경매 주의사항 화면 끝 --%>
	                	
	                	
						<div class="row mt-5">
							<div class="col fw-bold fs-4">
								입찰 실시간 정보
							</div>
						</div>		
						
						 <div class="row mt-3">
						 	<div class="col">
						 	
								<table class="table bidTable">
									<thead class="table-secondary">
										<tr class="text-center">
											<td class="fw-bold">닉네임</td>
											<td class="fw-bold text-end">입찰가</td>
											<td class="fw-bold">거래일</td>
										</tr>
									</thead >
									<tbody id="bidListBox">
										<%-- 입찰 기록 ajax 출력 --%>
									</tbody>
								</table>
								 
													 		
						 	</div>
						 	
						 </div>	                  	
	     
	                </div>
                <%-- 상품 정보 화면 끝 --%>
                
                <%-- 경매 메인 화면 시작 --%>
            
                <div class="col">
                	<div class="row">
                		<div class="col"></div>
                		<div class="col-10">
                		
                			<div class="row" style="height: 200px;">
                				<div class="col">
									<%-- 경매왕 화면 --%>
				                	<div class="row mt-2">
										<div class="col fw-bold fs-4">
											<img src="/safari/resources/img/auction/king.png">실시간 입찰 순위
										</div>  
									</div>  
									
									<div class="row mt-2">
										<div class="col" id="bidRanking">
										
										</div>
									</div>
								</div>
							</div>
	                			<%-- 경매왕 화면 --%>
                			
		           			<%-- 남은 시간 시작 --%>
		           			<div class="row mt-4 mb-5">
		           				<div class="col"></div>
		           			</div>
		           			
		                	<div class="row mt-2 mb-3">
		                		
		                		<div class="col" id="countDownTable">
		                			
		                		</div>
		                	</div>
		                	<%-- 남은 시간 끝 --%>    
		                	
           					<%-- 입찰 화면 시작 --%>
           					<div class="row">
           						<div class="col border border-1">
				 					<div class="row mb-3 fw-bold fs-4">
										<div class="col text-center border border-1 p-3" id="currentStatus">
											
										</div>
									</div>
									
									<div class="row mt-2 mb-3">
										<div class="col text-center">
											<span class=" fs-3">현재가 &nbsp;</span> 
											<span class="text-danger fw-bold fs-2" id="currentPrice"></span>
										</div>
									</div>
										
									<div class="row mt-2 mb-3" <%--id="bidBox" --%>>
										<div class="col">
											<div class="row" id="auctionBidBox">
												
											</div>																				
										</div>
									</div>
								</div>					                	            			
                			</div>
      
                		</div>
                		<div class="col"></div>
                	
                	</div>
                
            	</div>			
					
                	<%-- 입찰 화면 끝 --%>
               

                 <%-- 경매 메인 화면 끝 --%>
                 
                <%-- 채팅 화면, 입찰 리스트 시작 --%>
                <div class="col">
             	<div class="row">
                		<div class="col"></div>
                		<div class="col-10">                
					
					
					
					
					<div class="row mt-2">
						<div class="col fw-bold fs-4">
							<img src="/safari/resources/img/auction/chaticon.png">실시간 채팅
						</div>
					</div>		
					
			
					<div class="row mt-2">
						<div class="col">
							 <div class="row">
								<div class="col ms-2 mb-2 border border-1"   id="chatMessageBox" style="height: 400px; overflow: auto">	</div>	
							</div>								
						</div>
					</div>    
					
					<div class="row mt-2">
						<div class="col-10">
							<input type="text" 
							id="chatContentBox" class="form-control" placeholder="실시간 채팅에 참여해보세요!"
							onkeydown="checkSendMessage(event)">
						</div>
						<div class="col d-grid">
							<input type="button" class="btn btn-dark" value="입력" onclick="sendMessage()">
						</div>
					</div>
					
					<div class="row mt-4 fw-bold fs-4">
						<div class="col">
							<img src="/safari/resources/img/auction/noticeauction.png">공지사항
						</div>
					</div> 						  
					
					<div class="row mt-2">
						<div class="col border border-1">
									
							<div class="row mt-2 text-danger">
								<div class="col">
									• 경매 종료 시간 30초 이전에 입찰하실 경우 입찰한 시각으로부터 종료시간이 30초 추가됩니다.
								</div>
							</div>
							
							<div class="row mt-2">
								<div class="col">
									• 같은 경매에 다른 회원과 동시에 입찰하였을 경우, 입찰에 실패하실 수 있습니다.
								</div>
							</div>		
							
						<div class="row mt-2">
							<div class="col">
								• 낙찰하신 후, 7일 이내에 구매하지 않으실 경우 유찰 처리되오니 주의하세요.
							</div>
							</div>												
							
						</div>
					</div>          	
                
                </div>
              <div class="col"></div>
                </div>
                
                </div>
				<%-- 채팅 화면  입찰 리스트 끝 --%>
			</div>            
            </div>
            <div class="col"></div>
		</div>

        </div>
	</div>
	
	
	

<%--  html 종료 --%>

<%-- auctionInfoModal --%>
<div class="modal modal-dialog modal-lg fade" id="auctionInfoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"
style="position: absolute; transform: translateX(70%);right: 50%;">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h2 class="modal-title fs-5 fw-bold ms-3" id="exampleModalLabel">상품 정보</h2> 
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
      
		<div class="row">
			<%-- 상품 화면 시작 --%>
			<div class="col ms-2 mt-3 mb-3 me-2">	
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
								<span class="text-danger fw-bold" id="currentPrice_modal">
									
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
								경매시작일 <fmt:formatDate value="${productDetail.auctionDto.start_date}"  pattern="yyyy-MM-dd a hh:mm"  />
				
							</div>
						</div>
						
						<div class="row mt-2">
							<div class="col">
								<span class="fw-bold" id="auctionEndDate_Modal"> </span> <%-- <fmt:formatDate value="${productDetail.auctionDto.end_date}"  pattern="yyyy-MM-dd HH:mm"  />--%>
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
									      <img  width="300" height="800"
									      src="/auctionFiles/${auctionImgDto.auction_item_img_link}" class="d-block w-100 mt-2" alt="...">
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
   	<div class="modal-footer">
        <button type="button" class="btn btn-dark " data-bs-dismiss="modal">창닫기</button>
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

// 현재 최고 입찰자는 누구인지?
let nowMaxBider = null;	

//최고 입찰자 정보를 저장할 전역 변수
let highestBidder = null;

// 판매자 여부
let isSeller = null;

// 채팅 전송 시 enter 키 이벤트 처리
function checkSendMessage(event) {
  if (event.key === "Enter") {
    sendMessage();
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

            const formattedEndDate = endDate.toLocaleString('ko-KR', {
              year: 'numeric',
              month: '2-digit',
              day: '2-digit',
              hour: '2-digit',
              minute: '2-digit',
              //second: '2-digit',
              hour12: true
            });
            
            
            endDateBox.innerText = "경매종료일 " + formattedEndDate;
            endDateModalBox.innerText = "경매종료일 " + formattedEndDate;
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
            
            // 판매자가 본인이 업로드한 경매 게시물에 접속 시 입찰 입력 폼 비활성화
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
            col.classList.add("mb-4");
            
            const titleRow = document.createElement("div");
            titleRow.classList.add("row");
            titleRow.classList.add("mt-2");
            titleRow.classList.add("ms-1");
            
            const titleCol =  document.createElement("div");
            titleCol.classList.add("col");
            titleCol.classList.add("fs-4", "fw-bold");
            // 경매 물품명 텍스트
            titleCol.innerText = item.auctionDto.title;
            
            const statusSpanCol = document.createElement("span");
         	statusSpanCol.classList.add("ms-3"); 
         	             
            
            const button = document.createElement("button");
            button.classList.add("btn", "btn-sm", "fw-bold", "disabled");
            // 경매가 종료중, 진행중, 준비중인지 상태 여부를 나타내는 버튼의 id값 부여
            button.id = "statusButton";
            
            // statusSpanCol에 button을 담는다
            statusSpanCol.appendChild(button);
            
            titleCol.appendChild(statusSpanCol); 
            
            titleRow.appendChild(titleCol);
            auctionItemInfoBox.appendChild(titleRow);
            
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
            productImg.style.left = "10px";
            productImg.style.height = "150px";
            productImg.src = "/auctionFiles/" + item.auctionMainImgDto.auction_item_img_link;
            
            productImgCol.appendChild(productImg);
            // 상품 이미지 끝
            
            
            // 상품 제목 시작
            const productDetailCol = document.createElement("div");
            productDetailCol.classList.add("col-9");
            
  		    // 구매자의 입장일 경우 찜하기 아이콘 보이게 하기
            if (sessionId != item.auctionDto.user_seller_id) {
 	            const spanHeartCol = document.createElement("span");
 
 	            const heartBox = document.createElement("i");
 	            heartBox.id = "heartBox";
 	            heartBox.classList.add("fs-5", "text-danger", "bi", "ms-4", "text-end");
 	            refreshMyHeart();
 	      		//heartBox.classList.add("bi-heart-fill");//
 	      		heartBox.onclick = toggleLikeAuctionProduct;
             
 	            /*heartCol.appendChild(heartBox);*/
 	            spanHeartCol.appendChild(heartBox);
 	            
 	           titleCol.appendChild(spanHeartCol);
            }
            // 수정, 삭제 버튼 공간 끝
            
      
            
            
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
           		+ "원";
                                 
  
           priceRow.appendChild(priceCol);
           // 상품 가격 끝
           
           
           
           // 상품 가격 시작
           const startPriceRow = document.createElement("div");
           startPriceRow.classList.add("row");
           startPriceRow.classList.add("mt-2");

           const startPriceCol = document.createElement("div");
           startPriceCol.classList.add("col");
           startPriceCol.classList.add("fs-5");
  
           startPriceCol.innerText =
        	   "(시작가 " + new Intl.NumberFormat('ko-KR').format(item.auctionDto.start_price) + "원)";
                                 
  
           startPriceRow.appendChild(startPriceCol);
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
           
           // 경매 종료일 공간 시작
           const endDateRow = document.createElement("div");
           endDateRow.classList.add("row");
           endDateRow.classList.add("mt-2");

           const endDateCol = document.createElement("div");
           endDateCol.classList.add("col");
           

           const endDateSpan = document.createElement("span");
           endDateSpan.classList.add("fw-bold");
           endDateSpan.id = "auctionEndDate";
           //endDateSpan.innerText = "경매종료일 " + formattedEndDate;
           
           endDateCol.appendChild(endDateSpan);

           endDateRow.appendChild(endDateCol);
           // 경매 종료일 공간 끝           
           
           // 칼럼 더하기
           //productDetailCol.appendChild(titleRow);
           productDetailCol.appendChild(priceRow);
           productDetailCol.appendChild(startPriceRow);
           productDetailCol.appendChild(startDateRow);
           productDetailCol.appendChild(endDateRow);    
           
           
           productInfoRow.appendChild(productImgCol);
           productInfoRow.appendChild(productDetailCol);           
           
           col.appendChild(productInfoRow);
       	
           row.appendChild(col);

           auctionItemInfoBox.appendChild(row);   

           
           const auctionProductInfoBox = document.getElementById("auctionProductInfo");
           
           const productFuncInfoRow = document.createElement("div");
           productFuncInfoRow.classList.add("row");

           const productFuncInfoCol = document.createElement("div");
           productFuncInfoCol.classList.add("col");
           
           const existingButton = document.getElementById("auctionInfoButton");
           if (!existingButton) {
        	   // 상품 정보 확인 버튼 추가
               const auctionInfoButton = document.createElement("input");
               auctionInfoButton.type = "button";
               auctionInfoButton.classList.add("btn", "btn-dark");
               auctionInfoButton.onclick = auctionInfoPage;
               auctionInfoButton.value = "상품정보 확인";
               auctionInfoButton.id = "auctionInfoButton";
                // 상품 정보 확인 버튼 추가
                         
               productFuncInfoCol.appendChild(auctionInfoButton);
           }
           
          
            
           // 수정, 삭제 버튼 공간
           /*const modifyCol = document.createElement("div");
           modifyCol.classList.add("col", "me-2");*/
 
           const threeDaysBeforeStartDate = new Date(startDate);
           threeDaysBeforeStartDate.setDate(startDate.getDate() - 3);
       
           // 경매 판매자의 pk와 현재 접속한 유저의 pk가 일치할 경우 수정, 삭제 버튼 보이게 하기
           if (sessionId == item.auctionDto.user_seller_id  && nowDate < threeDaysBeforeStartDate) {
        	   
		      const modifyButton = document.createElement("input");
	            modifyButton.type = "button";
	            modifyButton.classList.add("btn", "btn-secondary", "ms-1");
	            modifyButton.onclick = modifyProductPage;
	            
	            modifyButton.value = "수정";
	
	            const deleteButton = document.createElement("input");
	            deleteButton.type = "button";
	            deleteButton.classList.add("btn", "btn-secondary", "ms-1");
	            deleteButton.onclick = function() {
	                location.href = "/safari/auction/removeProductProcess/" + auctionItemId;
	              };   
	            deleteButton.value = "삭제";
	
	            productFuncInfoCol.appendChild(modifyButton);
	            productFuncInfoCol.appendChild(deleteButton);
	
	     
           } else if (nowDate >= startDate && nowDate <= endDate) {
        	   
           
           }
   
            
           
           productFuncInfoRow.appendChild(productFuncInfoCol);
           /*productFuncInfoCol.appendChild(modifyCol);
           productFuncInfoRow.appendChild(productFuncInfoCol);*/
           
           auctionProductInfoBox.appendChild(productFuncInfoRow);
           
           
           
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
    inputBidBox.addEventListener("keydown", function(event) {
        if (event.key && event.key === "Enter") {
            event.preventDefault(); // 엔터 키의 기본 동작 방지
            bidRequest();
        }
    });
	// enter 이벤트 (아직 안됨)
	//inputBidBox.onkeydown = "checkSendBid(event)";
	
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


// 최고입찰자일 경우 입찰 버튼 막기
function forbidInputBidBoxByMaxBider() { 
	
	 //nowMaxBider = sessionId;
	 const currentStatusBox = document.getElementById("currentStatus");
	 const inputBidBox = document.getElementById("bidPrice");
	 const button = document.getElementById("inputBidButton");
	 
	
  	  if(!button.classList.contains("disabled") && inputBidBox.placeholder != "회원님은 현재 최고입찰자입니다." ) {
    		 
  		 currentStatusBox.innerHTML = "";
   		 inputBidBox.innerHTML = "";
   		 button.innerHTML = "";
   		 
         const statusText = document.createElement("span");
         statusText.innerText = "최고 입찰자";

         const awardSpan = document.createElement("span");
         awardSpan.classList.add("award-container");

         const awardIcon1 = document.createElement("i");
         awardIcon1.classList.add("bi", "bi-trophy");

         const awardIcon2 = document.createElement("i");
         awardIcon2.classList.add("bi", "bi-trophy");

         awardSpan.appendChild(awardIcon1);
         awardSpan.appendChild(document.createTextNode(" ")); // 공백 추가
         awardSpan.appendChild(document.createTextNode(" ")); // 공백 추가
         awardSpan.appendChild(statusText);
         awardSpan.appendChild(document.createTextNode(" ")); // 공백 추가
         awardSpan.appendChild(document.createTextNode(" ")); // 공백 추가
         awardSpan.appendChild(awardIcon2);

         currentStatusBox.style.backgroundColor = "#fcdf03";

   		 
   		 currentStatusBox.appendChild(awardSpan);
   		 
   		 
   		 button.classList.add("disabled");  
   		 inputBidBox.placeholder = "회원님은 현재 최고입찰자입니다.";
   		 inputBidBox.setAttribute("readonly", "readonly");

    	 }

}

// 경매 종료 시, 입찰 버튼 종료로 갱신
function renewInputBidBoxEnd() {

	const currentStatusBox = document.getElementById("currentStatus");
	// 입찰하기 입력 폼 id 가져오기
	 const inputBidBox = document.getElementById("bidPrice");
	 // 입찰하기 버튼 id값 가져오기
	 const button = document.getElementById("inputBidButton");
	 
   	 if (inputBidBox.placeholder != "경매가 종료되었습니다." || !button.classList.contains('disabled')) {
   		   
   		   currentStatusBox.innerHTML = ""
		   inputBidBox.innerHTML = "";	   
		   button.innerHTML = "";
		   
	       button.classList.add("disabled");  
	       inputBidBox.placeholder = "경매가 종료되었습니다."
	       inputBidBox.setAttribute("readonly", "readonly");
	       
	       if (highestBidder !== null) {
	    	   	if (sessionId == nowMaxBider){
	    	   		currentStatusBox.innerText = "축하합니다 ! 낙찰에 성공하셨습니다."
	    	   	} else if (sessionId != nowMaxBider) {
	    	      currentStatusBox.innerText = highestBidder + "님께서 " +
	    	      "낙찰에 성공하셨습니다.";
	    	      currentStatusBox.style.backgroundColor = "#E2E3E5";
	    	    } 
	       }
	    	 else {
	    	      currentStatusBox.innerText = "입찰 정보가 없습니다.";
	    	    }
   	}	
}

// 경매 진행중으로 변경 시, 입찰 버튼 진행중으로 갱신
function renewInputBidBoxIng() {

	 const currentStatusBox = document.getElementById("currentStatus");
	 const inputBidBox = document.getElementById("bidPrice");
	 const button = document.getElementById("inputBidButton");
	 
   	 if (inputBidBox.placeholder != "현재가보다 낮은 가격으로 입찰하실 수 없습니다." || button.classList.contains('disabled')) {
  
   	   currentStatusBox.innerHTML = "";	 
	   inputBidBox.innerHTML = "";	   
	   button.innerHTML = "";
	   
       const statusText = document.createElement("span");
       statusText.innerText = "낙찰에 도전하세요";

       const trySpan = document.createElement("span");
       trySpan.classList.add("award-container", "placeholder-glow");

       const tryIcon1 = document.createElement("i");
       tryIcon1.classList.add("bi", "bi-bell","animate__animated", "animate__shakeX");
       
       tryIcon1.style.animationDuration = "1s";

       const tryIcon2 = document.createElement("i");
       tryIcon2.classList.add("bi", "bi-bell","animate__animated", "animate__shakeX");
       tryIcon2.style.animationDuration = "1s";

       trySpan.appendChild(tryIcon1);
       trySpan.appendChild(document.createTextNode(" ")); // 공백 추가
       trySpan.appendChild(document.createTextNode(" ")); // 공백 추가
       trySpan.appendChild(statusText);
       trySpan.appendChild(document.createTextNode(" ")); // 공백 추가
       trySpan.appendChild(document.createTextNode(" ")); // 공백 추가
       trySpan.appendChild(tryIcon2);

       currentStatusBox.style.backgroundColor = "#b1f054";

 		 
 	   currentStatusBox.appendChild(trySpan);	   
	   
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


//카운트다운 함수
//타임어택 숫자 (완료) 오로지 시간에 의해서만 (중요!!!!!)
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
 	  
 	 const remainTitleRow = document.createElement("div"); 
	 remainTitleRow.classList.add("row", "mt-5","mb-5");
	 
	 const remainTitleCol = document.createElement("div"); 
	 remainTitleCol.classList.add("col", "text-center", "fw-bold", "fs-4");
	 
	 remainTitleRow.appendChild(remainTitleCol);
	 
	  timeAttackBox.appendChild(remainTitleRow);
	  
	  const currentStatusBox = document.getElementById("currentStatus");
	  if (sessionId == nowMaxBider && sessionId != null && currentStatusBox.style.backgroundColor != "#fcdf03") {
		currentStatusBox.style.backgroundColor = "#fcdf03";
	  }
	 
 	  return;
   }
   else {
	   
	 const remainTitleRow = document.createElement("div"); 
	 remainTitleRow.classList.add("row");
	 
	 const remainTitleCol = document.createElement("div"); 
	 remainTitleCol.classList.add("col", "text-center", "fw-bold", "fs-4");
	 
	 remainTitleCol.innerText = "남은 시간";
	 
	 remainTitleRow.appendChild(remainTitleCol);
	 
	 const remainTimeRow = document.createElement("div"); 
	 remainTimeRow.classList.add("row");
	 
	 const remainTimeCol = document.createElement("div"); 
	 remainTimeCol.classList.add("col");
	 
	 
	   
   // 경매가 시작된 경우
   	 if (startDate <= nowDate){
   	  
   	  if (sellerId != sessionId) {
   	   	 if(sessionId == nowMaxBider && sessionId != null) { // 현재 최고 입찰자일 경우 입찰 비활성화
         		forbidInputBidBoxByMaxBider(); 
          } else {
   	  			renewInputBidBoxIng(); //(o)
         	}
   	  } else {
   		forbidInputBidBox();
   	  }
   	  
		
   	  showCountDownTableIng(); //(o)
   	  renewAuctionButtonStatusIng(); // (o)
   	  renewAuctionItemStatusIng();
   	  
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
     // 카운트다운
    if (countdownResult.days > 0) {
      const spanTime1 = document.createElement("span");
      spanTime1.innerText = countdownResult.days + "일 ";
      remainTimeCol.appendChild(spanTime1);
    }
	  
    if (countdownResult.hours > 0) {
        const spanTime2 = document.createElement("span");
        spanTime2.innerText = countdownResult.hours + "시간 ";
        remainTimeCol.appendChild(spanTime2);
      }
    
    if (countdownResult.minutes > 0) {
        const spanTime3  = document.createElement("span");
        spanTime3.innerText = countdownResult.minutes + "분 ";
        remainTimeCol.appendChild(spanTime3);
      }
   

   const spanTime4 = document.createElement("span");
   spanTime4.innerText = countdownResult.seconds + "초 ";      
   if(countdownResult.seconds <= 10) {
   	spanTime4.classList.add("text-danger");
   } 
  
   
  
   remainTimeCol.appendChild(spanTime4);
   
   remainTimeRow.appendChild(remainTimeCol);
    
	timeAttackBox.appendChild(remainTitleRow);
    timeAttackBox.appendChild(remainTimeRow);
   }

}


//상품 정보 모달 띄우기
function auctionInfoPage() {
	
	const auctionInfoModal = bootstrap.Modal.getOrCreateInstance("#auctionInfoModal");
	auctionInfoModal.show();
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
				
		      console.log("시간이 지나면 종료시킬거야");
		      
			  }
		 }
		 
	    xhr.open("get", "/safari/auction/renewAuctionItemStatusEnd/" + auctionItemId); // 수정하기
	    xhr.send();  
	}




//경매 시작되었으면 경매 상태를 진행중으로 업데이트 (DB에 정보 업데이트)
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
   
   // 남은 시간 카운트 공간
   const remainTimeRow = document.createElement("div");
   remainTimeRow.classList.add("row","mt-2","fs-1", "text-center");
  
  
   const remainTimeCol = document.createElement("div");
   remainTimeCol.classList.add("col", "fw-bold");
   
   // 타임어택 ID 부여
   remainTimeCol.id = "timeAttack";
   
   //const timeIcon = document.createElement("span");
   //timeIcon.id = "timeIcon";
   
   //remainTimeCol.appendChild(timeIcon);
   //remainTimeRow.appendChild(timeIconCol);
   remainTimeRow.appendChild(remainTimeCol);   
   
   countDownTableBox.innerHTML = "";
    
   const statusRow = document.createElement("div");
   statusRow.classList.add("row");
    
   const statusCol = document.createElement("div");
   statusCol.classList.add("col", "mt-4", "fs-3", "border", "border-1", "rounded-4", "text-center", "p-2");
   // 경매 상태에 ID 부여
   statusCol.id = "statusTitle";
   
   statusRow.appendChild(statusCol);
   
  
   
   countDownTableBox.appendChild(remainTimeRow);
   countDownTableBox.appendChild(statusRow);

}


// 경매 종료 제목 표시 (완료)
function showCountDownTableEnd() {
	
    const statusCol = document.getElementById("statusTitle");
    if (statusCol.innerText !== "경매 종료") { // 현재 텍스트와 동일한 경우에는 업데이트하지 않음
        statusCol.innerHTML = "";
    	statusCol.style.backgroundColor = "red";
    	statusCol.classList.add("text-white", "fs-5");
        statusCol.innerText = "경매 종료";
    } 
	
}

//경매 진행중 제목 표시 (완료)
function showCountDownTableIng() {
	
   const statusCol = document.getElementById("statusTitle");
   //const timeIconBox = document.getElementById("timeIcon");
    if (statusCol.innerText !== "경매 진행중") { // 현재 텍스트와 동일한 경우에는 업데이트하지 않음
        statusCol.innerHTML = "";
        statusCol.style.backgroundColor = "#198754";
    	statusCol.classList.add("text-white", "fs-5");
        statusCol.innerText = "경매 진행중";
           
        //timeIconBox.innerHTML = "";
        
       // const timeSpan = document.createElement("i");
        //timeSpan.classList.add("bi", "bi-alarm");
        
        //timeIconBox.appendChild(timeSpan);
    }
	
}

//경매 시작전 제목 표시 (완료)
function showCountDownTableBefore() {
	
   const statusCol = document.getElementById("statusTitle");
   //const timeIconBox = document.getElementById("timeIcon");
    if (statusCol.innerText !== "경매 준비중") { // 현재 텍스트와 동일한 경우에는 업데이트하지 않음
        statusCol.innerHTML = "";
    	statusCol.style.backgroundColor = "#0d6efd";
    	statusCol.classList.add("text-white", "fs-5");
        statusCol.innerText = "경매 준비중";
        
  		//timeIconBox.innerHTML = "";
        
        //const timeSpan = document.createElement("i");
        //timeSpan.classList.add("bi", "bi-alarm");
        
        //timeIconBox.appendChild(timeSpan);
        
    }
	
}






// 입찰하기 
function bidRequest() {

	let maxBidPrice = 0; // 가장 큰 초기 입찰가 초기값 설정
	
	const bidPriceBox = document.getElementById("bidPrice");
	const buttonBox = document.getElementById("inputBidButton");
	
	// 로그인하지 않은 상태로 입찰 시도할 경우
	if(sessionId == null) {
		location.href = "/safari/user/loginPage";
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
					const immediateBidSuccessModal = bootstrap.Modal.getOrCreateInstance("#immediateBidSuccessModal");
					const immediateBidSuccessAlert = document.getElementById("immediateBidSuccessAlert");
					immediateBidSuccessAlert.innerHTML = "";
					immediateBidSuccessAlert.innerText = response.userDto.nickname + "님이 " + 
						new Intl.NumberFormat('ko-KR').format(bidPriceBox.value) + "원으로 즉시 낙찰에 성공하여 경매가 종료됩니다.";
					immediateBidSuccessModal.show();
					
					const currentStatusBox = document.getElementById("currentStatus");
					currentStatusBox.style.backgroundColor = "#fcdf03";
				
					console.log("즉시 낙찰 되었습니다.");
					
					
					bidPriceBox.value = '';
					
					// 현재가 업데이트 (나중에 낙찰가로 변경)   
					getCurrentPrice();
					
					
					
					// 즉시 낙찰 로직 처리
					renewSuccessfulImmediateBid(auctionItemId); 
					
					setTimeout(function() {
						immediateBidSuccessModal.hide();
					}, 2000);
				}
				// 즉시 낙찰자는 아니지만 현 시간 최고 입찰자일 경우
				else if (bidPriceBox.value > maxBidPrice) {
					
						// 총 남은 시간이 30초 미만일 때 입찰하였을 경우 종료 시간을 30초 늘리기	
						if (endDate - currentTime < 30000) {
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
						// 총 남은 시간이 30초 미만일 때 입찰하였을 경우 종료 시간을 30초 늘리기 끝
						
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


// 즉시 낙찰 상태 확인 후 업데이트
function checkImmediateBid() {
	
	
	const xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status == 200){
            const response = JSON.parse(xhr.responseText);	
				if (response.auctionItemStatus.auction_status == '종료') {
					immeDiateSuccess = "ImmediateBidSuccess";
		
				} else {
					console.log("checkImmediateBid(): 즉시 낙찰이 아닙니다")
					return;
					
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
            
            immeDiateSuccess = "ImmediateBidSuccess";
            console.log("즉시 낙찰 되어 db에 업데이트 중입니다.");
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

/*입찰 기록 리스트 출력*/
function reloadBidList() {
    const xhr = new XMLHttpRequest();
    
    xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status == 200){
            const response = JSON.parse(xhr.responseText);

            const bidListBox = document.getElementById("bidListBox");
            const bidListshouldAutoScroll = isScrolledToBottom(bidListBox); // 스크롤 여부 확인
            bidListBox.innerHTML = "";
            
           	if (response.bidCount == 0) {
              	const tr = document.createElement("tr");
            	const td1 = document.createElement("td");
            	td1.classList.add("text-center");
            	td1.setAttribute("colspan", "3"); // colspan 속성 추가
            	
            	td1.innerText = "아직 입찰한 정보가 없습니다.";
            	tr.appendChild(td1);
            	bidListBox.appendChild(tr);
           	}
            
           	else {
            for(data of response.bidList) {
            	const tr = document.createElement("tr");
            	const td1 = document.createElement("td");
            	td1.classList.add("text-center");
            	
            	td1.innerText = data.userDto.nickname;
    	
            	const td2 = document.createElement("td");
            	td2.classList.add("text-end");
            	
              	const bidPrice = data.auctionBidDto.bid_price; 
            	const formattedbidPrice = new Intl.NumberFormat('ko-KR').format(bidPrice);
            	
              
  
            	
            	td2.innerText = formattedbidPrice + "원";
            	
            	const td3 = document.createElement("td");
            	td3.classList.add("text-center");
            	
            	td3.innerText = formatDateTime(data.auctionBidDto.reg_date);
            	
            	tr.appendChild(td1);
            	tr.appendChild(td2);
            	tr.appendChild(td3);
            	
            	bidListBox.appendChild(tr);
  
            }
           	}
            
            if (bidListshouldAutoScroll) {
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
    rankColElement.classList.add("col");
    
    const rankImage = document.createElement("img");
    const rankUserText = document.createElement("span");
    rankUserText.classList.add("fw-bold", "fs-5");
    const rankPriceText = document.createElement("span");
    rankPriceText.classList.add("fs-5");

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
    	currentPriceElement.textContent = currentPrice.toString() + "원";
  }
  
  if (currentPriceModalElement) {
	    currentPriceModalElement.textContent = currentPrice.toString() + "원";
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
                   col2.style.display = "flex";    // flex 속성 적용
                   col2.style.flexGrow = "1";      // flex-grow 속성 적용
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
                                    

                   col1.appendChild(row1);
                   col1.appendChild(row2);        
                   col1.appendChild(row3);        
                  

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
	
	
//사용자가 스크롤을 조작할 때 자동 스크롤을 비활성화하는 이벤트 핸들러1
document.getElementById("bidListBox").addEventListener("scroll", function (event) {
  const bidListBox = event.target;
  const bidListshouldAutoScroll = isScrolledToBottom(bidListBox);

  // 스크롤이 맨 아래에 있을 경우에만 자동 스크롤 활성화
  if (bidListshouldAutoScroll) {
	  bidListBox.scrollTop = bidListBox.scrollHeight;
  }
});	

window.addEventListener("DOMContentLoaded", function(){
    //사실상 시작 시점...
 
    getSessionId();
    getSellerId();
    setInterval(getNowMaxBiderId, 10);
    
    setInterval(checkImmediateBid, 10); // 즉시낙찰여부확인
    setInterval(getTop3BidList, 100);
    
   // checkImmediateBid();
    setInterval(getAuctionEndTimeInRealTime, 20);
    showAuctionInfo();
    showAuctionStatusTitle();
    
    setInterval(updateAuctionCountDown, 100);
    
    

    setInterval(reloadBidList, 100);
 
   
    refreshMyHeart();
    
    setInterval(reloadChatList, 100);
    setInterval(getCurrentPrice, 100);
 

    showInputBidBox(); // 입찰 버튼 기본 설정 보여주기

   
 
})


</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>