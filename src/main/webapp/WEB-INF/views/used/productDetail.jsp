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
<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e3bf1aa0a81d63e6cdd0d60a55347bc9&libraries=services"></script>

<style type="text/css">
.productImg, #map{
	border-radius: 10px;
}
.bestImg{
    	border-radius: 3px;
    }
.category{
	font-size: 16px;
}
.custom-btn {
    padding-left: 0.25;
    padding-right: 0.25;
    font-size: 13px;
    font-weight: 500;
} 
.location {
	font-size: 16px;
}

.gray-line{
	border: 1px solid rgba(128, 128, 128, 0.3);
}
.contentTitle{
	font-size: 20px;
	font-weight: 500;
}
.content{
	font-size: 17px;
	font-weight: 400;
}
/* 버튼 색깔 */
.orangeButton{
	background: #ff6f0f;
	font-weight: bold;
	color: white;
}

.nickname{
	font-size: 17px;
}

.title{
	font-size: 26px;
	font-weight: bold;
}
.relatedTitleImg{
	border-radius: 10px;
}
.btn-qna{position: fixed; bottom: 80px; right: 70px; border-radius: 60px; padding: 0 0;}
	.btn-circle{width: 50px; height: 52px; border-radius: 50%; display: flex; flex-direction:column; justify-content: center; align-items: center; font-size: 2rem; cursor: pointer;}
	.btn-circle i{color: #5e5e5e; font-size: 24px;}
	.btn-tit{font-size:13px;}
	
.custom-progress-bar {
	appearance :none;
	height: 30px; /* 원하는 높이를 지정합니다 */
	background-color: #ffa500; /* 옅은 주황색 배경색을 지정합니다 */
}
.progress-custom::-webkit-progress-bar {
      background-color: #d3d3d3; /* 밝은 회색 */
}
.progress-custom::-webkit-progress-value {
      background-color: orange; /* 옅은 오렌지 색 */
}	
.titleList{
	font-size: 16px;
	font-weight: 500;
}
.locationList{
	font-size: 13px;
}
.overflow {
	  white-space: nowrap; /* 텍스트를 한 줄로 표시 */
	  overflow: hidden; /* 넘친 텍스트를 숨김 */
	  text-overflow: ellipsis; /* 넘친 텍스트를 "..."으로 표시 */
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

<!-- 위치 모달 -->
	<!-- <div class="modal" id="mapModal" tabindex="-1" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header position-relative">
 	        <div class="modal-title position-absolute top-50 start-50 translate-middle fw-bold fs-3">
 	        	<h5 class="modal-title text-center">거래 위치 보기</h5>
 	        </div>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body px-1 py-1" style="height: 400px">
			<div class="chat-container" style="height:395px;" id="map">
		     </div>
	      </div>
	    </div>
	  </div>
	</div> -->
	<!-- 위치 모달 -->

<div class="container main_box mb-5">
	<!— 테이블 헤더 —>
<div class="row py-2 text-center">
	<div class="col-auto">
		<a href="./productList" class="text-secondary text-decoration-none">
			<i class="bi bi-chevron-left"></i> 목록으로
		</a>
	</div>
</div>
  <div class="row mt-2">
	<div class="col-6">
		<c:choose>
			<c:when test="${list.size() > 1}">
		  <div id="carouselExampleDark" class="carousel carousel-dark slide">
		    <div class="carousel-indicators">
		      <c:forEach items="${list}" var="ProductImgDto" varStatus="status">
		        <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="${status.index}" class="${status.first ? 'active' : ''}" aria-label="Slide ${status.index + 1}"></button>
		      </c:forEach>
		    </div>
		    <div class="carousel-inner">
		      <c:forEach items="${list}" var="ProductImgDto" varStatus="status">
		        <div class="carousel-item ${status.first ? 'active' : ''}" data-bs-interval="10000">
		          <img src="/safarifile/${ProductImgDto.product_img_link}" class="d-block productImg" alt="..." width="100%" height="100%">
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
		  </c:when>
		  <c:otherwise>
		  	 <c:forEach items="${list}" var="ProductImgDto" varStatus="status">
		  		<img src="/safarifile/${ProductImgDto.product_img_link}" class="d-block productImg" alt="..." width="100%" height="100%">
		  	 </c:forEach>
		  </c:otherwise>
	  </c:choose>
	</div>
    <div class="col ms-5">
    	<div class="row mt-2">
    		<div class="col text-secondary category">${ProductMainCategoryDto.main_category_name }&nbsp;&nbsp;/&nbsp;&nbsp;${ProductSubCategoryDto.sub_category_name }</div>
    	</div>
    	<div class="row mt-1">
		   	<div class="fw-bold col title">${map.productDto.title }
		    	<c:if test="${reservationCount > 0 }">
		    	<span class="mt-0"><button type="button" class="btn btn-success btn-sm mb-1 ms-2" disabled>예약중</button></span>
		    	</c:if>
		    	<c:if test="${completeCount > 0 }">
		    	<span class="mt-0"><button type="button" class="btn btn-secondary btn-sm mb-1 ms-2" disabled>거래완료</button></span>
		    	</c:if>
		   	</div>
		   	<div class="col-2 text-end my-auto">
				<i id="heartBox" onclick="toggleLike()" class="fs-3 bi bi-heart text-danger"></i>
				<span class="ms-3"><i class="bi bi-share fs-3 text-dark" style="cursor: pointer" onclick="clipUrl()"></i></span>
			</div>
							
    	</div>
    	<div class="row mt-2">
    	<c:choose>
			<c:when test="${map.productDto.price == 0}">
			    <div class="col-2">
				<button type="button" class="btn btn-warning mb-1 mt-1 custom-btn" disabled>나눔</button>
				</div>
			</c:when>
			<c:otherwise>
				        <div class="fw-bold mb-1 fs-3 col"><fmt:formatNumber value="${map.productDto.price}" pattern="#,##0원" /></div>
			</c:otherwise>
		</c:choose>
			<div class="col text-secondary text-end my-auto category" id="uploadTime"></div>
		</div>
		<div class="row mt-3">
			<div class="col gray-line"></div>
		</div>
		<div class="row mt-4">
			<div class="col-auto my-auto mb-2 contentTitle text-start my-auto">
				<c:choose>
					<c:when test="${productUser.profile_img_link == null }"> 
						 <img style="filter:grayscale(1)" class="rounded-circle" alt="img" src="/safari/resources/img/user.jpg" width="50" height="50" onclick="showYourProfile()">
					</c:when>	
					<c:otherwise>
						<img class="rounded-circle" alt="img" src="/safarifile/${productUser.profile_img_link }" width="50" height="50" onclick="showYourProfile()">
						<%-- <img style="filter:grayscale(1)" class="img-fluid rounded-circle" alt="img" src="/safarifile/${productUser.profile_img_link}" width="35" height="35"> --%>
					</c:otherwise> 
				</c:choose>
			</div>
			<div class="col text-start ps-0 nickname">
    			<div class="row">
       				<div class="col fw-medium" onclick="showYourProfileReview()">${productUser.nickname}
       				<span><img alt="" src="/safari/resources/img/used/flog.png" width="37" height="23"></span>
       				</div>
    			</div>
    			<div class="row">
       				<div class="col text-secondary" style="font-size: 14px;" onclick="showYourProfileManner()">${map.productCityDto.product_city_name } ${map.productTownDto.product_town_name}</div>
    			</div>
			</div>
			<div class="mt-1 col-6 category text-secondary text-end">관심 <span id="totalLikeCount"></span> ∙ 채팅 ${requestCount} ∙ 조회 ${map.productDto.views }</div>
		</div>
		<div class="row mt-3">
			<div class="col mt-2 content" style="height: 130px; font-size: 18px;">${map.productDto.content }</div>
		</div>
		<div class="row mt-3 mb-2">
			<div class="col location" style="color: #514e4e;"><i class="bi bi-geo-alt"></i> ${map.productDto.location }</div>
		</div>
		
        <%-- <h6>등록일 : <fmt:formatDate value="${map.productDto.reg_date}" pattern="yyyy-MM-dd HH:mm:ss"/></h6> --%>
    	<div class="row">
    		<div class="col" id="map" style="width:200px;height:120px;"></div>
    	</div> 
    	<div class="row mt-4 mb-1">
			<div class="col gray-line"></div>
		</div>
		<div class="row mt-4 align-bottom px-0 mb-4">
    		<c:if test="${sessionUser.getId() != map.productDto.user_id }">
    		<div class="col mt-1"></div>
    		<div class="col-4 d-grid align-items-end">
    			<c:if test="${result==false && completeCount == 0 }">
    				<button class="btn orangeButton" onclick="productRequestByProductId()">채팅하기</button>
    			</c:if >
    			 <c:if test="${result==true && completeCount == 0 }">
    				<button class="btn orangeButton" onclick="productRequestAlreadyByProductId()">채팅하기</button>
    			</c:if>
    			 <c:if test="${completeCount > 0}">
    			 	<button type="button" class="btn btn-secondary btn-sm" disabled>채팅하기</button>
    			 </c:if>
    		</div>
    		</c:if>
	    	<c:if test="${sessionUser != null && sessionUser.id == map.productDto.user_id}">
	    	<div class="col-2 d-grid align-items-start my-auto">
	    	<a href="./updateProductRegister?productId=${map.productDto.id }" type="button" class="btn btn-outline-secondary btn-sm">수정</a>
	    	</div>
	    	<div class="col-2 d-grid align-items-start my-auto">
	    	<a href="./deleteProduct?productId=${map.productDto.id }" type="button" class="btn btn-outline-secondary btn-sm">삭제</a>
	    	</div>
	    		<c:if test="${completeCount > 0}">
	    			<div class="col text-end my-auto pe-0"><button class="btn btn-sm fw-semibold btn-secondary" style="padding: 6px 25px;font-size: 16px;" onclick="reloadChatRoomList()">대화 중인 채팅방 ${map.chatCount }</button></div>
	    		</c:if>
	    		<c:if test="${completeCount == 0}">
	    			<div class="col text-end my-auto pe-0"><button class="btn btn-sm fw-semibold" style="background: #ff6f0f; color: white; padding: 6px 25px;font-size: 16px;" onclick="reloadChatRoomList()">대화 중인 채팅방 1</button></div>
	    		</c:if>
	    	</c:if>
    	</div>
 	 	</div>
	</div>
	<div class="row mt-5">
		<div class="col fs-5 fw-semibold">이런 상품은 어때요?</div>
	</div>
	<div class="row mt-4 mb-2">
		<c:forEach items="${relatedProductList}" var="map">
				<div class="col-auto mb-4">
				<a href="./productDetail?productId=${map.productDto.id }" class="text-decoration-none">
					<div class="row">
						<div class="col">
							<img class="relatedTitleImg" src="/safarifile/${map.productImgDto.product_img_link}" width="240px" height="240px">
						</div>
					</div>
					<div class="row mt-1">
						<div class="col relatedTitle overflow">
							${map.productDto.title }
						</div>
					</div>
					<div class="row">
						<c:choose>
							<c:when test="${map.productDto.price == 0}">
							    <div class="col-5">
								<button type="button" class="btn btn-warning mb-1 custom-btn py-1 mt-1" disabled>나눔</button>
								</div>
							</c:when>
							<c:otherwise>
								        <div class="fw-bold mb-1 fs-5 col"><fmt:formatNumber value="${map.productDto.price}" pattern="#,##0원" /></div>
							</c:otherwise>
						</c:choose>
					</div>
				</a>
				</div>
		</c:forEach>
	</div>
	<div class="row mt-3">
		<div class="col"><img class="img-fluid" alt="chatAds" src="/safari/resources/img/used/detailBanner3.png" style="=height: 120px;border-radius: 4px;"></div>
	</div>
	
</div>

	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->
	
<!-- 판매자 프로필 모달 -- 판매 물품 -->
<div class="modal" id="showYourProfile" tabindex="-1" >
  <div class="modal-dialog" style="width: 600px; max-width: 90%; height: 810px; max-height: 90%;">
    <div class="modal-content" style="height: 100%;">
      <div class="modal-header position-relative px-3" style="padding: 10px 0px; height: 55px;">
       	<h5 class="modal-title ms-1 position-absolute top-50 start-50 translate-middle" style="font-weight: 500 ;">프로필</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-header pb-0" style="background: #d3d3d336;">
	     <div class="my-custom-header-wrapper" style="width: 600px;">
	     	<div class="row">
	     		<div class="col-auto ms-3">
	     			<img class="rounded-circle" alt="mod" src="/safari/resources/img/used/user2.png" width="70px" height="70px">
	     		</div>
	     		<div class="col my-auto">
	     			<div class="row">
	     				<div class="col-auto fs-5 fw-medium">사파리판매왕</div>
	     				<div class="col my-auto ps-1">서울시 강남구</div>
	     			</div>
	     			<div class="row position-relative">
	     				<div class="col-auto fs-6 text-secondary mt-1">매너등급 Lv.4</div>
	     				<div class="col text-start fs-3 text-secondary my-auto ps-0 position-absolute" style="margin-left: 112px;bottom: -9px;">🐸</div>
	     			</div>
	     		</div>
	     	</div>
	     	<div class="row mt-3 ms-2 fw-semibold position-relative" style="height: 6px;">
	  			<div class="col position-absolute" style="text-decoration: underline;">매너등급<span class="ms-1"><i class="bi bi-info-circle"></i></span></div>
	  		</div>
	  		<div class="row fw-medium position-relative" style="height: 12px;">
	  			<div class="col position-absolute" style="margin-left: 282px;color: dimgray;/* height: 8px; */font-size: 16px;">Lv.4</div>
	  		</div>
	  		<div class="row fw-semibold position-relative" style="height: 21px;">
	  			<div class="col position-absolute"><i class="bi bi-caret-down-fill" style="margin-left: 288px;color: dimgray;/* line-height: 1.9px; */font-size: 13px;"></i></div>
	  		</div>
			<div class="row mb-4">
				<div class="col-auto d-flex pe-1">
				    <progress class="my-auto ms-3 progress progress-custom" id="progress4" value="70" min="0" max="100" style="width: 400px;"></progress>
				    <!-- <span id="review4" class="text-secondary" style="font-size: 14px"></span> -->
				</div>
    			<div class="col text-start" style="font-size: 16px;font-weight: 600;color: #6f6e6e;">Lv 4</div>
			</div>	
	     	<div class="row mt-3" style="font-size: 18px;">
   				<div class="col-auto ms-3 my-auto fw-semibold pb-1" style="color: #ff6f0f;border-bottom: 3px;border-bottom-color: #ff6f0f;border-bottom-style: solid;">판매 물품 (6)</div>
   				<div class="col-auto ms-2 my-auto text-secondary pb-1">거래 후기 (20)</div>
   				<div class="col-auto ms-2 my-auto text-secondary pb-1">매너 평가</div>
   			</div>
       </div>
      </div>
     <div class="modal-body mx-2 mt-2" style="height: 500px">
	  <div class="chat-container overflow-y-scroll overflow-x-hidden" style="height:480px;">
	  		<div class="row mb-5">
			
				<div class="col-4 mb-3">
					<div class="row">
						<div class="col">
						<a href="./productDetail?productId=109" class="text-decoration-none text-black p-0">
						<img alt="img" class="img-fluid bestImg" src="/safarifile/2023/07/25/3729ba5c-54db-4770-8e9e-20b127841da1_1690266177719.png">
						</a>
						</div>
					</div>	
					<div class="row">
						<div class="col mt-2 overflow">
						<a href="./productDetail?productId=109" class="ms-1 text-decoration-none text-black titleList">
							인테리어 화장대 거울
						</a>
						</div>
					</div>
					<div class="row ms-1">
						<div class="col ms-0 p-0 w-0 locationList text-secondary mb-2">
						경기도 구리시
						</div>
					</div>
						
							<div class="row ms-1"><span class="p-0 fw-semibold price">11,900원</span></div>
					
					<div class="row mb-3 fw-medium">
				      <div class="col ms-1 text-secondary" style="font-size: 14px;">
				        <i class="bi bi-heart"></i> 1 &nbsp;&nbsp;<i class="bi bi-chat-dots"></i> 1
				      </div>
				    </div>	
				</div>
			
				<div class="col-4 mb-3">
					<div class="row">
						<div class="col">
						<a href="./productDetail?productId=108" class="text-decoration-none text-black p-0">
						<img alt="img" class="img-fluid bestImg" src="/safarifile/2023/07/14/208caf9e-4ae0-474a-a982-16922c5bd765_1689329433704.png">
						</a>
						</div>
					</div>	
					<div class="row">
						<div class="col mt-2 overflow">
						<a href="./productDetail?productId=108" class="ms-1 text-decoration-none text-black titleList">
							HOL 사이드테이블
						</a>
						</div>
					</div>
					<div class="row ms-1">
						<div class="col ms-0 p-0 w-0 locationList text-secondary mb-2">
						서울특별시 마포구
						</div>
					</div>
							<div class="row ms-1"><span class="p-0 fw-semibold price">250,000원</span></div>
					<div class="row mb-3 fw-medium">
				      <div class="col ms-1 text-secondary" style="font-size: 14px;">
				        <i class="bi bi-heart"></i> 1 &nbsp;&nbsp;<i class="bi bi-chat-dots"></i> 0
				      </div>
				    </div>	
				</div>
			
				<div class="col-4 mb-3">
					<div class="row">
						<div class="col">
						<a href="./productDetail?productId=107" class="text-decoration-none text-black p-0">
						<img alt="img" class="img-fluid bestImg" src="/safarifile/2023/07/14/ae2f63bc-92be-4d00-961e-065c369ced59_1689329180014.png">
						</a>
						</div>
					</div>	
					<div class="row">
						<div class="col mt-2 overflow">
						<a href="./productDetail?productId=107" class="ms-1 text-decoration-none text-black titleList">
							루미르R 테이블램프
						</a>
						</div>
					</div>
					<div class="row ms-1">
						<div class="col ms-0 p-0 w-0 locationList text-secondary mb-2">
						서울특별시 강남구
						</div>
					</div>
							<div class="row ms-1"><span class="p-0 fw-semibold price">300,000원</span></div>
					<div class="row mb-3 fw-medium">
				      <div class="col ms-1 text-secondary" style="font-size: 14px;">
				        <i class="bi bi-heart"></i> 1 &nbsp;&nbsp;<i class="bi bi-chat-dots"></i> 0
				      </div>
				    </div>	
				</div>
			
				<div class="col-4 mb-3">
					<div class="row">
						<div class="col">
						<a href="./productDetail?productId=104" class="text-decoration-none text-black p-0">
						<img alt="img" class="img-fluid bestImg" src="/safarifile/2023/07/14/ffdb9dcf-cdfc-4d6e-86c8-95a3b72d9cd8_1689304398430.png">
						</a>
						</div>
					</div>	
					<div class="row">
						<div class="col mt-2 overflow">
						<a href="./productDetail?productId=104" class="ms-1 text-decoration-none text-black titleList">
							BLOODY 무소음 시계
						</a>
						</div>
					</div>
					<div class="row ms-1">
						<div class="col ms-0 p-0 w-0 locationList text-secondary mb-2">
						서울특별시 강남구
						</div>
					</div>
						<div class="row ms-1 fw-semibold price"><button type="button" class="btn btn-warning btn-sm col-auto" disabled>나눔</button></div>
					<div class="row mb-3 fw-medium">
				      <div class="col ms-1 text-secondary" style="font-size: 14px;">
				        <i class="bi bi-heart"></i> 0 &nbsp;&nbsp;<i class="bi bi-chat-dots"></i> 1
				      </div>
				    </div>	
				</div>
			
				<div class="col-4 mb-3">
					<div class="row">
						<div class="col">
						<a href="./productDetail?productId=103" class="text-decoration-none text-black p-0">
						<img alt="img" class="img-fluid bestImg" src="/safarifile/2023/07/14/26e1643e-3b9c-49b2-a20f-453e1f8b910d_1689304118205.avif">
						</a>
						</div>
					</div>	
					<div class="row">
						<div class="col mt-2 overflow">
						<a href="./productDetail?productId=103" class="ms-1 text-decoration-none text-black titleList">
							다용도수납장 주방선반
						</a>
						</div>
					</div>
					<div class="row ms-1">
						<div class="col ms-0 p-0 w-0 locationList text-secondary mb-2">
						인천광역시 부평구
						</div>
					</div>
							<div class="row ms-1 fw-semibold price"><button type="button" class="btn btn-warning btn-sm col-auto" disabled>나눔</button></div>
						
					
					<div class="row mb-3 fw-medium">
				      <div class="col ms-1 text-secondary" style="font-size: 14px;">
				        <i class="bi bi-heart"></i> 0 &nbsp;&nbsp;<i class="bi bi-chat-dots"></i> 0
				      </div>
				    </div>	
				</div>
			
				<div class="col-4 mb-3">
					<div class="row">
						<div class="col">
						<a href="./productDetail?productId=83" class="text-decoration-none text-black p-0">
						<img alt="img" class="img-fluid bestImg" src="/safarifile/2023/07/13/e10d817e-ffc0-4965-8f8e-50191fbffe10_1689230023068.jpg">
						</a>
						</div>
					</div>	
					<div class="row">
						<div class="col mt-2 overflow">
						<a href="./productDetail?productId=83" class="ms-1 text-decoration-none text-black titleList">
							아이패드 프로 4세대
						</a>
						</div>
					</div>
					<div class="row ms-1">
						<div class="col ms-0 p-0 w-0 locationList text-secondary mb-2">
						서울특별시 마포구
						</div>
					</div>
							<div class="row ms-1"><span class="p-0 fw-semibold price">100,000원</span></div>
					<div class="row mb-3 fw-medium">
				      <div class="col ms-1 text-secondary" style="font-size: 14px;">
				        <i class="bi bi-heart"></i> 1 &nbsp;&nbsp;<i class="bi bi-chat-dots"></i> 0
				      </div>
				    </div>	
				</div>
			
		</div>
      </div>
     </div>
  </div>
</div>
</div>	
<!-- 판매자 프로필 모달 -->

<!-- 판매자 프로필 모달 -- 거래 후기 (20) -->
<div class="modal" id="showYourProfileReview" tabindex="-1" >
  <div class="modal-dialog" style="width: 600px; max-width: 90%; height: 830px; max-height: 90%;">
    <div class="modal-content" style="height: 100%;">
      <div class="modal-header position-relative px-3" style="padding: 10px 0px; height: 55px;">
       	<h5 class="modal-title ms-1 position-absolute top-50 start-50 translate-middle" style="font-weight: 500 ;">프로필</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-header pb-0" style="background: #d3d3d336;">
	     <div class="my-custom-header-wrapper" style="width: 600px;">
	     	<div class="row">
	     		<div class="col-auto ms-3">
	     			<img class="rounded-circle" alt="mod" src="/safari/resources/img/used/user2.png" width="70px" height="70px">
	     		</div>
	     		<div class="col my-auto">
	     			<div class="row">
	     				<div class="col-auto fs-5 fw-medium">사파리판매왕</div>
	     				<div class="col my-auto ps-1">서울시 강남구</div>
	     			</div>
	     			<div class="row position-relative">
	     				<div class="col-auto fs-6 text-secondary mt-1">매너등급 Lv.4</div>
	     				<div class="col text-start fs-3 text-secondary my-auto ps-0 position-absolute" style="margin-left: 112px;bottom: -9px;">🐸</div>
	     			</div>
	     		</div>
	     	</div>
	     	<div class="row mt-3 ms-2 fw-semibold position-relative" style="height: 6px;">
	  			<div class="col position-absolute" style="text-decoration: underline;">매너등급<span class="ms-1"><i class="bi bi-info-circle"></i></span></div>
	  		</div>
	  		<div class="row fw-medium position-relative" style="height: 12px;">
	  			<div class="col position-absolute" style="margin-left: 282px;color: dimgray;/* height: 8px; */font-size: 16px;">Lv.4</div>
	  		</div>
	  		<div class="row fw-semibold position-relative" style="height: 21px;">
	  			<div class="col position-absolute"><i class="bi bi-caret-down-fill" style="margin-left: 288px;color: dimgray;/* line-height: 1.9px; */font-size: 13px;"></i></div>
	  		</div>
			<div class="row mb-4">
				<div class="col-auto d-flex pe-1">
				    <progress class="my-auto ms-3 progress progress-custom" id="progress4" value="70" min="0" max="100" style="width: 400px;"></progress>
				    <!-- <span id="review4" class="text-secondary" style="font-size: 14px"></span> -->
				</div>
    			<div class="col text-start" style="font-size: 16px;font-weight: 600;color: #6f6e6e;">상위 20%</div>
			</div>	
	     	<div class="row mt-3" style="font-size: 18px;">
   				<div class="col-auto ms-3 my-auto pb-1 text-secondary">판매 물품 (6)</div>
   				<div class="col-auto ms-2 my-auto fw-semibold pb-1" style="color: #ff6f0f;border-bottom: 3px;border-bottom-color: #ff6f0f;border-bottom-style: solid;">거래 후기 (20)</div>
   				<div class="col-auto ms-2 my-auto text-secondary pb-1">매너 평가</div>
   			</div>
       </div>
      </div>
     <div class="modal-body mx-2 mt-2" style="height: 500px">
	  <div class="chat-container overflow-y-scroll overflow-x-hidden" style="height:480px;">
	  	<div class="row">
	  		<div class="col">
	  			<img alt="" src="/safari/resources/img/used/profReview.png" width="810px">
	  		</div>
	  	</div>
      </div>
     </div>
  </div>
</div>
</div>	
<!-- 판매자 프로필 모달 -->

<!-- 판매자 프로필 모달 -- 매너 칭찬 -->
<div class="modal" id="showYourProfileManner" tabindex="-1" >
  <div class="modal-dialog" style="width: 600px; max-width: 90%; height: 810px; max-height: 90%;">
    <div class="modal-content" style="height: 100%;">
      <div class="modal-header position-relative px-3" style="padding: 10px 0px; height: 55px;">
       	<h5 class="modal-title ms-1 position-absolute top-50 start-50 translate-middle" style="font-weight: 500 ;">프로필</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-header pb-0" style="background: #d3d3d336;">
	     <div class="my-custom-header-wrapper" style="width: 600px;">
	     	<div class="row">
	     		<div class="col-auto ms-3">
	     			<img class="rounded-circle" alt="mod" src="/safari/resources/img/used/user2.png" width="70px" height="70px">
	     		</div>
	     		<div class="col my-auto">
	     			<div class="row">
	     				<div class="col-auto fs-5 fw-medium">사파리판매왕</div>
	     				<div class="col my-auto ps-1">서울시 강남구</div>
	     			</div>
	     			<div class="row position-relative">
	     				<div class="col-auto fs-6 text-secondary mt-1">매너등급 Lv.4</div>
	     				<div class="col text-start fs-3 text-secondary my-auto ps-0 position-absolute" style="margin-left: 112px;bottom: -9px;">🐸</div>
	     			</div>
	     		</div>
	     	</div>
	     	<div class="row mt-3 ms-2 fw-semibold position-relative" style="height: 6px;">
	  			<div class="col position-absolute" style="text-decoration: underline;">매너등급<span class="ms-1"><i class="bi bi-info-circle"></i></span></div>
	  		</div>
	  		<div class="row fw-medium position-relative" style="height: 12px;">
	  			<div class="col position-absolute" style="margin-left: 282px;color: dimgray;/* height: 8px; */font-size: 16px;">Lv.4</div>
	  		</div>
	  		<div class="row fw-semibold position-relative" style="height: 21px;">
	  			<div class="col position-absolute"><i class="bi bi-caret-down-fill" style="margin-left: 288px;color: dimgray;/* line-height: 1.9px; */font-size: 13px;"></i></div>
	  		</div>
			<div class="row mb-4">
				<div class="col-auto d-flex pe-1">
				    <progress class="my-auto ms-3 progress progress-custom" id="progress4" value="70" min="0" max="100" style="width: 400px;"></progress>
				    <!-- <span id="review4" class="text-secondary" style="font-size: 14px"></span> -->
				</div>
    			<div class="col text-start" style="font-size: 16px;font-weight: 600;color: #6f6e6e;">상위 20%</div>
			</div>	
	     	<div class="row mt-3" style="font-size: 18px;">
   				<div class="col-auto ms-3 my-auto pb-1 text-secondary">판매 물품 (6)</div>
   				<div class="col-auto ms-2 my-auto text-secondary pb-1">거래 후기 (20)</div>
   				<div class="col-auto ms-2 my-auto fw-semibold pb-1" style="color: #ff6f0f;border-bottom: 3px;border-bottom-color: #ff6f0f;border-bottom-style: solid;">매너 평가</div>
   			</div>
       </div>
      </div>
     <div class="modal-body mx-4 mt-3" style="height: 500px">
	  <div class="chat-container overflow-y-scroll overflow-x-hidden" style="height:480px;">
	  	<div class="row mb-4">
	  		<div class="col">
	  		 	<img alt="" src="/safari/resources/img/used/smile.png" width="35px" height="35px"><span class="ms-3 fw-semibold" style="font-size: 17px;">받은 매너 칭찬</span>
	  		</div>
	  	</div>
	  	<div class="row">
	  		<div class="col-10 ms-2" style="font-size: 18px;">
	  			제가 있는 곳까지 와서 거래했어요.
	  		</div>
	  		<div class="col ms-1 fs-6">
	  			<i class="bi bi-people-fill"></i><span class="fw-semibold ms-1">33</span>
	  		</div>
	  	</div>
	  	<div class="row mt-3 mb-3">
			<div class="col" style="border: 1px solid #e4e1e1;"></div>
		</div>
	  	<div class="row">
	  		<div class="col-10 ms-2" style="font-size: 18px;">
	  			응답이 빨라요.
	  		</div>
	  		<div class="col ms-1 fs-6">
	  			<i class="bi bi-people-fill"></i><span class="fw-semibold ms-1">40</span>
	  		</div>
	  	</div>
	  	<div class="row mt-3 mb-3">
			<div class="col" style="border: 1px solid #e4e1e1;"></div>
		</div>
	  	<div class="row">
	  		<div class="col-10 ms-2" style="font-size: 18px;">
	  			친절하고 매너가 좋아요.
	  		</div>
	  		<div class="col ms-1 fs-6">
	  			<i class="bi bi-people-fill"></i><span class="fw-semibold ms-1">27</span>
	  		</div>
	  	</div>
	  	<div class="row mt-3 mb-3">
			<div class="col" style="border: 1px solid #e4e1e1;"></div>
		</div>
	  	<div class="row">
	  		<div class="col-10 ms-2" style="font-size: 18px;">
	  			시간 약속을 잘 지켜요.
	  		</div>
	  		<div class="col ms-1 fs-6">
	  			<i class="bi bi-people-fill"></i><span class="fw-semibold ms-1">24</span>
	  		</div>
	  	</div>
	  	<div class="row mt-3 mb-3">
			<div class="col" style="border: 1px solid #e4e1e1;"></div>
		</div>
		
	  	<div class="row mt-1">
	  		<div class="col mb-4 mt-4">
	  		 	<img alt="" src="/safari/resources/img/used/sad.png" width="35px" height="35px"><span class="ms-3 fw-semibold" style="font-size: 17px;">받은 비매너</span>
	  		</div>
	  	</div>
	  	<div class="row">
	  		<div class="col-10 ms-2" style="font-size: 18px;">
	  			불친절해요.
	  		</div>
	  		<div class="col ms-1 fs-6">
	  			<i class="bi bi-people-fill"></i><span class="fw-semibold ms-1">2</span>
	  		</div>
	  	</div>
	  	<div class="row mt-3 mb-3">
			<div class="col" style="border: 1px solid #e4e1e1;"></div>
		</div>
	  	<div class="row">
	  		<div class="col-10 ms-2" style="font-size: 18px;">
	  			거래 시간과 장소를 정한 후 연락이 안돼요.
	  		</div>
	  		<div class="col ms-1 fs-6">
	  			<i class="bi bi-people-fill"></i><span class="fw-semibold ms-1">3</span>
	  		</div>
	  	</div>
	  	<div class="row mt-3 mb-3">
			<div class="col" style="border: 1px solid #e4e1e1;"></div>
		</div>
	  	<div class="row">
	  		<div class="col-10 ms-2" style="font-size: 18px;">
	  			원하지 않는 가격을 계속 요구해요.
	  		</div>
	  		<div class="col ms-1 fs-6">
	  			<i class="bi bi-people-fill"></i><span class="fw-semibold ms-1">1</span>
	  		</div>
	  	</div>
	  	<div class="row mt-3 mb-3">
			<div class="col" style="border: 1px solid #e4e1e1;"></div>
		</div>
	  	<div class="row">
	  		<div class="col-10 ms-2" style="font-size: 18px;">
	  			시간약속을 안지켜요.
	  		</div>
	  		<div class="col ms-1 fs-6">
	  			<i class="bi bi-people-fill"></i><span class="fw-semibold ms-1">5</span>
	  		</div>
	  	</div>
	  	<div class="row mt-3 mb-3">
			<div class="col" style="border: 1px solid #e4e1e1;"></div>
		</div>
	  	
      </div>
     </div>
  </div>
</div>
</div>	
<!-- 판매자 프로필 모달 -->

<script type="text/javascript">
const productId = new URLSearchParams(location.search).get("productId");
let mySessionId = null;

function clipUrl() {
	let url = '';
	let textarea = document.createElement("textarea");
	document.body.appendChild(textarea);
	url = window.document.location.href;
	textarea.value = url;
	textarea.select();
	document.execCommand("copy");
	document.body.removeChild(textarea);
	alert("주소가 복사되었습니다!")
}


// 프로필 모달 열기 - 판매상품
function showYourProfile() {
	const showYourProfileModal = bootstrap.Modal.getOrCreateInstance('#showYourProfile');
	showYourProfileModal.show();	
}
// 프로필 모달 열기 - 후기 
function showYourProfileReview() {
	const showYourProfileReviewModal = bootstrap.Modal.getOrCreateInstance('#showYourProfileReview');
	showYourProfileReviewModal.show();	
}
// 프로필 모달 열기 - 매너 칭찬 
function showYourProfileManner() {
	const showYourProfileMannerModal = bootstrap.Modal.getOrCreateInstance('#showYourProfileManner');
	showYourProfileMannerModal.show();	
}

// 거래요청을 처음하는 사람의 채팅 모달 열기
function productRequestByProductId() {
const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			//map 갖고오기
			const response = JSON.parse(xhr.responseText);
			if(!response.sessionUser){
        		window.location.href = '/safari/user/loginPage';
        	}
			
			//js 작업
			modalOn(response.productRequestDto.id,response.receiverDto.id,response.receiverDto.nickname);
		}
	}
	
	//get
	xhr.open("get", "./productRequest?productId="+productId);
	xhr.send();
}

