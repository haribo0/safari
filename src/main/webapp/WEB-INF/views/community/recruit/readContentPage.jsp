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
					heartBox.classList.remove("bi-bookmark");
					heartBox.classList.add("bi-bookmark-fill");
				}else{
					heartBox.classList.remove("bi-bookmark-fill");
					heartBox.classList.add("bi-bookmark");
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

<style>

	.working_condition {
	    display: ;
	    flex-direction: row;
	    align-items: ;
	    padding: 16px 36px;
	    height: 84px;
	    background: #f8f8f8;
	    border-radius: 8px;
	}
	
	.working_condition_item {
  		color: #6a6a6a;
  		width: 61px;
    	position: ;
	}	
	.working_condition_line {
		margin: 0 16px;
	    width: 0.5px;
	    height: 12px;
	    background: #d2d2d2;
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
				<jsp:include page="../../community/communityTopNavi2.jsp"></jsp:include>
			</div>
		</div>
		<!-- 커뮤니티 메뉴바 -->
	
		<!-- 커뮤니티 컨테이너 -->
		<div class="container main_box">
			<div class="row">
			
			<!-- 왼쪽 -->
			<div class="col">
				
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
								
								<%-- 본문 카드 --%>
								<div class="card my-3">
  							      <div class="card-body">
  							     	<%-- 제목 카드 --%>
	  							    <div class="row">
										<div class="col d-grid" style="width: ;">
											<div class="" style="margin-left: 5px; margin-bottom: 6px;">
  							      				${map.userDto.nickname}
  							     			</div>
  							     			<div class="" style="margin-bottom: 0px;">
												<h3>${map.recruitDto.title }</h3>
											</div>
										</div>
									
  							   		
	  							    	<div class="col-2 text-end" style="width: ;">
	  							    	<%-- 삭제 --%>
										<c:choose>
											<c:when test="${sessionUser.id == map.userDto.id}">
												<div class="d-flex justify-content-end mt-2 me-1">
												<a href="/safari/community/recruit/updateContentPage/${map.recruitDto.id}" class="nav-link px-2 text-body-secondary"><i class="bi bi-pencil-square" style="font-size: 22px;"></i></a>
												<a href="/safari/community/recruit/deleteContentProcess/${map.recruitDto.id}" class="nav-link px-2 text-body-secondary"><i class="bi bi-eraser-fill" style="font-size: 22px;"></i></a>
												</div>
											</c:when>
										<%-- 여기에 책갈피(찜) 넣기 --%>
											<c:otherwise>
												<%-- AJAX 좋아요 --%>
												<div style="padding: 20%; background-color: ; border-radius: 20%;">
												<i id="heartBox" onclick="toggleLike()" class=" text-danger bi bi-bookmark" style="font-size: 22px;"></i>
												<span id="totalLikeCount" style="color: #6a6a6a;"></span>
												</div>
												<%-- AJAX 좋아요 --%>
												<%-- <a href="/safari/community/recruit/insertRecruitLikeProcess/${map.recruitDto.id}" class="nav-link px-2 text-body-secondary"><i class="bi bi-bookmark font-weight-bold" ></i></a> --%>
											</c:otherwise>
										</c:choose>
										<%-- 삭제 --%>
				   						
	  							    	</div>
  							    	</div>
  							    	
 							    <%-- 제목 카드 --%>
  							    <div class="row">
										<div class="col-12 d-flex align-items-center ms-2 text-secondary" style="">
							    		<i class="bi bi-eye me-1" style="font-size: 20px;"></i>
							    		${map.recruitDto.views} &nbsp
							    		<i class="bi bi-clock me-1" style="font-size: 16px;"></i>
							    		<fmt:formatDate value="${map.recruitDto.reg_date}" pattern="yyyy.MM.dd"/>
							    		</div>
						    		</div>
								<%-- 제목 카드 --%>
								
								<hr>
								<div class="row">
								<div class="col" style="width: 950px;">
									<div class="working_condition">
										<div class="row">
										
										<%-- 직무 --%>
										<div class="col" style="width: 310px;">
											<span class="working_condition_item" style="">직무</span> 
											<span class="text-secondary ms-3" id="positionName"></span>
											<script>
											 // 시작
											    var positionCode = ${map.recruitDto.position_category_id};

											    // 직무 코드에 따라 직무명 설정
											    var positionName;
											    switch (positionCode) {
											        case 11:
											            positionName= "사무";
											            break;
											        case 12:
											            positionName= "연구";
											            break;
											        case 13:
											            positionName= "기술";
											            break;
											        case 14:
											            positionName= "영업";
											            break;
											        
											        case 21:
											            positionName= "서비스";
											            break;
											        case 22:
											            positionName= "예술";
											            break;
											        case 23:
											            positionName= "스포츠";
											            break;
											        
											        case 31:
											            positionName= "보건";
											            break;
											        case 32:
											            positionName= "교육";
											            break;
											        case 33:
											            positionName= "금융";
											            break;

											        case 41:
											            positionName= "물류";
											            break;
											        case 42:
											            positionName= "생산";
											            break;
											        
											        default:
											            positionName= "기타";
											            break;
											    }

											    // 결과를 화면에 출력
											    document.getElementById("positionName").textContent = positionName;
												// 끝
											</script>
										</div>
										<div class="col" style="width: 310px;">
											<span class="working_condition_item" style="">급여</span>
											<span class="text-secondary ms-3"> ${map.recruitDto.salary } 만원</span>
										</div>
										<%-- 직무 --%>
										
										<%-- 경력 --%>
										<div class="col" style="width: 310px;">
											<span class="working_condition_item" style="">경력</span>
											<c:choose>
												<c:when test="${map.recruitDto.career < 1}">
												<span class="text-secondary ms-3">신입</span>
												</c:when>
												<c:when test="${map.recruitDto.career >= 1}">
												<span class="text-secondary ms-3"> ${map.recruitDto.career }년 이상</span>
												</c:when>
												<c:otherwise>
												<span class="text-secondary ms-3">무관</span>
												</c:otherwise>
											</c:choose>
										</div>
										<%-- 경력 --%>
										</div>
										
										<div class="row mt-2">
										<div class="col" style="width: 310px;">
											<span class="working_condition_item" style="">인원</span>
											<span class="text-secondary ms-3"> ${map.recruitDto.opening } 명</span>
										</div>
										
										<%-- 지역 --%>
										<div class="col" style="width: 310px;">
											<span class="working_condition_item" style="">지역</span>
											<span class="text-secondary ms-3" id="locationName"></span>
											<script>
											// 서버로부터 받은 지역 코드
											if (typeof ${map.recruitDto.location} === 'number') {
												console.log("a"); // 결과 출력
												
												 // 시작
											    var locationCode = ${map.recruitDto.location};

											    // 지역 코드에 따라 지역명 설정
											    var locationName;
											    switch (locationCode) {
											        case 1:
											            locationName = "서울";
											            break;
											        case 2:
											            locationName = "경기";
											            break;
											        case 3:
											            locationName = "인천";
											            break;
											        case 4:
											            locationName = "강원";
											            break;
											        case 5:
											            locationName = "대전";
											            break;
											        case 6:
											            locationName = "세종";
											            break;
											        case 7:
											            locationName = "충남";
											            break;
											        case 8:
											            locationName = "충북";
											            break;
											        case 9:
											            locationName = "부산";
											            break;
											        case 10:
											            locationName = "울산";
											            break;
											        case 11:
											            locationName = "경남";
											            break;
											        case 12:
											            locationName = "경북";
											            break;
											        case 13:
											            locationName = "대구";
											            break;
											        case 14:
											            locationName = "광주";
											            break;
											        case 15:
											            locationName = "전남";
											            break;
											        case 16:
											            locationName = "전북";
											            break;
											        case 17:
											            locationName = "제주";
											            break;
											        default:
											            locationName = "전국";
											            break;
											    }

											    // 결과를 화면에 출력
											    document.getElementById("locationName").textContent = locationName;
												// 끝
											} else {
												console.log("b"); // 결과 출력 
												
												//시작
												var locationName = '${map.recruitDto.location}';
												document.getElementById("locationName").textContent = locationName;
												//끝
											}
											</script>
											<%-- 지역 --%>
										</div>
										<div class="col" style="width: 310px;">
											<span class="working_condition_item" style="">성별</span>
											<%-- 성별 --%>
											<c:choose>
												<c:when test="${map.recruitDto.gender == 1}">
												<span class="text-secondary ms-3">남자</span>
												</c:when>
												<c:when test="${map.recruitDto.gender == 2}">
												<span class="text-secondary ms-3">여자</span>
												</c:when>
												<c:otherwise>
												<span class="text-secondary ms-3">무관</span>
												</c:otherwise>
											</c:choose>
											<%-- 성별 --%>
										</div>
										</div>
									</div>
								</div>
								</div>
								
								<div class="row">
								<div class="col ms-2 me-2 mt-3">
								${map.recruitDto.content }<br>
								</div>
								</div>
								

								<div class="row">
								<div class="col ms-2 me-2 mt-3">
								<%-- <c:forEach items="${map.recruitImgLinkDtoList}" var="recruitImgLinkDto">
									<img src="/uploadFiles/${recruitImgLinkDto.img_link}"><br>
								</c:forEach> --%>
								</div>
								</div>
								
								
								<%-- 좋아요 --%>
								<%--<div>
								<br>
								<input type="button" onclick='location.href="/safari/community/recruit/insertRecruitLikeProcess/${map.recruitDto.id}"' value="좋아요"/>
								${RecruitBoardLikeCount} 
								
								<!-- 버튼 태그로 변경 
							    <button type="button" id="likeButton" class="btn btn-primary">좋아요</button>
							    ${RecruitBoardLikeCount} -->
							    <!-- 버튼 태그로 변경 -->
								</div>--%>
								<%-- 좋아요 --%>
								
								</div>
								</div>
								<%-- 본문 카드 --%>
							
								
								
								
															
															<br><h5>입사지원</h5>
															<div class="card my-3">
							  							      <div class="card-body">
							  							      <div class="row my-3 mx-2">
							  							      
							  							       <div class="col-3 me-2">
																<c:forEach items="${map.recruitImgLinkDtoList}" var="recruitImgLinkDto">
																	<img src="/uploadFiles/${recruitImgLinkDto.img_link}" class="img-fluid"><br>
																</c:forEach>
							  							      	</div>
							  							      
							  							      <div class="col ms-3 me-2 mt-4">
							  							      <div class="row">
							  							       <div class="col mb-3">
							  							       <strong>${map.userDto.nickname }</strong>에서 여러분을 기다립니다.
							  							       
							  							       </div>
							  							       </div>
							  							      <div class="row">
							  							       <div class="col">
							  							        <i class="bi bi-telephone-fill me-1 mb-3"></i> ${map.recruitDto.phone }<br>
																<i class="bi bi-envelope-fill me-1" style="font-size: 17px;"></i> ${map.recruitDto.email }<br>
							  							       </div>
							  							       </div>
							  							     
							  							      </div>
							  							      </div>
															
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
			<div class="col">
				<img class="img-fluid mt-4 ms-3" src="https://tpc.googlesyndication.com/simgad/3289037124705836352" alt="...">
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