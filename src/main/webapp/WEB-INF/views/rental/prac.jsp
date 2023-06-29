<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사파리 | 대여메인</title>
<!-- 메타 섹션 -->
<jsp:include page="../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<link rel="stylesheet" href="/safari/resources/style/common.css" type="text/css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

</head>
<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->
	
	<div class="container-fluid d-flex align-items-center justify-content-between p-3 px-5 mb-3 bg-light">
		<div class="container">
			<div class="row px-4">
				<p class="mb-0 text-body-secondary">대여 &gt; 생활가전 &gt; 커피머신 </p>
			</div>
		</div>
	</div>
	
	
	<div class="container d-flex">
			<div style="width: 24%;">
				<ul class="list-group">
				  <li class="list-group-item border border-0 py-2"><a class="btn fs-5 text fw-bold py-1" href="#">전체보기</a></li>
				  <li class="list-group-item border border-0 py-2"><a class="btn fs-5 text fw-bold py-1" href="#collapse1" data-bs-toggle="collapse">가구</a></li>
				  	<div class="collapse" id="collapse1">
						<ul class="list-group ms-4">
							<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">침대</a></li>
							<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">테이블</a></li>
							<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">소파</a></li>
							<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">서랍장</a></li>
						</ul>
					</div>
					
				  <li class="list-group-item border border-0 py-2"><a class="btn fs-5 text fw-bold py-1" href="#collapse2" data-bs-toggle="collapse">생활가전</a></li>
				  	<div class="collapse" id="collapse2">
						<ul class="list-group ms-4">
							<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">커피머신</a></li>
							<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">선풍기</a></li>
							<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">공기청정기</a></li>
							<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">에어컨</a></li>
							<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">안마의자</a></li>
						</ul>
					</div>
					
				  <li class="list-group-item border border-0 py-2"><a class="btn fs-5 text fw-bold py-1" href="#collapse3" data-bs-toggle="collapse">주방가전</a></li>
				  	<div class="collapse" id="collapse3">
						<ul class="list-group ms-4">
							<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">레인지</a></li>
							<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">밥솥</a></li>
							<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">음식물쓰레기처리기</a></li>
							<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">식기세척기</a></li>
						</ul>
					</div>
					
				  <li class="list-group-item border border-0 py-2"><a class="btn fs-5 text fw-bold py-1" href="#collapse4" data-bs-toggle="collapse">전자기기</a></li>
				  	<div class="collapse" id="collapse4">
						<ul class="list-group ms-4">
							<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">노트북</a></li>
							<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">태블릿pc</a></li>
							<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">프로젝터</a></li>
							<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">스피커</a></li>
						</ul>
					</div>
				</ul>
			</div>
			
			<div>
				<div class="d-flex justify-content-end">
					<div class="btn-group me-3">
					  <button type="button" class="btn btn-secondary dropdown-toggle py-1" data-bs-toggle="dropdown" data-bs-display="static" aria-expanded="false">
					    정렬
					  </button>
					  <ul class="dropdown-menu dropdown-menu-lg-end">
					    <li><a class="dropdown-item" href="#">** 별</a></li>
					    <li><a class="dropdown-item" href="#">** 별</a></li>
					    <li><a class="dropdown-item" href="#">** 별</a></li>
					  </ul>
					 </div>
				</div>
				
			<div class="d-flex flex-wrap justify-content-around pt-2">
				<div class="mb-4" style="cursor: pointer;">
					<div class="card border border-0" style="width: 18rem;">
					  <img src="https://images.pexels.com/photos/13196768/pexels-photo-13196768.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" class="card-img-top rounded-3 object-fit-cover" alt="..." style="height: 320px;">
					  <div class="card-body ps-0">
					    <p class="fs-5">Card title</p>
					    <p class="text-body-secondary">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <p><b>18,900원 / 월</b></p>
					  </div>
					</div>
				</div>
				
				<div class="mb-4" style="cursor: pointer;">
					<div class="card border border-0" style="width: 18rem;">
					  <img src="https://images.pexels.com/photos/13196768/pexels-photo-13196768.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" class="card-img-top rounded-3 object-fit-cover" alt="..." style="height: 320px;">
					  <div class="card-body ps-0">
					    <p class="fs-5">Card title</p>
					    <p class="text-body-secondary">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <p><b>18,900원 / 월</b></p>
					  </div>
					</div>
				</div>
				
				<div class="mb-4" style="cursor: pointer;">
					<div class="card border border-0" style="width: 18rem;">
					  <img src="https://images.pexels.com/photos/13196768/pexels-photo-13196768.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" class="card-img-top rounded-3 object-fit-cover" alt="..." style="height: 320px;">
					  <div class="card-body ps-0">
					    <p class="fs-5">Card title</p>
					    <p class="text-body-secondary">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <p><b>18,900원 / 월</b></p>
					  </div>
					</div>
				</div>		
				
				<div class="mb-4" style="cursor: pointer;">
					<div class="card border border-0" style="width: 18rem;">
					  <img src="https://images.pexels.com/photos/13196768/pexels-photo-13196768.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" class="card-img-top rounded-3 object-fit-cover" alt="..." style="height: 320px;">
					  <div class="card-body ps-0">
					    <p class="fs-5">Card title</p>
					    <p class="text-body-secondary">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <p><b>18,900원 / 월</b></p>
					  </div>
					</div>
				</div>
				<div class="mb-4" style="cursor: pointer;">
					<div class="card border border-0" style="width: 18rem;">
					  <img src="https://images.pexels.com/photos/13196768/pexels-photo-13196768.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" class="card-img-top rounded-3 object-fit-cover" alt="..." style="height: 320px;">
					  <div class="card-body ps-0">
					    <p class="fs-5">Card title</p>
					    <p class="text-body-secondary">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <p><b>18,900원 / 월</b></p>
					  </div>
					</div>
				</div>
				
				<div class="mb-4" style="cursor: pointer;">
					<div class="card border border-0" style="width: 18rem;">
					  <img src="https://images.pexels.com/photos/13196768/pexels-photo-13196768.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" class="card-img-top rounded-3 object-fit-cover" alt="..." style="height: 320px;">
					  <div class="card-body ps-0">
					    <p class="fs-5">Card title</p>
					    <p class="text-body-secondary">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <p><b>18,900원 / 월</b></p>
					  </div>
					</div>
				</div>		
						
			</div>
		</div>
		</div>
	
	
	
	
	
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>	
</html>