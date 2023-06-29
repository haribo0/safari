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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<link rel="stylesheet" href="/safari/resources/style/common.css" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

<style type="text/css">
.btn_search{padding:9px 18px; background: #e6edfe; border:none; color: #789efd; border-radius:8px; font-size: 14px;}
.btn_delivered{padding:4px 12px; background: #f9e2e5; border:none; color: #dd7c7e; border-radius:8px; font-size: 14px;}
.btn_canceled{padding:4px 12px; background: #e6edfe; border:none; color: #789efd; border-radius:8px; font-size: 14px;}
.btn_canceled{padding:4px 12px; background: #e6edfe; border:none; color: #789efd; border-radius:8px; font-size: 14px;}
.c_pointer{cursor: poniter;}
</style>


</head>
<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../common/headerB.jsp"></jsp:include>
	<!-- 헤더 섹션 -->

	
	
	<div class="container-fluid">
		<div class="row">
		
			<div class="col-2 ms-5">
				<div class="list-group list-group-flush">
					
					<!-- 왼쪽 카테고리 리스트 -->
					<jsp:include page="../common/navLeft.jsp"></jsp:include>
					<!-- 왼쪽 카테고리 리스트 -->
					
				</div>
				
				<div class="row mt-5 mb-5">
					<div class="col"> </div>
				</div>
			
			</div>
			
			<div class="col ms-3 me-5">
			    
			    <h4 class="row mt-3 mb-4 fw-regular">배송 관리</h4>
			
				
				<div class="row mt-4">
					<div class="col" style="font-size: 15px;">
						<div class="row py-2 border-bottom  border-2 text-center">
							<div class="col-1 fw-bold text-body-tertiary">#</div>
							<div class="col-3 fw-bold text-body-tertiary">상품</div>
							<div class="col-3 fw-bold text-body-tertiary">주소</div>
							<div class="col-2 fw-bold text-body-tertiary">시작일</div>
							<div class="col-2 fw-bold text-body-tertiary">상태</div>
						</div>
						
						
						<c:forEach var="map" items="${list}" >
							<div class="row border-bottom py-3 text-center ">
								<div class="col-1">${map.order.id }</div>
								<div class="col-3">${map.product.title }</div>
								<div class="col-3">${map.order.address }</div>
								<div class="col-2">
									<fmt:formatDate value="${map.order.start_date}" pattern="MM/dd/yyyy" />
								</div>
								<div class="col-2 ps-0"><div datat-order-id="${map.order.id}" class="btn btn-outline-dark">배송처리</div></div>
							</div>
						</c:forEach>
						
						
						
					</div>
				</div>
				
			</div>
		</div>
	</div>
	
	
	
	
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>	
</html>