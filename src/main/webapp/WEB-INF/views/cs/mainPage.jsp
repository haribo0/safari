<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 메타 섹션 -->
<jsp:include page="../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->

	
	<!-- Chart.js -->
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels"></script>

	
	<!-- jquery CDN -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- fullcalendar CDN -->
	<link href='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/main.min.css' rel='stylesheet' />
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/main.min.js'></script>
	<!-- fullcalendar 언어 CDN -->
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>


<style>
.chart-legend ul li span {
  font-size: 20px; /* 원하는 크기로 조절 */
}
 
  .fs-smaller {
  	font-size: 12px;
  }
  
  .fc-scrollgrid-sync-table tr td { 
  	overflow: hidden;
  }

.btn_search{
	padding:9px 18px; 
	background: #e6edfe; 
	border:none; 
	color: #789efd; 
	border-radius:8px; 
	font-size: 14px; 
	width: 74px;
}


.gray_dot{
	display:inline-block;
	width: 15px;
	height:15px;
	border-radius: 50%;
	background: #e5e5e5;
	position:relative;
	top:1px;
}

.green_dot{
	display:inline-block;
	width: 15px;
	height:15px;
	position:relative;
	top:1px;
	border-radius: 50%;
	background: #6EDAA5;
}

.border-left {
	border-left: solid 1px;
}

.btn_blue{
	padding: 1px 4px; 
	border:none; 
	width: 70px;
}
.btn_warning{
	border:none; 
	color: #FD9368; 
}
.btn_okay{
	/* padding:2px 12px;  */
	background: #FBCD3E; 
	border:none; 
	color: white; 
	border-radius:16px; 
	font-size: 15px; 
	width: 60px;
}
.btn_good{
	border:none; 
	color: #38C6FF; 
}

.txt_green{
	color: #6EDAA5;
}

.highlight-background {
    position: absolute;
    top: 30px;
    left: 17px;
    width: 6%;
    height: 3%;
    background-color: orange; /* 하이라이트 배경 색상 설정 */
    opacity: 0.25; /* 하이라이트 배경 투명도 설정 */
}

