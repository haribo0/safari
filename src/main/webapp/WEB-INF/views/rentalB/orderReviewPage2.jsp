<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사파리 | 대여메인</title>
<!-- 메타 섹션 -->
<jsp:include page="../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->
<style>
.small-icon {
  font-size: 0.8rem; /* Adjust the size as per your preference */
}


.review-reply {
  background-color: #f5f5f5;
  border-radius: 20px;
  position: relative;
}

/* 
.review-reply:before {
  content: "";
  position: absolute;
  top: 0px;
  left: -15px;
  width: 0;
  height: 0;
  border-top: 30px solid transparent;
  border-right: 30px solid #f5f5f5;
  transform: rotate(270deg);
/*   transform: scaleX(-1);
 */  
}
 */

</style>
</head>
<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../common/headerB.jsp"></jsp:include>
	<!-- 헤더 섹션 -->

	<div class="container main_box">
		<div class="row">
		
			<div class="col-2">
				<div class="list-group list-group-flush">
					
					<!-- 왼쪽 카테고리 리스트 -->
					<jsp:include page="../common/navLeft.jsp"></jsp:include>
					<!-- 왼쪽 카테고리 리스트 -->
					
				</div>
				
				<div class="row mt-5 mb-5">
					<div class="col"> </div>
				</div>
			
			</div>
			
			
			<div class="col container ms-3">
			
    			<h4 class="row mt-3 mb-0 fw-regular">리뷰 관리</h4>

				<div class="row  mb-2">
					<!-- 상품 리스트 -->
					<div class="col-3">
						
						
						<!-- <div class="row" style="height: 31px">
							<div class="col">
								
							</div>
							
						</div> -->
						
						<div class="row mt-4">
								
							<hr class="border border-black opacity-25">
								
						</div>
						
						<div class="row m-0">
								
							<div class="col">
								
								상품 리스트
								
							</div>
								
						</div>
						
						<div class="row mt-3">
								
							<hr class="border border-black opacity-25">
								
						</div>
						
						
						
						<div class="row mt-1">
							<div class="col " id="productList">
								<div class="row pt-2">
									<div class="col pb-2" onclick="getReviewsByProductAndStatus(0,-1)">상품 전체</div>
								</div>
								<hr class="border">
								
								
								<!-- 상품 리스트 들어갈 곳 -->
								
								
							</div>
						</div>
						
					</div>
					<!-- 리뷰 답변 -->
					<div class="col ms-4">
						
						<div class="row mt-4">
								
							<hr class="border border-black opacity-25">
								
						</div>
						
						<div class="row ">
							<div class="col">
								
								후기 리스트
								
							</div>
						</div>
						
						<div class="row mt-3">
								
							<hr class="border border-black opacity-25">
								
						</div>
						
						<div class="row">
							<div class="col">
								<div class="btn btn-sm btn-outline-dark rounded-5 me-2" id="all" onclick="getReviewsByProductAndStatus(-1,-1)">전체보기</div>
								<div class="btn btn-sm btn-outline-dark rounded-5 me-2" id="unanswered" onclick="getReviewsByProductAndStatus(-1,0)">답변하지 않은 후기</div>
								<div class="btn btn-sm btn-outline-dark rounded-5 me-2" id="answered" onclick="getReviewsByProductAndStatus(-1,1)">답변한 후기</div>
							</div>
							
						</div>
						
						<!-- <hr class="border"> -->
						
						<div class="row mt-1 pt-3 h-75 overflow-y-scroll">
							<div class="col d-grid" id="reviewBox">
								
								
									
								
							
								
							</div>
						</div>
						
						
					</div>
					
				    
				</div>
				
				
				
				
				
				
				
				
			
			</div>
			
			
		
		
		</div>
	</div>
	
	
	
	
	
	<!-- 푸터 섹션 -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>



<script>

let productIdNum = 0;
let statusNum = -1;

const productListBox = document.getElementById("productList");


function getProductList() {
	
	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			response.list.forEach(function(data){
				
				
				const row = document.createElement("div");
				row.className = "row mt-2";
				const col = document.createElement("div");
				col.className = "col mb-2";
				col.innerText = data.title;
				/* col.onclick = function() {
			          getAllReviews(data.id, 0);
			    }; */
		        col.addEventListener("click", function() {
		        	getReviewsByProductAndStatus( data.id , -1);
		          });
				row.appendChild(col);
				productListBox.appendChild(row);
				
				const hr = document.createElement("hr");
				hr.className = "border";
				productListBox.appendChild(hr);
				
			});
		}
	}

	// get 방식 
	xhr.open("get", "./getProductList");
	xhr.send();
	
}







