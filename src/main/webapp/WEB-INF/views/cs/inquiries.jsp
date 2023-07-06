<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 메타 섹션 -->
<jsp:include page="../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->

<style>
.border-left {
  border-left : 1px solid #adb5bd;
}
</style>


</head>
<body>

<!-- 헤더 섹션 -->
<jsp:include page="../common/csTopNav2.jsp"></jsp:include>
<!-- 헤더 섹션 -->







<div class="container-fluid">
	<div class="row mt-0">
		<div class="col"></div>
		<div class="col-10">
			<div class="row mb-2">
				<div class="col d-grid">
					<h4 class="fw-bolder">1대1문의</h4>
				</div>
				
				<!-- count -->
				<div class="col-2 text-end" id=""> 
					<div class="btn btn-dark" id="qnaCount">  </div>
				</div>
				<!-- count -->
				
			</div>
			
			
			
			<div class="row py-2">
			
				<!-- LEFT COL -->
				<div class="col-4">
					<div class="row sticky-top">
						<div class="col">
							<div class="row   bg-light text-center py-3 ">
								<div class="col fw-bolder">문의글 목록</div>
							</div>
							
							<div class="row" id="">
								<div class="col" id="">
									
									
									<!-- 문의 리스트 제목 들어갈 곳 -->
									<div class="" id="inquiryTitleListContainer">
										
									</div>
									<!-- 문의 리스트 제목 들어갈 곳 -->
									
									
								</div>
							</div>
						</div>
					</div>
					
				</div>
				<!-- LEFT COL -->
				
				
				<!-- RIGHT COL -->
				<div class="col">
					
					<div class="row  bg-light text-center py-3 ">
						<div class="col fw-bolder text-light"> 문의 </div>
					</div>
					
					<!-- 글 상세보기 -->
					<div class="row ps-5 pe-3  border-left">
						<div class="col" id="inquiryDetailContainer">
						
						
						
							<div class="row border-bottom py-4">
								<div class="col" >
									
									<div class="row">
										<div class="col fs-5 my-2 fw-medium" >
											대여 주문 했는데 배송 날짜를 조정하고 싶어요.
										</div>
									</div>
									<div class="row ">
										<div class="col text-secondary" style="font-size: 14px" >
											<span class="me-3">닉네임</span>
											<span class="">10시간 전</span>
										</div>
									</div>
								</div>
							</div>
							
							
							
							<div class="row py-5 border-bottom">
								<div class="col" >
									대여 주문 했는데 배송 날짜를 조정하고 싶어요.
									아직 배송 전인데 가능할까요? 
								</div>
							</div>
							
							
							<div class="row py-5 border-bottom">
								<div class="col" >
									이 사람의 최근 주문 리스트
								</div>
							</div>
							
							
							<div class="row pt-4">
								<div class="col fs-5 ms-1" >
									답변 작성
								</div>
							</div>
							<div class="row py-2">
								<div class="col" >
									<textarea class="form-control txtInput" rows="5" id="qnaReply" name="qna_reply" placeholder="답글을 입력해주세요" ></textarea>
								</div>
							</div>
							<div class="row pt-2 pb-5 border-bottom">
								<div class="col text-end" >
									<div class="btn btn-dark" onclick="saveQnaReply(qnaId)">작성 완료</div>
								</div>
							</div>
							
							
						
						
						
						
						
						
						</div>
					</div>
					<!-- 글 상세보기 -->
					
					
				</div>
				<!-- RIGHT COL -->
				
			</div>
			
			
			
			
			
			
		</div>
		<div class="col"></div>
	</div>
</div>















<!-- 직원 등록 모달 -->
<div class="modal modal" id="registerEmployeeModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title"> 직원 등록 </h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
     <form action="./productRegisterProcess" id="frm" method="POST" enctype="multipart/form-data">
     
      <div class="modal-body">
       
	        <div class="row">
	        
	        	<div class="col-1"></div>
	        	<div class="col">
	        	
				        <div class="form-group row mt-2">
				            <div class="col-10">
				            	<div class="mb-1"><label for="username" class="col-form-label fw-bolder">아이디</label></div>
				                <input type="text" class="form-control" id="username" name="username"  placeholder="아이디">
				            </div>
				        </div>
				
				        <div class="form-group row mt-2">
				            <div class="col-10">
				            	<div class="mb-1"><label for="password" class="col-form-label fw-bolder">비밀번호</label></div>
				                <input type="password" class="form-control" id="password" name="password"  placeholder="비밀번호">
				            </div>
				        </div>
				        <div class="form-group row mt-2">
				            <div class="col-10">
				            	<div class="mb-1"><label for="name" class="col-form-label fw-bolder">이름</label></div>
				                <input type="text" class="form-control" id="name" name="name"  placeholder="이름">
				            </div>
				        </div>
				
				        <div class="form-group row mt-2">
				            <div class="col-10">
				            	<div class="mb-1"><label for="job_position" class="col-form-label fw-bolder">직급</label></div>
				                <input type="text" class="form-control" id="job_position" name="job_position"  placeholder="직급">
				            </div>
				        </div>
				       
				        <div class="form-group row mt-2">
				            <div class="col-10">
				            	<div class="mb-1"><label for="nickname" class="col-form-label fw-bolder">닉네임</label></div>
				                <input type="text" class="form-control" id="nickname" name="nickname"  placeholder="닉네임">
				            </div>
				        </div>
				
				
				       
				        
				        
				
				        <div class="form-group row mt-4">
				            
				            <div class="col-6">
				            <div class="mb-1"><label for="mainImg" class=" col-form-label fw-medium">프로필사진?</label></div>
				                <input type="file" class="form-control-file" id="mainImg" name="mainImg" accept="images/*">
				            </div>
				            
				        </div>
				
				        <div class="form-group row mt-4">
				            
				        </div>
				        
	        	
	        	</div>
	        	<div class="col-1"></div>
	        </div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-dark" onclick="registerEmployee()">직원 등록</button>
      </div>
      </form>
    </div>
  </div>