.highlight-text {
    position: relative;
    z-index: 1; /* 텍스트를 배경 위로 올림 */
}




 
.height100{height: 576px !important;}


 a{text-decoration: none; color: #555;}
</style>


</head>
<body>

<!-- 헤더 섹션 -->
<jsp:include page="../common/csTopNav2.jsp"></jsp:include>
<!-- 헤더 섹션 -->

<div class="container-fluid">

	<!-- 1ST ROW -->
	<div class="row">
		
		<!-- LEFT COL -->
		<div class="col-1" ></div>
		<div class="col-4" >
			<div class="row mb-4">
			  	<div class="col ">
			  		<div class="card shadow-sm">
						<div class="card-body ">
							<div class="row border-bottom fs-5 fw-medium ps-1 pb-3">
								<div class="col ">
									내 평점 
								</div>
							</div>
							<div class="row my-3 py-3 ms-1 fw-medium text-center border-bottom border-black border-2">
								<div class="col-2 my-auto ">
									
								</div>
								<div class="col  my-auto">
									1대1 문의
								</div>
								<div class="col  my-auto">
									실시간 문의 
								</div>
								<div class="col  my-auto">
									총 평점 
								</div>
							</div>
							<div class="row mt-3 ms-1 text-center">
								<div class="col-2 my-auto fw-bold">
									이시욱 
									
								</div>
								<div class="col  my-auto me-1" style="font-size: 18px;">
									<i class="bi bi-star-fill" style="color: #FFBC66;"></i> 5.0
									
								</div>
								<div class="col  my-auto me-1" style="font-size: 18px;">
									<i class="bi bi-star-fill" style="color: #FFBC66;"></i> 4.8
									
								</div>
								<div class="col  my-auto me-1" style="font-size: 18px;">
									<i class="bi bi-star-fill" style="color: #FFBC66;"></i> 4.9
									
								</div>
							</div>
						</div>
						</div>
			  	</div>
		  	</div>
		
			<div class="row ">
			  	<div class="col ">
					<div class="card shadow-sm">
						<div class="card-body ">
							<div class="row border-bottom fs-5 fw-medium ps-1 pb-3">
								<div class="col ">
									주간 스케줄
								</div>
							</div>
							<div class="row mt-3">
								<div class="col ">
									<div id='wrap'  >
										<!-- calendar 태그 -->
										<div id='calendar-wrap'>
										  <div id='calendar'></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			
			
		</div>
		<!-- LEFT COL -->
		
		
		<!-- RIGHT COL -->
		<div class="col">
		
			<div class="row mb-4">
				<div class="col">
					<div class="card shadow-sm">
						<div class="card-body ">
							<div class="row border-bottom fs-5 fw-medium ps-2 pb-3">
								<div class="col ">
									Today's &nbsp; 전체 문의
								</div>
							</div>
							<div class="row text-center mb-3">
								<div class="col ">
									<div class="row mt-3">
										<div class="col text-center border-bottom border-black fw-medium py-3 mx-3 border-2">
											1대1 문의
										</div>
									</div>
									<div class="row mt-3 fs-2  mx-4 my-auto">
										<div class="col  fw-light my-auto pt-4">
											${todayStats.qna_count}
										</div>
										<div class="col  fw-light my-auto pt-4">
											${todayStats.reply_count}
										</div>
										<div class="col fw-light">
											<%-- <c:set var="percent" value="${todayStats.qna_count == 0 ? 0.0 : Math.round((todayStats.reply_count / todayStats.qna_count * 100) * 10.0) / 10.0}" />
											${percent}% --%>
											<div>
											  <canvas id="donutChart1" style="width:100px"></canvas>
											</div>
																						
										</div>
										
									</div>
									<div class="row mt-3  mx-4">
										<div class="col ">
											문의
										</div>
										<div class="col ">
											응답
										</div>
										<div class="col ">
											응답률
										</div>
									</div>
								</div>
								<div class="col ">
									<div class="row mt-3 ">
										<div class="col text-center border-bottom border-black fw-medium py-3 mx-3 border-2">
											실시간 문의 
										</div>
									</div>
									<div class="row mt-3 fs-2 mx-4">
										<div class="col  fw-light  my-auto pt-4">
											${todayStats.chat_count}
										</div>
										<div class="col fw-light  my-auto pt-4">
											${todayStats.ended_chat_count}
										</div>
										<div class="col fw-light">
											<%-- <c:set var="percent" value="${todayStats.qna_count == 0 ? 0.0 : Math.round((todayStats.reply_count / todayStats.qna_count * 100) * 10.0) / 10.0}" />
											${percent}% --%>
											<div>
											  <canvas id="donutChart2" style="width:100px"></canvas>
											</div>
																						
										</div>
								<%-- 		<div class="col fw-light">
											<c:set var="percentage" value="${todayStats.ended_chat_count == 0 ? 0.0 : Math.round((todayStats.ended_chat_count / todayStats.chat_count * 100) * 10.0) / 10.0}" />
											${percentage}%
									    </div> --%>
																				
										<%-- <div class="col fw-light">
											${todayStats.ended_chat_count/todayStats.chat_count*100}%
										</div> --%>
									</div>
									<div class="row mt-3  mx-4">
										<div class="col ">
											문의
										</div>
										<div class="col ">
											응답
										</div>
										<div class="col ">
											응답률
										</div>
									</div>
								</div>




							</div>
						</div>
					</div>
				</div>
			</div>
		
		
		
			<div class="row mb-4">
			    <div class="col">
		    		<div class="card shadow-sm">
			    		<div class="card-body ">
			    			<div class="row mb-3">
				    			<div class="col fs-5 ms-2 fw-medium ">
			    					Today's &nbsp; 직원별 문의 현황 
				    			</div>
			    			</div>
			    			
			    			<div class="row py-3 fw-medium text-center border-bottom border-black border-2 mx-1">
					    			<div class="col   ">
				    					직원
					    			</div>
					    			<div class="col  ">
				    					근무
					    			</div>
					    			<div class="col  ">
				    					1대1문의
					    			</div>
					    			<div class="col  ">
				    					1대1 답글
					    			</div>
					    			<div class="col  ">
				    					응답 시간 
					    			</div>
					    			<div class="col  ">
				    					실시간 문의
					    			</div>
					    			<div class="col  ">
				    					실시간 응답
					    			</div>
					    			<div class="col  ">
				    					응답 시간
					    			</div>
				    			</div>
			    			
			    			
			    			<c:forEach var="map" items="${todayList}">
			    			
			    				
				    			<div class="row border-top py-3 text-center mx-1">
					    			<div class="col fw-semibold  my-auto">
				    					${map.emp.name}
					    			</div>
					    			
					    			<div class="col my-auto ">
					    				<c:if test="${map.workState == '근무'}">
					    					<span class="green_dot my-auto"></span>
					    				</c:if>
					    				<c:if test="${map.workState != '근무'}">
					    					<span class="gray_dot my-auto"></span>
					    				</c:if>
					    				${map.workState}
				    					<%-- ${map.workState} --%>
					    			</div>
					    			<div class="col  fs-5">
				    					${map.qna.qna_count}
					    			</div>
					    			<div class="col  fs-5">
				    					${map.qna.reply_count}
					    			</div>
					    			<div class="col fs-6 my-auto "  >
<!-- 				    					<div class=" my-auto fw-medium mx-3"   style="background: rgba(110, 218, 165, 0.3);"> -->
				    					<div class=" my-auto fw-medium mx-3"   style="background: rgba(251, 205, 62, 0.25);">
				    					${map.qnaAvgTime} 분 
				    					</div>
					    			</div>
					    			<div class="col fs-5 ">
				    					${map.chat.chat_count}
					    			</div>
					    			<div class="col  fs-5">
				    					${map.chat.chat_ended_count}
					    			</div>
					    			<div class="col mx-auto fs-5 my-auto">
					    				<div class="btn_blue mx-auto my-auto fw-medium py-0" style="background: rgba(251, 205, 62, 0.25);" >
				    					${map.chatAvgTime} 분 
				    					</div>
					    			</div>
				    			</div>
	
	
			    			</c:forEach>
			    			
			    			
			    		</div>
		    		</div>
		    		
			    </div>
			    
			    
		    </div>
		    
		    
			
			
			
		</div>
		<div class="col-1" ></div>
		<!-- RIGHT COL -->
		
	</div>
	
	<!-- 
	<div class="row mt-4 mb-5">
		<div class="col-1"></div>
		<div class="col-4">
			  
			    
			
		</div>
		<div class="col">
			  	<div class="row ">
				  	
			  	</div>
			    
			
		</div>
		<div class="col-1"></div>
	
	</div> -->
	
	<%-- 
	<!-- 3RD ROW -->
	<div class="row mt-4 mb-5">
		<div class="col-1"></div>
		<div class="col">
			  	<div class="row ">
				  	<div class="col-8 fs-5 ms-2 fw-medium pb-3">
						<div class="card shadow-sm" style="height: 600px;" >
							<div class="card-body">
							
								<!-- BAR CHART -->
								<div class="row border-bottom fs-5 fw-medium ps-2 pb-3">
									<div class="col ">
					  					Last Week's &nbsp; 문의 처리수
									
									</div>
								</div>
								
								<div class="row ">
									<div class="col ">
										<canvas id="barChart" ></canvas>
					  				  
									
									</div>
								</div>
								<!-- BAR CHART -->
								
				  			</div>
					  	</div>
					</div>
				  	<div class="col fs-5 ms-2 fw-medium pb-3 ">
						<div class="card shadow-sm" style="height: 600px;" >
							<div class="card-body">
								
								<!-- DONUT CHART -->
								<div class="row border-bottom fs-5 fw-medium ps-2 pb-3">
									<div class="col ">
					  			    	Last Week's &nbsp; 문의 배정 비율
									</div>
								</div>
								
								<div class="row ">
									<div class="col py-4 ">
					  			    	<canvas id="donutChart3" ></canvas>
									</div>
								</div>
								<!-- DONUT CHART -->
								
				  			</div>
						  </div>
						</div>
			  	</div>
			    
			
		</div>
		<div class="col-1"></div>
	
	</div>
	<!-- 3RD ROW -->
	
	
	
	
	
	<!-- 2ND ROW -->
	<div class="row mb-5">
	
	<div class="col-1"></div>
	<div class="col">
	
	
		<div class="row">
			    <div class="col">
		    		<div class="card shadow-sm">
			    		<div class="card-body ">
			    			<div class="row mb-3 border-bottom">
				    			<div class="col fs-5 ms-2 fw-medium pb-3 ">
			    					<!-- <span class="highlight-background"></span>
    								<span class="highlight-text">지난 주간</span> -->
			    					<span class="highlight"> Last Week's &nbsp; 직원 근무 현황 </span> 
				    			</div>
			    			</div>
			    			
 			    			<div class="row py-3 fw-medium text-center border-bottom border-2 border-black mx-2"> 
			    			<!-- <div class="row py-3 fw-medium text-center bg-secondary-subtle mx-2"> -->
					    			<div class="col   ">
				    					직원
					    			</div>
					    			<div class="col  ">
				    					근무시간
					    			</div>
					    			<div class="col  ">
				    					1대1문의
					    			</div>
					    			<div class="col  ">
				    					문의 응답
					    			</div>
					    			<div class="col  ">
				    					응답률
					    			</div>
					    			<div class="col  ">
				    					평점
					    			</div>
					    			<div class="col  ">
				    					실시간 문의
					    			</div>
					    			<div class="col  ">
				    					실시간 응답
					    			</div>
					    			<div class="col  ">
				    					응답률
					    			</div>
					    			<div class="col  ">
				    					평점
					    			</div>
				    			</div>
			    			
			    			
			    			<c:forEach var="map" items="${weeklyList}">
			    			
			    			
				    			<div class="row border-top py-3 text-center mx-2">
					    			<div class="col my-auto  fw-semibold ">
				    					${map.emp.name}
					    			</div>
					    			<div class="col  ">
				    					${map.weeklyHours}
					    			</div>
					    			<div class="col   border-left">
					    				<div class="row border-left">
						    				<div class="col">
					    						${map.qna.qna_count}
						    				</div>
					    				</div>
				    					${map.qna.qna_count}
					    			</div>
					    			<div class="col  ">
				    					${map.qna.reply_count}
					    			</div>
					    			<div class="col  ">
					    				<c:if test="${map.qna.reply_count == 0}">
					    					0
					    				</c:if>
					    				<c:if test="${map.qna.reply_count > 0}">
					    					${map.qna.reply_count / map.qna.qna_count * 100 > 100 ? 100 : map.qna.reply_count / map.qna.qna_count * 100}<span class="text-secondary" style="font-size: 0.7em">%</span>
					    				</c:if>
				    					
				    					${map.qna.reply_count == 0 ? 0 : map.qna.qna_count / map.qna.reply_count }
									    

					    			</div>
					    			
					    			<div class="col mx-auto fw-medium my-auto ">
						    			<c:if test="${map.rating.qna_rating >= 4.8 }">
						    				<div class="btn_good mx-auto">
					    						${map.rating.qna_rating}
						    				</div>
						    			</c:if>
						    			<c:if test="${map.rating.qna_rating < 4.8 && map.rating.qna_rating >= 4}">
						    				<div class=" mx-auto">
					    						${map.rating.qna_rating}
						    				</div>
						    			</c:if>
						    			<c:if test="${map.rating.qna_rating < 4}">
						    				<div class="btn_warning mx-auto">
					    						${map.rating.qna_rating}
						    				</div>
						    			</c:if>
				    				</div>
					    			
					    			<div class="col  border-left p-0">
				    					${map.chat.chat_count}
					    			</div>
					    			<div class="col  ">
				    					${map.chat.chat_ended_count}
					    			</div>
					    			<div class="col  ">
					    				${map.chat.chat_count == 0 ? 0 : map.chat.chat_ended_count / map.chat.chat_count * 100}<span class="text-secondary" style="font-size: 0.7em">%</span>
				    				    <c:set var="ratio" value="${map.chat.chat_count == 0 ? 0 : map.chat.chat_ended_count / map.chat.chat_count}" />
									    <% double roundedRatio = Math.round((Double)pageContext.getAttribute("ratio") * 100.0); %>
									    <%=roundedRatio%><span class="text-secondary" style="font-size: 0.7em">%</span>
				    					${map.chat.chat_ended_count == 0 ? 0 : map.chat.chat_count / map.chat.chat_ended_count }
					    			</div>
					    			
				    				<div class="col mx-auto fw-medium my-auto ">
						    			<c:if test="${map.rating.chat_rating >= 4.8 }">
						    				<div class="btn_good mx-auto">
					    						${map.rating.chat_rating}
						    				</div>
						    			</c:if>
						    			<c:if test="${map.rating.chat_rating < 4.8 && map.rating.chat_rating >= 4}">
						    				<div class=" mx-auto">
					    						${map.rating.chat_rating}
						    				</div>
						    			</c:if>
						    			<c:if test="${map.rating.chat_rating < 4}">
						    				<div class="btn_warning mx-auto">
					    						${map.rating.chat_rating}
						    				</div>
						    			</c:if>
				    				</div>
					    			
					    			
					    			<div class="col  ">
				    					${map.rating.chat_rating}
					    			</div>
				    			</div>
	
	
			    			</c:forEach>
			    			
			    			
			    		</div>
		    		</div>
		    		
			    </div>
			    
			    
		    </div>
	
	
	</div>
	<div class="col-1"></div>
	
	</div>
	<!-- 2ND ROW -->
	 --%>
	
	
	<div class="row my-5">
		<div class="col">
	
		</div>
	</div>
	
</div>


<div class="card shadow-sm d-none" >
  <div class="card-body">
  	<div class="fs-5 ms-2 fw-medium pb-3">주문</div>
    <hr class="border">
    <canvas id="barChart"></canvas>
  </div>
</div>


	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<script>


let percentValue1 = ${todayStats.qna_count == 0 ? 0 : Math.round((todayStats.reply_count / todayStats.qna_count * 100) * 10) / 10};
let percentValue2 = ${todayStats.chat_count == 0 ? 0 : Math.round((todayStats.ended_chat_count / todayStats.chat_count * 100) * 10) / 10};

//데이터 설정
var data1 = {
  labels: [percentValue1+"%"], 
  datasets: [
    {
      data: [percentValue1, 100 - percentValue1],
      backgroundColor: ["#A5CDFA", "#EAEAEA"],
      hoverBackgroundColor: ["#E0D4F1", "#EAEAEA"],
    },
  ],
};

//데이터 설정
var data2 = {
  labels: [percentValue2+"%"], 
  datasets: [
    {
      data: [percentValue2, 100 - percentValue2],
      backgroundColor: ["#A5CDFA", "#EAEAEA"],
      hoverBackgroundColor: ["#E0D4F1", "#EAEAEA"],
    },
  ],
};

// 옵션 설정
var options1 = {
  maintainAspectRatio: false,
  responsive: true,
  plugins: {
    legend: {
    	
    	display: true,
        position: 'top', // 범례를 차트 영역 내에 표시
        align: 'center', // 가운데 정렬
    }
  },
  layout: {
  },
  datalabels: {
	  anchor: 'center',
      align: 'center',
      offset: -10, 
      formatter: function(value, context) {
    	  return context.chart.data.labels[0] + ' ' + value + '%';
      },
      color: '#000000',
      font: {
        size: 10,
        weight: 'bold'
      }
    }
};


// 도넛 그래프 생성
var donutChart1 = new Chart(document.getElementById("donutChart1"), {
  type: "doughnut",
  data: data1,
  options: options1,
});


// 도넛 그래프 생성
var donutChart2 = new Chart(document.getElementById("donutChart2"), {
  type: "doughnut",
  data: data2,
  options: options1,
});







function getDataForChart() {

	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			// bar chart 
			let barLabels = [];
			let	barData = [];
			response.list1.forEach(function(data){
				barLabels.push(data.name);
				barData.push(data.total_count);
			});
			makeBarChart(barData,barLabels);
			
			// donut chart 
			let donutLabels = [];
			let	donutData = [];
			response.list1.forEach(function(data){
				donutLabels.push(data.name);
				donutData.push(data.total_count);
			});
			makeDonutChart(donutData,donutLabels);
			
		}
	}

	// get 방식 
	xhr.open("get", "./getWeeklyChartData");
	xhr.send();

}


