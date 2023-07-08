<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사파리 | 로그인</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<style>
  body {
    display: flex;
    flex-direction: column;
    min-height: 100vh;
  }
  
  .content {
    flex: 1;
  }
  
  .footer {
    flex-shrink: 0;
  }
</style>


</head>
<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../common/csTopNav2.jsp"></jsp:include>
	<!-- 헤더 섹션 -->
	
	<div class="container d-flex justify-content-center content">
		<form action="loginProcess" method="post">
			
		    <div class="row " >
		        <div class="col">
		        </div>
		        <div class="col-10">
		        
		        	  <div class="row my-2" >
				        <div class="col d-grid">
				        	
			        	</div>
				      </div>
		        	  <div class="row " >
				        <div class="col  d-grid">
				        	<div class="row " >
					          <div class="col fw-bold fs-4 d-grid">
					          	  사파리
				        	  </div>
					        </div>
				        	<div class="row " >
					          <div class="col fs-5 d-grid">
					          	  고객관리서비스
				        	  </div>
					        </div>
			        	</div>
				      </div>
		        
		        	 <div class="row mt-5 mb-1" >
				        <div class="col-sm-12">
				          <label for="uid" class="form-label">아이디</label>
				          <input type="text" class="form-control" id="uid" placeholder="" value="" required="" name="username">
				          <div class="invalid-feedback">
				            아이디를 입력해주세요.
				          </div>
				        </div>
				
				        <div class="col-sm-12 mt-4">
				          <label for="upw" class="form-label">비밀번호</label>
				          <input type="password" class="form-control" id="upw" placeholder="" value="" required="" name="password">
				          <div class="invalid-feedback">
				            비밀번호를 입력해주세요.
				          </div>
				        </div>
				        
				      </div>
				      
				      <div class="row mt-5" >
				        <div class="col d-grid">
				        	<button class="btn btn-dark">로그인</button>
			        	</div>
				      </div>
		        	  
		        	  
		        	  <div class="row my-5" >
				        <div class="col d-grid">
				        	
			        	</div>
				      </div>
		        
		        </div>
		        <div class="col">
		        </div>
	        </div>
		        
		   
		</form>		
		

	      
	</div>
	
			
	<div class="row mt-5 justify-content-center">

        <!-- <div class="col-sm-6" style="max-width: 320px; cursor: pointer;">
        	<a href="#">
        		<img class="img-fluid" src="/safari/resources/img/kakao_login_large_wide.png"  alt="">
        	</a>
        </div> -->

        
    </div>
	
	
<%-- 	<div class="d-flex justify-content-center my-5" style="max-width: 480px;">
	    <c:if test="${!empty empUser && empUser.mater == 1}">
     		<a href="./joinPage" class="btn btn-primary text-center">직원추가</a>	
	    </c:if>
	</div> --%>
	
	
	
	
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>



<script >


function ajaxTemplate() {

	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
		}
	}



	// post 방식 
	xhr.open("post", "url");
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.send("params");

}








</script>




</body>	
</html>