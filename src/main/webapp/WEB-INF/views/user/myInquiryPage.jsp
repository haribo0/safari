<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사파리 | 메인</title>
<!-- 메타 섹션 -->
<jsp:include page="../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->
<style>
.btn-qna{position: fixed; bottom: 80px; right: 70px; background-color: #f5f5f5; width: 68px; height: 68px; border-radius: 50%; display: flex; justify-content: center; align-items: center; font-size: 3rem; cursor: pointer;}
.coin-box{position: relative;}
.coin-box::before {content: ''; width:1px; height: 60%; background: #5e5e5e; display:block; position: absolute; top: 50%; transform:translateY(-50%); left: 0px;}

.orangeBtn2 {
	background: #FF924A;
	color: white;
}
.orangeBtn {
	background: #FF6F0F;
	color: white;
}
</style>
</head>
<body>

<div class="btn-qna shadow-lg">
<i class="bi bi-question-circle"></i>
</div>

	<!-- 헤더 섹션 -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->
	
	<!-- 마이페이지 상단 블럭 -->
	<jsp:include page="../common/myPageTop.jsp"></jsp:include>
	<!-- 마이페이지 상단 블럭 -->
	
	<div class="container d-flex mt-5 px-0">
		<div class="row w-100">
		<!-- 마이페이지 nav-->
		<jsp:include page="../common/myPageNav.jsp"></jsp:include>
		<!-- 마이페이지 nav-->
			
			
			
		<!-- Body -->
		<div class="col ms-4">
			<div class="row" style="border-bottom: 2px solid #222; height: 48px;">
				<div class="col p-0">
					<h5>1대1 문의</h5>						
				</div>
				<div class="col text-end">
					<a href="./myInquiryPostPage" class="btn orangeBtn btn-sm px-5">문의 작성</a>
				</div>
			</div>
			
			<!-- <div class="row mt-4">
				
			</div> -->
			
			<!-- 테이블 헤더 -->
			<div class="row mt-5 py-3 text-center fw-bolder border-bottom border-top">
				<div class="col-1">
					#			
				</div>
				<div class="col-auto">
					진행상태
				</div>
				<div class="col-1">
					카테고리	
				</div>
				<div class="col">
					제목			
				</div>
				<div class="col-2">
					작성일				
				</div>
			</div>
			
			
			<div id="inquiryListContainer">
			
				<!-- <div class="row  py-3 text-center border-bottom">
					<div class="col-1">
						3
					</div>
					<div class="col-2">
						커뮤니티 
					</div>
					<div class="col-7">
						커뮤니티 유저 신고 
					</div>
					<div class="col-2">
						07/13/2023			
					</div>
				</div>
				
				<div class="row  py-3 text-center border-bottom">
					<div class="col-1">
						2	
					</div>
					<div class="col-2">
						대여
					</div>
					<div class="col-7">
						대여 기간 전 취소 관련 비용 지불 이슈 
					</div>
					<div class="col-2">
						06/10/2023				
					</div>
				</div>
				
				<div class="row py-3 text-center bg-light  border-bottom">
					<div class="col-1 text-end">
						<i class="bi bi-arrow-return-right"></i>
					</div>
					<div class="col-2">
						대여
					</div>
					<div class="col-7">
						대여 기간 전 취소 관련 비용 지불 이슈 
					</div>
					<div class="col-2">
						06/10/2023				
					</div>
				</div>
				
				<div class="row  py-3 text-center  border-bottom">
					<div class="col-1">
						1			
					</div>
					<div class="col-2">
						중고	
					</div>
					<div class="col-7">
						중고 거래 유저 신고
					</div>
					<div class="col-2">
						03/10/2023			
					</div>
				</div> -->
				
				
			</div>
			
			
			
			
			
			
			
			
		</div>
		<!-- Body -->
		
		</div>
	</div>
		
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>


// 문의 리스트 불러오기 
function getInquiryList() {
	
	const listContainer = document.getElementById("inquiryListContainer");
	
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			listContainer.innerHTML = "";
			response.list.forEach(function(map){
				
				// Create the main container div
				const row1Div = document.createElement('div');
				row1Div.classList.add('row', 'py-3', 'text-center', 'border-bottom');

				// Create the col-1 div
				const col1Div = document.createElement('div');
				col1Div.classList.add('col-1');
				col1Div.textContent = map.qna.id;

				// Create the col-2 div
				const col2Div = document.createElement('div');
				col2Div.classList.add('col-1');
				col2Div.textContent = map.category.category;

				// Create the col-2 div
				const colStatusDiv = document.createElement('div');
				colStatusDiv.classList.add('col-auto');
				const innerColDiv = document.createElement('div');
				innerColDiv.style.width = "60px";
				if(map.qna.qna_reply!=null) {
					innerColDiv.textContent = "답변완료";
					innerColDiv.classList.add('badge','orangeBtn2');
				} else {
					innerColDiv.textContent = "답변중";
					innerColDiv.classList.add('badge','text-bg-light');
				}
				colStatusDiv.appendChild(innerColDiv);

				// Create the col3Div div
				const col3Div = document.createElement('div');
				col3Div.classList.add('col');
				const link1 = document.createElement('a');
				link1.className = 'text-black text-decoration-none';
				link1.setAttribute('href', './myInquiryDetail?id='+map.qna.id);
				link1.textContent = map.qna.qna_title;
				col3Div.appendChild(link1);

				// Create the col4Div div
				const col4Div = document.createElement('div');
				col4Div.classList.add('col-2');
				const regDate = new Date(map.qna.reg_date);
			    const formattedRegDate = regDate.toLocaleDateString('en-US', { month: '2-digit', day: '2-digit', year: 'numeric' });
			    col4Div.textContent = formattedRegDate;

				// Append the inner divs to the main container div
				row1Div.appendChild(col1Div);
				row1Div.appendChild(colStatusDiv);
				row1Div.appendChild(col2Div);
				row1Div.appendChild(col3Div);
				row1Div.appendChild(col4Div);
				
				/* row1Div.addEventListener("click", function() {
					
				}); */
				listContainer.appendChild(row1Div);
				
			
				
				/* if(map.qna.qna_reply!=null) {
					// Create the main container div
					const rowDiv = document.createElement('div');
					rowDiv.classList.add('row', 'py-3', 'text-center', 'bg-light', 'border-bottom');
					
					// Create the col-1 div
					const col1Div1 = document.createElement('div');
					col1Div1.classList.add('col-1', 'text-end');
					// Create the arrow icon element
					const arrowIcon = document.createElement('i');
					arrowIcon.classList.add('bi', 'bi-arrow-return-right');
					col1Div1.appendChild(arrowIcon);

					// Create the col-2 div
					const col2Div1 = document.createElement('div');
					col2Div1.classList.add('col-2');
					col2Div1.textContent = '답변완료';

					// Create the col3Div div
					const col3Div1 = document.createElement('div');
					col3Div1.classList.add('col-7');
					const link = document.createElement('a');
					link.className = 'text-black text-decoration-none';
					link.setAttribute('href', './myInquiryDetail?id='+map.qna.id);
					link.textContent = map.qna.qna_title;
					col3Div1.appendChild(link);

					// Create the col4Div div
					const col4Div1 = document.createElement('div');
					col4Div1.classList.add('col-2');
					const regDate = new Date(map.qna.reply_date);
				    const formattedRegDate = regDate.toLocaleDateString('en-US', { month: '2-digit', day: '2-digit', year: 'numeric' });
				    col4Div1.textContent = formattedRegDate;

					// Append the inner divs to the main container div
					rowDiv.appendChild(col1Div1);
					rowDiv.appendChild(col2Div1);
					rowDiv.appendChild(col3Div1);
					rowDiv.appendChild(col4Div1);
					listContainer.appendChild(rowDiv);
				} */

				
			});
			
		}
	}
	
	xhr.open("get", "./getInquiryList");
	xhr.send();	
}





window.addEventListener("DOMContentLoaded", function(){
	getInquiryList();
	
});
</script>
</body>	
</html>