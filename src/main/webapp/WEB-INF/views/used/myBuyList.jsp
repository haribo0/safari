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
.btn-qna{position: fixed; bottom: 80px; right: 70px; border-radius: 60px; padding: 0 0;}
	.btn-circle{width: 50px; height: 52px; border-radius: 50%; display: flex; flex-direction:column; justify-content: center; align-items: center; font-size: 2rem; cursor: pointer;}
	.btn-circle i{color: #5e5e5e; font-size: 24px;}
	.btn-tit{font-size:13px;}
      

</style>
</head>
<body>
	<!-- Chat Box -->
	<jsp:include page="../common/chatBox.jsp"></jsp:include>
	<!-- Chat Box -->
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
					<h5>나의 구매내역</h5>						
				</div>
			</div>
			
			<div class="row mt-4" style="color: #777777; margin-left: -8px">
				<ul>
			        <li>금지 품목 거래 시, 제재 받을 수 있어요.</li>
			        <li>적절하지 않은 상품명, 이미지, 가격 제안 시에 제재 받을 수 있어요.</li>
			        <li>외부 채널로의 연락 유도, 타 사이트로의 결제 유도 시 제재 받을 수 있어요.</li>
			        <li>욕설, 성희롱 등 비매너 행위는 타인을 불쾌하게 해요.</li>
			    </ul>
			</div>
			
			<div class="row mt-3 mb-5">
				<div class="col">
						<div class="row fw-medium border-bottom border-top border-black border-1 py-2">
							<div class="col-5 text-center">상품정보</div>
							<div class="col-2 text-center">가격</div>
							<div class="col-2 text-center">구매일자</div>
							<div class="col text-center">비고</div>
						</div>
					<div class="cotainer">
					<c:if test="${empty list}">
						<div class="row border-bottom py-2">
						   <div class="col text-center" colspan="4">
					           구매한 중고 상품이 없습니다.
					        </div>
					      </div>	
					</c:if>			
					 <c:forEach items="${list}" var="map"> 
						<c:if test="${map.usedPurchaseReviewDto == null}">
						<div class="row border-bottom py-2">
							<div class="col-5">
								<div class="row my-auto">
									<div class="col-3 ms-1"  style="float: left;">
										
										<a href="/safari/used/productDetail?productId=${map.productDto.id }">
										<img src="/safarifile/${map.productImgDto.product_img_link }" style="width: 120px; height: 120px;"></a>
									</div>
									<div class="col ms-5" class="text-start">
										<div class="row mt-4 mb-1">
											<div class="col fw-light" style="font-size: 15px;">
												${map.productMainCategoryDto.main_category_name} > ${map.productSubCategoryDto.sub_category_name}
											</div>
										</div>
										<div class="row">
											<div class="col fw-bold">
												<span><a href="/safari/used/productDetail/1" style="font-size: 17px;">
												${map.productDto.title }</a></span><span><button class="btn btn-secondary btn-sm btn-sm-custom ms-2" disabled
												style="padding: 1px 6px; font-size: 13px; margin-top: -3px;">거래완료</button></span>
											</div>
										</div>
										<div class="row">
											<div class="col text-secondary" style="font-size: 14px;">
											 	${map.productCityDto.product_city_name} ${map.productTownDto.product_town_name}
											</div>
										</div>
									</div>									
								</div>
							</div>	
							<div class="col-2 my-auto text-center fw-semibold" style="font-size: 17px;">
								<fmt:formatNumber value="${map.productDto.price}" pattern="#,###"/>원
							</div>
							
							<div class="col-2 my-auto text-center">
								<fmt:formatDate value="${map.productRequestDto.reg_date }" pattern="yyyy.MM.dd" />
							</div>
							
							<div class="col my-auto text-center">
								<div class="row">
									<div class="col">
										<button class="btn btn-sm btn-outline-primary" style="width: 120px" onclick="reviewModalOn(${map.productRequestDto.user_id},${map.productDto.user_id},${map.productRequestDto.id})">후기보내기</button>
									</div>
								</div>
							</div>
						</div>
						</c:if>
						<c:if test="${map.usedPurchaseReviewDto != null}">
						<div class="row border-bottom py-2">
							<div class="col-5">
								<div class="row my-auto">
									<div class="col-3 ms-1"  style="float: left;">
										<a href="/safari/used/productDetail?productId=${map.productDto.id }">
										<img src="/safarifile/${map.productImgDto.product_img_link }" style="width: 120px; height: 120px;"></a>
									</div>
									<div class="col ms-5" class="text-start">
										<div class="row mt-4 mb-1">
											<div class="col fw-light" style="font-size: 15px;">
												${map.productMainCategoryDto.main_category_name} > ${map.productSubCategoryDto.sub_category_name}
											</div>
										</div>
										<div class="row">
											<div class="col fw-bold">
												<span><a href="/safari/used/productDetail/1" style="font-size: 17px;">
												${map.productDto.title }</a></span><span><button class="btn btn-secondary btn-sm btn-sm-custom ms-2" disabled
												style="padding: 1px 6px; font-size: 13px; margin-top: -3px;">거래완료</button></span>
											</div>
										</div>
										<div class="row">
											<div class="col text-secondary" style="font-size: 14px;">
											 	${map.productCityDto.product_city_name} ${map.productTownDto.product_town_name}
											</div>
										</div>
									</div>									
								</div>
							</div>	
							<div class="col-2 my-auto text-center fw-semibold">
								<fmt:formatNumber value="${map.productDto.price}" pattern="#,###"/>원
							</div>
							
							<div class="col-2 my-auto text-center">
								<fmt:formatDate value="${map.productRequestDto.reg_date }" pattern="yyyy.MM.dd" />
							</div>
							
							<div class="col my-auto text-center">
								<div class="row">
									<div class="col">
										<button class="btn btn-sm btn-secondary" style="width: 120px" onclick="getMyWroteReviewHideAndShowMy(${map.productRequestDto.user_id},${map.productDto.user_id},${map.productRequestDto.id})">보낸 후기 보기</button>
									</div>
								</div>
							</div>
						</div>
						</c:if>
				 </c:forEach> 
				 </div>	 				
				</div>
			</div>
			

		
		</div>
	</div>
	</div>
	
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->
	
<!-- 리뷰작성 모달 -->
<div class="modal" id="writeReviewModalMy" tabindex="-1" >
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header position-relative px-3" style="background: #EAEAEA; padding: 10px 0px; height: 50px;">
       	<h5 class="modal-title ms-1 position-absolute top-50 start-50 translate-middle">거래 후기 보내기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-header ms-2" id="modalHeader2">
	     <div class="my-custom-header-wrapper" id="modalHeaderWrapper2My">
       </div>
      </div>
     <div class="modal-body ms-2" style="height: 500px">
	<div class="chat-container overflow-y-scroll overflow-x-hidden" style="height:480px;" id="modalBody2My">
      </div>
    </div>
  </div>
</div>
</div>
<!-- 리뷰 작성  모달 -->

<!-- 리뷰작성 후  모달 -->
<div class="modal" id="myWroteReviewModalMy" tabindex="-1" >
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header position-relative px-3" style="background: #EAEAEA; padding: 10px 0px; height: 50px;">
       	<h5 class="modal-title ms-1 position-absolute top-50 start-50 translate-middle">내가 보낸 거래 후기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body ms-3 me-3" style="height: 530px">
	<div class="chat-container overflow-y-scroll overflow-x-hidden" style="height:500px;" id="modalBody3My">
    	   <!-- <div class="row mt-3">
    				<div class="col fw-bold">닉네임님에게</div>
    			</div>
		<div class="row">
    				<div class="col fw-bold">따뜻한 후기를 보냈어요.</div>
    			</div>
    			<div class="row mt-1">
    				<div class="col text-secondary onlyme">상대방닉네임과 상품이름을(를) 거래했어요.</div>
    			</div>
    			<div class="row mt-4">
    				<div class="col">
    					<img alt="review" width="100%" height="180" id="reviewImg2" src="/safari/resources/img/used/review2.jpeg">
    				</div>
    			</div>
    			<div class="reviewContent">
    			<div class="row mt-3 mb-1">
    				<div class="col ms-3">
    					거래가 너무 좋았습니다. 앞으로도 이런 분과 거래하고 싶어요~!
    				</div>
    			</div>
 				<ul>
 					<li class="mb-1">제가 있는 곳까지 와서 거래했어요.</li>
 					<li class="mb-1">제가 있는 곳까지 와서 거래했어요.</li>
 					<li class="mb-1">제가 있는 곳까지 와서 거래했어요.</li>
 				</ul>
 				</div> -->
	     </div>
      </div>
      <div class="modal-footer p-0 mt-1">
      	<img class="img-fluid m-0" alt="chatAds" src="/safari/resources/img/used/usedChatAds3.png">
      </div>
    </div>
  </div>
</div>
<!-- 리뷰작성 후 모달 -->

<!-- 상대방 리뷰 모달 -->
<div class="modal" id="receiverWroteReviewModalMy" tabindex="-1" >
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header position-relative px-3" style="background: #EAEAEA; padding: 10px 0px;">
      	<i class="bi bi-chevron-left fs-4 p-0" onclick="receiverCloseAndMyOpen()"></i>
        <h5 class="modal-title ms-1 position-absolute top-50 start-50 translate-middle">받은 거래 후기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body ms-3 me-3" style="height: 515px">
		<div class="chat-container overflow-y-scroll overflow-x-hidden" style="height:500px;" id="modalBody4">
	    
	     </div>
      </div>
      <div class="modal-footer p-0 mt-1">
      	<img class="img-fluid m-0" alt="chatAds" src="/safari/resources/img/used/usedChatAds3.png">
      </div>
    </div>
  </div>
</div>
<!-- 상대방 리뷰 모달 -->

<script>

const writeReviewModal = bootstrap.Modal.getOrCreateInstance('#writeReviewModalMy');
//리뷰모달 열기
function  reviewModalOn(senderId, receiverId, requestId) {

	// 리뷰 모달 열기 전 정보 가져오기
	getReviewInformation(senderId, receiverId, requestId);
	
	// 열 때
	
	writeReviewModal.show();

}

//리뷰 모달 열기 전 정보 가져오기
function getReviewInformation(senderId, receiverId, requestId) {
	// 거래후기 모달 창 헤더
	const modalHeaderWrapperBox = document.getElementById('modalHeaderWrapper2My');
	
	
	// 거래후기 모달 창 바디
	const modalBodyBox = document.getElementById('modalBody2My');
	
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
	    if(xhr.readyState == 4 && xhr.status == 200){
	        const response = JSON.parse(xhr.responseText);
	
	        modalHeaderWrapperBox.innerHTML = "";
	        modalBodyBox.innerHTML = "";
	
	        // header
	        const row1 = document.createElement('div');
	        row1.classList.add('row');
	
	        const col1 = document.createElement('div');
	        col1.classList.add('col-2', 'p-0');
	      	const col1Img = document.createElement("img");
	      	col1Img.alt = response.map.productDto.title;
	      	col1Img.src = '/safarifile/' + response.map.productImgDto.product_img_link;
	      	col1Img.classList.add('img-fluid');
	
	      	const col2 = document.createElement('div');
	        col2.classList.add('col', 'mt-3', 'ms-1');
	
	      	const col2row1 = document.createElement('div');
	      	col2row1.classList.add('row');
	        const col2row1col1 = document.createElement('div');
	        col2row1col1.classList.add('col', 'fw-bold');
	        /* col2row1col1.textContent = '에어팟 프로'; */
	        col2row1col1.textContent = response.map.productDto.title;
	
	        const col2row2 = document.createElement('div');
	      	col2row2.classList.add('row');
	        const col2row2col1 = document.createElement('div');
	        col2row2col1.classList.add('col-auto');
	        col2row2col1.textContent = '거래한 이웃'
	
	        const col2row2col2 = document.createElement('div');
	        col2row2col2.classList.add('fw-bold', 'm-0', 'col-auto', 'p-0');
	        /* span.textContent = '피자죠아'; */
	        col2row2col2.textContent = response.map.receiverDto.nickname;
	
	        row1.appendChild(col1);
	        col1.appendChild(col1Img);
	        row1.appendChild(col2);
	        col2.appendChild(col2row1);
	        col2row1.appendChild(col2row1col1);
	        col2.appendChild(col2row2);
	        col2row2.appendChild(col2row2col1);
	        col2row2.appendChild(col2row2col2);
	
	        modalHeaderWrapperBox.appendChild(row1);
	
	
	        // body
	        // First row
	        const firstRow = document.createElement("div");
	        firstRow.classList.add("row");
	
	        const firstCol = document.createElement("div");
	        firstCol.classList.add("col", "fw-bold");
	        /* firstCol.textContent = "바니바니님,"; */
	        firstCol.textContent = response.map.senderDto.nickname+"님,";
	
	        firstRow.appendChild(firstCol);
	
	        modalBodyBox.appendChild(firstRow);
	
	        // Second row
	        const secondRow = document.createElement("div");
	        secondRow.classList.add("row");
	
	        const secondCol = document.createElement("div");
	        secondCol.classList.add("col", "fw-bold");
	        secondCol.textContent = response.map.receiverDto.nickname+"님과 거래가 어떠셨나요?";
	
	        secondRow.appendChild(secondCol);
	
	        modalBodyBox.appendChild(secondRow);
	
	        // Third row
	        const thirdRow = document.createElement("div");
	        thirdRow.classList.add("row");
	
	        const thirdCol = document.createElement("div");
	        thirdCol.classList.add("col", "text-secondary", "onlyme", "mt-1");
	        thirdCol.textContent = "거래 선호도는 나만 볼 수 있어요";
	
	        thirdRow.appendChild(thirdCol);
	
	        modalBodyBox.appendChild(thirdRow);
	
	        // Fourth row
	        const fourthRow = document.createElement("div");
	        fourthRow.classList.add("row", "mt-4");
	
	        // 평가 카테고리
	        for(data of response.map.usedReviewRateCategoryDto){
	        	// 평가 list
	            const col4 = document.createElement("div");
	            col4.classList.add("col-4", "text-center");
	
	            const img4 = document.createElement("img");
	            img4.classList.add("opacity-25", "btn-bunny");
	            img4.alt = data.img_title;
	            img4.src = "/safari/resources/img/used/"+data.img_title+".png";
	            img4.width = 70;
	            img4.height = 70;
	            img4.setAttribute("onclick", data.img_title+"Change("+data.id+","+senderId+","+receiverId+","+requestId+")");
	            img4.id=data.img_title+"Img";
	
	            const p4 = document.createElement("p");
	            p4.classList.add("text-secondary", "fw-semibold", "mt-1");
	            p4.textContent = data.content;
	            p4.id = data.img_title+"Text";
	
	            col4.appendChild(img4);
	            col4.appendChild(p4);
	
	            fourthRow.appendChild(col4);
	
	        }
	
	        const rateCheckContainer = document.createElement("div");
	        rateCheckContainer.classList.add("container");
	        rateCheckContainer.id = 'rateCheckContainer';
	
	        modalBodyBox.appendChild(fourthRow);
	        modalBodyBox.appendChild(rateCheckContainer);
	
	
	    }
	}
	//get
	xhr.open("get", "../used/getReviewHeaderAndBody?senderId="+senderId+"&receiverId="+receiverId+"&requestId="+requestId);
	xhr.send();
}

