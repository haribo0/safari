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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 메타 섹션 -->
<jsp:include page="../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->
</head>
<body>
	
	<div class="container">
		
		
	<div class="row mt-2">
		<div class="col"></div>
	</div>
	
	<div class="row">
		<div class="col-11 bidBox fw-bold text-white">
			&nbsp;경매입찰
		</div>
	</div>
	
	<div class="row mt-5">
			<div class="col fw-bold fs-4 text-center">
				입찰이 완료되었습니다.
			</div>
		</div>	
	
	<div class="row mt-3">
		<div class="col text-danger fw-bold">
			&nbsp;입찰 상품 정보
		</div>
	</div>
	
	<div class="row mt-2">
		<div class="col">
			<table class="table" style="border-top: 1px solid #E2E3E5;">
				<tr>
					<td class="table-secondary text-center align-middle">상품명</td>
					<td>
						<span class="fw-bold">${auctionItemDto.title}</span>
					</td>
				</tr>	
				<tr>
					<td class="table-secondary text-center align-middle">경매마감일</td>
					<td>
					<fmt:formatDate value="${auctionItemDto.end_date}"  pattern="yyyy-MM-dd HH:mm:ss"  />
					</td>
				</tr>
				<tr>
					<td class="table-secondary text-center align-middle">배송비</td>
					<td>
					무료
					</td>
				</tr>													
			</table>
		</div>
	</div>
	
	<div class="row mt-2">
		<div class="col fw-bold text-danger">
			&nbsp;입찰 가격 정보
		</div>
	</div>
	
	<div class="row mt-2">
		<div class="col">
			<table class="table" style="border-top: 1px solid #E2E3E5;">
				<tr>
					<td class="table-secondary text-center align-middle">현재가격</td>
					
					<td><span class="text-danger fw-bold">
					<fmt:formatNumber value="${auctionBidDto.bid_price}" pattern="#,###"/>원 
					<%-- 나중에 제일 큰가격으로 수정 꼭 해주어야함 --%>
					</span></td>
					<td class="table-secondary text-center align-middle">즉시낙찰가격</td>
					
					<td><fmt:formatNumber value="${auctionItemDto.max_price}" pattern="#,###"/>원</td>
				</tr>
			
				<tr>
					<td class="table-secondary text-center align-middle">입찰가격</td>	
					<td>
						<div class="row mt-2">
							<div class="col">
								<fmt:formatNumber value="${auctionBidDto.bid_price}" pattern="#,###"/>원
								
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
		
		<div class="row mt-4">
			<div class="col text-center">
			
				<input type="button" class="btn btn-outline-dark" value="창닫기" onclick="return closeTabClick()">		
			</div>			
		</div>
		
		
	
	</div>
<script>


function  closeTabClick() {
	window.close();
}



</script>	

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>