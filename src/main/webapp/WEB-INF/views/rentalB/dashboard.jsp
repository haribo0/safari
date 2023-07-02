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
						    <h5 class="fs-6 fw-medium"> 월별 주문 </h5>
						    <hr class="border">
						    <canvas id="barChart"></canvas>
						  </div>
						</div>
						
						
					</div>
					
					<div class="col">
						<div class="card" >
						  <div class="card-body">
						    <h5 class="fs-6 fw-medium"> 월간 매출액 </h5>
						    <hr class="border">
						    <canvas id="lineChart"></canvas>
						  </div>
						</div>
						
					</div>
					
					<div class="col-3 px-4">
						<div class="card px-3" >
						  <div class="card-body">
						    <h5 class="fs-6 fw-medium"> 고객 성별 비율 </h5>
						    <hr class="border">
						    <canvas id="pieChart"></canvas>
						  </div>
						</div>
					</div>
					
					
					
				</div>
				
				<div class="row mt-5 ms-4"> <!-- 2023-07-01 시욱수정 -->
				
					<div class="col-2">
						<div class="card" >
						  <div class="card-body">
						    <h5 class="fs-6 fw-medium"> 최근 주문 </h5>
						    <hr class="border">
						    <div class="fw-light fs-5 text-dark mt-2">
						    	5 건 
						    	<span class="fw-light fs-6 text-secondary"> &nbsp; / 일주일</span>
						    </div>
						    <div class="fw-light fs-5 text-dark mt-2">
						    	24 건 
						    	<span class="fw-light fs-6 text-secondary"> &nbsp; / 한달</span>
						    </div>
						  </div>
						</div>
					
					</div>
					
					<div class="col">
						<div class="card" >
						  <div class="card-body">
						    <h5 class="fs-6 fw-medium"> 주문 </h5>
						    <hr class="border">
						    
						    <div class="text-end fw-lighht fs-6 text-secondary">+ 더보기</div>
						    <hr class="border border-dark">
						    
						    <div class="orderListContainer">
						    
						    
						    </div>
						    
						  </div>
						</div>
					
					</div>
					
					<div class="col">
						<div class="card" >
						  <div class="card-body">
						    <h5 class="fs-6 fw-medium"> 반품 </h5>
						    <hr class="border">
						    
						    <div class="text-end fw-lighht fs-6 text-secondary">+ 더보기</div>
						    <hr class="border border-dark">
						    
						    <div class="returnListContainer">
						    
						    
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














window.addEventListener("DOMContentLoaded",function(){
	getDataForChart();


});


</script>

</body>	
</html>
