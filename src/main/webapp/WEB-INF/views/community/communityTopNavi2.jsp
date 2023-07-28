<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<script>
    // 현재 페이지의 주소를 가져오는 함수
    function getCurrentPageUrl() {
        return window.location.href;
    }

    // 링크가 현재 페이지와 같으면 스타일을 변경하는 함수
    function updateLinkColor(linkId) {
        var currentPageUrl = getCurrentPageUrl();
        var linkElement = document.getElementById(linkId);

        if (linkElement.href === currentPageUrl) {
            linkElement.style.color = "#387538";
            linkElement.classList.add("fw-semibold");
        } else {
            linkElement.style.color = "#A9A9A9";
            linkElement.classList.remove("fw-semibold");
        }
    }

    // 링크의 ID와 현재 페이지의 주소를 비교하여 스타일을 변경
    document.addEventListener("DOMContentLoaded", function () {
        updateLinkColor("pickLink");
        updateLinkColor("helpLink");
        updateLinkColor("questionLink");
        updateLinkColor("recruitLink");
        updateLinkColor("promotionLink");
    });
</script>
<body>
<!-- 메타 섹션 -->
<jsp:include page="../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->

<!--  body -->
<div class = "container main_box">
	<div class = "row mt-5">
		<div class = "col-auto">
			<h1 class="text-start fs-3 fw-semibold">
				<a href="/safari/community/mainPage" style="text-decoration: none; color: inherit;">
					<b>커뮤니티</b>
				</a>		 
			</h1>	
		</div>	
		<div class="col mx-3 mb-5 d-flex align-items-center">
		    <div class="row text-start" style="position: relative; top: 10px">
		        <div class="col">
		            <a id="pickLink" href="${pageContext.request.contextPath}/community/pick/mainPage" style="text-decoration: none;">골라줘요</a>
		            <div class="vr mx-3"></div>
		            <a id="helpLink" href="${pageContext.request.contextPath}/community/help/mainPage" style="text-decoration: none;">해주세요</a>
		            <div class="vr mx-3"></div>
		            <a id="questionLink" href="${pageContext.request.contextPath}/community/question/mainPage" style="text-decoration: none;">궁금해요</a>
		            <div class="vr mx-3"></div>
		            <a id="recruitLink" href="${pageContext.request.contextPath}/community/recruit/mainPage" style="text-decoration: none;">구인구직</a>
		            <div class="vr mx-3"></div>
		            <a id="promotionLink" href="${pageContext.request.contextPath}/community/promotion/promotionReviewMainPage" style="text-decoration: none;">리워드 리뷰</a>
		        </div>
		    </div>
		</div>
	</div>
</div>
</body>
</html>