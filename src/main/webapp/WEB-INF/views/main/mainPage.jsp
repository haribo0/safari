<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사파리 | 메인 </title>
<!-- 메타 섹션 -->
<jsp:include page="../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->
</head>
<body>
   <!-- 헤더 섹션 -->
   <jsp:include page="../common/header.jsp"></jsp:include>
   <!-- 헤더 섹션 -->

   <div class="container bg-light">
		<div class="row">
			<div class="col bg-white">
				<div id="carouselExample" class="carousel slide">
				  <div class="carousel-inner">
				    <div class="carousel-item active">
				      <a href="${pageContext.request.contextPath}/rental/mainPage">
				      	<img src="${pageContext.request.contextPath}/resources/img/main/mainBanner1.png" class="d-block w-100" alt="...">
				      </a>
				    </div>
				    <div class="carousel-item">
				      <a href="${pageContext.request.contextPath}/rental/mainPage">
				      	<img src="${pageContext.request.contextPath}/resources/img/main/mainBanner2.png" class="d-block w-100" alt="...">
				      </a>
				    </div>
				  </div>
				  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Previous</span>
				  </button>
				  <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Next</span>
				  </button>
				</div>
			</div>
		</div>

   </div>

   <div class="container mt-5 pt-5 pb-3">
      <div class="row justify-content-between">
         <div class="col d-flex justify-content-center">
            <div class="card w-100 shadow ">
              <div class="card-body">
                 <div class="row">
                    <div class="col">
                    	<div class="row">
                    		<div class="col py-3 text-center fw-bold ">
                    			<p class="fs-4">중고</p>
                    		</div>
                    	</div>
                    	<div class="row">
		                   <div class="col text-center">
		                      <img class="img-fluid" alt="" src="${pageContext.request.contextPath}/resources/img/main/img_item1.png" style="max-height: 240px;">
		                    	<p class="text-secondary">중고 매물 모두 한 곳에서!</p>
		                   </div>
		                </div>
                    </div>
                 </div>
              </div>
            </div>
         </div>
         <div class="col d-flex justify-content-center">
            <div class="card w-100 shadow ">
              <div class="card-body">
                <div class="row">
                    <div class="col">
                    	<div class="row">
                    		<div class="col py-3 text-center fw-bold">
                    			<p class="fs-4">대여</p>
                    		</div>
                    	</div>
                    	<div class="row">
		                   <div class="col text-center">
		                      <img class="img-fluid" alt="" src="${pageContext.request.contextPath}/resources/img/main/img_item1.png" style="max-height: 240px;">
		                    	<p class="text-secondary">합리적인 대여비!</p>
		                   </div>
		                </div>
                    </div>
                 </div>
              </div>
            </div>
         </div>
         <div class="col d-flex justify-content-center">
            <div class="card w-100 shadow ">
              <div class="card-body">
                <div class="row">
                    <div class="col">
                    	<div class="row">
                    		<div class="col py-3 text-center fw-bold">
                    			<p class="fs-4">경매</p>
                    		</div>
                    	</div>
      	                <div class="row">
		                   <div class="col text-center">
		                      <img class="img-fluid" alt="" src="${pageContext.request.contextPath}/resources/img/main/img_item1.png" style="max-height: 240px;">
                    			<p class="text-secondary">나도 입찰자!</p>
		                   </div>
		                </div>
                    </div>
                 </div>
              </div>
            </div>
         </div>
      </div>
   </div>
   
   <div class="container mt-5 pt-5 pb-3">
      <div class="row shadow p-5">
        <div class="col text-center">
          <h3 class="card-title fw-bold">커뮤니티 페이지 오픈!</h3>
          <p class="card-text mb-5">사파리의 커뮤니티로 풍부한 정보를 채워보세요!</p>
          <a href="#" class="btn btn-primary">더 보기</a>
        </div>
      </div>
   </div>


   <div class="container mt-5 pt-5 pb-3">
      <div class="row">
         <div class="col-6 d-flex justify-content-center">
            <div class="card border-dark mb-3 w-100">
              <div class="card-header">새 소식</div>
              <div class="card-body">
                <h5 class="card-title">사파리 커뮤니티 오픈</h5>
                <p class="card-text">이웃과 소통하며 다양하고 풍부한 정보를 공유하세요.</p>
              </div>
            </div>
         </div>
         <div class="col-6 d-flex justify-content-center">
            <div class="card border-dark mb-3 w-100">
              <div class="card-header">경매</div>
              <div class="card-body">
                <h5 class="card-title">실시간 경매 페이지 오픈</h5>
                <p class="card-text">실시간 경매 진행으로 채팅과 배팅을 한번에 즐겨보세요.</p>
              </div>
            </div>
         </div>
      </div>
   </div>

   <div class="container mt-5 pt-5 pb-3">
      <div class="accordion" id="accordionPanelsStayOpenExample">
        <div class="accordion-item">
          <h2 class="accordion-header">
            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
              사파리 코인이 무엇인가요?
            </button>
          </h2>
          <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show">
            <div class="accordion-body">
              <p>사파리 코인은 사파리 페이지 내에서 유저가 가상으로 예치하여 현금처럼 사용 할수 있는 재화 입니다.</p>
            </div>
          </div>
        </div>
        <div class="accordion-item">
          <h2 class="accordion-header">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
              중고 서비스는 채팅이 가능한가요?
            </button>
          </h2>
          <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse">
            <div class="accordion-body">
              <p>네, 물론입니다. 채팅을 통하여 코인전송까지 가능합니다.</p>
            </div>
          </div>
        </div>
        <div class="accordion-item">
          <h2 class="accordion-header">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
              사파리 대여는 가격이 왜이렇게 저렴한가요?
            </button>
          </h2>
          <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse">
            <div class="accordion-body">
              <p>저희가 제공해 드리는 대여 서비스는 다양한 니즈를 위해 여러 제공업체와 협약을 맺어 합리적인 가격으로 제공드릴수 있습니다.</p>
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