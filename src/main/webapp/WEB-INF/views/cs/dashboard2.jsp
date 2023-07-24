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
  /* body 스타일 */
  body {
/*     margin-top: 40px;
    font-size: 14px;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif; */
  }
  /* 드래그 박스의 스타일 */
  #external-events {
    /* position: fixed; */
/*     left: 20px;
    top: 20px;
    width: 100px;
    padding: 0 10px;
    border: 1px solid #ccc;
    background: #eee;
    text-align: left; */
  }
  #external-events h4 {
   /*  font-size: 16px;
    margin-top: 0;
    padding-top: 1em; */
  }
  #external-events .fc-event {
    margin: 3px 0;
    cursor: move;
  }
 
  #external-events p {
    margin: 1.5em 0;
    font-size: 11px;
    color: #666;
  }
 
  #external-events p input {
    margin: 0;
    vertical-align: middle;
  }
 
/*   #calendar-wrap {
    margin-left: 200px;
  } */
 
/*   #calendar {
    max-width: 1100px;
    margin: 0 auto;
  } */
  
  .fs-smaller {
  	font-size: 12px;
  }
  
  .fc-scrollgrid-sync-table tr td { 
  	overflow: hidden;
  }
  /* 
  .event-dot {
  width: 10px;
  height: 10px;
  border-radius: 50%;
}

.event-block {
  border-radius: 4px;
  padding: 5px;
  margin-bottom: 2px;
} */

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
	/* background: #FC7894; */
	border:none; 
	/* color: white;  */
/* 	color: #FC7894;  */
	/* color: #F35252;  */
	/* border-radius:16px;  */
	font-size: 17px; 
	/* font-weight:bold;  */
	/* text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1); */
	width: 70px;
}
/* .btn_warning{
	background: #FD9368;
	border:none; 
	color: white; 
	border-radius:16px; 
	font-size: 15px; 
	width: 60px;
}
.btn_okay{
	background: #FBCD3E; 
	border:none; 
	color: white; 
	border-radius:16px; 
	font-size: 15px; 
	width: 60px;
}
.btn_good{
	background: #6EDAA5; 
	border:none; 
	color: white; 
	border-radius:16px; 
	font-size: 15px; 
	width: 60px;
} */
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




