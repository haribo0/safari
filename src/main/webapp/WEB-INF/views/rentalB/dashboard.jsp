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

<style type="text/css">
.font-smaller {
	font-size: 13px;
}

</style>

<!-- chart.js cdn -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

</head>
<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../common/headerB.jsp"></jsp:include>
	<!-- 헤더 섹션 -->

	<div class="container-fluid main_box  ">
		<div class="row"> <!-- 2023-07-01 시욱수정 -->
		
			<div class="col-2" style=""></div>
			<div class="col-2 bg-dark h-100" style="position: fixed;"> <!-- 2023-07-01 시욱수정 -->
				<div class="list-group list-group-flush">
				
					<!-- 왼쪽 카테고리 리스트 -->
					<jsp:include page="../common/navLeft.jsp"></jsp:include>
					
				</div>
				
				<div class="row mt-5 mb-5">
					<div class="col"> </div>
				</div>
			
			</div>
			
			
			<div class="col mt-5"> <!-- 2023-07-01 시욱수정 -->
							
				<h4 class="ps-4 ms-4 mt-3 mb-4 fw-regular">대시보드 </h4> <!-- 2023-07-01 시욱수정 -->


				<div class="row mt-5 ms-4"> <!-- 2023-07-01 시욱수정 -->
					<div class="col">
						<div class="card" >
						  <div class="card-body">
						    <h5 class="fs-5 ms-2 fw-bold"> 월별 주문 </h5>
						    <hr class="border">
						    <canvas id="barChart"></canvas>
						  </div>
						</div>
						
						
					</div>
					
					<div class="col">
						<div class="card" >
						  <div class="card-body">
						    <h5 class="fs-5 ms-2 fw-bold"> 월간 매출액 </h5>
						    <hr class="border">
						    <canvas id="lineChart"></canvas>
						  </div>
						</div>
						
					</div>
					
					<div class="col-3 px-4">
						<div class="card px-3" >
						  <div class="card-body">
						    <h5 class="fs-5 ps-0 fw-bold">고객 성별 비율 </h5>
						    <hr class="border">
						    <canvas id="pieChart"></canvas>
						  </div>
						</div>
					</div>
					
					
					
				</div>
				
				<div class="row mt-5 ms-4"> <!-- 2023-07-01 시욱수정 -->
				
					<div class="col-2">
						<div class="card" >
						  <div class="card-body ms-2">
						    <h5 class="fs-5  fw-bold"> 최근 </h5>
						    <hr class="border">
						    <div class="fw-bolder fs-6 text-dark mt-2">
						    	주문
						    </div>
						    <div class="fw-light fs-5 text-dark mt-1">
						    	5 건 
						    	<span class="fw-light font-smaller text-secondary"> &nbsp; / 일주일</span>
						    </div>
						    <div class="fw-light fs-5 text-dark mt-1">
						    	24 건 
						    	<span class="fw-light font-smaller text-secondary"> &nbsp; / 한달</span>
						    </div>
						    <div class="fw-bolder fs-6 text-dark mt-3">
						    	매출
						    </div>
						    <div class="fw-light fs-5 text-dark mt-1">
						    	129,000 원 
						    	<span class="fw-light font-smaller text-secondary"> &nbsp; / 일주일</span>
						    </div>
						    <div class="fw-light fs-5 text-dark mt-1">
						    	1,322,600 원
						    	<span class="fw-light font-smaller text-secondary"> &nbsp; / 한달</span>
						    </div>
						  </div>
						</div>
					
					</div>
					
					<div class="col">
						<div class="card" >
						  <div class="card-body">
						  	<div class="row">
						    	<h5 class="fs-5 col ms-2 fw-bold"> 주문 </h5>
						    	<div class="text-end col text-end fw-lighht fs-6 text-secondary">
						    		<a href="./orderListPage2" class="text-secondary text-decoration-none">
						    		+ 더보기
						    		</a>
						    	</div>
						    </div>
						    <hr class="border">
						    <!-- <hr class="border border-dark"> -->
						    
						    <div id="orderListContainer">
						    	
						    
						    </div>
						    
						  </div>
						</div>
					
					</div>
					
					<div class="col">
						<div class="card" >
						  <div class="card-body">
						  	<div class="row">
						   	 	<h5 class="fs-5 col ms-2 fw-bold"> 반품 </h5>
					    		<div class="text-end col text-end fw-lighht fs-6 text-secondary">
						    		<a href="./orderReturnPage" class="text-secondary text-decoration-none">
						    		+ 더보기
						    		</a>
						    	</div>
						    </div>
						    <hr class="border">
						    <!-- <hr class="border border-dark"> -->
						    
						    <div class="returnListContainer">
						    	<div class="row ms-2 mt-3">
						    		<div class="col-9">스탠바이미 TV 27인치 27ART10AKP</div>
						    		<div class="col">06/30/2023</div>
						    	</div>
								<div class="row ms-2 mt-3">
						    		<div class="col-9">드롱기 오텐티카 전자동 커피머신 ETAM29.510.SB</div>
						    		<div class="col">06/27/2023</div>
						    	</div>						    
						    	<div class="row ms-2 mt-3">
						    		<div class="col-9">트롬 오브제컬렉션 워시타워 세탁기 25kg + 건조기 21kg WL21EGZU</div>
						    		<div class="col">06/23/2023</div>	
						    	</div>
						    
						  </div>
						</div>
					
					</div>
					
					<!-- <div class="col">
					
					
					</div> -->
					
				</div>
			
			
			
			
			
			</div>
			
			
			<!-- 빈공간  -->
			 <div class="col-1"> &nbsp; </div>
		
		</div>
	</div>
	
	
	
	
	
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>


