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
</head>
<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->
	
		
		
	<div class="row mt-5">
		<div class="col"></div>
		
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
					<c:if test="${map.helpDto.points==0}"></c:if>
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
			<div class="container">
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
			</div>
			<%--게시물 공간 --%>
			
			<%--좋아요/수정/삭제/목록 --%>
			<div class="row mt-4 text-end">
			<div class="col d-flex align-items-center">
			
			 <c:choose>
				<c:when test="${QuestionBoardLikeCount >= 1}">
		        	<a class="bi bi-heart-fill text-danger" style="font-size: 21px;" href="/safari/community/question/insertQuestionLikeProcess/${map.questionDto.id}"></a>
			        &nbsp;${QuestionBoardLikeCount} 
				</c:when>
				<c:otherwise>
			        <a class="bi bi-heart text-danger" style="font-size: 21px;" href="/safari/community/question/insertQuestionLikeProcess/${map.questionDto.id}"></a>
			        &nbsp;${QuestionBoardLikeCount}
			    </c:otherwise>
			</c:choose> 
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
					
				
				
				
				
				</div>
			</div>
			
				
			<%-- 답변 작성 글자 --%>	
			<div class="row">
				<div class="col">
				Reply
				</div>
			</div>
			
				<%-- 답변 공간 --%>
				<div class="row">
				<div class="col">
				<c:forEach items="${questionReplyBoardList}" var="questionReply">
					
				<%-- 답변 내용 --%>
				<%-- <form action="/safari/community/question/deleteQuestionReplyProcess/${map.questionReplyDto.id}?questionboardId=${map.questionReplyDto.question_id}" method="post"> --%>
					
				<div class="row">
					<div class="col border border-1 rounded-3">
						<div class="row mt-2" style="margin-top: 10px;">
							<div class="col fw-bold">
							${questionReply.userDto.nickname} <span class="text-secondary ms-2" style="font-size: 0.9rem; font-weight: normal;">
							 <fmt:formatDate value="${questionReply.questionReplyDto.reg_date}" pattern="yyyy.MM.dd a hh:mm"/> 
					 		 </span>
					 
						 <c:if test="${sessionUser.id == questionReply.userDto.id }">
						  <span class="text-secondary ms-2">
						  	<input type="button" class="btn btn-sm btn-primary" value="수정"  style="background-color: transparent; border: none; color: inherit;">
	                        <input type="button" class="btn btn-sm btn-primary" value="삭제" onclick='location.href="/safari/community/question/deleteQuestionReplyProcess?questionboardId=${map.questionReplyDto.question_id}"'  style="background-color: transparent; border: none; color: inherit;">
						  </span>
						</c:if>
				   	   </div>
				   
				   <div class="col text-end">
				   	  <div class="row">
				   	  	<div class="col">
				   	  		<!-- 동적으로 바껴야 하는 부분 -->
				   	  		 <c:choose>
				   	  		<%-- 본인이 작성한 게시물의 상태가 현재 진행중(채택 대기중)일 때 --%>
							<c:when test="${map.questionDto.status == '진행중'}">
				   	  			<%-- <c:when test="${(map.userDto.id == sessionUser.id) && (map.questionDto.status == '진행중')} "> --%>
				   	  				<c:choose>
				   	  					<%-- 본인이 쓴 답변이 아니고 그 답변이 N(채택 대기중)일 때 채택하기 버튼 있음, 게시글 상태는 진행중이라 모든 답변은 채택 대기중 상태 --%>
						 			
				   	  					<c:when test="${(map.userDto.id != questionReply.questionReplyDto.user_id) && questionReply.questionReplyDto.status == 'N'}">
				   	  						<input type="button" class="btn mt-4 btn-primary btn-sm" 
				   	  						onclick='location.href="/safari/community/question/acceptQuestionReplyProcess?question_reply_id=${questionReply.questionReplyDto.id}"' value="채택하기">
				   	  					</c:when>
				   	  					
				   	  					<%-- 본인이 쓴 댓글일 경우 채택하기 버튼 없음  --%>
				   	  					<c:when test="${map.userDto.id == questionReply.questionReplyDto.user_id}">
				   	  							
				   	  					</c:when>
				   	  				</c:choose>
				   	  			</c:when>
				   	  		
				   	  		<%-- 본인이 작성한 게시물 상태가 현재 채택 완료일 때 --%>
				   	  		<c:when test="${map.questionDto.status == '채택 완료' && (map.userDto.id == sessionUser.id) }">
				   	  			<c:choose>
				   	  				<c:when test="${(map.userDto.id != questionReply.questionReplyDto.user_id) && questionReply.questionReplyDto.status == 'Y'}">
				   	  					
	                                    <i class="bi bi-check-circle" style="font-size: 1.5rem; color: #28a745;"></i>
	                                    
				   	  				</c:when>
				   	  			
				   	  				<c:when test="${(map.userDto.id != questionReply.questionReplyDto.user_id) && questionReply.questionReplyDto.status == 'N' }">
				   	  				</c:when>
				   	  				
				   	  				<%-- 본인이 쓴 댓글일 경우 채택하기 버튼은 없음 --%>
				   	  				<c:when test="${map.userDto.id == questionReply.questionReplyDto.user_id}">
				   	  				</c:when>
				   	  			</c:choose>
				   	  		</c:when>
				   	  		
				   	  		
				   	  		<%-- 본인이 작성한 게시물이 아닐 경우이고 답변이 N(채택 대기중)일때 --%>
				   	  		<c:when test="${(map.userDto.id != sessionUser.id) && map.questionDto.status == '진행중'}">
				   	  		
				   	  		</c:when>
				   	  		
				   	  		 
				   	  		<c:when test="${(map.userDto.id != sessionUser.id) && map.questionDto.status == '채택 완료' }">
				   	  			<c:choose>
				   	  				<c:when test="${questionReply.questionReplyDto.status == 'Y'}">
				   	  					
	                                    <i class="bi bi-check-circle" style="font-size: 1.5rem; color: #28a745;"></i>
	                                    
				   	  				</c:when>
				   	  				<c:when test="${questionReply.questionReplyDto.status == 'N'}">
				   	  				</c:when>
				   	  			</c:choose>
				   	  		</c:when> 
				   	  	</c:choose>
				   	  		
				   	  	<!-- 동적으로 바껴야 하는 부분 -->
				   	  	
				   	  	</div>
				   	  
				   	  </div>
				   
				   </div>
				   </div>
				   
				   
				   <div class="row mt-2">
				   	 <div class="col" style="margin-top: -5px;">
				   		${questionReply.questionReplyDto.content}
				   	 </div>
				   	 <div class="col text-end">
				   	 	<div class="row">
				   	 	
				   	 	<div class="col">
				   	 	</div>
				   	 	</div>
				   	 </div>
				   	 
				   	 </div>
				  </div>
				  
				</div>
				</c:forEach>
			</div>
			</div>
			</div>
			</div>
			<!-- 내용 공간 -->
			
			
			<div class="col">
			</div>
			

     
      </div>
      
      
   
      
     
      
      
     
	<!-- 푸터 섹션 -->
	<jsp:include page="../../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>	
</html>	      