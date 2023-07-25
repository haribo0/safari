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
      
.gray-line{
	border: 1px solid rgba(128, 128, 128, 0.3);
}
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
					<h5>나의 판매내역</h5>						
				</div>
			</div>
			
			<div class="row mt-4" style="color: #777777; margin-left: -8px">
				<ul>
			        <li>금지 품목 거래 시, 제재 받을 수 있어요.</li>
			        <li>적절하지 않은 상품명, 이미지, 가격 등록 시에 제재 받을 수 있어요.</li>
			        <li>외부 채널로의 연락 유도, 타 사이트로의 결제 유도 시 제재 받을 수 있어요.</li>
			        <li>욕설, 성희롱 등 비매너 행위는 타인을 불쾌하게 해요.</li>
			    </ul>
			</div>
			
			<div class="row mt-3">
				<div class="col-auto px-1">
					<button class="btn btn-sm px-3" onclick="getMySellListByStatus(0)" id="all">전체</button>						
				</div>
				<div class="col-auto px-1">
					<button class="btn btn-sm px-3" onclick="getMySellListByStatus(1)" id="selling">판매중</button>						
				</div>
				<div class="col-auto px-1">
					<button class="btn btn-sm px-3" onclick="getMySellListByStatus(2)" id="reservation">예약중</button>						
				</div>
				<div class="col-auto px-1">
					<button class="btn btn-sm px-3" onclick="getMySellListByStatus(3)" id="sold">판매완료</button>						
				</div>
				<!-- <div class="col-auto px-1 ms-4 my-auto">
					<input class="text-start form-control rounded-pill search_box" style="font-size: 15px; height:30px; border-radius: 2px;" placeholder=" 상품명으로 검색">					
				</div> -->
				<div class="col-auto px-1 ms-4 my-auto">
					<input type="search" class="text-start form-control search_box" style="font-size: 15px; height:30px; border-radius: 2px;" placeholder=" 상품명으로 검색">					
				</div>
				<div class="col"></div>
				<div class="col-auto text-end"><a href="../used/productRegister"><button class="btn btn-sm px-3 btn-dark">상품 등록</button></a></div>
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
<!-- 리뷰작성 모달 -->
<div class="modal" id="writeReviewModalMy" tabindex="-1" >
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header position-relative px-3" style="background: #EAEAEA; padding: 10px 0px; height: 50px;">
       	<h5 class="modal-title ms-1 position-absolute top-50 start-50 translate-middle">거래 후기 보내기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-header ms-2" id="modalHeader2">
	     <div class="my-custom-header-wrapper" id="modalHeaderWrapper2My">
       </div>
      </div>
     <div class="modal-body ms-2" style="height: 500px">
	<div class="chat-container overflow-y-scroll overflow-x-hidden" style="height:480px;" id="modalBody2My">
      </div>
    </div>
  </div>
</div>
</div>
<!-- 리뷰 작성  모달 -->

<!-- 리뷰작성 후  모달 -->
<div class="modal" id="myWroteReviewModalMy" tabindex="-1" >
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header position-relative px-3" style="background: #EAEAEA; padding: 10px 0px; height: 50px;">
       	<h5 class="modal-title ms-1 position-absolute top-50 start-50 translate-middle">내가 보낸 거래 후기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body ms-3 me-3" style="height: 530px">
	<div class="chat-container overflow-y-scroll overflow-x-hidden" style="height:500px;" id="modalBody3My">
    	   <!-- <div class="row mt-3">
    				<div class="col fw-bold">닉네임님에게</div>
    			</div>
		<div class="row">
    				<div class="col fw-bold">따뜻한 후기를 보냈어요.</div>
    			</div>
    			<div class="row mt-1">
    				<div class="col text-secondary onlyme">상대방닉네임과 상품이름을(를) 거래했어요.</div>
    			</div>
    			<div class="row mt-4">
    				<div class="col">
    					<img alt="review" width="100%" height="180" id="reviewImg2" src="/safari/resources/img/used/review2.jpeg">
    				</div>
    			</div>
    			<div class="reviewContent">
    			<div class="row mt-3 mb-1">
    				<div class="col ms-3">
    					거래가 너무 좋았습니다. 앞으로도 이런 분과 거래하고 싶어요~!
    				</div>
    			</div>
 				<ul>
 					<li class="mb-1">제가 있는 곳까지 와서 거래했어요.</li>
 					<li class="mb-1">제가 있는 곳까지 와서 거래했어요.</li>
 					<li class="mb-1">제가 있는 곳까지 와서 거래했어요.</li>
 				</ul>
 				</div> -->
	     </div>
      </div>
      <div class="modal-footer p-0 mt-1">
      	<img class="img-fluid m-0" alt="chatAds" src="/safari/resources/img/used/usedChatAds3.png">
      </div>
    </div>
  </div>
</div>
<!-- 리뷰작성 후 모달 -->

<!-- 상대방 리뷰 모달 -->
<div class="modal" id="receiverWroteReviewModalMy" tabindex="-1" >
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header position-relative px-3" style="background: #EAEAEA; padding: 10px 0px;">
      	<i class="bi bi-chevron-left fs-4 p-0" onclick="receiverCloseAndMyOpen()"></i>
        <h5 class="modal-title ms-1 position-absolute top-50 start-50 translate-middle">받은 거래 후기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body ms-3 me-3" style="height: 515px">
		<div class="chat-container overflow-y-scroll overflow-x-hidden" style="height:500px;" id="modalBody4">
	    
	     </div>
      </div>
      <div class="modal-footer p-0 mt-1">
      	<img class="img-fluid m-0" alt="chatAds" src="/safari/resources/img/used/usedChatAds3.png">
      </div>
    </div>
  </div>
</div>
<!-- 상대방 리뷰 모달 -->

<!-- 끌올 모달(시간 충족) -->
<div class="modal" id="updateRegDate3" tabindex="-1" >
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header position-relative px-3" style="padding: 10px 0px; height: 55px;">
       	<h5 class="modal-title ms-1 position-absolute top-50 start-50 translate-middle" style="font-weight: 600 ;">끌어올리기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
     <div class="modal-body ms-2" style="height: 240px">
	  <div class="chat-container overflow-y-scroll overflow-x-hidden" style="height:220px;">
	  		<div class="row mt-2">
	  			<div class="col fw-bold fs-5" style="color: #ff6f0f;">1일 23시간 59분 뒤에</div>
	  		</div>
	  		<div class="row">
	  			<div class="col fw-bold fs-5">끌어올릴 수 있어요</div>
	  		</div>
	  		<div class="row mt-3">
	     		<div class="col-auto">
	     			<img alt="mod" src="/safari/resources/img/used/mod.png" width="50px" height="50px" style="border-radius: 6px;">
	     		</div>
	     		<div class="col my-auto">
	     			<div class="row">
	     				<div class="col">렉슨 버섯등 새상품</div>
	     			</div>
	     			<div class="row">
	     				<div class="col fw-bold">20,000원</div>
	     			</div>
	     		</div>
	     	</div>
	  		<div class="row mt-4">
	  			<div class="col text-center fw-medium btn mx-2 py-2 btn btn-secondary disabled">끌어올리기</div>
	  		</div>
      </div>
     </div>
  </div>
</div>
</div>
<!-- 끌올 모달 -->

