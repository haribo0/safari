<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사파리 | 메인</title>
<!-- 메타 섹션 -->
<jsp:include page="../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->
<style>
.btn-qna{position: fixed; bottom: 80px; right: 70px; background-color: #f5f5f5; width: 68px; height: 68px; border-radius: 50%; display: flex; justify-content: center; align-items: center; font-size: 3rem; cursor: pointer;}
.coin-box{position: relative;}
.coin-box::before {content: ''; width:1px; height: 60%; background: #5e5e5e; display:block; position: absolute; top: 50%; transform:translateY(-50%); left: 0px;}
</style>
</head>
<body>

<div class="btn-qna shadow-lg">
<i class="bi bi-question-circle"></i>
</div>

	<!-- 헤더 섹션 -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->
	
	<!-- 마이페이지 상단 블럭 -->
	<jsp:include page="../common/myPageTop.jsp"></jsp:include>
	<!-- 마이페이지 상단 블럭 -->
	
	<div class="container d-flex mt-5 px-0">
		<div class="row w-100">
		<!-- 마이페이지 nav-->
		<jsp:include page="../common/myPageNav.jsp"></jsp:include>
		<!-- 마이페이지 nav-->
			
			
			
		<!-- Body -->
		<div class="col ms-4">
			<div class="row" style="border-bottom: 2px solid #222; height: 48px;">
				<div class="col p-0">
					<h5>1대1 문의</h5>						
				</div>
				<div class="col text-end">
					<!-- <div class="btn btn-dark btn-sm px-5">문의 작성</div>	 -->	
				</div>
			</div>
			
			
			
		
			<!-- input -->
			<!-- card -->
			<form action="./postInquiry" method="post" id="frm">
			
			<div class="row mt-4 py-3 fw-bolder">
				<div class="col-1 ms-1">
					<label class="col-form-label" for="category_id">카테고리</label>
				</div>
				<div class="col-2">
					<select class="form-select" name="category_id" aria-label="Default select example">
					  <option selected>카테고리 선택</option>
					  <option value="1">중고</option>
					  <option value="2">대여</option>
					  <option value="3">경매</option>
					  <option value="4">기타</option>
					</select>
				</div>
			</div>
			<div class="row py-3 fw-bolder">
				<div class="col-1">
					<label class="col-form-label" for="qna_title">문의 제목</label>
				</div>
				<div class="col-7">
					<input type="text" class="form-control" id="qna_title" name="title">
				</div>
				
			</div>
			<div class="row py-3 text-center fw-bolder">
				<div class="col-1">
					<label class="col-form-label" for="content">문의 내용</label>
				</div>
				<div class="col">
					<textarea class="form-control" id="exampleFormControlTextarea1" rows="8"></textarea>
				</div>
			</div>
			<div class="row py-3 text-center fw-bolder">
				<div class="col text-end">
					<div class="btn btn-dark">작성완료</div>
				</div>
			</div>
			
			</form>
			<!-- card -->
			<!-- input -->	
		</div>
			
			
			
			
			
			
			
			
		</div>
		<!-- Body -->
		
		</div>
	</div>
		
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>


function submitForm (){
	
	const categoryId = document.getElementById("category_id").value;
	const title = document.getElementById("qna_title").value.trim();
	const content = document.getElementById("qna_content").value.trim();
	
	if( categoryId<1 || categoryId > 4) {
		document.getElementById("category_id").focus();
		return;
	}
	if(!title || title.length<2) {
		document.getElementById("qna_title").focus();
		return;
	}
	if(!content || content.length<10) {
		document.getElementById("qna_content").focus();
		return;
	}
	
	inquiry = {
			"category_id" : categoryId,
			"qna_title" : title,
			"qna_content" : qna_content
	};
	
	
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			location.href = "./myInquiryPage";
			
		}
	}
	
	xhr.open("post", "./postInquiry");
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.send(JSON.stringify(inquiry));
}





window.addEventListener("DOMContentLoaded", function(){
	
	
	
});
</script>
</body>	
</html>