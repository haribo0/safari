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



<style>
 .gantt-chart {
  display: flex;
  align-items: center;
  height: 40px;
  border: 1px solid #ccc;
}

.gantt-bar {
  height: 100%;
  background-color: #5e97f6;
}

.gantt-label {
  margin-left: 10px;
  font-size: 14px;
}
 
  
  
 
</style>

</head>
<body>

<!-- 헤더 섹션 -->
<jsp:include page="../common/csTopNav2.jsp"></jsp:include>
<!-- 헤더 섹션 -->







<div class="container-fluid">
	<div class="row ">
		<div class="col"></div>
		
		<div class="col-7">
			
			
			<div id='wrap'>
				<div id="ganttChart"></div>
				
			</div>
			
			
		</div>
		
		<div class="col"></div>
	</div>
</div>








<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<script>




let employees = [];





function formatDate(date) {
	var formattedDate = new Date(date);
	
	var year = formattedDate.getFullYear();
	var month = String(formattedDate.getMonth() + 1).padStart(2, '0');
	var day = String(formattedDate.getDate()).padStart(2, '0');
	
	return year + '-' + month + '-' + day;
}


//Sample event data
const eventData = [
  { name: "Event 1", start: 1632566400, end: 1632591600 },
  { name: "Event 2", start: 1632595200, end: 1632602400 },
  { name: "Event 3", start: 1632613200, end: 1632638400 }
];

// Function to create a Gantt chart element
function createGanttChart(event) {
  const container = document.getElementById("ganttChart");

  const ganttChart = document.createElement("div");
  ganttChart.classList.add("gantt-chart");

  const startTime = new Date(event.start * 1000);
  const endTime = new Date(event.end * 1000);
  const duration = (endTime - startTime) / 1000;

  const ganttBar = document.createElement("div");
  ganttBar.classList.add("gantt-bar");
  ganttBar.style.width = (duration / 60) + "px";

  const ganttLabel = document.createElement("div");
  ganttLabel.classList.add("gantt-label");
  ganttLabel.textContent = event.name;

  ganttChart.appendChild(ganttBar);
  ganttChart.appendChild(ganttLabel);

  container.appendChild(ganttChart);
}

// Loop through the event data and create Gantt chart elements
eventData.forEach(event => {
  createGanttChart(event);
});

   

    
    
 </script>
 
 

</body>
</html>