<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사파리 | 로그인</title>
	<!-- 메타 섹션 -->
	<jsp:include page="../../common/meta.jsp"></jsp:include>
	<!-- 메타 섹션 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<script>
//현재 접속한 유저 pk
let mySessionId = null;
	
//경로에서 변수 부분 추출 (pathv~로 설정한 주소 받아오기)
const path = window.location.pathname;
const parts = path.split('/');
//해주세요 pk
const question_id = parts[parts.length - 1]; 



function ajaxTemplete() { //갖다붙이고 시작하기
	
	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			// js 작업..
		}
	}	

	//get
	xhr.open("get", "요청 url?파라미터=값");
	xhr.send();
	
	//post
	xhr.open("post", "요청 url");
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.send("파라미터=값");
}

function getSessionId() {
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			// js 작업..
			if(response.result == "success"){
				mySessionId = response.id;
				
			}
		}
	}	

	//get
	xhr.open("get", "/safari/user/getMyId"); //딱 여기만 쓰세요, false 동기식 호출(권장x) //여기 틀림
	xhr.send();
}

function refreshTotalQuestionLikeCount() { 
	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			const totalQuestionLikeCountBox = document.getElementById("totalQuestionLikeCount");
			totalQuestionLikeCount.innerText = response.count;
		}
	}	

	xhr.open("get", "/safari/question/getTotalQuestionLikeCount?question_id=" +question_id);
	xhr.send();
}

function toggleQuestionLike(){
	if(!mySessionId){
		location.href = "/safari/user/loginPage";
		return;
	}
	
	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			refreshTotalQuestionLikeCount();
			refreshQuestionHeart();
		}
	}	
	
	//get
	xhr.open("get", "/safari/question/toggleQuestionLike?question_id=" + question_id);
	xhr.send();
}

function refreshQuestionHeart() { 
	
	if(mySessionId == null) return;
	
	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			const heartQuestionBox = document.getElementById("heartQuestionBox");
			
			if(response.isQuestionLiked){
				heartQuestionBox.classList.remove("bi-heart");
				heartQuestionBox.classList.add("bi-heart-fill");
			}else{
				heartQuestionBox.classList.remove("bi-heart-fill");
				heartQuestionBox.classList.add("bi-heart");
			}
		}
	}	

	//get
	xhr.open("get", "/safari/question/isQuestionLiked?question_id="+question_id);
	xhr.send();
	
	
}

window.addEventListener("DOMContentLoaded", function(){
	//사실상 시작 시점
	getSessionId();
	refreshTotalQuestionLikeCount();
	refreshQuestionHeart();
	
});




</script>


