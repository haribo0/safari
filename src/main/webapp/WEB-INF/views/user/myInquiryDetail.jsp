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
				
			</div>
			
			
			<!-- 테이블 헤더 -->
			<div class="row py-4 text-center border-bottom ">
				<div class="col-auto">
					<a href="./myInquiryPage" class="text-dark text-decoration-none">
						<i class="bi bi-chevron-left"></i> 목록으로
					</a>
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
											${qna.qna_title}
										</div>
									</div>
									<div class="row ">
										<div class="col text-secondary" style="font-size: 14px" >
											<span class="me-3">${qna.userDto.nickname}</span>
											<span class="">
												<fmt:formatDate value="${qna.reg_date}" pattern="yyyy-MM-dd" />
											</span>
										</div>
									</div>
								</div>
							</div>
							
							
							
							<div class="row py-5 border-bottom">
								<div class="col" >
									${qna.qna_content}
								</div>
							</div>
							
							
							<!-- <div class="row py-5 border-bottom">
								<div class="col" >
									이 사람의 최근 주문 리스트
								</div>
							</div> -->
							
							
							<c:if test="${!empty qna.qna_reply}">
								<div class="row pt-4 mb-2">
									<div class="col-auto ms-1" >
										답변완료
									</div>
									<div class="col" >
										${qna.empDto.nickname}
									</div>
								</div>
								<div class="row bg-light mx-2 py-4 px-3 rounded">
									<div class="col "  >
										${qna.qna_reply}
									</div>
								</div>
								
							</c:if>
							
						
						
						
						
						
						
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