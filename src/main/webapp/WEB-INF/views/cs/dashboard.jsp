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
	<div class="row mt-5">
		<div class="col-3"></div>
		<div class="col-1 pt-5">
			<div id='external-events'>
			  <h4>스케줄</h4>
			  <div id='external-events-list'></div>
			</div>
		</div>
		<div class="col-5">
			
			<!-- <div id='calendar'></div> -->
			
			<!-- <div id='wrap'>
				드래그 박스
				<div id='external-events'>
				  <h4>Draggable Events</h4>
				  <div id='external-events-list'></div>
				</div>
				calendar 태그
				<div id='calendar-wrap'>
				  <div id='calendar'></div>
				</div>
			</div> -->
			
			
			
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

	   document.addEventListener('DOMContentLoaded', function() {
	     // 드래그 박스 취득
	     var containerEl = document.getElementById('external-events-list');
	     // 설정하기
	     new FullCalendar.Draggable(containerEl, {
	       itemSelector: '.fc-event',
	       eventData: function(eventEl) {
	         return {
	           title: eventEl.innerText.trim()
	         };
	       }
	     });
	     // 드래그 아이템 추가하기
	     for (let i = 1; i <= 5; i++) {
	       const div = document.createElement('div');
	       div.className = 'fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event';
	       const eventDiv = document.createElement('div');
	       eventDiv.className = 'fc-event-main';
	       eventDiv.innerText = 'Event ' + i;
	       div.appendChild(eventDiv);
	       containerEl.appendChild(div);
	     }
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



   
   
   /* import { Calendar } from '@fullcalendar/core';
   import interactionPlugin, { Draggable } from '@fullcalendar/interaction'; */
   
   /* document.addEventListener('DOMContentLoaded', function() {
	   let draggableEl = document.getElementById('mydraggable');
	   let calendarEl = document.getElementById('mycalendar');

	   let calendar = new Calendar(calendarEl, {
	     plugins: [ interactionPlugin ],
	     droppable: true
	   });

	   calendar.render();

	   new Draggable(draggableEl);
	 }); */
   
   
   
   
 </script>
 
 

</body>
</html>