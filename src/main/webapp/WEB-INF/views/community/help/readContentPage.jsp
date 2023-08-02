<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사파리 | 로그인</title>
<!-- 메타 섹션 -->
<jsp:include page="../../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<!-- <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"> -->
<link rel="stylesheet" href="/safari/resources/style/common.css" type="text/css">
<script>

// 현재 접속한 유저 pk
let mySessionId = null;
	
//경로에서 변수 부분 추출 (pathv~로 설정한 주소 받아오기)
const path = window.location.pathname;
const parts = path.split('/');
//해주세요 pk
const help_id = parts[parts.length - 1]; 



function ajaxTemplete() { //갖다붙이고 시작하기
	
	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			// js 작업..
		}
	}	

	//get
	xhr.open("get", "요청 url?파라미터=값");
	xhr.send();
	
	//post
	xhr.open("post", "요청 url");
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.send("파라미터=값");
}
	
	
	
function getSessionId() {
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			// js 작업..
			if(response.result == "success"){
				mySessionId = response.id;
				
			}
		}
	}	

	//get
	xhr.open("get", "/safari/user/getMyId"); //딱 여기만 쓰세요, false 동기식 호출(권장x) //여기 틀림
	xhr.send();
}
	
function refreshTotalHelpLikeCount(){
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			const totalHelpLikeCountBox = document.getElementById("totalHelpLikeCount");
			totalHelpLikeCountBox.innerText = response.count;
		}
	}
	
	
	
	
	
	xhr.open("get", "/safari/help/getTotalHelpLikeCount?help_id=" +help_id);
	xhr.send();
}
	
	

function toggleHelpLike(){
	if(!mySessionId){
		/* if(confirm("로그인을 하셔야 이용하실 수 있습니다. 로그인 하시겠습니까?")){  */
			location.href = "/safari/user/loginPage";		
			 return;
		}
		
	
	
	
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			// js 작업..
			refreshTotalHelpLikeCount();
			refreshHelpHeart();
		}
	}	

	//get
	xhr.open("get", "/safari/help/toggleHelpLike?help_id=" + help_id);
	xhr.send();
}
	
function refreshHelpHeart(){
	
	if(mySessionId == null) return;
	
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			// js 렌더링 작업..
			const heartHelpBox = document.getElementById("heartHelpBox");
			
			if(response.isHelpLiked){
				heartHelpBox.classList.remove("bi-heart");
				heartHelpBox.classList.add("bi-heart-fill");
			}else{
				heartHelpBox.classList.remove("bi-heart-fill");
				heartHelpBox.classList.add("bi-heart");
			}
		}
	}	

	//get
	xhr.open("get", "/safari/help/isHelpLiked?help_id=" + help_id);
	xhr.send();
	
	
}

function registerHelpComment(){
	
	if(!mySessionId) {
		location.href = "/safari/user/loginPage"
		return;
	}
	
	const helpCommentTextBox = document.getElementById("helpCommentTextBox");
	const helpCommentTextValue = helpCommentTextBox.value;
	
	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			helpCommentTextBox.value = "";
			reloadHelpCommentList();
		}
	}	

	
	
	//post
	xhr.open("post", "/safari/help/registerHelpComment");
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.send("help_id=" + help_id + "&content=" + helpCommentTextValue);  
	
	}
	
