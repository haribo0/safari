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

<style type="text/css">


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



</style>


</head>
<body>

<!-- 헤더 섹션 -->
<jsp:include page="../common/csTopNav2.jsp"></jsp:include>
<!-- 헤더 섹션 -->




<div class="container-fluid">

	<div class="row mt-0">
		<div class="col-1 "></div>
		<div class="col ">
		
			<div class="row ">
				<div class="col ">
					<h5>
						1대1 문의 현황 
					</h5>
				</div>
			</div>
		
			<!-- 1ST ROW -->
			<div class="row my-2">
				
				<!-- LEFT COL -->
				<div class="col-4" >
					<div class="card ">
						<div class="card-body ">
						
							<!-- <div class="row border-bottom fs-5 fw-medium ps-2 pb-3" ">
								<div class="col ">
									
								</div>
							</div> -->
							
							<div class="row fs-2  mx-3 my-auto text-center">
								<div class="col fw-light my-auto pt-4">
									${todayStats.qna_count}
								</div>
								<div class="col fw-light my-auto pt-4">
									${todayStats.reply_count}
								</div>
								<div class="col ">
									<canvas id="donutChart1" style="width:100px"></canvas>
								</div>
							</div>
							<div class="row mb-3 mt-3  mx-3 text-center">
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
				<!-- LEFT COL -->
				
				
				<!-- RIGHT COL -->
				<div class="col-8">
					
					<div class="card ">
			    		<div class="card-body ">
			    			<div class="row mb-3">
				    			<div class="col fs-5 ms-2 fw-medium ">
			    					<!-- Today's &nbsp; 직원별 문의 현황  -->
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
				    					문의
					    			</div>
					    			<div class="col  ">
				    					답글
					    			</div>
					    			<div class="col  ">
				    					응답 시간
					    			</div>
					    			<div class="col  ">
				    					평점
					    			</div>
				    			</div>
			    			
			    			
			    			<c:forEach var="map" items="${todayList}">
			    				 <!-- 근무자만 -->
			    				<c:if test="${map.workState == '근무'}">
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
					    			<div class="col fs-6 my-auto "  >
					    				<i class="bi bi-star-fill"></i> ${map.rating.qna_rating}
					    			</div>
				    			</div>
								</c:if>
	
			    			</c:forEach>
			    			
			    			
			    		</div>
		    		</div>
					
					
				
				
				
				</div>
				<!-- RIGHT COL -->
				
			</div>
			<!-- 1ST ROW -->
		
		
		
			<!-- 2ND ROW -->
			<div class="row ">
				
				<!-- LEFT COL -->
				<div class="col-4" >
					
					
					
					
				</div>
				<!-- LEFT COL -->
				
				
				<!-- RIGHT COL -->
				<div class="col-6">
				
				
				
				
				</div>
				<!-- RIGHT COL -->
				
			</div>
			<!-- 2ND ROW -->
			
		
		
		
		
		
		
		
		
		
		
		
		</div>
		<div class="col-1 "></div>
	</div>
</div>








</body>
</html>