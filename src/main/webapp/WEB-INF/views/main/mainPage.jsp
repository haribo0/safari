<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사파리 | 메인 </title>
<!-- 메타 섹션 -->
<jsp:include page="../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->
</head>
<body>
   <!-- 헤더 섹션 -->
   <jsp:include page="../common/header.jsp"></jsp:include>
   <!-- 헤더 섹션 -->
	<div class="container">
      <div class="row p-1">
        <div class="col text-center">
          <img class="img-fluid" alt="" src="${pageContext.request.contextPath}/resources/img/main/mainBanner.png">
        </div>
      </div>
   </div>	
	<div class="container mt-4">
		<div class="row p-1 pb-0">
        <div class="col fs-4 fw-semibold">
         	SAFARI
        </div>
        <div class="col-1 text-end fs-6 fw-semibold">
         	
        </div>
      </div>
      <div class="row p-1 mt-1">
        <div class="col-4 text-center">
          <a href="/safari/used/mainPage"><img class="img-fluid" alt="" src="${pageContext.request.contextPath}/resources/img/main/mainUsed1.png"></a>
        </div>
        <div class="col-4 text-center">
          <a href="/safari/rental/mainPage"><img class="img-fluid" alt="" src="${pageContext.request.contextPath}/resources/img/main/mainRental.png"></a>
        </div>
        <div class="col-4 text-center">
          <a href="/safari/auction/mainPage"><img class="img-fluid" alt="" src="${pageContext.request.contextPath}/resources/img/main/mainAuction1.png"></a>
        </div>
      </div>
   </div>	
   
    <div class="container mt-5">
      <div class="row p-1 pb-0">
        <div class="col fs-4 fw-semibold">
         	유저들의 대여 리뷰
        </div>
        <div class="col-1 text-end fs-6 fw-semibold">
         	더보기
        </div>
      </div>
   </div>
   <div class="container mt-0">
      <div class="row p-1">
        <div class="col text-center">
        	<a href="/safari/community/promotion/promotionReviewMainPage">
          <img class="img-fluid" alt="" src="${pageContext.request.contextPath}/resources/img/main/commu2.png">
          	</a>
        </div>
      </div>
   </div>
   
   
   <div class="container mt-4">
      <div class="row p-1">
      
        <div class="col text-center">
          <img class="img-fluid" alt="" src="${pageContext.request.contextPath}/resources/img/main/darkGray.png">
        </div>
      </div>
   </div>
    
   <div class="container mt-5">
      <div class="row p-1">
        <div class="col fs-4 fw-semibold">
         	커뮤니티
        </div>
        <div class="col-1 text-end fs-6 fw-semibold my-auto">
         	<a href="/safari/community/mainPage">더보기</a>
        </div>
      </div>
      <div class="row p-1 mb-5">
        <div class="col-3">
        	<div class="row">
        		<div class="col">
        		<a href="/safari/community/mainPage" class="text-decoration-none">
        		<img class="img-fluid" alt="" src="${pageContext.request.contextPath}/resources/img/main/CommuSelect.jpeg">
        		</a>
        		</div>
        	</div>
        	<div class="row">
        		<div class="col ms-1 mt-2" style="font-size: 14px; color: #787070;">
        			샌들? 운동화? 무엇을 살지
        		</div>
        	</div>
        	<div class="row">
        		<div class="col fw-semibold ms-1">
        			골라줘요
        		</div>
        	</div>
        </div>
        <div class="col-3">
        	<div class="row">
        		<div class="col">
        		<a href="/safari/community/help/mainPage" class="text-decoration-none">
        		<img class="img-fluid" alt="" src="${pageContext.request.contextPath}/resources/img/main/CommuGo.jpeg">
        		</a>
        		</div>
        	</div>
        	<div class="row">
        		<div class="col ms-1 mt-2 text-secondory" style="font-size: 14px; color: #787070">
        			나에게는 능력자가 필요해!
        		</div>
        	</div>
        	<div class="row">
        		<div class="col fw-semibold ms-1">
        			해주세요
        		</div>
        	</div>
        </div>
        <div class="col-3">
        	<div class="row">
        		<div class="col">
        		<a href="/safari/community/question/mainPage" class="text-decoration-none">
        		<img class="img-fluid" alt="" src="${pageContext.request.contextPath}/resources/img/main/CommuWhat.jpeg">
        		</a>
        		</div>
        	</div>
        	<div class="row">
        		<div class="col ms-1 mt-2 text-secondory" style="font-size: 14px; color: #787070">
        			이건 뭐지? 저건 뭐지? 세상에 궁금투성이
        		</div>
        	</div>
        	<div class="row">
        		<div class="col fw-semibold ms-1">
        			궁금해요
        		</div>
        	</div>
        </div>
        <div class="col-3">
        	<div class="row">
        		<div class="col">
        		<a href="/safari/community/recruit/mainPage" class="text-decoration-none">
        		<img class="img-fluid" alt="" src="${pageContext.request.contextPath}/resources/img/main/CommuHiring.jpeg">
        		</a>
        		</div>
        	</div>
        	<div class="row">
        		<div class="col ms-1 mt-2 text-secondory" style="font-size: 14px; color: #787070">
        			오직 일자리를 찾는 사람들을 위한 모든 것
        		</div>
        	</div>
        	<div class="row">
        		<div class="col fw-semibold ms-1">
        			구인구직
        		</div>
        	</div>
        </div>
      </div>
   </div>
	
   
   <!-- 푸터 섹션 -->
   <jsp:include page="../common/footer.jsp"></jsp:include>
   <!-- 푸터 섹션 -->
</body>
</html>