function formatDate(date, format) {
    var hours = date.getHours();
    var ampm = hours >= 12 ? '오후' : '오전';
    hours = hours % 12;
    hours = hours ? hours : 12; // 0시를 12시로 변경

    var patterns = {
        yyyy: date.getFullYear(),
        MM: ('0' + (date.getMonth() + 1)).slice(-2),
        dd: ('0' + date.getDate()).slice(-2),
        hh: ('0' + hours).slice(-2),
        mm: ('0' + date.getMinutes()).slice(-2),
        a: ampm
    };

    return format.replace(/yyyy|MM|dd|hh|mm|a/g, function(match) {
        return patterns[match];
    });
}


	function reloadHelpCommentList(){
		const xhr = new XMLHttpRequest();

		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				const response = JSON.parse(xhr.responseText);
				
				
				// 채택된것이 하나라도 있는가?
				let existPick = false;
				for(data of response.helpCommentList){
					if(data.helpCommentDto.status == "채택 완료"){
						existPick = true;
					}
				}
				
				
				// js 작업..렌더링...
			
				
				
				const helpCommentListBox = document.getElementById("helpCommentListBox");
				helpCommentListBox.innerHTML = ""; //초기화 얘만 innerHTML
				
				for(data of response.helpCommentList){
					const newCommentElement = document.querySelector("#templete .comment").cloneNode(true);
					
					const commentNickname = newCommentElement.querySelector(".commentNickname");
					commentNickname.innerText = data.userDto.nickname;
					
					const commentContent = newCommentElement.querySelector(".commentContent");
					commentContent.innerText = data.helpCommentDto.content;
					
				 	const commentDate = newCommentElement.querySelector(".commentDate");
					const date = new Date(data.helpCommentDto.reg_date);
					const formattedDate = formatDate(date, 'yyyy.MM.dd a hh:mm');
				    commentDate.innerText = formattedDate;
					
				    
				    // 수정 삭제 버튼 유무...
				    const commentUpdate = newCommentElement.querySelector(".commentUpdate");
				    
				    // 로그인 하지 많았거나 글쓴이가 자신이 아니면...
				    if(mySessionId == null || data.helpCommentDto.user_id != mySessionId) {
				    	commentUpdate.classList.add("d-none");
				    }
				    
			    	const commentDelete = newCommentElement.querySelector(".commentDelete");
			    	commentDelete.setAttribute("onclick", "deleteHelpComment("+data.helpCommentDto.id+")");

			    	
		    		if(mySessionId == null || mySessionId != ${map.helpDto.user_id} || data.helpCommentDto.user_id == ${map.helpDto.user_id}){
			    		const pickCol = newCommentElement.querySelector(".pickCol");
				    	pickCol.classList.add("d-none");			    		
		    		}
			    	
			    	
			    	if(existPick == true){
				    	const pickCol = newCommentElement.querySelector(".pickCol");
				    	pickCol.classList.add("d-none");
					    
			    		
			    		// 채택된 답변이면...
					    if(data.helpCommentDto.status != "채택 완료"){
				    		const pickColIcon = newCommentElement.querySelector(".pickColIcon");
				    		pickColIcon.classList.add("d-none");
					    }
			    	} else{
			    		const pickColIcon = newCommentElement.querySelector(".pickColIcon");
			    		pickColIcon.classList.add("d-none");
			    		
			    		
			    	}
			    	
			    	const pick = newCommentElement.querySelector(".pick");
			    	pick.setAttribute("onclick", "commentPick("+data.helpCommentDto.id+")");
			    	
			    	console.log(data.helpCommentDto.id);
				    
				    
					helpCommentListBox.appendChild(newCommentElement);
				}
				
				
			
				}
				}
	
	

		//get
		xhr.open("get", "/safari/help/getHelpCommentList?help_id=" + help_id);
		xhr.send();	
	
	}

	
function commentPick(id){
	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			// js 작업..
			reloadHelpCommentList();
		}
	}	

	//get
	xhr.open("get", "/safari/help/acceptHelpCommentProcess?help_comment_id=" + id );
	xhr.send();		
}
	
function deleteHelpComment(id){
	
	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			// js 작업..
			reloadHelpCommentList();
		}
	}	

	//get
	xhr.open("get", "/safari/help/deleteHelpComment?id=" + id );
	xhr.send();
}

