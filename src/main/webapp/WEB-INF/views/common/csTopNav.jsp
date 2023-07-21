<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>





<nav class="navbar navbar-expand navbar-dark bg-dark">
	  <div class="container-fluid">
	  
		<span class="navbar-brand mb-0 h1">
			<a href="./mainPage" class="btn"><img class="img-fluid" width="60px" src="/safari/resources/img/logopng1.png"></a>
		</span>
		<span class="navbar-brand mb-0 h1">
		  <a class="navbar-brand" href="#">고객지원서비스</a>
		</span>
		
		<!-- 왼쪽 메뉴 -->
		<ul class="navbar-nav mr-auto">
		
		 <c:if test="${!empty empUser && empUser.mater == 1}">
		  		<li class="nav-item">
	      			<a class="nav-link" href="#">대시보드</a>
	      		</li>
	     </c:if>
		
		  <li class="nav-item">
		    <a class="nav-link" href="#">1대1 문의</a>
		  </li>
		  
		  <li class="nav-item">
		    <a class="nav-link" href="#">실시간 채팅</a>
		  </li>
		  
		</ul>
		
		<!-- 오른쪽 메뉴 -->
		<ul class="navbar-nav ml-auto">
		  <li class="nav-item">
		    <a class="nav-link" href="#">메뉴1</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#">
		    
		    
		    </a>
		  </li>
		  <li class="nav-item">
		    <c:choose>
	      		<c:when test="${!empty empUser}">
	      			<a href="${pageContext.request.contextPath}/cs/logoutProcess" class="d-none">로그아웃</a>
	      		</c:when>
	      		<c:otherwise>
	   				<a href="${pageContext.request.contextPath}/cs/loginPage" class="btn btn-dark me-2">로그인</a>
	      		</c:otherwise>
	      	</c:choose>
	      </li>
	    </ul>
  </div>
</nav>
	
	
