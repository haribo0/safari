<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사파리 | 중고메인</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<jsp:include page="../common/meta.jsp"></jsp:include>
<style>
    .smaller-text {
        font-size: 13px;
    }
    .custom-span {
        display: inline-block;
        height: 0.5cm;
    }
    .btn-sm-custom {
     	font-size : 12px;
        line-height: 0.4cm;
    }
	.reset-button {
	    background: none;
	    border: none;
	    padding: 0;
	    margin: 0;
	    cursor: pointer;
</style>

</head>
<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->
	<div class="container-fluid d-flex align-items-center justify-content-between p-3 px-5 mb-3 bg-light">
		<div class="container">
			<div class="row px-4">
				<p class="mb-0 text-body-secondary"><span class="mx-2" style="font-size: 15px;">중고</span> &gt; <span class="mx-2" style="font-size: 15px;">패션의류</span> &gt;<span class="mx-2" style="font-size: 15px;">상의</span> </p>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
		<div class="container main_box">
			<div class="row"><h1 class="text-center fs-3">베스트</h1></div>
				<jsp:include page="../used/categoryNavi.jsp"></jsp:include>
				<div class="col mb-1 mt-4">
					<div class="row">
					<c:forEach items="${list }" var="map">
						<div class="col-3">
							<div class="row mb-1">
							<a href="./productDetail?productId=${map.productDto.id}" class="text-decoration-none text-black">
							<img alt="img" src="/safarifile/${map.productImgDto.product_img_link }" height="210" width="200">
							</a>
							</div>
							<div class="row">
								<div class="col">
									<a href="./productDetail?productId=${map.productDto.id}" class="ms-1 text-decoration-none text-black">
									${map.productDto.title }
									</a>
								</div>
								<div class="col-5 mt-0">
									<c:if test="${map.reservationCount > 0 }">
    									<div><button type="button" class="btn btn-outline-success btn-sm p-1 m-0 btn-sm-custom" disabled>예약중</button></div>
    								</c:if>
    								<c:if test="${map.completeCount > 0 }">
    									<div><button type="button" class="btn btn-outline-success btn-sm m-0 p-1 btn-sm-custom" disabled>거래완료</button></div>
    								</c:if>
    								<c:if test="${map.completeCount == 0 && map.reservationCount == 0}">
    									<span class="custom-span"></span>
    								</c:if>
								</div>
							</div>
							<div class="row ms-1 fw-semibold">
								<c:choose>
									<c:when test="${map.productDto.price == 0}">
										<button type="button" class="btn btn-warning btn-sm col-2 p-0 text-black" disabled>나눔</button>
									</c:when>
									<c:otherwise>
										<fmt:formatNumber value="${map.productDto.price}" pattern="#,##0" />
									</c:otherwise>
								</c:choose>
							</div>
							<div class="row ms-1">
   								<div class="col ms-0 p-0 w-0 smaller-text">${map.productCityDto.product_city_name} ${map.productTownDto.product_town_name }</div>
							</div>
							<div class="row mb-5">
								<div class="col ms-1 text-secondary"
									><i class="bi bi-heart-fill"></i> ${map.likeCount } <i class="bi bi-chat-dots-fill"></i> ${map.requestCount }
								</div>
							</div>
						</div>
					<c:if test="${loop.index % 5 == 4}">
            		</div>
           			 <div class="row">
       				 </c:if>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="row mt-1">
		</div>
	</div>
</div>
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

<script>

//도시에 따른 동네 
function getTownList() {
    const cityBox = document.getElementById("product_city");
    let cityId = cityBox.value;
    const townBox = document.getElementById("product_town");
    

    const xhr = new XMLHttpRequest();

    xhr.onreadystatechange = function(){
        if(xhr.readyState == 4 && xhr.status == 200){
            const response = JSON.parse(xhr.responseText);
            townBox.innerHTML = "";

            // 동네 옵션에 따른 추가 
            let defaultOption = document.createElement("option");
            defaultOption.value = "0";
            defaultOption.selected = true;
            defaultOption.textContent = "동네를 선택하세요";
            townBox.appendChild(defaultOption);

            response.getTownList.forEach(function(data) {
                const option = document.createElement("option");
                option.value = data.id;
                option.textContent = data.product_town_name;
                townBox.appendChild(option);
            });
        }
    }

    xhr.open("get", "./getTownList?cityId="+cityId);
    xhr.send();
}

const cityBox = document.getElementById("product_city");
cityBox.addEventListener("change", getTownList);

</script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js">
</script>


</body>
</html>