<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사파리 | 골라줘요 </title>

<!-- 메타 섹션 -->
<jsp:include page="../../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->


<!-- 스타일 섹션 -->
<style></style>
<!-- 스타일 섹션 -->

<!-- 스크립트 섹션-->
<script>


	//PathVariable
	//const pickId = new URLSearchParams(location.search).get("id");
	//const pathParts = window.location.pathname.split('/');
	//const path = window.location.pathname;
	//const parts = path.split('/');
	//const pick_id = parts[parts.length - 1]; 
	//const pickId = parseInt(pathParts[pathParts.length - 1], 10);
	
	//const pathParts = window.location.pathname.split('/');
	//const pick_id = pathParts[pathParts.length - 1]; 
	
<%--
 function createPickPk() {
	 const pick_id = document.getElementById("pickPk").value;
    const xhr = new XMLHttpRequest();
    xhr.open("GET", "${pageContext.request.contextPath}/community/pick/createPickPk");
    xhr.onreadystatechange = function() {
      if (xhr.readyState === XMLHttpRequest.DONE) {
        if (xhr.status === 200) {
          const pick_id = parseInt(xhr.responseText);
          console.log("Pick PK: " + pick_id);

          // 받은 리턴값을 여기에서 활용할 수 있습니다.
          // 예를 들어, 다른 함수 호출하거나 DOM 요소에 값을 출력할 수 있습니다.

          // ...
        } else {
          console.error("오류 발생:", xhr.status);
        }
      }
    };
    xhr.send(); 
    //const pick_id = document.getElementById("pickPk").value;
    //console.log("Pick PK: " + pick_id);
    
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			console.log("response: " + response);
			// js 작업..
			const pick_id = document.getElementById("pickPk").value;
			console.log("Pick PK: " + pick_id);
			
		}
  }
	
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
	

		////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//해시태그
		function registerHashtag(){
		
		if(!mySessionId) {
			// 로그인 안되었있으니까...
			return;
		}
		
		const hashtagTextBox = document.getElementById("hashtagTextBox");
		const hashtagTextValue = hashtagTextBox.value; 
		
		const xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				const response = JSON.parse(xhr.responseText);
				// js 작업..
				hashtagTextBox.value = "";
				reloadHashtagList();
			}
		}
		
		//post
		xhr.open("post", "${pageContext.request.contextPath}/community/pick/registerHashtag");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); 
		xhr.send("pick_id=" + pick_id + "&content=" + HashtagTextValue);
		
	}
	
	function reloadHashtagList(){
		const xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				const response = JSON.parse(xhr.responseText);
				
				document.getElementById("hashtagListBox").innerHTML = ""; //초기화 얘만 innerHTML 허용... 
				
				for(map of response.hashtagList){
					const row1 = document.createElement("div");
					row1.classList.add("row");
					row1.classList.add("hashtagOuter");
					row1.setAttribute("hashtagId" , map.pickHashtagDto.id);
					
					
					const colHashtagBox = document.createElement("div");
					colHashtagBox.classList.add("hashtagBox");
					colHashtagBox.classList.add("col-8");
					colHashtagBox.classList.add("bg-primary");
					colHashtagBox.innerText = map.pickHashtagDto.content; // 데이터 세팅
					row1.appendChild(colHashtagBox);

					const colNickname = document.createElement("div"); 					
					colNickname.classList.add("col-2");
					colNickname.classList.add("bg-secondary");
					colNickname.innerText = map.userDto.nickname; // 데이터 세팅
					row1.appendChild(colNickname);
					
					if(mySessionId != null && map.pickHashtagDto.user_id){
						const colDelete = document.createElement("div");
						colDelete.classList.add("col-1");
						colDelete.innerText = "삭제";
						colDelete.setAttribute("onclick", "deleteHashtag("+map.pickHashtagDto.id+")");
						row1.appendChild(colDelete);
						
						const colUpdate = document.createElement("div");
						colUpdate.classList.add("col-1");
						colUpdate.innerText = "수정";
						colUpdate.setAttribute("onclick", "changeInputForUpdateHashtag(this)");
						
						row1.appendChild(colUpdate);
					}
					
					document.getElementById("hashtagListBox").appendChild(row1);
				}
				
				
			}
		}
		
		//get
		xhr.open("get", "${pageContext.request.contextPath}/community/pick/getHashtagList?pick_id=" + pick_id);
		xhr.send();
	}	
	
	function deleteHashtag(id){
		const xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				const response = JSON.parse(xhr.responseText);
				// js 작업..
				reloadHashtagList();
			}
		}
		
		//get
		xhr.open("get", "${pageContext.request.contextPath}/community/pick/deleteHashtag?id=" + id);
		xhr.send();
		
	}
	
	
	function changeInputForUpdateHashtag(targetElement){
		
		const hashtagOuter = targetElement.closest(".hashtagOuter"); // 부모중에 css 접근자 문법에 맞는 엘리먼트를 가져온다.
		
		// const hashtagBox = hashtagOuter.getElementsByClassName("hashtagBox")[0];
		const hashtagBox = hashtagOuter.querySelector(".hashtagBox");
		
		const tempValue = hashtagBox.innerText;
		
		hashtagBox.innerHTML = "";
		
		const inputTextHashtag = document.createElement("input");
		inputTextHashtag.type = "text"
		//inputTextHashtag.classList.add("form-control");
		inputTextHashtag.classList.add("hashtagInputBox");
		inputTextHashtag.value = tempValue;
		hashtagBox.appendChild(inputTextHashtag);
		
		const inputButtonUpdate = document.createElement("button");
		inputButtonUpdate.innerText = "수정 적용";
		inputButtonUpdate.setAttribute("onclick" , "updateHashtag(this)");
		hashtagBox.appendChild(inputButtonUpdate);
		
		
		
		targetElement.innerText = "수정취소";
		targetElement.setAttribute("onclick", "cancelUpdate(this)");
	}
	
	function updateHashtag(targetElement){
		
		const hashtagOuter = targetElement.closest(".hashtagOuter");
		
		const hashtagId = hashtagOuter.getAttribute("hashtagId");
		console.log("hashtagId:", hashtagId);
		const hashtagText = hashtagOuter.querySelector(".hashtagInputBox").value;
		
		const xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				const response = JSON.parse(xhr.responseText);
				// js 작업..
				reloadHashtagList();
			}
		}
		
		//post
		xhr.open("post", "${pageContext.request.contextPath}/community/pick/updateHashtag");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); 
		xhr.send("id=" + hashtagId + "&content=" + hashtagText);
				
		
	}
	
	
	
	//사실상 시작 시점...
	window.addEventListener("DOMContentLoaded", function(){
		createPickPk();
		getSessionId();
		reloadHashtagList();
		//setInterval(reloadHashtagList, 5000);
	});--%>