//////////

function getReviewsByProductAndStatus(productId, status) {
	
	const reviewBox = document.getElementById("reviewBox");
	reviewBox.innerHTML="";
	
	console.log(productId);
	console.log(status);
	
	const all = document.getElementById("all");
	const unanswered = document.getElementById("unanswered");
	const answered = document.getElementById("answered");
	
	
	if(productId === -1) {
		productId = productIdNum;
	} else{
		productIdNum = productId;
	}
	
	/* if(statusNum === -1) {
		status = statusNum;
	} else{
		statusNum = status;
	} */
	
	console.log(productIdNum);
	
	

	
	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			response.list.forEach(function(data){
				
				// Create the card element
				const card = document.createElement("div");
				card.classList.add("card", "mb-3");

				// Create the card body
				const cardBody = document.createElement("div");
				cardBody.classList.add("card-body");

				// Create the row for review title
				const titleRow = document.createElement("div");
				titleRow.classList.add("row");
				const titleCol = document.createElement("div");
				titleCol.classList.add("col", "fs-5", "fw-normal");
				titleCol.textContent = data.review.rental_review_title;
				titleRow.appendChild(titleCol);

				// Create the row for user info
				const userInfoRow = document.createElement("div");
				userInfoRow.classList.add("row");
				const userIdCol = document.createElement("div");
				userIdCol.classList.add("col", "fs-6", "fw-light", "text-secondary");
				userIdCol.textContent = data.user.nickname;
				const dateCol = document.createElement("div");
				dateCol.classList.add("col", "fs-6", "fw-light", "text-secondary", "text-end");
				const reviewDate = new Date(data.review.reg_date);
				const formattedDate = reviewDate.toLocaleDateString('en-US', {
				  year: 'numeric',
				  month: '2-digit',
				  day: '2-digit',
				});

				dateCol.textContent = formattedDate;
				userInfoRow.appendChild(userIdCol);
				userInfoRow.appendChild(dateCol);

				// Create the horizontal rule
				const hr = document.createElement("hr");
				hr.classList.add("border");
				
				const productInfoRow = document.createElement("div");
				productInfoRow.classList.add("row");
				const productNameCol = document.createElement("div");
				productNameCol.classList.add("col", "text-secondary", "fw-light");
				productNameCol.textContent = data.product.title;
				productInfoRow.appendChild(productNameCol);

				// Create the row for star rating
				const ratingRow = document.createElement("div");
				ratingRow.classList.add("row");
				const ratingCol = document.createElement("div");
				ratingCol.classList.add("col");
				for (let i = 0; i < data.review.rental_review_rating; i++) {
				  const starIcon = document.createElement("i");
				  starIcon.classList.add("bi", "bi-star-fill", "small-icon");
				  ratingCol.appendChild(starIcon);
				}
				ratingRow.appendChild(ratingCol);

				// Create the row for review content
				const contentRow = document.createElement("div");
				contentRow.classList.add("row", "mt-3", "mb-5", "fw-light");
				const contentCol = document.createElement("div");
				contentCol.classList.add("col");
				contentCol.textContent =
				  data.review.rental_review_content;
				contentRow.appendChild(contentCol);

				// Create the horizontal rule
				const hr2 = document.createElement("hr");
				hr2.classList.add("border");

				// Create the row for reply section
				const replyRow = document.createElement("div");
				replyRow.classList.add("row", "mt-4");
				const replyCol = document.createElement("div");
				replyCol.classList.add("col", "fw-medium");
				replyCol.textContent = "답글";
				replyRow.appendChild(replyCol);
				
				
				

				////// 답글 없는 경우 
				// Create the row for reply textarea
				const replyTextAreaRow = document.createElement("div");
				replyTextAreaRow.classList.add("row", "mt-3", "fw-light");
				const replyTextAreaCol = document.createElement("div");
				replyTextAreaCol.classList.add("col", "d-grid");
				const replyTextArea = document.createElement("textarea");
				replyTextArea.classList.add("form-control", "txtInput");
				replyTextArea.setAttribute("rows", "3");
				replyTextArea.setAttribute("name", "rental_reply_review");
				replyTextArea.setAttribute("placeholder", "답글을 입력해주세요");
				// Set the data-id attribute with the value
				replyTextArea.setAttribute("data-id", data.review.id);
				replyTextArea.setAttribute("id", "textarea_" + data.review.id);
				replyTextAreaCol.appendChild(replyTextArea);
				replyTextAreaRow.appendChild(replyTextAreaCol);
				
				// Create the row for reply submit button
				const replySubmitRow = document.createElement("div");
				replySubmitRow.classList.add("row", "mt-3", "fw-light");
				const replySubmitEmptyCol = document.createElement("div");
				replySubmitEmptyCol.classList.add("col");
				const replySubmitCol = document.createElement("div");
				replySubmitCol.classList.add("col-2", "d-grid");
				const replySubmitButton = document.createElement("div");
				replySubmitButton.classList.add("btn", "btn-sm", "btn-dark");
				replySubmitButton.textContent = "등록";
				replySubmitButton.addEventListener("click", function() {
					saveReviewReply( data.review.id );
		        });
				replySubmitCol.appendChild(replySubmitButton);
				replySubmitRow.appendChild(replySubmitEmptyCol);
				replySubmitRow.appendChild(replySubmitCol);
					

				// 답글 있을 경우 
				// Create the row for review content
				const replyBodyRow = document.createElement("div");
				replyBodyRow.classList.add("row", "mt-3", "mb-5", "fw-light");

				/* const replyFrontSpace = document.createElement("div");
				replyFrontSpace.classList.add("col-1", "fw-medium");
				replyBodyRow.appendChild(replyFrontSpace); */

				const replyBodyCol = document.createElement("div");
				replyBodyCol.classList.add("col", "review-reply", "p-3", "mx-3");
				replyBodyCol.textContent = data.review.rental_reply_review;
				replyBodyRow.appendChild(replyBodyCol);
				

				// Append all elements to the productBox
				cardBody.appendChild(titleRow);
				cardBody.appendChild(userInfoRow);
				cardBody.appendChild(hr);
				cardBody.appendChild(productInfoRow);
				cardBody.appendChild(ratingRow);
				cardBody.appendChild(contentRow);
				cardBody.appendChild(hr2);
				cardBody.appendChild(replyRow);
				if(!data.isReplied) {
					cardBody.appendChild(replyTextAreaRow);
					cardBody.appendChild(replySubmitRow);
				} else {
					console.log(data.review.rental_reply_review);
					cardBody.appendChild(replyBodyRow);
				}
				card.appendChild(cardBody);
				reviewBox.appendChild(card);
			});
			
			
		}
	}
	
	// get 방식 
	xhr.open("get", "./getReviewListByProduct?productId="+productId+"&status="+status);
	xhr.send();
	
	console.log(status);

	if(status === -1) {
		all.classList.remove("btn-outline-dark");
		all.classList.add("btn-dark");
		
		unanswered.classList.add("btn-outline-dark");
		unanswered.classList.remove("btn-dark");
		answered.classList.add("btn-outline-dark");
		answered.classList.remove("btn-dark");
	} else if (status === 0) {
		unanswered.classList.remove("btn-outline-dark");
		unanswered.classList.add("btn-dark");
		
		all.classList.add("btn-outline-dark");
		all.classList.remove("btn-dark");
		answered.classList.add("btn-outline-dark");
		answered.classList.remove("btn-dark");
	} else if (status === 1){
		answered.classList.remove("btn-outline-dark");
		answered.classList.add("btn-dark");
		
		all.classList.add("btn-outline-dark");
		all.classList.remove("btn-dark");
		unanswered.classList.add("btn-outline-dark");
		unanswered.classList.remove("btn-dark");
	};
	
}