<!-- 끌올 모달(시간 충족 안됨) -->
<div class="modal" id="updateRegDate2" tabindex="-1" >
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header position-relative px-3" style="padding: 10px 0px; height: 55px;">
       	<h5 class="modal-title ms-1 position-absolute top-50 start-50 translate-middle" style="font-weight: 600 ;">끌어올리기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-header" style="background: #d3d3d336;">
	     <div class="my-custom-header-wrapper">
	     	<div class="row">
	     		<div class="col-auto">
	     			<img alt="mod" src="/safari/resources/img/used/mod.png" width="75px" height="75px" style="border-radius: 6px;">
	     		</div>
	     		<div class="col my-auto">
	     			<div class="row">
	     				<div class="col fw-semibold fs-6">렉슨 버섯등 새상품</div>
	     			</div>
	     			<div class="row">
	     				<div class="col fw-semibold fs-6">20,000원</div>
	     			</div>
	     		</div>
	     	</div>
       </div>
      </div>
     <div class="modal-body ms-2" style="height: 500px">
	  <div class="chat-container overflow-y-scroll overflow-x-hidden" style="height:480px;">
	  		<div class="row mt-3">
	  			<div class="col fw-bold fs-5">사파리주인님, 끌어올리기 전에</div>
	  		</div>
	  		<div class="row">
	  			<div class="col fw-bold fs-5">가격을 낮춰보세요.</div>
	  		</div>
	  		<div class="row mt-3">
	  			<div class="col">판매 확률이 올라간답니다.</div>
	  		</div>
	  		<div class="row mt-3">
	  			<div class="col ms-1" style="font-size: 24px; font-weight: 500;">₩ 20,000</div>
	  		</div>
	  		<div class="row mt-2 mb-2">
	  			<div class="col gray-line"></div>
	  		</div>
	  		<div class="row ms-1 my-auto">
	  			<div class="col-2 text-center" style="background: #e4e0e094; border-radius: 15px; padding: 2px 4px;">5%</div>
	  			<div class="col-2 text-center ms-1" style="background: #e4e0e094; border-radius: 15px; padding: 2px 4px;">10%</div>
	  			<div class="col-2 text-center ms-1" style="background: #e4e0e094; border-radius: 15px; padding: 2px 4px;">15%</div>
	  			<div class="col-2 text-start">할인</div>
	  		</div>
	  		<div class="row mt-5">
	  			<div class="col fw-bold fs-5">가격을 변경하지 않고</div>
	  			<!-- <div class="col fw-bold fs-5">가격을 ₩ 32,000원으로 변경하고</div> -->
	  		</div>
	  		<div class="row">
	  			<div class="col fw-bold fs-5">지금 끌어올리시겠어요?</div>
	  		</div>
	  		<div class="row mt-3">
	  			<div class="col">다음 끌어올리기는<span style="font-weight: 600; color: #ff6f0f;"> 2일 12시간 </span>뒤에 할 수 있어요.</div>
	  		</div>
	  		<div class="row mt-5">
	  			<div class="col text-center fw-medium btn mx-2 py-2" style="background: #ff6f0f;color: white;border-radius: 10px;">끌어올리기</div>
	  		</div>
      </div>
     </div>
  </div>
</div>
</div>



<!-- <div class="modal" id="updateRegDate2" tabindex="-1">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header position-relative">
 	        <div class="modal-title">
	        	<h5 class="modal-title ms-1">
					끌어올리기
	        	</h5>
 	        </div>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body px-0 pb-0 pt-0" style="height: 490px; width: 460px;">
			<div class="chat-container overflow-y-scroll overflow-x-hidden" style="height:480px; width:480px" id="updateRegDate2">
				지
			</div>
	      </div>
	      <div class="modal-footer p-0">
	      	<img class="img-fluid m-0" alt="chatAds" src="/safari/resources/img/used/updaateDateBanner5.png">
	      </div>
	    </div>
	  </div>
</div> -->
<!-- 끌올 모달 -->

<script>
const listContainerBox = document.getElementById('listContainer');
const allBox = document.getElementById('all');
const sellingBox = document.getElementById('selling');
const reservationBox = document.getElementById('reservation');
const soldBox = document.getElementById('sold');

// 검정색깔 칠하기 
function addAndRemoveColor(statusId) {
	if(statusId == 0){
		allBox.classList.remove('btn-outline-secondary');
		allBox.classList.add('btn-dark');
		sellingBox.classList.remove('btn-dark');
		sellingBox.classList.add('btn-outline-secondary');
		reservationBox.classList.remove('btn-dark');
		reservationBox.classList.add('btn-outline-secondary');
		soldBox.classList.remove('btn-dark');
		soldBox.classList.add('btn-outline-secondary');
	}else if(statusId == 1){
		allBox.classList.remove('btn-dark');
		allBox.classList.add('btn-outline-secondary');
		sellingBox.classList.remove('btn-outline-secondary');
		sellingBox.classList.add('btn-dark');
		reservationBox.classList.remove('btn-dark');
		reservationBox.classList.add('btn-outline-secondary');
		soldBox.classList.remove('btn-dark');
		soldBox.classList.add('btn-outline-secondary');
	}else if(statusId == 2){
		allBox.classList.remove('btn-dark');
		allBox.classList.add('btn-outline-secondary');
		sellingBox.classList.remove('btn-dark');
		sellingBox.classList.add('btn-outline-secondary');
		reservationBox.classList.remove('btn-outline-secondary');
		reservationBox.classList.add('btn-dark');
		soldBox.classList.remove('btn-dark');
		soldBox.classList.add('btn-outline-secondary');
	}else{
		allBox.classList.remove('btn-dark');
		allBox.classList.add('btn-outline-secondary');
		sellingBox.classList.remove('btn-dark');
		sellingBox.classList.add('btn-outline-secondary');
		reservationBox.classList.remove('btn-dark');
		reservationBox.classList.add('btn-outline-secondary');
		soldBox.classList.remove('btn-outline-secondary');
		soldBox.classList.add('btn-dark');
	}
}


function getMySellListByStatus(statusId) {
	addAndRemoveColor(statusId);

    const xhr = new XMLHttpRequest();

    xhr.onreadystatechange = function(){
        if(xhr.readyState == 4 && xhr.status == 200){
            const response = JSON.parse(xhr.responseText);
            listContainerBox.innerHTML = "";
            const list = response.list;
            // 전체선택일 경우 
            if(statusId == 0){
            	if(list == null || list.length === 0){
            		const row1 = document.createElement('div');
		    	    row1.classList.add('row', 'border-bottom', 'py-2');
		    	    const col1 = document.createElement('div');
		    	    col1.classList.add('col', 'text-center');
		    	    col1.setAttribute('colspan', '4');
		    	    col1.textContent = '등록된 중고 상품이 없습니다.';
		    	    row1.appendChild(col1);
		    	    listContainerBox.appendChild(row1);
            	}else{
            		list.forEach((map) => {
                		// 판매중 
                		if(map.reservationCount == 0 && map.completeCount == 0){
                			selling(map);
                		}
                		// 예약중 
                		else if(map.reservationCount > 0){
                			reservation(map, statusId);
                		}
                		// 거래완료 -
                		else {
                			sold(map);
                		}
                		
                	});
            	}
            	
            	
            }else if(statusId==1){
            	if(list == null || list.length === 0){
            		const row1 = document.createElement('div');
            	    row1.classList.add('row', 'border-bottom', 'py-2');
            	    const col1 = document.createElement('div');
            	    col1.classList.add('col', 'text-center');
            	    col1.setAttribute('colspan', '4');
            	    col1.textContent = '판매중인 중고 상품이 없습니다.';
            	    row1.appendChild(col1);
            	    listContainerBox.appendChild(row1);
            	}else{
            		list.forEach((map) => {
                		// 판매중 
            			selling(map);
                	});
            	}
            }else if(statusId==2){
            	if(list == null || list.length === 0){
            		const row1 = document.createElement('div');
            	    row1.classList.add('row', 'border-bottom', 'py-2');
            	    const col1 = document.createElement('div');
            	    col1.classList.add('col', 'text-center');
            	    col1.setAttribute('colspan', '4');
            	    col1.textContent = '예약중인 중고 상품이 없습니다.';
            	    row1.appendChild(col1);
            	    listContainerBox.appendChild(row1);
            	}else{
            		list.forEach((map) => {
                		// 예약중 
            			reservation(map, statusId);
                	});
            	}
            }else{
            	if(list == null || list.length === 0){
            		const row1 = document.createElement('div');
            	    row1.classList.add('row', 'border-bottom', 'py-2');
            	    const col1 = document.createElement('div');
            	    col1.classList.add('col', 'text-center');
            	    col1.setAttribute('colspan', '4');
            	    col1.textContent = '거래완료된 중고 상품이 없습니다.';
            	    row1.appendChild(col1);
            	    listContainerBox.appendChild(row1);
            	}else{
            		list.forEach((map) => {
                		// 거래완료  
            			sold(map);
                	});
            	}
            }
            
        }
    }
    xhr.open("get", "./getMySellListByStatus?statusId="+statusId);
    xhr.send();
}

