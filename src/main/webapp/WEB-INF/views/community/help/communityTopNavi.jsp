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
<jsp:include page="../../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->

</head>
<body>
   <!-- 커뮤니티 메뉴바 -->
   <div class="container main_box">
      <h1 class="text-center fs-3 mt-1 me-5"><b>커뮤니티</b></h1>
         <ul class="nav justify-content-center pb-3 mb-3 mt-4">
            <!--<li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">공동구매</a></li>  -->
           <!--  <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">살까말까</a></li> -->
            <li class="nav-item text-center me-5">
            	<div class="row">
            		<div class="col">
            			<a href="${pageContext.request.contextPath}/community/pick/mainPage">
            				<button type="button" class="btn btn-outline-secondary rounded-circle border-2  d-inline-flex justify-content-center align-items-center" style="width: 65px; height: 65px; ">
            				<img class="mb-1" src="/safari/resources/img/community/pick.png" style="max-width: 36px; max-height: 36px;">
            				</button>
            			</a>
            		</div>
            	</div>
            	<div class="row">
            		<div class="col fw-bold mt-2" style="font-size: 13px; ">골라줘요</div>
            	</div>
           
            
            
            <li class="nav-item text-center me-5">
            	<div class="row">
            		<div class="col ">
            			<a href="${pageContext.request.contextPath}/community/help/mainPage">
            			<button type="button" class="btn btn-outline-secondary rounded-circle border-2 border-secondary d-inline-flex justify-content-center align-items-center" style="width: 65px; height: 65px;">
            				<img class="mb-1" src="/safari/resources/img/community/help.png" style="max-width: 38px; max-height: 38px;">
            			</button>
            			</a>
            		</div>
            	</div>
            	<div class="row">
            		<div class="col fw-bold mt-2" style="font-size: 13px; ">해주세요</div>
            	</div>
            </li>
            
            <li class="nav-item text-center me-5">
            	<div class="row">
            		<div class="col">
			            <a href="${pageContext.request.contextPath}/community/question/mainPage">
			            <button class="btn btn-outline-secondary rounded-circle border-2 border-secondary d-inline-flex justify-content-center align-items-center" style="width: 65px; height: 65px;">
			            	 <img class="mb-1" src="/safari/resources/img/community/question.png" style="max-width: 37px; max-height: 37px;">           		
            			</button>
            			</a>
            		</div>
            	</div>
            	<div class="row">
            		<div class="col fw-bold mt-2" style="font-size: 13px; margin-left:-2px">궁금해요</div>
            	</div>
			</li>
			
			  <li class="nav-item text-center me-5">
            	<div class="row">
            		<div class="col">
            			<a href="${pageContext.request.contextPath}/community/recruit/mainPage">
            			<button type="button" class="btn btn-outline-secondary rounded-circle border-2 border-secondary d-inline-flex justify-content-center align-items-center" style="width: 65px; height: 65px;">
            				<img class="mb-1" src="/safari/resources/img/community/recruit.png" style="max-width: 38px; max-height: 38px;">
            			</button>
            			</a>
            		</div>
            	</div>
            	<div class="row">
            		<div class="col fw-bold mt-2" style="font-size: 13px; ">구인구직</div>
            	</div>
            </li>
			 
			 <li class="nav-item text-center me-5">
            	<div class="row">
            		<div class="col">
            			<a href="${pageContext.request.contextPath}/community/promotion/mainPage">
            			<button type="button" class="btn btn-outline-secondary rounded-circle border-2 border-secondary d-inline-flex justify-content-center align-items-center" style="width: 65px; height: 65px;">
            				<img class="mb-1" src="/safari/resources/img/community/promotion2.png" style="max-width: 38px; max-height: 38px;">
            			</button>
            			</a>
            		</div>
            	</div>
            	<div class="row">
            		<div class="col fw-bold mt-2" style="font-size: 13px; ">써봤어요</div>
            	</div>
            </li>
           
          </ul>
   </div>

</body>
</html>