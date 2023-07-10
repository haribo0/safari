<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사파리 | 커뮤니티메인</title>

<!-- 메타 섹션 -->
<jsp:include page="../../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->

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
			<div class="col" style="background-color:lightgrey;" >
				왼쪽
			</div>
			<!-- 왼쪽 -->
			
			<!-- 가운데 -->
			<div class="col">
				<div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-center">
					
					<%-- getRecruitBoard --%>
					<div class="row">
						<div class="col" style="width:990px;">
						<div class="align-middle ms-4 me-4 mb-4" style="text-align:start">
						
							<form action="/safari/community/recruit/recruitWriteContentProcess" method="post" enctype="multipart/form-data">
								<input type="hidden" name="user_id" value="${sessionUser.id}">
								
								<%-- headline --%>
								<div class="row">
									<div class="col-10">
										<strong style="font-size: 24px;">글쓰기 페이지<br></strong>
									</div>
									
									<div class="col d-grid justify-content-end mr-2">
										<button class="nav-link px-2 text-body-secondary"><i class="bi bi-pencil-square"></i></button>
									</div>
								</div><hr>
								<%-- headline --%>
								
								<%-- write content --%>
								<div class="form-group mt-4 mb-4">
							      <div class="form-control " style="font-size: 20px; font-family: 'Noto Sans', sans-serif; box-shadow: none;">
							        <input id="title" name="title" placeholder="제목을 입력해주세요." style="width: 100%; border: none; outline: none; padding: 0;"></input>
							      </div>
							     </div>
								
								
  									<div class="row">
									<%-- 직업 select option--%> 
									<div class="col">
									<div class="form-group"> 
									<label for="position_category_id" class="col col-form-label fw-bold">직무를 선택해주세요.</label>
										<div class="form-control mt-1" style="font-size: ; font-family: 'Noto Sans', sans-serif; box-shadow: none;">
											<strong>
										    <select id="position_category_id" name="position_category_id" style="width: 100%; border: none; outline: none;">
											    <option value="1" selected="selected">경영</option>
											    <option value="2">회계</option>
											    <option value="3">서비스</option>
										    </select>
										  </strong>
										</div>
									</div>
									</div>
									<%--직업 select option--%> 
									
									<%-- 성별 select option--%> 
									<div class="col">
									<div class="form-group"> 
									<label for="gender" class="col col-form-label fw-bold">성별을 선택해주세요.</label>
										<div class="form-control mt-1" style="font-size: ; font-family: 'Noto Sans', sans-serif; box-shadow: none;">
											<strong>
										    <select id="gender" name="gender" style="width: 100%; border: none; outline: none;">
											    <option value="1" selected="selected">무관</option>
											    <option value="2">남</option>
											    <option value="3">여</option>
										    </select>
										  </strong>
										</div>
									</div>
									</div>
									<%--성별 select option--%> 
									</div>
								
								<%--입력 박스--%> 
								<div class="form-group mt-1 mb-1">
								    <div class="form-control" style="font-size: ; font-family: 'Noto Sans', sans-serif; box-shadow: none;">
										<input type="tel" name="phone" placeholder="phone" style="width: 100%; border: none; outline: none; padding: 0;">
									</div>
								</div>
								
								<div class="form-group mt-1 mb-1">
								    <div class="form-control" style="font-size: ; font-family: 'Noto Sans', sans-serif; box-shadow: none;">
										<input type="text" name="email" placeholder="Email" style="width: 100%; border: none; outline: none; padding: 0;">
									</div>
								</div>
								
								<div class="form-group mt-1 mb-1">
								    <div class="form-control" style="font-size: ; font-family: 'Noto Sans', sans-serif; box-shadow: none;">
										<input type="text" name="salary" placeholder="급여" style="width: 100%; border: none; outline: none; padding: 0;">
									</div>
								</div>
								
								<div class="form-group mt-1 mb-1">
								    <div class="form-control" style="font-size: ; font-family: 'Noto Sans', sans-serif; box-shadow: none;">
										<input type="text" name="location" placeholder="위치" style="width: 100%; border: none; outline: none; padding: 0;">
									</div>
								</div>
								
								<div class="form-group mt-1 mb-1">
								    <div class="form-control" style="font-size: ; font-family: 'Noto Sans', sans-serif; box-shadow: none;">
										<input type="text" name="opening" placeholder="모집인원" style="width: 100%; border: none; outline: none; padding: 0;">
									</div>
								</div>
								
								<div class="form-group mt-1 mb-1">
								    <div class="form-control" style="font-size: ; font-family: 'Noto Sans', sans-serif; box-shadow: none;">
										<input type="text" name="age_limit" placeholder="나이제한" style="width: 100%; border: none; outline: none; padding: 0;">
									</div>
								</div>
								<%--입력 박스--%> 
								
								
								<div class="form-group mt-1">
							      <div class="form-control" style="font-size: ; font-family: 'Noto Sans', sans-serif; box-shadow: none;">
							        <textarea rows="10" name="content" placeholder="내용을 입력해주세요." style="width: 100%; border: none; outline: none; padding: 0;"></textarea>
							      </div>
							      <span class="d-flex justify-content-end align-items-center mt-1 me-1" style="font-size: 14px; color: gray;"><i class="bi bi-info-circle-fill me-1" ></i>욕설, 비방, 광고 등 관련 없는 내용 작성 시 삭제될 수 있습니다.</span>
							    </div>
							    
							    <i class="bi bi-paperclip"></i> <input name="recruitFiles" type="file" multiple accept="image/*">
								<%-- write content --%>
								
								
							</form>	
							</div>
						</div>	
					</div>	
					<%-- getRecruitBoard --%>
		
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