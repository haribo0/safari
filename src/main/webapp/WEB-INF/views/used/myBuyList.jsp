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
<style>
   a {
   	list-style: none;
   }
.overflow {
  white-space: nowrap; /* 텍스트를 한 줄로 표시 */
  overflow: hidden; /* 넘친 텍스트를 숨김 */
  text-overflow: ellipsis; /* 넘친 텍스트를 "..."으로 표시 */
}
.orangeButton1{
   background: #FF812C;
   font-weight: 400;
   color: white;
}
.orangeButton1:hover{
   background: #FF812C;
   font-weight: bold;
   color: white;
}
.btn-qna{position: fixed; bottom: 80px; right: 70px; border-radius: 60px; padding: 0 0;}
	.btn-circle{width: 50px; height: 52px; border-radius: 50%; display: flex; flex-direction:column; justify-content: center; align-items: center; font-size: 2rem; cursor: pointer;}
	.btn-circle i{color: #5e5e5e; font-size: 24px;}
	.btn-tit{font-size:13px;}
      

</style>
</head>
<body>
	<!-- Chat Box -->
	<jsp:include page="../common/chatBox.jsp"></jsp:include>
	<!-- Chat Box -->
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
					<h5>나의 구매내역</h5>						
				</div>
			</div>
			
			<div class="row mt-4" style="color: #777777; margin-left: -8px">
				<ul>
			        <li>금지 품목 거래 시, 제재 받을 수 있어요.</li>
			        <li>적절하지 않은 상품명, 이미지, 가격 제안 시에 제재 받을 수 있어요.</li>
			        <li>외부 채널로의 연락 유도, 타 사이트로의 결제 유도 시 제재 받을 수 있어요.</li>
			        <li>욕설, 성희롱 등 비매너 행위는 타인을 불쾌하게 해요.</li>
			    </ul>
			</div>
			
			<div class="row mt-3 mb-5">
				<div class="col">
						<div class="row fw-medium border-bottom border-top border-black border-1 py-2">
							<div class="col-5 text-center">상품정보</div>
							<div class="col-2 text-center">가격</div>
							<div class="col-2 text-center">작성일자</div>
							<div class="col text-center">비고</div>
						</div>
					
					<div class="cotainer" id="listContainer">	
					 <%-- <c:forEach items="${list}" var="map"> 
					 	<c:if test="${map.reservationCount < 1 }">
						<div class="row border-bottom py-2">
							<div class="col-5">
								<div class="row my-auto">
									<input type="hidden" id="bid_${bidDto.auction_item_id}" value="${bidDto.id}">
									<div class="col-3 ms-1"  style="float: left;">
										
										<a href="/safari/used/productDetail/1">
										<img src="/safari/resources/img/used/soso.png" style="width: 120px; height: 120px;"></a>
									</div>
									<div class="col ms-5" class="text-start">
										<div class="row mt-4 mb-1">
											<div class="col fw-light" style="font-size: 15px;">
												잡화 > 운동화
											</div>
										</div>
										<div class="row">
											<div class="col fw-bold">
												<span><a href="/safari/used/productDetail/1" style="font-size: 17px;">
												운동화 팔아요</a></span>
											</div>
										</div>
										<div class="row">
											<div class="col text-secondary" style="font-size: 14px;">
											 	서울시 강남구
											</div>
										</div>
									</div>									
								</div>
							</div>	
							<div class="col-2 my-auto text-center fw-semibold" style="font-size: 17px;">
								10,000원
							</div>
							
							<div class="col-2 my-auto text-center">
								2023-07-22
							</div>
							
							<div class="col my-auto text-center">
								<div class="row">
									<div class="col">
										<button class="btn btn-sm orangeButton"  style="width: 120px">끌어올리기</button>
									</div>
								</div>
								<div class="row mt-2">
									<div class="col text-end p-0" style="margin-right: 5px;">
										<button class="btn btn-sm btn-outline-dark px-3">수정</button>
									</div>
									<div class="col text-start p-0">
										<button class="btn btn-sm btn-outline-dark px-3">삭제</button>
									</div>
								</div>
							</div>
						</div>
						</c:if>
						<c:if test="${map.reservationCount > 0 }">
						<div class="row border-bottom py-2">
							<div class="col-5">
								<div class="row my-auto">
									<div class="col-3 ms-1"  style="float: left;">
										
										<a href="/safari/used/productDetail/1">
										<img src="/safari/resources/img/used/soso.png" style="width: 120px; height: 120px;"></a>
									</div>
									<div class="col ms-5" class="text-start">
										<div class="row mt-4 mb-1">
											<div class="col fw-light" style="font-size: 15px;">
												잡화 > 운동화
											</div>
										</div>
										<div class="row">
											<div class="col fw-bold">
												<span><a href="/safari/used/productDetail/1" style="font-size: 17px;">
												운동화 팔아요</a></span><span><button class="btn btn-success btn-sm btn-sm-custom ms-2" disabled
												style="padding: 1px 6px; font-size: 13px; margin-top: -3px;">예약중</button></span>
											</div>
										</div>
										<div class="row">
											<div class="col text-secondary" style="font-size: 14px;">
											 	서울시 강남구
											</div>
										</div>
									</div>									
								</div>
							</div>	
							<div class="col-2 my-auto text-center fw-semibold" style="font-size: 17px;">
								10,000원
							</div>
							
							<div class="col-2 my-auto text-center">
								2023-07-22
							</div>
							
							<div class="col my-auto text-center">
								<div class="row">
									<div class="col">
										<button class="btn btn-sm btn-outline-success" style="width: 120px">예약취소</button>
									</div>
								</div>
								<div class="row mt-2">
									<div class="col text-end p-0" style="margin-right: 5px;">
										<button class="btn btn-sm btn-outline-dark px-3">수정</button>
									</div>
									<div class="col text-start p-0">
										<button class="btn btn-sm btn-outline-dark px-3">삭제</button>
									</div>
								</div>
							</div>
						</div>
						</c:if>
						<c:if test="${map.completeCount > 0 && map.usedPurchaseReviewDto == null}">
						<div class="row border-bottom py-2">
							<div class="col-5">
								<div class="row my-auto">
									<div class="col-3 ms-1"  style="float: left;">
										
										<a href="/safari/used/productDetail/1">
										<img src="/safari/resources/img/used/soso.png" style="width: 120px; height: 120px;"></a>
									</div>
									<div class="col ms-5" class="text-start">
										<div class="row mt-4 mb-1">
											<div class="col fw-light" style="font-size: 15px;">
												잡화 > 운동화
											</div>
										</div>
										<div class="row">
											<div class="col fw-bold">
												<span><a href="/safari/used/productDetail/1" style="font-size: 17px;">
												운동화 팔아요</a></span><span><button class="btn btn-secondary btn-sm btn-sm-custom ms-2" disabled
												style="padding: 1px 6px; font-size: 13px; margin-top: -3px;">거래완료</button></span>
											</div>
										</div>
										<div class="row">
											<div class="col text-secondary" style="font-size: 14px;">
											 	서울시 강남구
											</div>
										</div>
									</div>									
								</div>
							</div>	
							<div class="col-2 my-auto text-center fw-semibold" style="font-size: 17px;">
								10,000원
							</div>
							
							<div class="col-2 my-auto text-center">
								2023-07-22
							</div>
							
							<div class="col my-auto text-center">
								<div class="row">
									<div class="col">
										<button class="btn btn-sm btn-outline-primary" style="width: 120px">후기보내기</button>
									</div>
								</div>
								<div class="row mt-2">
									<div class="col text-end p-0" style="margin-right: 5px;">
										<button class="btn btn-sm btn-outline-dark px-3">수정</button>
									</div>
									<div class="col text-start p-0">
										<button class="btn btn-sm btn-outline-dark px-3">삭제</button>
									</div>
								</div>
							</div>
						</div>
						</c:if>
						<c:if test="${map.completeCount > 0 && map.usedPurchaseReviewDto != null}">
						<div class="row border-bottom py-2">
							<div class="col-5">
								<div class="row my-auto">
									<input type="hidden" id="bid_${bidDto.auction_item_id}" value="${bidDto.id}">
									<div class="col-3 ms-1"  style="float: left;">
										
										<a href="/safari/used/productDetail/1">
										<img src="/safari/resources/img/used/soso.png" style="width: 120px; height: 120px;"></a>
									</div>
									<div class="col ms-5" class="text-start">
										<div class="row mt-4 mb-1">
											<div class="col fw-light" style="font-size: 15px;">
												잡화 > 운동화
											</div>
										</div>
										<div class="row">
											<div class="col fw-bold">
												<span><a href="/safari/used/productDetail/1" style="font-size: 17px;">
												운동화 팔아요</a></span><span><button class="btn btn-secondary btn-sm btn-sm-custom ms-2" disabled
												style="padding: 1px 6px; font-size: 13px; margin-top: -3px;">거래완료</button></span>
											</div>
										</div>
										<div class="row">
											<div class="col text-secondary" style="font-size: 14px;">
											 	서울시 강남구
											</div>
										</div>
									</div>									
								</div>
							</div>	
							<div class="col-2 my-auto text-center fw-semibold">
								10,000원
							</div>
							
							<div class="col-2 my-auto text-center">
								2023.07.22
							</div>
							
							<div class="col my-auto text-center">
								<div class="row">
									<div class="col">
										<button class="btn btn-sm btn-secondary" style="width: 120px">보낸 후기 보기</button>
									</div>
								</div>
								<div class="row mt-2">
									<div class="col text-end p-0" style="margin-right: 5px;">
										<button class="btn btn-sm btn-outline-dark px-3">수정</button>
									</div>
									<div class="col text-start p-0">
										<button class="btn btn-sm btn-outline-dark px-3">삭제</button>
									</div>
								</div>
							</div>
						</div>
						</c:if>
				 </c:forEach> --%>
				 </div>	 				
				</div>
			</div>
			

		
		</div>
	</div>
	</div>
	
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->
	
	<!--  -->






</body>	
</html>