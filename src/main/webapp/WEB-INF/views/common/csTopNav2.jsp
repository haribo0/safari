<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>




<nav class="navbar navbar-expand navbar-dark bg-dark">
  <div class="container-fluid">
    <a href="./mainPage" class="navbar-brand">
      <img class="img-fluid my-2 ms-4 me-3" width="74px" src="/safari/resources/img/logopng1.png">
    </a>
    
    <a class="navbar-brand" href="#">고객관리서비스</a>
    
    <!-- 왼쪽 메뉴 -->
    <ul class="navbar-nav  me-auto mb-lg-0">
      <c:if test="${!empty empUser && empUser.master == 1}">
      
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
      <!-- <li class="nav-item">
        <a class="nav-link" href="#">메뉴1</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">메뉴2</a>
      </li> -->
      <li class="nav-item me-3">
        <c:choose>
	          <c:when test="${!empty empUser}">
	            <a href="${pageContext.request.contextPath}/cs/logoutProcess" class="nav-link">로그아웃</a>
	          </c:when>
	          <c:otherwise>
	            <a href="${pageContext.request.contextPath}/cs/loginPage" class="btn btn-dark me-2">로그인</a>
	          </c:otherwise>
        </c:choose>
      </li>
    </ul>
  </div>
</nav>


<div class="row mt-5 mb-5">
<div class="col"> </div>
</div>