/* .highlight {
    position: relative;
}

.highlight::before {
    content: "";
    position: absolute;
    bottom: -2px; 
    left: 0;
    width: 100%;
    height: 20px;
    background-color: yellow; 
    z-index: -1;
} */

 
.height100{height: 552px !important;}
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
			
			<div class="card ">
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
		<!-- LEFT COL -->
		
		
		<!-- RIGHT COL -->
		<div class="col">
		
			<div class="row mb-4">
				<div class="col">
					<div class="card ">
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
		    		<div class="card ">
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
	
	
	
	<!-- 3RD ROW -->
	<div class="row mt-4 mb-5">
		<div class="col-1"></div>
		<div class="col">
			  	<div class="row border-bottom">
				  	<div class="col-8 fs-5 ms-2 fw-medium pb-3 ">
						<div class="card shadow-sm" >
							<div class="card-body">
							
								<!-- BAR CHART -->
								<div class="row border-bottom fs-5 fw-medium ps-2 pb-3">
									<div class="col ">
					  					지난 주간 문의 처리수
									
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
						<div class="card shadow-sm" >
							<div class="card-body">
								
								<!-- DONUT CHART -->
								<div class="row border-bottom fs-5 fw-medium ps-2 pb-3">
									<div class="col ">
					  			    	지난 주간 문의 배정 비율
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
		    		<div class="card ">
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
				    					<%-- ${map.qna.qna_count} --%>
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
				    					<%-- 
				    					${map.qna.reply_count == 0 ? 0 : map.qna.qna_count / map.qna.reply_count }
									     --%>

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
					    				<%-- ${map.chat.chat_count == 0 ? 0 : map.chat.chat_ended_count / map.chat.chat_count * 100}<span class="text-secondary" style="font-size: 0.7em">%</span> --%>
				    				    <c:set var="ratio" value="${map.chat.chat_count == 0 ? 0 : map.chat.chat_ended_count / map.chat.chat_count}" />
									    <% double roundedRatio = Math.round((Double)pageContext.getAttribute("ratio") * 100.0); %>
									    <%=roundedRatio%><span class="text-secondary" style="font-size: 0.7em">%</span>
				    					<%-- ${map.chat.chat_ended_count == 0 ? 0 : map.chat.chat_count / map.chat.chat_ended_count } --%>
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
					    			
					    			
					    			<%-- <div class="col  ">
				    					${map.rating.chat_rating}
					    			</div> --%>
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
        /* labels: {
            font: {
              size: 12, // 범례 글꼴 크기 조정
              weight: 'bold',
            },
        }, */
        
     // display: false // 범례 숨김
    }
  },
  layout: {
    /* padding: {
      top: 1,
      bottom: 1,
      left: 1,
      right: 1
    } */
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
			
			// line chart 
			/* let lineLabels = [];
			let	lineData = [];
			response.revenueList.forEach(function(data){
				lineLabels.push(data.MONTH);
				lineData.push(data.REVENUE);
			});
			makeLineChart(lineData,lineLabels); */
			
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
	       /* backgroundColor: [
	    	   //'rgba(54, 162, 235, 0.5)'
	    		'#F6DFF9',
	    		'#E0D5F1',
	    		//'#D9C4E9',
	    		'#FEE6EB',
	    		'#FFD4E4'
	    		#4DC9F6
	    		
				#F7464A,
				#46BFBD,
				#FDB45C,
				#949FB1,
				#4D5360,
				#80b6f4,
				#f49080,
				#8ff49a,
				#f4e280
 
    	    ] */
	    	
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
	       /* backgroundColor: [
    	       '#54A1E5',
    	       
	       ] */
	    	
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











/* var transparentColors = [
  'rgba(255, 179, 186, 0.5)', // Pale Pink
  'rgba(255, 223, 186, 0.5)', // Peach
  'rgba(255, 255, 186, 0.5)', // Pale Yellow
  'rgba(190, 228, 255, 0.5)', // Sky Blue
  'rgba(195, 228, 186, 0.5)', // Mint Green
  'rgba(255, 216, 232, 0.5)', // Pale Lavender
  'rgba(240, 230, 140, 0.5)', // Khaki
  'rgba(255, 193, 204, 0.5)', // Pale Rose
  'rgba(209, 178, 255, 0.5)', // Lavender
  'rgba(179, 229, 252, 0.5)'  // Pale Blue
];
 */

/* 
var pastelColors = [
	'rgba(255, 217, 222, 1)',   // Pale Pink
	'rgba(255, 239, 222, 1)',   // Peach
	'rgba(255, 255, 219, 1)',   // Pale Yellow
	'rgba(223, 241, 255, 1)',   // Sky Blue
	'rgba(223, 241, 209, 1)',   // Mint Green
	'rgba(255, 234, 242, 1)',   // Pale Lavender
	'rgba(247, 235, 196, 1)',   // Khaki
	'rgba(255, 218, 224, 1)',   // Pale Rose
	'rgba(234, 208, 255, 1)',   // Lavender
	'rgba(207, 240, 246, 1)'    // Pale Blue
]; */
/* 
var pastelColors = [
	'rgba(255, 217, 222, 1)',   // Pale Pink
	'rgba(255, 239, 222, 1)',   // Peach
	'rgba(255, 255, 219, 1)',   // Pale Yellow
	'rgba(223, 241, 255, 1)',   // Sky Blue
	'rgba(223, 241, 209, 1)',   // Mint Green
	'rgba(255, 218, 224, 1)',   // Pale Rose
	'rgba(255, 234, 242, 1)',   // Pale Lavender
	'rgba(207, 240, 246, 1)'    // Pale Blue

];
 */

/*  
 // green 
 var pastelColors = [
	'#235D3A',
	'#397D54',
	'#73C088',
	'#ABEDB7',
	'#C8EAD1',
];
 */
 
/* 
 // purple violet  
 var pastelColors = [
	'#EADFF2',
	'#DCCBED',
	'#FEE6EB',
	'#FCB7D0'
]; */


 // purple violet  
var pastelColors = [
	'#F6DFF9',
	'#E0D5F1',
	//'#D9C4E9',
	'#FEE6EB',
	'#FFD4E4'
	//'#FDB8CF'
];


// blue
/* 
var pastelColors = [
	  '#C6DAFF',
	  '#B7CAFF',
	  '#E0EBFF',
	  '#D7E0FF'
	];
 */
/*  var pastelColors = [
	  '#D4E8FF',
	  '#C4DAFF',
	  '#E4F2FF',
	  '#DBE7FF'
	]; */




 

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
    // Other FullCalendar options...
    
    /* headerToolbar: {
      left: 'prev,next today',
      center: 'title',
      right: 'listWeek,dayGridMonth,timeGridWeek,timeGridDay'
    }, */
    
    headerToolbar: {
      left: 'title',
      right: 'prev,next today'
    },
    
    initialView: 'listWeek', // 초기 뷰 설정 (월간 보기)
    
    views: {
      /* timeGridWeek: {
        type: 'timeGrid',
        duration: { days: 31 } // 주간 보기 설정
      }, */
      /* timeGridWeek: {
        type: 'timeGrid',
        duration: { days: 7 } // 주간 보기 설정
      }, */
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
    
    // Event handler for when the calendar's view is changed (e.g., navigating to a different month)
    datesSet: function(info) {
      var start = info.startStr; // Start date of the visible range
      var end = info.endStr; // End date of the visible range
      
      // Refetch the events for the updated visible range
      calendar.refetchEvents();
    },

	eventContent: function(arg) {
	
		 // Customize the event rendering here
		 var eventTitle = arg.event.title;
		 var eventTime = arg.event.start;
		 var eventEndTime = arg.event.end;
		 
		 var eventBlock = document.createElement('div');
		 // eventBlock.classList.add('event-block'); // Apply custom CSS class for the event block
		 /* for (var i = 0; i < employees.length; i++) {
		  if(eventTitle===employees[i]) eventBlock.style.backgroundColor =  pastelColors[i]; // Apply custom CSS class for the event block
		} */
		 eventBlock.style.backgroundColor =  pastelColors[colorCount++ % pastelColors.length]; // Apply custom CSS class for the event block
		 eventBlock.className = eventTitle;
		 eventBlock.classList.add('row');
		
		 //eventBlock.style.margin = '.1px 0px !important'
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
		 
		  //return { domNodes: [eventBlock, eventDot] };
		  return { domNodes: [eventBlock] };
    }
  });
  
  calendar.render();
});





