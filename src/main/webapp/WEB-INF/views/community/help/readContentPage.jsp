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
		<div class="col-8">
			<div class="row" style="margin-bottom: 7px;">
				<div class="col">
					
					<span class="fw-medium fs-5">${map.helpDto.title}</span> 
					<span class="badge rounded-pill text-bg-warning" style="font-size: 80%; position: relative; bottom: 2px;">
					<span class="text-black">${map.helpDto.points}</span>
					</span>
				</div>	
			</div>
			
			
			
			<div class="row">
				<div class="col ms-1">
				 <span style="font-size: 0.9rem; color: gray;" > ${map.userDto.nickname}  &nbsp;  <i class="bi bi-eye"></i> ${map.helpDto.views} &nbsp;
				 ${map.helpDto.status}
				 </span>
				</div>
				<div class="col">
				</div>
				<div class="col text-end">
					<span style="font-size: 0.9rem; color: gray;"><i class="bi bi-clock"></i> <fmt:formatDate value="${map.helpDto.reg_date}" pattern="yyyy-MM-dd HH:mm"/></span>
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
									${map.helpDto.content } 
								</div>
							</div>
						
						
						
						<c:forEach items="${map.helpImgDtoList}" var="helpImgDto">
							<div class="row mt-2">
								<div class="col">
									<img src="/uploadFiles/${helpImgDto.help_img_link}"
										style="width: 960px;">
								</div>
							</div>						
						</c:forEach>
						<%-- 글 내용/이미지 영역 --%>
					
					</div>
				</div>
			</div> 
			<%--게시물 공간 --%>
			
			<%--좋아요 --%>
			<%-- <div class="row mt-5 text-center">
				 <div class="col">
				  <!--  onclick='location.href="/safari/community/help/insertHelpLikeProcess/${map.helpDto.id}"'-->
					<div class="row">
						<div class="col text-center" style="text-align: center;">
						<!-- 고친다 -->
							<c:choose>
							    <c:when test="${HelpBoardLikeCount >= 1}">
							        <a class="bi bi-heart-fill text-danger" style="font-size: 40px;" href="/safari/community/help/insertHelpLikeProcess/${map.helpDto.id}"></a>
							        ${HelpBoardLikeCount}
							    </c:when>
							    <c:otherwise>
							        <a class="bi bi-heart text-danger" style="font-size: 40px;" href="/safari/community/help/insertHelpLikeProcess/${map.helpDto.id}"></a>
							        ${HelpBoardLikeCount}
							    </c:otherwise>
							</c:choose>
							
						</div>
					</div>
				</div>
			 </div> --%>
			<%--좋아요 --%>
			
			
			
			<%--수정/삭제/목록--%>
			<div class="row mt-4 text-end">
			<div class="col d-flex align-items-center">		
			 <c:choose>
				<c:when test="${HelpBoardLikeCount >= 1}">
		        	<a class="bi bi-heart-fill text-danger" style="font-size: 21px;" href="/safari/community/help/insertHelpLikeProcess/${map.helpDto.id}"></a>
			        &nbsp;${HelpBoardLikeCount} 
				</c:when>
				<c:otherwise>
			        <a class="bi bi-heart text-danger" style="font-size: 21px;" href="/safari/community/help/insertHelpLikeProcess/${map.helpDto.id}"></a>
			        &nbsp;${HelpBoardLikeCount}
			    </c:otherwise>
			</c:choose> 
			&nbsp;<c:if test="${sessionUser.id == map.userDto.id }">
				<input type="button" class="btn btn-secondary" style="background-color: transparent; border: none; color: inherit; font-size: 14px" onclick="location.href='/safari/community/help/updateContentPage/${map.helpDto.id}'" value="수정" />
				<input type="button" class="btn btn-secondary" style="background-color: transparent; border: none; color: inherit; font-size: 14px" onclick="location.href='/safari/community/help/deleteContentProcess/${map.helpDto.id}'"  value="삭제" />
			</c:if>
				<input type="button" class="btn btn-secondary" style="background-color: transparent; border: none; color: inherit; font-size: 14px" onclick="location.href='/safari/community/help/mainPage'" value="목록으로">
			</div>
			</div>
			<%--수정/삭제/목록--%>
			
			<hr>
			
			<%-- 댓글 작성 글자 --%>
			<div class="row">
				<div class="col">
				
				<i class="bi bi-chat-dots"></i>&nbsp;<span style="font-size: 14px;">댓글</span>
				</div>
			</div>
			<%-- 댓글 작성 글자 --%>
			
			
			<form action="/safari/community/help/writeCommentProcess/${map.helpDto.id}" method="post">
			<input type="hidden" name="user_id" value="${sessionUser.id}">
			<input type="hidden" name="help_id" value="${map.helpDto.id}">
			
				<%-- 댓글 작성 박스 --%>
				<div class="row mt-2">
					<div class="col-11 d-grid ">
						<textarea class="form-floating border p-2 mb-2 border-opacity" placeholder="댓글을 입력하세요" id="floatingTextarea2" style="height: 90px; width: 1180px; font-size: 13px;" name="content" ></textarea>
					
					</div>
					<div class="col d-flex justify-content-center ">
						<button class="btn btn-primary" style="font-size: 13px; height: 90px; width: 68px">입력</button>
					</div>
				</div>
			</form>	
			<%-- 댓글 작성 박스 --%>
			
			<%-- 댓글 작성 -- 댓글 내용 여백--%>
			<div class="row mb-2">
				<div class="col"></div>
			</div>
			<%-- 댓글 작성 -- 댓글 내용 여백--%>

			<%-- 댓글 반복문 --%>
			<div class="row">
			<div class="col">
			<c:forEach items="${helpCommentsList}" var="helpComment">


	          <!-- 댓글 공간-->
	            <div class="row">
	                <div class="col border border-1 rounded-3">
	                        
	                    <!-- 댓글 내용-->
	                        <div class="row mt-2 ">
	                            <div class="col fw-bold">
	                            	<span style="font-size: 13px;">${helpComment.userDto.nickname }</span>
	                                <span class="text-secondary ms-2" style="font-size: 13px; font-weight: normal;">
	                                <fmt:formatDate value="${helpComment.helpCommentDto.reg_date}" pattern="yyyy.MM.dd a hh:mm"/> 
	                                </span>
	                                
	                                  <c:if test="${sessionUser.id == helpComment.userDto.id }">
	                                   <span class="text-secondary ms-2">
	                                       <input type="button" class="btn btn-sm btn-primary" value="수정" onclick='location.href="/safari/community/help/updateContentPage/${map.helpDto.id}"' style="font-size: 13px; background-color: transparent; border: none; color: inherit;">
	                                        <input type="button" class="btn btn-sm btn-primary" value="삭제" onclick='location.href="/safari/community/help/deleteCommentProcess/${helpComment.helpCommentDto.id}?boardId=${map.helpDto.id }"' style="font-size: 13px; background-color: transparent; border: none; color: inherit;">
	                                       </span> 
	                                  </c:if>
	                                
	                            </div>
	                            <div class="col text-end">
	                                  <div class="row">
	                                    <div class="col">
	                                    	<!-- 동적으로 바껴야 하는 부분 -->
	                                    	<c:choose>
	                                    		<%-- 본인이 작성한 게시물의 상태가 현재 진행중(채택 대기중)일 때 --%>
	                                    		<c:when test="${(map.userDto.id == sessionUser.id) && map.helpDto.status == '진행중'}">
	                                    			<c:choose>
	                                    				<%-- 본인이 쓴 댓글이 아니고 그 댓글이 채택 대기중일 때 채택하기 버튼 있음, 게시글 상태는 진행중이라 모든 댓글은 채택 대기중 상태 --%>
	                                    				<c:when test="${(map.userDto.id != helpComment.helpCommentDto.user_id) && helpComment.helpCommentDto.status=='채택 대기중' }">
	                                    					 <input type="button" class="btn mt-4 btn-primary btn-sm" onclick='location.href="/safari/community/help/acceptHelpCommentProcess?help_comment_id=${helpComment.helpCommentDto.id}"' value="채택하기">
	                                    				</c:when>
	                                    				<%-- 본인이 쓴 댓글일 경우 채택하기 버튼 없음  --%>
	                                    				<c:when test="${map.userDto.id == helpComment.helpCommentDto.user_id }">
	                                    				
	                                    				</c:when>	                                    				
	                                    			</c:choose>
	                                    		</c:when>
	                                    		
	                                    		<%-- 본인이 작성한 게시물 상태가 현재 채택 완료일 때 --%>
	                                    		<c:when test="${(map.userDto.id == sessionUser.id) && map.helpDto.status == '채택 완료' }">
	                                    			<c:choose>
	                                    				<c:when test="${(map.userDto.id != helpComment.helpCommentDto.user_id) && helpComment.helpCommentDto.status == '채택 완료'}">
	                                    					<!--  여기에 아이콘 -->
	                                    					    <i class="bi bi-check-circle" style="font-size: 1.3rem; color: #28a745;"></i>  <span class="text-success mt-1" 
	                                    					    style="font-size: 14px; position: relative; bottom: 3px; ">채택 완료</span>         			
	                                    				</c:when>
	                                    				
	                                    				<c:when test="${(map.userDto.id != helpComment.helpCommentDto.user_id) && helpComment.helpCommentDto.status == '채택 대기중' }">
	                                    				</c:when>
	                                    				
	                                    				<%-- 본인이 쓴 댓글일 경우 채택하기 버튼은 없음 --%>
	                                    				<c:when test="${map.userDto.id == helpComment.helpCommentDto.user_id}">
	                                    				</c:when>
	                                    			</c:choose>
	                                    		</c:when>
	                                    		
	                                    		
	                                    		<%-- 본인이 작성한 게시물이 아닐 경우이고 게시물이 채택 대기중일때 --%>
	                                    		<c:when test="${(map.userDto.id != sessionUser.id) && map.helpDto.status == '진행중'}">
	                                    		
	                                    		</c:when>
	                                    		
	                                    		<%-- 본인이 작성한 게시물이 아닐 경우이고 게시글이 채택 완료되었을 때 --%>
	                                    		<c:when test="${(map.userDto.id != sessionUser.id) && map.helpDto.status == '채택 완료'}">
	                                    			<c:choose>
	                                    				<c:when test="${helpComment.helpCommentDto.status == '채택 완료'}">
	                                    					  <!--  여기에 아이콘 -->
	                                    						<i class="bi bi-check-circle" style= "font-size: 1.3rem; color: #28a745;"></i> <span class="text-success mt-1" style="
	                                    						position: relative; bottom: 3px; font-size: 14px">채택 완료</span> 
	                                    						                                    			 
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
	                            <div class="col" style="margin-top: -5px; margin-bottom: 15px; font-size: 13px"  >
	                               ${helpComment.helpCommentDto.content} 
	                            </div>
	                            <div class="col text-end">
	                                <div class="row">
	
	                                    <div class="col">
	                                      
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
			<%-- 댓글 반복문 --%> 
			
			
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



