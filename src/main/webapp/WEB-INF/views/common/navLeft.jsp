<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
    
<!-- <div class=""> -->

<div class="row mt-4 bg-dark">
	<div class="col bg-dark">
		<div class="row bg-dark">
			<div class="col bg-dark"></div>
		</div>
	</div>


</div>
    
<div class="row">
	<div class="col me-5 py-3"><a href="./mainPage" class="btn"><img class="img-fluid" width="150px" max-width="150px" src="/safari/resources/img/logo0.png"></a></div>
	<div class="col-2"></div>
</div>

<!-- 2023-07-01 시욱수정 -->    
<div class="listContainer mt-3">
	<ul class="list-group">
	  <li class="list-group-item border border-0  pt-2 pb-0 bg-dark"><a class="btn fs-5 fw-medium text text-white py-1" href="./mainPage"> <span style="font-size: 20px;">  <i class="bi bi-speedometer2"></i></span> &nbsp;대시보드</a></li>

		
	  <li class="list-group-item border border-0  pt-2 pb-0 bg-dark"><a class="btn fs-5 fw-medium text text-white py-1" href="./productListPage"> <span style="font-size: 18px;"> <i class="bi bi-box"></i> </span>&nbsp;상품</a></li>
	  	<!-- <div class="" id="">
			<ul class="list-group ms-2">
				<li class="list-group-item border-0"><a href="./productRegisterPage" class="btn py-0 text-body-secondary">상품 등록</a></li>
				<li class="list-group-item border-0"><a href="./productListPage" class="btn py-0 text-body-secondary">상품 관리</a></li>
			</ul>
		</div> -->
		
	  <li class="list-group-item border border-0 pt-2 pb-0 bg-dark"><a class="btn fs-5 text-white fw-medium text " href="./orderListPage2"> <span style="font-size: 19px;"><i class="bi bi-clipboard"></i></span> &nbsp;주문</a></li>
	  	<div class="" id="">
			<ul class="list-group ms-2">
				<!-- <li class="list-group-item border-0"><a href="./orderListPage" class="btn py-0 text-body-secondary">주문 관리</a></li> -->
				<!-- <li class="list-group-item border-0"><a href="./orderListPage2" class="btn py-0 text-body-secondary">주문 관리</a></li>
				<li class="list-group-item border-0"><a href="./orderDeliveryPage" class="btn py-0 text-body-secondary">배송 관리</a></li>
				<li class="list-group-item border-0"><a href="./orderReviewPage" class="btn py-0 text-body-secondary">리뷰 관리</a></li>
				<li class="list-group-item border-0"><a href="./orderReturnPage" class="btn py-0 text-body-secondary">반품 관리</a></li> -->
				
				<!-- <li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">1:1 문의</a></li> -->
			</ul>
		</div>
	  <li class="list-group-item border border-0 pt-2 pb-0 bg-dark"><a class="btn fs-5 fw-medium text text-white" href="./orderDeliveryPage"> <span style="font-size: 20px;"><i class="bi bi-truck"></i></span> &nbsp;배송</a></li>
	  <li class="list-group-item border border-0 pt-2 pb-0 bg-dark"><a class="btn fs-5 fw-medium text text-white" href="./orderReturnPage"> <span style="font-size: 18px;"><i class="bi bi-arrow-left-square"></i></span> &nbsp;반품</a></li>
	  <li class="list-group-item border border-0 pt-2 pb-0 bg-dark"><a class="btn fs-5 fw-medium text text-white" href="./orderReviewPage"> <span style="font-size: 18px;"><i class="bi bi-card-text"></i></span> &nbsp;리뷰</a></li>
	  	
		
	
						  
	  <li class="list-group-item border border-0  pt-2 pb-0 bg-dark"><a class="btn fs-5 fw-medium text text-white py-1" href="./myInfoPage"> <span style="font-size: 22px; line-"><i class="bi bi-person"></i></span>&nbsp;계정</a></li>
	  	<!-- <div class="" id="">
			<ul class="list-group ms-2">
				<li class="list-group-item border-0"><a href="./myInfoPage" class="btn py-0 text-body-secondary">내 정보</a></li>
				<li class="list-group-item border-0"><a href="./businessUpdateInfoPage" class="btn py-0 text-body-secondary">정보 변경</a></li>
				<li class="list-group-item border-0"><a href="./businessAdsPage" class="btn py-0 text-body-secondary">광고 관리</a></li>
				<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">심사내역 </a></li>
			</ul>
		</div> -->
	  
	</ul>
</div>



<div class="row mt-5">
	<div class="col">
	
		
	
		<div class="row mt-5">
			<div class="col ms-3">		        
		           		
			</div>
		</div>
	
		<div class="row mt-5">
			<div class="col ms-3">		        
		           		
			</div>
		</div>
	
		<div class="row mt-5">
			<div class="col ms-3">		        
		           		
			</div>
		</div>
		
		
		
		<div class="row ms-2 mt-4">
			<div class="col ms-3">		        
		           <c:if test="${!empty businessUser}">
		           		<a href="./myInfoPage" class="text-black text-decoration-none fs-5">
		           			<div class="fs-6 text-white">반갑습니다,</div>
		           			<div class="text-white"> ${businessUser.business_name} 님  </div>
		           			
		           		</a>
		           </c:if>			
			</div>
		</div>
		
		<div class="row ms-2 mt-3">
			<div class="col ms-3">
		        
		           <c:choose>
	           		<c:when test="${!empty businessUser}">
	           			<a href="${pageContext.request.contextPath}/rentalBusiness/businessLogoutProcess" class="text-secondary mt-2 text-opacity-50 text-decoration-none text-white">로그아웃</a>
	           		</c:when>
	           		<c:otherwise>
	        			<a href="${pageContext.request.contextPath}/rentalBusiness/businessLoginPage" class="btn btn-dark me-2 text-white">로그인</a>
	           		</c:otherwise>
	           	</c:choose>
		          
			
			</div>
		</div>
		

	
	</div>
</div>