function makeBarChart(d, l) {
	const canvas = document.getElementById('barChart');
	
	new Chart(canvas, {
	   type: 'bar',
	   data: {
	     labels: l,
	     datasets: [{
	       label: '직원별 문의 처리수',
	       data: d,
	       borderWidth: 1,
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



function makeDonutChart(d,l) {
	
	const canvas = document.getElementById('donutChart3');

	new Chart(canvas, {
	  type: 'doughnut',
	  data: {
	     labels: l,
	     datasets: [{
	       label: '직원별 문의 배정',
	       data: d,
	       borderWidth: 1,
	       backgroundColor: [
			  /* '#FF6384', */
			  
			  '#36A2EB', '#FFA25C', '#FFCE56',  '#4BC0C0', '#9966FF','#969AB1','#73D873',
			  '#FF7D99',  '#F8C947', '#70C05A', '#3E66A8', '#8174B6',
			  '#E44F51', '#2D3C4D', '#FFAA2B', '#55CC55', '#5477A8', '#AE81FF',
			  '#ED5565', '#3BAFDA', '#FFCE55', '#4A89DC', '#967ADC', '#EC87C0',
			  '#FC6E51', '#656D78', '#FF6B6B', '#6CBF84', '#4FC1E9', '#AC92EC',
			]

	    	
	     }]
	   },
	  options: {
	    responsive: true,
	    plugins: {
	      legend: {
	        position: 'top',
	      },
	      title: {
	        display: false,
	        text: 'Chart.js Doughnut Chart'
	      }
	    }
	  },
	});
	
}








 // purple violet  
var pastelColors = [
	'#F6DFF9',
	'#E0D5F1',
	//'#D9C4E9',
	'#FEE6EB',
	'#FFD4E4'
	//'#FDB8CF'
];



let employees = [];

function getEmployeeListForCalendarColor() {

	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			nameBlocks = {};
			index = 0;
			response.list.forEach(function(map){
				console.log(map.empDto.name);
				// blocks = document.querySelectorAll(`.\${map.empDto.name}`);
				blocks = document.getElementsByClassName(map.empDto.name);
				
				
				for(let i=0;i<blocks.length;i++){
					// console.log(blocks[i]);
					blocks[i].style.backgroundColor = pastelColors[index++];
				}
				
				/* nameBlocks[map.empDto.name] = blocks */
				/* blocks.forEach(function(block){
					block.backgroundColor = pastelColors[index++];
				}); */
			});
			response.list.forEach(function(map){
				employees.push(map.empDto.name);
			});
			
			
		}
	}

	// get 방식 
	xhr.open("get", "./getEmployeeList");
	xhr.send();

}







function formatDate(date) {
	var formattedDate = new Date(date);
	
	var year = formattedDate.getFullYear();
	var month = String(formattedDate.getMonth() + 1).padStart(2, '0');
	var day = String(formattedDate.getDate()).padStart(2, '0');
	
	return year + '-' + month + '-' + day;
}


let colorCount = 0;



document.addEventListener('DOMContentLoaded', function() {
	
	// 초반에 실행시킬 함수 
	getDataForChart();
	getEmployeeListForCalendarColor();
	
	
  var calendarEl = document.getElementById('calendar');
  var calendar = new FullCalendar.Calendar(calendarEl, {
    
    headerToolbar: {
      left: 'title',
      right: 'prev,next today'
    },
    
    initialView: 'listWeek', // 초기 뷰 설정 (월간 보기)
    
    views: {
      timeGridDay: {
        type: 'timeGrid',
        duration: { days: 1 } // 일간 보기 설정
      }
    },
    
    events: function(info, successCallback, failureCallback) {
      var start = info.startStr; // Start date of the visible range
      var end = info.endStr; // End date of the visible range
      var startDateString = formatDate(start);
      var endDateString = formatDate(end);
      
      var xhr = new XMLHttpRequest();
      
      xhr.onload = function() {
        if (xhr.status === 200) {
          var data = JSON.parse(xhr.responseText);
          var events = data.list;
          
          // Assign color to each event based on person
          events.forEach(function(event, index) {
            event.color = pastelColors[index % pastelColors.length];
          });
          
          successCallback(events); // Pass the event array to FullCalendar
        } else {
          failureCallback(xhr.statusText); // Handle the error
        }
      };
      
      xhr.open('GET', './getCalendarData?start=' + startDateString + '&end=' + endDateString);
      xhr.send();
    },
    
    datesSet: function(info) {
      var start = info.startStr; // Start date of the visible range
      var end = info.endStr; // End date of the visible range
      
      calendar.refetchEvents();
    },

	eventContent: function(arg) {
	
		 // Customize the event rendering here
		 var eventTitle = arg.event.title;
		 var eventTime = arg.event.start;
		 var eventEndTime = arg.event.end;
		 
		 var eventBlock = document.createElement('div');
		 eventBlock.style.backgroundColor =  pastelColors[colorCount++ % pastelColors.length]; // Apply custom CSS class for the event block
		 eventBlock.className = eventTitle;
		 eventBlock.classList.add('row');
		
		 eventBlock.style.color =  "#333"; // Apply custom CSS class for the event block
		 
		 var eventTitleElement = document.createElement('div');
		 eventTitleElement.classList.add('event-title','col-4','fs-smaller');
		 eventTitleElement.innerText = eventTitle;
		 
		 var eventTimeElement = document.createElement('div');
		 eventTimeElement.classList.add('event-time','col-4','fs-smaller');
		 eventTimeElement.innerText = eventTime.toLocaleTimeString([], { hour: '2-digit'});
		 eventTimeElement.innerText += " - " + eventEndTime.toLocaleTimeString([], { hour: '2-digit'});

		  var eventDot = document.createElement('div');
		  eventDot.classList.add('event-dot'); // Apply custom CSS class for the event dot
		  eventDot.style.backgroundColor = eventBlock.style.backgroundColor; // Set the dot color to match the event block's background color


		 eventBlock.appendChild(eventTitleElement);
		 eventBlock.appendChild(eventTimeElement);
		 
		 eventBlock.style.backgroundColor = arg.event.color; // Set the background color based on the assigned color
		 
		  return { domNodes: [eventBlock] };
    }
  });
  
  calendar.render();
});



    
 </script>
 


</body>
</html>