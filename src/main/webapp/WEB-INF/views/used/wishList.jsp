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

<style>
.overflow {
  white-space: nowrap; /* 텍스트를 한 줄로 표시 */
  overflow: hidden; /* 넘친 텍스트를 숨김 */
  text-overflow: ellipsis; /* 넘친 텍스트를 "..."으로 표시 */
}
</style>
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
					<h5>찜 목록</h5>						
				</div>
			</div>
			
			<div class="row me-5" style="position: relative; right: 10px;">
				<div class="col">
			
				<div class="row mt-4">
					<div class="col">
						<span>
							<img class="mb-1" src="/safari/resources/img/auction/notice.png"
								style="max-width: 25px; max-height: 25px;"></span>
								<span class="fw-bold fs-5">참고사항</span>
					</div>
				</div>
				
				<div class="row">
					<div class="col">
						찜한 경매 중에서 준비중이거나 진행중인 경매만 표시됩니다.
					</div>
				</div>			
		
			    <div class="row">
					<div class="col">
						진행중인 경매의 <span class="fw-bold">현재가는 <span class="text-danger">실시간으로</span> 업데이트</span> 되고 있습니다.
					</div>
				</div>		
				
				<div class="row mt-4">
					<div class="col fw-bold fs-5">
					 	 관심 있는 경매 목록
					</div>
				</div>			
				
				
				<c:if test="${empty auctionWishList}">
					<div class="row mt-3">
						<div class="col text-center fs-5">
							관심 있는 경매가 없습니다.
						</div>
					</div>	
				</c:if>
					
				<div class="row mt-3">
					<c:forEach items="${auctionWishList}" var="wish">
						<div class="col-3">
							
							<div class="row">
								<div class="col">
									<a href="/safari/auction/productDetail/${wish.id}" class="text-decoration-none d-inline-block">
											  <img src="/auctionFiles/${wish.auction_item_img_link}" class="img-fluid" alt="..." 
											  	 style="height: 220px;">
									</a>
								</div>
							</div>
							
							
							<div class="row mt-2">
								<div class="col fw-bold overflow" style="width: 200px; font-size:17px;">
									<a href="/safari/auction/productDetail/${wish.id}">
									   ${wish.title}</a>
								</div>
							</div>
							
							
							
							<div class="row mt-1">
								<div class="col-auto text-secondary">
									현재가 <span style="font-size: 18px;"
									 class="text-danger fw-bold ms-1 fs-5" id="currentPrice_${wish.id}"></span>
									 <span>원</span>
								</div>
								<div class="col px-0" >
									<span id="auctionStatus_${wish.id}"> </span>
								</div>
								
							</div>
							
							<div class="row mt-1">
								<div class="col" style="font-size: 14px;">
									즉시낙찰가
									<span class="ms-2" >
						 				<fmt:formatNumber value="${wish.max_price}" pattern="#,###"/>원
						 			</span> 
								</div>
							</div>	
							
							<div class="row mt-1 mb-0">
								<div class="col">
									<p id="remainTime_${wish.id}" class="mb-1"
									style="font-size:17px;">
									 </p>
								</div>
							</div>
							
														
							
							
						</div>
					</c:forEach>
				</div>
				</div>	
			</div>
		</div>
	</div>
</div>
	
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->


	
</body>
</html>