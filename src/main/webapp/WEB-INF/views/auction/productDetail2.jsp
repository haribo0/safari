<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
    
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<link rel="stylesheet" href="/safari/resources/style/common.css" type="text/css">

<script type="text/javascript" src="/safari/resources/js/bid.js" ></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="/safari/resources/style/auction.css" type="text/css">

<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 메타 섹션 -->
<jsp:include page="../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->
<style>
thead > tr > td {
	color: #dbdbd9;
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
					<a href="/safari/auction/mainPage">홈</a> &nbsp; > &nbsp;${productDetail.productMainCategoryDto.main_category_name} &nbsp; > &nbsp;${productDetail.productSubCategoryDto.sub_category_name}
				</div>
			</div>
			
			<div class="row mb-5">
				<div class="col rounded-3 border border-1" style="border-color: #e1e6ed" id="auctionItemInfo">
					
					<div class="row">
						<%-- 왼쪽 화면 시작 --%>
						<div class="col ms-2 mt-3 mb-3">	
						
							<%-- 상품 정보 시작 --%>		
							<div class="row">
								<%--상품 이미지 --%>
								<div class="col text-center"> 
									<img class="img-fluid align-middle" style="height: 120px;"
									src="/auctionFiles/${productDetail.auctionMainImgDto.auction_item_img_link}">
								</div>  
								<%--상품 이미지 --%>	
								
								<%-- 상품 설명 --%>
								<div class="col-8">
								
									<%-- 상품 제목 --%>
									<div class="row">
										<div class="col fw-bold fs-5">
											${productDetail.auctionDto.title}
											&nbsp;
											<c:choose>
												<c:when test="${productDetail.auctionDto.auction_status == '진행중'}">
													<button class="btn btn-sm btn-outline-success" disabled="disabled">경매 진행중</button>
												</c:when>
												<c:when test="${productDetail.auctionDto.auction_status == '준비중'}">
													<button class="btn btn-sm btn-outline-success" disabled="disabled">경매 준비중</button>
												</c:when>
												<c:otherwise>
													<button class="btn  btn-sm btn-outline-danger" disabled="disabled">경매 종료</button>
												</c:otherwise>
											</c:choose>				
										</div>											
									</div>
									<%-- 상품 제목 --%>
									
									<%-- 상품 가격 --%>
									<div class="row mt-2">
										<div class="col">

											즉시낙찰가
											<span class="fw-bold text-danger">
								 				<fmt:formatNumber value="${productDetail.auctionDto.max_price}" pattern="#,###"/>원
								 			</span> 
								 			&nbsp;&nbsp;
								 			(시작가  <fmt:formatNumber value="${productDetail.auctionDto.start_price}" pattern="#,###"/>원)
										</div>										
									</div>	
									<%-- 상품 가격 --%>
									
									<%-- 경매시작일 --%>
									<div class="row mt-2">
										<div class="col">
											경매시작일 <fmt:formatDate value="${productDetail.auctionDto.start_date}"  pattern="yyyy-MM-dd HH:mm"  />
										</div>
									</div>
									<%-- 경매시작일 --%>	
									
									<%-- 경매종료일 --%>
									<div class="row mt-2">
										<div class="col">
											<span class="fw-bold">경매종료일</span> <fmt:formatDate value="${productDetail.auctionDto.end_date}"  pattern="yyyy-MM-dd HH:mm"  />
										</div>
									</div>																									
									<%-- 경매종료일 --%>	
								</div>
								
								<%--상품 기능 --%>
								<div class="col ms-2 mt-3 mb-3">
									<div class="row">
										<div class="col">
											<input type="button" class="btn btn-success" value="상품정보 확인" onclick="auctionInfoPage()">
										</div>
									</div>
									
									
									<div class="row mt-2">
										<div class="col">
							
											
										</div>
									</div>
						
									<div class="row mt-2">
										<c:choose>
											<c:when test="${sessionUser.id == productDetail.auctionDto.user_seller_id}">
												<div class="col">
													<input type="button" class="btn btn-secondary" value="수정" 
													 onclick="modifyProductPage()">
													<input type="button" class="btn btn-secondary" value="삭제"
													 onclick="location.href='/safari/auction/removeProductProcess/${productDetail.auctionDto.id}'" >								
												</div>
											</c:when>
											<c:otherwise>
												<div class="col text-center" style="position: relative; right: 25px;">
													<i id="heartBox" onclick="toggleLikeAuctionProduct()" 
													class="fs-5 text-danger bi bi-heart"></i> 
												</div>								
											</c:otherwise>
										</c:choose>
									</div>						
								</div>								
								<%--상품 기능 --%>	
							</div>	
						</div>	
					</div>
				</div>	
			</div>
			<%-- 상품 정보 끝 --%>	
			
			
			<div class="row mt-4">
				<div class="col">
					<div class="row">
					
						<div class="col">
						
							<div class="row fw-bold fs-5">
							 	<div class="col">경매까지 남은 시간</div>
							</div>
							
					
						</div>
						
						<%-- 경매 상황 화면 --%>
						<div class="col">
							
							<div class="row fw-bold fs-5">
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
							
							<div class="row mt-3 mb-5">
								<div class="col-9">
								<input type="text" id = "bidPrice" class="form-control"
								placeholder="현재가보다 낮은 가격으로 입찰하실 수 없습니다.">								
								</div>
								<div class="col d-grid">
									<input type="button" class="btn text-white fw-bold"
										 style="background-color: #FF8200;" value="입찰하기" onclick="return bidRequest()">								
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
						<div class="col fw-bold fs-5">
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
						<div class="col fw-bold fs-5">
							실시간 채팅
						</div>
					</div>				
				
					<div class="row mt-3">
						<div class="col-10">
							<input type="text" 
							id="chatContentBox" class="form-control" placeholder="실시간 채팅에 참여해보세요!">
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



<%-- auctionInfoModal --%>

<%-- bidModal 
<div class="modal modal-dialog modal-lg fade" id="bidModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"
style="position: absolute; transform: translateX(70%); right: 50%;">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
       
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
      
      
	<div class="row mt-2">
		<div class="col"></div>
	</div>
	
	<div class="row">
		<div class="col bidBox fw-bold text-white">
			&nbsp;경매입찰
		</div>
	</div>
	
	<div class="row mt-2">
		<div class="col fw-bold">
			&nbsp;입찰 상품 정보
		</div>
	</div>
	
	<div class="row mt-2">
		<div class="col">
			<table class="table" style="border-top: 1px solid #E2E3E5;">
				<tr>
					<td class="table-secondary text-center align-middle">상품명</td>
					<td>
						<span class="fw-bold">${productDetail.auctionDto.title}</span>
					</td>
				</tr>	
				<tr>
					<td class="table-secondary text-center align-middle">경매마감일</td>
					<td>
					<fmt:formatDate value="${productDetail.auctionDto.end_date}"  pattern="yyyy-MM-dd HH:mm"  />
					</td>
				</tr>
				
				<tr>
					<td class="table-secondary text-center align-middle">판매지역</td>
					<td>
					전국
					</td>
				</tr>													
			</table>
		</div>
	</div>
	
	<div class="row mt-2">
		<div class="col fw-bold ">
			&nbsp;입찰하기
		</div>
	</div>
	
	<div class="row mt-2">
		<div class="col">
			<table class="table" style="border-top: 1px solid #E2E3E5;">
				<tr>
					<td class="table-secondary text-center align-middle">현재가격</td>
					
					<td><span class="text-danger fw-bold">
					<fmt:formatNumber value="${productDetail.auctionDto.start_price}" pattern="#,###"/>원 
					</span></td>
					<td class="table-secondary text-center align-middle">즉시낙찰가격</td>
					
					<td><fmt:formatNumber value="${productDetail.auctionDto.max_price}" pattern="#,###"/>원</td>
				</tr>
			
				<tr>
					<td class="table-secondary text-center align-middle">입찰금액</td>	
					<td>
						<div class="row">
							<div class="col">
								현재 <span class="text-danger fw-bold">
								<fmt:formatNumber value="${productDetail.auctionDto.start_price}" pattern="#,###"/>원 
								</span>부터 입찰하실 수 있습니다.
							</div>
						</div>
						<div class="row mt-2">
							<div class="col">
								<input type="text" id = "bidPrice"
								style="width: 180px; height: 30px;
												  border-radius: 3px;
    											border: 1px solid #bfbfbf;">&nbsp;원
							</div>
						
						</div>
					</td>
					<th>
					</th>
					<td>
					</td>			
				
			</table>
		</div>
	</div>
	
	<div class="row mt-2">
		<div class="col text-center">
			<input type="button" class="btn text-white fw-bold" style="background-color: #FF8200;" value="입찰하기"
			onclick="return bidRequest()">
		</div>
	</div>
	
	<div class="row mt-5">
		<div class="col noticeBox">
			&nbsp;• 경매 낙찰 후 주문 취소를 하게 되면 구매 거부가 되어 경매 패널티 점수 5점이 부여됩니다. <br>
			&nbsp;• 최근 한 달 동안의 경매 패널티 점수가 15점이 되면 한 달 동안 경매 이벤트에 참여하실 수 없습니다.
			
		</div>
	</div>

	
	<div class="row mt-4">
		<div class="col text-center">
			 <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창닫기</button>
		</div>
	</div>      
  
      </div>
   
    </div>
  </div>
</div>
<%-- Modal --%>

<%-- alertModal --%>
<div class="modal" id="alertModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
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
let sessionId = null;
let currentPrice = 0;

const path = window.location.pathname;

//경로에서 변수 부분 추출
const parts = path.split('/');
const auctionItemId = parts[parts.length - 1];

const sellerId =  ${productDetail.userDto.id}; 

//const endDate = ${productDetail.auctionDetail.end_date};

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

// 상품 정보 모달 띄우기
function auctionInfoPage() {
	
	const auctionInfoModal = bootstrap.Modal.getOrCreateInstance("#auctionInfoModal");
	auctionInfoModal.show();
}


/* 입찰 모달 페이지 띄우기
function bidRequestPage() {
	
	if (sessionId == null) {
		location.href = "/safari/user/loginPage";
		return;
	} else {
		const bidModal = bootstrap.Modal.getOrCreateInstance("#bidModal");
		bidModal.show();	
	}
}*/

// 입찰하기 
function bidRequest() {

	const bidPriceBox = document.getElementById("bidPrice");
	
	
	 if (bidPriceBox.value < currentPrice) {
		    const alertModal = bootstrap.Modal.getOrCreateInstance("#alertModal");
		    alertModal.show();
		    
		    setTimeout(function() {
		        alertModal.hide();
		      }, 2000);		
		    
		    bidPriceBox.value='';
		    return;
	}
	
	const xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status == 200){
            const response = JSON.parse(xhr.responseText);
        	if (response.result == "success") {
        			
        		bidPriceBox.value='';
        		getCurrentPrice();
			}
            
        }
    }

    xhr.open("post", "/safari/auction/bidRequest/"+auctionItemId);
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); 
    xhr.send("&userId=" + sessionId + "&bid_price=" +  bidPriceBox.value);
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

