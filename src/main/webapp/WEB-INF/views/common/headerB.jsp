<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- 
<div class="container-fluid bg-body-secondary d-flex justify-content-center align-items-center py-3">
	지금 가입하여 혜택을 누려보세요! <a class="btn btn-outline-dark py-1 mx-4" href="${pageContext.request.contextPath}/rental/businessRegisterPage">가입하기</a>
</div>
 --%>

<div class="container">
	<header class="p-3">
	    <div class="container">
	      <div class="d-flex flex-wrap justify-content-lg-between align-items-center">
	      	<div class="d-flex align-items-center">
	      		<div class="col-2 ms-0 "><a href="./mainPage" class="btn"><img class="img-fluid" width="800px" src="/safari/resources/img/logo2.png"></a></div>
	      		<h1 class="me-5"></h1>
	      		
	      	</div>
	      	
	      	<div class="d-flex flex-wrap">

		        
		        <ul class="nav justify-content-center mx-3">
		        <!-- 
		          <li class="me-4"><a href="#" class="nav-link px-2 link-body-emphasis">중고</a></li>
		          <li class="me-4"><a href="#" class="nav-link px-2 link-body-emphasis">대여</a></li>
		          <li class="me-4"><a href="#" class="nav-link px-2 link-body-emphasis">경매</a></li>
		           -->
		           <c:if test="${!empty businessUser}">
		           		<li class="me-3"><a href="./myInfoPage" class="nav-link px-2 link-body-emphasis">
		           			&nbsp; ${businessUser.business_name} 님 
		           		</a></li>
		           </c:if>
		          
		        </ul>
		
		         <c:choose>
	           		<c:when test="${!empty businessUser}">
	           			<a href="${pageContext.request.contextPath}/rental/businessLogoutProcess" class="text-secondary mt-2 text-opacity-50 text-decoration-none">로그아웃</a>
	           		</c:when>
	           		<c:otherwise>
	        			<a href="${pageContext.request.contextPath}/rental/businessLoginPage" class="btn btn-dark me-2">로그인</a>
	           		</c:otherwise>
	           	</c:choose>
	            	
		        <div class="dropdown text-end">
		        	<%-- <c:if test="${!empty businessUser}">
			          <a href="#" class="d-block link-body-emphasis text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
			            <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle">
			          </a>		        	
		        	</c:if> --%>
		          <%-- <ul class="dropdown-menu text-small">
		            <li><hr class="dropdown-divider"></li>
		            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/rental/logoutPageProcess">로그아웃</a></li>
		          </ul> --%>
		        </div>
	        </div>
	        
	      </div>
	    </div>
	    

	  </header>
 </div>
 <div class="container-fluid border-bottom mb-5">
 </div>