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
<style>
.crs-1{height:600px; background: url("${pageContext.request.contextPath}/resources/img/main/main_banner_1.png"); background-size: cover; background-repeat: no-repeat;}
.crs-2{height:600px; background: url("https://images.pexels.com/photos/17504246/pexels-photo-17504246.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"); background-size: cover; background-repeat: no-repeat;}
.crs-3{height:600px; background: url("https://images.pexels.com/photos/16573228/pexels-photo-16573228.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"); background-size: cover; background-repeat: no-repeat;}
.crs-4{height:600px; background: url("https://images.pexels.com/photos/3647075/pexels-photo-3647075.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"); background-size: cover; background-repeat: no-repeat;}

</style>
</head>
<body>
   <!-- 헤더 섹션 -->
   <jsp:include page="../common/header.jsp"></jsp:include>
   <!-- 헤더 섹션 -->

   <div class="container bg-light">
      <div class="row">
         <div id="carouselExampleCaptions" class="carousel slide">
           <div class="carousel-indicators">
             <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
             <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
             <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
             <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="3" aria-label="Slide 4"></button>
           </div>
           <div class="carousel-inner">
             <div class="carousel-item crs-1 active">
               <div class="carousel-caption d-none d-md-block">
               </div>
             </div>
             <div class="carousel-item crs-2">
               <div class="carousel-caption d-none d-md-block">
                 <h5>대여</h5>
                 <p>값비싼 물건 손 쉽게 대여하세요!</p>
               </div>
             </div>
             <div class="carousel-item crs-3">
               <div class="carousel-caption d-none d-md-block">
                 <h5>경매</h5>
                 <p>평소 가지고 싶었던 물건 꼭 get하세요!</p>
               </div>
             </div>
               <div class="carousel-item crs-4">
               <div class="carousel-caption d-none d-md-block">
                 <h5>커뮤니티</h5>
                 <p>즐겁게 정보를 공유해요!</p>
               </div>
             </div>
           </div>
           <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
             <span class="carousel-control-prev-icon" aria-hidden="true"></span>
             <span class="visually-hidden">Previous</span>
           </button>
           <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
             <span class="carousel-control-next-icon" aria-hidden="true"></span>
             <span class="visually-hidden">Next</span>
           </button>
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
                    		<div class="col fw-bold fs-4">
                    			중고
                    		</div>
                    	</div>
                      
                     	<div class="row mt-2">
							<div class="col">
								사용자들과 <span style="color: #ff6f0f;">채팅</span> 기반으로 편리한 중고 거래 서비스를 이용하세요!
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
                    		<div class="col fw-bold fs-4">
                    			대여
                    		</div>
                    	</div>
                      
                     	<div class="row mt-2">
							<div class="col">
								부담스럽지 않은 <span class="text-primary">합리적 가격 대여 시스템</span>을 이용하여 값비싼 물건 손 쉽게 이용하세요!
							</div>
						</div>
					
                    </div>
                 </div>
                <div class="row">
                   <div class="col">
                      <img class="img-fluid" alt="" src="${pageContext.request.contextPath}/resources/img/main/img_item1.png">
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
                    		<div class="col fw-bold fs-4">
                    			경매
                    		</div>
                    	</div>
                      
                     	<div class="row mt-2">
							<div class="col">
								<span class="text-danger">실시간 경매 시스템</span>을 이용하여 평소에 갖고 싶었던 물건을 얻어가세요!
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
                    		<div class="col fw-bold fs-4">
                    			커뮤니티
                    		</div>
                    	</div>
                      
                     	<div class="row mt-2">
							<div class="col">
								즐겁게 이야기를 나누고 각종 정보를 공유해보아요!
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
      <div class="card text-center">
        <div class="card-header">
          Featured
        </div>
        <div class="card-body">
          <h5 class="card-title">Special title treatment</h5>
          <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
          <a href="#" class="btn btn-primary">Go somewhere</a>
        </div>
        <div class="card-footer text-body-secondary">
          2 days ago
        </div>
      </div>
   </div>

   <div class="container mt-5 pt-5 pb-3">
      <div id="carouselExampleFade" class="carousel slide carousel-fade">
        <div class="carousel-inner">
          <div class="carousel-item bg-secondary active" style="height: 400px;">
            <img src="" class="d-block w-100" alt="...">
          </div>
          <div class="carousel-item bg-secondary" style="height: 400px;">
            <img src="" class="d-block w-100" alt="...">
          </div>
          <div class="carousel-item bg-secondary" style="height: 400px;">
            <img src="" class="d-block w-100" alt="...">
          </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>
   </div>


   <div class="container mt-5 pt-5 pb-3">
      <div class="row">
         <div class="col d-flex justify-content-center">
            <div class="card border-dark mb-3">
              <div class="card-header">Header</div>
              <div class="card-body">
                <h5 class="card-title">Dark card title</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
              </div>
            </div>
         </div>
         <div class="col d-flex justify-content-center">
            <div class="card border-dark mb-3">
              <div class="card-header">Header</div>
              <div class="card-body">
                <h5 class="card-title">Dark card title</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
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
              Accordion Item #1
            </button>
          </h2>
          <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show">
            <div class="accordion-body">
              <strong>This is the first item's accordion body.</strong> It is shown by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
            </div>
          </div>
        </div>
        <div class="accordion-item">
          <h2 class="accordion-header">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
              Accordion Item #2
            </button>
          </h2>
          <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse">
            <div class="accordion-body">
              <strong>This is the second item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
            </div>
          </div>
        </div>
        <div class="accordion-item">
          <h2 class="accordion-header">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
              Accordion Item #3
            </button>
          </h2>
          <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse">
            <div class="accordion-body">
              <strong>This is the third item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
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