// 판매중 
function selling(map) {
	  const rowContainer = document.createElement('div');
	  rowContainer.classList.add('row', 'border-bottom', 'py-2');

	  const col5Container = document.createElement('div');
	  col5Container.classList.add('col-5');

	  const rowImageDetails = document.createElement('div');
	  rowImageDetails.classList.add('row', 'my-auto');

	  const imageCol = document.createElement('div');
	  imageCol.classList.add('col-3', 'ms-1');
	  imageCol.style.float = 'left';

	  const imageLink = document.createElement('a');
	  imageLink.href = '/safari/used/productDetail?productId='+map.productDto.id;

	  const image = document.createElement('img');
	  image.src = "/safarifile/" + map.productImgDto.product_img_link;
	  image.style.width = '120px';
	  image.style.height = '120px';

	  imageLink.appendChild(image);
	  imageCol.appendChild(imageLink);

	  const itemDetailsCol = document.createElement('div');
	  itemDetailsCol.classList.add('col', 'ms-5', 'text-start');

	  const itemCategoryRow = document.createElement('div');
	  itemCategoryRow.classList.add('row', 'mt-4', 'mb-1');

	  const itemCategoryCol = document.createElement('div');
	  itemCategoryCol.classList.add('col', 'fw-light');
	  itemCategoryCol.style.fontSize = '15px';
	  itemCategoryCol.textContent = map.productMainCategoryDto.main_category_name + ' > ' + map.productSubCategoryDto.sub_category_name;
	  itemCategoryRow.appendChild(itemCategoryCol);

	  const itemNameRow = document.createElement('div');
	  itemNameRow.classList.add('row');

	  const itemNameCol = document.createElement('div');
	  itemNameCol.classList.add('col', 'fw-bold');

	  const span1 = document.createElement('span');
	  span1.classList.add('d-inline-block','text-truncate');
  	  span1.style.maxWidth = '186px';
  	  span1.style.height = '22px';
	  const itemNameLink = document.createElement('a');
	  itemNameLink.href = '/safari/used/productDetail?productId='+map.productDto.id;
	  itemNameLink.style.fontSize = '17px';
	  
	  itemNameLink.textContent = map.productDto.title;
	  
	  
	  span1.appendChild(itemNameLink);
	  itemNameCol.appendChild(span1);
	  itemNameRow.appendChild(itemNameCol);
	  

	  const itemLocationRow = document.createElement('div');
	  itemLocationRow.classList.add('row');

	  const itemLocationCol = document.createElement('div');
	  itemLocationCol.classList.add('col', 'text-secondary');
	  itemLocationCol.style.fontSize = '14px';
	  itemLocationCol.textContent = map.productCityDto.product_city_name+ ' ' +map.productTownDto.product_town_name;

	  itemLocationRow.appendChild(itemLocationCol);

	  itemDetailsCol.appendChild(itemCategoryRow);
	  itemDetailsCol.appendChild(itemNameRow);
	  itemDetailsCol.appendChild(itemLocationRow);

	  rowImageDetails.appendChild(imageCol);
	  rowImageDetails.appendChild(itemDetailsCol);

	  col5Container.appendChild(rowImageDetails);

	  const col2Container = document.createElement('div');
	  col2Container.classList.add('col-2', 'my-auto', 'text-center', 'fw-semibold');
	  col2Container.style.fontSize = '17px';
	  
	  if (map.productDto.price == 0) {
          const btnShare = document.createElement("button");
          btnShare.type = "button";
          btnShare.classList.add("btn", "btn-warning", "px-2", "py-1");
          btnShare.disabled = true;
          btnShare.textContent = "나눔";
          col2Container.appendChild(btnShare);
          
        } else {
          const number = map.productDto.price;
          const formattedNumber = number.toLocaleString();
          col2Container.textContent = formattedNumber+'원';
        }
	  
	  
	  /* const number = map.productDto.price;
         const formattedNumber = number.toLocaleString();
         col2Container.textContent = formattedNumber+'원'; */

	  const col2DateContainer = document.createElement('div');
	  col2DateContainer.classList.add('col-2', 'my-auto', 'text-center');
	  col2DateContainer.textContent = formatTime(map.productDto.reg_date);

	  const colButtonsContainer = document.createElement('div');
	  colButtonsContainer.classList.add('col', 'my-auto', 'text-center');

	  const buttonsRow = document.createElement('div');
	  buttonsRow.classList.add('row');
	  const buttonsCol = document.createElement('div');
	  buttonsCol.classList.add('col');

	  const buttonBoost = document.createElement('button');
	  buttonBoost.classList.add('btn', 'btn-sm', 'orangeButton1');
	  buttonBoost.style.width = '120px';
	  buttonBoost.textContent = '끌어올리기';
	  
	  console.log(map.productDto.reg_date);
	  // 끌올 가능 
	  if(getTimeDifference(map.productDto.reg_date)=='끌올'){
		  buttonBoost.setAttribute("onclick", "showUpdateTimeModal("+map.productDto.id+")");
	  }else{
		  buttonBoost.setAttribute("onclick", "showNoUpdateTimeModal("+map.productDto.id+")");
	  }
	  
	  
	  buttonsCol.appendChild(buttonBoost);
	  buttonsRow.appendChild(buttonsCol);

	  const buttonsRow2 = document.createElement('div');
	  buttonsRow2.classList.add('row', 'mt-2');

	  const buttonEditCol = document.createElement('div');
	  buttonEditCol.classList.add('col', 'text-end', 'p-0');
	  buttonEditCol.style.marginRight = '5px';

	  const modifyAtag = document.createElement('a');
	  modifyAtag.href="/safari/used/updateProductRegister?productId="+map.productDto.id;
	  const buttonEdit = document.createElement('button');
	  buttonEdit.classList.add('btn', 'btn-sm', 'btn-outline-dark', 'px-3');
	  buttonEdit.textContent = '수정';

	  modifyAtag.appendChild(buttonEdit);
	  buttonEditCol.appendChild(modifyAtag);

	  const buttonDeleteCol = document.createElement('div');
	  buttonDeleteCol.classList.add('col', 'text-start', 'p-0');

	  const deleteAtag = document.createElement('a');
	  deleteAtag.href="./deleteProduct?productId="+map.productDto.id;
		 
	  const buttonDelete = document.createElement('button');
	  buttonDelete.classList.add('btn', 'btn-sm', 'btn-outline-dark', 'px-3');
	  buttonDelete.textContent = '삭제';
		
	  deleteAtag.appendChild(buttonDelete);
	  buttonDeleteCol.appendChild(deleteAtag);

	  buttonsRow2.appendChild(buttonEditCol);
	  buttonsRow2.appendChild(buttonDeleteCol);

	  colButtonsContainer.appendChild(buttonsRow);
	  colButtonsContainer.appendChild(buttonsRow2);

	  rowContainer.appendChild(col5Container);
	  rowContainer.appendChild(col2Container);
	  rowContainer.appendChild(col2DateContainer);
	  rowContainer.appendChild(colButtonsContainer);
	  
	  listContainerBox.appendChild(rowContainer);
}

