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
<!-- 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<link rel="stylesheet" href="/safari/resources/style/common.css" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
 -->
<style type="text/css">
.btn_search{padding:9px 18px; background: #e6edfe; border:none; color: #789efd; border-radius:8px; font-size: 14px;}
.btn_delivered{padding:4px 12px; background: #f9e2e5; border:none; color: #dd7c7e; border-radius:8px; font-size: 14px;}
.btn_canceled{padding:4px 12px; background: #e6edfe; border:none; color: #789efd; border-radius:8px; font-size: 14px;}
.c_pointer{cursor: poniter;}
</style>
</head>
<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->
	
	<div class="container-fluid d-flex align-items-center justify-content-between p-3 px-5 mb-3 bg-light">
		<div class="container">
			<div class="row px-4">
				<p class="mb-0 text-body-secondary"><span class="mx-2" style="font-size: 15px;">대여</span> &gt; <span class="mx-2" style="font-size: 15px;">생활가전</span> &gt;<span class="mx-2" style="font-size: 15px;">커피머신</span> </p>
			</div>
		</div>
	</div>
	
	
	<div class="container">
		<div class="row">
			<div class="col-2 mt-4">
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
			
			<div class="col">
				<div class="row">
					<div class="col content_box_table">
						<div class="d-flex align-items-center content_box_input">
							<div class="me-4">	
								<input class="form-control" type="text" placeholder="Search">
							</div>
							
							<div class="btn-group me-4">
								<span class="py-2">Status: </span> 
							  <select class="form-select ms-2" style="width: 180px;">
								  <option selected>All</option>
								  <option value="1">One</option>
								  <option value="2">Two</option>
								  <option value="3">Three</option>
								</select>
							 </div>
							 
							 <div class="btn-group me-4">
								<span class="py-2">Type: </span>  
							  <select class="form-select ms-2" style="width: 180px;">
								  <option selected>All</option>
								  <option value="1">One</option>
								  <option value="2">Two</option>
								  <option value="3">Three</option>
								</select>
							 </div>
							 
							 <button class="btn_search">Search</button>
						</div>
						
						<div>
						
						</div>
					</div>
				</div>
				
				<div class="row mt-4">
					<div class="col" style="font-size: 15px;">
						<div class="row py-2">
							<div class="col-2 fw-bold text-body-tertiary">ORDER ID</div>
							<div class="col-2 fw-bold text-body-tertiary">COUNTRY</div>
							<div class="col-2 fw-bold text-body-tertiary">SHIP ADDRESS</div>
							<div class="col-2 fw-bold text-body-tertiary">SHIP DATE</div>
							<div class="col-1 fw-bold text-body-tertiary">STATUS</div>
							<div class="col-1 fw-bold text-body-tertiary">TYPE</div>
							<div class="col-2 fw-bold text-body-tertiary">ACTION</div>
						</div>
						
						<div class="row border-bottom py-3">
							<div class="col-2">63323-542</div>
							<div class="col-2">Argentina AR</div>
							<div class="col-2">1818 Barnett Park</div>
							<div class="col-2">1/1/2017</div>
							<div class="col-1 ps-0"><button class="btn_delivered fw-bold">Delivered</button></div>
							<div class="col-1">Retail</div>
							<div class="col-2">
								<i class="bi bi-gear-fill text-secondary px-2 c_pointer"></i>
								<i class="bi bi-pencil-fill text-secondary px-2 c_pointer"></i>
								<i class="bi bi-trash2-fill text-secondary px-2 c_pointer"></i>
							</div>
						</div>
						
						<div class="row border-bottom py-3">
							<div class="col-2">63323-542</div>
							<div class="col-2">Argentina AR</div>
							<div class="col-2">1818 Barnett Park</div>
							<div class="col-2">1/1/2017</div>
							<div class="col-1 ps-0"><button class="btn_canceled fw-bold">Canceled</button></div>
							<div class="col-1">Retail</div>
							<div class="col-2">
								<i class="bi bi-gear-fill text-secondary px-2 c_pointer"></i>
								<i class="bi bi-pencil-fill text-secondary px-2 c_pointer"></i>
								<i class="bi bi-trash2-fill text-secondary px-2 c_pointer"></i>
							</div>
						</div>
						
						<div class="row border-bottom py-3">
							<div class="col-2">63323-542</div>
							<div class="col-2">Argentina AR</div>
							<div class="col-2">1818 Barnett Park</div>
							<div class="col-2">1/1/2017</div>
							<div class="col-1 ps-0"><button class="btn_delivered fw-bold">Delivered</button></div>
							<div class="col-1">Retail</div>
							<div class="col-2">
								<i class="bi bi-gear-fill text-secondary c_pointer px-2"></i>
								<i class="bi bi-pencil-fill text-secondary c_pointer px-2"></i>
								<i class="bi bi-trash2-fill text-secondary c_pointer px-2"></i>
							</div>
						</div>
						
						<div class="row border-bottom py-3">
							<div class="col-2">63323-542</div>
							<div class="col-2">Argentina AR</div>
							<div class="col-2">1818 Barnett Park</div>
							<div class="col-2">1/1/2017</div>
							<div class="col-1 ps-0"><button class="btn_delivered fw-bold">Delivered</button></div>
							<div class="col-1">Retail</div>
							<div class="col-2">
								<i class="bi bi-gear-fill text-secondary c_pointer px-2"></i>
								<i class="bi bi-pencil-fill text-secondary c_pointer px-2"></i>
								<i class="bi bi-trash2-fill text-secondary c_pointer px-2"></i>
							</div>
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