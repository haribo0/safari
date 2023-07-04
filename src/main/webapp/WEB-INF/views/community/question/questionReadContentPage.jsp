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
	
		
		
		<div class="row">
		<div class="col"></div>
		
		<%-- 내용 공간 --%>
		<div class="col-8">
		<div class="container mt-5">
			<div class="row">
				<div class="col fw-bold fs-2">
					<span style="font-size: 70%;" class="badge bg-secondary">${map.questionDto.points}</span>
					${map.questionDto.title} 
				</div>	
			</div>
		
			
			<hr>
			
			<div class="row">
				<div class="col">
				 ${map.userDto.nickname }  <fmt:formatDate value="${map.questionDto.reg_date}" pattern="yyyy.MM.dd HH:mm"/>
				 ${map.questionDto.status}
				</div>
				<div class="col">
				</div>
				<div class="col text-end">
					조회수: ${map.questionDto.views}
				</div>
			</div>
			
			
			<hr>
			
			
			<div class="row">
				<div class="col">
					${map.questionDto.content }
					
				<div class="row mt-5 text-center">
					<div class="col">
						<div class="row">
							<div class="col text-center" style="text-align: center;">
							 <c:if test="${QuestionBoardLikeCount == 0 }">
							 	<a class="bi bi-heart text-danger" style="font-size: 48px;" href= "/safari/community/question/insertQuestionLikeProcess/${map.questionDto.id}"></a>${QuestionBoardLikeCount}
							 </c:if>
							 <c:if test="${QuestionBoardLikeCount >= 1 }">
							 	<a class="bi bi-heart-fill text-danger" style="font-size: 48px;" href= "/safari/community/question/insertQuestionLikeProcess/${map.questionDto.id}"></a>${QuestionBoardLikeCount}
							 </c:if> 
						    </div>
					    </div>
				   </div>
				</div>
				
					<hr>
				<div class="row mt-5 text-center" style="text-align: center;">
					<div class="col">
					<c:if test="${sessionUser.id == map.userDto.id }">
						<input type="button" class="btn btn-primary" onclick='location.href="/safari/community/question/updateQuestionContentPage/${map.questionDto.id}"' value="수정"/>
						<input type="button" class="btn btn-primary" onclick='location.href="/safari/community/question/deleteQuestionContentProcess/${map.questionDto.id}"' value="삭제"/>
					</c:if>
						<input type="button" class="btn btn-primary" onclick='location.href="/safari/community/question/mainPage"' value="목록으로"/>
					<c:if test="${sessionUser!=null && sessionUser.id == map.userDto.id }">
						<input type="button" class="btn btn-primary" onclick='location.href="/safari/community/question/replyQuestionContentPage/${map.questionDto.id}"' value="답변하기"/>
					</c:if>
					</div>
				</div>
				</div>
			</div>
			
			
				 
	 		<%--
			<div class="row">
				<div class="col">
				Reply
				</div>
			</div>
				 
				<form action="/safari/community/question/writeQuestionReplyProcess/${map.questionDto.id }" method="post">
				<input type="hidden" name="user_id" value="${sessionUser.id}">
				<input type="hidden" name="question_id" value="${map.questionDto.id}">
				
				댓글 작성 박스
				<div class="row mt-2">
					<div class="col-11 d-grid ">
						<textarea class="form-floating border p-2 mb-2 border-opacity" placeholder="답변을 입력하세요" id="floatingTextarea2" style="height: 200px" name="content"></textarea>
					</div>
					<div class="col d-flex justify-content-center ">
						<button class="btn btn-secondary" style="font-size: 15px">입력</button>
					</div>
				</div>
				</form>  --%>
				
			<div class="row">
				<div class="col">
				Reply
				</div>
			</div>
			
				<%-- 답변 조회 박스 --%>
			<div class="row">
			<div class="col">
				<c:forEach items="${questionReplyBoardList}" var="map">
					
				<form action="/safari/community/question/deleteQuestionReplyProcess/${map.questionReplyDto.id}?questionboardId=${map.questionReplyDto.question_id}" method="post">
					
				<div class="row" style="margin-top: 10px;">
				<div class="col">
				<span class="fw-bold" style="font-size: 15px">${map.userDto.nickname} </span>&nbsp;
				<input type="hidden" value="${map.questionReplyDto.id}" name="id">
				<!-- 이거 뭔가 이상... -->
				<input type="hidden" value="${map.questionDto.id}" name="questionboardId">
				<span class="badge rounded-pill text-bg-secondary mb-2 text-center">${map.questionReplyDto.status}</span>
				</div>
				</div>
				
				<div class="row">
				<div class="col">
				<input type="text" style="border: none; outline:none;" value="${map.questionReplyDto.content}"><br>
				</div>
				<div class="col-2">
				<!--<c:if test="${sessionUser.id == map.userDto.id }">
				아직 안함 
				<input type="button" class="btn btn-secondary" onclick='location.href="/safari/community/question/acceptHelpCommentProcess?help_comment_id=${helpCommentDto.helpCommentDto.id}"' style="font-size: 12px;" value="채택하기"/>
				<button class="btn btn-secondary" style="font-size: 15px; order: 1;">채택</button>
				</c:if>
				</div>-->
				</div>
				</div>
				
				<div class="row">
				<div class="col">
				<span style="font-size:13px"><fmt:formatDate value="${map.questionReplyDto.reg_date}" pattern="yyyy.MM.dd HH:mm" /></span>
				<c:if test="${sessionUser.id == map.userDto.id }">
				<button class="btn btn-light"><i class="bi bi-trash3"></i></button>
				</c:if>
				</div>
				</div>
					
					</form>
				
				
				
				</c:forEach>
			
			
			</div>
			</div>
		 	<!--  <div class="card mt-3" style="width: 78rem;">
		  	<div class="card-body">
		    <h6 class="card-subtitle mb-2 text-body-secondary">${map.userDto.nickname } <fmt:formatDate value="${map.questionReplyDto.reg_date}" pattern="yyyy.MM.dd HH:mm"/>${map.helpDto.status}</h6>
		    <p class="card-text">${map.questionReplyDto.content }</p>
		    <a href="#" class="card-link">Card link</a>
		    <a href="#" class="card-link">Another link</a>
		  </div>
		</div>-->
				
				 </div>
		     </div>	
			<!-- 내용 끝 -->
			
			<div class="col"></div>
			

     
      </div>
      
      
   
      
     
      
      
     
	<!-- 푸터 섹션 -->
	<jsp:include page="../../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>	
</html>	      