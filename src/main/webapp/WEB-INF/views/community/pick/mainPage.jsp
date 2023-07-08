<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사파리 | 골라줘요 메인</title>

<!-- 메타 섹션 -->
<jsp:include page="../../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->

<style>
    .table tr {
        height: 50px; /* Adjust the height as needed */
        
    }
 </style>

</head>
<body>
		<!-- 헤더 섹션 -->
		<div class="row">
			<div class="col">
				<jsp:include page="../../common/header.jsp"></jsp:include>
			</div>
		</div>
		<!-- 헤더 섹션 -->
	
		<!-- 커뮤니티 메뉴바 -->
		<div class="row">
			<div class="col">
				<jsp:include page="../../community/communityTopNavi.jsp"></jsp:include>
			</div>
		</div>
		<!-- 커뮤니티 메뉴바 -->
	
		<!-- 커뮤니티 컨테이너 -->
		<div class="container main_box">
			<div class="row">
			
			<!-- 왼쪽 -->
			<div class="col" style="background-color:lightgrey;" >
				왼쪽
			</div>
			<!-- 왼쪽 -->
			
			<!-- 가운데 -->
			<div class="col-9">
				<div class="align-items-center justify-content-center justify-content-lg-center"> 
					
					<%-- pickBoardList --%> 
					<div class="row"  style="text-align:center">
						<div class="col">
							
							<%-- 글쓰기버튼 --%>
							<div class="row">
								<div class="col text-end pe-5">
									<c:if test="${!empty sessionUser }">
										<a href="/safari/community/pick/writeContentPage" class="btn btn-default px-2 text-body-secondary">글쓰기</a>
									</c:if>
								</div>
							</div>
							<%-- 글쓰기버튼 --%>
								
								
								<%-- 골라줘요 항목 foreach --%>
								<c:forEach items="${pickBoardList}" var="pickDto">				
								<div class="align-middle ms-4 me-4 mb-4" style="text-align:start">
								<hr>
									
									<div class="ms-2 me-2" style="font-size: 14px;">
									
									<div class="row">
										<div class="col">
										<span class="badge rounded-pill text-bg-dark mt-2 me-1 mb-3" style="padding: 6px 10px; font-size: 16px;">골라줘요</span> 
										 ${pickDto.userDto.nickname}
										| <i class="bi bi-clock mt-2" style="font-size: 12px;"></i> <fmt:formatDate value="${pickDto.pickDto.reg_date}" pattern="yyyy.MM.dd"/>
										| views&nbsp;👀 · ${pickDto.pickDto.views}
										</div>
										
										<div class="col">
										</div>
									</div>
									
									<br>
									
									<div class="ms-2 me-2">
										<a class="text-black text-decoration-none" href="/safari/community/pick/readContentPage/${pickDto.pickDto.id}" >
										${pickDto.pickDto.id}
										</a>
										||
										<a class="text-black text-decoration-none" href="/safari/community/pick/readContentPage/${pickDto.pickDto.id}">
										${pickDto.pickDto.content}</a>
									<br>
									</div>
										
										<%-- 해시태그 --%>
										<div class="mt-3">
											<button type="button" class="btn btn-outline-secondary rounded-pill btn-sm">#해시태그</button>
											<button type="button" class="btn btn-outline-secondary rounded-pill btn-sm">#해시태그</button>
											<button type="button" class="btn btn-outline-secondary rounded-pill btn-sm">#해시태그</button>	
										</div>
										<%-- 해시태그 --%>
									</div>
								</div>
								</c:forEach>	
								<%-- 골라줘요 항목 foreach --%>
							
						</div>	
					</div>	
					<%-- pickBoardList --%>
						
				</div>	
			</div>
			<!-- 가운데 -->
			 
			
			<!-- 오른쪽 -->
			<div class="col" style="background-color:lightgrey;">
				오른쪽
			</div>
			<!-- 오른쪽 -->
			
			</div>
		</div>
		<!-- 커뮤니티 컨테이너 -->
	
	
	   
		<!-- 푸터 섹션 -->
		<div class="row">
			<div class="col">
				<jsp:include page="../../common/footer.jsp"></jsp:include>
			</div>
		</div>
		<!-- 푸터 섹션 -->	

</body>
</html>