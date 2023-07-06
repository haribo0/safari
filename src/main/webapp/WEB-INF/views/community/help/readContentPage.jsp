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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->
	
	
	<div class="row mt-5">
		<div class="col"></div>
		
		<%-- 내용 공간 --%>
		<div class="col-6">
			<div class="row">
				<div class="col fw-bold fs-2">
					<span style="font-size: 70%;" class="badge bg-secondary">${map.helpDto.points}</span>
					${map.helpDto.title}
				</div>	
			</div>
			
			<hr>
			
			<div class="row">
				<div class="col">
				 ${map.userDto.nickname }  <fmt:formatDate value="${map.helpDto.reg_date}" pattern="yyyy.MM.dd HH:mm"/>
				 ${map.helpDto.status}
				</div>
				<div class="col">
				</div>
				<div class="col text-end">
					조회수: ${map.helpDto.views}
				</div>
			</div>
			
			
			<hr> <%-- --%>
			
			<div class="container">
				<div class="row">
					<div class="col">
						
		
							<div class="row">
								<div class="col">
									${map.helpDto.content }
								</div>
							</div>
						
						
						<%-- 글 내용 영역 --%>
						<c:forEach items="${map.helpImgDtoList}" var="helpImgDto">
							<div class="row mt-2">
								<div class="col">
									<img src="/uploadFiles/${helpImgDto.help_img_link}"
										style="width: 960px;">
								</div>
							</div>						
						</c:forEach>
						<%-- 글 내용 영역 --%>
					
					</div>
				</div>
			</div> 
			
			
			<div class="row mt-5 text-center">
				 <div class="col">
				  <!--  onclick='location.href="/safari/community/help/insertHelpLikeProcess/${map.helpDto.id}"'-->
					<div class="row">
						<div class="col text-center" style="text-align: center;">
						<!-- 고친다 -->
							<c:choose>
							    <c:when test="${HelpBoardLikeCount >= 1}">
							        <a class="bi bi-heart-fill text-danger" style="font-size: 48px;" href="/safari/community/help/insertHelpLikeProcess/${map.helpDto.id}"></a>
							        ${HelpBoardLikeCount}
							    </c:when>
							    <c:otherwise>
							        <a class="bi bi-heart text-danger" style="font-size: 48px;" href="/safari/community/help/insertHelpLikeProcess/${map.helpDto.id}"></a>
							        ${HelpBoardLikeCount}
							    </c:otherwise>
							</c:choose>
							
						</div>
					</div>
					
					
					</div>
					</div>
			
			<hr>
			<div class="row mt-5 text-center">
			<div class="col">		
			<c:if test="${sessionUser.id == map.userDto.id }">
				<input type="button" class="btn btn-primary" onclick="location.href='/safari/community/help/updateContentPage/${map.helpDto.id}'" value="수정" />
				<input type="button" class="btn btn-primary" onclick="location.href='/safari/community/help/deleteContentProcess/${map.helpDto.id}'"  value="삭제" />
			</c:if>
				<input type="button" class="btn btn-primary" onclick="location.href='/safari/community/help/mainPage'" value="목록으로">
			</div>
			</div>
			<%-- 댓글 작성 글자 --%>
			<div class="row">
				<div class="col">
					Comment
				</div>
			</div>
			
			
			<form action="/safari/community/help/writeCommentProcess/${map.helpDto.id}" method="post">
			<input type="hidden" name="user_id" value="${sessionUser.id}">
			<input type="hidden" name="help_id" value="${map.helpDto.id}">
			
				<%-- 댓글 작성 박스 --%>
				<div class="row mt-2">
					<div class="col-11 d-grid ">
						<textarea class="form-floating border p-2 mb-2 border-opacity" placeholder="댓글을 입력하세요" id="floatingTextarea2" style="height: 100px" name="content"></textarea>
						
					</div>
					<div class="col d-flex justify-content-center ">
						<button class="btn btn-secondary" style="font-size: 15px">입력</button>
					</div>
				</div>
			</form>	
			
			<%-- 댓글 작성 박스 --%>
			<div class="row mb-2">
				<div class="col"></div>
			</div>


			<div class="row">
			<div class="col">
			<c:forEach items="${helpCommentsList}" var="helpComment">


	          <!-- 댓글 공간-->
	            <div class="row">
	                <div class="col border border-1 rounded-3">
	                        
	                    <!-- 댓글 내용-->
	                        <div class="row mt-2">
	                            <div class="col fw-bold">
	                                ${helpComment.userDto.nickname } <span class="text-secondary ms-2" style="font-size: 0.9rem; font-weight: normal;">
	                                <fmt:formatDate value="${helpComment.helpCommentDto.reg_date}" pattern="yyyy.MM.dd a hh:mm"/> 
	                                </span>
	                                
	                                  <c:if test="${sessionUser.id == helpComment.userDto.id }">
	                                   <span class="ms-2">
	                                       <input type="button" class="btn btn-sm btn-primary" value="수정" style="background-color: transparent; border: none; color: inherit;">
	                                        <input type="button" class="btn btn-sm btn-primary" value="삭제" style="background-color: transparent; border: none; color: inherit;">
	                                       </span> </c:if>
	                                
	                            </div>
	                            <div class="col text-end">
	                                  <div class="row">
	                                    <div class="col">
	                                    	<!-- 동적으로 바껴야 하는 부분 -->
	                                    	<c:choose>
	                                    		
	                                    		<c:when test="${(map.userDto.id == sessionUser.id) && map.helpDto.status == '진행중'}">
	                                    			<c:choose>
	                                    				<c:when test="${(map.userDto.id != helpComment.helpCommentDto.user_id) && helpComment.helpCommentDto.status=='채택 대기중' }">
	                                    					 <input type="button" class="btn mt-4 btn-primary btn-sm" onclick='location.href="/safari/community/help/acceptHelpCommentProcess?help_comment_id=${helpComment.helpCommentDto.id}"' value="채택하기">
	                                    				</c:when>
	                                    				<c:when test="${map.userDto.id == helpComment.helpCommentDto.user_id }">
	                                    				
	                                    				</c:when>	                                    				
	                                    			</c:choose>
	                                    		</c:when>
	                                    		
	                                    		<c:when test="${(map.userDto.id == sessionUser.id) && map.helpDto.status == '채택 완료' }">
	                                    			<c:choose>
	                                    				<c:when test="${(map.userDto.id != helpComment.helpCommentDto.user_id) && helpComment.helpCommentDto.status == '채택 완료'}">
	                                    					<button type="button" class="btn mt-3 btn-success btn-sm" style="background-color: transparent; border: none; padding: 0;">
	                                    						<i class="bi bi-check-circle" style="font-size: 1.5rem; color: #28a745;"></i>
	                                    					</button>	                                    			
	                                    				</c:when>
	                                    				
	                                    				<c:when test="${(map.userDto.id != helpComment.helpCommentDto.user_id) && helpComment.helpCommentDto.status == '채택 대기중' }">
	                                    				</c:when>
	                                    				
	                                    				<c:when test="${map.userDto.id == helpComment.helpCommentDto.user_id}">
	                                    				</c:when>
	                                    				
	                                    			
	                                    			</c:choose>
	                                    		</c:when>
	                                    		
	                                    		
	                                    		<c:when test="${(map.userDto.id != sessionUser.id) && map.helpDto.status == '진행중'}">
	                                    		
	                                    		</c:when>
	                                    		
	                                    		<c:when test="${(map.userDto.id != sessionUser.id) && map.helpDto.status == '채택 완료'}">
	                                    			<c:choose>
	                                    				<c:when test="${helpComment.helpCommentDto.status == '채택 완료'}">
	                                    					<button type="button" class="btn mt-3 btn-success btn-sm" style="background-color: transparent; border: none; padding: 0;">
	                                    						<i class="bi bi-check-circle" style="font-size: 1.5rem; color: #28a745;"></i>
	                                    					</button>	                                    			 
	                                    				</c:when>
	                                    				<c:when test="${helpComment.helpCommentDto.status == '채택 대기중'}">
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
	                            <div class="col" style="margin-top: -5px;" >
	                               ${helpComment.helpCommentDto.content}
	                            </div>
	                            <div class="col text-end">
	                                <div class="row">
	
	                                    <div class="col">
	                                        <!-- 동적으로 바껴야 하는 부분 -->
	                                      
	                                        <!-- 동적으로 바껴야 하는 부분 -->
	                                    </div>
	                                </div>
	
	                            </div>
	                        </div>
	                     <!-- 댓글 내용-->
	                </div>
	            </div>
	            <!-- 댓글 공간-->    
					
				
		
			</c:forEach>
			</div>
			</div> 
			
			
		<%-- 	<div class="row mt-2">
				<div class="col-10">
					<input type="hidden" name="user_id" value="${sessionUser.id}">
					<input type="hidden" name="help_id" value="${map.helpDto.id}">
					${map.userDto.nickname }
					<input type="text" class="form-control" name= "reg_date" value="${map.helpCommentDto.reg_date }">
					<input type="text" class="form-control" name= "status" value="${map.helpCommentDto.status }">
					<input type="text" class="form-control" name="content" value="${map.helpCommentDto.content}">
						
				</div>
			
			</div>
				
		
			
			<%--댓글 시작 --%>
			
		<%-- <h6>댓글</h6>
			<form action="/safari/community/help/writeCommentProcess" method="post">
				<div class="container">
					작성자: ${sessionUser.nickname}
					<input type="hidden" name="id" value="${map.userDto.id}">
					<input type="hidden" name="help_id" value="${map.helpDto.id}"> <!-- 주의 -->
					<textarea rows="5" cols="160" name="content"></textarea>
					
					<button class="btn btn-primary" onclick="window.open('/safari/community/help/readContentPage')">댓글쓰기</button> 
				</div>
			</form>
			
			
			<div class="row mt-5 text-center">
				<div class="col">
					<c:if test="${sessionUser.id == map.userDto.id }">
					<input type="button" class="btn btn-primary" onclick="window.open('/safari/community/help/updateContentPage/${map.helpDto.id}')" value="수정" />
					<input type="button" class="btn btn-primary" onclick="window.open('/safari/community/help/deleteContentProcess/${map.helpDto.id}')"  value="삭제" />
					</c:if>
					<input type="button" class="btn btn-primary" onclick="window.open('/safari/community/help/mainPage')" value="목록으로">
					
				</div>
			</div>
			<%--댓글 끝 --%>
			
			
			
		</div>
		<%-- 내용 공간 --%>
		
		
		<div class="col">
		 
		</div>
	
	</div>
	
