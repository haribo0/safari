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
<link rel="stylesheet" href="/safari/resources/style/auction.css" type="text/css">
<style>
   a {
   	list-style: none;
   }
.overflow {
  white-space: nowrap; /* 텍스트를 한 줄로 표시 */
  overflow: hidden; /* 넘친 텍스트를 숨김 */
  text-overflow: ellipsis; /* 넘친 텍스트를 "..."으로 표시 */
}
.orangeButton1{
   background: #FF812C;
   font-weight: 400;
   color: white;
}
.orangeButton1:hover{
   background: #FF812C;
   font-weight: bold;
   color: white;
}

      

</style>
</head>
<body>

	<!-- 헤더 섹션 -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->
	
	<!-- 마이페이지 상단 블럭 -->
	<jsp:include page="../common/myPageTop.jsp"></jsp:include>
	<!-- 마이페이지 상단 블럭 -->

	<div class="container d-flex mt-5 px-0">
		<div class="row w-100">
		<!-- 마이페이지 nav -->
		<jsp:include page="../common/myPageNav.jsp"></jsp:include>
		<!-- 마이페이지 nav -->
			
		<div class="col ms-4">
			<div class="row" style="border-bottom: 2px solid #222; height: 48px;">
				<div class="col p-0">
					<h5>나의 판매내역</h5>						
				</div>
			</div>
			
			<div class="row mt-4" style="color: #777777; margin-left: -8px">
				<ul>
			        <li>금지 품목 거래 시, 제재 받을 수 있어요.</li>
			        <li>적절하지 않은 상품명, 이미지, 가격 등록 시에 제재 받을 수 있어요.</li>
			        <li>외부 채널로의 연락 유도, 타 사이트로의 결제 유도 시 제재 받을 수 있어요.</li>
			        <li>욕설, 성희롱 등 비매너 행위는 타인을 불쾌하게 해요.</li>
			    </ul>
			</div>
			
			<div class="row mt-3">
				<div class="col-auto px-1">
					<button class="btn btn-sm px-3" onclick="getMySellListByStatus(0)" id="all">전체</button>						
				</div>
				<div class="col-auto px-1">
					<button class="btn btn-sm px-3" onclick="getMySellListByStatus(1)" id="selling">판매중</button>						
				</div>
				<div class="col-auto px-1">
					<button class="btn btn-sm px-3" onclick="getMySellListByStatus(2)" id="reservation">예약중</button>						
				</div>
				<div class="col-auto px-1">
					<button class="btn btn-sm px-3" onclick="getMySellListByStatus(3)" id="sold">판매완료</button>						
				</div>
				<div class="col"></div>
				<div class="col-auto text-end"><a href="../used/productRegister"><button class="btn btn-sm px-3 btn-dark">상품 등록</button></a></div>
			</div>
			
			<div class="row mt-3 mb-5">
				<div class="col">
						<div class="row fw-medium border-bottom border-top border-black border-1 py-2">
							<div class="col-5 text-center">상품정보</div>
							<div class="col-2 text-center">가격</div>
							<div class="col-2 text-center">작성일자</div>
							<div class="col text-center">비고</div>
						</div>
					
					<div class="cotainer" id="listContainer">	
					 <%-- <c:forEach items="${list}" var="map"> 
					 	<c:if test="${map.reservationCount < 1 }">
						<div class="row border-bottom py-2">
							<div class="col-5">
								<div class="row my-auto">
									<input type="hidden" id="bid_${bidDto.auction_item_id}" value="${bidDto.id}">
									<div class="col-3 ms-1"  style="float: left;">
										
										<a href="/safari/used/productDetail/1">
										<img src="/safari/resources/img/used/soso.png" style="width: 120px; height: 120px;"></a>
									</div>
									<div class="col ms-5" class="text-start">
										<div class="row mt-4 mb-1">
											<div class="col fw-light" style="font-size: 15px;">
												잡화 > 운동화
											</div>
										</div>
										<div class="row">
											<div class="col fw-bold">
												<span><a href="/safari/used/productDetail/1" style="font-size: 17px;">
												운동화 팔아요</a></span>
											</div>
										</div>
										<div class="row">
											<div class="col text-secondary" style="font-size: 14px;">
											 	서울시 강남구
											</div>
										</div>
									</div>									
								</div>
							</div>	
							<div class="col-2 my-auto text-center fw-semibold" style="font-size: 17px;">
								10,000원
							</div>
							
							<div class="col-2 my-auto text-center">
								2023-07-22
							</div>
							
							<div class="col my-auto text-center">
								<div class="row">
									<div class="col">
										<button class="btn btn-sm orangeButton"  style="width: 120px">끌어올리기</button>
									</div>
								</div>
								<div class="row mt-2">
									<div class="col text-end p-0" style="margin-right: 5px;">
										<button class="btn btn-sm btn-outline-dark px-3">수정</button>
									</div>
									<div class="col text-start p-0">
										<button class="btn btn-sm btn-outline-dark px-3">삭제</button>
									</div>
								</div>
							</div>
						</div>
						</c:if>
						<c:if test="${map.reservationCount > 0 }">
						<div class="row border-bottom py-2">
							<div class="col-5">
								<div class="row my-auto">
									<div class="col-3 ms-1"  style="float: left;">
										
										<a href="/safari/used/productDetail/1">
										<img src="/safari/resources/img/used/soso.png" style="width: 120px; height: 120px;"></a>
									</div>
									<div class="col ms-5" class="text-start">
										<div class="row mt-4 mb-1">
											<div class="col fw-light" style="font-size: 15px;">
												잡화 > 운동화
											</div>
										</div>
										<div class="row">
											<div class="col fw-bold">
												<span><a href="/safari/used/productDetail/1" style="font-size: 17px;">
												운동화 팔아요</a></span><span><button class="btn btn-success btn-sm btn-sm-custom ms-2" disabled
												style="padding: 1px 6px; font-size: 13px; margin-top: -3px;">예약중</button></span>
											</div>
										</div>
										<div class="row">
											<div class="col text-secondary" style="font-size: 14px;">
											 	서울시 강남구
											</div>
										</div>
									</div>									
								</div>
							</div>	
							<div class="col-2 my-auto text-center fw-semibold" style="font-size: 17px;">
								10,000원
							</div>
							
							<div class="col-2 my-auto text-center">
								2023-07-22
							</div>
							
							<div class="col my-auto text-center">
								<div class="row">
									<div class="col">
										<button class="btn btn-sm btn-outline-success" style="width: 120px">예약취소</button>
									</div>
								</div>
								<div class="row mt-2">
									<div class="col text-end p-0" style="margin-right: 5px;">
										<button class="btn btn-sm btn-outline-dark px-3">수정</button>
									</div>
									<div class="col text-start p-0">
										<button class="btn btn-sm btn-outline-dark px-3">삭제</button>
									</div>
								</div>
							</div>
						</div>
						</c:if>
						<c:if test="${map.completeCount > 0 && map.usedPurchaseReviewDto == null}">
						<div class="row border-bottom py-2">
							<div class="col-5">
								<div class="row my-auto">
									<div class="col-3 ms-1"  style="float: left;">
										
										<a href="/safari/used/productDetail/1">
										<img src="/safari/resources/img/used/soso.png" style="width: 120px; height: 120px;"></a>
									</div>
									<div class="col ms-5" class="text-start">
										<div class="row mt-4 mb-1">
											<div class="col fw-light" style="font-size: 15px;">
												잡화 > 운동화
											</div>
										</div>
										<div class="row">
											<div class="col fw-bold">
												<span><a href="/safari/used/productDetail/1" style="font-size: 17px;">
												운동화 팔아요</a></span><span><button class="btn btn-secondary btn-sm btn-sm-custom ms-2" disabled
												style="padding: 1px 6px; font-size: 13px; margin-top: -3px;">거래완료</button></span>
											</div>
										</div>
										<div class="row">
											<div class="col text-secondary" style="font-size: 14px;">
											 	서울시 강남구
											</div>
										</div>
									</div>									
								</div>
							</div>	
							<div class="col-2 my-auto text-center fw-semibold" style="font-size: 17px;">
								10,000원
							</div>
							
							<div class="col-2 my-auto text-center">
								2023-07-22
							</div>
							
							<div class="col my-auto text-center">
								<div class="row">
									<div class="col">
										<button class="btn btn-sm btn-outline-primary" style="width: 120px">후기보내기</button>
									</div>
								</div>
								<div class="row mt-2">
									<div class="col text-end p-0" style="margin-right: 5px;">
										<button class="btn btn-sm btn-outline-dark px-3">수정</button>
									</div>
									<div class="col text-start p-0">
										<button class="btn btn-sm btn-outline-dark px-3">삭제</button>
									</div>
								</div>
							</div>
						</div>
						</c:if>
						<c:if test="${map.completeCount > 0 && map.usedPurchaseReviewDto != null}">
						<div class="row border-bottom py-2">
							<div class="col-5">
								<div class="row my-auto">
									<input type="hidden" id="bid_${bidDto.auction_item_id}" value="${bidDto.id}">
									<div class="col-3 ms-1"  style="float: left;">
										
										<a href="/safari/used/productDetail/1">
										<img src="/safari/resources/img/used/soso.png" style="width: 120px; height: 120px;"></a>
									</div>
									<div class="col ms-5" class="text-start">
										<div class="row mt-4 mb-1">
											<div class="col fw-light" style="font-size: 15px;">
												잡화 > 운동화
											</div>
										</div>
										<div class="row">
											<div class="col fw-bold">
												<span><a href="/safari/used/productDetail/1" style="font-size: 17px;">
												운동화 팔아요</a></span><span><button class="btn btn-secondary btn-sm btn-sm-custom ms-2" disabled
												style="padding: 1px 6px; font-size: 13px; margin-top: -3px;">거래완료</button></span>
											</div>
										</div>
										<div class="row">
											<div class="col text-secondary" style="font-size: 14px;">
											 	서울시 강남구
											</div>
										</div>
									</div>									
								</div>
							</div>	
							<div class="col-2 my-auto text-center fw-semibold">
								10,000원
							</div>
							
							<div class="col-2 my-auto text-center">
								2023.07.22
							</div>
							
							<div class="col my-auto text-center">
								<div class="row">
									<div class="col">
										<button class="btn btn-sm btn-secondary" style="width: 120px">보낸 후기 보기</button>
									</div>
								</div>
								<div class="row mt-2">
									<div class="col text-end p-0" style="margin-right: 5px;">
										<button class="btn btn-sm btn-outline-dark px-3">수정</button>
									</div>
									<div class="col text-start p-0">
										<button class="btn btn-sm btn-outline-dark px-3">삭제</button>
									</div>
								</div>
							</div>
						</div>
						</c:if>
				 </c:forEach> --%>
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
const listContainerBox = document.getElementById('listContainer');
const allBox = document.getElementById('all');
const sellingBox = document.getElementById('selling');
const reservationBox = document.getElementById('reservation');
const soldBox = document.getElementById('sold');

