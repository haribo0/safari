<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사파리 | 구인구직 메인</title>

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
					
					<%-- recruitBoardList --%>
					<div class="row"  style="text-align:center">
						<div class="col">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>글번호</th>
										<th>기업명(작성자)</th>
										<th>공고제목</th>
										<th>근무지역</th>
										<th>급여</th>
										<th>조회수</th>
										<th>등록일</th>
									</tr>	
								</thead>
								<tbody>
								<c:forEach items="${recruitBoardList}" var="recruitDto">							
									<tr class="align-middle">
										<td><a class="text-black text-decoration-none" href="/safari/community/recruit/readContentPage/${recruitDto.recruitDto.id}" >
										${recruitDto.recruitDto.id}
										</a></td>
										<td>${recruitDto.userDto.nickname}</td>
										<td><a class="text-black text-decoration-none" href="/safari/community/recruit/readContentPage/${recruitDto.recruitDto.id}">
										${recruitDto.recruitDto.title}</a></td>
										<td>${recruitDto.recruitDto.location}</td>
										<td>${recruitDto.recruitDto.salary}</td>
										<td>${recruitDto.recruitDto.views}</td>
										<td><fmt:formatDate value="${recruitDto.recruitDto.reg_date}" pattern="yyyy.MM.dd"/></td>
									</tr>
								</c:forEach>	
								</tbody>
							</table>
							 
							<%-- 글쓰기버튼 --%>
							<div class="row">
								<div class="col text-end pe-5">
									<c:if test="${!empty sessionUser }">
										<a href="/safari/community/recruit/writeContentPage" class="btn btn-default px-2 text-body-secondary">글쓰기</a>
									</c:if>
								</div>
							</div>
							<%-- 글쓰기버튼 --%>
							
						</div>	
					</div>	
					<%-- recruitBoardList --%>
						
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
		<di v class="row">
			<div class="col">
				<jsp:include page="../../common/footer.jsp"></jsp:include>
			</div>
		</div>
		<!-- 푸터 섹션 -->	

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>