// 예약중 
function reservation(map, statusId) {
	const rowContainer = document.createElement('div');
	 rowContainer.classList.add('row', 'border-bottom', 'py-2');
	
	 const col5Container = document.createElement('div');
	 col5Container.classList.add('col-5');
	
	 const rowImageDetails = document.createElement('div');
	 rowImageDetails.classList.add('row', 'my-auto');
	
	 const imageCol = document.createElement('div');
	 imageCol.classList.add('col-3', 'ms-1');
	 imageCol.style.float = 'left';
	
	 const imageLink = document.createElement('a');
	 imageLink.href = "/safari/used/productDetail?productId="+map.productDto.id;
	
	 const image = document.createElement('img');
	 image.src = "/safarifile/" + map.productImgDto.product_img_link;
	 image.style.width = '120px';
	 image.style.height = '120px';
	
	 imageLink.appendChild(image);
	 imageCol.appendChild(imageLink);
	
	 const itemDetailsCol = document.createElement('div');
	 itemDetailsCol.classList.add('col', 'ms-5', 'text-start');
	
	 const itemCategoryRow = document.createElement('div');
	 itemCategoryRow.classList.add('row', 'mt-4', 'mb-1');
	
	 const itemCategoryCol = document.createElement('div');
	 itemCategoryCol.classList.add('col', 'fw-light');
	 itemCategoryCol.style.fontSize = '15px';
	 itemCategoryCol.textContent = map.productMainCategoryDto.main_category_name + ' > ' + map.productSubCategoryDto.sub_category_name;
	 itemCategoryRow.appendChild(itemCategoryCol);
	 
	 const itemNameRow = document.createElement('div');
	 itemNameRow.classList.add('row');
	
	 const itemNameCol = document.createElement('div');
	 itemNameCol.classList.add('col', 'fw-bold');
	
	 const span1 = document.createElement('span');
	 span1.classList.add('d-inline-block','text-truncate');
 	 span1.style.maxWidth = '186px';
 	 span1.style.height = '22px';
	 const itemNameLink = document.createElement('a');
	 itemNameLink.href = '/safari/used/productDetail?productId='+map.productDto.id;
	 itemNameLink.style.fontSize = '17px';
	 itemNameLink.textContent = map.productDto.title;
	
	 const span2 = document.createElement('span');
	 const statusButton = document.createElement('button');
	 statusButton.classList.add('btn', 'btn-success', 'btn-sm', 'btn-sm-custom', 'ms-2');
	 statusButton.disabled = true;
	 statusButton.style.padding = '1px 6px';
	 statusButton.style.fontSize = '13px';
	 statusButton.style.marginTop = '-3px';
	 statusButton.textContent = '예약중';
	 span2.appendChild(statusButton);
	 
	 span1.appendChild(itemNameLink);
	 itemNameCol.appendChild(span1);
	 itemNameCol.appendChild(span2);
	 
	 itemNameRow.appendChild(itemNameCol);
	
	 const itemLocationRow = document.createElement('div');
	 itemLocationRow.classList.add('row');
	
	 const itemLocationCol = document.createElement('div');
	 itemLocationCol.classList.add('col', 'text-secondary');
	 itemLocationCol.style.fontSize = '14px';
	 itemLocationCol.textContent = map.productCityDto.product_city_name+ ' ' +map.productTownDto.product_town_name;
	
	 itemLocationRow.appendChild(itemLocationCol);
	
	 itemDetailsCol.appendChild(itemCategoryRow);
	 itemDetailsCol.appendChild(itemNameRow);
	 itemDetailsCol.appendChild(itemLocationRow);
	
	 rowImageDetails.appendChild(imageCol);
	 rowImageDetails.appendChild(itemDetailsCol);
	
	 col5Container.appendChild(rowImageDetails);
	
	 const col2Container = document.createElement('div');
	 col2Container.classList.add('col-2', 'my-auto', 'text-center', 'fw-semibold');
	 col2Container.style.fontSize = '17px';
	 
	 if (map.productDto.price == 0) {
         const btnShare = document.createElement("button");
         btnShare.type = "button";
         btnShare.classList.add("btn", "btn-warning", "px-2", "py-1");
         btnShare.disabled = true;
         btnShare.textContent = "나눔";
         col2Container.appendChild(btnShare);
         
       } else {
         const number = map.productDto.price;
         const formattedNumber = number.toLocaleString();
         col2Container.textContent = formattedNumber+'원';
       }
	  
	 
	 /* col2Container.textContent = map.productDto.price.toLocaleString() + '원'; */
	
	 const col2DateContainer = document.createElement('div');
	 col2DateContainer.classList.add('col-2', 'my-auto', 'text-center');
	 col2DateContainer.textContent = formatTime(map.productDto.reg_date);
	
	 const colButtonsContainer = document.createElement('div');
	 colButtonsContainer.classList.add('col', 'my-auto', 'text-center');
	
	 const buttonsRow = document.createElement('div');
	 buttonsRow.classList.add('row');
	 const buttonsCol = document.createElement('div');
	 buttonsCol.classList.add('col');
	
	 const buttonCancel = document.createElement('button');
	 buttonCancel.classList.add('btn', 'btn-sm', 'btn-outline-success');
	 buttonCancel.style.width = '120px';
	 buttonCancel.textContent = '예약취소';
	 buttonCancel.setAttribute("onclick", "productRequestStatusCancelByProduct("+map.productDto.id+","+statusId+")");
	
	 buttonsCol.appendChild(buttonCancel);
	 buttonsRow.appendChild(buttonsCol);
	
	 const buttonsRow2 = document.createElement('div');
	 buttonsRow2.classList.add('row', 'mt-2');
	
	 const buttonEditCol = document.createElement('div');
	 buttonEditCol.classList.add('col', 'text-end', 'p-0');
	 buttonEditCol.style.marginRight = '5px';
	
	  const modifyAtag = document.createElement('a');
	  modifyAtag.href="/safari/used/updateProductRegister?productId="+map.productDto.id;
	  const buttonEdit = document.createElement('button');
	  buttonEdit.classList.add('btn', 'btn-sm', 'btn-outline-dark', 'px-3');
	  buttonEdit.textContent = '수정';

	  modifyAtag.appendChild(buttonEdit);
	  buttonEditCol.appendChild(modifyAtag);
	
	 const buttonDeleteCol = document.createElement('div');
	 buttonDeleteCol.classList.add('col', 'text-start', 'p-0');
	
	 const deleteAtag = document.createElement('a');
	 deleteAtag.href="./deleteProduct?productId="+map.productDto.id;
	 
	 const buttonDelete = document.createElement('button');
	 buttonDelete.classList.add('btn', 'btn-sm', 'btn-outline-dark', 'px-3');
	 buttonDelete.textContent = '삭제';
	
	 deleteAtag.appendChild(buttonDelete);
	 buttonDeleteCol.appendChild(deleteAtag);
	
	 buttonsRow2.appendChild(buttonEditCol);
	 buttonsRow2.appendChild(buttonDeleteCol);
	
	 colButtonsContainer.appendChild(buttonsRow);
	 colButtonsContainer.appendChild(buttonsRow2);
	
	 rowContainer.appendChild(col5Container);
	 rowContainer.appendChild(col2Container);
	 rowContainer.appendChild(col2DateContainer);
	 rowContainer.appendChild(colButtonsContainer);
	
	listContainerBox.appendChild(rowContainer);
}