</script>
<!-- 스크립트 섹션 -->

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
			<div class="col">
				<div class="d-flex align-items-center justify-content-center" style="width: 990px; margin: 0 auto;">
				
			
				
					<%-- getPickBoard --%>
					<div class="row">
						<div class="col" style="width: 990px; margin: 0 auto;"> 
						
						<%-- write from--%>
						<form action="/safari/community/pick/writeContentProcess" method="post">
							   
							<%-- headline --%>
							<div class="row">
								
								<div class="col-10">
									<strong style="font-size: 24px;">글쓰기 페이지<br></strong>
								</div>
								
								<!-- <div class="col d-grid justify-content-end mr-2">
									<button class="nav-link px-2 text-body-secondary"><i class="bi bi-pencil-square"></i></button>
								</div> -->
							</div><hr>
							<%-- headline --%>
								
							<%-- write content --%>
							<div class="row">
								<div class="col d-grid">
								
									<input type="hidden" name="user_id" value="${sessionUser.id}">
									
									
									<div class="form-group mt-4 mb-4">
							      <div class="form-control " style="font-size: 20px; font-family: 'Noto Sans', sans-serif; box-shadow: none;">
							        <input id="title" name="title" placeholder="제목을 입력해주세요." style="width: 100%; border: none; outline: none; padding: 0;"></input>
							      </div>
							     </div>
									
								    
								  	 <%-- select option--%> 
									  <div class="form-group"> 
									  <label for="product_sub_category" class="col col-form-label fw-bold">고민 중인 제품을 선택해주세요.</label>
										  
										  <div class="form-control mt-1" style="font-size: ; font-family: 'Noto Sans', sans-serif; box-shadow: none;">
										    <strong>
										      <select id="product_id" name="category" style="width: 100%; border: none; outline: none;">
										        <option value="0" selected="selected">제품 선택1</option>
										        <c:forEach items="${productPickOptionList}" var="ProductDto">
										        	<option value="${ProductDto.id}">${ProductDto.title}</option>
										        </c:forEach>
										      </select>
										    </strong>
										  </div>
										  
										  
										  <div class="form-control mt-2" style="font-size: ; font-family: 'Noto Sans', sans-serif; box-shadow: none;">
										    <strong>
										      <select id="product_id" name="category" style="width: 100%; border: none; outline: none;">
										        <option value="0" selected="selected">제품 선택2</option>
										        <c:forEach items="${productPickOptionList}" var="ProductDto">
										        	<option value="${ProductDto.id}">${ProductDto.title}</option>
										        </c:forEach>
										      </select>
										    </strong>
										  </div>
										  
										  <div class="form-control mt-2" style="font-size: ; font-family: 'Noto Sans', sans-serif; box-shadow: none;">
										    <strong>
										      <select id="product_id" name="category" style="width: 100%; border: none; outline: none;">
										        <option value="0" selected="selected">제품 선택3</option>
										        <c:forEach items="${productPickOptionList}" var="ProductDto">
										        	<option value="${ProductDto.id}">${ProductDto.title}</option>
										        </c:forEach>
										      </select>
										    </strong>
										  </div>
										  
										  <div class="form-control mt-2" style="font-size: ; font-family: 'Noto Sans', sans-serif; box-shadow: none;">
										    <strong>
										      <select id="product_id" name="category" style="width: 100%; border: none; outline: none;">
										        <option value="0" selected="selected">제품 선택4</option>
										        <c:forEach items="${productPickOptionList}" var="ProductDto">
										        	<option value="${ProductDto.id}">${ProductDto.title}</option>
										        </c:forEach>
										      </select>
										    </strong>
										  </div>
										  
										  <i class="bi bi-plus-circle-fill d-flex justify-content-center align-items-center mt-4 mb-2" style="font-size: 36px; color: gray;"></i>
										  
									</div>
									<%-- select option--%> 
									
									<%-- pick option 미리보기--%>
									 <%-- pick option 미리보기
									  <c:forEach items="${showAllProductList}" var="productDto">
									  DTO 제목: ${productDto.title} <br>
									  ${productDto.title}
									 DTO 가격:  <br>
									  DTO 좋아요 수: ${productDto.likeCount} <br>
									  <c:choose>
										  <c:when test="${empty productDto.product_img_link}">
										  	DTO 이미지링크: 0
										  </c:when>
										  <c:otherwise>
										  DTO 이미지링크: ${productDto.product_img_link}
										  <img src="c://uploadFiles/${productDto.product_img_link}">
										  </c:otherwise>
									  </c:choose> 
									  </c:forEach>--%>
									 <%--  DTO 이미지링크: ${productDto.pickShowCardDto.product_img_link} <br> --%> 
									 
									<%-- pick option 미리보기--%> 
								    
								    <div class="form-group mt-4 mb-4"> 
								      <div class="form-control " style="font-size: ; font-family: 'Noto Sans', sans-serif; box-shadow: none;">
								        <textarea rows="10" name="content" placeholder="내용을 입력해주세요." style="width: 100%; border: none; outline: none; padding: 0;"></textarea>
								      </div>
								      <span class="d-flex justify-content-end align-items-center mt-1 me-1" style="font-size: 14px; color: gray;"><i class="bi bi-info-circle-fill me-1" ></i>욕설, 비방, 광고 등 관련 없는 내용 작성 시 삭제될 수 있습니다.</span>
								    </div>
									
								</div>	
							</div>
							<%-- write content --%>
							
							
							<%-- 글쓰기 --%>
							<div class="row">
								<div class="col text-center p-2 me-3 mb-3">
							   		<button class="orangeButton btn btn-default" style="border: none;">글쓰기</button>
							   		<%--<button class="nav-link px-2 text-body-secondary"><i class="bi bi-pencil-square"></i></button>--%>
								</div>  
							</div>
							<%-- 글쓰기 --%>
							
							</form>
							<%-- write from--%>	
							
							<%-- hashtag from--%>
							
							<%-- hashtag from--%>	
							
						</div>
					</div>
					<%-- getPickBoard --%>
		
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