<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>482 | 사고 파는 이웃들의 이야기</title>

<!-- 메타 섹션 -->
<jsp:include page="../../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->

<style>
    .table tr {
        height: 50px; /* Adjust the height as needed */
        
    }
    
    /* 이미지 크롭 */
	 .cropped-image {
	   width: 124px;
	   height: 124px;
	   object-fit: cover;
	 }
.orangeButton{
	background: #ff6f0f;
	font-weight: bold;
	color: white;
}
.orangeButton:hover{
	background: #FF812C;
	font-weight: bold;
	color: white;
}


 </style>

</head>
<body>
		<!-- 헤더 섹션 -->

				<jsp:include page="../../common/header.jsp"></jsp:include>

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
			<!-- <div class="col">
				<img class="img-fluid ms-3 mt-4" src="https://api.linkareer.com/attachments/233888" alt="...">
			</div> -->
			<!-- 왼쪽 -->
			
			<!-- 가운데 -->
			<div class="col-9">
				<div class="align-items-center justify-content-center justify-content-lg-center"> 
					
					<%-- pickBoardList --%> 
					<div class="row"  style="text-align:center">
						<div class="col">
							
							<%-- 글쓰기버튼 --%>
							<div class="row">
								<div class="col text-end pe-5">
									<c:if test="${!empty sessionUser }">
										<a href="/safari/community/pick/writeContentPage" class="btn btn-default px-2 text-body-secondary">글쓰기</a>
									</c:if>
								</div>
							</div>
							<%-- 글쓰기버튼 --%>
							
								<%-- 골라줘요 게시물  샘플 --%>
								<div class="card mt-4 mb-3" style="padding: 8px;">
								<div class="row">
								
								<div class="col">
									<div class="card-title d-flex align-items-center text-align-center text-start ms-3 mt-3">
										<span class="fw-bold ms-3" style="font-size: 20px;">티셔츠 골라주세요</span>
										<span class="text-secondary ms-2 " style="font-size: 13px;">마리아</span>
									</div>
								</div>
								
									<div class="col d-flex align-items-center justify-content-end mt-2 text-secondary me-4" style="font-size: 13px;">
										<i class="bi bi-eye me-1" style="font-size: 20px;"></i>
							    		240 
							    		<i class="bi bi-clock ms-1 me-1" style="font-size: 16px;"></i>
							    		2023.07.27
									</div>
								</div>
								
								
								<div class="card-body">
									<div class="row">
									
												  <%-- 골라줘요 투표 --%>
												  <div class="col-md-3 mt-2 mb-4">
													  <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-center" >
													  
													  <div class="row">
													  <div class="col">
													  <div class="card">
													    <div class="d-flex justify-content-center" style="height: 170px; width: 170px;">
													    <img class="img-fluid" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS846XsQCCwKyA_1OgKiAPhT9YvnBxekWgQ52joFgHsnRKSdsiMoiloEcVvyrpGAq5IUwY&usqp=CAU" 
													    class="rounded mx-auto d-block cropped-image" alt="..." style="height: 100%; width: 100%;">
														</div>
													    
													  </div>
													  </div>
													  </div>
													  
													  <div class="row">
													  <div class="col mt-2">
													  <h6 class=" text-body-secondary">아디다스 티셔츠</h6>
													  </div>
													  </div>
													  
												  </div>
												  </div>
												  <%-- 골라줘요 투표 --%>
												  
												  <%-- 골라줘요 투표 --%>
												  <div class="col-md-3 mt-2 mb-4">
													  <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-center" >
													  
													  <div class="row">
													  <div class="col">
													  <div class="card">
													    <div class="d-flex justify-content-center" style="height: 170px; width: 170px;">
													    <img class="img-fluid" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS846XsQCCwKyA_1OgKiAPhT9YvnBxekWgQ52joFgHsnRKSdsiMoiloEcVvyrpGAq5IUwY&usqp=CAU" 
													    class="rounded mx-auto d-block cropped-image" alt="..." style="height: 100%; width: 100%;">
														</div>
													    
													  </div>
													  </div>
													  </div>
													  
													  <div class="row">
													  <div class="col mt-2">
													  <h6 class=" text-body-secondary">아디다스 티셔츠</h6>
													  </div>
													  </div>
													  
												  </div>
												  </div>
												  <%-- 골라줘요 투표 --%>
												  
												   <%-- 골라줘요 투표 --%>
												  <div class="col-md-3 mt-2 mb-4">
													  <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-center" >
													  
													  <div class="row">
													  <div class="col">
													  <div class="card">
													    <div class="d-flex justify-content-center" style="height: 170px; width: 170px;">
													    <img class="img-fluid" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS846XsQCCwKyA_1OgKiAPhT9YvnBxekWgQ52joFgHsnRKSdsiMoiloEcVvyrpGAq5IUwY&usqp=CAU" 
													    class="rounded mx-auto d-block cropped-image" alt="..." style="height: 100%; width: 100%;">
														</div>
													    
													  </div>
													  </div>
													  </div>
													  
													  <div class="row">
													  <div class="col mt-2">
													  <h6 class=" text-body-secondary">아디다스 티셔츠</h6>
													  </div>
													  </div>
													  
												  </div>
												  </div>
												  <%-- 골라줘요 투표 --%>
												  
												   <%-- 골라줘요 투표 --%>
												  <div class="col-md-3 mt-2 mb-4">
													  <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-center" >
													  
													  <div class="row">
													  <div class="col">
													  <div class="card">
													    <div class="d-flex justify-content-center" style="height: 170px; width: 170px;">
													    <img class="img-fluid" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS846XsQCCwKyA_1OgKiAPhT9YvnBxekWgQ52joFgHsnRKSdsiMoiloEcVvyrpGAq5IUwY&usqp=CAU" 
													    class="rounded mx-auto d-block cropped-image" alt="..." style="height: 100%; width: 100%;">
														</div>
													    
													  </div>
													  </div>
													  </div>
													  
													  <div class="row">
													  <div class="col mt-2">
													  <h6 class=" text-body-secondary">아디다스 티셔츠</h6>
													  </div>
													  </div>
													  
												  </div>
												  </div>
												  <%-- 골라줘요 투표 --%>
												  
												
												  
									</div>
									
									
									<%-- 해시태그 --%>
									<div class="row">
									<div class="col d-flex justify-content-start">
										<div class="ms-3 mt-3">
											<button type="button" class="btn btn-outline-secondary rounded-pill btn-sm">#해시태그</button>
											<button type="button" class="btn btn-outline-secondary rounded-pill btn-sm">#해시태그</button>
											<button type="button" class="btn btn-outline-secondary rounded-pill btn-sm">#해시태그</button>	
										</div>
									</div>
									</div>
									<%-- 해시태그 --%>
									
									
									
								</div>
								</div>
								<%-- 골라줘요 게시물  샘플 --%>
								
								
							<%-- 골라줘요 게시물 foreach --%>
							<c:forEach items="${pickBoardList}" var="pickDto">
							<a class="text-black text-decoration-none" href="/safari/community/pick/readContentPage/${pickDto.pickDto.id}">	
								<div class="card mt-4 mb-3" style="padding: 8px;">
								<div class="row">
								
								<div class="col d-grid">
									<div class="card-title d-flex align-items-center text-align-center text-start ms-3 mt-3">
									
										<span class="fw-bold ms-3" style="font-size: 20px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 30ch;">${pickDto.pickDto.title}</span>
										<span class="text-secondary ms-2 " style="font-size: 13px;">${pickDto.userDto.nickname}</span>
									</div>
								</div>
								
									<div class="col-4 d-flex align-items-center justify-content-end mt-2 text-secondary me-4" style="font-size: 13px;">
										<i class="bi bi-eye me-1" style="font-size: 20px;"></i>
							    		${pickDto.pickDto.views}
							    		<i class="bi bi-clock ms-1 me-1" style="font-size: 16px;"></i>
							    		<fmt:formatDate value="${pickDto.pickDto.reg_date}" pattern="yyyy.MM.dd"/>
									</div>
								</div>
								
								
								<div class="card-body">
									<div class="row">
														<%-- 테스트 --%>
													   <%-- <c:forEach items="${pickDto.pickOptionValuesForVoteDtoList}" var="pickOptionValuesForVoteDto">
													      <!-- pickOptionValuesForVoteDto에 해당하는 정보 출력 -->
													      <p>Option ID: ${pickOptionValuesForVoteDto.option_id}</p>
													      <p>Vote Count: ${pickOptionValuesForVoteDto.vote_cnt}</p>
													      <!-- 여기서 이미지 소스를 사용하는 경우에는 이미지 태그를 추가하면 됩니다. -->
													      <img src="/uploadFiles/${pickOptionValuesForVoteDto.img}" alt="Image">
													      <img class="img-fluid" src="/uploadFiles/${pickOptionValuesForVoteDto.img }" 
																							    class="rounded mx-auto d-block" alt="...">
													      
													  </c:forEach> --%>
													  <%-- 테스트 --%>
												  <%-- 골라줘요 투표 --%>
												  <c:forEach items="${pickDto.pickOptionValuesForVoteDtoList}" var="pickOptionValuesForVoteDto">
												  <div class="col-md-3 mt-2 mb-4">
													  <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-center" >
													  
													  <div class="row">
													  <div class="col">
													  <div class="card">
													    <div class="d-flex justify-content-center" style="height: 170px; width: 170px;">
													    <img class="img-fluid" src="/uploadFiles/${pickOptionValuesForVoteDto.img}" 
													    class="rounded mx-auto d-block cropped-image" alt="..." style="height: 100%; width: 100%;">
														</div>
													    
													  </div>
													  </div>
													  </div>
													  
													  <div class="row">
													  <div class="col mt-2">
													  <h6 class=" text-body-secondary">${pickOptionValuesForVoteDto.title}</h6>
													  </div>
													  </div>
													  
												  </div>
												  </div>
												  </c:forEach>
												  <%-- 골라줘요 투표 --%>
												  
												
												  
												
												  
									</div>
									
									
									<%-- 해시태그 --%>
									<div class="row">
									<div class="col d-flex justify-content-start">
										<div class="ms-3 mt-3">
											<button type="button" class="btn btn-outline-secondary rounded-pill btn-sm">#해시태그</button>
											<button type="button" class="btn btn-outline-secondary rounded-pill btn-sm">#해시태그</button>
											<button type="button" class="btn btn-outline-secondary rounded-pill btn-sm">#해시태그</button>	
										</div>
									</div>
									</div>
									<%-- 해시태그 --%>
									
									<%-- 테스트 --%>
