<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<style>
select option[value=""][disabled] {
	display: none;
}

.slidecontainer {
  width: 66%;
}

.slider {
  -webkit-appearance: none;
  width: 100%;
  height: 15px;
  border-radius: 5px;
  background: #bfbfbf;
  outline: none;
  opacity: 0.7;
  -webkit-transition: .2s;
  transition: opacity .2s;
}

.slider:hover {
  opacity: 1;
}

.slider::-webkit-slider-thumb {
  -webkit-appearance: none;
  appearance: none;
  width: 25px;
  height: 25px;
  border-radius: 50%;
  background: #f60;
  cursor: pointer;
}

.slider::-moz-range-thumb {
  width: 25px;
  height: 25px;
  border-radius: 50%;
  background: #f68a42;
  cursor: pointer;
}
.orangeButton{
	background: #ff6f0f;
	font-weight: bold;
	color: white;
}
.btn-coin-hover{transition: all 0.2s ease; border: 1px solid #f68a42; color: #f68a42;}
.btn-coin-hover:hover{background: #f68a42 !important; color: #fff !important;}
.btn-order-hover{transition: all 0.2s ease; background:#e78341 !important; border: none;"}
.btn-order-hover:hover{background-color:#d57433 !important;}

.addr-list-item{transition: all 0.2s !important; cursor: pointer; }
.addr-list-item:hover{background-color: #f9f9f9 !important;}

</style>
<head>
<meta charset="UTF-8">
<title>사파리 | 렌탈 주문 확인</title>
<!-- 메타 섹션 -->
<jsp:include page="../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->
</head>
<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->
	
	<div class="container border-top my-0 py-4">
		<div class="row mt-3">
			<div class="col-8" style="padding-right: 80px;">
				<div class="row">
					<div class="col">
						<p class="fs-4 fw-bold"><i class="bi bi-archive"></i> 주문/결제</p>
					</div>				
				</div>
				
				<div class="row mt-4">
					<div class="col">
					
						<div class="row justify-content-between">
							<div class="col">
								<p class="fs-5 mb-2 fw-bold">배송지</p>
							</div>
							<div class="col text-end">
								<p onclick="registerAddrPage()" class="btn btn-outline-secondary mb-0">주소추가</p>							
							</div>
						</div>
						<div class="row" style="border-top: 1px solid #c1c1c1;">
							<ul class="list-group list_addr_box">
							</ul>							
						</div>
						
						<div class="row" style="margin-top: 60px;">
							<div class="col">
								<p class="fs-5 fw-bold mb-2">주문자</p>
							</div>
						</div>
						<div class="row" style="border-top: 1px solid #c1c1c1;">
							<div class="col">
								<div class="row mt-3">
									<div class=col-2>
										<p class="">이름</p>									
									</div>
									<div class="col-4">
										<input type="text" class="form-control orderName"/>
									</div>
								</div>

								<div class="row mt-3">
									<div class="col-2">
										<p class="">이메일</p>									
									</div>
									<div class="col-4">
										<input type="text" class="form-control" value="${sessionUser.email }"/>
									</div>
								</div>
								
								<div class="row mt-3">
									<div class="col-2">
										<p class="">휴대전화</p>									
									</div>
									<div class="col-4">
										<input type="text" class="form-control" value="${sessionUser.phone }"/>
									</div>
								</div>
							</div>
						</div>
						
						<div class="row" style="margin-top: 60px;">
							<div class="col">
								<p class="fs-5 fw-bold mb-2">주문상품</p>
							</div>
						</div>
						<div class="row" style="border-top: 1px solid #c1c1c1;">
							<div class="col border rounded-3 mt-4 overflow-hidden">
								<div class="row">
									<div class="col" style="background: #f5f5f5;">
										<p class="mb-0 py-3 fw-bold">딜라이트홈</p>
									</div>
								</div>
								<div class="row px-2 py-3">
									<div class="col-2">
										<img alt="" src="/safariImg/${data.rentalItemDto.main_img_link}" class="rounded-1 img-fluid" >
									</div>
									<div class="col">
										<p class="mb-1">${data.rentalItemDto.title}</p>
										<p class="text-body-secondary">${data.rentalItemDto.item_description}</p>
										<p>17,900원</p>
									</div>
								</div>
							</div>
						</div>
						<div class="row mt-2">
							<div class="col rounded-2 overflow-hidden px-0">
								<table class="table table-bordered">
								  <thead>
								    <tr>
								    	<c:forEach items="${data.rentalPeriodDiscDtoList}" var="periodItem">
									      <td class="text-center bg-body-tertiary" scope="col">${periodItem.rental_period }개월</td>
								    	</c:forEach>
								    </tr>
								  </thead>
								  <tbody>
								    <tr>
								      	<c:forEach items="${data.rentalPeriodDiscDtoList}" var="periodItem">
									      <td class="text-center fw-bold" scope="col"><fmt:formatNumber value="${periodItem.discounted_price }" pattern="#,##0" />원</td>
								    	</c:forEach>
								    </tr>
								  </tbody>
								</table>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<p>대여 시작일</p>
								<input type="date" class="form-control" id="calendar_start" name="start_date" style="height: 40px;" required/>
							</div>
							<div class="col">
								<p>대여 종료일</p>
								<div class="slidecontainer">
									<!-- <input type="range" value="12" class="slider optionPeriod" id="myRange"> -->
								</div>
								
								<div class="counter d-flex">
								  <span class="btn btn-outline-dark p-2 me-2" id="decrease">- </span> 
								   <input type="text" value="1" id="myRange" class="slider optionPeriod form-control p-3 w-25">
								  <span class="btn btn-outline-dark p-2 ms-2"  id="increase"> +</span>
								  <p><span id="monthly"></span>개월</p>
								</div>
							</div>
						</div>
						
						<div class="row" style="margin-top: 60px;">
							<div class="col">
								<p class="mb-2"><span class="fs-5 mb-0 fw-bold">코인 </span><span class="mb-0" style="font-size: 12px;">*보증금을 위한 결제로 보유하고 계신 코인보다 초과로 있어야 합니다.</span></p>
							</div>
						</div>
						<div class="row" style="border-top: 1px solid #c1c1c1;">
							<div class="col mt-3">
								<div class="row">
									<div class="col px-0">
										<p class="fs-5">보증금 <span class="fw-bold"><fmt:formatNumber value="${data.rentalItemDto.deposit }" pattern="#,##0" /></span>원</p>
									</div>
								</div>
								<div class="row">
									<div class="col">
<!-- 										<div class="row">
											<div class="col-4 px-0">
												<input class="form-control" type="text" />
											</div>
											<div class="col">
												<button class="btn fw-bold btn-coin-hover" style="border: 1px solid #f68a42; color: #f68a42;" >사용</button>
											</div>
										</div> -->
										<div class="row">
											<div class="col mt-2 px-0">
												<p class="mb-1" style="font-size: 16px;">사용 가능코인 <span class="fw-bold" style="color: #f68a42;"><fmt:formatNumber value="${userCoinBalance }" pattern="#,##0" /></span></p>
											</div>
											<div class="col text-end">
											<button class="btn orangeButton" onclick="openModal()">충전하기</button>	
											</div>
										</div>
										<div class="row">
											<div class="col px-0 text-danger">
												<p class="coinDesc"></p>
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>
						
						<div class="row" style="margin-top: 60px;">
							<div class="col">
								<p class="fs-5 fw-bold mb-2">결제수단</p>
							</div>
						</div>
						<div class="row" style="border-top: 1px solid #c1c1c1;">
							<div class="col-2 mt-3" style="border: 1px solid #ffa336; background: #fff4e7; cursor: pointer;">
								<div class="row">
									<div class="col p-2 pt-3 text-center">
										<p class="mb-0" style="font-size: 14px; font-weight: bold; color: #555;">카카오페이</p>
									</div>
								</div>
								<div class="row">
									<div class="col pb-3 text-center">
										<img alt="" src="${pageContext.request.contextPath}/resources/img/rental/img_kakaopay.png" class="rounded-1 img-fluid" style="width: 80px;">										
									</div>
								</div>
							</div>
						</div>
						
					</div>
				</div>
			</div>
			
			<div class="col">
				<div class="row sticky-top rounded-2 px-3 py-4 bg-white" style="top:130px; box-shadow: 0px 2px 16px -6px rgba(0, 0, 0, 0.125); border: 1px solid #ccc; z-index: 50;">
					<div class="col">
						<div class="row">
							<div class="col">
								<p class="fs-5 fw-bold"><i class="bi bi-wallet2"></i> 결제 금액</p>					
							</div>
						</div>
						
						<div class="row mt-3 justify-content-between">
							<div class="col">
								<p class="mb-2 text-secondary fw-bold">보증금액</p>
							</div>
							<div class="col text-end">
								<p class="mb-2 fw-bold"><fmt:formatNumber value="${data.rentalItemDto.deposit }" pattern="#,##0" /></p>
							</div>
						</div>
						
						<div class="row mt-3 justify-content-between">
							<div class="col">
								<p class="mb-2 text-secondary fw-bold">총 상품 금액</p>
							</div>
							<div class="col text-end">
								<p class="mb-2 fw-bold">17,900원</p>
							</div>
						</div>
						
						<div class="row justify-content-between">
							<div class="col">
								<p class="mb-2 text-secondary fw-bold">배송비</p>
							</div>
							<div class="col text-end">
								<!-- ￦0(무료) -->
								<p class="mb-2">무료배송</p>
							</div>
						</div>
						
						<div class="row">
							<div class="col">
								<p><span class="fw-bold" id="return_box">시작일과 대여 기간을 설정하세요.</span></p>
							</div>
						</div>
						
						<div class="row border-top pt-3 mt-3 justify-content-between">
							<div class="col">
								<p class="fs-5 fw-bold">최종 결제 금액</p>					
							</div>
							
							<div class="col text-end">
								<p class="fs-4"><span id="desc_price" style="color: #f68a42; font-weight: 900;"></span>원</p>
							</div>
						</div>
						
						<div class="row mt-4">
							<div class="col">
								<input type="hidden" value="${data.rentalItemDto.deposit }" name="deposit">
								<input type="hidden" value="" name="end_date" id="hiddin_date">
								<input type="hidden" value="${data.rentalItemDto.price }" name="original_price">
								<input type="hidden" value="${data.rentalItemDto.id }" name="item_id">
								<input type="hidden" value="" name="price" id="hidden_price">
								<p class="btn w-100 btn-order-hover text-white" onclick="checkVali()">주문신청</p>							
							</div>
						</div>
					</div>
				</div>
			</div>
		
		</div>
	</div>
	
	
	
	
	
	
	
	<%-- <div class="container my-5 py-4">
		<div class="row mb-5">
			<div class="col">
				<div class="row">
					<p class="fs-5 text-body-secondary pb-2 border-bottom" style="font-weight: 600"><i class="bi bi-archive"></i> 상품 정보</p>					
				</div>
				<div class="row mt-2" >
					<div class="row">
						<div class="col-2">
							<img alt="" src="/safariImg/${data.rentalItemDto.main_img_link}" class="rounded-1" style="width: 140px;">							
						</div>
						<div class="col">
							<p class="fs-4 mb-1">${data.rentalItemDto.title}</p>
							<p class="text-body-secondary">${data.rentalItemDto.item_description}</p>
							<p>기본 대여비 <span class="fw-bold"><fmt:formatNumber value="${data.rentalItemDto.price }" pattern="#,##0" /></span>원 </p>
						</div>
					</div>
					
					<div class="row mt-4 py-2">
						<div class="col">
							<table class="table table-bordered">
							  <thead>
							    <tr>
							    	<c:forEach items="${data.rentalPeriodDiscDtoList}" var="periodItem">
								      <td class="text-center bg-body-tertiary" scope="col">${periodItem.rental_period }개월</td>
							    	</c:forEach>
							    </tr>
							  </thead>
							  <tbody>
							    <tr>
							      	<c:forEach items="${data.rentalPeriodDiscDtoList}" var="periodItem">
								      <td class="text-center fw-bold" scope="col"><fmt:formatNumber value="${periodItem.discounted_price }" pattern="#,##0" />원</td>
							    	</c:forEach>
							    </tr>
							  </tbody>
							</table>
						</div>
					</div>

				</div>
				</div>
			</div>
			

			
			
			<div class="row mt-5">
				<p class="fs-5 text-body-secondary pb-2 border-bottom" style="font-weight: 600"><i class="bi bi-file-earmark-text"></i> 계약 정보</p>
			</div>
			<div class="row pb-3 mt-2">
				<div class="col">
					<div class="row">
						<div class="col-2">
							<p class="me-5">시작일 </p>
						</div>

					</div>
					
					<div class="row mt-4">
						<div class="col-2">
							<p class="me-5">대여기간 </p>
						</div>
						<div class="col">
							<div class="slidecontainer">
								<input type="range" value="12" class="slider optionPeriod" id="myRange">
								<p><span id="monthly"></span>개월</p>
							</div>
						</div>
						<div class="col">
							<span class="fw-bold" id="return_box">시작일과 대여 기간을 슬라이드로 설정하세요.</span> 
						</div>
					</div>
					
					<div class="row mt-4">
						<div class="col-2">
							<p class="me-5">배송지 </p>
						</div>
						<div class="col">
							<div class="row">
								<ul class="list-group list_addr_box">
								</ul>							
							</div>
							<div class="row mt-3 ps-3">
								<div class="col d-none">
									<input type="text" id="usr_address" name="prd_address" placeholder="주소입력" class="form-control w-50" onclick="searchAddr()"/>
									<input type="text" id="sub-address" placeholder="상세주소" class="form-control w-25 mt-1"/>								
								</div>
							</div>
							<div class="row ps-3 mt-2">
								<div class="col d-flex px-0">
								 	<p onclick="registerAddrPage()" class="btn btn-outline-secondary mt-2 me-3">주소추가</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row mt-5">
				<p class="fs-5 text-body-secondary pb-2 border-bottom" style="font-weight: 600"><i class="bi bi-wallet2"></i> 결제 정보</p>
			</div>
			<div class="row">
				<div class="col">
					<div class="row">
						<p class="fs-5"><span id="desc_price"></span>원 / <small>월</small></p>				
				
						<p class="fs-5">보증금 <span class="fw-bold"><fmt:formatNumber value="${data.rentalItemDto.deposit }" pattern="#,##0" /></span>원</p>		
					</div>
					
					<div class="row">
						<input type="hidden" value="${data.rentalItemDto.deposit }" name="deposit">
						<input type="hidden" value="" name="end_date" id="hiddin_date">
						<input type="hidden" value="${data.rentalItemDto.price }" name="original_price">
						<input type="hidden" value="${data.rentalItemDto.id }" name="item_id">
						<input type="hidden" value="" name="price" id="hidden_price">
						<span class="btn mt-5 w-25 pe-0 btn-dark" onclick="checkVali()">주문신청</span>
					</div>
				</div>
			</div>
	</div> --%>
	
	<%-- 주소 등록 modal --%>
<div class="modal" id="registerAddrModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered"> 
    <div class="modal-content">
      <div class="modal-header">
     	 <div class="row mb-0">
      			<div class="col ms-4 fs-5 fw-bold">배송지 등록</div>
      		</div>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
      	
      	<div class="row text-center fw-bold fs-5">
    		
       </div>
       
       <div class="row mt-3">
       		<div class="col"></div>
       			<div class="col-11">
		       		
		       		<table class="table" style="border-top: 1px solid #E2E3E5;">
		       			<tr>
		       				<td class="table table-light align-middle text-center " style="width: 150px;">배송지명</td>
		       				<td class="align-middle"> 
		       					<div class="row">
		       						<div class="col">
		       							 <input type="text" class="form-control ms-2" style="width: 200px; height: 30px;"
		       							 id="address_name" > 
		       							
		       						</div>
		       					</div>
		       				</td>
		       			</tr>	
		       			<tr>
							<td class="table table-light align-middle text-center" style="width: 150px;">연락처</td>
		       				<td class="align-middle">
		       					  <div class="row">
				                    <div class="col">
				                       <input type="text" class="form-control ms-2" oninput="oninputPhone(this)" maxlength="14" id="phone"
				                      style="width: 200px; height: 30px;">
				                    </div>
				                  </div>
		       				</td>		       				
		       			</tr>
						<tr>
							<td class="table table-light align-middle text-center" style="width: 150px;">주소</td>
		       				<td>
		       					<div class="row mt-1">
		       						<div class="col-auto">
		       							<input type="text" class="form-control ms-2" id="postcode" style="width: 150px; height: 30px;">
		       						</div>
		       						<div class="col">
		       							<input type="button" class="btn btn-sm btn-outline-secondary" value="우편번호 찾기"
		       							onclick="daumPost()" > 
		       						</div>
		       					</div>
		       					
		       					<div class="row mt-2">
		       						<div class="col">
		       							<input type="text" id="address" class="form-control ms-2" style= "height: 50px;">
		       						</div>
		       					</div>
		       					
		       					<div class="row mt-2">
		       						<div class="col">
		       							<input type="text" id="detail_address" class="form-control ms-2" style="height: 30px;">
		       						</div>
		       					</div>
		       				</td>		       				
		       			</tr>		       			
		       		</table>
		       
		  
		      </div>
     	    <div class="col"></div>
      </div>
      
      <div class="row mt-4">
      	<div class="col"></div>
      </div>
      
      <div class="modal-footer">
      	<input type="button" class="btn orangeButton" value="등록하기" onclick="addUserAddress()">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창닫기</button>
      </div>      
   
    </div>
  </div>
</div>
</div>
<%-- 주소 등록 modal --%>

<!-- 코인 충전 모달 -->
<div class="modal" id="modalCoin" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">코인 충전하기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<div class="row">
      		<div class="col">
		        <select class="form-select form-select-lg mb-3" id="inputCoin" aria-label=".form-select-lg example">
				  <option selected>금액 선택</option>
				  <option value="5000">5,000원</option>
				  <option value="10000">10,000원</option>
				  <option value="30000">30,000원</option>
				  <option value="50000">50,000원</option>
				  <option value="100000">100,000원</option>
				</select>
			</div>
		</div>
		
		<div class="row mt-1 ms-1">
			<div class="col">
				코인은 한 번에 최대 <span class="fw-bold">100,000원</span>까지 충전하실 수 있습니다.
			</div>
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn orangeButton" onclick="onChargeCoin()">충전하기</button>
      </div>
    </div>
  </div>
</div>
<!-- 코인 충전 모달 -->

	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->
	

	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	let coinDesc = document.querySelector(".coinDesc")
	let coinBalance = ${userCoinBalance}
	let itemDeposit = ${data.rentalItemDto.deposit }
	// 로그인된 세션 초기화
	let mySessionId = null;
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
	
	function checkVali() {
		
		if(coinBalance < itemDeposit) {
			alert('보증금을 결제할 코인이 부족합니다!')
		} 
		
		const calendarStart = document.querySelector('#calendar_start').value
		const myRange = document.querySelector('#myRange').value
		let myAddress = document.querySelectorAll('[name=address]')
		let selectedAddr =''
		
		for(let i = 0; i<myAddress.length; i++) {
			let radioAddr = myAddress[i]
			if(radioAddr.checked) {
				selectedAddr = myAddress[i]
			}
		}
		
		console.log('calendarStart 길이:: ',calendarStart.length )
		console.log(myRange)
		console.log(selectedAddr.value)
		
		if(calendarStart.length > 1 && myRange != null && selectedAddr.value != null) {
			console.log('다 채워짐!!!')
			onReadyRentalKakaoPay()
		} else {
			alert('모든 칸을 채워주세요!')
		}
	}
	
	function checkCoinBalance() {
		if(coinBalance < itemDeposit) {
			coinDesc.innerText = '보증금을 결제할 코인이 부족합니다!'
		} else {
			let remainCoin = coinBalance - itemDeposit
			coinDesc.innerText = '보유하고 계신 코인으로 결제진행후 잔액 코인은 '+ remainCoin.toLocaleString() + '입니다.'			
		}
	}
	
	// 카카오페이 결제 ID 와 대여오더 ID 를 같이 쓸 pk 생성
	function onReadyRentalKakaoPay() {
		const xhr = new XMLHttpRequest()

		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200){
				const response = JSON.parse(xhr.responseText);
				
				const rentalOrderId = response.rentalOrderId;
				console.log(response.rentalOrderId);

				onRentalKakaoPay(rentalOrderId);
				
			}
		}

		xhr.open("get", "../rental/getRentalOrderPk");
		xhr.send();	
	}
	
	// 렌탈 카카오페이 진행
	function onRentalKakaoPay(rentalOrderId) {
		const xhr = new XMLHttpRequest();
		const itemId = document.querySelector("[name=item_id]").value
		const startDate = document.querySelector("[name=start_date]").value
		const endDate = document.querySelector("[name=end_date]").value
		const address = document.querySelector("[name=address]").value
		const price = document.querySelector("[name=price]").value
		const originalPrice = document.querySelector("[name=original_price]").value
		const deposit = document.querySelector("[name=deposit]").value 
		const orderName = document.querySelector(".orderName").value
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				const response = JSON.parse(xhr.responseText);
				if(response.result == "success"){
					mySessionId = response.id; 
					const kakaoResult = JSON.parse(response.kakaoResult)
					
					console.log(kakaoResult.tid)
					
					location.href = kakaoResult.next_redirect_pc_url
					
				}
			}
		}
		
		xhr.open("get", "./rentalOrderKakaoProcess?user_id="+mySessionId+"&name="+orderName+"&item_id=" + itemId + "&start_date=" + startDate + "&end_date=" + endDate + "&address=" + address + "&price=" + price + "&original_price=" + originalPrice + "&deposit=" + deposit + "&id="+ rentalOrderId);
		xhr.send();
	}
	
	// 카카오 주소 api
    function searchAddr() {
        new daum.Postcode({
            oncomplete: function(data) {
            	
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                
                document.getElementById("usr_address").value =  data.zonecode+roadAddr+data.jibunAddress;
            }
        }).open();
    }
	
	// 오늘 이전 날짜 선택 안되게
	const setDateInput = () => {
	      const today = new Date();
	      const yyyy = today.getFullYear();
	      const mm = String(today.getMonth() + 1).padStart(2, '0');
	      const dd = String(today.getDate()+7).padStart(2, '0');
	      const formattedDate = `\${yyyy}-\${mm}-\${dd}`;
	    
	      document.getElementById('calendar_start').setAttribute('min', formattedDate);
	  };
	
	 
	  
	// 종료일 및 할인가격
		// console.log(new Date('2023-06-22'))
	  let calendarStart = document.querySelector('#calendar_start')
	  let optionPeriod = document.querySelector('.optionPeriod')
	  let hiddinDate = document.querySelector('#hiddin_date')
	  let hiddenPrice = document.querySelector('#hidden_price')
	  
	  let startValue
	  let periodValue
	  // 반납일
	  let returnDate
	  
		// 개월수 조절버튼
		const increaseButton = document.getElementById('increase');
		const decreaseButton = document.getElementById('decrease');
		
		let count = 1; // 초기 값은 1로 설정
		
		function updateCount(value) {
		  count = value;
		  optionPeriod.value = count;
		  
			periodValue = parseInt(count)
			calcRentDate()
			hiddinDate.value = returnDate
			showDescPrice()
		}
		
		function increaseCount() {
		  if (count < 36) {
		    updateCount(count + 1);
		  }
		}
		
		function decreaseCount() {
		  if (count > 1) {
		    updateCount(count - 1);
		  }
		}
		
		increaseButton.addEventListener('click', increaseCount);
		decreaseButton.addEventListener('click', decreaseCount);
	  
	  calendarStart.addEventListener('change', function(e) {
		startValue = new Date(e.target.value)
		console.log("선택된 시작 날짜:: ",startValue)
		calcRentDate()
		hiddinDate.value = returnDate
	  })
  
/* 		  optionPeriod.addEventListener('change', function(e) {
		periodValue = parseInt(e.target.value)
		calcRentDate()
		hiddinDate.value = returnDate
		showDescPrice()
	  }) */
	  
	  function calcRentDate() {
		if(startValue > 0 && periodValue > 0) {
			returnDate = getDayOfReturn(startValue, periodValue)
			let returnBox = document.querySelector('#return_box')
			returnBox.innerHTML =`
				<small>반납 예정일은 </small> <sapn class="fw-bold">\${returnDate}</span> <small>입니다.</small>
				`
		  console.log(returnDate, '에 반납 하는 달...');
		} return
	}
	  
	  
    
	// 남은 대여 개월수 측정
	function getMonthDiffer(startMonth, endMonth) {
		  return (
		    endMonth.getMonth() -
		    startMonth.getMonth() +
		    12 * (endMonth.getFullYear() - startMonth.getFullYear())
		  );
		}
	//console.log('대여기간 ', getMonthDiffer(new Date('2023-06-19'), new Date('2024-06-19')), '개월 남았습니다.');
	
	// 남은 대여 일자수 측정
	function getDayDiffer(startDate, endDate) {
		  const msInDay = 24 * 60 * 60 * 1000;
	
		  return Math.round(
		    Math.abs(endDate - startDate) / msInDay 
		  );
		}
	//console.log('대여기간 ', getDayDiffer(new Date('2023-06-17'), new Date('2023-09-19')), '일 남았습니다.');
	
	// 반납 하게 될 일자 찾기
	function getDayOfReturn(startDate, endMonth) {
           let startMonth = startDate.getMonth()
           let startNewDate = new Date()
           startNewDate.setMonth(startMonth + endMonth)
           
           // let day = startNewDate.getDate()
           let day = startDate.getDate()
           let month = startNewDate.getMonth() + 1
           let year = startNewDate.getFullYear()
        
             return `\${year}-\${month}-\${day}`
		}
	
	// console.log(getDayOfReturn(new Date('2023-06-17'), 6 ), '월에 반납 하는 달!!!');
	
	// 조기 반납시 처리
	function calcEarlyReturn(startDate, oiginEndDate, endDate) {
		  const msInDay = 24 * 60 * 60 * 1000;
	
		  const originDayLeft = Math.round(
		    Math.abs(oiginEndDate - startDate) / msInDay 
		  );
		  
		  const returnedLeft = Math.round(
		    Math.abs(endDate - startDate) / msInDay 
		  );
	/* 	  console.log("originDayLeft:: ", originDayLeft)
		  console.log("returnedLeft:: ", returnedLeft)
		  console.log(Math.round(returnedLeft / originDayLeft * 100)); */
		  
		  const percentageValue = `\${Math.round(returnedLeft / originDayLeft * 100)}%`
		  return percentageValue
		  
		}
		
		//console.log('호갱님 지금 반납하게 되시면 ',calcEarlyReturn(new Date('2023-06-17'), new Date('2023-09-19'), new Date('2023-08-19')),'대여 이용 하시게 되어 보증금 1000만원이 차감됩니다.' )
		
		// 개월수 슬라이더
		let slider = document.getElementById("myRange");
		let output = document.getElementById("monthly");
		output.innerHTML = slider.value;
		
		slider.oninput = function() {
		  output.innerHTML = this.value;
		}

		// 렌탈 최소, 최대 기간 설정
		let rentalPeriodList = []
		let rentalDiscPriceList = []
		
		<c:forEach items="${data.rentalPeriodDiscDtoList}" var="dates">
			rentalPeriodList.push("${dates.rental_period}")
		</c:forEach>
		
		const maxMonthVal = Math.max(...rentalPeriodList)
		const minMonthVal = Math.min(...rentalPeriodList)
		
		slider.setAttribute('min',minMonthVal)
		slider.setAttribute('max',maxMonthVal)
		
		function showDescPrice() {
			<c:forEach items="${data.rentalPeriodDiscDtoList}" var="list">
			console.log("is workd??", periodValue)
			if(periodValue >= ${list.rental_period} ){
				console.log(${list.discounted_price})
				let descPrice = document.querySelector("#desc_price")
				let calcPrice = ${list.discounted_price}
				console.log(calcPrice.toLocaleString('ko-KR'))
				descPrice.innerText = calcPrice.toLocaleString('ko-KR')
				hiddenPrice.value =${list.discounted_price}
			}
			</c:forEach>
			
		}

	// 주소 등록 모달 열기
	function registerAddrPage() {
		
		const registerAddrModal = bootstrap.Modal.getOrCreateInstance("#registerAddrModal");
		
		registerAddrModal.show();
	}
	
	// 다음 주소 api
	function daumPost(){
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	            
	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }
	            document.getElementById('postcode').value = data.zonecode;
	            document.getElementById('address').value = addr;
	            document.getElementById('detail_address').focus();
	        }
	    }).open();
	}

	// 전화번호 형식 변경 함수
	function oninputPhone(target) {
	    target.value = target.value
	        .replace(/[^0-9]/g, '')
	        .replace(/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
	}

	// 주소 등록
	function addUserAddress() {
		
		const address_name = document.getElementById("address_name");
		const phone = document.getElementById("phone");
		const postcode = document.getElementById("postcode");
		const address = document.getElementById("address");
		const detail_address = document.getElementById("detail_address");
		
		if (address_name.value == "" || phone.value == "" || address.value == "") {
			
			const content = document.getElementById("validateContent");
			content.innerHTML = "";
			
			const validateModal = bootstrap.Modal.getOrCreateInstance("#addrValidateModal");
			if (address_name.value == "") {
				content.innerText = "배송지명을 입력하세요";
			} else if (phone.value == "") {
				content.innerText = "연락처를 입력하세요";
			} else if (address.value == "") {
				content.innerText = "주소를 입력하세요";
			}
			
			validateModal.show();
			
			setTimeout(function() {
				validateModal.hide();
			}, 1000);
			
			return;
		}
		
		
		
		const xhr = new XMLHttpRequest();	
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				const response = JSON.parse(xhr.responseText);
				
				const registerAddrModal = bootstrap.Modal.getOrCreateInstance("#registerAddrModal");
				registerAddrModal.hide();
				
				address_name.value = "";
				phone.value = "";
				postcode.value = "";
				address.value = "";
				detail_address.value ="";
				
				getMyaddressList();
				
			}
		}
		xhr.open("post", "../user/addUserAddress");
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
		xhr.send("address_name=" + address_name.value + "&phone=" + phone.value + "&address=" + address.value + "  " + detail_address.value);	
	}
	
	
	
	// 주소 리스트 불러오기
	function getMyaddressList() {
		let listAddrBox = document.querySelector('.list_addr_box')
		const item = document.querySelector('.list-group-item')
		const xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				const response = JSON.parse(xhr.responseText);
				listAddrBox.textContent=''
				addrUsrName = '${sessionUser.nickname}'
				
				response.addressList.forEach((val, i) => {
					let divrow = document.createElement('div')
					let divcol = document.createElement('div')
					let li = document.createElement('li')
					let span = document.createElement('span')
					let input = document.createElement('input')
					let label = document.createElement('label')
					let p = document.createElement('p')
					let p2 = document.createElement('p')
					
					divrow.className = 'row'
					divcol.className = 'col px-0'
					
					input.setAttribute('type', 'radio')
					input.setAttribute('name', 'address')
					input.setAttribute('id', 'addr'+ i)
					input.setAttribute('value', val.address)
					input.classList.add('me-2')
					
					label.setAttribute('for', 'addr'+ i)
					label.className = 'w-100 p-3 addr-list-item'
					label.style.cursor = 'pointer'
					
					p2.className = 'mb-0 ms-3 mt-1 ps-1 text-secondary';
	 				p2.innerText = addrUsrName + ' ' + val.phone
					
					p.className = 'mb-0 ms-3 mt-2 ps-1'
					p.innerText = val.address
					
					span.className = 'fw-bold'
					span.innerText = val.address_name
					
					divcol.appendChild(input)
					divcol.appendChild(span)
					divcol.appendChild(p)
					divcol.appendChild(p2)
					
					divrow.appendChild(divcol)
					label.appendChild(divrow)
					li.appendChild(label)
					li.className = 'list-group-item w-100 list-addr-item border-0 px-0'
					
					listAddrBox.appendChild(li)
					
				})

			}
		}
		
		xhr.open("get", "../user/getUserAddress");
		xhr.send();	
	}

	function openModal() {
		const modal = bootstrap.Modal.getOrCreateInstance('#modalCoin');
		modal.show();
	}

	// 코인 충전 pk 받아오기
	function onChargeCoin() {
		
		const xhr = new XMLHttpRequest();

		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200){
				const response = JSON.parse(xhr.responseText);
				
				const orderId = response.partnerOrderId;
				
				chargeCoinProcess(orderId);
				
			}
		}

		xhr.open("get", "/safari/user/getOnChargeCoinPk");
		xhr.send();
	}
	
	// 코인 충전하기
	function chargeCoinProcess(orderId){
			
	   
	   const cid = 'TC0ONETIME';
	   const partner_order_id = orderId;
	   const partner_user_id = mySessionId;
	  
	   
	   const quantity = 1;
	   const total_amount = document.querySelector('#inputCoin').value; // 충전 금액
	   const tax_free_amount = 0;
	   
	   const item_name = "사파리 코인 " + new Intl.NumberFormat('ko-KR').format(total_amount) + "원 충전";
	   
	   const url = new URL(window.location.href)
	   const urlHref = url.href
	   
	   const approval_url = urlHref;
	   const cancel_url = "http://localhost:8181/safari/user/myCoinPage";
	   const fail_url = "http://localhost:8181/safari/user/myCoinPage";
	   
	   // 잘 찍히는지 확인
	   console.log(cid);
	   console.log(partner_order_id);
	   console.log(partner_user_id);
	   console.log(total_amount);
	   console.log(quantity);
	   console.log(tax_free_amount);
	   console.log(approval_url);
	   console.log(cancel_url);
	   console.log(fail_url);
	   
	 
	   
	   const xhr = new XMLHttpRequest();
	   
	   xhr.onreadystatechange = function() {
		   if (xhr.readyState === XMLHttpRequest.DONE) {
		   if (xhr.status === 200) {
	           const response = JSON.parse(xhr.responseText);

	            const tid = response.tid;      	
		
	            const width = 600;
	            const height = 600;
	            const left = (window.screen.width - width) / 2;
	            const top = (window.screen.height - height) / 2;
	            const windowFeatures = "width=" + width + ",height=" + height + ",top=" + top + ",left=" + left + ",location=no,status=no,scrollbars=yes";
	            const paymentWindow = window.open(response.next_redirect_pc_url, "_blank", windowFeatures);
	            
	            if (paymentWindow) {
	               // 팝업이 정상적으로 열린 경우
	               paymentWindow.focus();
	            } else {
	               // 팝업이 차단되었을 경우
	               alert("팝업 차단이 감지되었습니다. 결제를 진행하려면 팝업 차단을 해제해주세요.");
	            }
	         	
	      
	         	
	            // tid를 세션에 저장
	            saveChargeCoinTidToSession(cid, partner_order_id, partner_user_id, tid, item_name, response.next_redirect_pc_url);
	           
	       } else {
	    	   
	       }
		   }
	   };	
	   
	   
	   xhr.open("POST", "https://kapi.kakao.com/v1/payment/ready");
	   xhr.setRequestHeader("Authorization", "KakaoAK 88927c6d047da3940394d71e197276c3");
	   xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
	   xhr.send("cid="+cid+"&partner_order_id="+partner_order_id+"&partner_user_id="+partner_user_id+"&item_name="+item_name+
			   "&quantity="+quantity+"&total_amount="+total_amount+"&tax_free_amount="+tax_free_amount+
			   "&approval_url="+approval_url+"&cancel_url="+cancel_url+"&fail_url="+fail_url);
	 
	}
		
	//tid 세션에 저장하기
	function saveChargeCoinTidToSession(cid, partner_order_id, partner_user_id, tid, item_name, 
			 next_redirect_pc_url) {
		
		 	const xhr = new XMLHttpRequest();


		    xhr.onreadystatechange = function() {
		        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
		            
		        	
		        	
		        }
		    };
		    
		    xhr.open("post", "/safari/user/saveChargeCoinTidToSession");
		    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		    xhr.send("cid="+cid+"&partner_order_id="+partner_order_id+"&partner_user_id="+partner_user_id+"&tid="+tid+"&item_name="+item_name);	
			
	}	
		


	window.addEventListener("DOMContentLoaded", function(){
		getSessionId()
		getMyaddressList()
		setDateInput()
		checkCoinBalance()
	});
	</script>
</body>
</html>