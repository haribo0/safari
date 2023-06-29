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

</head>
<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->
	
	<div class="container-fluid d-flex align-items-center justify-content-between p-3 px-5 mb-3 bg-light">
		<div class="container">
			<div class="row px-4">
				<p class="mb-0 text-body-secondary"><a href="${pageContext.request.contextPath}/rental/mainPage" class="btn" style="font-size: 15px;">대여</a> &gt; <span class="mx-2" style="font-size: 15px;">전체보기</span></p>
			</div>
		</div>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-2 mt-4">
				<ul class="list-group">
				  <li class="list-group-item border border-0 py-2"><a class="btn fs-5 text fw-bold py-1" href="#">전체보기</a></li>
				  <c:forEach items="${categoryList}" var="map" varStatus="status">
<%-- 					  <li class="list-group-item border border-0 py-2"><a class="btn fs-5 text fw-bold py-1" data-bs-toggle="collapse" href="#collapse${status.index}">${map.categoryItem.main_category_name}</a></li>			   --%>
					  <li class="list-group-item border border-0 py-2"><a class="btn fs-5 text fw-bold py-1" >${map.categoryItem.main_category_name}</a></li>			  
	  				  	<div class="" id="">
							<ul class="list-group ms-4">
								<c:forEach items="${map.subTitleList}" var="subTitle">
										<li class="list-group-item border-0"><a href="#" class="btn py-0 text-body-secondary">${subTitle.sub_category_name}</a></li>																		
								</c:forEach>
							</ul>
						</div>
				  </c:forEach>
				</ul>
			</div>
			
			<div class="col px-4">
				<div class="d-flex justify-content-end">
					<div class="btn-group">
					  <button type="button" class="btn btn-secondary dropdown-toggle py-1" data-bs-toggle="dropdown" data-bs-display="static" aria-expanded="false">
					    정렬
					  </button>
					  <ul class="dropdown-menu dropdown-menu-lg-end">
					    <li><a class="dropdown-item" href="#">찜</a></li>
					    <li><a class="dropdown-item" href="#">리뷰</a></li>
					    <li><a class="dropdown-item" href="#">구매</a></li>
					  </ul>
					 </div>
				</div>
				
			<div class="d-flex flex-wrap justify-content-between pt-2">
 				<c:forEach items="${rentalItemList}" var="map">
					<div class="mb-5" style="cursor: pointer;">
						<div class="card border border-0" style="width: 14rem;">
							<a href="./productDescPage?id=${map.rentalItemDto.id}" class="text-decoration-none d-inline-block">
							  <img src="/safariImg/${map.rentalItemDto.main_img_link}" class="card-img-top rounded-3 object-fit-cover" alt="..." style="min-height: 260px;" >
							</a>
						  <div class="card-body ps-0">
						  	<div class="d-flex justify-content-between">
						    	<p class="text-dark"><a href="./productDescPage?id=${map.rentalItemDto.id}" class="text-decoration-none d-inline-block text-dark">${map.rentalItemDto.title}</a></p>
						  		<p><span class="fw-bold" id="totalLikeCount"></span><i id="heartBox" onclick="toggleLike(${map.rentalItemDto.id})" class="text-danger bi bi-heart heart_box" data-item-id="${map.rentalItemDto.id}"></i></p>
						  	</div>
						    <p style="min-height: 48px;"><a href="./productDescPage?id=${map.rentalItemDto.id}" class="text-decoration-none d-inline-block text-body-secondary">${map.rentalItemDto.item_description}</a></p>
						    <p><b class="text-dark"><a href="./productDescPage?id=${map.rentalItemDto.id}" class="text-decoration-none d-inline-block text-dark">${map.rentalItemDto.price}원 / 월</a></b></p>
						  </div>
						 </div>
					</div>
				</c:forEach>
			</div>
			</div>
		</div>
	</div>
	
	
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<script>

// 로그인된 세션 초기화
/* let mySessionId = null;

// 세션가져오기
function getSessionId(){
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			if(response.result == "success"){
				mySessionId = response.id;
			}
		}
	}
	
	xhr.open("get", "../user/getMyId", false);
	xhr.send();		
}

// 좋아요 토글
	function toggleLike(val){
		console.log('아이템:: ', val)
	if(mySessionId == null){
		if(confirm("로그인을 하셔야 이용하실 수 있습니다. 로그인 하시겠습니까?")){
			location.href = "../user/loginPage";
		}
		return;
	}
	
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			refreshMyHeart(val);
//			refreshTotalLikeCount();
		}
	}
	
	xhr.open("get", "./toggleRentalItemLike?item_id=" + val);
	xhr.send();
	
}


// 내가(로그인한 사용자)가 좋아요 누름 리프레시
	function refreshMyHeart(val){
		if(!val) {
			return
		}
		
		if(mySessionId == null) return;
		const xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				const response = JSON.parse(xhr.responseText);
				const heartBox = document.querySelectorAll(".heart_box");
				
 				for(let i =0; i<heartBox.length; i++){
					let itemId = heartBox[i].dataset.itemId
					if(val == itemId){
						if(response.isLiked){
							heartBox[i].classList.remove("bi-heart");
							heartBox[i].classList.add("bi-heart-fill");
						}else{
							heartBox[i].classList.remove("bi-heart-fill");
							heartBox[i].classList.add("bi-heart");
						}
					}
				} 
			}
		}
		
		xhr.open("get", "./isLiked?item_id="+val);
		xhr.send();
	}

window.addEventListener("DOMContentLoaded", function(){
	getSessionId();

	const heartBox = document.querySelectorAll(".heart_box");
	for(let j =0; j<heartBox.length; j++) {
		let id = heartBox[j].dataset.itemId
		refreshMyHeart(id)
	}
}); */
</script>

</body>	
</html>