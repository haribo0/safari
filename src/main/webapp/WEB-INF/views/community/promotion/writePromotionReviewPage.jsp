<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>promo 세부 작성</title>
<!-- 메타 섹션 -->
<jsp:include page="../../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->
</head>
<body>
	<!-- 헤더 섹션 -->
	<jsp:include page="../../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->

	<div class="container main_box">
	<div class = "row mt-5">
		<div class = "col"></div>
		<div class = "col-6">
		<form action="./writePromotionReviewProcess" method = "post" enctype = "multipart/form-data">
			
			<div class = "row mt-5">
				<div class = "col fs-6 text-center text-secondary">커뮤니티</div>
			</div>
			<div class = "row mt-2">
				<div class = "col fw-semibold fs-3 text-center">어쩌고저쩌고 글쓰기</div>
			</div>
			<div class = "row mt-5">
				<div class = "col fw-semibold">제목</div>
				<div class = "col">
					<input class = "form-control"  type = "text" name = "promotion_review_title">
				</div>
			</div>
			<div class = "row mt-5">
				<div class = "col fw-semibold">작성자</div>
				<div class = "col">
				
				  	${sessionUser.email}
	
				</div>
			</div>
			<div class = "row mt-5">
				<div class = "col fw-semibold">내용</div>
				<div class = "col">
					<textarea id = "promotionReviewBox" name = "promotion_review_content" class = "form-control"
							  style = "height: 200px;"  wrap="soft" ></textarea>
				</div>
			</div>
			<div class = "row mt-5">
				<div class = "col fw-semibold">이미지 등록</div>
				<div class = "col">
					<input class = "form-control" type = "file" name = "promoFiles" accept="image/*" multiple>
				</div>
			</div>
			<div class = "row mt-5">
				<div class = "col fw-semibold">프로모션 제품 등록 </div>
				<div class = "col">
					<input class = "form-control" name="rental_item_id" placeholder="임시로 이렇게 만듬">
				</div>
			</div>
			<div class = "row mt-5">
				<div class = "col"></div>
				<div class = "col-3">
					<button class = "form-control btn btn-dark me-2">등록하기</button>
				</div>
			</div>
		</form>
		</div>
		<div class = "col"></div>
	</div>













</div> <!--  container div 닫는 곳 -->
	<div class = "row mt-5">
		<div class = "col">
	<!-- 푸터 섹션 -->
	<jsp:include page="../../common/footer.jsp"></jsp:include>
	<!-- 푸터 섹션 -->
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>
</html>