// 거래완료 
function sold(map) {
	if(map.completeCount > 0 && map.usedPurchaseReviewDto == null){
		const rowContainer = document.createElement('div');
  	  rowContainer.classList.add('row', 'border-bottom', 'py-2');

  	  const col5Container = document.createElement('div');
  	  col5Container.classList.add('col-5');

  	  const rowImageDetails = document.createElement('div');
  	  rowImageDetails.classList.add('row', 'my-auto');

  	  const imageCol = document.createElement('div');
  	  imageCol.classList.add('col-3', 'ms-1');
  	  imageCol.style.float = 'left';

  	  const imageLink = document.createElement('a');
  	  imageLink.href = "/safari/used/productDetail?productId="+map.productDto.id;

  	  const image = document.createElement('img');
  	  image.src = "/safarifile/" + map.productImgDto.product_img_link;
  	  image.style.width = '120px';
  	  image.style.height = '120px';

  	  imageLink.appendChild(image);
  	  imageCol.appendChild(imageLink);

  	  const itemDetailsCol = document.createElement('div');
  	  itemDetailsCol.classList.add('col', 'ms-5', 'text-start');

  	  const itemCategoryRow = document.createElement('div');
  	  itemCategoryRow.classList.add('row', 'mt-4', 'mb-1');

  	  const itemCategoryCol = document.createElement('div');
  	  itemCategoryCol.classList.add('col', 'fw-light');
  	  itemCategoryCol.style.fontSize = '15px';
  	  itemCategoryCol.textContent = map.productMainCategoryDto.main_category_name + ' > ' + map.productSubCategoryDto.sub_category_name;
  	  itemCategoryRow.appendChild(itemCategoryCol);
  	  
  	  const itemNameRow = document.createElement('div');
  	  itemNameRow.classList.add('row');

  	  const itemNameCol = document.createElement('div');
  	  itemNameCol.classList.add('col', 'fw-bold');

  	  
  	  const span1 = document.createElement('span');
  	  span1.classList.add('d-inline-block','text-truncate');
  	  span1.style.maxWidth = '186px';
  	  span1.style.height = '22px';
  	  const itemNameLink = document.createElement('a');
  	  itemNameLink.href = '/safari/used/productDetail?productId='+map.productDto.id;
  	  itemNameLink.style.fontSize = '17px';
  	  itemNameLink.textContent = map.productDto.title;

  	  
  	  const span2 = document.createElement('span');
  	  const statusButton = document.createElement('button');
  	  statusButton.classList.add('btn', 'btn-secondary', 'btn-sm', 'btn-sm-custom', 'ms-2');
  	  statusButton.disabled = true;
  	  statusButton.style.padding = '1px 6px';
  	  statusButton.style.fontSize = '13px';
  	  statusButton.style.marginTop = '-3px';
  	  statusButton.textContent = '거래완료';
  	  span2.appendChild(statusButton);
	 
	  span1.appendChild(itemNameLink);
	  itemNameCol.appendChild(span1);
	  itemNameCol.appendChild(span2);
	 
	  itemNameRow.appendChild(itemNameCol);

  	  const itemLocationRow = document.createElement('div');
  	  itemLocationRow.classList.add('row');

  	  const itemLocationCol = document.createElement('div');
  	  itemLocationCol.classList.add('col', 'text-secondary');
  	  itemLocationCol.style.fontSize = '14px';
  	  itemLocationCol.textContent = map.productCityDto.product_city_name+ ' ' +map.productTownDto.product_town_name;

  	  itemLocationRow.appendChild(itemLocationCol);

  	  itemDetailsCol.appendChild(itemCategoryRow);
  	  itemDetailsCol.appendChild(itemNameRow);
  	  itemDetailsCol.appendChild(itemLocationRow);

  	  rowImageDetails.appendChild(imageCol);
  	  rowImageDetails.appendChild(itemDetailsCol);

  	  col5Container.appendChild(rowImageDetails);

  	  const col2Container = document.createElement('div');
  	  col2Container.classList.add('col-2', 'my-auto', 'text-center', 'fw-semibold');
  	  col2Container.style.fontSize = '17px';
    	if (map.productDto.price == 0) {
        const btnShare = document.createElement("button");
        btnShare.type = "button";
        btnShare.classList.add("btn", "btn-warning", "px-2", "py-1");
        btnShare.disabled = true;
        btnShare.textContent = "나눔";
        col2Container.appendChild(btnShare);
        
      } else {
        const number = map.productDto.price;
        const formattedNumber = number.toLocaleString();
        col2Container.textContent = formattedNumber+'원';
      }
	  
  	  
  	  /* col2Container.textContent = map.productDto.price.toLocaleString() + '원'; */

  	  const col2DateContainer = document.createElement('div');
  	  col2DateContainer.classList.add('col-2', 'my-auto', 'text-center');
  	  col2DateContainer.textContent = formatTime(map.productDto.reg_date);

  	  const colButtonsContainer = document.createElement('div');
  	  colButtonsContainer.classList.add('col', 'my-auto', 'text-center');

  	  const buttonsRow = document.createElement('div');
  	  buttonsRow.classList.add('row');
  	  const buttonsCol = document.createElement('div'); 
	  buttonsCol.classList.add('col');

  	  const buttonSend = document.createElement('button');
  	  buttonSend.classList.add('btn', 'btn-sm', 'btn-outline-primary');
  	  buttonSend.style.width = '120px';
  	  buttonSend.textContent = '후기 보내기';
      buttonSend.setAttribute("onclick", "reviewModalOn("+map.productDto.user_id+","+map.productRequestDto.user_id+","+map.productRequestDto.id+")");

      buttonsCol.appendChild(buttonSend);
      buttonsRow.appendChild(buttonsCol);

  	  const buttonsRow2 = document.createElement('div');
  	  buttonsRow2.classList.add('row', 'mt-2');

  	  const buttonEditCol = document.createElement('div');
  	  buttonEditCol.classList.add('col', 'text-end', 'p-0');
  	  buttonEditCol.style.marginRight = '5px';

  	  const modifyAtag = document.createElement('a');
	  modifyAtag.href="/safari/used/updateProductRegister?productId="+map.productDto.id;
	  const buttonEdit = document.createElement('button');
	  buttonEdit.classList.add('btn', 'btn-sm', 'btn-outline-dark', 'px-3');
	  buttonEdit.textContent = '수정';

	  modifyAtag.appendChild(buttonEdit);
	  buttonEditCol.appendChild(modifyAtag);

  	  const buttonDeleteCol = document.createElement('div');
  	  buttonDeleteCol.classList.add('col', 'text-start', 'p-0');

  	 const deleteAtag = document.createElement('a');
	 deleteAtag.href="./deleteProduct?productId="+map.productDto.id;
	 
	 const buttonDelete = document.createElement('button');
	 buttonDelete.classList.add('btn', 'btn-sm', 'btn-outline-dark', 'px-3');
	 buttonDelete.textContent = '삭제';
	
	 deleteAtag.appendChild(buttonDelete);
	 buttonDeleteCol.appendChild(deleteAtag);

  	  buttonsRow2.appendChild(buttonEditCol);
  	  buttonsRow2.appendChild(buttonDeleteCol);

  	  colButtonsContainer.appendChild(buttonsRow);
  	  colButtonsContainer.appendChild(buttonsRow2);

  	  rowContainer.appendChild(col5Container);
  	  rowContainer.appendChild(col2Container);
  	  rowContainer.appendChild(col2DateContainer);
  	  rowContainer.appendChild(colButtonsContainer);
		  
	  listContainerBox.appendChild(rowContainer);
	}else{
		const rowContainer = document.createElement('div');
  	  rowContainer.classList.add('row', 'border-bottom', 'py-2');

  	  const col5Container = document.createElement('div');
  	  col5Container.classList.add('col-5');

  	  const rowImageDetails = document.createElement('div');
  	  rowImageDetails.classList.add('row', 'my-auto');

  	  const imageCol = document.createElement('div');
  	  imageCol.classList.add('col-3', 'ms-1');
  	  imageCol.style.float = 'left';

  	  const imageLink = document.createElement('a');
  	  imageLink.href = "/safari/used/productDetail?productId="+map.productDto.id;

  	  const image = document.createElement('img');
  	  image.src = "/safarifile/" + map.productImgDto.product_img_link;
  	  image.style.width = '120px';
  	  image.style.height = '120px';

  	  imageLink.appendChild(image);
  	  imageCol.appendChild(imageLink);

  	  const itemDetailsCol = document.createElement('div');
  	  itemDetailsCol.classList.add('col', 'ms-5', 'text-start');

  	  const itemCategoryRow = document.createElement('div');
  	  itemCategoryRow.classList.add('row', 'mt-4', 'mb-1');

  	  const itemCategoryCol = document.createElement('div');
  	  itemCategoryCol.classList.add('col', 'fw-light');
  	  itemCategoryCol.style.fontSize = '15px';
  	  itemCategoryCol.textContent = map.productMainCategoryDto.main_category_name + ' > ' + map.productSubCategoryDto.sub_category_name;
  	  itemCategoryRow.appendChild(itemCategoryCol);
  	  
  	  const itemNameRow = document.createElement('div');
  	  itemNameRow.classList.add('row');

  	  const itemNameCol = document.createElement('div');
  	  itemNameCol.classList.add('col', 'fw-bold');

  	  const span1 = document.createElement('span');
  	  span1.classList.add('d-inline-block','text-truncate');
	  span1.style.maxWidth = '186px';
	  span1.style.height = '22px';
	  const itemNameLink = document.createElement('a');
	  itemNameLink.href = '/safari/used/productDetail?productId='+map.productDto.id;
	  itemNameLink.style.fontSize = '17px';
	  itemNameLink.textContent = map.productDto.title;

	  
	  const span2 = document.createElement('span');
	  const statusButton = document.createElement('button');
	  statusButton.classList.add('btn', 'btn-secondary', 'btn-sm', 'btn-sm-custom', 'ms-2');
	  statusButton.disabled = true;
	  statusButton.style.padding = '1px 6px';
	  statusButton.style.fontSize = '13px';
	  statusButton.style.marginTop = '-3px';
	  statusButton.textContent = '거래완료';
	  span2.appendChild(statusButton);
	 
	  span1.appendChild(itemNameLink);
	  itemNameCol.appendChild(span1);
	  itemNameCol.appendChild(span2);
	 
	  itemNameRow.appendChild(itemNameCol);

  	  const itemLocationRow = document.createElement('div');
  	  itemLocationRow.classList.add('row');

  	  const itemLocationCol = document.createElement('div');
  	  itemLocationCol.classList.add('col', 'text-secondary');
  	  itemLocationCol.style.fontSize = '14px';
  	  itemLocationCol.textContent = map.productCityDto.product_city_name+ ' ' +map.productTownDto.product_town_name;

  	  itemLocationRow.appendChild(itemLocationCol);

  	  itemDetailsCol.appendChild(itemCategoryRow);
  	  itemDetailsCol.appendChild(itemNameRow);
  	  itemDetailsCol.appendChild(itemLocationRow);

  	  rowImageDetails.appendChild(imageCol);
  	  rowImageDetails.appendChild(itemDetailsCol);

  	  col5Container.appendChild(rowImageDetails);

  	  const col2Container = document.createElement('div');
  	  col2Container.classList.add('col-2', 'my-auto', 'text-center', 'fw-semibold');
  	  col2Container.style.fontSize = '17px';
  	  
  	  if (map.productDto.price == 0) {
        const btnShare = document.createElement("button");
        btnShare.type = "button";
        btnShare.classList.add("btn", "btn-warning", "px-2", "py-1");
        btnShare.disabled = true;
        btnShare.textContent = "나눔";
        col2Container.appendChild(btnShare);
        
      } else {
        const number = map.productDto.price;
        const formattedNumber = number.toLocaleString();
        col2Container.textContent = formattedNumber+'원';
      }
	  
  	  
  	 /*  col2Container.textContent = map.productDto.price.toLocaleString() + '원'; */

  	  const col2DateContainer = document.createElement('div');
  	  col2DateContainer.classList.add('col-2', 'my-auto', 'text-center');
  	  col2DateContainer.textContent = formatTime(map.productDto.reg_date);

  	  const colButtonsContainer = document.createElement('div');
  	  colButtonsContainer.classList.add('col', 'my-auto', 'text-center');

  	  const buttonsRow = document.createElement('div');
  	  buttonsRow.classList.add('row');
      const buttonsCol = document.createElement('div'); 
	  buttonsCol.classList.add('col');

  	  const buttonSendShow = document.createElement('button');
   	  buttonSendShow.classList.add('btn', 'btn-sm', 'btn-secondary');
  	  buttonSendShow.style.width = '120px';
      buttonSendShow.textContent = '보낸 후기 보기';
      buttonSendShow.setAttribute("onclick", "getMyWroteReviewHideAndShowMy("+map.productDto.user_id+","+map.productRequestDto.user_id+","+map.productRequestDto.id+")");

      buttonsCol.appendChild(buttonSendShow);
      buttonsRow.appendChild(buttonsCol);

  	  const buttonsRow2 = document.createElement('div');
  	  buttonsRow2.classList.add('row', 'mt-2');

  	  const buttonEditCol = document.createElement('div');
  	  buttonEditCol.classList.add('col', 'text-end', 'p-0');
  	  buttonEditCol.style.marginRight = '5px';

      const modifyAtag = document.createElement('a');
	  modifyAtag.href="/safari/used/updateProductRegister?productId="+map.productDto.id;
	  const buttonEdit = document.createElement('button');
	  buttonEdit.classList.add('btn', 'btn-sm', 'btn-outline-dark', 'px-3');
	  buttonEdit.textContent = '수정';

	  modifyAtag.appendChild(buttonEdit);
	  buttonEditCol.appendChild(modifyAtag);

  	  const buttonDeleteCol = document.createElement('div');
  	  buttonDeleteCol.classList.add('col', 'text-start', 'p-0');

  	 const deleteAtag = document.createElement('a');
	 deleteAtag.href="./deleteProduct?productId="+map.productDto.id;
	 
	 const buttonDelete = document.createElement('button');
	 buttonDelete.classList.add('btn', 'btn-sm', 'btn-outline-dark', 'px-3');
	 buttonDelete.textContent = '삭제';
	
	 deleteAtag.appendChild(buttonDelete);
	 buttonDeleteCol.appendChild(deleteAtag);

  	  buttonsRow2.appendChild(buttonEditCol);
  	  buttonsRow2.appendChild(buttonDeleteCol);

  	  colButtonsContainer.appendChild(buttonsRow);
  	  colButtonsContainer.appendChild(buttonsRow2);

  	  rowContainer.appendChild(col5Container);
  	  rowContainer.appendChild(col2Container);
  	  rowContainer.appendChild(col2DateContainer);
  	  rowContainer.appendChild(colButtonsContainer);
		  
	  listContainerBox.appendChild(rowContainer); 
	}
}
const writeReviewModal = bootstrap.Modal.getOrCreateInstance('#writeReviewModalMy');
//리뷰모달 열기
function  reviewModalOn(senderId, receiverId, requestId) {

	// 리뷰 모달 열기 전 정보 가져오기
	getReviewInformation(senderId, receiverId, requestId);
	
	// 열 때
	
	writeReviewModal.show();

}