// 검정색깔 칠하기 
function addAndRemoveColor(statusId) {
	if(statusId == 0){
		allBox.classList.remove('btn-outline-secondary');
		allBox.classList.add('btn-dark');
		sellingBox.classList.remove('btn-dark');
		sellingBox.classList.add('btn-outline-secondary');
		reservationBox.classList.remove('btn-dark');
		reservationBox.classList.add('btn-outline-secondary');
		soldBox.classList.remove('btn-dark');
		soldBox.classList.add('btn-outline-secondary');
	}else if(statusId == 1){
		allBox.classList.remove('btn-dark');
		allBox.classList.add('btn-outline-secondary');
		sellingBox.classList.remove('btn-outline-secondary');
		sellingBox.classList.add('btn-dark');
		reservationBox.classList.remove('btn-dark');
		reservationBox.classList.add('btn-outline-secondary');
		soldBox.classList.remove('btn-dark');
		soldBox.classList.add('btn-outline-secondary');
	}else if(statusId == 2){
		allBox.classList.remove('btn-dark');
		allBox.classList.add('btn-outline-secondary');
		sellingBox.classList.remove('btn-dark');
		sellingBox.classList.add('btn-outline-secondary');
		reservationBox.classList.remove('btn-outline-secondary');
		reservationBox.classList.add('btn-dark');
		soldBox.classList.remove('btn-dark');
		soldBox.classList.add('btn-outline-secondary');
	}else{
		allBox.classList.remove('btn-dark');
		allBox.classList.add('btn-outline-secondary');
		sellingBox.classList.remove('btn-dark');
		sellingBox.classList.add('btn-outline-secondary');
		reservationBox.classList.remove('btn-dark');
		reservationBox.classList.add('btn-outline-secondary');
		soldBox.classList.remove('btn-outline-secondary');
		soldBox.classList.add('btn-dark');
	}
}


