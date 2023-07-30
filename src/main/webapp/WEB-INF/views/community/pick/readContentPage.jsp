<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사파리 | 골라줘요 상세보기</title>

<!-- 메타 섹션 -->
<jsp:include page="../../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->

<script>


	//좋아요

	//PathVariable
	//const pickId = new URLSearchParams(location.search).get("id");
	//const pathParts = window.location.pathname.split('/');
	//const path = window.location.pathname;
	//const parts = path.split('/');
	//const pick_id = parts[parts.length - 1]; 
	//const pickId = parseInt(pathParts[pathParts.length - 1], 10);
	
	const pathParts = window.location.pathname.split('/');
	const pick_id = pathParts[pathParts.length - 1]; 
	
	console.log("pick_id:", pick_id);
	
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
		xhr.open("get", "${pageContext.request.contextPath}/community/pick/getMyId", false);
		
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
		xhr.open("get", "${pageContext.request.contextPath}/community/pick/getTotalLikeCount?pick_id=" + pick_id);
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
		xhr.open("get", "${pageContext.request.contextPath}/community/pick/toggleLike?pick_id=" + pick_id);
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
		xhr.open("get", "${pageContext.request.contextPath}/community/pick/isLiked?pick_id=" + pick_id);
		xhr.send();
		
	}

	
		////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//댓글
		function registerComment(){
		
		if(!mySessionId) {
			// 로그인 안되었있으니까...
			return;
		}
		
		const commentTextBox = document.getElementById("commentTextBox");
		const commentTextValue = commentTextBox.value; 
		
		const xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				const response = JSON.parse(xhr.responseText);
				// js 작업..
				commentTextBox.value = "";
				reloadCommentList();
			}
		}
		
		//post
		xhr.open("post", "${pageContext.request.contextPath}/community/pick/registerComment");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); 
		xhr.send("pick_id=" + pick_id + "&content=" + commentTextValue);
		
	}
	
	function reloadCommentList(){
		const xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				const response = JSON.parse(xhr.responseText);
				
				document.getElementById("commentListBox").innerHTML = ""; //초기화 얘만 innerHTML 허용... 
				
				for(map of response.commentList){
					const row1 = document.createElement("div");
					row1.classList.add("row");
					row1.classList.add("commentOuter");
					row1.setAttribute("commentId" , map.pickCommentDto.id);
					
					
					const colCommentBox = document.createElement("div");
					colCommentBox.classList.add("commentBox");
					colCommentBox.classList.add("col-8");
					colCommentBox.classList.add("bg-primary");
					colCommentBox.innerText = map.pickCommentDto.content; // 데이터 세팅
					row1.appendChild(colCommentBox);

					const colNickname = document.createElement("div"); 					
					colNickname.classList.add("col-2");
					colNickname.classList.add("bg-secondary");
					colNickname.innerText = map.userDto.nickname; // 데이터 세팅
					row1.appendChild(colNickname);
					
					if(mySessionId != null && map.pickCommentDto.user_id){
						const colDelete = document.createElement("div");
						colDelete.classList.add("col-1");
						colDelete.innerText = "삭제";
						colDelete.setAttribute("onclick", "deleteComment("+map.pickCommentDto.id+")");
						row1.appendChild(colDelete);
						
						const colUpdate = document.createElement("div");
						colUpdate.classList.add("col-1");
						colUpdate.innerText = "수정";
						colUpdate.setAttribute("onclick", "changeInputForUpdateComment(this)");
						
						row1.appendChild(colUpdate);
					}
					
					document.getElementById("commentListBox").appendChild(row1);
				}
				
				
			}
		}
		
		//get
		xhr.open("get", "${pageContext.request.contextPath}/community/pick/getCommentList?pick_id=" + pick_id);
		xhr.send();
	}	
	
	function deleteComment(id){
		const xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				const response = JSON.parse(xhr.responseText);
				// js 작업..
				reloadCommentList();
			}
		}
		
		//get
		xhr.open("get", "${pageContext.request.contextPath}/community/pick/deleteComment?id=" + id);
		xhr.send();
		
	}
	
	
	function changeInputForUpdateComment(targetElement){
		
		const commentOuter = targetElement.closest(".commentOuter"); // 부모중에 css 접근자 문법에 맞는 엘리먼트를 가져온다.
		
		// const commentBox = commentOuter.getElementsByClassName("commentBox")[0];
		const commentBox = commentOuter.querySelector(".commentBox");
		
		const tempValue = commentBox.innerText;
		
		commentBox.innerHTML = "";
		
		const inputTextComment = document.createElement("input");
		inputTextComment.type = "text"
		//inputTextComment.classList.add("form-control");
		inputTextComment.classList.add("commentInputBox");
		inputTextComment.value = tempValue;
		commentBox.appendChild(inputTextComment);
		
		const inputButtonUpdate = document.createElement("button");
		inputButtonUpdate.innerText = "수정 적용";
		inputButtonUpdate.setAttribute("onclick" , "updateComment(this)");
		commentBox.appendChild(inputButtonUpdate);
		
		
		
		targetElement.innerText = "수정취소";
		targetElement.setAttribute("onclick", "cancelUpdate(this)");
	}
	
	function updateComment(targetElement){
		
		const commentOuter = targetElement.closest(".commentOuter");
		
		const commentId = commentOuter.getAttribute("commentId");
		console.log("commentId:", commentId);
		const commentText = commentOuter.querySelector(".commentInputBox").value;
		
		const xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				const response = JSON.parse(xhr.responseText);
				// js 작업..
				reloadCommentList();
			}
		}
		
		//post
		xhr.open("post", "${pageContext.request.contextPath}/community/pick/updateComment");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); 
		xhr.send("id=" + commentId + "&content=" + commentText);
				
		
	}
	
	
	
	//사실상 시작 시점...
	window.addEventListener("DOMContentLoaded", function(){
		
		getSessionId();
		refreshTotalLikeCount();
		refreshMyHeart();
		reloadCommentList();
		
		//setInterval(reloadCommentList, 5000);
		
	});
