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

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<link rel="stylesheet" href="/safari/resources/style/common.css" type="text/css">
<link rel="stylesheet" href="/safari/resources/style/auction.css" type="text/css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
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
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">1:1문의</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">리뷰관리</a></li>
				</ul>
			</div>
			
		
		  <li class="list-group-item border border-0 pb-0"><a class="btn fs-5 text fw-bold py-1" href="#collapse1">중고</a></li>
		  	<div class="" id="">
				<ul class="list-group ms-4">
					<li class="list-group-item border-0"><a href="../used/chatList" class="btn py-0 text-body-secondary">채팅방 목록</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">리스트제목</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">리스트제목</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">리스트제목</a></li>
				</ul>
			</div>
			
		  <li class="list-group-item border border-0 pb-0"><a class="btn fs-5 text fw-bold py-1" href="#">대여</a></li>
		  	<div class="" id="">
				<ul class="list-group ms-4">
					<li class="list-group-item border-0"><a href="./myOrderListPage" class="btn py-0 text-body-secondary">오더리스트</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">리스트제목</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">리스트제목</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">리스트제목</a></li>
				</ul>
			</div>
			
		  <li class="list-group-item border border-0 pb-0"><a class="btn fs-5 text fw-bold py-1" href="/safari/auction/myPage" >경매</a></li>
		  	<div class="" id="">
				<ul class="list-group ms-4">
					<li class="list-group-item border-0"><a href="/safari/auction/bidList" class="btn py-0 text-body-secondary">입찰목록</a></li>
					<li class="list-group-item border-0"><a href="/safari/auction/successBidList" class="btn py-0 text-body-secondary">낙찰목록</a></li>
					<li class="list-group-item border-0"><a href="/safari/auction/wishList" class="btn py-0 text-body-secondary">찜</a></li>
					<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">구매한 상품</a></li>
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
		
	<div class="pt-2 w-100">
		<div class="row">
			<div class="col ms-4">
				<div class="row mb-2">
					<div class="col fw-bold fs-4">
					    내가 낙찰한 목록
					</div>
				</div>
				
				<div class="row mt-3">
					<div class="col">
						
						<table class="table align-middle">
							<thead class="table-secondary p-2 fs-5">
								<tr class="text-center">
									<th>상품정보</th>
									<th>낙찰가</th>
									<th>낙찰시간</th>
									<th>경매종료일</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody>
							   <c:if test="${empty successBidList}">
							        <tr>
							            <td colspan="5" class="text-center">낙찰한 정보가 없습니다.</td>
							        </tr>
							    </c:if>					
								<c:forEach items="${successBidList}" var="bidDto">
									
	
									<input type="hidden" id="user_id_${bidDto.auction_item_id}" value="${sessionUser.id}">
				
									
									<tr>
										<td>
											<div class="row">
												<input type="hidden" id="bid_${bidDto.auction_item_id}" value="${bidDto.id}">
												<div class="col" id="aid_${bidDto.auction_item_id}">
													
													<a href="/safari/auction/productDetail/${bidDto.auction_item_id}">
													<img class="me-3"
													src="/auctionFiles/${bidDto.auction_item_img_link}" style="
													position: relative; left: 30px; max-width: 120px; max-height: 120px;"></a>
												</div>
												<div class="col-8" class="text-start">
													<div class="row mt-4">
														<div class="col">
															${bidDto.main_category_name} > ${bidDto.sub_category_name}
														</div>
													</div>
													<div class="row">
														<div class="col fw-bold fs-5">
														<input type="hidden" value="${bidDto.auction_item_id}">
															<a href="/safari/auction/productDetail/${bidDto.auction_item_id}">
															${bidDto.title}</a>
														<input type="hidden" id="title_${bidDto.auction_item_id}" value="${bidDto.title}">	
														</div>
													</div>
												</div>									
											</div>
										</td>
										<td class="text-center fw-bold text-danger">
											<fmt:formatNumber value="${bidDto.bid_price}"  pattern="#,###"/>원
											<input type="hidden" id="bid_price_${bidDto.auction_item_id}" value="${bidDto.bid_price}">
										</td>
										<td class="text-center">
											<fmt:formatDate value="${bidDto.reg_date}" pattern="yyyy.MM.dd" />
											<br>
											<fmt:formatDate value="${bidDto.reg_date}" pattern="a hh:mm" />
										</td>
										<td class="text-center">
											<fmt:formatDate value="${bidDto.end_date}" pattern="yyyy.MM.dd" />
											<br>
											<fmt:formatDate value="${bidDto.end_date}" pattern="a hh:mm" />
										</td>
										<td class="text-center">
											<div class="row">
												<div class="col">
													결제대기중
												</div>
											</div>
											<div class="row mt-2">
												<div class="col">
													<input type="button" onclick="kakaoPayModal(${bidDto.auction_item_id})" class="btn btn-sm btn-dark" value="결제하기">
												</div>
											</div>
										</td>							
																	
									</tr>
							</c:forEach>
							
							
							</tbody>
						
						</table>
					
					</div>
				
				</div>
				
				
				<div class="row mt-5">
					<div class="col">
						
						<div class="row mt-2 ms-2">
							<div class="col">
								<div class="row fw-bold fs-5">
									<div class="col">
										
									</div>
								</div>
							
							</div>
						</div>
						
					</div>
					<div class="col-1"></div>
					<div class="col">
						
					</div>			
				</div>
			</div>
		</div>
	</div>
