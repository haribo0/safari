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

<style>

	.working_condition {
	    display: ;
	    flex-direction: row;
	    align-items: ;
	    padding: 16px 36px;
	    height: 150px;
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
				<jsp:include page="../../community/communityTopNavi.jsp"></jsp:include>
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
  									<div class="col d-flex flex-column justify-content-start align-items-start text-start" style="font-size: 20px;">
  									<label for="" class="col col-form-label fw-bold">모집조건</label>
  									</div>
  									</div>
  									
  									<%-- 조건 카드 --%>
  									<div class="row">
										<div class="col" style="width: 950px;">
											<div class="working_condition">
												
												<%-- 첫째줄--%>
												<div class="row mt-2">
												<%-- 직업 select option--%>
												<div class="col-3">
													<span class="working_condition_item" style=""></span> 
													  <div class="input-group">
													    <div class="d-flex align-items-center">
													      <label for="position_category_id" class="input-group-text fw-bold" style="border: none; outline: none; background-color: white;">직무</label>
													          <select class="form-select" id="position_category_id" name="position_category_id" style="font-size: ; font-family: 'Noto Sans', sans-serif; box-shadow: none;">
													            <option value="11" selected="selected">사무</option>
													            <option value="12">연구</option>
													            <option value="13">기술</option>
													            <option value="14">영업</option>
													            
													            <option value="21">서비스</option>
													            <option value="22">예술</option>
													            <option value="23">스포츠</option>
													            
													            <option value="31">보건</option>
													            <option value="32">교육</option>
													            <option value="33">금융</option>
													            
													            <option value="41">물류</option>
													            <option value="42">생산</option>
													          </select>
													  </div>
													</div>
												</div>
												<%-- 직업 select option--%>
												
												<%-- 급여--%>
												<div class="col-5">
												<span class="working_condition_item" style=""></span>
													<div class="input-group">
													<div class="d-flex align-items-center">
													   <label for="numberInput" class="input-group-text fw-bold" style="border: none; outline: none; background-color: white;">급여</label>
													    <input type="number" class="input-group-text me-2"  name="salary"  id="numberInput" oninput="updateRange()" style="width: 100px; font-size: ; font-family: 'Noto Sans', sans-serif; box-shadow: none;">
													   <!--  <label for="rangeInput">Range:</label> -->
													   만원
													    <input class="ms-2" type="range" id="rangeInput" min="0" max="1000" value="0" oninput="updateNumber()">
													
													    <script>
													        function updateRange() {
													            var numberInput = document.getElementById("numberInput");
													            var rangeInput = document.getElementById("rangeInput");
													            rangeInput.value = numberInput.value;
													        }
													
													        function updateNumber() {
													            var numberInput = document.getElementById("numberInput");
													            var rangeInput = document.getElementById("rangeInput");
													            numberInput.value = rangeInput.value;
													        }
													    </script>
													  </div>
													  </div>
												</div>
												<%-- 급여--%>
												
												<%-- 경력--%><%-- 나이제한을 바꾸기--%>
												<div class="col-4">													<div class="input-group">
													<div class="d-flex align-items-center">
													   <label for="numberInput2" class="input-group-text fw-bold" style="border: none; outline: none; background-color: white;">경력</label>
													    <input type="number" class="input-group-text me-2"  name="age_limit" id="numberInput2" oninput="updateRange2()" style="width: 70px; font-size: ; font-family: 'Noto Sans', sans-serif; box-shadow: none;">
													   년
													   <!--  <label for="rangeInput">Range:</label> -->
													    <input class="ms-2" type="range" id="rangeInput2" min="0" max="30" value="0" oninput="updateNumber2()">
													
													    <script>
													        function updateRange2() {
													            var numberInput2 = document.getElementById("numberInput2");
													            var rangeInput2 = document.getElementById("rangeInput2");
													            rangeInput2.value = numberInput2.value;
													        }
													
													        function updateNumber2() {
													            var numberInput2 = document.getElementById("numberInput2");
													            var rangeInput2 = document.getElementById("rangeInput2");
													            numberInput2.value = rangeInput2.value;
													        }
													    </script>
													  </div>
												</div>
												</div>
												<%-- 경력--%>
												<%-- 첫째줄--%>
												
												<%-- 둘째줄--%>
												<div class="row mt-4">
												
												<%-- 인원--%>												<div class="col-3">
													<span class="working_condition_item" style=""></span>
													<div class="input-group">
													<div class="d-flex align-items-center">
													   <label for="opening" class="input-group-text fw-bold" style="border: none; outline: none; background-color: white;">인원</label>
													   <input type="number" class="input-group-text me-2"  name="opening"  id="opening" style="width: 70px; font-size: ; font-family: 'Noto Sans', sans-serif; box-shadow: none;">
													</div>
													</div>
												</div>
												<%-- 인원--%>
												
												<%-- 지역--%>
												<div class="col-5">
													<span class="working_condition_item" style=""></span>
													<div class="input-group ms-2">
												    <div class="d-flex align-items-center">
												      <label for="location" class="input-group-text fw-bold" style="border: none; outline: none; background-color: white;">위치</label>
												          <select class="form-select" id="location" name="location" style="font-size: ; font-family: 'Noto Sans', sans-serif; box-shadow: none;">
												            <option value="1" selected="selected">서울특별시</option>
												            <option value="2">경기도</option>
												            <option value="3">인천광역시</option>
												            <option value="4">강원특별자치도</option>
												            <option value="5">대전광역시</option>
												            <option value="6">세종특별자치시</option>
												            <option value="7">충청남도</option>
												            <option value="8">충청북도</option>
												            <option value="9">부산광역시</option>
												            <option value="10">울산광역시</option>
												            <option value="11">경상남도</option>
												            <option value="12">경상북도</option>
												            <option value="13">대구광역시</option>
												            <option value="14">광주광역시</option>
												            <option value="15">전라남도</option>
												            <option value="16">전라북도</option>
												            <option value="17">제주특별자치도</option>
												          </select>
												    </div>
												  	</div>
												</div>
												<%-- 지역--%>
												
												<%--성별 select option--%> 
												<div class="col-4">
													<span class="working_condition_item" style=""></span>
													  <div class="input-group ms-3">
													    <div class="d-flex align-items-center">
													      <label class="input-group-text fw-bold" style="border: none; outline: none; background-color: white;">성별</label>
													      <div class="form-control" style="font-size: ; font-family: 'Noto Sans', sans-serif; box-shadow: none;">
													        <label><input type="radio" name="gender" value="3" checked> 무관</label>
													        <label><input type="radio" name="gender" value="1"> 남</label>
													        <label><input type="radio" name="gender" value="2"> 여</label>
													      </div>
													    </div>
													  </div>
												</div>
												<%--성별 select option--%> 
												
												</div>
												<%-- 둘째줄--%>
												
												</div>
											</div>
										</div>
									</div>
	  								<%-- 조건 카드 --%>	
  									
  									<div class="row">
					
									
										
										
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
								
								<!-- <div class="form-group mt-1 mb-1">
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
								
								<div class="form-group mb-2">
								    <div class="form-control" style="font-size: ; font-family: 'Noto Sans', sans-serif; box-shadow: none;">
										<input type="text" name="age_limit" placeholder="나이제한" style="width: 100%; border: none; outline: none; padding: 0;">
									</div>
								</div> -->
								<%--입력 박스--%> 
								
								
								<div class="form-group mb-3">
							      <div class="form-control" style="font-size: ; font-family: 'Noto Sans', sans-serif; box-shadow: none;">
							        <textarea rows="10" name="content" placeholder="내용을 입력해주세요." style="width: 100%; border: none; outline: none; padding: 0;"></textarea>
							      </div>
							      <span class="d-flex justify-content-end align-items-center mt-1 me-1" style="font-size: 14px; color: gray;"><i class="bi bi-info-circle-fill me-1" ></i>욕설, 비방, 광고 등 관련 없는 내용 작성 시 삭제될 수 있습니다.</span>
							    </div>
							    
							    <!-- <i class="bi bi-paperclip"></i>  -->
							    <input name="recruitFiles" class="form-control" type="file" id="formFileMultiple"  multiple accept="image/*">
							 
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
			<div class="col">
				<img class="img-fluid mt-4 ms-3" src="https://apple.contentsfeed.com/RealMedia/ads/Creatives/jobkorea/230709_daekyo_al_ssky/230725_daekyo_120600.jpg" alt="...">
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