// 현재 모달창 닫고 내가 썼던 리뷰 보여주기
function getMyWroteReviewHideAndShowMy(senderId, receiverId, requestId){
	const modalBodyBox = document.getElementById('modalBody3My');
	
	// 열 때
	const wroteReviewModal = bootstrap.Modal.getOrCreateInstance('#myWroteReviewModalMy');

	const xhr = new XMLHttpRequest();
	modalBodyBox.innerHTML = "";
	xhr.onreadystatechange = function(){
        if(xhr.readyState == 4 && xhr.status == 200){

            const response = JSON.parse(xhr.responseText);
            console.log(response.map.usedPurchaseReviewDto.review_img_link);
            console.log(response.map.usedPurchaseReviewDto.review_comment);
         // Create elements
            const row1 = document.createElement('div');
            row1.className = 'row';
            const col1 = document.createElement('div');
            col1.className = 'col fw-bold';
            col1.textContent = response.map.receiverDto.nickname+'님에게';
            row1.appendChild(col1);

            const row2 = document.createElement('div');
            row2.className = 'row';
            const col2 = document.createElement('div');
            col2.className = 'col fw-bold';
            col2.textContent = '따뜻한 후기를 보냈어요.';
            row2.appendChild(col2);

            const row3 = document.createElement('div');
            row3.className = 'row mt-1';
            const col3 = document.createElement('div');
            col3.className = 'col text-secondary onlyme';
            col3.textContent = response.map.receiverDto.nickname + '과 '+ response.map.productDto.title +'을(를) 거래했어요.';
            row3.appendChild(col3);

            // 리뷰에 사진이 없고 내용도 없을 때
            if(response.map.usedPurchaseReviewDto.review_img_link == 'n' && response.map.usedPurchaseReviewDto.review_comment == 'n'){
            	const row4 = document.createElement('div');
 	            row4.className = 'row mt-2';
 	            const col4 = document.createElement('div');
 	            col4.className = 'col';
 	            const img = document.createElement('img');
 	            img.alt = 'review';
 	            img.height = '180';
 	            img.id = 'reviewImg2';
 	            img.className = 'object-fit-cover';
            	img.src = '/safari/resources/img/used/review2.jpeg';
            	col4.appendChild(img);
	            row4.appendChild(col4);

	            const reviewContentDiv = document.createElement('div');
	            reviewContentDiv.className = 'reviewContent mb-3';

	            const row5 = document.createElement('div');
	            row5.className = 'row mt-3 mb-1';

	            reviewContentDiv.appendChild(row5);

	            const ul = document.createElement('ul');
	            for (data of response.map.usedReviewCheckboxCategotyDtoList) {
	              const li = document.createElement('li');
	              li.className = 'mb-1';
	              li.textContent = data.content;
	              ul.appendChild(li);
	            }

	            reviewContentDiv.appendChild(ul);

	            modalBodyBox.appendChild(row1);
	            modalBodyBox.appendChild(row2);
	            modalBodyBox.appendChild(row3);
	            modalBodyBox.appendChild(row4);
	            modalBodyBox.appendChild(reviewContentDiv);

	            // 상대방이 쓴 리뷰가 있다면
	            if(response.map.recevierReviewCount>0){
	            	const row6 = document.createElement('div');
	 	            row6.className = 'row mb-3';
	 	            const col6 = document.createElement('div');
	 	            col6.className = 'col d-grid';

	 	            const receiverButton = document.createElement("button");
	 	            receiverButton.classList.add("btn", "orangeButton");
	 	            receiverButton.id = "recieverButton";
	 	            receiverButton.textContent = "받은 거래 후기 보기";
		            receiverButton.setAttribute("onclick", "getReceiverWroteReviewHideAndShow("+receiverId+","+senderId+","+requestId+")");

		            row6.appendChild(col6);
		            col6.appendChild(receiverButton);
		            modalBodyBox.appendChild(row6);
	            }
            }
            // 리뷰에 사진이 있을 떄
            else if(response.map.usedPurchaseReviewDto.review_img_link != 'n' && response.map.usedPurchaseReviewDto.review_comment == 'n'){
            	const row4 = document.createElement('div');
 	            row4.className = 'row mt-2';
 	            const col4 = document.createElement('div');
 	            col4.className = 'col';
 	            const img = document.createElement('img');
 	            img.alt = 'review';
 	            img.height = '180';
 	            img.id = 'reviewImg2';
            	img.src = '/safarifile/' + response.map.usedPurchaseReviewDto.review_img_link;
            	img.className = 'object-fit-cover';

            	col4.appendChild(img);
	            row4.appendChild(col4);

	            const reviewContentDiv = document.createElement('div');
	            reviewContentDiv.className = 'reviewContent mb-3';

	            const row5 = document.createElement('div');
	            row5.className = 'row mt-3 mb-1';

	            reviewContentDiv.appendChild(row5);

	            const ul = document.createElement('ul');
	            for (data of response.map.usedReviewCheckboxCategotyDtoList) {
	              const li = document.createElement('li');
	              li.className = 'mb-1';
	              li.textContent = data.content;
	              ul.appendChild(li);
	            }

	            reviewContentDiv.appendChild(ul);

	            modalBodyBox.appendChild(row1);
	            modalBodyBox.appendChild(row2);
	            modalBodyBox.appendChild(row3);
	            modalBodyBox.appendChild(row4);
	            modalBodyBox.appendChild(reviewContentDiv);

	         // 상대방이 쓴 리뷰가 있다면
	            if(response.map.recevierReviewCount>0){
	            	const row6 = document.createElement('div');
	 	            row6.className = 'row';
	 	            const col6 = document.createElement('div');
	 	            col6.className = 'col d-grid';

	 	            const receiverButton = document.createElement("button");
	 	            receiverButton.classList.add("btn", "orangeButton");
	 	            receiverButton.id = "recieverButton";
	 	            receiverButton.textContent = "받은 거래 후기 보기";
		            receiverButton.setAttribute("onclick", "getReceiverWroteReviewHideAndShow("+receiverId+","+senderId+","+requestId+")");

		            row6.appendChild(col6);
		            col6.appendChild(receiverButton);
		            modalBodyBox.appendChild(row6);
	            }

            }else if(response.map.usedPurchaseReviewDto.review_img_link == 'n' && response.map.usedPurchaseReviewDto.review_comment != 'n'){
            	const row4 = document.createElement('div');
 	            row4.className = 'row mt-2';
 	            const col4 = document.createElement('div');
 	            col4.className = 'col';
 	            const img = document.createElement('img');
 	            img.alt = 'review';
 	            img.height = '180';
 	            img.id = 'reviewImg2';
            	img.src = '/safari/resources/img/used/review2.jpeg';
            	img.className = 'object-fit-cover';
            	col4.appendChild(img);
	            row4.appendChild(col4);

	            const reviewContentDiv = document.createElement('div');
	            reviewContentDiv.className = 'reviewContent mb-3';

	            const row5 = document.createElement('div');
	            row5.className = 'row mt-3 mb-1';

	            const col5 = document.createElement('div');
	            col5.className = 'col ms-3';
	            col5.textContent = response.map.usedPurchaseReviewDto.review_comment;
	            row5.appendChild(col5);

	            reviewContentDiv.appendChild(row5);

	            const ul = document.createElement('ul');
	            for (data of response.map.usedReviewCheckboxCategotyDtoList) {
	              const li = document.createElement('li');
	              li.className = 'mb-1';
	              li.textContent = data.content;
	              ul.appendChild(li);
	            }

	            reviewContentDiv.appendChild(ul);

	            modalBodyBox.appendChild(row1);
	            modalBodyBox.appendChild(row2);
	            modalBodyBox.appendChild(row3);
	            modalBodyBox.appendChild(row4);
	            modalBodyBox.appendChild(reviewContentDiv);

	            // 상대방이 쓴 리뷰가 있다면
	            if(response.map.recevierReviewCount>0){
	            	const row6 = document.createElement('div');
	 	            row6.className = 'row';
	 	            const col6 = document.createElement('div');
	 	            col6.className = 'col d-grid';

	 	            const receiverButton = document.createElement("button");
	 	            receiverButton.classList.add("btn", "orangeButton");
	 	            receiverButton.id = "recieverButton";
	 	            receiverButton.textContent = "받은 거래 후기 보기";
		            receiverButton.setAttribute("onclick", "getReceiverWroteReviewHideAndShow("+receiverId+","+senderId+","+requestId+")");

		            row6.appendChild(col6);
		            col6.appendChild(receiverButton);
		            modalBodyBox.appendChild(row6);
	            }

            }else{
            	const row4 = document.createElement('div');
 	            row4.className = 'row mt-2';
 	            const col4 = document.createElement('div');
 	            col4.className = 'col';
 	            const img = document.createElement('img');
 	            img.alt = 'review';
 	            img.height = '180';
 	            img.id = 'reviewImg2';
            	img.src = '/safarifile/' + response.map.usedPurchaseReviewDto.review_img_link;
            	img.className = 'object-fit-cover';


            	col4.appendChild(img);
	            row4.appendChild(col4);

	            const reviewContentDiv = document.createElement('div');
	            reviewContentDiv.className = 'reviewContent mb-3';

	            const row5 = document.createElement('div');
	            row5.className = 'row mt-3 mb-1';

	            const col5 = document.createElement('div');
	            col5.className = 'col ms-3';
	            col5.textContent = response.map.usedPurchaseReviewDto.review_comment;
	            row5.appendChild(col5);

	            reviewContentDiv.appendChild(row5);

	            const ul = document.createElement('ul');
	            for (data of response.map.usedReviewCheckboxCategotyDtoList) {
	              const li = document.createElement('li');
	              li.className = 'mb-1';
	              li.textContent = data.content;
	              ul.appendChild(li);
	            }

	            reviewContentDiv.appendChild(ul);

	            modalBodyBox.appendChild(row1);
	            modalBodyBox.appendChild(row2);
	            modalBodyBox.appendChild(row3);
	            modalBodyBox.appendChild(row4);
	            modalBodyBox.appendChild(reviewContentDiv);

	            // 상대방이 쓴 리뷰가 있다면
	            if(response.map.recevierReviewCount>0){
	            	const row6 = document.createElement('div');
	 	            row6.className = 'row';
	 	            const col6 = document.createElement('div');
	 	            col6.className = 'col d-grid';

	 	            const receiverButton = document.createElement("button");
	 	            receiverButton.classList.add("btn", "orangeButton");
	 	            receiverButton.id = "recieverButton";
	 	            receiverButton.textContent = "받은 거래 후기 보기";
		            receiverButton.setAttribute("onclick", "getReceiverWroteReviewHideAndShow("+receiverId+","+senderId+","+requestId+")");

		            row6.appendChild(col6);
		            col6.appendChild(receiverButton);
		            modalBodyBox.appendChild(row6);
	            }
            }

           /*  col4.appendChild(img);
            row4.appendChild(col4);

            const reviewContentDiv = document.createElement('div');
            reviewContentDiv.className = 'reviewContent';

            // 리뷰에 직접 작성한 내용이 없을 떄
            if(response.map.usedPurchaseReviewDto.review_comment == 'n'){
            	const row5 = document.createElement('div');
	            row5.className = 'row mt-3 mb-1';
            }
            // 리뷰에 직접 작성한 내용이 있을 떄
            else{
            	const row5 = document.createElement('div');
	            row5.className = 'row mt-3 mb-1';
	            const col5 = document.createElement('div');
	            col5.className = 'col ms-3';
	            col5.textContent = response.map.usedPurchaseReviewDto.review_comment;
	            row5.appendChild(col5);
            } */

            /* const ul = document.createElement('ul');
            // 체크박스 list
            for(data of response.map.usedReviewCheckboxCategotyDtoList){
            	const li = document.createElement('li');
	            li.className = 'mb-1';
	            li.textContent = data.content;
	            console.log(data.content);
	            ul.appendChild(li);
            }

            reviewContentDiv.appendChild(row5);
            reviewContentDiv.appendChild(ul);

            modalBodyBox.appendChild(row1);
            modalBodyBox.appendChild(row2);
            modalBodyBox.appendChild(row3);
            modalBodyBox.appendChild(row4);
            modalBodyBox.appendChild(reviewContentDiv);
             */
        }
    }
	//get
	xhr.open("get", "../used/getMyWroteReview?senderId="+senderId+"&receiverId="+receiverId+"&requestId="+requestId);
	xhr.send();

	wroteReviewModal.show();


}

</script>

</body>	
</html>