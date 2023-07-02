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
		<div class="col-6">
			<div class="row">
				<div class="col fw-bold fs-2">
					<span style="font-size: 70%;" class="badge bg-secondary">${map.question.points}</span>
					${map.question.title}
				</div>	
			</div>
			
			<hr>
			
			<div class="row">
				<div class="col">
				 ${map.userDto.nickname }  <fmt:formatDate value="${map.question.reg_date}" pattern="yyyy.MM.dd HH:mm"/>
				 ${map.question.status}
				</div>
				<div class="col">
				</div>
				<div class="col text-end">
					조회수: ${map.question.views}
				</div>
			</div>
			
			
			<hr>
			
			<div class="container">
				<div class="row">
					<div class="col">
					${map.question.content }
				<!--  <c:forEach items="${map.helpImgDtoList}" var="helpImgDto">
						<img src="/uploadFiles/${helpImgDto.help_img_link}">
					</c:forEach>-->
					</div>
				</div>
			</div>
			
			<!-- -->

			<!--<div class="row mt-5 text-center">
				 <div class="col">
				  <!--  onclick='location.href="/safari/community/help/insertHelpLikeProcess/${map.helpDto.id}"'-->
					
					<!--<input type="button" class="btn btn-primary" onclick='location.href="/safari/community/help/insertHelpLikeProcess/${map.helpDto.id}"' value="좋아요"/>
					${HelpBoardLikeCount}
					</div>
					</div>-->
			
			<hr>
			<!--<div class="row mt-5 text-center">
			<div class="col">		
			<c:if test="${sessionUser.id == map.userDto.id }">
				<input type="button" class="btn btn-primary" onclick="window.open('/safari/community/help/updateContentPage/${map.helpDto.id}')" value="수정" />
				<input type="button" class="btn btn-primary" onclick="window.open('/safari/community/help/deleteContentProcess/${map.helpDto.id}')"  value="삭제" />
			</c:if>
				<input type="button" class="btn btn-primary" onclick="window.open('/safari/community/help/mainPage')" value="목록으로">
			</div>
			</div>
			</div>
			</div>-->
     
      </div>
      </div>
	<!-- 푸터 섹션 -->
	<jsp:include page="../../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>	
</html>	      