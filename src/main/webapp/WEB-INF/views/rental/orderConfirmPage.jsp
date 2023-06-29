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
  width: 32%;
}

.slider {
  -webkit-appearance: none;
  width: 100%;
  height: 15px;
  border-radius: 5px;
  background: #d3d3d3;
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
  background: #04AA6D;
  cursor: pointer;
}

.slider::-moz-range-thumb {
  width: 25px;
  height: 25px;
  border-radius: 50%;
  background: #04AA6D;
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
		<div class="row">
			<form action="./rentalOrderProcess" method="post">
				<h2 class="mb-4">대여 주문 확인서</h2>
				
				<div>
					<img alt="" src="/file/${data.rentalItemDto.main_img_link}" style="width: 80px;">
				</div>
				
				<div class="d-flex mt-3">
					<p class="me-5">시작일: </p> <input type="date" class="form-control ms-3" id="calendar_start" name="start_date" style="height: 40px; width: 32%;" required/>
				</div>
				
				<div class="d-flex mt-3">
					<p class="me-5">대여기간: </p>
					<div class="slidecontainer">
					  <input type="range" value="6" class="slider optionPeriod" id="myRange">
					  <p><span id="monthly"></span>개월</p>
					</div>
				</div>
				
				<div class="d-flex mt-3">
					<p class="me-5">종료일: </p> <p id="return_box"></p>
				</div>
				
				<div class="d-flex mt-3">
					<p class="me-5">배송지: </p> 
					<div class="list_addr_box">
					
					</div>
					<div>
						<p> 
							<input type="text"  id="usr_address" name="prd_address" placeholder="주소입력" class="form-control ms-3" style="width: 400px;"/> <div onclick="searchAddr()" class="btn btn-secondary mt-2 ms-3">주소찾기</div>
						</p>
						<p class="btn btn-dark ms-2" onclick="addMyAddr()">추가</p>
					</div>
				</div>
				
				<div class="mt-3">
					<p class="fs-4"><span id="desc_price">할인가격</span>원 / <small>월</small></p>
					<p class="mt-2 fs-4">기본가격: ${data.rentalItemDto.price } 원 </p>
					<p class="mt-2 fs-4">보증금:  ${data.rentalItemDto.deposit } 원</p>
				</div>
				
				<input type="hidden" value="${data.rentalItemDto.deposit }" name="deposit">
				<input type="hidden" value="" name="end_date" id="hiddin_date">
				<input type="hidden" value="${data.rentalItemDto.price }" name="original_price">
				<input type="hidden" value="${data.rentalItemDto.id }" name="item_id">
				<input type="hidden" value="" name="price" id="hidden_price">
				<button class="btn btn-success w-25 mt-5">주문신청</button>
			</form>
		</div>
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
	
	  setDateInput();
	  
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
	
	 console.log(getDayOfReturn(new Date('2023-06-17'), 6 ), '월에 반납 하는 달!!!');
	
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
				descPrice.innerText = ${list.discounted_price}
				hiddenPrice.value =${list.discounted_price}
			}
			</c:forEach>
			
		}

	// 배송지 주소 추가
	function addMyAddr() {
		let inputAddr = document.querySelector("#usr_address");
		let usrAddress = inputAddr.value.trim();

		if(!usrAddress) return;
		
		const xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				const response = JSON.parse(xhr.responseText);
				
				// refreshMyAddress
				getMyaddressList()
				console.log(response.result)
				usrAddress = ''
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
					
					label.setAttribute('for', 'addr'+ i)
					label.innerText = val.address
					
					p.appendChild(input)
					p.appendChild(label)
					
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
		
	});
	</script>
</body>
</html>