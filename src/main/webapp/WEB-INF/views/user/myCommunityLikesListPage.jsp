<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 메타 섹션 -->
<jsp:include page="../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 --> 
</head>
<body>
<!-- 헤더 섹션 -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->
	
	<!-- 마이페이지 상단 블럭 -->
	<jsp:include page="../common/myPageTop.jsp"></jsp:include>
	<!-- 마이페이지 상단 블럭 -->

	<div class="container d-flex mt-5 px-0">
		<div class="row w-100">
			<!-- 마이페이지 nav -->
			<jsp:include page="../common/myPageNav.jsp"></jsp:include>
			<!-- 마이페이지 nav -->
			
			<!--  Body -->
			<div class="col ms-4">
				<div class="row" style="border-bottom: 2px solid #222; height: 48px;">
					<div class="col p-0">				
						<h5>좋아요 리스트</h5>		
					</div>
				</div>	
			
			<!--  들어갈 내용 -->
				<div class = "row mt-3">
					<div class = "col">
						
					</div>
				</div>









			</div>

		</div>
	</div> <!--  <div class="container d-flex mt-5 px-0"> 마지막 -->
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

</body>
</html>