</head>
<body>
	

	<!-- 헤더 섹션 -->
	<jsp:include page="../../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->
	
	
	
	
	<div class="row mt-5 mb-3">	
	
	
	<%-- 왼쪽 --%>
	<div class="col-2"></div>
	<%-- 왼쪽 --%>	
	
	
	
		<%-- 가운데 --%>
		<%-- 내용 공간 --%>
		<div class="col-8">
			<div class="container">
				<div class="row" style="margin-bottom: 7px;">
				<div class="col">
					<span class="fw-medium fs-5">${map.questionDto.title}</span>
					<c:if test="${map.questionDto.points>=1}">
					<span class="badge rounded-pill text-bg-warning opacity-75" style="font-size: 80%; position: relative; bottom: 2px;">
					<span class="text-black">${map.questionDto.points}p</span></span>
					</c:if>
					<c:if test="${map.questionDto.points==0}"></c:if>
				</div>	
			</div>
		
			
			<div class="row">
				<div class="col ms-1">
				<span style="font-size: 0.9rem; color: gray;" > ${map.userDto.nickname}  &nbsp;  <i class="bi bi-eye"></i> ${map.questionDto.views} &nbsp;
				 ${map.questionDto.status}
				 </span>
				 </div>
				 <div class="col">
				 </div>
				 <div class="col text-end">
				 	<span style="font-size: 0.9rem; color: gray;"><i class="bi bi-clock"></i> <fmt:formatDate value="${map.questionDto.reg_date}" pattern="yyyy-MM-dd HH:mm"/></span>
				</div>
			</div>
			
			<hr>
			
			<%--게시물 공간 --%>
			
				<div class="row">
					<div class="col">
					
					<%-- 글 내용/이미지 영역 --%>
					<div class="row mb-5">
						<div class="col">
							${map.questionDto.content }
						</div>
					</div>
					
					<c:forEach items="${map.questionImgDtoList}" var="questionImgDto">
							<div class="row mt-2">
								<div class="col">
									<img src="/uploadFiles/${questionImgDto.question_img_link}"
										style="width: 500px;">
								</div>
							</div>						
					</c:forEach>
					<%-- 글 내용/이미지 영역 --%>
					
					</div>
				</div>
			
			<%--게시물 공간 --%>
			
			<%--좋아요/수정/삭제/목록 --%>
			<div class="row mt-4 text-end">
			<div class="col d-flex align-items-center">
			
			
			<%--ajax 좋아요--%>
			<i id="heartQuestionBox" onclick="toggleQuestionLike()"
				class="fs-5 text-danger bi bi-heart"></i>&nbsp; <span
				id="totalQuestionLikeCount"></span>
			<%--ajax 좋아요--%>
			 
			 
			&nbsp;<c:if test="${sessionUser.id == map.userDto.id }">
						<input type="button" class="btn btn-secondary" style="background-color: transparent; border: none; color: inherit; font-size: 14px" onclick='location.href="/safari/community/question/updateQuestionContentPage/${map.questionDto.id}"' value="수정"/>
						<input type="button" class="btn btn-secondary" style="background-color: transparent; border: none; color: inherit; font-size: 14px" onclick='location.href="/safari/community/question/deleteQuestionContentProcess/${map.questionDto.id}"' value="삭제"/>
				  </c:if>
						<input type="button" class="btn btn-secondary" style="background-color: transparent; border: none; color: inherit; font-size: 14px" onclick='location.href="/safari/community/question/mainPage"' value="목록으로"/>
				  <c:if test="${sessionUser.id != map.userDto.id}">
						<input type="button" class="btn btn-secondary" style="background-color: transparent; border: none; color: inherit; font-size: 14px" onclick='location.href="/safari/community/question/replyQuestionContentPage/${map.questionDto.id}"' value="답변하기"/>
				  </c:if>
			</div>
			</div>
			<%--수정/삭제/목록 --%>
			
			<hr>
			
			<%-- 답변 글자 --%>		
			<div class="row">
				<div class="col fw-bold">
				<i class="bi bi-chat-dots"></i>&nbsp;<span style="font-size: 13px;">답변</span>
				</div>
			</div>
			<%-- 답변 글자 --%>	
				
			
			
			
			<%-- 답변 반복문 --%>
			<div class="row mt-2">
				<div class="col" style="margin-left: 10px; margin-right: 20px;">
					<c:forEach items="${questionReplyBoardList}" var="questionReply">
				
			<%-- 답변 공간 --%>
				<div class="row mb-5">
					<div class="col border border-1 rounded-3">
					
				<%--답변 내용--%>
					<div class="row mt-2">
						<div class="col fw-bold">
							<span style="font-size: 13px;">${questionReply.userDto.nickname}</span>
							<span class="text-secondary ms-2" style="font-size: 13px; font-weight: normal;">
							 <fmt:formatDate value="${questionReply.questionReplyDto.reg_date}" pattern="yyyy.MM.dd a hh:mm"/> 
					 		 </span>
					 
						 <c:if test="${sessionUser.id == questionReply.userDto.id }">
						  <span class="text-secondary ms-2" style="font-size: 13px;">
						  	<input type="button" class="btn btn-sm btn-primary" value="수정"  style="background-color: transparent; border: none; color: inherit;">
	                        <input type="button" class="btn btn-sm btn-primary" value="삭제" onclick='location.href="/safari/community/question/deleteQuestionReplyProcess/${questionReply.questionReplyDto.id}?questionboardId=${map.questionDto.id}"' style="background-color: transparent; border: none; color: inherit;">
	                        🚨
						  </span>
						</c:if>
				   	   </div>
				   	   
				   
				   <div class="col text-end">
				   	  <div class="row">
				   	  	<div class="col">
				   	  		<!-- 동적으로 바껴야 하는 부분 -->
				   	  		<c:choose>
				   	  			<c:when test="${map.replyCompleteCount > 0}">
									<c:if test="${questionReply.questionReplyDto.status == 'Y' }">
										
										<span class="text-success mt-1" style="font-size: 14px; position: relative; top: 14px;">
										<i class="bi bi-check-circle" style="font-size: 14px; color: #28a745;"></i>
										채택 완료</span>
									</c:if>
				   	  			</c:when>
				   	  			<c:otherwise>
				   	  				<c:if test="${!empty sessionUser && sessionUser.id == map.userDto.id && sessionUser.id != questionReply.userDto.id}">
										<a href="/safari/community/question/acceptQuestionReplyProcess?question_reply_id=${questionReply.questionReplyDto.id }" class="btn mt-2 btn btn-sm" style="background: #ff6f0f; font-weight: bold; color: white;">채택하기</a>
				   	  				</c:if>
				   	  			</c:otherwise>
				   	  		</c:choose>
					   	  	<!-- 동적으로 바껴야 하는 부분 -->
				   	  	</div>
				   	  </div>
				   </div>
				 </div>
				 
				  
				  <div class="row mt-3">
				   	 <div class="col-11" style="margin-top: -5px; margin-bottom: 15px; font-size: 15px">
				   		${questionReply.questionReplyDto.content}
				   	 </div>
				   	 <div class="col text-end">
				   	 	<div class="row">
				   	 	
				   	 	<div class="col"></div>
				   	 	</div>
				   	 </div>
				   	 </div>
				   	 
				   	 <!-- 알아두세요 -->
				   	 <div class="row">
				   	 	<div class="col">
				   	 	<div style="font-size: 13px; color:red;">
				   	 	<i class="bi bi-exclamation-circle"></i>&nbsp;알아두세요!<br></div>
				   	 	<div style="font-size: 12px; color:gray;" class = "mb-3">
				   	 	위 답변은 답변작성자가 경험과 지식을 바탕으로 작성한 내용입니다.<br> 
				   	 	</div>
				   	 	</div>
				   	 </div>
				   	 
				   	 	
				   	 	
				   	 
				   	 <!-- 알아두세요 -->
				   	  <%--답변 내용--%> 
				</div>
				</div>
				 <%--답변 공간--%> 
				 </c:forEach>
				 </div>
				 </div>
				 <%-- 답변 반복문 --%>
					</div>
				</div>
				<%-- 가운데 --%>
					
			
			<%--오른쪽 --%>
			<div class="col-2">
			</div>
			<%--오른쪽 --%>

     		</div>
      
      
      
   
      
     
      
      
     
	<!-- 푸터 섹션 -->
	<jsp:include page="../../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>	
</html>	      