//리뷰 모달 열기 전 정보 가져오기
function getReviewInformation(senderId, receiverId, requestId) {
	// 거래후기 모달 창 헤더
	const modalHeaderWrapperBox = document.getElementById('modalHeaderWrapper2My');
	
	
	// 거래후기 모달 창 바디
	const modalBodyBox = document.getElementById('modalBody2My');
	
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
	    if(xhr.readyState == 4 && xhr.status == 200){
	        const response = JSON.parse(xhr.responseText);
	
	        modalHeaderWrapperBox.innerHTML = "";
	        modalBodyBox.innerHTML = "";
	
	        // header
	        const row1 = document.createElement('div');
	        row1.classList.add('row');
	
	        const col1 = document.createElement('div');
	        col1.classList.add('col-2', 'p-0');
	      	const col1Img = document.createElement("img");
	      	col1Img.alt = response.map.productDto.title;
	      	col1Img.src = '/safarifile/' + response.map.productImgDto.product_img_link;
	      	col1Img.classList.add('img-fluid');
	
	      	const col2 = document.createElement('div');
	        col2.classList.add('col', 'mt-3', 'ms-1');
	
	      	const col2row1 = document.createElement('div');
	      	col2row1.classList.add('row');
	        const col2row1col1 = document.createElement('div');
	        col2row1col1.classList.add('col', 'fw-bold');
	        /* col2row1col1.textContent = '에어팟 프로'; */
	        col2row1col1.textContent = response.map.productDto.title;
	
	        const col2row2 = document.createElement('div');
	      	col2row2.classList.add('row');
	        const col2row2col1 = document.createElement('div');
	        col2row2col1.classList.add('col-auto');
	        col2row2col1.textContent = '거래한 이웃'
	
	        const col2row2col2 = document.createElement('div');
	        col2row2col2.classList.add('fw-bold', 'm-0', 'col-auto', 'p-0');
	        /* span.textContent = '피자죠아'; */
	        col2row2col2.textContent = response.map.receiverDto.nickname;
	
	        row1.appendChild(col1);
	        col1.appendChild(col1Img);
	        row1.appendChild(col2);
	        col2.appendChild(col2row1);
	        col2row1.appendChild(col2row1col1);
	        col2.appendChild(col2row2);
	        col2row2.appendChild(col2row2col1);
	        col2row2.appendChild(col2row2col2);
	
	        modalHeaderWrapperBox.appendChild(row1);
	
	
	        // body
	        // First row
	        const firstRow = document.createElement("div");
	        firstRow.classList.add("row");
	
	        const firstCol = document.createElement("div");
	        firstCol.classList.add("col", "fw-bold");
	        /* firstCol.textContent = "바니바니님,"; */
	        firstCol.textContent = response.map.senderDto.nickname+"님,";
	
	        firstRow.appendChild(firstCol);
	
	        modalBodyBox.appendChild(firstRow);
	
	        // Second row
	        const secondRow = document.createElement("div");
	        secondRow.classList.add("row");
	
	        const secondCol = document.createElement("div");
	        secondCol.classList.add("col", "fw-bold");
	        secondCol.textContent = response.map.receiverDto.nickname+"님과 거래가 어떠셨나요?";
	
	        secondRow.appendChild(secondCol);
	
	        modalBodyBox.appendChild(secondRow);
	
	        // Third row
	        const thirdRow = document.createElement("div");
	        thirdRow.classList.add("row");
	
	        const thirdCol = document.createElement("div");
	        thirdCol.classList.add("col", "text-secondary", "onlyme", "mt-1");
	        thirdCol.textContent = "거래 선호도는 나만 볼 수 있어요";
	
	        thirdRow.appendChild(thirdCol);
	
	        modalBodyBox.appendChild(thirdRow);
	
	        // Fourth row
	        const fourthRow = document.createElement("div");
	        fourthRow.classList.add("row", "mt-4");
	
	        // 평가 카테고리
	        for(data of response.map.usedReviewRateCategoryDto){
	        	// 평가 list
	            const col4 = document.createElement("div");
	            col4.classList.add("col-4", "text-center");
	
	            const img4 = document.createElement("img");
	            img4.classList.add("opacity-25", "btn-bunny");
	            img4.alt = data.img_title;
	            img4.src = "/safari/resources/img/used/"+data.img_title+".png";
	            img4.width = 70;
	            img4.height = 70;
	            img4.setAttribute("onclick", data.img_title+"Change("+data.id+","+senderId+","+receiverId+","+requestId+")");
	            img4.id=data.img_title+"Img";
	
	            const p4 = document.createElement("p");
	            p4.classList.add("text-secondary", "fw-semibold", "mt-1");
	            p4.textContent = data.content;
	            p4.id = data.img_title+"Text";
	
	            col4.appendChild(img4);
	            col4.appendChild(p4);
	
	            fourthRow.appendChild(col4);
	
	        }
	
	        const rateCheckContainer = document.createElement("div");
	        rateCheckContainer.classList.add("container");
	        rateCheckContainer.id = 'rateCheckContainer';
	
	        modalBodyBox.appendChild(fourthRow);
	        modalBodyBox.appendChild(rateCheckContainer);
	
	
	    }
	}
	//get
	xhr.open("get", "../used/getReviewHeaderAndBody?senderId="+senderId+"&receiverId="+receiverId+"&requestId="+requestId);
	xhr.send();
}