</div>

	
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->
	


<script>

// 카카오페이 결제 창
function kakaoPayModal(index) {
		
   const cid = 'TC0ONETIME';
   const partner_order_id = document.getElementById("bid_" + index).value;
   const partner_user_id = document.getElementById("user_id_" + index).value;
   const item_name = document.getElementById("title_" + index).value;
   //const item_code = document.getElementById("aid_" + index).value;
   const quantity = 1;
   const total_amount = document.getElementById("bid_price_" + index).value;
   const tax_free_amount = 0;
   const approval_url = "http://localhost:8181/safari/auction/paymentProcess";
   const cancel_url = "http://localhost:8181/safari/auction/successBidList";
   const fail_url = "http://localhost:8181/safari/auction/successBidList";
   

	
   const xhr = new XMLHttpRequest();
   
   xhr.onreadystatechange = function() {
	   if (xhr.readyState === XMLHttpRequest.DONE) {
	   if (xhr.status === 200) {
           const response = JSON.parse(xhr.responseText);
           
           location.href = response.next_redirect_pc_url;
           
           
           console.log("cid:" ,response.cid);
           console.log("partner_order_id: ",response.partner_order_id);
           console.log("partner_user_id: " ,response.partner_user_id);
           console.log("item_name: " ,response.item_name);
           //console.log(response.item_code);
           console.log("quantity: " ,response.quantity);
           console.log("total_amount: " ,response.total_amount);
           console.log("tax_Free: " ,response.tax_free_amount);
           console.log("tid: ",response.tid);
           
           
           // tid 무조건 받아와야함.
           const tid = response.tid;
          	
           // tid를 세션에 저장
           saveAuctionTidToSession(cid, partner_order_id, partner_user_id, tid, item_name, response.next_redirect_pc_url);
           
       } else {
    	   
       }
	   }
   };	
   
   
   xhr.open("POST", "https://kapi.kakao.com/v1/payment/ready");
   xhr.setRequestHeader("Authorization", "KakaoAK 88927c6d047da3940394d71e197276c3");
   xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
   xhr.send("cid="+cid+"&partner_order_id="+partner_order_id+"&partner_user_id="+partner_user_id+"&item_name="+item_name+
		   "&quantity="+quantity+"&total_amount="+total_amount+"&tax_free_amount="+tax_free_amount+
		   "&approval_url="+approval_url+"&cancel_url="+cancel_url+"&fail_url="+fail_url);
 
}

// tid 세션에 저장
 function saveAuctionTidToSession(cid, partner_order_id, partner_user_id, tid, item_name, 
		 next_redirect_pc_url) {
	
	 	const xhr = new XMLHttpRequest();


	    xhr.onreadystatechange = function() {
	        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
	            
	        	//openNewWindow(next_redirect_pc_url);
	        	window.open(next_redirect_pc_url, "_blank");
	        	
	        }
	    };
	    
	    xhr.open("post", "/safari/auction/saveAuctionTidToSession");
	    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	    xhr.send("cid="+cid+"&partner_order_id="+partner_order_id+"&partner_user_id="+partner_user_id+"&tid="+tid+"&item_name="+item_name);	
		
}






</script>




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	
</body>
</html>