/* function formatDate(date) {
	var formattedDate = new Date(date);
	
	var year = formattedDate.getFullYear();
	var month = String(formattedDate.getMonth() + 1).padStart(2, '0');
	var day = String(formattedDate.getDate()).padStart(2, '0');
	
	return year + '-' + month + '-' + day;
}


document.addEventListener('DOMContentLoaded', function() {
  	var calendarEl = document.getElementById('calendar');
 	var calendar = new FullCalendar.Calendar(calendarEl, {
    // Other FullCalendar options...

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
          successCallback(events); // Pass the event array to FullCalendar
        } else {
          failureCallback(xhr.statusText); // Handle the error
        }
      };
      
      xhr.open('GET', './getCalendarData?start=' + startDateString + '&end=' + endDateString);
      xhr.send();
    },
    
    // Event handler for when the calendar's view is changed (e.g., navigating to a different month)
    datesSet: function(info) {
      var start = info.startStr; // Start date of the visible range
      var end = info.endStr; // End date of the visible range
      
      // Refetch the events for the updated visible range
      calendar.refetchEvents();
    }
  });

  calendar.render();
}); */










/* 


document.addEventListener('DOMContentLoaded', function() {
  
  // calendar element 취득
  var calendarEl = document.getElementById('calendar');
  // full-calendar 생성하기
  var calendar = new FullCalendar.Calendar(calendarEl, {
    // 해더에 표시할 툴바
    headerToolbar: {
      left: 'prev,next today',
      center: 'title',
      right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
    },
    initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
    //locale: 'ko', // 한국어 설정
    editable: true, // 수정 가능
    droppable: true, // 드래그 가능
    drop: function(arg) { // 드래그 엔 드롭 성공시
      // 드래그 박스에서 아이템을 삭제한다.
      arg.draggedEl.parentNode.removeChild(arg.draggedEl);
    }
  });
  // 캘린더 랜더링
  calendar.render();
});

    
     */
    
    
    
    
    
    
/* 
  	 document.addEventListener('DOMContentLoaded', function() {
     const calendarEl = document.getElementById('calendar');
     const calendar = new FullCalendar.Calendar(calendarEl, {
       initialView: 'dayGridMonth',
       themeSystem: 'bootstrap5',
       
       // 해더에 표시할 툴바
       headerToolbar: {
         left: 'prev,next today',
         center: 'title',
         right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
       },
       initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
       //locale: 'ko', // 한국어 설정
       editable: true, // 수정 가능
       droppable: true,  // 드래그 가능
       drop: function(arg) { // 드래그 엔 드롭 성공시
         // 드래그 박스에서 아이템을 삭제한다.
         arg.draggedEl.parentNode.removeChild(arg.draggedEl);
       }
       
       
       
       
     });
     calendar.render();
   }); 
    */
    
    
    
   /*  document.addEventListener('DOMContentLoaded', function() {
    	  var calendarEl = document.getElementById('calendar');
    	  var calendar = new FullCalendar.Calendar(calendarEl, {
    	    // FullCalendar 설정과 옵션
    	    // ...
    	    events: function(info, successCallback, failureCallback) {
    	      // fetch API를 사용하여 서버에서 이벤트 데이터를 가져옴
    	      fetch('/api/events') // 이벤트 데이터를 제공하는 API 엔드포인트
    	        .then(function(response) {
    	          return response.json(); // JSON 형식으로 응답 데이터 변환
    	        })
    	        .then(function(data) {
    	          var events = data.events; // 서버 응답으로부터 이벤트 배열 추출
    	          successCallback(events); // FullCalendar에 이벤트 배열 전달
    	        })
    	        .catch(function(error) {
    	          failureCallback(error); // 에러 처리
    	        });
    	    }
    	  });

    	  calendar.render();
    	});
 */
   
	window.addEventListener('DOMContentLoaded', function() {
		let fcViewHarness = document.querySelector('.fc-view-harness')
		fcViewHarness.classList.add('height100')
		
	})
    
   
	window.addEventListener('resize', function() {
		let fcViewHarness = document.querySelector('.fc-view-harness')
		fcViewHarness.classList.add('height100')
		
	})
    
    
 </script>
 
 

</body>
</html>