//modal 닫을 때
function modalHide(id) {
	const modalId = '#'+ id;
	const myModal = bootstrap.Modal.getOrCreateInstance(modalId);
	   myModal.hide();
}


// 현재 모달창 닫고 내가 썼던 리뷰 보여주기
function getMyWroteReviewHideAndShowMy(senderId, receiverId, requestId){
	const modalBodyBox = document.getElementById('modalBody3My');
	
	// 열 때
	const wroteReviewModal = bootstrap.Modal.getOrCreateInstance('#myWroteReviewModalMy');

	const xhr = new XMLHttpRequest();
	modalBodyBox.innerHTML = "";
	xhr.onreadystatechange = function(){
        if(xhr.readyState == 4 && xhr.status == 200){

            const response = JSON.parse(xhr.responseText);
            console.log(response.map.usedPurchaseReviewDto.review_img_link);
            console.log(response.map.usedPurchaseReviewDto.review_comment);
         // Create elements
            const row1 = document.createElement('div');
            row1.className = 'row';
            const col1 = document.createElement('div');
            col1.className = 'col fw-bold';
            col1.textContent = response.map.receiverDto.nickname+'님에게';
            row1.appendChild(col1);

            const row2 = document.createElement('div');
            row2.className = 'row';
            const col2 = document.createElement('div');
            col2.className = 'col fw-bold';
            col2.textContent = '따뜻한 후기를 보냈어요.';
            row2.appendChild(col2);

            const row3 = document.createElement('div');
            row3.className = 'row mt-1';
            const col3 = document.createElement('div');
            col3.className = 'col text-secondary onlyme';
            col3.textContent = response.map.receiverDto.nickname + '과 '+ response.map.productDto.title +'을(를) 거래했어요.';
            row3.appendChild(col3);

            // 리뷰에 사진이 없고 내용도 없을 때
            if(response.map.usedPurchaseReviewDto.review_img_link == 'n' && response.map.usedPurchaseReviewDto.review_comment == 'n'){
            	const row4 = document.createElement('div');
 	            row4.className = 'row mt-2';
 	            const col4 = document.createElement('div');
 	            col4.className = 'col';
 	            const img = document.createElement('img');
 	            img.alt = 'review';
 	            img.height = '180';
 	            img.id = 'reviewImg2';
 	            img.className = 'object-fit-cover';
            	img.src = '/safari/resources/img/used/review2.jpeg';
            	col4.appendChild(img);
	            row4.appendChild(col4);

	            const reviewContentDiv = document.createElement('div');
	            reviewContentDiv.className = 'reviewContent mb-3';

	            const row5 = document.createElement('div');
	            row5.className = 'row mt-3 mb-1';

	            reviewContentDiv.appendChild(row5);

	            const ul = document.createElement('ul');
	            for (data of response.map.usedReviewCheckboxCategotyDtoList) {
	              const li = document.createElement('li');
	              li.className = 'mb-1';
	              li.textContent = data.content;
	              ul.appendChild(li);
	            }

	            reviewContentDiv.appendChild(ul);

	            modalBodyBox.appendChild(row1);
	            modalBodyBox.appendChild(row2);
	            modalBodyBox.appendChild(row3);
	            modalBodyBox.appendChild(row4);
	            modalBodyBox.appendChild(reviewContentDiv);

	            // 상대방이 쓴 리뷰가 있다면
	            if(response.map.recevierReviewCount>0){
	            	const row6 = document.createElement('div');
	 	            row6.className = 'row mb-3';
	 	            const col6 = document.createElement('div');
	 	            col6.className = 'col d-grid';

	 	            const receiverButton = document.createElement("button");
	 	            receiverButton.classList.add("btn", "orangeButton");
	 	            receiverButton.id = "recieverButton";
	 	            receiverButton.textContent = "받은 거래 후기 보기";
		            receiverButton.setAttribute("onclick", "getReceiverWroteReviewHideAndShow("+receiverId+","+senderId+","+requestId+")");

		            row6.appendChild(col6);
		            col6.appendChild(receiverButton);
		            modalBodyBox.appendChild(row6);
	            }
            }
            // 리뷰에 사진이 있을 떄
            else if(response.map.usedPurchaseReviewDto.review_img_link != 'n' && response.map.usedPurchaseReviewDto.review_comment == 'n'){
            	const row4 = document.createElement('div');
 	            row4.className = 'row mt-2';
 	            const col4 = document.createElement('div');
 	            col4.className = 'col';
 	            const img = document.createElement('img');
 	            img.alt = 'review';
 	            img.height = '180';
 	            img.id = 'reviewImg2';
            	img.src = '/safarifile/' + response.map.usedPurchaseReviewDto.review_img_link;
            	img.className = 'object-fit-cover';

            	col4.appendChild(img);
	            row4.appendChild(col4);

	            const reviewContentDiv = document.createElement('div');
	            reviewContentDiv.className = 'reviewContent mb-3';

	            const row5 = document.createElement('div');
	            row5.className = 'row mt-3 mb-1';

	            reviewContentDiv.appendChild(row5);

	            const ul = document.createElement('ul');
	            for (data of response.map.usedReviewCheckboxCategotyDtoList) {
	              const li = document.createElement('li');
	              li.className = 'mb-1';
	              li.textContent = data.content;
	              ul.appendChild(li);
	            }

	            reviewContentDiv.appendChild(ul);

	            modalBodyBox.appendChild(row1);
	            modalBodyBox.appendChild(row2);
	            modalBodyBox.appendChild(row3);
	            modalBodyBox.appendChild(row4);
	            modalBodyBox.appendChild(reviewContentDiv);

	         // 상대방이 쓴 리뷰가 있다면
	            if(response.map.recevierReviewCount>0){
	            	const row6 = document.createElement('div');
	 	            row6.className = 'row';
	 	            const col6 = document.createElement('div');
	 	            col6.className = 'col d-grid';

	 	            const receiverButton = document.createElement("button");
	 	            receiverButton.classList.add("btn", "orangeButton");
	 	            receiverButton.id = "recieverButton";
	 	            receiverButton.textContent = "받은 거래 후기 보기";
		            receiverButton.setAttribute("onclick", "getReceiverWroteReviewHideAndShow("+receiverId+","+senderId+","+requestId+")");

		            row6.appendChild(col6);
		            col6.appendChild(receiverButton);
		            modalBodyBox.appendChild(row6);
	            }

            }else if(response.map.usedPurchaseReviewDto.review_img_link == 'n' && response.map.usedPurchaseReviewDto.review_comment != 'n'){
            	const row4 = document.createElement('div');
 	            row4.className = 'row mt-2';
 	            const col4 = document.createElement('div');
 	            col4.className = 'col';
 	            const img = document.createElement('img');
 	            img.alt = 'review';
 	            img.height = '180';
 	            img.id = 'reviewImg2';
            	img.src = '/safari/resources/img/used/review2.jpeg';
            	img.className = 'object-fit-cover';
            	col4.appendChild(img);
	            row4.appendChild(col4);

	            const reviewContentDiv = document.createElement('div');
	            reviewContentDiv.className = 'reviewContent mb-3';

	            const row5 = document.createElement('div');
	            row5.className = 'row mt-3 mb-1';

	            const col5 = document.createElement('div');
	            col5.className = 'col ms-3';
	            col5.textContent = response.map.usedPurchaseReviewDto.review_comment;
	            row5.appendChild(col5);

	            reviewContentDiv.appendChild(row5);

	            const ul = document.createElement('ul');
	            for (data of response.map.usedReviewCheckboxCategotyDtoList) {
	              const li = document.createElement('li');
	              li.className = 'mb-1';
	              li.textContent = data.content;
	              ul.appendChild(li);
	            }

	            reviewContentDiv.appendChild(ul);

	            modalBodyBox.appendChild(row1);
	            modalBodyBox.appendChild(row2);
	            modalBodyBox.appendChild(row3);
	            modalBodyBox.appendChild(row4);
	            modalBodyBox.appendChild(reviewContentDiv);

	            // 상대방이 쓴 리뷰가 있다면
	            if(response.map.recevierReviewCount>0){
	            	const row6 = document.createElement('div');
	 	            row6.className = 'row';
	 	            const col6 = document.createElement('div');
	 	            col6.className = 'col d-grid';

	 	            const receiverButton = document.createElement("button");
	 	            receiverButton.classList.add("btn", "orangeButton");
	 	            receiverButton.id = "recieverButton";
	 	            receiverButton.textContent = "받은 거래 후기 보기";
		            receiverButton.setAttribute("onclick", "getReceiverWroteReviewHideAndShow("+receiverId+","+senderId+","+requestId+")");

		            row6.appendChild(col6);
		            col6.appendChild(receiverButton);
		            modalBodyBox.appendChild(row6);
	            }

            }else{
            	const row4 = document.createElement('div');
 	            row4.className = 'row mt-2';
 	            const col4 = document.createElement('div');
 	            col4.className = 'col';
 	            const img = document.createElement('img');
 	            img.alt = 'review';
 	            img.height = '180';
 	            img.id = 'reviewImg2';
            	img.src = '/safarifile/' + response.map.usedPurchaseReviewDto.review_img_link;
            	img.className = 'object-fit-cover';


            	col4.appendChild(img);
	            row4.appendChild(col4);

	            const reviewContentDiv = document.createElement('div');
	            reviewContentDiv.className = 'reviewContent mb-3';

	            const row5 = document.createElement('div');
	            row5.className = 'row mt-3 mb-1';

	            const col5 = document.createElement('div');
	            col5.className = 'col ms-3';
	            col5.textContent = response.map.usedPurchaseReviewDto.review_comment;
	            row5.appendChild(col5);

	            reviewContentDiv.appendChild(row5);

	            const ul = document.createElement('ul');
	            for (data of response.map.usedReviewCheckboxCategotyDtoList) {
	              const li = document.createElement('li');
	              li.className = 'mb-1';
	              li.textContent = data.content;
	              ul.appendChild(li);
	            }

	            reviewContentDiv.appendChild(ul);

	            modalBodyBox.appendChild(row1);
	            modalBodyBox.appendChild(row2);
	            modalBodyBox.appendChild(row3);
	            modalBodyBox.appendChild(row4);
	            modalBodyBox.appendChild(reviewContentDiv);

	            // 상대방이 쓴 리뷰가 있다면
	            if(response.map.recevierReviewCount>0){
	            	const row6 = document.createElement('div');
	 	            row6.className = 'row';
	 	            const col6 = document.createElement('div');
	 	            col6.className = 'col d-grid';

	 	            const receiverButton = document.createElement("button");
	 	            receiverButton.classList.add("btn", "orangeButton");
	 	            receiverButton.id = "recieverButton";
	 	            receiverButton.textContent = "받은 거래 후기 보기";
		            receiverButton.setAttribute("onclick", "getReceiverWroteReviewHideAndShow("+receiverId+","+senderId+","+requestId+")");

		            row6.appendChild(col6);
		            col6.appendChild(receiverButton);
		            modalBodyBox.appendChild(row6);
	            }
            }

           /*  col4.appendChild(img);
            row4.appendChild(col4);

            const reviewContentDiv = document.createElement('div');
            reviewContentDiv.className = 'reviewContent';

            // 리뷰에 직접 작성한 내용이 없을 떄
            if(response.map.usedPurchaseReviewDto.review_comment == 'n'){
            	const row5 = document.createElement('div');
	            row5.className = 'row mt-3 mb-1';
            }
            // 리뷰에 직접 작성한 내용이 있을 떄
            else{
            	const row5 = document.createElement('div');
	            row5.className = 'row mt-3 mb-1';
	            const col5 = document.createElement('div');
	            col5.className = 'col ms-3';
	            col5.textContent = response.map.usedPurchaseReviewDto.review_comment;
	            row5.appendChild(col5);
            } */

            /* const ul = document.createElement('ul');
            // 체크박스 list
            for(data of response.map.usedReviewCheckboxCategotyDtoList){
            	const li = document.createElement('li');
	            li.className = 'mb-1';
	            li.textContent = data.content;
	            console.log(data.content);
	            ul.appendChild(li);
            }

            reviewContentDiv.appendChild(row5);
            reviewContentDiv.appendChild(ul);

            modalBodyBox.appendChild(row1);
            modalBodyBox.appendChild(row2);
            modalBodyBox.appendChild(row3);
            modalBodyBox.appendChild(row4);
            modalBodyBox.appendChild(reviewContentDiv);
             */
        }
    }
	//get
	xhr.open("get", "../used/getMyWroteReview?senderId="+senderId+"&receiverId="+receiverId+"&requestId="+requestId);
	xhr.send();

	wroteReviewModal.show();


}