function changeInputForUpdateHelpComment(targetElement){
	
	const helpCommentOuter = targetElement.closest(".helpCommentOuter"); // 부모 중에 css 접근자 문법에 맞는 엘리먼트를 가져온다
	
	//const helpCommentBox = helpCommentOuter.getElementsByClassName("helpCommentBox")[0];
	const helpCommentBox = helpCommentOuter.querySelector(".helpCommentBox");
	
	const tempValue = helpCommentBox.innerText;
	
	helpCommentBox.innerHTML = "";
	
	const inputTextHelpComment =  document.createElement("input");
	inputTextHelpComment.type = "text";
	//inputTextHelpComment.classList.add("form-control");
	inputTextHelpComment.classList.add("helpCommentInputBox");
	inputTextHelpComment.value = tempValue;
	helpCommentBox.appendChild(inputTextHelpComment);
	
	const inputButtonUpdateHelpComment = document.createElement("button");
	inputButtonUpdateHelpComment.innerText = "수정 적용";
	inputButtonUpdateHelpComment.setAttribute("onclick", "updateHelpComment(this)");
	helpCommentBox.appendChild(inputButtonUpdateHelpComment)
	
	targetElement.innerText = "수정취소";
	targetElement.setAttribute("onclick", "cancelUpdateHelpComment(this)");
	
}

function updateHelpComment(targetElement){
	
	const helpCommentOuter = targetElement.closest(".helpCommentOuter");
	
	const help_id = helpCommentOuter.getAttribute("help_id");
	const helpCommentText = helpCommentOuter.querySelector(".helpCommentInputBox").value;
	
	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			// js 작업..
			reloadHelpCommentList();
		}
	}	
	
	//post
	xhr.open("post", "/safari/help/updateHelpComment");
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.send("id=" + help_id + "&content=" +helpCommentText );
}

function cancelUpdateHelpComment(targetElement){
	//구현..
	console.log("....")
	
}

	
window.addEventListener("DOMContentLoaded", function(){
	//사실상 시작 시점
	getSessionId();
	refreshTotalHelpLikeCount();
	refreshHelpHeart();
	reloadHelpCommentList();
});