<script >


function getDataForChart() {

	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			// bar chart 
			let barLabels = [];
			let	barData = [];
			response.saleList.forEach(function(data){
				// 너무 길면 자르기
				barLabels.push(data.TITLE.length > 10 ? data.TITLE.substring(0, 7)+".." : data.TITLE);
				barData.push(data.SALES);
			});
			makeBarChart(barData,barLabels);
			
			// pie chart
			let pieData = [];
			response.genderList.forEach(function(data){
				pieData.push(data.SALES);
			});
			makePieChart(pieData);
			
			// line chart 
			let lineLabels = [];
			let	lineData = [];
			response.revenueList.forEach(function(data){
				lineLabels.push(data.MONTH);
				lineData.push(data.REVENUE);
			});
			makeLineChart(lineData,lineLabels);
			
		}
	}

	// get 방식 
	xhr.open("get", "getDataForChart");
	xhr.send();

}


function makeBarChart(d, l) {
	const canvas = document.getElementById('barChart');
	
	new Chart(canvas, {
	   type: 'bar',
	   data: {
	     labels: l,
	     datasets: [{
	       label: '상품별 주문',
	       data: d,
	       borderWidth: 1,
	       backgroundColor: [
	    	   'rgba(54, 162, 235, 0.5)'
    	      /* 'rgba(255, 99, 132, 0.2)', 
    	      'rgba(255, 159, 64, 0.6)',
    	      'rgba(255, 205, 86, 0.2)',
    	      'rgba(75, 192, 192, 0.2)',
    	      'rgba(54, 162, 235, 0.2)',
    	      'rgba(153, 102, 255, 0.2)',
    	      'rgba(201, 203, 207, 0.2)' */
    	    ]
	    	
	     }]
	   },
	   options: {
	     scales: {
	       y: {
	         beginAtZero: true
	       }
	   
	   
	     }
	   
	   
	   
	   
	   
	   }
	 });
}





function makePieChart(d) {
	const canvas = document.getElementById('pieChart');

	new Chart(canvas, {
	   type: 'pie',
	   data: {
	     labels: ['남자', '여자'],
	     datasets: [{
	       label: '월별 주문',
	       data: d,
	       borderWidth: 1,
	       backgroundColor: [
    	      'rgba(54, 162, 235, 0.5)',
    	      'rgba(255, 99, 132, 0.5)'
    	    ],
	       hoverOffset: 4
	    	
	     }]
	   },
	   options: {
	     scales: {
	       /* y: {
	         beginAtZero: true
	       } */
	     }
	   }
	 });
	
}




function makeLineChart(d, l) {
	const canvas = document.getElementById('lineChart');
	
	new Chart(canvas, {
	   type: 'line',
	   data: {
	     labels: l,
	     datasets: [{
	       label: '월별 매출',
	       data: d,
	       borderWidth: 1,
	       fill: false,
	       backgroundColor: [
	    	   'rgba(54, 162, 235, .5)'
    	    ],
    	    borderColor: [
	    	   'rgba(54, 162, 235, .75)'
    	    ]
	    	
	     }]
	   },
	   options: {
	     scales: {
	       y: {
	         beginAtZero: true
	       }
	     }
	   }
	 });
}




function getRecentOrderList() {
	
	const orderListContainer = document.getElementById('orderListContainer');

	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			orderListContainer.innerHTML = "";
			response.list.forEach(function(map){
				// Create outer div element with classes
				const rowDiv = document.createElement('div');
				rowDiv.classList.add('row', 'ms-2', 'mt-3');

				// Create inner div elements with classes
				const col1Div = document.createElement('div');
				col1Div.classList.add('col-9');
				col1Div.textContent = map.product.title;

				const col2Div = document.createElement('div');
				col2Div.classList.add('col');
				col2Div.textContent = new Intl.DateTimeFormat('en-US', { month: '2-digit', day: '2-digit', year: 'numeric' }).format(map.order.start_date);

				// Append inner div elements to the outer div element
				rowDiv.appendChild(col1Div);
				rowDiv.appendChild(col2Div);
				orderListContainer.appendChild(rowDiv);

			});
			
		}
	}

	// get 방식 
	xhr.open("get", "./getRecentOrderList");
	xhr.send();
	
}

function getRecentReturnList() {
	
	const returnListContainer = document.getElementById('returnListContainer');

	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			orderListContainer.innerHTML = "";
			response.list.forEach(function(map){
				// Create outer div element with classes
				const rowDiv = document.createElement('div');
				rowDiv.classList.add('row', 'ms-2', 'mt-3');

				// Create inner div elements with classes
				const col1Div = document.createElement('div');
				col1Div.classList.add('col-9');
				col1Div.textContent = map.product.title;

				const col2Div = document.createElement('div');
				col2Div.classList.add('col');
				col2Div.textContent = new Intl.DateTimeFormat('en-US', { month: '2-digit', day: '2-digit', year: 'numeric' }).format(map.returnDto.reg_date);

				// Append inner div elements to the outer div element
				rowDiv.appendChild(col1Div);
				rowDiv.appendChild(col2Div);
				returnListContainer.appendChild(rowDiv);

			});
			
		}
	}

	// get 방식 
	xhr.open("get", "./getRecentReturnList");
	xhr.send();
	
}











window.addEventListener("DOMContentLoaded",function(){
	getDataForChart();
	getRecentOrderList();
	getRecentReturnList();

});


</script>

</body>	
</html>
