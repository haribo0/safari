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
  background: #e9e9e9;
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
  background: #f68a42;
  cursor: pointer;
}

.slider::-moz-range-thumb {
  width: 25px;
  height: 25px;
  border-radius: 50%;
  background: #f68a42;
  cursor: pointer;
}
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
	
	<div class="container my-5 py-4">
		<div class="row mb-5">
			<div class="col">
				<div class="row">
					<p class="mb-4 bg-light p-3 fs-6">대여 주문 확인서</p>				
				</div>
				<div class="row">
					<p class="fs-5 text-body-secondary pb-2 border-bottom" style="font-weight: 600"><i class="bi bi-archive"></i> 상품 정보</p>					
				</div>
				<div class="row mt-2" >
					<div class="row">
						<div class="col-2">
							<img alt="" src="/safariImg/${data.rentalItemDto.main_img_link}" class="rounded-1" style="width: 140px;">							
						</div>
						<div class="col">
							<p class="fs-5">${data.rentalItemDto.title}</p>
							<p>${data.rentalItemDto.item_description}</p>
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
						<div class="col">
							<input type="date" class="form-control" id="calendar_start" name="start_date" style="height: 40px; width: 32%;" required/>
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
							<span>반납 예정일은</span> <span class="fw-bold" id="return_box"></span> <span>입니다.</span>
						</div>
					</div>
					
					<div class="row mt-4">
						<div class="col-2">
							<p class="me-5">배송지 </p>
						</div>
						<div class="col">
							<div class="row">
								<div class="list_addr_box">
								</div>							
							</div>
							<div class="row mt-3 ps-3">
								<div class="col">
									<input type="text" id="usr_address" name="prd_address" placeholder="주소입력" class="form-control w-50" onclick="searchAddr()"/>
									<input type="text" id="sub-address" placeholder="상세주소" class="form-control w-25 mt-1"/>								
								</div>
							</div>
							<div class="row ps-3 mt-2">
								<div class="col d-flex px-0">
								 	<p onclick="searchAddr()" class="btn btn-outline-secondary mt-2 me-3">주소찾기</p>
									<p class="btn btn-dark mt-2" onclick="addMyAddr()">추가</p>
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
			
			
			<%-- <form action="./rentalOrderProcess" method="post">
				<p class="mb-4 bg-light p-3 fs-4">대여 주문 확인서</p>
				
				<div class="row pt-3">
					<img alt="" src="/safariImg/${data.rentalItemDto.main_img_link}" class="rounded" style="width: 160px;">
				</div>
				
				<div class="row mt-4">
					<div class="col-2">
						<p class="me-5 fw-bold">시작일: </p>
					</div>
					<div class="col">
						<input type="date" class="form-control" id="calendar_start" name="start_date" style="height: 40px; width: 32%;" required/>
					</div>
				</div>
				
				<div class="row mt-4">
					<div class="col-2">
						<p class="me-5 fw-bold">대여기간: </p>
					</div>
					<div class="col">
						<div class="slidecontainer">
						  <input type="range" value="12" class="slider optionPeriod" id="myRange">
						  <p><span id="monthly"></span>개월</p>
						</div>
					</div>
					
				</div>
				
				<div class="row mt-4">
					<div class="col-2">
						<p class="me-5 fw-bold">종료일: </p>
					</div>
					<div class="col">
						<p id="return_box"></p>					
					</div>
				</div>
				
				<div class="row mt-4">
					<div class="col-2">
						<p class="me-5 fw-bold">배송지: </p>
					</div>
					<div class="col">
						<div class="list_addr_box">
						
						</div>
					</div>
				</div>
				
				<div class="row mt-3">
					<div class="col-2">
					</div>
					<div class="col-6 ps-4 mt-2">
						<div class="row">
							<div class="row">
								<input type="text"  id="usr_address" name="prd_address" placeholder="주소입력" class="form-control"/>							
							</div>
							<div class="row mt-2">
								<div class="col d-flex justify-content-between px-0">
								 	<span onclick="searchAddr()" class="btn btn-outline-secondary mt-2">주소찾기</span>
									<span class="btn btn-dark mt-2" onclick="addMyAddr()">추가</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row mt-5 py-3">
					<p class="fs-5 text-end"><span id="desc_price"></span>원 / <small>월</small></p>					
				
					<p class="fs-5 text-end">기본가격: <span class="fw-bold"><fmt:formatNumber value="${data.rentalItemDto.price }" pattern="#,##0" /></span>원 </p>					
				
					<p class="fs-5 text-end">보증금: <span class="fw-bold"><fmt:formatNumber value="${data.rentalItemDto.deposit }" pattern="#,##0" /></span>원</p>					
					
					<input type="hidden" value="${data.rentalItemDto.deposit }" name="deposit">
					<input type="hidden" value="" name="end_date" id="hiddin_date">
					<input type="hidden" value="${data.rentalItemDto.price }" name="original_price">
					<input type="hidden" value="${data.rentalItemDto.id }" name="item_id">
					<input type="hidden" value="" name="price" id="hidden_price">
					<div class="row justify-content-end">		
					 	<span class="btn btn-success mt-5 w-25 pe-0" onclick="checkVali()">주문신청</span>
					</div>
				</div>
			</form>
			 --%>
	</div>
	
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->
	

	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
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
		
		xhr.open("get", "./rentalOrderKakaoProcess?user_id="+mySessionId+"&item_id=" + itemId + "&start_date=" + startDate + "&end_date=" + endDate + "&address=" + address + "&price=" + price + "&original_price=" + originalPrice + "&deposit=" + deposit + "&id="+ rentalOrderId);
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
	      const dd = String(today.getDate()).padStart(2, '0');
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
	  
	  calendarStart.addEventListener('change', function(e) {
		startValue = new Date(e.target.value)
		console.log("선택된 시작 날짜:: ",startValue)
		calcRentDate()
		hiddinDate.value = returnDate
	  })
	  
	  optionPeriod.addEventListener('change', function(e) {
		periodValue = parseInt(e.target.value)
		hiddinDate.value = periodValue
		calcRentDate()
		hiddinDate.value = returnDate
		// 기간에 따른 가격 표시
		showDescPrice()
	  })
	  
	  function calcRentDate() {
		if(startValue > 0 && periodValue > 0) {
			returnDate = getDayOfReturn(startValue, periodValue)
			let returnBox = document.querySelector('#return_box')
			returnBox.innerText = returnDate
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

	// 배송지 주소 추가
	function addMyAddr() {
        let subAddr = document.querySelector('#sub-address').value
		let inputAddr = document.querySelector("#usr_address").value + ' ' + subAddr;
		let usrAddress = inputAddr.trim();

		if(!usrAddress) return;
		
		const xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				const response = JSON.parse(xhr.responseText);
				
				// refreshMyAddress
				getMyaddressList()
				console.log(response.result)
				usrAddress = ''
				subAddr = ''
			}
		}
		
		xhr.open("get", "../user/addUserAddress?address=" + usrAddress);
		xhr.send();	
	}

	// 주소 리스트 불러오기
	function getMyaddressList() {
		let inputAddr = document.querySelector("#usr_address")
		let listAddrBox = document.querySelector('.list_addr_box')
		const item = document.querySelector('.list-group-item')
		const xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				const response = JSON.parse(xhr.responseText);
				inputAddr.value = ''
				listAddrBox.textContent=''
				
				response.addressList.forEach((val, i) => {
					let p = document.createElement('p')
					let input = document.createElement('input')
					let label = document.createElement('label')
					
					input.setAttribute('type', 'radio')
					input.setAttribute('name', 'address')
					input.setAttribute('id', 'addr'+ i)
					input.setAttribute('value', val.address)
					input.classList.add('me-2')
					
					label.setAttribute('for', 'addr'+ i)
					label.innerText = val.address
					
					p.appendChild(input)
					p.appendChild(label)
					
					//p.classList.add('border')
					//p.classList.add('p-2')
					p.classList.add('w-75')
					p.classList.add('rounded')
					
					listAddrBox.appendChild(p)
					
				})

			}
		}
		
		xhr.open("get", "../user/getUserAddress");
		xhr.send();	
	}

	window.addEventListener("DOMContentLoaded", function(){
		getSessionId()
		getMyaddressList()
		setDateInput();
	});
	</script>
</body>
</html>