<%--	<div class="row">
	<div class="col text-center">
	<div>
	  <h3>제목: ${map.helpDto.title}</h3>
	</div>
	<div>
	  <div>내용: ${map.helpDto.content }</div>
	</div>
	<div> 
	  <h6>포인트: ${map.helpDto.points }</h6>
	</div>
	<div>
	  <h6>위치: ${map.helpDto.location }</h6>
	</div>
	<div>
	  <h6>작성자: ${map.userDto.nickname }</h6>
	</div>
	<div>
	  <h6>등록일: <fmt:formatDate value="${map.helpDto.reg_date}" pattern="yyyy.MM.dd"/></h6>
	</div>
	<div>
	  <h6>조회수: ${map.helpDto.views }</h6>
	</div>
	
	<c:forEach items="${map.helpImgDtoList}" var="helpImgDto">
		<img src="/uploadFiles/${helpImgDto.help_img_link}"><br>
	</c:forEach>

	
	<a href="/safari/community/help/mainPage"> 목록으로 </a><br>
	<c:if test="${sessionUser.id == map.userDto.id}">
		<a href="/safari/community/help/updateContentPage/${map.helpDto.id}">수정</a>
		<a href="/safari/community/help/deleteContentProcess/${map.helpDto.id}">삭제</a>
	</c:if>
	</div>
	

	
</div> --%>

	
	
	
	<!-- 푸터 섹션 -->
	<jsp:include page="../../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->


</body>	
</html>	