// 거래요청을 이미 했던 사람의 채팅 모달 열기
function productRequestAlreadyByProductId() {
const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			//map 갖고오기
			const response = JSON.parse(xhr.responseText);
			if(!response.sessionUser){
        		window.location.href = '/safari/user/loginPage';
        	}
			
			//js 작업
			modalOn(response.productRequestDto.id,response.receiverDto.id,response.receiverDto.nickname);
		}
	}
	
	//get
	xhr.open("get", "./productRequestAlready?productId="+productId);
	xhr.send();
}

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

//몇 시간/분/초 전 
function dateToTimeDifference(date) {

	// 자바스크립트 날짜로 변환 
	const dateFromDatabase = new Date(date);

	// 현재와 시간차 (밀리초)
	const timeDifference = Date.now() - dateFromDatabase.getTime();
	
	 // 초, 분, 시간, 일, 월, 년 계산 (integer)
	const seconds = Math.floor(timeDifference / 1000);
	const minutes = Math.floor(seconds / 60);
	const hours = Math.floor(minutes / 60);
	const days = Math.floor(hours / 24);
	const months = Math.floor(days / 30);
	const years = Math.floor(months / 12);

	let formattedTime;

	// 시/분/초 중 하나 정해서 표시 
	if (years >= 1) {
	  formattedTime = `\${years}년 전`;
	} else if (months >= 1) {
	  formattedTime = `\${months}개월 전`;
	} else if (days >= 1) {
	  formattedTime = `\${days}일 전`;
	} else if (hours >= 1) {
	  formattedTime = `\${hours}시간 전`;
	} else if (minutes >= 1) {
	  formattedTime = `\${minutes}분 전`;
	} else {
	  formattedTime = `\${seconds}초 전`;
	}

	return 	formattedTime;
}

