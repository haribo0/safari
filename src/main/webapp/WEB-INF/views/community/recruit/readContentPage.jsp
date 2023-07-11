<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사파리 | 해주세요 상세보기</title>

<!-- 메타 섹션 -->
<jsp:include page="../../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->

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
			<div class="col" style="background-color:lightgrey;">
				왼쪽
			</div>
			<!-- 왼쪽 -->
			
			<!-- 가운데 -->
			<div class="col" >
				<div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-center">
					
					<%-- recruitBoardList --%>
					<div class="row">
						<div class="col" style="width:990px;">
							<%--	<input type="hidden" name="user_id" value="${sessionUser.id}">
								작성자: ${sessionUser.nickname}<br>
								제목: <input type="text" name="title"><br>
								내용: <br>
								<textarea rows="10" cols="60" name="content"></textarea>
								<br>
								포인트: <input type="text" name="points"> 
								위치: <input type="text" name="location"> --%>
								
								<%-- 제목 --%>
								
								<div class="card my-3">
  							      <div class="card-body">
								<h3>${map.recruitDto.title }</h3><br>
								${map.recruitDto.content }<br>

								

								
								<c:forEach items="${map.recruitImgLinkDtoList}" var="recruitImgLinkDto">
									<img src="/uploadFiles/${recruitImgLinkDto.img_link}"><br>
								</c:forEach>
								
								<%-- 좋아요 --%>
								<div>
								<br>
								<input type="button" onclick='location.href="/safari/community/recruit/insertRecruitLikeProcess/${map.recruitDto.id}"' value="좋아요"/>
								${RecruitBoardLikeCount} 
								</div>
								<%-- 좋아요 --%>
								
								</div>
								</div>
								<%-- 제목 --%>
								<br>
								<h5>모집조건</h5>
								<div class="card my-2">
  							      <div class="card-body">
								
								직업(숫자): ${map.recruitDto.position_category_id }<br>
								모집인원: ${map.recruitDto.opening }명<br>
								
								급여: ${map.recruitDto.salary }만원<br>
								성별: ${map.recruitDto.gender }<br>
								나이제한: 만 &nbsp${map.recruitDto.age_limit }세<br>
								
								위치: ${map.recruitDto.location }<br>
								등록일: <fmt:formatDate value="${map.recruitDto.reg_date}" pattern="yyyy.MM.dd"/><br>
								<br>
								</div>
								</div>
								
															
															<br><h5>입사지원</h5>
															<div class="card my-2">
							  							      <div class="card-body">
															작성자: ${map.userDto.nickname }<br>
															연락처: ${map.recruitDto.phone }<br>
															이메일: ${map.recruitDto.email }<br>
															</div>
															</div>
								
							<%-- 목록으로 버튼 --%>
							<div class="row">
								<div class="col text-end ms-auto d-grid">
									<a href="/safari/community/recruit/mainPage" class="nav-link px-2 text-body-secondary"> 목록으로 </a>
									<c:if test="${!empty sessionUser && sessionUser.id == data}">
									</c:if>
								</div>
							</div>
							<%-- 목록으로 버튼 --%>
								
								
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
		<div class="row">
			<div class="col">
				<jsp:include page="../../common/footer.jsp"></jsp:include>
			</div>
		</div>
		<!-- 푸터 섹션 -->	

</body>
</html>