</div>
<!-- 상품 등록 모달 -->







<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

 <script>
 
 

//문의 리스트 불러오기 + 처리되지 않은 문의 개수 가져오기 
function getInquiryList() {
	
	const inquiryTitleListContainer = document.getElementById("inquiryTitleListContainer");
	const qnaCountBox = document.getElementById("qnaCount");
	
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			qnaCountBox.innerHTML = "";
			qnaCountBox.innerText = "미답변 문의 : "+response.count+"건";
			console.log(response.count);
			
			let index = 0;
			
			inquiryTitleListContainer.innerHTML = "";
			response.list.forEach(function(map){
				
				
				
				const row1Div = document.createElement('div');
				row1Div.classList.add('row', 'py-3', 'border-bottom' );
				row1Div.id = "row-"+map.qna.id;
				row1Div.style.cursor = "pointer";
				if(index==0) {
					getInquiryDetail(map.qna.id);
				}
				row1Div.addEventListener("click", function(event) {
					getInquiryDetail( map.qna.id );
				});

				const categoryDiv = document.createElement('div');
				categoryDiv.classList.add('col-2','ms-1');
				categoryDiv.textContent = map.category.category;
				
				const col1Div = document.createElement('div');
				col1Div.classList.add('col','ps-4', 'border-left');
				col1Div.textContent = map.qna.qna_title;
				
				const col2Div = document.createElement('div');
				col2Div.classList.add('col-auto', 'text-secondary', "text-end", "me-1", "my-auto");
				col2Div.style.fontSize = "13px";
				// const regDate = new Date(map.qna.reg_date);
				col2Div.textContent = dateToTimeDifference(map.qna.reg_date);
/* 				const regDate = new Date(map.qna.reg_date);
			    const formattedRegDate = regDate.toLocaleDateString('en-US', { month: '2-digit', day: '2-digit', year: 'numeric' });
				col2Div.textContent = formattedRegDate */

				row1Div.appendChild(categoryDiv);
				row1Div.appendChild(col1Div);
				row1Div.appendChild(col2Div);
				inquiryTitleListContainer.appendChild(row1Div);
				
				
				
				index++;
				
			});
			
		}
	}
	
	xhr.open("get", "./getInquiryListByEmpId");
	xhr.send();	
}
 
 
function dateToTimeDifference(date) {

	// 자바스크립트 날짜로 변환 
	const dateFromDatabase = new Date(date);

	// 현재와 시간차 (밀리초)
	const timeDifference = Date.now() - dateFromDatabase.getTime();
	
	// 시/분/초 구하기 (integer)
	const seconds = Math.floor(timeDifference / 1000);
	const minutes = Math.floor(seconds / 60);
	const hours = Math.floor(minutes / 60);

	let formattedTime;

	// 시/분/초 중 하나 정해서 표시 
	if (hours >= 1) {
	  formattedTime = `\${hours} 시간 전`;
	} else if (minutes >= 1) {
	  formattedTime = `\${minutes} 분 전`;
	} else {
	  formattedTime = `\${seconds} 초 전`;
	}

	return formattedTime;
	
}
 