function getMySellListByStatus(statusId) {
	addAndRemoveColor(statusId);

    const xhr = new XMLHttpRequest();

    xhr.onreadystatechange = function(){
        if(xhr.readyState == 4 && xhr.status == 200){
            const response = JSON.parse(xhr.responseText);
            listContainerBox.innerHTML = "";
            const list = response.list;
            // 전체선택일 경우 
            if(statusId == 0){
            	if(list == null || list.length === 0){
            		const row1 = document.createElement('div');
		    	    row1.classList.add('row', 'border-bottom', 'py-2');
		    	    const col1 = document.createElement('div');
		    	    col1.classList.add('col', 'text-center');
		    	    col1.setAttribute('colspan', '4');
		    	    col1.textContent = '등록된 중고 상품이 없습니다.';
		    	    row1.appendChild(col1);
		    	    listContainerBox.appendChild(row1);
            	}else{
            		list.forEach((map) => {
                		// 판매중 
                		if(map.reservationCount == 0 && map.completeCount == 0){
                			selling(map);
                		}
                		// 예약중 
                		else if(map.reservationCount > 0){
                			reservation(map);
                		}
                		// 거래완료 -
                		else {
                			sold(map);
                		}
                		
                	});
            	}
            	
            	
            }else if(statusId==1){
            	if(list == null || list.length === 0){
            		const row1 = document.createElement('div');
            	    row1.classList.add('row', 'border-bottom', 'py-2');
            	    const col1 = document.createElement('div');
            	    col1.classList.add('col', 'text-center');
            	    col1.setAttribute('colspan', '4');
            	    col1.textContent = '판매중인 중고 상품이 없습니다.';
            	    row1.appendChild(col1);
            	    listContainerBox.appendChild(row1);
            	}else{
            		list.forEach((map) => {
                		// 판매중 
            			selling(map);
                	});
            	}
            }else if(statusId==2){
            	if(list == null || list.length === 0){
            		const row1 = document.createElement('div');
            	    row1.classList.add('row', 'border-bottom', 'py-2');
            	    const col1 = document.createElement('div');
            	    col1.classList.add('col', 'text-center');
            	    col1.setAttribute('colspan', '4');
            	    col1.textContent = '예약중인 중고 상품이 없습니다.';
            	    row1.appendChild(col1);
            	    listContainerBox.appendChild(row1);
            	}else{
            		list.forEach((map) => {
                		// 예약중 
            			reservation(map, statusId);
                	});
            	}
            }else{
            	if(list == null || list.length === 0){
            		const row1 = document.createElement('div');
            	    row1.classList.add('row', 'border-bottom', 'py-2');
            	    const col1 = document.createElement('div');
            	    col1.classList.add('col', 'text-center');
            	    col1.setAttribute('colspan', '4');
            	    col1.textContent = '거래완료된 중고 상품이 없습니다.';
            	    row1.appendChild(col1);
            	    listContainerBox.appendChild(row1);
            	}else{
            		list.forEach((map) => {
                		// 거래완료  
            			sold(map);
                	});
            	}
            }
            
        }
    }
    xhr.open("get", "./getMySellListByStatus?statusId="+statusId);
    xhr.send();
}