function getUploadTime(productId) {
	const xhr = new XMLHttpRequest();
	console.log(11);
	console.log(productId);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			if(response.result == "success"){
				const uploadTime = document.getElementById("uploadTime");
				uploadTime.innerText = dateToTimeDifference(response.productDto.reg_date);
			}
		}
	}
	
	//get
	xhr.open("get", "./getProductById?productId="+productId); 
	xhr.send();
}


//주소 가져오기 
function getAddress() {
	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			const compAddress = response.productDto.location;
			openMap(compAddress,'거래 장소');
		}
	}

	// get 방식 
	xhr.open("get", "./getProductById?productId="+productId);
	xhr.send();
	
}
	
function openMap(compAddress,compName) {
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
	    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};  
	
	//지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	//주소로 좌표를 검색합니다
	geocoder.addressSearch(compAddress, function(result, status) {
	
	// 정상적으로 검색이 완료됐으면 
	 if (status === kakao.maps.services.Status.OK) {
	
	    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	    // 결과값으로 받은 위치를 마커로 표시합니다
	    var marker = new kakao.maps.Marker({
	        map: map,
	        position: coords
	    });
	
	    // 인포윈도우로 장소에 대한 설명을 표시합니다
	    var infowindow = new kakao.maps.InfoWindow({
	    		
	        content: '<div style="width:150px;text-align:center;padding:6px 0;">'+compName+'</div>'
	    });
	    infowindow.open(map, marker);
	
	    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	    map.setCenter(coords);
	} 
	}); 
}


window.addEventListener("DOMContentLoaded", function() {
	//사실상 시작 시점...
	getSessionId();
	refreshTotalLikeCount();
	refreshMyHeart();
	getUploadTime(productId);
	getAddress();
});


/* const mapModal = bootstrap.Modal.getOrCreateInstance('#mapModal'); */


//주소 가져오기 

/* function getMap() {
	// 열 때 
	const xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function() {
		
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			const compAddress = response.productDto.location;
			
			mapModal.show();
			
			openMap(compAddress,'거래 장소');
			
		}
	}

	// get 방식 
	xhr.open("get", "./getProductById?productId="+productId); 
	xhr.send();
	 
}
*/


</script>
</body>	
</html>