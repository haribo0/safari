<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사파리 | 구인구직 메인</title>

<!-- 메타 섹션 -->
<jsp:include page="../../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->



<style>
    .table tr {
        height: 50px; /* Adjust the height as needed */
        
    }
    
	.orangeButton {
	background: #ff6f0f;
	font-weight: bold;
	color: white;
	}
	
	.orangeButton:hover{
	   background: #FF812C;
	   font-weight: bold;
	   color: white;
	}
	
	/* 슬라이드 아이템 높이 설정 */
    .carousel-inner .carousel-item {
      height: auto; /* 높이를 자동으로 조정 */
    }

    /* 화살표 스타일 조정 */
    .carousel-control-prev-icon,
    .carousel-control-next-icon {
      background-color: white; /* 배경색을 검은색으로 설정 */
      border-radius: 50%; /* 원형으로 모양 변경 */
      width: 10px; /* 너비 설정 */
      height: 10px; /* 높이 설정 */
      display: inline-block; /* 인라인 요소로 표시되도록 설정 */
      color: black;
    }

    /* 화살표 위치 조정 */
    .carousel-control-prev {
      left: px; /* 왼쪽으로 30px 이동 */
    }

    .carousel-control-next {
      right: px; /* 오른쪽으로 30px 이동 */
    }
    
    /* 다음 화살표 보이도록 설정 */
    .carousel-control-next-icon {
      display: inline; /* 인라인 요소로 표시되도록 설정 */
    }
    
    .category-item.btn {
	  background-color: white; /* 눌렀을 때의 배경색 */
	  color: #171717; /* 눌렀을 때의 텍스트 색상 */
	  border-color: secondary;  /* 테두리 색상 추가 */
	}
	
	.category-item.btn:hover{
	   background: #e1e2e4;
	   color: #171717;
	   border-color: secondary; /* 테두리 색상 추가 */
	}
	
    /* 버튼 스타일링 */
    .reset-btn {
        background-color: white;
        color: #171717;
        border: none;
        border-radius: 20%;
        padding: 5%;
        cursor: pointer;
        font-size: 16px;
        display: flex; /* 아이콘과 텍스트를 가로로 나열하기 위해 Flexbox 사용 */
        align-items: center; /* 아이콘과 텍스트를 수직 중앙 정렬 */
    }

    /* 버튼 호버 효과 */
    .reset-btn:hover {
        background-color: lightgray;
    }
    
    /* 페이징 */
    .pagination .page-link {
    color: black !important;
	}
	
	/* 이미지 크롭 */
	 .cropped-image {
	   width: 124px;
	   height: 124px;
	   object-fit: cover;
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
				<jsp:include page="../../community/communityTopNavi2.jsp"></jsp:include>
			</div>
		</div>
		<!-- 커뮤니티 메뉴바 -->
	
		<!-- 커뮤니티 컨테이너 -->
		<div class="container main_box">
			<div class="row">
			
			<!-- 왼쪽 -->
			<!-- <div class="col" >
				
			</div> -->
			<!-- 왼쪽 -->
			
			<!-- 가운데 -->
			<div class="col-9">
				<div class="align-items-center justify-content-center justify-content-lg-center"> 
					
					<%-- 검색 --%>
					<div class="row">
					<div class="col">
					
					</div>
					</div>
					
					<%-- 검색--%>	
					<form action="./mainPage" method="get">
						<div class="row mt-3"> 
							<div class="col d-grid">
							</div>
							<div class="col-2">
								<select name="recruit_searchType" class="form-select">
									<option value="title" selected>제목</option>
									<option value="content">내용</option>
									<option value="nickname">작성자</option>
								</select>				
							</div>
							<div class="col-3">
								<input name="recruit_searchWord" type="text" class="form-control">
							</div>
							<div class="col-1 ms-3" style="position:relative;">
								 <button type="submit" class="btn btn-outline-dark">
								  	<span class="bi bi-search"></span>
								</button>
							</div>
							</div>	
					
<!-- 						<div class="row mt-3"> 
							<div class="col text-center justify-content-center">
							<div class="mt-3">
							<button type="button" class="category-item btn btn-outline-secondary rounded-pill btn-md m-1">사무</button>
							<button type="button" class="category-item btn btn-outline-secondary rounded-pill btn-md m-1">연구</button>
							<button type="button" class="category-item btn btn-outline-secondary rounded-pill btn-md m-1">기술</button>
							<button type="button" class="category-item btn btn-outline-secondary rounded-pill btn-md m-1">금융</button>
							<button type="button" class="category-item btn btn-outline-secondary rounded-pill btn-md m-1">영업</button>
							<button type="button" class="category-item btn btn-outline-secondary rounded-pill btn-md m-1">서비스</button>
							<button type="button" class="category-item btn btn-outline-secondary rounded-pill btn-md m-1">예술</button>
							<button type="button" class="category-item btn btn-outline-secondary rounded-pill btn-md m-1">스포츠</button>
							<button type="button" class="category-item btn btn-outline-secondary rounded-pill btn-md m-1">보건</button>
							<button type="button" class="category-item btn btn-outline-secondary rounded-pill btn-md m-1">교육</button>
							<button type="button" class="category-item btn btn-outline-secondary rounded-pill btn-md m-1">물류</button>
							<button type="button" class="category-item btn btn-outline-secondary rounded-pill btn-md m-1">생산</button>
							</div>
							
							</div>
						</div> -->

							
							
							<hr>
							<div class="row">
							<div class="col d-grid text-center justify-content-center align-items-center" style="margin-left: 70px;">
							<strong class="me-2">원하는 카테고리를 골라보세요!</strong> 
							</div>
							
							<div class="col-2 me-1">
							<button type="reset" class="reset-btn text-end justify-content-end">
					            <i class="bi bi-arrow-clockwise"></i> 초기화
					        </button>
							</div>
							
							</div>
							
							<hr>
							
							<%-- 직업 네비바 --%>	
							<div class="row mt-3"> 
							<div class="col text-start justify-content-start d-flex align-items-center">
							<span class="ms-4" style="font-size: 20px;"><strong>직업</strong></span>
							</div>
							<div class="col-1 text-end justify-content-center me-3">
							<div class="form-check">
							    <input class="form-check-input" type="checkbox" id="seoulCheckbox">
							    <label class="form-check-label" for="seoulCheckbox">
							        무관
							    </label>
						    </div>
							</div>
							</div>
							
							<div class="row mt-1 ms-3 me-1"> 
							<div class="col text-center justify-content-center">
							<div id="carouselExample" class="carousel slide">
							  <div class="carousel-inner">
							    <div class="carousel-item active">
							    	<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">사무</button>
									<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">연구</button>
									<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">기술</button>
									<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">영업</button>
							    	<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">서비스</button>
									<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">예술</button>
									<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">스포츠</button>
									<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">보건</button>
									<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">교육</button>
									<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">금융</button>
									<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">물류</button>
									<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">생산</button>
							      	
							    </div>
							    <div class="carousel-item">
							      	<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">사무</button>
									<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">연구</button>
									<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">기술</button>
									<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">영업</button>
							    </div>
							    <div class="carousel-item">
							      	<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">서비스</button>
									<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">예술</button>
									<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">스포츠</button>
							    </div>
							    <div class="carousel-item">
							     	<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">보건</button>
									<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">교육</button>
									<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">금융</button>
							    </div>
							    <div class="carousel-item">
							      	<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">물류</button>
									<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">생산</button>
							    </div>
							  </div>
							  
							  <!-- <div class="justify-content-start">
							  <button class="carousel-control-prev justify-content-start" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
							    <span class="carousel-control-prev-icon" aria-hidden="true"><i class="bi bi-chevron-left"></i></span>
							    <span class="visually-hidden">Previous</span>
							  </button>
							  </div>
							  
							  <div class="justify-content-end">
							  <button class="carousel-control-next justify-content-end" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
							    <span class="carousel-control-next-icon" aria-hidden="true"><i class="bi bi-chevron-right"></i></span>
							    <span class="visually-hidden">Next</span>
							  </button>
							  </div> -->
							</div>
			
							
							</div>
							</div>	
							<%-- 직업 네비바 --%>
							
							<%-- 지역 네비바 --%>	
							<div class="row mt-3"> 
							<div class="col text-start justify-content-start d-flex align-items-center">
							<span class="ms-4" style="font-size: 20px;"><strong>지역</strong></span>
							</div>
							<div class="col-1 text-end justify-content-center me-3">
							<div class="form-check">
							    <input class="form-check-input" type="checkbox" id="seoulCheckbox">
							    <label class="form-check-label" for="seoulCheckbox">
							        전국
							    </label>
						    </div>
							</div>
							</div>
							
							<div class="row mt-3 ms-3 me-1"> 
							<div class="col justify-content-center">
							<div id="carouselExample" class="carousel slide">
							  <div class="carousel-inner">
							    <div class="carousel-item active">
							    	<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">서울특별시</button>
									<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">경기도</button>
									<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">인천광역시</button>
									<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">강원특별자치도</button>
							    	<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">대전광역시</button>
									<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">세종특별자치시</button>
									<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">충청남도</button>
									<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">충청북도</button>
									<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">부산광역시</button>
									<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">울산광역시</button>
									<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">경상남도</button>
									<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">경상북도</button>
							      	<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">대구광역시</button>
									<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">광주광역시</button>
									<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">전라남도</button>
									<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">제주특별자치도</button>
									<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">전라북도</button>
							    </div>
							    <div class="carousel-item">
							      	<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">사무</button>
									<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">연구</button>
									<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">기술</button>
									<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">영업</button>
							    </div>
							    <div class="carousel-item">
							      	<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">서비스</button>
									<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">예술</button>
									<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">스포츠</button>
							    </div>
							    <div class="carousel-item">
							     	<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">보건</button>
									<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">교육</button>
									<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">금융</button>
							    </div>
							    <div class="carousel-item">
							      	<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">물류</button>
									<button type="button" class="btn btn-outline-secondary rounded-pill btn-md m-1">생산</button>
							    </div>
							  </div>
							  
							  <!-- <div class="justify-content-start">
							  <button class="carousel-control-prev justify-content-start" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
							    <span class="carousel-control-prev-icon" aria-hidden="true"><i class="bi bi-chevron-left"></i></span>
							    <span class="visually-hidden">Previous</span>
							  </button>
							  </div>
							  
							  <div class="justify-content-end">
							  <button class="carousel-control-next justify-content-end" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
							    <span class="carousel-control-next-icon" aria-hidden="true"><i class="bi bi-chevron-right"></i></span>
							    <span class="visually-hidden">Next</span>
							  </button>
							  </div> -->
							</div>
			
							
							</div>
							</div>	
							<%-- 지역 네비바 --%>
							
							
							
							
					
						
					</form>
					<%-- 검색--%>	
					<%-- 검색 --%>
					
					<%-- 카드 recruitBoardList sample--%>
					<div class="card mt-4 mb-3" style="padding: 8px;">
						<div class="card-body">
					  	<div class="row">
					  	
					  		<div class="col-4">
						  		<img class="img-fluid" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZoAYql4F9tPk9jw3aTYPQiqapBIHvHdmrxw&usqp=CAU" alt="...">
						  	</div>
						  	
						  	<div class="col d-grid">
						  	
							  	<div class="row">
						  		<div class="col">
								    <h4 class="card-title">
										주식회사 다온
									</h4>
								    <p class="card-text">
								    	<div class="row">
						  				<div class="col">
								    	<div class="d-flex align-items-center">
											<!-- <span class="badge border border-primary text-primary me-1" style="font-size: 13px;">영업</span> -->
											<span class="badge rounded-pill mt-1 me-2" style="font-size: 12px; position: relative; top: -3px; color: #0095ff; background-color: transparent; border: 1px solid #0095ff;">영업</span>
											<span class="text-align-center mb-1">물류팀 직원구인 경력무관</span>
										</div>
										<span class="text-secondary mt-2" >인천 · </span>
										<strong class="mt-1 " style="color: #ff501b;"> 월 </strong>
										<strong class=" mt-1" style="color: #ff501b;"> 250만원</strong>
										</div>
										</div>
										
										<div class="row">
										<div class="col">
										
										<span class="text-secondary mt-2" ></span>
										</div>
										</div>
									</p>
								</div>
								</div>
								
								<div class="row">
						  		<div class="col d-flex align-items-center justify-content-start">
								    <a href="#" class="btn btn-primary">공고 지원하기 <i class="bi bi-box-arrow-up-right"></i></a>
								</div>
								</div>
								
						    </div>
						    
						    <div class="col-1 d-flex align-items-start justify-content-end me-3" style="font-size: 20px;">
						    	<i class="bi bi-heart" ></i>
						    </div>
						    
					  	</div>
					  </div>
					</div>
					<%-- 카드 recruitBoardList sample --%>
					
					<%-- 카드 recruitBoardList --%>
					<c:forEach items="${recruitBoardList}" var="recruitDto">
					<div class="card mb-3" style="padding: 8px;">
						<div class="card-body">
					  	<div class="row">
					  	
					  		<div class="col-4">
					  			<div class="row mt-1">
										<div class="col">
										<c:if test="${recruitDto.recruitImgCount>=1}">
											<img src="/uploadFiles/${recruitDto.recruitImgLinkDtoList[0].img_link}"
												class="cropped-image" style="height: 225px; width: 225px;">
										</c:if>
											<c:if test="${recruitDto.recruitImgCount==0}">
											<img src="/safari/resources/img/community/no-image.gif"
											class="cropped-image" style="height: 225px; width: 225px;">
											</c:if>
										</div>
									</div>		
						  	<!-- 	<img class="img-fluid" src="data:image/jpeg;base64,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" alt="...">
						  	 --></div>
						  	
						  	<div class="col d-grid">
						  	
							  	<div class="row">
						  		<div class="col">
								    <h5 class="card-title">${recruitDto.userDto.nickname}</h5>
								    <p class="card-text">
								    <div class="d-flex align-items-center">
									<%-- 직무 --%>
									
									<span id="positionName_${recruitDto.recruitDto.id}" class="badge rounded-pill mt-1 me-2" style="font-size: 12px; position: relative; top: -3px; color: #0095ff; background-color: transparent; border: 1px solid #0095ff;"></span>
									<script>
											 // 시작
											    var positionCode = ${recruitDto.recruitDto.position_category_id};

											    // 직무 코드에 따라 직무명 설정
											    var positionName;
											    switch (positionCode) {
											        case 11:
											            positionName= "사무";
											            //document.getElementById("positionName_${recruitDto.recruitDto.id}").style.color = "red";
											            break;
											        case 12:
											            positionName= "연구";
											            break;
											        case 13:
											            positionName= "기술";
											            break;
											        case 14:
											            positionName= "영업";
											            break;
											        
											        case 21:
											            positionName= "서비스";
											            break;
											        case 22:
											            positionName= "예술";
											            break;
											        case 23:
											            positionName= "스포츠";
											            break;
											        
											        case 31:
											            positionName= "보건";
											            break;
											        case 32:
											            positionName= "교육";
											            break;
											        case 33:
											            positionName= "금융";
											            break;

											        case 41:
											            positionName= "물류";
											            break;
											        case 42:
											            positionName= "생산";
											            break;
											             
											        default:
											            positionName= "기타";
											            break;
											    }
											     
											 
											    switch (Math.floor(positionCode/10)) {
										        case 1:
										            document.getElementById("positionName_${recruitDto.recruitDto.id}").style.color = "#0095ff";
										            document.getElementById("positionName_${recruitDto.recruitDto.id}").style.borderColor = "#0095ff";
										            break;
										        
										        case 2:
										        	document.getElementById("positionName_${recruitDto.recruitDto.id}").style.color = "#ff9200";
										        	document.getElementById("positionName_${recruitDto.recruitDto.id}").style.borderColor = "#ff9200";
										            break;
										       
										        
										        case 3:
										        	document.getElementById("positionName_${recruitDto.recruitDto.id}").style.color = "#93c400";
										        	document.getElementById("positionName_${recruitDto.recruitDto.id}").style.borderColor = "#93c400";
										            break;
										       

										        case 4:
										        	document.getElementById("positionName_${recruitDto.recruitDto.id}").style.color = "#7a45e6";
										        	document.getElementById("positionName_${recruitDto.recruitDto.id}").style.borderColor = "#7a45e6";
										            break;
										        
										             
										        default:
										        	document.getElementById("positionName_${recruitDto.recruitDto.id}").style.color = "gray";
										            break;
										    }
											    
											    // 결과를 화면에 출력
											    document.getElementById("positionName_${recruitDto.recruitDto.id}").textContent = positionName;
											    //console.log( document.getElementById("positionName_${recruitDto.recruitDto.id}").textContent);
												// 끝
											</script>
									<%-- 직무 --%>
									<span class="text-align-center mb-1">${recruitDto.recruitDto.title}<br></span>
									</div>
										<%-- 위치 --%>
										<span class="text-secondary mt-1" id="locationName_${recruitDto.recruitDto.id}"></span>
										<span class="text-secondary mt-1" > · </span>
										<script>
											// 서버로부터 받은 지역 코드
											if (typeof ${recruitDto.recruitDto.location} === 'number') {
												console.log("a"); // 결과 출력
												
												 // 시작
											    var locationCode = ${recruitDto.recruitDto.location};

											    // 지역 코드에 따라 지역명 설정
											    var locationName;
											    switch (locationCode) {
											        case 1:
											            locationName = "서울";
											            break;
											        case 2:
											            locationName = "경기";
											            break;
											        case 3:
											            locationName = "인천";
											            break;
											        case 4:
											            locationName = "강원";
											            break;
											        case 5:
											            locationName = "대전";
											            break;
											        case 6:
											            locationName = "세종";
											            break;
											        case 7:
											            locationName = "충남";
											            break;
											        case 8:
											            locationName = "충북";
											            break;
											        case 9:
											            locationName = "부산";
											            break;
											        case 10:
											            locationName = "울산";
											            break;
											        case 11:
											            locationName = "경남";
											            break;
											        case 12:
											            locationName = "경북";
											            break;
											        case 13:
											            locationName = "대구";
											            break;
											        case 14:
											            locationName = "광주";
											            break;
											        case 15:
											            locationName = "전남";
											            break;
											        case 16:
											            locationName = "전북";
											            break;
											        case 17:
											            locationName = "제주";
											            break;
											        default:
											            locationName = "전국";
											            break;
											    }

											    // 결과를 화면에 출력
											    document.getElementById("locationName_${recruitDto.recruitDto.id}").textContent = locationName;
												// 끝
											} else {
												console.log("b"); // 결과 출력 
												
												//시작
												var locationName = '${recruitDto.recruitDto.location}';
												document.getElementById("locationName").textContent = locationName;
												//끝
											}
											</script>
										<%-- 위치 --%>
										<%-- <span class="text-secondary mt-1" >${recruitDto.recruitDto.location} · </span> --%>
										<strong class="mt-1 " style="color: #ff501b;"> 월 </strong>
										<strong class=" mt-1" style="color: #ff501b;"> ${recruitDto.recruitDto.salary}만원</strong>
									</p>
								</div></div>
								
								<div class="row">
						  		<div class="col d-flex align-items-center">
								    
								<button type="button" class="btn btn-primary" onclick="window.location.href='/safari/community/recruit/readContentPage/${recruitDto.recruitDto.id}'">공고 지원하기 <i class="bi bi-box-arrow-up-right"></i></button>
								
								</div></div>
								
						    </div>
						    
						    <%-- 좋아요 & 조회수 --%>
						    <div class="col-1 d-flex align-items-start justify-content-end me-3" style="font-size: 20px;">
						    	<%-- <i class="bi bi-eye me-2"></i> <span class="me-3" style="font-size: 15px;">${recruitDto.recruitDto.views}</span>  --%>
						    	<i class="bi bi-heart" ></i>
						    </div>
						    <%-- 좋아요 & 조회수 --%>
						    
					  	</div>
					  </div>
					</div>
					</c:forEach>
					<%-- 카드 recruitBoardList --%>
					
					<%-- 글쓰기버튼 --%>
					<div class="row">
						<div class="col text-end pe-5">
							<c:if test="${!empty sessionUser }">
								<a href="/safari/community/recruit/writeContentPage" class="btn btn-default px-2 text-body-secondary">글쓰기</a>
							</c:if>
						</div>
					</div>
					<%-- 글쓰기버튼 --%>
					
						<%-- 페이지 버튼 --%>
						<div class="row">
								<div class="col d-flex align-items-center justify-content-center">
									<nav aria-label="Page navigation example">
									  <ul class="pagination mb-0">
									   <li class="page-item"><a class="page-link" href="#">&lt;</a></li>   
									   <c:forEach begin="1" end="${totalRecruitPage}" var="recruitIndex">
									   		<c:choose>
									   			<c:when test="${recriotIndex == currentRecruitPage}">
									   				<li class="page-item"><a class="page-link" href="/safari/community/recruit/mainPage?recruitPage=${recruitIndex}"><strong>${recruitIndex}</strong></a></li>
									   			</c:when>
									   			<c:otherwise>
									   				<li class="page-item"><a class="page-link" href="/safari/community/recruit/mainPage?recruitPage=${recruitIndex}">${recruitIndex}</a></li>
									   			</c:otherwise>
									   		</c:choose>
									   	
									   </c:forEach>
									   <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
									  </ul>
									 </nav>
								</div>
							</div>
						<%--페이지 버튼  --%>
						
<%-- 					recruitBoardList
					<div class="row"  style="text-align:center">
						<div class="col">
						
						</div>
						<div class="col">
								<c:forEach items="${recruitBoardList}" var="recruitDto">							
									<div class="align-middle">
										<a class="text-black text-decoration-none" href="/safari/community/recruit/readContentPage/${recruitDto.recruitDto.id}" >
										${recruitDto.recruitDto.id}<br>
										</a>
										${recruitDto.userDto.nickname}<br>
										<a class="text-black text-decoration-none" href="/safari/community/recruit/readContentPage/${recruitDto.recruitDto.id}">
										${recruitDto.recruitDto.title}</a><br>
										${recruitDto.recruitDto.location}<br>
										${recruitDto.recruitDto.salary}<br>
										${recruitDto.recruitDto.views}<br>
										<fmt:formatDate value="${recruitDto.recruitDto.reg_date}" pattern="yyyy.MM.dd"/>
										<br>
									</div><hr>
								</c:forEach>	
						</div>	
					</div>	
					recruitBoardList --%>
						
				</div>	
			</div>
			<!-- 가운데 -->
			 
			
			<!-- 오른쪽 -->
			<div class="col" ><!-- 
				<img class="img-fluid ms-3" src="https://apple.contentsfeed.com/RealMedia/ads/Creatives/jobkorea/230718_seoul_al_ssky/230718_seoul_120600.png" alt="..."> -->
			<img class="img-fluid ms-3" src="/safari/resources/img/community/rankingbanner.png" alt="...">
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