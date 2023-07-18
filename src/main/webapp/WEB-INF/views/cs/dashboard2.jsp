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



  <!-- jquery CDN -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- fullcalendar CDN -->
  <link href='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/main.min.css' rel='stylesheet' />
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/main.min.js'></script>
  <!-- fullcalendar 언어 CDN -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>

<style>
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
 
 .height100{height: 174vh !important;}
 a{text-decoration: none; color: #555;}
</style>

</head>
<body>

<!-- 헤더 섹션 -->
<jsp:include page="../common/csTopNav2.jsp"></jsp:include>
<!-- 헤더 섹션 -->







<div class="container-fluid">
	<div class="row mb-5">
		
		<!-- LEFT COL -->
		<div class="col-1" ></div>
		<div class="col-4" >
			
			<div class="card ">
			<div class="card-body ">
				<div class="row  border-bottom fs-5 fw-medium pb-2">
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
		<div class="col-4">
			<div class="row">
			    <div class="col">
		    		
		    		<div class="card ">
		    		<div class="card-body ">
		    			<div class="row ">
			    			<div class="col border-bottom fs-5 fw-medium pb-2">
		    					1대1 문의 평점 
			    			</div>
		    			</div>


		    			
		    			
		    			<c:forEach var="dto" items="${chatRatingList}">
		    			<div class="row py-2 border-bottom" >
			    			<div class="col ">
							    <div class="row">
								    <div class="col">
							    		${dto.name} ${dto.avg_rating}
								    </div>
							    </div>
							    <div class="row">
								   <div class="col text-warning">
								    
									<c:set var="avgRating" value="${dto.avg_rating}" /> <!-- 가져온 평균 평점 (예시) -->
									<c:set var="maxRating" value="5" /> <!-- 최대 평점 -->
																    
								    <c:set var="wholeStars" value="${avgRating - avgRating % 1}" /> <!-- 정수 부분 (예: 4.6 -> 4) -->
									<c:set var="halfStar" value="${avgRating - wholeStars}" /> <!-- 소수 부분 (예: 4.6 -> 0.6) -->
										
										<c:forEach begin="1" end="${maxRating}" varStatus="loop">
										  <c:choose>
										    <c:when test="${loop.index le wholeStars}">
										      <i class="bi bi-star-fill"></i> <!-- 평점의 정수 부분만큼 채워진 별 아이콘을 출력 -->
										    </c:when>
										    <c:when test="${loop.index eq wholeStars + 1 and halfStar gt 0}">
										      <i class="bi bi-star-half"></i> <!-- 평점의 정수 부분에 반개짜리 별 아이콘을 출력 -->
										    </c:when>
										    <c:otherwise>
										      <i class="bi bi-star"></i> <!-- 나머지 빈 별 아이콘을 출력 -->
										    </c:otherwise>
										  </c:choose>
										</c:forEach>
	
								    </div>
							    </div>
					
		    			</div>
	    			</div>
					</c:forEach>
		    			
		    		</div>
		    		</div>
		    		
			    </div>
			    
			    
			    <div class="col">
		    		
		    		<div class="card ">
		    		<div class="card-body ">
		    			<div class="row ">
			    			<div class="col border-bottom fs-5 fw-medium pb-2">
		    					실시간 문의 평점 
			    			</div>
		    			</div>


		    			
		    			
		    			<c:forEach var="dto" items="${chatRatingList}">
		    			<div class="row  py-2 border-bottom">
			    			<div class="col">
							    <div class="row">
								    <div class="col">
							    		${dto.name} ${dto.avg_rating}
								    </div>
							    </div>
							    <div class="row">
								   <div class="col text-warning">
								    
									<c:set var="avgRating" value="${dto.avg_rating}" /> <!-- 가져온 평균 평점 (예시) -->
									<c:set var="maxRating" value="5" /> <!-- 최대 평점 -->
																    
								    <c:set var="wholeStars" value="${avgRating - avgRating % 1}" /> <!-- 정수 부분 (예: 4.6 -> 4) -->
									<c:set var="halfStar" value="${avgRating - wholeStars}" /> <!-- 소수 부분 (예: 4.6 -> 0.6) -->
										
										<c:forEach begin="1" end="${maxRating}" varStatus="loop">
										  <c:choose>
										    <c:when test="${loop.index le wholeStars}">
										      <i class="bi bi-star-fill"></i> <!-- 평점의 정수 부분만큼 채워진 별 아이콘을 출력 -->
										    </c:when>
										    <c:when test="${loop.index eq wholeStars + 1 and halfStar gt 0}">
										      <i class="bi bi-star-half"></i> <!-- 평점의 정수 부분에 반개짜리 별 아이콘을 출력 -->
										    </c:when>
										    <c:otherwise>
										      <i class="bi bi-star"></i> <!-- 나머지 빈 별 아이콘을 출력 -->
										    </c:otherwise>
										  </c:choose>
										</c:forEach>
	
								    </div>
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
</div>








<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<script>



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
	
	
	getEmployeeListForCalendarColor();
	
	
  var calendarEl = document.getElementById('calendar');
  var calendar = new FullCalendar.Calendar(calendarEl, {
    // Other FullCalendar options...
    
    /* headerToolbar: {
      left: 'prev,next today',
      center: 'title',
      right: 'listWeek,dayGridMonth,timeGridWeek,timeGridDay'
    }, */
    
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