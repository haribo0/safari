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
<script src="https://kit.fontawesome.com/a83ecfd9ee.js" crossorigin="anonymous"></script>
<style>
.rounded {border-radius: 30px;}
.btn-qna{position: fixed; bottom: 80px; right: 70px; background-color: #f5f5f5; width: 68px; height: 68px; border-radius: 50%; display: flex; justify-content: center; align-items: center; font-size: 3rem; cursor: pointer;}
.coin-box{position: relative;}
.coin-box::before {content: ''; width:1px; height: 60%; background: #5e5e5e; display:block; position: absolute; top: 50%; transform:translateY(-50%); left: 0px;}

#full-stars-example-two {

  /* use display:inline-flex to prevent whitespace issues. alternatively, you can put all the children of .rating-group on a single line */
  .rating-group {
    display: inline-flex;
  }
  
  /* make hover effect work properly in IE */
  .rating__icon {
    pointer-events: none;
  }
  
  /* hide radio inputs */
  .rating__input {
   position: absolute !important;
   left: -9999px !important;
  }
  
  /* hide 'none' input from screenreaders */
  .rating__input--none {
    display: none
  }

  /* set icon padding and size */
  .rating__label {
    cursor: pointer;
    padding: 0 0.1em;
    font-size: 2rem;
  }
  
  /* set default star color */
  .rating__icon--star {
    color: orange;
  }

  /* if any input is checked, make its following siblings grey */
  .rating__input:checked ~ .rating__label .rating__icon--star {
    color: #ddd;
  }
  
  /* make all stars orange on rating group hover */
  .rating-group:hover .rating__label .rating__icon--star {
    color: orange;
  }

  /* make hovered input's following siblings grey on hover */
  .rating__input:hover ~ .rating__label .rating__icon--star {
    color: #ddd;
  }
}


body {
  padding: 1rem;
  text-align: center;
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
				
			</div>
			
			
			<!-- 테이블 헤더 -->
			<div class="row py-4 text-center border-bottom ">
				<div class="col-auto">
					<a href="./myInquiryPage" class="text-dark text-decoration-none">
						<i class="bi bi-chevron-left"></i> 목록으로
					</a>
				</div>
			</div>
			
			<!-- <hr class="m-0 p-0"> -->

			
			<div id="inquiryListContainer" class="text-start">
			
				<!-- 글 상세보기 -->
					<div class="row ps-5 pe-3  border-left">
						<div class="col" id="inquiryDetailContainer">
						
						
						
							<div class="row border-bottom py-4">
								<div class="col" >
									
									<div class="row">
										<div class="col fs-5 my-2 fw-medium" >
											${qna.qna_title}
										</div>
									</div>
									<div class="row ">
										<div class="col text-secondary" style="font-size: 14px" >
											<span class="me-3">${qna.userDto.nickname}</span>
											<span class="">
												<fmt:formatDate value="${qna.reg_date}" pattern="yyyy-MM-dd" />
											</span>
										</div>
									</div>
								</div>
							</div>
							
							
							
							<div class="row py-5 border-bottom">
								<div class="col" >
									${qna.qna_content}
								</div>
							</div>
							
							
							<!-- 답변 후기 -->
							<c:if test="${!empty qna.qna_reply && !isRated}">
							<div id="replyRatingBox">
							<div class="row py-3 bg-light px-2  text-start">
								<div class="col" >
									<div class="row py-1  text-start">
										<div class="col-3 fw-medium" >
											문의가 마음에 드셨나요?<br>
											<span class="text-secondary fw-light" style="font-size:14px;">
												답변에 대한 만족도를 평가해주세요.
											</span>
										</div>
										
										<div class="col" >
											<div class="row mb-2">
												<div class="col fw-medium" >	
													
													<div id="full-stars-example-two">
													    <div class="rating-group">
													        <input disabled checked class="rating__input rating__input--none" name="rating3" id="rating3-none" value="0" type="radio">
													        <label aria-label="1 star" class="rating__label" for="rating3-1"><i class="rating__icon rating__icon--star fa fa-2xs fa-star"></i></label>
													        <input class="rating__input" name="rating3" id="rating3-1" value="1" type="radio">
													        <label aria-label="2 stars" class="rating__label" for="rating3-2"><i class="rating__icon rating__icon--star fa fa-2xs fa-star"></i></label>
													        <input class="rating__input" name="rating3" id="rating3-2" value="2" type="radio">
													        <label aria-label="3 stars" class="rating__label" for="rating3-3"><i class="rating__icon rating__icon--star fa fa-2xs fa-star"></i></label>
													        <input class="rating__input" name="rating3" id="rating3-3" value="3" type="radio">
													        <label aria-label="4 stars" class="rating__label" for="rating3-4"><i class="rating__icon rating__icon--star fa fa-2xs fa-star"></i></label>
													        <input class="rating__input" name="rating3" id="rating3-4" value="4" type="radio">
													        <label aria-label="5 stars" class="rating__label" for="rating3-5"><i class="rating__icon rating__icon--star fa fa-2xs fa-star"></i></label>
													        <input class="rating__input" name="rating3" id="rating3-5" value="5" type="radio">
													    </div>
													</div>
													
													
												</div>
												<div class="col fw-medium text-end" >	
													<div class="btn btn-sm btn-dark px-3" onclick="saveQnaReplyRating(${qna.id})">보내기</div>
												</div>
											</div>
											<div class="row mt-2">
												<div class="col fw-medium" >	
													<textarea rows="2" cols="" class="form-control" id="textReview"></textarea>
												</div>
											</div>
										</div>
										
									</div>
									
								</div>
							</div>
							</div>
							<!-- 답변 후기 -->
							</c:if>

							
							
							
							<!-- 답변 -->
							<c:if test="${!empty qna.qna_reply}">
								
								
								
								<div class="row pt-3 mb-2 text-start">
									<div class="col-auto" >
										<div class="row pt-4 mb-2">
										<div class="col-auto fw-medium ms-3 me-0 pe-0" >
											답변 완료
										</div>
										<div class="col" >

										</div>
										
									</div>
									</div>
									
								</div>
								
								<div class="row bg-light mx-2 py-4 px-3 rounded text-start">
									<div class="col  "  >
										${qna.qna_reply}
									</div>
								</div>
								<div class="row bg-light mx-2 pb-4 px-3 rounded text-start">
									<div class="col pb-1"  >
										<span class="text-secondary"> by 고객지원팀 ${qna.empDto.nickname} </span>
									</div>
								</div>
								
							</c:if>
							
						
						
						
						
						
						
						</div>
					</div>
					<!-- 글 상세보기 -->
				
				
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


function saveQnaReplyRating(qnaId) {
	
	// Get the star rating group element
	const ratingGroup = document.querySelector('#full-stars-example-two .rating-group');
	// Get the checked input element within the rating group
	const checkedInput = ratingGroup.querySelector('input:checked');
	// Get the value of the checked input element
	const ratingValue = checkedInput ? checkedInput.value : null;
	
	
	
	const textAreaBox = document.getElementById("textReview");
	const textReview = textAreaBox.value.trim();
	
	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			document.getElementById("replyRatingBox").innerHTML = "";
			
		}
	}

	// post 방식 
	xhr.open("post", "./saveQnaReplyRating");
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.send("qna_id="+qnaId+"&rating="+ratingValue+"&text_review="+textReview);

	
}





window.addEventListener("DOMContentLoaded", function(){
	
});
</script>
</body>	
</html>