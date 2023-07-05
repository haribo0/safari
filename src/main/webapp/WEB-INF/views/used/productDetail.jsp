<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사파리 | 중고메인</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<link rel="stylesheet" href="/safari/resources/style/common.css" type="text/css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">


<script>
	const productId = new URLSearchParams(location.search).get("productId");
  
  	let mySessionId = null;
  
  	function getSessionId() {
		const xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				//map 갖고오기
				const response = JSON.parse(xhr.responseText);
				//js 작업
				if(response.result == "success"){
					mySessionId = response.id;
				}
			}
		}
		
		//get
		xhr.open("get", "./getMyId", false); // 딱 여기만 쓰세요... false 동기식 호출/ 권장 X
		xhr.send();
	}
  	
  	function refreshTotalLikeCount() {
		const xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				//map 갖고오기
				const response = JSON.parse(xhr.responseText);
				//js 작업
				if(response.result == "success"){
					const totalLikeCountBox = document.getElementById("totalLikeCount");
					totalLikeCountBox.innerText = response.count;
				}
			}
		}
		
		//get
		xhr.open("get", "./getTotalLikeCount?productId="+productId); // 딱 여기만 쓰세요... false 동기식 호출/ 권장 X
		xhr.send();
	}
  	
  	function toggleLike() {
		const xhr = new XMLHttpRequest();
		
		if(mySessionId==null){
			if(confirm("로그인을 하셔야 이용하실 수 있습니다. 로그인하시겠습니까?")){
				location.href = "../user/loginPage";
			}
			return;
		}
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				//map 갖고오기
				const response = JSON.parse(xhr.responseText);
				//js 작업
				if(response.result == "success"){
					refreshTotalLikeCount();
					refreshMyHeart();
				}
			}
		}
		
		//get
		xhr.open("get", "./toggleLike?productId="+productId); 
		xhr.send();
	}

  	function refreshMyHeart() {
		const xhr = new XMLHttpRequest();
		
		if(mySessionId == null) return;
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				//map 갖고오기
				const response = JSON.parse(xhr.responseText);
				//js 작업
				if(response.result == "success"){
					const heartBox = document.getElementById("heartBox");
					if(response.isLiked){
						heartBox.classList.remove("bi-heart");
						heartBox.classList.add("bi-heart-fill");
					}else{
						heartBox.classList.remove("bi-heart-fill");
						heartBox.classList.add("bi-heart");
					}
				}
			}
		}
		
		//get
		xhr.open("get", "./isLiked?productId="+productId); 
		xhr.send();
	}


	window.addEventListener("DOMContentLoaded", function() {
		//사실상 시작 시점...
		getSessionId();
		refreshTotalLikeCount();
		refreshMyHeart();
	});
  </script>

</head>
<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->

