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
		<div class="col-3"></div>
		
		<div class="col-6">
			
			
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

    
    document.addEventListener('DOMContentLoaded', function() {
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

   
    /* document.addEventListener('DOMContentLoaded', function() {
    	  var calendarEl = document.getElementById('calendar');
    	  var calendar = new FullCalendar.Calendar(calendarEl, {
    	    // FullCalendar 설정과 옵션
    	    // ...
    	    events: function(info, successCallback, failureCallback) {
    	      var xhr = new XMLHttpRequest();
    	      xhr.open('GET', '/api/events', true);
    	      xhr.onload = function() {
    	        if (xhr.status >= 200 && xhr.status < 400) {
    	          var data = JSON.parse(xhr.responseText);
    	          var events = data.events;
    	          successCallback(events); // FullCalendar에 이벤트 배열 전달
    	        } else {
    	          failureCallback(xhr.statusText); // 에러 처리
    	        }
    	      };
    	      xhr.onerror = function() {
    	        failureCallback(xhr.statusText); // 에러 처리
    	      };
    	      xhr.send();
    	    }
    	  });

    	  calendar.render();
    	}); */

    
    
 </script>
 
 

</body>
</html>