/*입찰 기록 리스트 출력*/
function reloadBidList() {
    const xhr = new XMLHttpRequest();
    
    xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status == 200){
            const response = JSON.parse(xhr.responseText);

            const bidListBox = document.getElementById("bidListBox");
            bidListBox.innerHTML = "";

            
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


//경매 현재가 계속 업데이트 (비교)
function getCurrentPriceByCompare() {
	
	const xhr = new XMLHttpRequest();
	
	
	 xhr.onreadystatechange = function () {
	        if(xhr.readyState == 4 && xhr.status == 200){
	            const response = JSON.parse(xhr.responseText);
	            currentPrice = response.currentPrice;
	           
	        }
	  }    
	  
	  xhr.open("get", "/safari/auction/getCurrentPrice?auctionItemId=" + auctionItemId);
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
            
            console.log(auctionItemId);
     
            refreshTotalLikeCount();
            refreshMyHeart();
        }
    }

    xhr.open("get", "/safari/auction/toggleLikeAuctionProduct?auction_item_id=" + auctionItemId);
    xhr.send();
} 

// 찜 아이콘 
function refreshMyHeart(){
	
    if(sessionId == null) 
        return;

    const xhr = new XMLHttpRequest();
    
    xhr.onreadystatechange = function(){
        if(xhr.readyState == 4 && xhr.status == 200){
            const response = JSON.parse(xhr.responseText);
            // js 렌더링... 작업..
            const heartBox = document.getElementById("heartBox");
            
            if(response.checklikeAuctionProductByUser){
                heartBox.classList.remove("bi-heart");
                heartBox.classList.add("bi-heart-fill");
            }else{
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
            totalLikeCountBox.innerHTML = response.count;
            
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
           chatMessageBox.innerHTML = "";
           
         
          <%--.reverse() --%>
           for(data of response.chatList) {
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

                   col.appendChild(row1);
                   col.appendChild(row2);

                   const col3 = document.createElement("div");
                   col3.classList.add("col");

                   row.appendChild(col);
                   row.appendChild(col3);

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
                   row1.classList.add("text-end");
                   row1.classList.add("mb-1");

                   const col2 = document.createElement("div");
                   col2.classList.add("col");
                   col2.classList.add("fw-bold");
                   col2.style.fontSize = "14px";
                   
                   col2.innerText = data.userDto.nickname;

                   row1.appendChild(col2);

                   const row2 = document.createElement("div");
                   row2.classList.add("row");

                   const col3 = document.createElement("div");
                   col3.classList.add("col");
                   col3.classList.add("my-speech-bubble");
                   col3.classList.add("me-2");
                   /*col3.classList.add("text-end");*/
                   col3.innerText = data.chatDto.content;
            
               
                   
                   row2.appendChild(col3);
                   
                   
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
                   <%--col1.appendChild(deleteRow); --%>
                  

                   row.appendChild(col);
                   row.appendChild(col1);
               }
               chatMessageBox.appendChild(row);

        }

   }
   }
   xhr.open("get", "/safari/auction/getChatHistoryInAuctionChatroom?auctionItemId=" + auctionItemId);
   xhr.send();
}