function saveReviewReply(rewiewId) {
	
	const reviewReplyInputBox = document.getElementById("textarea_"+rewiewId);
	const replyText = reviewReplyInputBox.value;
	
	console.log(replyText);
	
	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			// 등록 후 리뷰 리프레시
			getReviewsByProductAndStatus(-1,-1);
			
		}
	}


	// post 방식 
	xhr.open("post", "./saveReviewReply");
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.send("rental_reply_review="+replyText+"&id="+rewiewId);
	
	
}











function getAllReviewList() {
	
	const reviewBox = document.getElementById("reviewBox");
	reviewBox.innerHTML="";
	
	
	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			response.list.forEach(function(data){
				
				// Create the card element
				const card = document.createElement("div");
				card.classList.add("card", "mb-3");

				// Create the card body
				const cardBody = document.createElement("div");
				cardBody.classList.add("card-body");

				// Create the row for review title
				const titleRow = document.createElement("div");
				titleRow.classList.add("row");
				const titleCol = document.createElement("div");
				titleCol.classList.add("col", "fs-5", "fw-normal");
				titleCol.textContent = data.review.rental_review_title;
				titleRow.appendChild(titleCol);

				// Create the row for user info
				const userInfoRow = document.createElement("div");
				userInfoRow.classList.add("row");
				const userIdCol = document.createElement("div");
				userIdCol.classList.add("col", "fs-6", "fw-light", "text-secondary");
				userIdCol.textContent = data.user.nickname;
				const dateCol = document.createElement("div");
				dateCol.classList.add("col", "fs-6", "fw-light", "text-secondary", "text-end");
				const reviewDate = new Date(data.review.reg_date);
				const formattedDate = reviewDate.toLocaleDateString('en-US', {
				  year: 'numeric',
				  month: '2-digit',
				  day: '2-digit',
				});

				dateCol.textContent = formattedDate;
				userInfoRow.appendChild(userIdCol);
				userInfoRow.appendChild(dateCol);

				// Create the horizontal rule
				const hr = document.createElement("hr");
				hr.classList.add("border");
				
				const productInfoRow = document.createElement("div");
				productInfoRow.classList.add("row");
				const productNameCol = document.createElement("div");
				productNameCol.classList.add("col", "text-secondary", "fw-light");
				productNameCol.textContent = data.product.title;
				productInfoRow.appendChild(productNameCol);

				// Create the row for star rating
				const ratingRow = document.createElement("div");
				ratingRow.classList.add("row");
				const ratingCol = document.createElement("div");
				ratingCol.classList.add("col");
				for (let i = 0; i < data.review.rental_review_rating; i++) {
				  const starIcon = document.createElement("i");
				  starIcon.classList.add("bi", "bi-star-fill", "small-icon");
				  ratingCol.appendChild(starIcon);
				}
				ratingRow.appendChild(ratingCol);

				// Create the row for review content
				const contentRow = document.createElement("div");
				contentRow.classList.add("row", "mt-3", "mb-5", "fw-light");
				const contentCol = document.createElement("div");
				contentCol.classList.add("col");
				contentCol.textContent =
				  data.review.rental_review_content;
				contentRow.appendChild(contentCol);

				// Create the horizontal rule
				const hr2 = document.createElement("hr");
				hr2.classList.add("border");

				// Create the row for reply section
				const replyRow = document.createElement("div");
				replyRow.classList.add("row", "mt-4");
				const replyCol = document.createElement("div");
				replyCol.classList.add("col", "fw-medium");
				replyCol.textContent = "답글";
				replyRow.appendChild(replyCol);

				// Create the row for reply textarea
				const replyTextAreaRow = document.createElement("div");
				replyTextAreaRow.classList.add("row", "mt-3", "fw-light");
				const replyTextAreaCol = document.createElement("div");
				replyTextAreaCol.classList.add("col", "d-grid");
				const replyTextArea = document.createElement("textarea");
				replyTextArea.classList.add("form-control");
				replyTextArea.setAttribute("rows", "3");
				replyTextArea.setAttribute("name", "rental_reply_review");
				replyTextArea.setAttribute("placeholder", "답글을 입력해주세요");
				replyTextAreaCol.appendChild(replyTextArea);
				replyTextAreaRow.appendChild(replyTextAreaCol);

				// Create the row for reply submit button
				const replySubmitRow = document.createElement("div");
				replySubmitRow.classList.add("row", "mt-3", "fw-light");
				const replySubmitEmptyCol = document.createElement("div");
				replySubmitEmptyCol.classList.add("col");
				const replySubmitCol = document.createElement("div");
				replySubmitCol.classList.add("col-2", "d-grid");
				const replySubmitButton = document.createElement("div");
				replySubmitButton.classList.add("btn", "btn-sm", "btn-dark");
				replySubmitButton.textContent = "등록";
				replySubmitCol.appendChild(replySubmitButton);
				replySubmitRow.appendChild(replySubmitEmptyCol);
				replySubmitRow.appendChild(replySubmitCol);

				// Append all elements to the productBox
				cardBody.appendChild(titleRow);
				cardBody.appendChild(userInfoRow);
				cardBody.appendChild(hr);
				cardBody.appendChild(productInfoRow);
				cardBody.appendChild(ratingRow);
				cardBody.appendChild(contentRow);
				cardBody.appendChild(hr2);
				cardBody.appendChild(replyRow);
				cardBody.appendChild(replyTextAreaRow);
				cardBody.appendChild(replySubmitRow);
				card.appendChild(cardBody);
				reviewBox.appendChild(card);
			});
			
			
		}
	}

	// get 방식 
	xhr.open("get", "./getAllReviews");
	xhr.send();
	
}
















window.addEventListener("DOMContentLoaded",function(){
	getProductList();
	getReviewsByProductAndStatus(-1,-1);

	// setInterval(reloadCommentList, 3000);	// 3초마다 실행
});


</script>


</body>	
</html>
