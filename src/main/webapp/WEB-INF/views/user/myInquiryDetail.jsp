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
					<a href="./myInquiryPostPage" class="btn btn-dark btn-sm px-5">문의 작성</a>
				</div>
			</div>
			
			<!-- <div class="row mt-4">
				
			</div> -->
			
			<!-- 테이블 헤더 -->
			<div class="row mt-5 py-3 text-center fw-bolder border-bottom border-top">
				<div class="col-1">
					#			
				</div>
				<div class="col-2">
					카테고리	
				</div>
				<div class="col-7">
					제목			
				</div>
				<div class="col-2">
					작성일				
				</div>
			</div>
			
			<!-- <hr class="m-0 p-0"> -->

			
			<div id="inquiryListContainer">
			
				<!-- 글 상세보기 -->
					<div class="row ps-5 pe-3  border-left">
						<div class="col" id="inquiryDetailContainer">
						
						
						
							<div class="row border-bottom py-4">
								<div class="col" >
									
									<div class="row">
										<div class="col fs-5 my-2 fw-medium" >
											대여 주문 했는데 배송 날짜를 조정하고 싶어요.
										</div>
									</div>
									<div class="row ">
										<div class="col text-secondary" style="font-size: 14px" >
											<span class="me-3">닉네임</span>
											<span class="">10시간 전</span>
										</div>
									</div>
								</div>
							</div>
							
							
							
							<div class="row py-5 border-bottom">
								<div class="col" >
									대여 주문 했는데 배송 날짜를 조정하고 싶어요.
									아직 배송 전인데 가능할까요? 
								</div>
							</div>
							
							
							<div class="row py-5 border-bottom">
								<div class="col" >
									이 사람의 최근 주문 리스트
								</div>
							</div>
							
							
							<div class="row pt-4">
								<div class="col fs-5 ms-1" >
									답변 작성
								</div>
							</div>
							<div class="row py-2">
								<div class="col" >
									<textarea class="form-control txtInput" rows="5" id="qnaReply" name="qna_reply" placeholder="답글을 입력해주세요" ></textarea>
								</div>
							</div>
							<div class="row pt-2 pb-5 border-bottom">
								<div class="col text-end" >
									<div class="btn btn-dark" onclick="saveQnaReply(qnaId)">작성 완료</div>
								</div>
							</div>
							
							
						
						
						
						
						
						
						</div>
					</div>
					<!-- 글 상세보기 -->
				
				
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



window.addEventListener("DOMContentLoaded", function(){
	
});
</script>
</body>	
</html>