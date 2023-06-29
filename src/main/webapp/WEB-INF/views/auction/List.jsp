<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사파리 | 메인</title>
<!-- 메타 섹션 -->
<jsp:include page="../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->

</head>
<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->

<div class="container d-flex mt-5">
	<div style="width: 24%;">
		<h2 class="fw-bold">마이페이지</h2>
		
		<ul class="list-group mt-4">
		<li class="list-group-item border border-0 pb-0"><a class="btn fs-5 text fw-bold py-1" href="#">회원정보</a></li>
		  	<div class="" id="">
				<ul class="list-group ms-4">
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">회원정보수정</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">배송지관리</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">찜</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">리뷰관리</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">쪽지(?)</a></li>
				</ul>
			</div>
			
		
		  <li class="list-group-item border border-0 pb-0"><a class="btn fs-5 text fw-bold py-1" href="#collapse1">중고</a></li>
		  	<div class="" id="">
				<ul class="list-group ms-4">
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">리스트제목</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">리스트제목</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">리스트제목</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">리스트제목</a></li>
				</ul>
			</div>
			
		  <li class="list-group-item border border-0 pb-0"><a class="btn fs-5 text fw-bold py-1" href="#">대여</a></li>
		  	<div class="" id="">
				<ul class="list-group ms-4">
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">오더리스트</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">1:1문의</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">리스트제목</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">리스트제목</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">리스트제목</a></li>
				</ul>
			</div>
			
		  <li class="list-group-item border border-0 pb-0"><a class="btn fs-5 text fw-bold py-1" href="/safari/user/auctionList" >경매</a></li>
		  	<div class="" id="">
				<ul class="list-group ms-4">
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">입찰기록</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">낙찰기록</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">판매내역</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">관심목록</a></li>
				</ul>
			</div>
			
		  <li class="list-group-item border border-0 pb-0"><a class="btn fs-5 text fw-bold py-1" href="#" >커뮤니티</a></li>
		  	<div class="" id="">
				<ul class="list-group ms-4">
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">리스트제목</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">리스트제목</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">리스트제목</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">리스트제목</a></li>
				</ul>
			</div>
		</ul>
	</div>
		
	<%-- 내용 --%>	
	<div class="pt-2 w-100">
		
		<div class="row mb-3">
			<div class="col-11 fw-bold fs-5 ">
				회원님이 입찰한 상품			
			</div>
			<div class="col mt-2">
				<a>더보기</a>
			</div>
		</div>
		
		<div class="row mt-3">
			<c:forEach items="${bidHistoryList}" var="bidHistory">
				<div class="col-3">
					<div class="row text-center">
						<div class="col">
							<a href="/safari/auction/productDetail/${bidHistory.bidHistoryItemDto.id}">
								<img class="img-fluid align-middle" style="height: 150px;"
									src="/auctionFiles/${bidHistory.bidHistoryImgDto.auction_item_img_link}">
							</a>	
						</div>
					</div>
					<div class="row mt-2 text-center">
						<div class="col">
							${bidHistory.bidHistoryItemDto.title}						
						</div>
					</div>
					
					<div class="row mt-2 text-center">
						<div class="col">
							입찰가 <fmt:formatNumber value="${bidHistory.bidHistoryDto.bid_price}" pattern="#,###"/>원						
						</div>
					</div>					
					
				
				</div>
			</c:forEach>
		</div>
		
		<div class="row mt-4 mb-4">
			<div class="col"></div>
		</div>
		
		
		<div class="row mt-3 mb-3">
			<div class="col-11 fw-bold fs-5 ">
				회원님이 판매중인 상품		
			</div>
			<div class="col mt-2">
				<a>더보기</a>
			</div>
		</div>		
		
		
		<div class="row mt-3">
			<c:forEach items="${auctionHistoryList}" var="auctionHistory">
				<div class="col-3">
					<div class="row text-center">
						<div class="col">
							<a href="/safari/auction/productDetail/${auctionHistory.auctionHistoryDto.id}">
								<img class="img-fluid align-middle" style="height: 150px;"
									src="/auctionFiles/${auctionHistory.bidHistoryImgDto.auction_item_img_link}">
							</a>	
						</div>
					</div>
					<div class="row mt-2 text-center">
					
						<div class="col">
							${auctionHistory.auctionHistoryDto.title}						
						</div>
					</div>
					
					<div class="row mt-2 text-center">
						<div class="col">
							입찰가 <fmt:formatNumber value="${auctionHistory.bidHistoryDto.bid_price}" pattern="#,###"/>원						
						</div>
					</div>					
					
				
				</div>
			</c:forEach>
		</div>		
		
	</div>
	<%-- 내용 --%>
</div>
	
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>	
</html>