// 판매중 
function selling(map) {
	  const rowContainer = document.createElement('div');
	  rowContainer.classList.add('row', 'border-bottom', 'py-2');

	  const col5Container = document.createElement('div');
	  col5Container.classList.add('col-5');

	  const rowImageDetails = document.createElement('div');
	  rowImageDetails.classList.add('row', 'my-auto');

	  const imageCol = document.createElement('div');
	  imageCol.classList.add('col-3', 'ms-1');
	  imageCol.style.float = 'left';

	  const imageLink = document.createElement('a');
	  imageLink.href = '/safari/used/productDetail?productId='+map.productDto.id;

	  const image = document.createElement('img');
	  image.src = "/safarifile/" + map.productImgDto.product_img_link;
	  image.style.width = '120px';
	  image.style.height = '120px';

	  imageLink.appendChild(image);
	  imageCol.appendChild(imageLink);

	  const itemDetailsCol = document.createElement('div');
	  itemDetailsCol.classList.add('col', 'ms-5', 'text-start');

	  const itemCategoryRow = document.createElement('div');
	  itemCategoryRow.classList.add('row', 'mt-4', 'mb-1');

	  const itemCategoryCol = document.createElement('div');
	  itemCategoryCol.classList.add('col', 'fw-light');
	  itemCategoryCol.style.fontSize = '15px';
	  itemCategoryCol.textContent = map.productMainCategoryDto.main_category_name + ' > ' + map.productSubCategoryDto.sub_category_name;
	  itemCategoryRow.appendChild(itemCategoryCol);

	  const itemNameRow = document.createElement('div');
	  itemNameRow.classList.add('row');

	  const itemNameCol = document.createElement('div');
	  itemNameCol.classList.add('col', 'fw-bold');

	  const span1 = document.createElement('span');
	  span1.classList.add('d-inline-block','text-truncate');
  	  span1.style.maxWidth = '186px';
  	  span1.style.height = '22px';
	  const itemNameLink = document.createElement('a');
	  itemNameLink.href = '/safari/used/productDetail?productId='+map.productDto.id;
	  itemNameLink.style.fontSize = '17px';
	  
	  itemNameLink.textContent = map.productDto.title;
	  
	  
	  span1.appendChild(itemNameLink);
	  itemNameCol.appendChild(span1);
	  itemNameRow.appendChild(itemNameCol);
	  

	  const itemLocationRow = document.createElement('div');
	  itemLocationRow.classList.add('row');

	  const itemLocationCol = document.createElement('div');
	  itemLocationCol.classList.add('col', 'text-secondary');
	  itemLocationCol.style.fontSize = '14px';
	  itemLocationCol.textContent = map.productCityDto.product_city_name+ ' ' +map.productTownDto.product_town_name;

	  itemLocationRow.appendChild(itemLocationCol);

	  itemDetailsCol.appendChild(itemCategoryRow);
	  itemDetailsCol.appendChild(itemNameRow);
	  itemDetailsCol.appendChild(itemLocationRow);

	  rowImageDetails.appendChild(imageCol);
	  rowImageDetails.appendChild(itemDetailsCol);

	  col5Container.appendChild(rowImageDetails);

	  const col2Container = document.createElement('div');
	  col2Container.classList.add('col-2', 'my-auto', 'text-center', 'fw-semibold');
	  col2Container.style.fontSize = '17px';
	  
	  if (map.productDto.price == 0) {
          const btnShare = document.createElement("button");
          btnShare.type = "button";
          btnShare.classList.add("btn", "btn-warning", "px-2", "py-1");
          btnShare.disabled = true;
          btnShare.textContent = "나눔";
          col2Container.appendChild(btnShare);
          
        } else {
          const number = map.productDto.price;
          const formattedNumber = number.toLocaleString();
          col2Container.textContent = formattedNumber+'원';
        }
	  
	  
	  /* const number = map.productDto.price;
         const formattedNumber = number.toLocaleString();
         col2Container.textContent = formattedNumber+'원'; */

	  const col2DateContainer = document.createElement('div');
	  col2DateContainer.classList.add('col-2', 'my-auto', 'text-center');
	  col2DateContainer.textContent = formatTime(map.productDto.reg_date);

	  const colButtonsContainer = document.createElement('div');
	  colButtonsContainer.classList.add('col', 'my-auto', 'text-center');

	  const buttonsRow = document.createElement('div');
	  buttonsRow.classList.add('row');
	  const buttonsCol = document.createElement('div');
	  buttonsCol.classList.add('col');

	  const buttonBoost = document.createElement('button');
	  buttonBoost.classList.add('btn', 'btn-sm', 'orangeButton1');
	  buttonBoost.style.width = '120px';
	  buttonBoost.textContent = '끌어올리기';

	  buttonsCol.appendChild(buttonBoost);
	  buttonsRow.appendChild(buttonsCol);

	  const buttonsRow2 = document.createElement('div');
	  buttonsRow2.classList.add('row', 'mt-2');

	  const buttonEditCol = document.createElement('div');
	  buttonEditCol.classList.add('col', 'text-end', 'p-0');
	  buttonEditCol.style.marginRight = '5px';

	  const modifyAtag = document.createElement('a');
	  modifyAtag.href="/safari/used/updateProductRegister?productId="+map.productDto.id;
	  const buttonEdit = document.createElement('button');
	  buttonEdit.classList.add('btn', 'btn-sm', 'btn-outline-dark', 'px-3');
	  buttonEdit.textContent = '수정';

	  modifyAtag.appendChild(buttonEdit);
	  buttonEditCol.appendChild(modifyAtag);

	  const buttonDeleteCol = document.createElement('div');
	  buttonDeleteCol.classList.add('col', 'text-start', 'p-0');

	  const deleteAtag = document.createElement('a');
	  deleteAtag.href="./deleteProduct?productId="+map.productDto.id;
		 
	  const buttonDelete = document.createElement('button');
	  buttonDelete.classList.add('btn', 'btn-sm', 'btn-outline-dark', 'px-3');
	  buttonDelete.textContent = '삭제';
		
	  deleteAtag.appendChild(buttonDelete);
	  buttonDeleteCol.appendChild(deleteAtag);

	  buttonsRow2.appendChild(buttonEditCol);
	  buttonsRow2.appendChild(buttonDeleteCol);

	  colButtonsContainer.appendChild(buttonsRow);
	  colButtonsContainer.appendChild(buttonsRow2);

	  rowContainer.appendChild(col5Container);
	  rowContainer.appendChild(col2Container);
	  rowContainer.appendChild(col2DateContainer);
	  rowContainer.appendChild(colButtonsContainer);
	  
	  listContainerBox.appendChild(rowContainer);
}