</script>
</head>
<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->


	<div class="row mt-5">
		<div class="col"></div>


		<%-- 내용 공간 --%>
		<div class="col-8">
			<div class="container">
				<div class="row" style="margin-bottom: 7px;">
					<div class="col">

						<span class="fw-medium fs-5">${map.helpDto.title}</span>

						<c:if test="${map.helpDto.points>=1}">
							<span class="badge rounded-pill text-bg-warning opacity-75"
								style="font-size: 80%; position: relative; bottom: 2px;">
								<span class="text-black" style="font-size: 12px;">${map.helpDto.points}p</span>
							</span>
						</c:if>
						<c:if test="${map.helpDto.points==0}"></c:if>
					</div>
				</div>



				<div class="row">
					<div class="col ms-1">
						<span style="font-size: 13px; color: gray;">
							${map.userDto.nickname} &nbsp; <i class="bi bi-eye"></i>
							${map.helpDto.views} &nbsp; 
							<i class="bi bi-geo-alt"></i> ${map.helpDto.location} &nbsp;
							<span class="fw-semibold">${map.helpDto.status}</span>
						</span>
					</div>
					<div class="col"></div>
					<div class="col text-end">
						<span style="font-size: 0.9rem; color: gray;"><i
							class="bi bi-clock"></i> <fmt:formatDate
								value="${map.helpDto.reg_date}" pattern="yyyy-MM-dd HH:mm" /></span>
					</div>
				</div>

				<hr>


				<%--게시물 공간 --%>
			
					<div class="row">
						<div class="col">

							<%-- 글 내용/이미지 영역 --%>
							<div class="row mb-5">
								<div class="col">${map.helpDto.content }</div>
							</div>



							<c:forEach items="${map.helpImgDtoList}" var="helpImgDto">
								<div class="row mt-2">
									<div class="col">
										<img src="/uploadFiles/${helpImgDto.help_img_link}"
											style="width: 500px;">
									</div>
								</div>
							</c:forEach>
							<%-- 글 내용/이미지 영역 --%>

						</div>
					</div>
				
				<%--게시물 공간 --%>

				<%--수정/삭제/목록--%>
				<div class="row mt-4 text-end">
					<div class="col d-flex align-items-center">

						<%--ajax 좋아요 연습 --%>
						<i id="heartHelpBox" onclick="toggleHelpLike()"
							class="fs-5 text-danger bi bi-heart"></i>&nbsp;<span
							id="totalHelpLikeCount" style="font-size: 14px;"></span>
						<%--ajax 좋아요 연습 --%>



						&nbsp;
						<c:if test="${sessionUser.id == map.userDto.id }">
							<input type="button" class="btn btn-secondary"
								style="background-color: transparent; border: none; color: inherit; font-size: 14px"
								onclick="location.href='/safari/community/help/updateContentPage/${map.helpDto.id}'"
								value="수정" />
							<input type="button" class="btn btn-secondary"
								style="background-color: transparent; border: none; color: inherit; font-size: 14px"
								onclick="location.href='/safari/community/help/deleteContentProcess/${map.helpDto.id}'"
								value="삭제" />
						</c:if>
						<input type="button" class="btn btn-secondary"
							style="background-color: transparent; border: none; color: inherit; font-size: 14px"
							onclick="location.href='/safari/community/help/mainPage'"
							value="목록으로">
					</div>
				</div>
				<%--수정/삭제/목록--%>

				<hr>

				<%-- 댓글 작성 글자 --%>
				<div class="row">
					<div class="col px-0 ms-3 fw-bold">

						<i class="bi bi-chat-dots"></i>&nbsp;<span
							style="font-size: 13px;">댓글</span>
					</div>
				</div>
				<%-- 댓글 작성 글자 --%>
				
					<%--ajax 댓글 랜더링 --%>
						<div class="container">
							<div class="row mt-2 mb-1">
								<div class="col-11 px-0 mb-3 d-grid ">
								
									<textarea id="helpCommentTextBox"
										class="form-floating border p-2 mb-2 border-opacity"
										placeholder="댓글을 입력하세요" id="floatingTextarea2"
										style="height: 60px; font-size: 13px;" name="content"></textarea>
								
								</div>
								<div class="col-1 d-flex justify-content-center ">
									<button class="btn btn-secondary"
										onclick="registerHelpComment()"
										style="font-size: 22px; height: 60px; width: 68px; background-color: #ff6f0f; border: none;">
										<i class="bi bi-chat-text"></i>
									</button>
									
								</div>
								
							</div>
							
							<%--ajax 댓글 조회 랜더링(영상) --%>
							<div class="row">
							<div class="col px-0 ms-2 me-3">
								<div id="helpCommentListBox"
									class="colborder-none" >
									<div class="row helpCommentOuter mt-2">
										<div class="col-1 fw-bold">닉네임</div>
										<div class="col-3">날짜</div>
										<div class="col-1">수정</div>
										<div class="col-1">삭제</div>
										<div class="col-1">🚨</div>
									</div>
								</div>
							</div>
							</div>
						</div>
						<%--ajax 댓글 랜더링 --%>
				
							
						<!-- <div class="container">
							<div class="row mt-2">
								<div class="col-11 d-grid ">
									<textarea id="helpCommentTextBox"
										class="form-floating border p-2 mb-2 border-opacity"
										placeholder="댓글을 입력하세요" id="floatingTextarea2"
										style="height: 60px; font-size: 13px;" name="content"></textarea>

								</div>
								<div class="col d-flex justify-content-center ">
									<button class="btn btn-secondary"
										onclick="registerHelpComment()"
										style="font-size: 22px; height: 60px; width: 68px">
										<i class="bi bi-chat-text"></i>
									</button>
								</div>
							</div> -->
							<%--ajax 댓글 조회 랜더링(영상) --%>
							<!-- <div class="row">
					<div id="helpCommentListBox" class="col">
						<div class="row helpCommentOuter">
							<div class="helpCommentBox col-8 bg-primary">내용</div>
							<div class="col bg-secondary">닉네임</div>
							<div class="col bg-success">삭제</div>
							<div class="col bg-warning">수정</div>
						</div>
					</div>
				</div> -->
							<%--ajax 댓글 조회 랜더링(영상) --%>
							<!-- <div class="row">
								<div id="helpCommentListBox"
									class="col border border-1 rounded-3">
									<div class="row helpCommentOuter mt-2">
										<div class="col-1 fw-bold">닉네임</div>
										<div class="col-3">날짜</div>
										<div class="col-1">수정</div>
										<div class="col-1">삭제</div>
										<div class="col-1">🚨</div>
									</div>
								</div>
							</div>
						</div> -->
						<%--ajax 댓글 랜더링 --%>

				<%-- 1차 댓글 --%>
				<%-- <form
					action="/safari/community/help/writeCommentProcess/${map.helpDto.id}"
					method="post">
					<input type="hidden" name="user_id" value="${sessionUser.id}">
					<input type="hidden" name="help_id" value="${map.helpDto.id}">

					댓글 작성 박스
					<div class="row mt-2">
						<div class="col-11 d-grid ">
							<textarea class="form-floating border p-2 mb-2 border-opacity"
								placeholder="댓글을 입력하세요" id="floatingTextarea2"
								style="height: 60px; font-size: 13px;" name="content"></textarea>

						</div>
						<div class="col d-flex justify-content-center ">
							<button class="btn btn-secondary"
								style="font-size: 22px; height: 60px; width: 68px">
								<i class="bi bi-chat-text"></i>
							</button>
						</div>
					</div>
				</form> --%>
				<%-- 댓글 작성 박스 --%>

				<%-- 댓글 작성 -- 댓글 내용 여백--%>
				<div class="row mb-2">
					<div class="col"></div>
				</div>
				<%-- 댓글 작성 -- 댓글 내용 여백--%>

				



			</div>
		</div>

		<%-- 내용 공간 --%>
		<%-- 1차 댓글 --%>

		<div class="col"></div>

	</div>



	<div id="templete" class="d-none">

		<div class="row mb-2 comment">
			<div class="col border border-1 rounded-3">

				<!-- 댓글 내용-->
				<div class="row mt-2">
					<div class="col text-start fw-bold">
						<span style="font-size: 13px;" class="commentNickname">닉네임 공간</span>             
						<span class="text-secondary ms-2 commentDate" style="font-size: 13px; font-weight: normal;" > 날짜 공간 </span> 
						<span class="text-secondary ms-2 commentUpdate"> 					
						<input type="button" class="btn btn-sm btn-primary" value="수정"
							style="font-size: 13px; background-color: transparent; border: none; color: inherit;">
							<input type="button" class="btn btn-sm btn-primary commentDelete" value="삭제"
							style="font-size: 13px; background-color: transparent; border: none; color: inherit;">
							<%-- <c:if test="${sessionUser.id == map.userDto.id }">
								<input type="button" class="btn btn-sm btn-primary" value="신고하기"
								style="font-size: 13px; background-color: transparent; border: none; color: inherit;">
							</c:if> --%>
						</span>
						
					</div>
					<div class="col text-end">
						<div class="row">
							<div class="col pickCol">
								<!-- 동적으로 바껴야 하는 부분 -->
								<input type="button" class="pick btn mt-2 btn btn-sm" style="background: #ff6f0f; font-weight: bold; color: white;" value="채택하기">


							</div>
							<div class="col pickColIcon">

								<!--  여기에 아이콘 -->
								<i class="bi bi-check-circle"
									style="font-size: 1.3rem; color: #28a745;"></i> <span
									class="text-success mt-1"
									style="position: relative; bottom: 3px; font-size: 14px">채택
									완료</span>
							
							</div>
						</div>

					</div>
				</div>

				<div class="row mt-2">
					
					<div class="col-6 commentContent" style="margin-top: -5px; margin-bottom: 15px; font-size: 13px">
					</div>	
					
					 <div class="col text-end">
						<div class="row">

							<div class="col"></div>
						</div>

					</div>
				</div>
				<!-- 댓글 내용-->
			</div>
		</div>



	</div>









	<!-- 푸터 섹션 -->
	<jsp:include page="../../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

	<script>





</script>
</body>
</html>