<%-- 									${pickDto.pickOptionDto.pick_id}
									${pickDto.productDto.title}
									${pickDto.productImgDto.product_img_link} --%>
									
									<%-- <c:forEach items="${pickBoardList}" var="pickDto">
									pickOptionValuesForVoteDtoList 
									${pickDto.pickOptionValuesForVoteDtoList.title} ${pickDto.pickOptionValuesForVoteDtoList.product_img_link}
									</c:forEach> --%>
									 <!-- pickOptionValuesForVoteDtoList 출력 -->
 
									<%-- 테스트 --%>
									
									
									
								</div>
								</div>
								</a>
							</c:forEach>
							<%-- 골라줘요 게시물 foreach --%>
								
								
								
								
								
								
								
								
								<%-- 골라줘요 항목 foreach --%>
							<%-- 	<c:forEach items="${pickBoardList}" var="pickDto">				
								<div class="align-middle ms-4 me-4 mb-4" style="text-align:start">
								<hr>
									
									<div class="ms-2 me-2" style="font-size: 14px;">
									
									<div class="row">
										<div class="col">
										<span class="badge rounded-pill text-bg-dark mt-2 me-1 mb-3" style="padding: 6px 10px; font-size: 16px;">골라줘요</span> 
										 ${pickDto.userDto.nickname}
										| <i class="bi bi-clock mt-2" style="font-size: 12px;"></i> <fmt:formatDate value="${pickDto.pickDto.reg_date}" pattern="yyyy.MM.dd"/>
										| views&nbsp;👀 · ${pickDto.pickDto.views}
										</div>
										
										<div class="col">
										</div>
									</div>
									
									<br>
									
									<div class="ms-2 me-2 mb-2">
										<a class="text-black text-decoration-none" href="/safari/community/pick/readContentPage/${pickDto.pickDto.id}">
										${pickDto.pickDto.id}
										</a>
										||
										<a class="text-black text-decoration-none" href="/safari/community/pick/readContentPage/${pickDto.pickDto.id}">
										${pickDto.pickDto.content}</a>
									<br>
									</div>
										
										내용카드
										<div class="row">
										  <div class="col-md-6 mt-2 mb-5">
										  <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-center" >
										  <div class="card" style="width: 255px; height: 320px;">
										    <div class="d-felx justify-content-center">
										    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS846XsQCCwKyA_1OgKiAPhT9YvnBxekWgQ52joFgHsnRKSdsiMoiloEcVvyrpGAq5IUwY&usqp=CAU" 
										    class="rounded mx-auto d-block" alt="..." style="width: 250px; height: 250px;">
										      <div class="card-body">
										        <h6 class="card-title text-body-secondary mb-1">아디다스 티셔츠</h6>
										        <p class="card-text mb-2">26,000원</p>
										        <div class="text-center">
										        </div></div></div>
										    </div><button type="button" class="btn btn-outline-secondary rounded-pill btn-sm mt-4" style="width: 250px;">A</button>
										      </div>
										  </div>
										  
										  <div class="col-md-6 mt-2 mb-5">
										  <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-center" >
										  <div class="card" style="width: 255px; height: 320px;">
										    <div class="d-felx justify-content-center">
										    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKx1kXLe73WUkC8YXj8IwJg_KUMw_uUmOC0FrSwNdLsDSNyhrKgxfNL_Cx5JMdyIonlSc&usqp=CAU" 
										    class="rounded mx-auto d-block" alt="..." style="width: 250px; height: 250px;">
										      <div class="card-body">
										        <h6 class="card-title text-body-secondary mb-1">mlb 티셔츠</h6>
										        <p class="card-text mb-2">30,000원</p>
										        <div class="text-center">
										        </div></div></div>
										    </div><button type="button" class="btn btn-outline-secondary rounded-pill btn-sm mt-4" style="width: 250px;">B</button>
										      </div>
										  </div>
										 </div>
									
										내용카드
										
										해시태그
										<div class="mt-3">
											<button type="button" class="btn btn-outline-secondary rounded-pill btn-sm">#해시태그</button>
											<button type="button" class="btn btn-outline-secondary rounded-pill btn-sm">#해시태그</button>
											<button type="button" class="btn btn-outline-secondary rounded-pill btn-sm">#해시태그</button>	
										</div>
										해시태그
									</div>
								</div>
								</c:forEach>	 --%>
								<%-- 골라줘요 항목 foreach --%>
							
						</div>	
					</div>	
					<%-- pickBoardList --%>
						
				</div>	
			</div>
			<!-- 가운데 -->
			 
			
			<!-- 오른쪽 -->
			<div class="col">
				<img class="img-fluid ms-3 mt-4" src="https://api.linkareer.com/attachments/233888" alt="...">
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