// 예약중 
function reservation(map, statusId) {
	const rowContainer = document.createElement('div');
	 rowContainer.classList.add('row', 'border-bottom', 'py-2');
	
	 const col5Container = document.createElement('div');
	 col5Container.classList.add('col-5');
	
	 const rowImageDetails = document.createElement('div');
	 rowImageDetails.classList.add('row', 'my-auto');
	
	 const imageCol = document.createElement('div');
	 imageCol.classList.add('col-3', 'ms-1');
	 imageCol.style.float = 'left';
	
	 const imageLink = document.createElement('a');
	 imageLink.href = "/safari/used/productDetail?productId="+map.productDto.id;
	
	 const image = document.createElement('img');
	 image.src = "/safarifile/" + map.productImgDto.product_img_link;
	 image.style.width = '120px';
	 image.style.height = '120px';
	
	 imageLink.appendChild(image);
	 imageCol.appendChild(imageLink);
	
	 const itemDetailsCol = document.createElement('div');
	 itemDetailsCol.classList.add('col', 'ms-5', 'text-start');
	
	 const itemCategoryRow = document.createElement('div');
	 itemCategoryRow.classList.add('row', 'mt-4', 'mb-1');
	
	 const itemCategoryCol = document.createElement('div');
	 itemCategoryCol.classList.add('col', 'fw-light');
	 itemCategoryCol.style.fontSize = '15px';
	 itemCategoryCol.textContent = map.productMainCategoryDto.main_category_name + ' > ' + map.productSubCategoryDto.sub_category_name;
	 itemCategoryRow.appendChild(itemCategoryCol);
	 
	 const itemNameRow = document.createElement('div');
	 itemNameRow.classList.add('row');
	
	 const itemNameCol = document.createElement('div');
	 itemNameCol.classList.add('col', 'fw-bold');
	
	 const span1 = document.createElement('span');
	 span1.classList.add('d-inline-block','text-truncate');
 	 span1.style.maxWidth = '186px';
 	 span1.style.height = '22px';
	 const itemNameLink = document.createElement('a');
	 itemNameLink.href = '/safari/used/productDetail?productId='+map.productDto.id;
	 itemNameLink.style.fontSize = '17px';
	 itemNameLink.textContent = map.productDto.title;
	
	 const span2 = document.createElement('span');
	 const statusButton = document.createElement('button');
	 statusButton.classList.add('btn', 'btn-success', 'btn-sm', 'btn-sm-custom', 'ms-2');
	 statusButton.disabled = true;
	 statusButton.style.padding = '1px 6px';
	 statusButton.style.fontSize = '13px';
	 statusButton.style.marginTop = '-3px';
	 statusButton.textContent = '예약중';
	 span2.appendChild(statusButton);
	 
	 span1.appendChild(itemNameLink);
	 itemNameCol.appendChild(span1);
	 itemNameCol.appendChild(span2);
	 
	 itemNameRow.appendChild(itemNameCol);
	
	 const itemLocationRow = document.createElement('div');
	 itemLocationRow.classList.add('row');
	
	 const itemLocationCol = document.createElement('div');
	 itemLocationCol.classList.add('col', 'text-secondary');
	 itemLocationCol.style.fontSize = '14px';
	 itemLocationCol.textContent = map.productCityDto.product_city_name+ ' ' +map.productTownDto.product_town_name;
	
	 itemLocationRow.appendChild(itemLocationCol);
	
	 itemDetailsCol.appendChild(itemCategoryRow);
	 itemDetailsCol.appendChild(itemNameRow);
	 itemDetailsCol.appendChild(itemLocationRow);
	
	 rowImageDetails.appendChild(imageCol);
	 rowImageDetails.appendChild(itemDetailsCol);
	
	 col5Container.appendChild(rowImageDetails);
	
	 const col2Container = document.createElement('div');
	 col2Container.classList.add('col-2', 'my-auto', 'text-center', 'fw-semibold');
	 col2Container.style.fontSize = '17px';
	 
	 if (map.productDto.price == 0) {
         const btnShare = document.createElement("button");
         btnShare.type = "button";
         btnShare.classList.add("btn", "btn-warning", "px-2", "py-1");
         btnShare.disabled = true;
         btnShare.textContent = "나눔";
         col2Container.appendChild(btnShare);
         
       } else {
         const number = map.productDto.price;
         const formattedNumber = number.toLocaleString();
         col2Container.textContent = formattedNumber+'원';
       }
	  
	 
	 /* col2Container.textContent = map.productDto.price.toLocaleString() + '원'; */
	
	 const col2DateContainer = document.createElement('div');
	 col2DateContainer.classList.add('col-2', 'my-auto', 'text-center');
	 col2DateContainer.textContent = formatTime(map.productDto.reg_date);
	
	 const colButtonsContainer = document.createElement('div');
	 colButtonsContainer.classList.add('col', 'my-auto', 'text-center');
	
	 const buttonsRow = document.createElement('div');
	 buttonsRow.classList.add('row');
	 const buttonsCol = document.createElement('div');
	 buttonsCol.classList.add('col');
	
	 const buttonCancel = document.createElement('button');
	 buttonCancel.classList.add('btn', 'btn-sm', 'btn-outline-success');
	 buttonCancel.style.width = '120px';
	 buttonCancel.textContent = '예약취소';
	 buttonCancel.setAttribute("onclick", "productRequestStatusCancelByProduct("+map.productDto.id+","+statusId+")");
	
	 buttonsCol.appendChild(buttonCancel);
	 buttonsRow.appendChild(buttonsCol);
	
	 const buttonsRow2 = document.createElement('div');
	 buttonsRow2.classList.add('row', 'mt-2');
	
	 const buttonEditCol = document.createElement('div');
	 buttonEditCol.classList.add('col', 'text-end', 'p-0');
	 buttonEditCol.style.marginRight = '5px';
	
	  const modifyAtag = document.createElement('a');
	  modifyAtag.href="/safari/used/updateProductRegister?productId="+map.productDto.id;
	  const buttonEdit = document.createElement('button');
	  buttonEdit.classList.add('btn', 'btn-sm', 'btn-outline-dark', 'px-3');
	  buttonEdit.textContent = '수정';

	  modifyAtag.appendChild(buttonEdit);
	  buttonEditCol.appendChild(modifyAtag);
	
	 const buttonDeleteCol = document.createElement('div');
	 buttonDeleteCol.classList.add('col', 'text-start', 'p-0');
	
	 const deleteAtag = document.createElement('a');
	 deleteAtag.href="./deleteProduct?productId="+map.productDto.id;
	 
	 const buttonDelete = document.createElement('button');
	 buttonDelete.classList.add('btn', 'btn-sm', 'btn-outline-dark', 'px-3');
	 buttonDelete.textContent = '삭제';
	
	 deleteAtag.appendChild(buttonDelete);
	 buttonDeleteCol.appendChild(deleteAtag);
	
	 buttonsRow2.appendChild(buttonEditCol);
	 buttonsRow2.appendChild(buttonDeleteCol);
	
	 colButtonsContainer.appendChild(buttonsRow);
	 colButtonsContainer.appendChild(buttonsRow2);
	
	 rowContainer.appendChild(col5Container);
	 rowContainer.appendChild(col2Container);
	 rowContainer.appendChild(col2DateContainer);
	 rowContainer.appendChild(colButtonsContainer);
	
	listContainerBox.appendChild(rowContainer);
}

