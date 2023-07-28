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
  .orangeButton{
	background: #ff6f0f;
	font-weight: bold;
	color: white;
}

</style>

</head>
<body>
	
	
	<!-- 헤더 섹션 -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->
	
	<!-- 마이페이지 상단 블럭 -->
	<jsp:include page="../common/myPageTop.jsp"></jsp:include>
	<!-- 마이페이지 상단 블럭 -->

	<div class="container d-flex mt-5 px-0">
		<div class="row w-100">
		<!-- 마이페이지 nav -->
		<jsp:include page="../common/myPageNav.jsp"></jsp:include>
		<!-- 마이페이지 nav -->
		
			<div class="col ms-4">
				<div class="row" style="border-bottom: 2px solid #222; height: 48px;">
					<div class="col p-0">
						<h5>마이 페이지</h5>						
					</div>
				</div>
				
				<div class="row mt-5">
					<div class="col"></div>
					<div class="col-5 text-center">
						<span class="fs-2">
							<i class="bi bi-lg bi-check-circle"></i>
						</span>
				  		<div class="fs-4 fw-medium mt-1">코인 충전 완료</div>
				  		
				  		
				  		
			  			<%-- div class="fs-6 text-start mt-5 fw-medium"> ID</div>
				  		<div class="fs-5 fw-light text-start mt-1" id="orderId">${map.chargeCoinHistory.id}</div> --%>
				  		
						<div class="fs-6 text-start mt-5 fw-medium">상세설명</div>
				  		<div class="fs-5 fw-light text-start mt-1 fw-bold">${map.chargeCoinHistory.transaction_detail}</div>				  		
				  		
				  		<div class="fs-6 text-start mt-4 fw-medium">결제 수단</div>
				  		<div class="fs-5 fw-light text-start mt-1" id="paymentMethod">
				  				카카오페이
				  		
				  		</div>
				  		
				  		<div class="fs-6 text-start mt-4 fw-medium">충전일자</div>
				  		<div class="fs-5 fw-light text-start mt-1">
				  		<fmt:formatDate value="${map.chargeCoinHistory.reg_date}"  pattern="yyyy-MM-dd a hh:mm" />
				  		
				  		</div>					  		
				  		
				  		<div class="fs-6 text-start mt-4 fw-medium">충전 금액</div>
				  		<div class="fs-4 fw-light text-start mt-1 fw-bold" id="amount"
				  		>
				  		<fmt:formatNumber value="${map.chargeCoinHistory.coin_transaction}" pattern="#,###"/>원
				  		
				  		</div>				  		
					  		
						<div class="row mt-4">
				  			<div class="d-grid">
				  				
				  				<a class="btn orangeButton" href="/safari/user/myCoinPage" >확인</a>
				  			</div>
				  		</div>	  		
				  		
					</div>
					<div class="col"></div>
				</div>

	</div>
	</div>
</div>

<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->



</body>	
</html>