// 문의 상세보기 
function getInquiryDetail(qnaId) {
	
	const inquiryDetailContainer = document.getElementById("inquiryDetailContainer");
	const selectedRow = document.getElementById("row-"+qnaId);
	
	
	// 현재 누른 문의에 배경색을 주기 
	// 상세보기 창 열고 답변 인풋 달고 작성버튼에 이벤트 리스너 더해주고
	
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			inquiryDetailContainer.innerHTML = "";
			const qna = response.qna;
			
			
			/* Row1 */
			// Create the first row with border-bottom
			const row1 = document.createElement('div');
			row1.classList.add('row', 'border-bottom', 'py-4');
				// Create the first column within the first row
				const col1 = document.createElement('div');
				col1.classList.add('col');
				
				// Create the nested row within the first column
				const nestedRow1 = document.createElement('div');
				nestedRow1.classList.add('row');
				// Create the nested column within the nested row
					const nestedCol1 = document.createElement('div');
					nestedCol1.classList.add('col', 'fs-5', 'my-2', 'fw-medium');
					nestedCol1.textContent = qna.qna_title;
					// Append the nested column to the nested row
					nestedRow1.appendChild(nestedCol1);
	
				// Create another nested row within the first column
				const nestedRow2 = document.createElement('div');
				nestedRow2.classList.add('row');
					// Create the nested column within the second nested row
					const nestedCol2 = document.createElement('div');
					nestedCol2.classList.add('col', 'text-secondary');
					nestedCol2.style.fontSize = '14px';
						// Create the span elements within the second nested column
						const span1 = document.createElement('span');
						span1.classList.add('me-3');
						span1.textContent = qna.userDto.nickname;
						const span2 = document.createElement('span');
						span2.textContent = dateToTimeDifference(qna.reg_date);
	
					// Append the span elements to the nested column
					nestedCol2.appendChild(span1);
					nestedCol2.appendChild(span2);
					nestedRow2.appendChild(nestedCol2);
				// Append the nested rows to the first column
				col1.appendChild(nestedRow1);
				col1.appendChild(nestedRow2);

			row1.appendChild(col1);
			
			

			/* Row2 */
			// Create the second row with border-bottom
			const row2 = document.createElement('div');
			row2.classList.add('row', 'py-5', 'border-bottom');
				// Create the second column within the second row
				const col2 = document.createElement('div');
				col2.classList.add('col');
				col2.textContent = qna.qna_content;
				// Append the second column to the second row
			row2.appendChild(col2);

			/* Row3 */
			// Create the third row with border-bottom
			//const row3 = document.createElement('div');//
			//row3.classList.add('row', 'py-5', 'border-bottom');
			// Create the third column within the third row
			//const col3 = document.createElement('div');
			//col3.classList.add('col');
			//col3.textContent = ;

			/* 최근 주문 리스트 ? */
			
			// row3.appendChild(col3);

			
			/* Row4 */
			// Create the fourth row
			const row4 = document.createElement('div');
			row4.classList.add('row', 'pt-4');
				const col4 = document.createElement('div');
				col4.classList.add('col', 'fs-5', 'ms-1');
				col4.textContent = '답변 작성';
			row4.appendChild(col4);


			/* Row6 */
			// Create the sixth row
			const row6 = document.createElement("div");
			row6.classList.add("row", "py-2");
				const row6Col = document.createElement("div");
				row6Col.classList.add("col");
				const textarea = document.createElement("textarea");
				textarea.classList.add("form-control", "txtInput");
				textarea.setAttribute("rows", "5");
				textarea.setAttribute("id", "qnaReply");
				textarea.setAttribute("name", "qna_reply");
				textarea.setAttribute("placeholder", "답글을 입력해주세요");
			row6Col.appendChild(textarea);
			row6.appendChild(row6Col);

			/* Row7 */
			// Create the seventh row with border-bottom
			const row7 = document.createElement("div");
			row7.classList.add("row", "pt-2", "pb-5", "border-bottom");
				const row7Col = document.createElement("div");
				row7Col.classList.add("col", "text-end");
				const button = document.createElement("div");
				button.classList.add("btn", "btn-dark");
				button.textContent = "작성 완료";
				button.setAttribute("data-id", qna.id);
				button.setAttribute("onclick", `saveQnaReply(\${qna.id})`);
				row7Col.appendChild(button);
			row7.appendChild(row7Col);

			inquiryDetailContainer.appendChild(row1);
			inquiryDetailContainer.appendChild(row2);
			//inquiryDetailContainer.appendChild(row3);
			inquiryDetailContainer.appendChild(row4);
			inquiryDetailContainer.appendChild(row6);
			inquiryDetailContainer.appendChild(row7);
			
		}
	}
	
	xhr.open("get", "./getInquirDetailById?id="+qnaId);
	xhr.send();	
	
	
	
	
	
	
	
}



// 답변 저장 
function saveQnaReply(qnaId) {
	
	
	const qnaReplyBox = document.getElementById("qnaReply");
	const qnaReply = qnaReplyBox.value.trim();
	
	if(!qnaReply) {
		qnaReplyBox.focus();
		return;
	}
	
	/* const btn = e.currentTarget;
	const qnaId = event.getAttribute("data-id"); */
	console.log(qnaId);
	
	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			// 새로고침 
			getInquiryList();
		}
	}

	// post 방식 
	xhr.open("post", "./saveQnaReply");
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.send("id="+qnaId+"&qna_reply="+qnaReply);
	
	
	
}





 
 

window.addEventListener("DOMContentLoaded",function(){
	getInquiryList();

	
});
 
 
 
</script>
 

</body>
</html>