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
				<!-- calendar 태그 -->
				<div id='calendar-wrap'>
				  <div id='calendar'></div>
				</div>
			</div>
			
			
		</div>
		
		<div class="col"></div>
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
];


let employees = [];





function formatDate(date) {
	var formattedDate = new Date(date);
	
	var year = formattedDate.getFullYear();
	var month = String(formattedDate.getMonth() + 1).padStart(2, '0');
	var day = String(formattedDate.getDate()).padStart(2, '0');
	
	return year + '-' + month + '-' + day;
}





// let index = 0 ;

//events 콜백 함수
function fetchCalendarData(info, successCallback, failureCallback) {
  // 날짜 범위 설정
  const start = formatDate(info.start);
  const end = formatDate(info.end);

  // Ajax 요청
  const xhr = new XMLHttpRequest();

  xhr.onload = function() {
    if (xhr.status === 200) {
      const data = JSON.parse(xhr.responseText);
      const events = data.list;

      // 이벤트에 배경색 할당
      events.forEach(function(event, index) {
        event.color = pastelColors[index % pastelColors.length];
      });

      successCallback(events);
    } else {
      failureCallback(xhr.statusText);
    }
  };

  xhr.open("GET", `./getCalendarData?start=${start}&end=${end}`);
  xhr.send();
}

// FullCalendar 설정
const calendarEl = document.getElementById("calendar");
const calendar = new FullCalendar.Calendar(calendarEl, {
  // FullCalendar 옵션
  headerToolbar: {
    left: "prev,next today",
    center: "title",
    right: "dayGridMonth,timeGridWeek,timeGridDay,listWeek"
  },
  initialView: "dayGridMonth",
  
  events: fetchCalendarData,
  eventContent: function(arg) {
    var eventDot = document.createElement('div');
    eventDot.classList.add('event-dot');
    eventDot.style.backgroundColor = arg.event.color;

    return { domNodes: [eventDot] };
  }
});

calendar.render();


   

    
    
 </script>
 
 

</body>
</html>