</script>

<style>
	/* 이미지 크롭 */
	 .cropped-image {

	   object-fit: cover;
	 }
	 

/*투표*/


    .custom-button {
    position: relative; /* 자식 요소의 위치를 설정하기 위해 필요 */
    width: 213px; /* 버튼의 너비 설정 */
    height: 40px; /* 버튼의 높이 설정 */
    background-color: white; /* 초기 회색 배경 색상 */
    border-radius: ; /* 둥근 테두리 설정 */
    overflow: hidden; /* 넘어가는 부분은 숨김 */
    padding: 0; /* 버튼의 내부 padding을 없애서 내부로 프로그래스 바가 들어가도록 함 */
  }

  .custom-progress {
  	padding: 0;
 	margin: 0;
    position: absolute; /* 버튼 내부에서 절대 위치로 설정 */
    top: 0;
    left: 0;
    height: 40px;
    max-width: 213px;
    border-radius: ;
    background-color: red; /* 파란색으로 채워질 색상 */
    opacity: 0.6; /* 퍼센트에 따라 채워지는 영역의 투명도 설정 */
  }
  
   .vote-text {
    position: relative;
    display: flex;
    align-items: center;
    justify-content: center;
    height: 100%;
    font-weight: bold;
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
	<!--		<div class="col">
				
			</div> -->
			<!-- 왼쪽 -->
			
			<!-- 가운데 -->
			<div class="col" >
				<div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-center">
					
					<%-- pickBoardList --%>
					<div class="row">
						<div class="col" style="width:990px;"> 
						
							<%-- 골라줘요 본문--%>
								<div class="align-middle " style="text-align:start">
							
									<div class="ms-2 me-2">
										<hr>
									</div>
									
									<div class="ms-3 me-4 mb-4">
									<%-- 골라줘요 제목--%>
									<div class="row">
										<div class="col-9">
										
											<span class="badge rounded-pill text-bg-dark mt-2 me-1 mb-3" style="padding: 6px 10px; font-size: 16px;">골라줘요</span> 
											<span class="fw-bold " style="font-size: 22px;">${map.pickDto.title}</span> 
											
										</div>
										
										
										<div class="col d-grid me-1">
											<div style="display: flex; justify-content: flex-end;">  
											<c:choose>
												<c:when test="${sessionUser.id == map.userDto.id}">
													<a href="/safari/community/pick/updateContentPage/${map.pickDto.id}" class="nav-link px-2 text-body-secondary"><i class="bi bi-pencil-square"></i></a>
													<a href="/safari/community/pick/deleteContentProcess/${map.pickDto.id}" class="nav-link px-2 text-body-secondary"><i class="bi bi-eraser-fill"></i></a>
												</c:when>
											<%-- 여기에 책갈피(찜) 넣기 --%>
												<c:otherwise>
													
													<%-- AJAX 좋아요 --%>
														<!-- <hr>
														<a href="/safari/community/pick/insertPickLikeProcess/${map.pickDto.id}" class="nav-link px-2 text-body-secondary"><i class="bi bi-bookmark font-weight-bold" ></i></a>
														
														<i id="heartBox" onclick="toggleLike()" class="fs-1 text-danger bi bi-heart"></i>
														<span id="totalLikeCount"></span> -->
														
														<div style="padding: ; background-color: ; border-radius: ;">
														<i id="heartBox" onclick="toggleLike()" class=" text-danger bi bi-bookmark" style="font-size: 22px;"></i>
														<span id="totalLikeCount" style="color: #6a6a6a;"></span>
														</div>
													<%-- AJAX 좋아요 --%>
												</c:otherwise>
											</c:choose>
											</div>
										</div>
										
										
									</div>
									
									
									<div class="row">
										<div class="col text-secondary ms-2 me-1" style="font-size: 16px;">
											<span class="text-secondary me-1" style="font-size: 16px;">${map.userDto.nickname }</span>
											<i class="bi bi-eye me-1" style="font-size: 18px;"></i>
								    		${map.pickDto.views} &nbsp
								    		<i class="bi bi-clock me-1" style="font-size: 14px;"></i>
								    		<fmt:formatDate value="${map.pickDto.reg_date}" pattern="yyyy.MM.dd"/>
											
										</div>
									</div>
									<%-- 골라줘요 제목--%>
									</div>
									
									<div class="ms-2 me-2">
										<hr>
									</div>
									
									<br>
									
									<div class="ms-3 me-4 mb-2">
									<%-- 골라주세요 상세 내용 --%>
									<div class="row">
										<div class="col fs-5 fw-bold">
											
										</div>
									</div>	
										
									<div class="row">
										<div class="col mb-2">
											${map.pickDto.content}
										</div>
									</div>	
									<%-- 골라주세요 상세 내용 --%>
									
									<%-- 골라주세요 옵션 foreach --%>
									<div class="row">
										<div class="col mt-3 ms-1 fs-5 fw-bold">
											투표하기 <i class="bi bi-reception-4"></i>
										</div>
									</div>	
									
									
										<div class="row">
											<c:forEach items="${map.pickOptionValuesForVoteDtoList }" var="pickOptionValuesForVoteDto">
												  <div class="col-md-3 mt-2 mb-5">
												  <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-center" >
												  <div class="card">
												    <div class="d-felx justify-content-center">
												    <img class="img-fluid cropped-image" src="/uploadFiles/${pickOptionValuesForVoteDto.img }" 
												    class="rounded mx-auto d-block" alt="..." style="width: 200px; height: 250px;">
												     <div class="card-body">
												     
												        <h6 class="card-title text-body-secondary mb-1">${pickOptionValuesForVoteDto.title }</h6>
												        
												        <div class="row">
													        <div class="col">
													        	<span class="card-text mb-2">${pickOptionValuesForVoteDto.price }원 </span>
													        </div>
												        
													        <div class="col d-flex align-items-center justify-content-end">
													        	<i class="bi bi-heart me-1"></i>${pickOptionValuesForVoteDto.product_zzim_count }
													        </div>
												        
												        </div>
												        
												        
												        
												        <div class="text-center d-grid mt-3">
												        	<a href="/safari/used/productDetail?productId=${pickOptionValuesForVoteDto.product_id }" class="btn btn-sm btn-outline-primary"><i class="bi bi-box-arrow-up-right"></i> 상세 보기</a>
												        </div>
												        
												  	  </div>
												   	 </div>
												    </div>
												    
												    <%-- 투표 --%>
												    <%-- <a href="/safari/community/pick/voteProcess?pick_id=${map.pickDto.id }&pick_option_id=${pickOptionValuesForVoteDto.option_id}" class="btn btn-outline-secondary rounded-pill btn-sm mt-4" style="width: 250px;">
												    ${map.totalVoteCount == 0 ? 0 : pickOptionValuesForVoteDto.vote_cnt/map.totalVoteCount * 100}% VOTE (${pickOptionValuesForVoteDto.vote_cnt })
												    </a> --%>
												    <%-- 투표 --%>
												    
												    <%-- 투표2 --%>
													<!-- 투표 버튼 --> <!-- 퍼센트 값을 반영하여 채워지는 영역 --><!-- 퍼센트 값을 계산한 후 정수로 변환하여 출력 -->
													<%--<a href="/safari/community/pick/voteProcess?pick_id=${map.pickDto.id}&pick_option_id=${pickOptionValuesForVoteDto.option_id}" class="custom-button btn btn-outline-secondary rounded-pill mt-4 ">
													  
													   
													    <div class="custom-progress rounded-pill" style="margin-left: 0px; width: ${map.totalVoteCount == 0 ? 0 : Math.round((pickOptionValuesForVoteDto.vote_cnt / map.totalVoteCount) * 100)}%;"></div>
													  
													</a>
													
													
													<span id="votePercentage_${map.pickDto.id}">
													  ${map.totalVoteCount == 0 ? 0 : Math.round((pickOptionValuesForVoteDto.vote_cnt / map.totalVoteCount) * 100)}% VOTE (${pickOptionValuesForVoteDto.vote_cnt})
													</span>--%>
													
												    <%-- 투표2 --%>
												    
												    <%-- 투표3 --%>
												    <a href="/safari/community/pick/voteProcess?pick_id=${map.pickDto.id}&pick_option_id=${pickOptionValuesForVoteDto.option_id}" class="custom-button btn btn-outline-secondary rounded-pill mt-4">
													  <!-- 퍼센트 값을 반영하여 채워지는 영역 -->
													  <div class="custom-progress" style="width: ${map.totalVoteCount == 0 ? 0 : Math.round((pickOptionValuesForVoteDto.vote_cnt / map.totalVoteCount) * 100)}%;"></div>
													  <span class="vote-text" style="font-size: 16px; color: secondary;">
													    <!-- 퍼센트 값을 계산한 후 정수로 변환하여 출력 -->
													    ${map.totalVoteCount == 0 ? 0 : Math.round((pickOptionValuesForVoteDto.vote_cnt / map.totalVoteCount) * 100)}%  
													    ${pickOptionValuesForVoteDto.vote_cnt}표
													    <i class="bi bi-check-lg"></i>
													      
													  </span>
													</a>
												    <%-- 투표3 --%>
												    
												    
												    
												    
												    
												    </div>
												  </div>
											</c:forEach>
										</div>
									<%-- 골라주세요 옵션 foreach --%>
										

										
										<%-- 해시태그 --%>
										<div class="mt-3">
											<button type="button" class="btn btn-outline-secondary rounded-pill btn-sm">#해시태그</button>
											<button type="button" class="btn btn-outline-secondary rounded-pill btn-sm">#해시태그</button>
											<button type="button" class="btn btn-outline-secondary rounded-pill btn-sm">#해시태그</button>	
										</div>
										<%-- 해시태그 --%>
									</div>
									
									
								</div>
								<%-- 골라줘요 본문--%>
						
						<%-- 좋아요 
						<br>
						<div style="text-align: center; font-size: 18px;">
						 <button onclick='location.href="/safari/community/pick/insertPickLikeProcess/${map.pickDto.id}"' style="background: none; border: none; padding: 0;">
							<i id="likeIcon" class="bi-heart${PickBoardLikeCount > 0 ? "-fill" : ""}" style="color: red;"></i>
 							 </button>
						<span style="color: grey;">${PickBoardLikeCount}</span>
						</div>--%>
						<%-- 좋아요 --%>
						
						<div class="ms-2 me-2">
							<hr>
						</div>
						
						
						<%-- 목록으로 버튼 --%>
						<div class="row">
							<div class="col text-end d-grid align-middle ms-4 me-4 mb-4">
								<a href="/safari/community/pick/mainPage" class="nav-link px-2 text-body-secondary"> 목록으로 </a>  
							</div>
						</div>
						<%-- 목록으로 버튼 --%>
						
							
							
							<%-- AJAX 댓글 --%>
							<%-- <div class="container">
								<div class="row">
									<div class="col-7">
										<textarea id="commentTextBox" class="form-control"></textarea>
									</div>
									<div class="col d-grid">
										<input onclick="registerComment()" class="btn btn-primary" type="button" value="댓글 작성">
									</div>
								</div>
								<div class="row">
									<div id="commentListBox" class="col">
										<div class="row commentOuter">
											<div class="commentBox col-8 bg-primary">내용..</div>
											<div class="col bg-secondary">닉네임..</div>
											<div class="col bg-success">삭제</div>
											<div class="col bg-warning">수정</div>
										</div>			
									</div>
								</div>
							</div>
							AJAX 댓글 --%>
					
								<%-- 댓글작성 --%>
								<div class="row">
								<div class="col">
								
								</div>
								</div>
								<%-- 댓글작성 --%>
								
								<div class="align-middle ms-4 me-4 mb-4" style="text-align:start">
								<%-- 댓글 폼 --%>
								<form action="/safari/community/pick/writeCommentProcess/${map.pickDto.id}" method="post">
									<%-- <input type="hidden" name="user_id" value="${sessionUser.id}">--%>
									<input type="hidden" name="pick_id" value="${map.pickDto.id}">
									
									
									<div class="row mt-2">
									<div class="col-1 text-center">
										<c:if test="${!empty sessionUser}">
								          <a href="#" class="d-block link-body-emphasis text-decoration-none" aria-expanded="false">
								            <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle">
								          </a>		        	
							        	</c:if>
									</div>
									<div class="col-10">
										<input type="text" class="form-control" name="content">
									</div>
										<div class="col d-grid">
											<button class="btn btn-secondary" type="submit"><i class="bi bi-chat-text"></i></button>
											</div>
									</div>
								</form>
								<%-- 댓글 폼 --%>
								
								<%-- 댓글 조회 --%>
								<div class="row">
								<div class="col mx-2">
								<br>
								
								<c:forEach items="${pickCommentsList}" var="pickCommentDto">
								<form action="/safari/community/pick/deleteCommentProcess/${pickCommentDto.pickCommentDto.id}" method="post">
									
									<%-- 댓글 프로필 --%>
									<div class="d-flex align-items-center">
										<a href="#" class="d-block link-body-emphasis text-decoration-none ml-2 me-1" aria-expanded="false">
									    <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle">
									    </a>&nbsp;
									<span class="fw-bold ml-2" style="font-size: 15px">${pickCommentDto.userDto.nickname}</span>&nbsp;
									
									<span class="text-muted ml-2 mb-1" style="color: grey; font-size: 12px; font-family: 'Noto Sans', sans-serif;">|&nbsp;<fmt:formatDate value="${pickCommentDto.pickCommentDto.reg_date}" pattern="yyyy.MM.dd HH:mm"/>
									</span>
									</div>
									<%-- 댓글 프로필 --%>
									
									<input type="hidden" value="${pickCommentDto.pickCommentDto.id}" name="id"> <%-- 댓글의 ID --%>
									<input type="hidden" value="${map.pickDto.id}" name="pick_id"> <%-- 게시글의 ID --%>
									
									<%-- 임시
									<div style="display: flex; align-items: center; margin-left: 28px; white-space: normal;">
									  <input type="text" class="form-control border-0 bg-transparent" value="${pickCommentDto.pickCommentDto.content}" style="box-shadow: none; caret-color: transparent; flex-grow: 1; margin-right: -5px;">
									  <button style="background: none; border: none; padding: 0; margin-right: 10px;margin-right: 10px;"> <i class="bi bi-backspace-fill" style="color: black;"></i> </button>
									</div>--%>
									
									<div style="display: flex; align-items: center; margin-left: 28px; word-wrap: break-word;">
									  <input type="text" class="form-control border-0 bg-transparent" value="${pickCommentDto.pickCommentDto.content}" style="box-shadow: none; caret-color: transparent; flex-grow: 1; margin-right: -5px;">
									
									  <c:if test="${ pickCommentDto.userDto.id == sessionUser.id }">
									  	<button style="background: none; border: none; padding: 0; margin-right: 10px;"> <i class="bi bi-backspace-fill" style="color: black;"></i> </button>
									  </c:if>
									  
									</div>


									<hr>
									
								</form>
								</c:forEach>
								</div>
								</div>
								<%-- 댓글 조회 --%>
								</div>
								
							
								
						</div>	
					</div>	
					<%-- pickBoardList --%>
						
				</div>	
			</div>
			<!-- 가운데 -->
			
			
			<!-- 오른쪽 -->
			<div class="col">
				<img class="img-fluid ms-3 mt-3" src="https://apple.contentsfeed.com/RealMedia/ads/Creatives/jobkorea/230718_seoul_al_ssky/230718_seoul_120600.png" alt="...">
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