function scrollToBottom() {
	  var chatContainer = document.getElementById('chatMessageBox'); // 채팅 컨테이너 엘리먼트의 ID를 사용해야 합니다.
	  chatContainer.scrollTop = chatContainer.scrollHeight; // 스크롤을 컨테이너의 맨 아래로 이동시킵니다.
	}
	
	
//  경매 종료일까지 남은 시간을 계산하여 표시하는 함수
function displayCountdownTimer(endDate) {
  const countdownTimer = document.getElementById("countdownTimer");

  // 종료일까지 남은 시간 계산
  const now = new Date().getTime();
  const distance = endDate - now;

  // 남은 일, 시간, 분, 초 계산
  const days = Math.floor(distance / (1000 * 60 * 60 * 24));
  const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
  const seconds = Math.floor((distance % (1000 * 60)) / 1000);

  // 표시 문자열 생성
  const countdownText = `${days}일 ${hours}시간 ${minutes}분 ${seconds}초 남음`;

  // 시간 표시 업데이트
  countdownTimer.textContent = countdownText;

  // 1초마다 업데이트
  setTimeout(function() {
    displayCountdownTimer(endDate);
  }, 1000);
}

// 경매 종료일 설정 (예시: 2023년 12월 31일)
const endDate = new Date(2023, 11, 31).getTime();





window.addEventListener("DOMContentLoaded", function(){
    //사실상 시작 시점...
    getSessionId();
    setInterval(reloadBidList, 1000);
    refreshTotalLikeCount();
    refreshMyHeart();
    setInterval(reloadChatList, 1000);
    scrollToBottom();
    setInterval(getCurrentPrice, 1000);
 	// 경매 종료일까지 남은 시간 표시 시작
    displayCountdownTimer(endDate);
    
 
 
});


</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>