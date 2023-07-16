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
.crs-1{height:600px; background: url("https://images.pexels.com/photos/16963896/pexels-photo-16963896.jpeg"); background-size: cover; background-repeat: no-repeat;}
.crs-2{height:600px; background: url("https://images.pexels.com/photos/17504246/pexels-photo-17504246.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"); background-size: cover; background-repeat: no-repeat;}
.crs-3{height:600px; background: url("https://images.pexels.com/photos/16573228/pexels-photo-16573228.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"); background-size: cover; background-repeat: no-repeat;}
.crs-4{height:600px; background: url("https://images.pexels.com/photos/3647075/pexels-photo-3647075.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"); background-size: cover; background-repeat: no-repeat;}

/* common */
.wrap {position:relative;}
.inner {max-width:1100px; height: 100%;  margin: 0 auto;}
.img{width:100%;}

/* main */
.motion-section {background:#fff;}
.motion-section .motion-wrap {position:relative;}
.motion-section .motion-wrap:after {clear:both; display:block; content:'';}
.motion-section .motion-wrap .text-box {float:left; width:50%; padding-top:600px;}
.motion-section .motion-wrap .text-box p {max-width:90%; font-size:36px; color:#5e5e5e; transition: all .25s;}
.motion-section .motion-wrap .text-box p.active {color:#fff; transform: scale(1.125);}
.motion-section .motion-wrap .text-box p.para02 {margin-top:600px;}
.motion-section .motion-wrap .text-box p.para03 {margin-top:600px;}
.motion-section .motion-wrap .text-box p.para04 {margin-top:600px; margin-bottom:500px;}

.motion-section .motion-wrap .image-box {position: sticky; position: -webkit-sticky; top:calc(50vh - 204px); left: 0; z-index: 40; float:left; width:50%;}
.motion-section .motion-wrap .image-box .image-inner {position:relative; width: 420px; height:409px; margin:0 auto; }
.motion-section .motion-wrap .image-box .image-inner .img_device {position:absolute; left:0; top:0; right:0; bottom:0; z-index:20;}
.motion-section .motion-wrap .image-box .image-inner .slide_wrap {overflow:hidden; position: absolute; left:15px; top:16px; z-index:10; width:390px; height:237px;}
.motion-section .motion-wrap .image-box .image-inner .slide_wrap .slide {width: 1540px; height: 100%; transition:transform .5s;}
.motion-section .motion-wrap .image-box .image-inner .slide_wrap .slide figure {float:left; width:385px;}

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
			        <h5>중고</h5>
			        <p>이웃들과 함께 저탄소 운동을 해요!</p>
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
				<div class="card w-100">
				  <div class="card-body">
				    <p class="card-text fw-bold">중고</p>
				    <p class="card-text">채팅 기반으로 편리한 중고 거래</p>
				  </div>
				</div>
			</div>
			<div class="col d-flex justify-content-center">
				<div class="card w-100">
				  <div class="card-body">
				    <p class="card-text fw-bold">대여</p>
				    <p class="card-text">부담스럽지 않은 합리적 가격 대여</p>
				  </div>
				</div>
			</div>
			<div class="col d-flex justify-content-center">
				<div class="card w-100">
				  <div class="card-body">
				    <p class="card-text fw-bold">경매</p>
				    <p class="card-text">실시간 시스템도입의 경매</p>
				  </div>
				</div>
			</div>
			<div class="col d-flex justify-content-center">
				<div class="card w-100">
				  <div class="card-body">
				    <p class="card-text fw-bold">커뮤니티</p>
				    <p class="card-text">다양한 정보 공유의 장</p>
				  </div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container py-5 my-5">
		<h2 class="text-center fs-2 py-3 my-3" >사파리를 소개 합니다</h2>
		<div class="wrap mt-5">
			<section class="motion-section">
				<article class="motion-wrap inner">
					<div class="text-box">
						<p class="para01">
							중고<br>
							쉽고 간편하게 이웃과 거래해요
						</p>
						<p class="para02">
							대여<br>
							필요한 물건을 값싸게 이용해요
						</p>
						<p class="para03">
							경매<br>
							평소에 가지고픈 물건을 구매해요
						</p>
						<p class="para04">
							커뮤니티<br>
							이것저것 정보를 공유해요
						</p>
					</div>
					<div class="image-box">
						<div class="image-inner">
							<figure class="img_device">
								<img class="img" src="/safari/resources/img/bg_device.png" alt="">
							</figure>
							<div class="slide_wrap">
								<div class="slide">
									<figure>
										<img class="img" src="https://img1.cgtrader.com/items/3612740/52e6cc7120/grid/cinnamoroll-3d-modeling-blend-file-3d-model-blend.jpg">
									</figure>
									<figure>
										<img class="img" src="https://img-new.cgtrader.com/items/4209238/ae2b7d2dd7/grid/oso-kawaii-3d-model-ae2b7d2dd7.jpg">
									</figure>
									<figure>
										<img class="img" src="https://img2.cgtrader.com/items/2227421/20dc440563/grid/sea-seal-3d-model-stl.jpg">
									</figure>
									<figure>
										<img class="img" src="https://img-new.cgtrader.com/items/4057207/6c0878d2bc/grid/chick-trio-3d-model-6c0878d2bc.jpg">
									</figure>
								</div>
							</div>
						</div>
					</div>
				</article>
			</section>
		</div>
		<div style="height: 400px;"></div>
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
	
	<script>
window.onload = function() {
	/*
		본 인터렉션 스크립트는 취업을 위한 포트폴리오 용으로 참고 하였으며
		절대 사업 및 금전적 취득을 위함이 아닌 것을 밝힙니다.
	*/
	let scrollBody = document.querySelector('.motion-section');

	let scrollHeight;
	let sectionOffsetTop;
	let sectionScrollTop;
	let scrollRealHeight;
	let winScrollTop;
	let scrollPerecnt;
	let percent;
	let isMobile;

	function scrollFunc() {

		setProperty();
		doAnim();
		
	};

	function setProperty() {
		scrollHeight = scrollBody.offsetHeight; // 스크롤될 div의 높이
		winScrollTop = window.pageYOffset; // 스크롤top길이
		sectionOffsetTop = scrollBody.getBoundingClientRect().top + winScrollTop; // 섹션의 위치
		scrollRealHeight = (scrollHeight - window.innerHeight); // 스크롤 길이
		sectionScrollTop = winScrollTop - sectionOffsetTop; // 섹션 스크롤탑
		scrollPerecnt =  sectionScrollTop / scrollRealHeight; // 위치 퍼센트 준비
		percent = scrollPerecnt * 100 ; // 퍼센트
	};

	function doAnim() {

		let imgBox = document.querySelector('.image-box .slide_wrap figure');
		let imgWidth = imgBox.offsetWidth;

		if(percent >= 20 && percent < 40){

			imageChange(imgWidth * 0);
			document.querySelector('.motion-section .text-box .para01').classList.add('active');

		}

		if(percent >= 50 && percent < 110) {

			imageChange(imgWidth * 1);
			document.querySelector('.motion-section .text-box .para02').classList.add('active');

		}

		if(percent >= 90 && percent < 120) {

			imageChange(imgWidth * 2);
			document.querySelector('.motion-section .text-box .para03').classList.add('active');

		}

		if(percent >= 120) {

			imageChange(imgWidth * 3);
			document.querySelector('.motion-section .text-box .para04').classList.add('active');

		}

		if(percent < 18 ){
			document.querySelector('.motion-section .text-box .para01').classList.remove('active');
			document.querySelector('.motion-section .text-box .para02').classList.remove('active');
			document.querySelector('.motion-section .text-box .para03').classList.remove('active');
			document.querySelector('.motion-section .text-box .para04').classList.remove('active');
		}
	};

	function imageChange(moveX) {
			let img = document.querySelector('.motion-section .slide_wrap .slide');
			img.style.transform = 'translateX('+ -moveX +'px)';
	};

	function init() {

		scrollFunc();
	};

	window.addEventListener('scroll', function() {

		scrollFunc();
	});

	window.addEventListener('resize', function() {

		scrollFunc();
	});

	init();
};
</script>
</body>	
</html>