<div class="container main_box">
  <div class="row mt-2">
    <div class="col-2"></div>
	<div class="col-4">
	  <div id="carouselExampleDark" class="carousel carousel-dark slide">
	    <div class="carousel-indicators">
	      <c:forEach items="${list}" var="ProductImgDto" varStatus="status">
	        <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="${status.index}" class="${status.first ? 'active' : ''}" aria-label="Slide ${status.index + 1}"></button>
	      </c:forEach>
	    </div>
	    <div class="carousel-inner">
	      <c:forEach items="${list}" var="ProductImgDto" varStatus="status">
	        <div class="carousel-item ${status.first ? 'active' : ''}" data-bs-interval="10000">
	          <img src="/safarifile/${ProductImgDto.product_img_link}" class="d-block w-100" alt="..." width="300" height="450">
	          <div class="carousel-caption d-none d-md-block"></div>
	        </div>
	      </c:forEach>
	    </div>
	    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
	      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	      <span class="visually-hidden">Previous</span>
	    </button>
	    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
	      <span class="carousel-control-next-icon" aria-hidden="true"></span>
	      <span class="visually-hidden">Next</span>
	    </button>
	  </div>
	</div>
    <div class="col ms-4">
    	<h5></h5>
    	<div><h5 class="fw-bold mt-5">${map.productDto.title }</h5></div>
    	<c:if test="${reservationCount > 0 }">
    	<div><button type="button" class="btn btn-outline-success btn-sm" disabled>예약중</button></div>
    	</c:if>
    	<c:if test="${completeCount > 0 }">
    	<div><button type="button" class="btn btn-outline-success btn-sm" disabled>거래완료</button></div>
    	</c:if>
    	<c:choose>
			<c:when test="${map.productDto.price == 0}">
				<button type="button" class="btn btn-warning btn-sm col-1 p-0 text-black mb-1" disabled>나눔</button>
			</c:when>
			<c:otherwise>
				        <h5 class="fw-bold mb-1 mt-2"><fmt:formatNumber value="${map.productDto.price}" pattern="#,##0" /></h5>
			</c:otherwise>
		</c:choose>
		<h6 class="mt-4">위치 : ${map.productCityDto.product_city_name } ${map.productTownDto.product_town_name }</h6>
		<h6>거래희망 장소 :  ${map.productDto.location }</h6>
        <h6>조회수 :  ${map.productDto.views }</h6>
        <h6>등록일 : <fmt:formatDate value="${map.productDto.reg_date}" pattern="yyyy-MM-dd HH:mm:ss"/></h6>
    	<div class="row">
    		<div class="col ms-3">
  						<i id="heartBox" onclick="toggleLike()" class="fs-2 bi bi-heart"></i> <span id="totalLikeCount"></span>
  						 &nbsp;&nbsp;&nbsp;<i class="bi bi-chat-dots-fill fs-2"></i> ${requestCount}
			</div>
    	</div>
    	
    	<div class="row mt-5">
    		<c:if test="${sessionUser.getId() != map.productDto.user_id }">
    		<div class="col-3">
    			<c:if test="${result==false && completeCount == 0 }">
    				<a href="./productRequest?productId=${map.productDto.id }" type="button" class="btn btn-outline-success btn-sm">채팅하기</a>
    			</c:if >
    			 <c:if test="${result==true && completeCount == 0 }">
    				<a href="./productRequestAlready?productId=${map.productDto.id }" type="button" class="btn btn-outline-success btn-sm">채팅하기</a>
    			</c:if>
    			 <c:if test="${completeCount > 0}">
    			 	<button type="button" class="btn btn-outline-secondary btn-sm" disabled>채팅하기</button>
    			 </c:if>
    		</div>
    		</c:if>
    		<div class="col-2">
    		<a href="./mainPage" type="button" class="btn btn-dark btn-sm">목록</a>
    		</div>
	    	<c:if test="${sessionUser != null && sessionUser.id == map.productDto.user_id}">
	    	<div class="col-2">
	    	<a href="./updateProductRegister?productId=${map.productDto.id }" type="button" class="btn btn-dark btn-sm">수정</a>
	    	</div>
	    	<div class="col-2">
	    	<a href="./deleteProduct?productId=${map.productDto.id }" type="button" class="btn btn-dark btn-sm">삭제</a>
	    	</div>
	    	</c:if>
	    	
    	</div>
 	 </div>
	</div>
	<div class="row">
		<div class="col-1"></div>
		<div class="col mt-5 mb-3" style="border-top: 2px solid black;"></div>
		<div class="col-1"></div>
	</div>
	<div class="row">
		<div class="col-1"></div>
		<div class="col mt-3 mb-2 fs-4 fw-bold">상세 설명</div>
		<div class="col-1"></div>
	</div>
	<div class="row">
		<div class="col-1"></div>
		<div class="col mt-2 mb-5">${map.productDto.content }</div>
		<div class="col-1"></div>
	</div>
	
	<%-- <c:if test="${sessionUser.getId() == map.productDto.user_id }">
	<div class="row mb-4">
		<div class="col-1"></div>
		<div class="col mt-5 mb-2" style="border-top: 2px solid black;"></div>
		<div class="col-1"></div>
	</div>
	<div class="row">
		<div class="col-1"></div>
		<div class="col mb-3 fs-4 fw-bold">거래요청 리스트</div>
		<div class="col-1"></div>
	</div>
	<div class="row mt-1 mb-2 fw-semibold">
		<div class="col-1"></div>
		<div class="col-2 p-2 text-center bg-secondary bg-opacity-10">닉네임</div>
		<div class="col-3 p-2 text-center bg-secondary bg-opacity-10">신청상태</div>
		<div class="col m-0 p-2 text-center bg-secondary bg-opacity-10">요청일자</div>
		<div class="col-1 p-2 text-center bg-secondary bg-opacity-10"></div>
		<div class="col-2"></div>
 	</div>
 	<c:forEach items="${productRequestList}" var="map">
 	<div class="row mt-1 mb-2">
		<div class="col-1"></div>
		<div class="col-2 text-center">${map.userDto.nickname }</div>
		<div class="col-3 p-2 text-center">${map.productRequestDto.status }</div>
		<div class="col m-0 p-2 text-center">${map.productRequestDto.reg_date }</div>
		<c:if test="${map.productRequestDto.status == '거래요청' && reservationCount == 0 && completeCount == 0 }">
			<div class="col-1 text-center">
				<a href="./productRequestStatusReservation?productId=${map.productRequestDto.product_id }&userId=${map.productRequestDto.user_id}" type="button" class="btn btn-dark btn-sm">예약</a>
			</div>
			<div class="col-1 text-center">
				<a href="./productRequestStatusComplete?productId=${map.productRequestDto.product_id }&userId=${map.productRequestDto.user_id}" type="button" class="btn btn-dark btn-sm">완료</a>
			</div>
		</c:if>
		<c:if test="${map.productRequestDto.status == '예약중' }">
			<div class="col-1 text-center">
				<a href="./productRequestStatusCancel?productId=${map.productRequestDto.product_id }&userId=${map.productRequestDto.user_id}" type="button" class="btn btn-dark btn-sm">예약취소</a>
			</div>
			<div class="col-1 text-center">
				<a href="./productRequestStatusComplete?productId=${map.productRequestDto.product_id }&userId=${map.productRequestDto.user_id}" type="button" class="btn btn-dark btn-sm">완료</a>
			</div>
		</c:if>
		<c:if test="${map.productRequestDto.status == '거래완료'}">
			<div class="col-1 text-center">
			</div>
			<div class="col-1 text-center">
				<button type="button" class="btn btn-danger btn-sm" disabled>거래완료</button>
			</div>
		</c:if>
		<c:if test="${map.productRequestDto.status == '거래요청' && reservationCount != 0}">
			<div class="col-1 text-center">
			</div>
			<div class="col-1 text-center">
			</div>
		</c:if>
		<c:if test="${map.productRequestDto.status != '거래완료' && completeCount != 0}">
			<div class="col-1 text-center">
			</div>
			<div class="col-1 text-center">
			</div>
		</c:if>
		<div class="col-1">
		</div>
		<div class="col-2"></div>
 	</div>
 	</c:forEach>
	</c:if> --%>
	<%-- <c:if test="${sessionUser.getId() == map.productDto.user_id }">
 	<c:forEach items="${productRequestList}" var="map">
 	<div class="row mt-1 mb-2">
		<div class="col-1"></div>
		<c:if test="${map.productRequestDto.status == '거래요청' && reservationCount == 0 && completeCount == 0 }">
			<div class="col-1 text-center">
				<a href="./productRequestStatusReservation?productId=${map.productRequestDto.product_id }&userId=${map.productRequestDto.user_id}" type="button" class="btn btn-dark btn-sm">예약하기</a>
			</div>
			<div class="col-1 text-center">
				<a href="./productRequestStatusComplete?productId=${map.productRequestDto.product_id }&userId=${map.productRequestDto.user_id}" type="button" class="btn btn-dark btn-sm">거래완료</a>
			</div>
		</c:if>
		<c:if test="${map.productRequestDto.status == '예약중' }">
			<div class="col-1 text-center">
				<a href="./productRequestStatusCancel?productId=${map.productRequestDto.product_id }&userId=${map.productRequestDto.user_id}" type="button" class="btn btn-dark btn-sm">예약취소</a>
			</div>
			<div class="col-1 text-center">
				<a href="./productRequestStatusComplete?productId=${map.productRequestDto.product_id }&userId=${map.productRequestDto.user_id}" type="button" class="btn btn-dark btn-sm">거래완료</a>
			</div>
		</c:if>
		<c:if test="${map.productRequestDto.status == '거래완료'}">
			<div class="col-1 text-center">
			</div>
			<div class="col-1 text-center">
				<button type="button" class="btn btn-danger btn-sm">리뷰 쓰기</button>
			</div>
		</c:if>
		<c:if test="${map.productRequestDto.status == '거래요청' && reservationCount != 0}">
			<div class="col-1 text-center">
			</div>
			<div class="col-1 text-center">
			</div>
		</c:if>
		<c:if test="${map.productRequestDto.status != '거래완료' && completeCount != 0}">
			<div class="col-1 text-center">
			</div>
			<div class="col-1 text-center">
			</div>
		</c:if>
 	</div>
 	</c:forEach>
	</c:if> --%>
</div>

	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

</body>	
</html>