//날짜 변환 함수	
function formatTime(timestamp) {
	  const date = new Date(timestamp);
	  const year = date.getFullYear();
	  const month = String(date.getMonth() + 1).padStart(2, '0');
	  const day = String(date.getDate()).padStart(2, '0');


	  const formattedDate = year + '.' + month + '.' + day;
	  return formattedDate;
	}

// 예약중에서 거래 요청으로 바꾸기
function productRequestStatusCancelByProduct(productId, statusId) {

	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function(){
	    if(xhr.readyState == 4 && xhr.status == 200){
	        const response = JSON.parse(xhr.responseText);
	        getMySellListByStatus(statusId);
	    }
	}
	//get
	xhr.open("get", "./productRequestStatusCancelByProduct?productId="+productId);
	xhr.send();
} 

// 2일 12시간 - (reg_date - today)
function getTimeDifference(reg_date) {
	  // 현재 시간 구하기
	  console.log(reg_date);
	  const now = new Date();

	  // 2일 12시간 후의 시간 구하기 (단위: 밀리초)
	  const targetTime = new Date(now);
	  targetTime.setDate(targetTime.getDate() + 2);
	  targetTime.setHours(targetTime.getHours() + 12);

	  // 시간 차이 계산 (단위: 밀리초)
	  const timeDiffInMilliseconds = targetTime - reg_date;

	  // 일, 시간, 분 계산
	  const days = Math.floor(timeDiffInMilliseconds / (1000 * 60 * 60 * 24));
	  const hours = Math.floor((timeDiffInMilliseconds % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
	  const minutes = Math.floor((timeDiffInMilliseconds % (1000 * 60 * 60)) / (1000 * 60));

	  // 결과 문자열 생성
	  let result = '';
	  if (days > 0) {
	    result += `${days}일 `;
	  }
	  if (hours > 0) {
	    result += `${hours}시간 `;
	  }
	  if (minutes > 0) {
	    result += `${minutes}분`;
	  }
	  console.log();
	// 음수일 경우
	  if (timeDiffInMilliseconds < 0) {
	    return '끌올';
	  }else{
	  	return result; // 결과 문자열의 앞뒤 공백 제거
	  }
	}

// 끌올 가능 모달 열기
function showUpdateTimeModal(productId) {
	const updateRegDate1Modal = bootstrap.Modal.getOrCreateInstance('#updateRegDate1');
	updateRegDate1Modal.show();
}

// 끌올 못하는 모달 열기
function showNoUpdateTimeModal(productId) {
	const updateRegDate2Modal = bootstrap.Modal.getOrCreateInstance('#updateRegDate2');
	updateRegDate2Modal.show();
}


window.addEventListener("DOMContentLoaded", function(){
	getMySellListByStatus(0);	
});

</script>
</body>	
</html>