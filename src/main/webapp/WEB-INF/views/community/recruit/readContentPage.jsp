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

<script>


	//좋아요
	
	const pathParts = window.location.pathname.split('/');
	const recruit_id = pathParts[pathParts.length - 1]; 
	
	console.log("recruit_id:", recruit_id);
	
	function ajaxTemplete(){
		
		const xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				const response = JSON.parse(xhr.responseText);
				// js 작업..
			}
		}
		
		//get
		xhr.open("get", "요청 url?파라메터=값");
		xhr.send();
		
		//post
		xhr.open("post", "요청 url");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); 
		xhr.send("파라메터=값");
	}
	
	let mySessionId = null;
	
	function getSessionId(){
		const xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				const response = JSON.parse(xhr.responseText);
				// js 작업..
				if(response.result == "success"){
					mySessionId = response.id; 
					console.log("mySessionId:", mySessionId);
				}
			}
		}
		
		//get
		//xhr.open("get", "${pageContext.request.contextPath}/user/getMyId", false); // 딱 여기만 쓰세요...false 동기식 호출..! 권장되지 않음
		xhr.open("get", "${pageContext.request.contextPath}/community/recruit/getMyId", false);
		
		xhr.send();		
	}
	
	function refreshTotalLikeCount(){
		const xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				const response = JSON.parse(xhr.responseText);
				// js 작업..
				const totalLikeCountBox = document.getElementById("totalLikeCount");
				console.log("totalLikeCount:", totalLikeCount);
				totalLikeCountBox.innerText = response.count;
			}
		}
		
		
		
		//get
		xhr.open("get", "${pageContext.request.contextPath}/community/recruit/getTotalLikeCount?recruit_id=" + recruit_id);
		xhr.send();		
	}
	
	function toggleLike(){
		if(mySessionId == null){
			if(confirm("로그인을 하셔야 이용하실 수 있습니다. 로그인 하시겠습니까?")){
				location.href = "${pageContext.request.contextPath}/user/loginPage";
			}
			
			return;
		}
		
		const xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				const response = JSON.parse(xhr.responseText);
				// js 작업..
				refreshTotalLikeCount();
				refreshMyHeart();
			}
		}
		
		//get
		xhr.open("get", "${pageContext.request.contextPath}/community/recruit/toggleLike?recruit_id=" + recruit_id);
		xhr.send();
		
	}
	
	function refreshMyHeart(){
		
		if(mySessionId == null) return;
		
		
		const xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				const response = JSON.parse(xhr.responseText);
				// js 렌더링... 작업..
				const heartBox = document.getElementById("heartBox");
				
				if(response.isLiked){
					heartBox.classList.remove("bi-heart");
					heartBox.classList.add("bi-heart-fill");
				}else{
					heartBox.classList.remove("bi-heart-fill");
					heartBox.classList.add("bi-heart");
				}
			}
		}
		
		//get
		xhr.open("get", "${pageContext.request.contextPath}/community/recruit/isLiked?recruit_id=" + recruit_id);
		xhr.send();
		
	}

	
	
	
	//사실상 시작 시점...
	window.addEventListener("DOMContentLoaded", function(){
		
		getSessionId();
		refreshTotalLikeCount();
		refreshMyHeart();
		
		//setInterval(reloadCommentList, 5000);
		
	});
</script>

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
  							      <div class="" style="margin-left: 5px; margin-bottom: 6px;">
  							      ${map.userDto.nickname}
  							      </div>
  							    <div class="" style="margin-bottom: 40px;">
								<h3>${map.recruitDto.title }</h3>
								</div>
								
								<hr>
								${map.recruitDto.content }<br>

								

								
								<c:forEach items="${map.recruitImgLinkDtoList}" var="recruitImgLinkDto">
									<img src="/uploadFiles/${recruitImgLinkDto.img_link}"><br>
								</c:forEach>
								
								<div>
								<%-- 좋아요 
								
								<br>
								<input type="button" onclick='location.href="/safari/community/recruit/insertRecruitLikeProcess/${map.recruitDto.id}"' value="좋아요"/>
								${RecruitBoardLikeCount} --%>
								
								<!-- 버튼 태그로 변경 
							    <button type="button" id="likeButton" class="btn btn-primary">좋아요</button>
							    ${RecruitBoardLikeCount} -->
							    <!-- 버튼 태그로 변경 -->
							    
							    <%-- AJAX 좋아요 --%>
								<i id="heartBox" onclick="toggleLike()" class="fs-1 text-danger bi bi-heart"></i>
								<span id="totalLikeCount"></span>
								<%-- AJAX 좋아요 --%>
							  
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
							
							<%-- 삭제 --%>
							<c:choose>
								<c:when test="${sessionUser.id == map.userDto.id}">
									<a href="/safari/community/recruit/updateContentPage/${map.recruitDto.id}" class="nav-link px-2 text-body-secondary"><i class="bi bi-pencil-square"></i></a>
									<a href="/safari/community/recruit/deleteContentProcess/${map.recruitDto.id}" class="nav-link px-2 text-body-secondary"><i class="bi bi-eraser-fill"></i></a>
								</c:when>
							<%-- 여기에 책갈피(찜) 넣기 --%>
								<c:otherwise>
									<a href="/safari/community/recruit/insertRecruitLikeProcess/${map.recruitDto.id}" class="nav-link px-2 text-body-secondary"><i class="bi bi-bookmark font-weight-bold" ></i></a>
								</c:otherwise>
							</c:choose>
							<%-- 삭제 --%>
								
								
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