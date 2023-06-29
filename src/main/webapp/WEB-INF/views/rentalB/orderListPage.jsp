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
</head>
<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../common/headerB.jsp"></jsp:include>
	<!-- 헤더 섹션 -->

	<div class="container main_box">
		<div class="row">
		
			<div class="col-2">
				<div class="list-group list-group-flush">
					
					<!-- 왼쪽 카테고리 리스트 -->
					<jsp:include page="../common/navLeft.jsp"></jsp:include>
					<!-- 왼쪽 카테고리 리스트 -->
					
				</div>
				
				<div class="row mt-5 mb-5">
					<div class="col"> </div>
				</div>
			
			</div>
			
			
			<div class="col ms-3 container">
			
    			<h4 class="row mt-3 mb-4 fw-regular">주문 관리</h4>

				<div class="row mt-5 mb-2">
					<form action="#" method="GET" class="d-flex" role="search">
					
					<div class="col-3 me-2">
					      <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
					</div>
					<div class="col-1 me-3 d-grid">
					      <button class="btn btn-outline-dark" type="submit">Search</button>
					</div>
					
					<div class="col-1 me-4 text-end col-form-label">
						진행상태 
					</div>
					
					<div class="col-2">
						<select name="searchType" class="form-select">
							<option value="" selected >선택</option>
							<option value="주문완료">주문완료</option>
							<option value="대여중">대여중</option>
							<option value="취소중">취소신청</option>
							<option value="취소완료">취소완료</option>
							<option value="반납완료">회수완료</option>
							<option value="반납중">반납신청</option>
							<option value="정산완료">정산완료</option>
						</select>
					</div>
					
					<!-- <div class="col-1 me-4 text-end col-form-label">
						진행상태 
					</div>
					
					<div class="col-2">
						
						<select name="searchType" class="form-select">
							<option value="title" selected>제목</option>
							<option value="content">내용</option>
							<option value="nickname">작성자</option>
						</select>
					</div> -->
					
					</form>
				    
				   
			    	
					
				</div>
				
				
				<div class="row mt-5 mb-3 fw-medium">
					<div class="col text-center">
						주문번호
					</div>
					<div class="col">
						상태
					</div>
					<div class="col-4">
						상품 정보
					</div>
					<div class="col">
						시작일
					</div>
					<div class="col">
						종료일
					</div>
				</div>
				
				<hr class="border border-black border-1 opacity-100">

				
				<c:forEach var="map" items="${list}">
				
					
					<div class="row mt-3 mb-1">
						
						<div class="col text-center">
							${map.order.id}
						</div>
						<div class="col">
							${map.status}
						</div>
						<div class="col-4">
							${map.product.title}
						</div>
						<div class="col">
							<fmt:formatDate value="${map.order.start_date}" pattern="MM/dd/yyyy" />
							
						</div>
						<div class="col">
							<fmt:formatDate value="${map.order.end_date}" pattern="MM/dd/yyyy" />
						</div>
						
					</div>
					
					<hr class="border border-1 opacity-50">
					
				
				</c:forEach>
				
				
			
			</div>
			
			
		
		
		</div>
	</div>
	
	
	
	
	
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>	
</html>
