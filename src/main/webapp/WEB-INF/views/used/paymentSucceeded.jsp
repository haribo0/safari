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
<!-- 메타 섹션 -->
<style>

  .my-table-row {
    line-height: 50px; /* 원하는 높이로 설정 */
  }
  .custom-dropdown  {
    background-color: white;
    color : black;
    border: 1px solid #ccc;
  }
  .f-sm  {
    font-size: 13px;
  }
  .f-sm2  {
    font-size: 15px;
  }
  
</style>

</head>
<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->

	<div class="container main_box">
		<div class="row">
			<div class="col ms-5">
		    	
		    	<h4 class="row mt-3 mb-4 fw-regular">결제 완료</h4>

				<div class="row mt-4">
					<div class="col">
					
						<div class="card">
						  <div class="card-body">
						  	<div class="row mt-4">
						  		<div class="col">
							  	
							  	</div>
						  		<div class="col-4 text-center">
							  		<span class="fs-2"><i class="bi bi-lg bi-check-circle"></i></span>
							  		<div class="fs-4 fw-medium mt-1">결제 완료</div>
							  		
							  		<div class="fs-6 text-start mt-5">결제 ID</div>
							  		<div class="fs-5 fw-light text-start mt-1" id="orderId">${map.payment.partner_order_id}</div>
							  		
							  		<div class="fs-6 text-start mt-4">결제 수단</div>
							  		<div class="fs-5 fw-light text-start mt-1" id="paymentMethod">${map.payment.payment_method_type}</div>
							  		
							  		<div class="fs-6 text-start mt-4">결제 금액</div>
							  		<div class="fs-5 fw-light text-start mt-1" id="amount">${map.productDto.price}</div>
							  		
							  		
							  		<div class="fs-6 text-start mt-5"> </div>
							  		<div class="fs-5 fw-light text-start mb-5"> </div>
							  		
							  		<div class=" row">
							  			<div class="  d-grid">
<!-- 							  				<a href="./productListPage" class="btn btn-dark" >확인</a> -->
							  				<a class="btn btn-dark" href="./mainPage" >확인</a>
							  			</div>
							  		</div>
							  		
							  		
							  		<div class="fs-5 text-start mt-4"> </div>
							  		<div class="fs-5 text-start mb-5"> </div>
							  		
							  	</div>
						  		<div class="col">
							  	
							  	</div>
						  	</div>
						  </div>
						</div>

					
					</div>
				</div>
			
			</div>
			
			
		
		
		</div>
	</div>
	
<script>


</script>





</body>	
</html>
