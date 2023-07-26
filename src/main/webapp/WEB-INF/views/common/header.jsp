<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.orangeButton{
	background: #ff6f0f;
	font-weight: bold;
	color: white;
}
.orangeButton:hover{
	background: #FF812C;
	font-weight: bold;
	color: white;
}


</style>
 <script>
 
 </script>

<c:if test="${empty sessionUser}">
	<div class="container-fluid bg-body-secondary d-flex justify-content-center align-items-center py-3" style="background-color: ">
		지금 가입하여 혜택을 누려보세요! <a class="btn btn-outline-dark py-1 mx-4" href="${pageContext.request.contextPath}/user/joinPage">가입하기</a>
	</div>
</c:if>

<div class="container-fluid px-0 bg-white sticky-top" style="z-index: 100;">
	<header class="py-3 mt-1">
	    <div class="container px-0">
	      <!-- <div class="d-flex flex-wrap align-items-center justify-content-around justify-content-lg-start"> -->
	      <div class="d-flex flex-wrap justify-content-lg-between align-items-center">
	      	<div class="d-flex align-items-center">
	      		<h1 class="me-5"><a href="${pageContext.request.contextPath}/main/mainPage" class="btn px-0">
	      		<img src="/safari/resources/img/logo0.png" width="100px" style="position: relative; top: 4px;">
	      		</a></h1>
	      		
	      		 <ul class="nav justify-content-center mx-3 fw-medium"  style="font-size: 20px;">
		          <li class="me-4"><a href="${pageContext.request.contextPath}/used/mainPage" class="px-2 link-body-emphasis" 
		        >중고</a></li>
		          <li class="me-4"><a href="${pageContext.request.contextPath}/rental/introMainPage" class="px-2 link-body-emphasis"
		          >대여</a></li>
		          <li class="me-4"><a href="${pageContext.request.contextPath}/auction/mainPage" class="px-2 link-body-emphasis"
		           >경매</a></li>
		          <li class="me-3"><a href="${pageContext.request.contextPath}/community/mainPage" class="px-2 link-body-emphasis"
		          >커뮤니티</a></li>
	      		</ul>
	      		
	      	</div>
	      	
	      	<div class="d-flex flex-wrap" >
	      		
	      		<form class="col-12 col-lg-auto me-lg-4" role="search">
		          <input type="search" class="form-control rounded-pill search_box" placeholder="검색" aria-label="Search">
		        </form>
		         <c:choose>
	           		<c:when test="${!empty sessionUser}">
	           			<div class="row">
	           				<div class="col fw-medium mt-1" style="font-size: 18px;">
	           					<a class="dropdown-item nav-link link-body-emphasis" href="${pageContext.request.contextPath}/user/myPage">마이페이지</a>
	           				</div>
	           				<div class="col fw-medium mt-1" style="font-size: 18px;">
	           					<a href="${pageContext.request.contextPath}/user/userLogoutProcess"  class="dropdown-item nav-link link-body-emphasis px-2" >로그아웃</a>
	           				</div>
	           				<div class="col">
					        	<c:if test="${!empty sessionUser}">
						          <a href="#" class="d-block link-body-emphasis text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
						            <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle">
						          </a>		        	
					        	</c:if>
					          <ul class="dropdown-menu text-small">
					            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/user/myPage">마이페이지</a></li>
					            <li><hr class="dropdown-divider"></li>
					            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/user/userLogoutProcess">로그아웃</a></li>
					          </ul>
						        </div>
	           				</div>
	  
	           		</c:when>
	           		<c:otherwise>
	        			<a href="${pageContext.request.contextPath}/user/loginPage" class="btn btn-outline-secondary me-2">로그인</a>
	        			<a href="${pageContext.request.contextPath}/user/joinPage" class="btn orangeButton me-3">회원가입</a>
	           		</c:otherwise>
	           	</c:choose>
	            	
		        
	        </div>
	        
	      </div>
	    </div>
	    

	  </header>
 </div>
 


 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>