// 거래완료 
function sold(map) {
	if(map.completeCount > 0 && map.usedPurchaseReviewDto == null){
		const rowContainer = document.createElement('div');
  	  rowContainer.classList.add('row', 'border-bottom', 'py-2');

  	  const col5Container = document.createElement('div');
  	  col5Container.classList.add('col-5');

  	  const rowImageDetails = document.createElement('div');
  	  rowImageDetails.classList.add('row', 'my-auto');

  	  const imageCol = document.createElement('div');
  	  imageCol.classList.add('col-3', 'ms-1');
  	  imageCol.style.float = 'left';

  	  const imageLink = document.createElement('a');
  	  imageLink.href = "/safari/used/productDetail?productId="+map.productDto.id;

  	  const image = document.createElement('img');
  	  image.src = "/safarifile/" + map.productImgDto.product_img_link;
  	  image.style.width = '120px';
  	  image.style.height = '120px';

  	  imageLink.appendChild(image);
  	  imageCol.appendChild(imageLink);

  	  const itemDetailsCol = document.createElement('div');
  	  itemDetailsCol.classList.add('col', 'ms-5', 'text-start');

  	  const itemCategoryRow = document.createElement('div');
  	  itemCategoryRow.classList.add('row', 'mt-4', 'mb-1');

  	  const itemCategoryCol = document.createElement('div');
  	  itemCategoryCol.classList.add('col', 'fw-light');
  	  itemCategoryCol.style.fontSize = '15px';
  	  itemCategoryCol.textContent = map.productMainCategoryDto.main_category_name + ' > ' + map.productSubCategoryDto.sub_category_name;
  	  itemCategoryRow.appendChild(itemCategoryCol);
  	  
  	  const itemNameRow = document.createElement('div');
  	  itemNameRow.classList.add('row');

  	  const itemNameCol = document.createElement('div');
  	  itemNameCol.classList.add('col', 'fw-bold');

  	  
  	  const span1 = document.createElement('span');
  	  span1.classList.add('d-inline-block','text-truncate');
  	  span1.style.maxWidth = '186px';
  	  span1.style.height = '22px';
  	  const itemNameLink = document.createElement('a');
  	  itemNameLink.href = '/safari/used/productDetail?productId='+map.productDto.id;
  	  itemNameLink.style.fontSize = '17px';
  	  itemNameLink.textContent = map.productDto.title;

  	  
  	  const span2 = document.createElement('span');
  	  const statusButton = document.createElement('button');
  	  statusButton.classList.add('btn', 'btn-secondary', 'btn-sm', 'btn-sm-custom', 'ms-2');
  	  statusButton.disabled = true;
  	  statusButton.style.padding = '1px 6px';
  	  statusButton.style.fontSize = '13px';
  	  statusButton.style.marginTop = '-3px';
  	  statusButton.textContent = '거래완료';
  	  span2.appendChild(statusButton);
	 
	  span1.appendChild(itemNameLink);
	  itemNameCol.appendChild(span1);
	  itemNameCol.appendChild(span2);
	 
	  itemNameRow.appendChild(itemNameCol);

  	  const itemLocationRow = document.createElement('div');
  	  itemLocationRow.classList.add('row');

  	  const itemLocationCol = document.createElement('div');
  	  itemLocationCol.classList.add('col', 'text-secondary');
  	  itemLocationCol.style.fontSize = '14px';
  	  itemLocationCol.textContent = map.productCityDto.product_city_name+ ' ' +map.productTownDto.product_town_name;

  	  itemLocationRow.appendChild(itemLocationCol);

  	  itemDetailsCol.appendChild(itemCategoryRow);
  	  itemDetailsCol.appendChild(itemNameRow);
  	  itemDetailsCol.appendChild(itemLocationRow);

  	  rowImageDetails.appendChild(imageCol);
  	  rowImageDetails.appendChild(itemDetailsCol);

  	  col5Container.appendChild(rowImageDetails);

  	  const col2Container = document.createElement('div');
  	  col2Container.classList.add('col-2', 'my-auto', 'text-center', 'fw-semibold');
  	  col2Container.style.fontSize = '17px';
    	if (map.productDto.price == 0) {
        const btnShare = document.createElement("button");
        btnShare.type = "button";
        btnShare.classList.add("btn", "btn-warning", "px-2", "py-1");
        btnShare.disabled = true;
        btnShare.textContent = "나눔";
        col2Container.appendChild(btnShare);
        
      } else {
        const number = map.productDto.price;
        const formattedNumber = number.toLocaleString();
        col2Container.textContent = formattedNumber+'원';
      }
	  
  	  
  	  /* col2Container.textContent = map.productDto.price.toLocaleString() + '원'; */

  	  const col2DateContainer = document.createElement('div');
  	  col2DateContainer.classList.add('col-2', 'my-auto', 'text-center');
  	  col2DateContainer.textContent = formatTime(map.productDto.reg_date);

  	  const colButtonsContainer = document.createElement('div');
  	  colButtonsContainer.classList.add('col', 'my-auto', 'text-center');

  	  const buttonsRow = document.createElement('div');
  	  buttonsRow.classList.add('row');
  	  const buttonsCol = document.createElement('div'); 
	  buttonsCol.classList.add('col');

  	  const buttonSend = document.createElement('button');
  	  buttonSend.classList.add('btn', 'btn-sm', 'btn-outline-primary');
  	  buttonSend.style.width = '120px';
  	  buttonSend.textContent = '후기 보내기';
  	  

      buttonsCol.appendChild(buttonSend);
      buttonsRow.appendChild(buttonsCol);

  	  const buttonsRow2 = document.createElement('div');
  	  buttonsRow2.classList.add('row', 'mt-2');

  	  const buttonEditCol = document.createElement('div');
  	  buttonEditCol.classList.add('col', 'text-end', 'p-0');
  	  buttonEditCol.style.marginRight = '5px';

  	  const modifyAtag = document.createElement('a');
	  modifyAtag.href="/safari/used/updateProductRegister?productId="+map.productDto.id;
	  const buttonEdit = document.createElement('button');
	  buttonEdit.classList.add('btn', 'btn-sm', 'btn-outline-dark', 'px-3');
	  buttonEdit.textContent = '수정';

	  modifyAtag.appendChild(buttonEdit);
	  buttonEditCol.appendChild(modifyAtag);

  	  const buttonDeleteCol = document.createElement('div');
  	  buttonDeleteCol.classList.add('col', 'text-start', 'p-0');

  	 const deleteAtag = document.createElement('a');
	 deleteAtag.href="./deleteProduct?productId="+map.productDto.id;
	 
	 const buttonDelete = document.createElement('button');
	 buttonDelete.classList.add('btn', 'btn-sm', 'btn-outline-dark', 'px-3');
	 buttonDelete.textContent = '삭제';
	
	 deleteAtag.appendChild(buttonDelete);
	 buttonDeleteCol.appendChild(deleteAtag);

  	  buttonsRow2.appendChild(buttonEditCol);
  	  buttonsRow2.appendChild(buttonDeleteCol);

  	  colButtonsContainer.appendChild(buttonsRow);
  	  colButtonsContainer.appendChild(buttonsRow2);

  	  rowContainer.appendChild(col5Container);
  	  rowContainer.appendChild(col2Container);
  	  rowContainer.appendChild(col2DateContainer);
  	  rowContainer.appendChild(colButtonsContainer);
		  
	  listContainerBox.appendChild(rowContainer);
	}else{
		const rowContainer = document.createElement('div');
  	  rowContainer.classList.add('row', 'border-bottom', 'py-2');

  	  const col5Container = document.createElement('div');
  	  col5Container.classList.add('col-5');

  	  const rowImageDetails = document.createElement('div');
  	  rowImageDetails.classList.add('row', 'my-auto');

  	  const imageCol = document.createElement('div');
  	  imageCol.classList.add('col-3', 'ms-1');
  	  imageCol.style.float = 'left';

  	  const imageLink = document.createElement('a');
  	  imageLink.href = "/safari/used/productDetail?productId="+map.productDto.id;

  	  const image = document.createElement('img');
  	  image.src = "/safarifile/" + map.productImgDto.product_img_link;
  	  image.style.width = '120px';
  	  image.style.height = '120px';

  	  imageLink.appendChild(image);
  	  imageCol.appendChild(imageLink);

  	  const itemDetailsCol = document.createElement('div');
  	  itemDetailsCol.classList.add('col', 'ms-5', 'text-start');

  	  const itemCategoryRow = document.createElement('div');
  	  itemCategoryRow.classList.add('row', 'mt-4', 'mb-1');

  	  const itemCategoryCol = document.createElement('div');
  	  itemCategoryCol.classList.add('col', 'fw-light');
  	  itemCategoryCol.style.fontSize = '15px';
  	  itemCategoryCol.textContent = map.productMainCategoryDto.main_category_name + ' > ' + map.productSubCategoryDto.sub_category_name;
  	  itemCategoryRow.appendChild(itemCategoryCol);
  	  
  	  const itemNameRow = document.createElement('div');
  	  itemNameRow.classList.add('row');

  	  const itemNameCol = document.createElement('div');
  	  itemNameCol.classList.add('col', 'fw-bold');

  	  const span1 = document.createElement('span');
  	  span1.classList.add('d-inline-block','text-truncate');
	  span1.style.maxWidth = '186px';
	  span1.style.height = '22px';
	  const itemNameLink = document.createElement('a');
	  itemNameLink.href = '/safari/used/productDetail?productId='+map.productDto.id;
	  itemNameLink.style.fontSize = '17px';
	  itemNameLink.textContent = map.productDto.title;

	  
	  const span2 = document.createElement('span');
	  const statusButton = document.createElement('button');
	  statusButton.classList.add('btn', 'btn-secondary', 'btn-sm', 'btn-sm-custom', 'ms-2');
	  statusButton.disabled = true;
	  statusButton.style.padding = '1px 6px';
	  statusButton.style.fontSize = '13px';
	  statusButton.style.marginTop = '-3px';
	  statusButton.textContent = '거래완료';
	  span2.appendChild(statusButton);
	 
	  span1.appendChild(itemNameLink);
	  itemNameCol.appendChild(span1);
	  itemNameCol.appendChild(span2);
	 
	  itemNameRow.appendChild(itemNameCol);

  	  const itemLocationRow = document.createElement('div');
  	  itemLocationRow.classList.add('row');

  	  const itemLocationCol = document.createElement('div');
  	  itemLocationCol.classList.add('col', 'text-secondary');
  	  itemLocationCol.style.fontSize = '14px';
  	  itemLocationCol.textContent = map.productCityDto.product_city_name+ ' ' +map.productTownDto.product_town_name;

  	  itemLocationRow.appendChild(itemLocationCol);

  	  itemDetailsCol.appendChild(itemCategoryRow);
  	  itemDetailsCol.appendChild(itemNameRow);
  	  itemDetailsCol.appendChild(itemLocationRow);

  	  rowImageDetails.appendChild(imageCol);
  	  rowImageDetails.appendChild(itemDetailsCol);

  	  col5Container.appendChild(rowImageDetails);

  	  const col2Container = document.createElement('div');
  	  col2Container.classList.add('col-2', 'my-auto', 'text-center', 'fw-semibold');
  	  col2Container.style.fontSize = '17px';
  	  
  	  if (map.productDto.price == 0) {
        const btnShare = document.createElement("button");
        btnShare.type = "button";
        btnShare.classList.add("btn", "btn-warning", "px-2", "py-1");
        btnShare.disabled = true;
        btnShare.textContent = "나눔";
        col2Container.appendChild(btnShare);
        
      } else {
        const number = map.productDto.price;
        const formattedNumber = number.toLocaleString();
        col2Container.textContent = formattedNumber+'원';
      }
	  
  	  
  	 /*  col2Container.textContent = map.productDto.price.toLocaleString() + '원'; */

  	  const col2DateContainer = document.createElement('div');
  	  col2DateContainer.classList.add('col-2', 'my-auto', 'text-center');
  	  col2DateContainer.textContent = formatTime(map.productDto.reg_date);

  	  const colButtonsContainer = document.createElement('div');
  	  colButtonsContainer.classList.add('col', 'my-auto', 'text-center');

  	  const buttonsRow = document.createElement('div');
  	  buttonsRow.classList.add('row');
      const buttonsCol = document.createElement('div'); 
	  buttonsCol.classList.add('col');

  	  const buttonSendShow = document.createElement('button');
   	  buttonSendShow.classList.add('btn', 'btn-sm', 'btn-secondary');
  	  buttonSendShow.style.width = '120px';
      buttonSendShow.textContent = '보낸 후기 보기';

      buttonsCol.appendChild(buttonSendShow);
      buttonsRow.appendChild(buttonsCol);

  	  const buttonsRow2 = document.createElement('div');
  	  buttonsRow2.classList.add('row', 'mt-2');

  	  const buttonEditCol = document.createElement('div');
  	  buttonEditCol.classList.add('col', 'text-end', 'p-0');
  	  buttonEditCol.style.marginRight = '5px';

      const modifyAtag = document.createElement('a');
	  modifyAtag.href="/safari/used/updateProductRegister?productId="+map.productDto.id;
	  const buttonEdit = document.createElement('button');
	  buttonEdit.classList.add('btn', 'btn-sm', 'btn-outline-dark', 'px-3');
	  buttonEdit.textContent = '수정';

	  modifyAtag.appendChild(buttonEdit);
	  buttonEditCol.appendChild(modifyAtag);

  	  const buttonDeleteCol = document.createElement('div');
  	  buttonDeleteCol.classList.add('col', 'text-start', 'p-0');

  	 const deleteAtag = document.createElement('a');
	 deleteAtag.href="./deleteProduct?productId="+map.productDto.id;
	 
	 const buttonDelete = document.createElement('button');
	 buttonDelete.classList.add('btn', 'btn-sm', 'btn-outline-dark', 'px-3');
	 buttonDelete.textContent = '삭제';
	
	 deleteAtag.appendChild(buttonDelete);
	 buttonDeleteCol.appendChild(deleteAtag);

  	  buttonsRow2.appendChild(buttonEditCol);
  	  buttonsRow2.appendChild(buttonDeleteCol);

  	  colButtonsContainer.appendChild(buttonsRow);
  	  colButtonsContainer.appendChild(buttonsRow2);

  	  rowContainer.appendChild(col5Container);
  	  rowContainer.appendChild(col2Container);
  	  rowContainer.appendChild(col2DateContainer);
  	  rowContainer.appendChild(colButtonsContainer);
		  
	  listContainerBox.appendChild(rowContainer); 
	}
}

//날짜 변환 함수	
function formatTime(timestamp) {
	  const date = new Date(timestamp);
	  const year = date.getFullYear();
	  const month = String(date.getMonth() + 1).padStart(2, '0');
	  const day = String(date.getDate()).padStart(2, '0');


	  const formattedDate = year + '.' + month + '.' + day;
	  return formattedDate;
	}

// 예약중에서 거래 요청으로 바꾸기
function productRequestStatusCancelByProduct(productId, statusId) {

	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function(){
	    if(xhr.readyState == 4 && xhr.status == 200){
	        const response = JSON.parse(xhr.responseText);
	        getMySellListByStatus(statusId);
	    }
	}
	//get
	xhr.open("get", "../used/productRequestStatusCancelByProduct?productId="+productId);
	xhr.send();
} 


window.addEventListener("DOMContentLoaded", function(){
	getMySellListByStatus(0);	
});

</script>
</body>	
</html>