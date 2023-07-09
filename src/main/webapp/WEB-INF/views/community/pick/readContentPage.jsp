<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사파리 | 골라줘요 상세보기</title>

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
			<div class="col" style="background-color:lightgrey;">
				왼쪽
			</div>
			<!-- 왼쪽 -->
			
			<!-- 가운데 -->
			<div class="col" >
				<div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-center">
					
					<%-- pickBoardList --%>
					<div class="row">
						<div class="col" style="width:990px;"> 
						
							<%-- 골라줘요 항목 foreach --%>
									
								<div class="align-middle ms-4 me-4 mb-4" style="text-align:start">
								<hr>
									
									<div class="ms-2 me-2" style="font-size: 14px;">
									
									<div class="row">
										<div class="col">
										<span class="badge rounded-pill text-bg-dark mt-2 me-1 mb-3" style="padding: 6px 10px; font-size: 16px;">골라줘요</span> 
										 ${map.userDto.nickname }
										| <i class="bi bi-clock mt-2" style="font-size: 12px;"></i> <fmt:formatDate value="${map.pickDto.reg_date}" pattern="yyyy.MM.dd"/>
										| views👀 · ${map.pickDto.views}
										</div>
										
										<div class="col">
											<div style="display: flex; justify-content: flex-end;">  
											<c:choose>
												<c:when test="${sessionUser.id == map.userDto.id}">
													<a href="/safari/community/pick/updateContentPage/${map.pickDto.id}" class="nav-link px-2 text-body-secondary"><i class="bi bi-pencil-square"></i></a>
													<a href="/safari/community/pick/deleteContentProcess/${map.pickDto.id}" class="nav-link px-2 text-body-secondary"><i class="bi bi-eraser-fill"></i></a>
												</c:when>
											<%-- 여기에 책갈피(찜) 넣기 --%>
												<c:otherwise>
													<a href="/safari/community/pick/insertPickLikeProcess/${map.pickDto.id}" class="nav-link px-2 text-body-secondary"><i class="bi bi-bookmark font-weight-bold" ></i></a>
												</c:otherwise>
											</c:choose>
											</div>
										</div>
									</div>
									
									<br>
									
									<div class="ms-2 me-2 mb-3">
										
										${map.pickDto.content}
									<br>
									</div>
										
										<%-- 내용카드 --%>
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
									
										 <div class="row">
										  <div class="col-md-6 mt-2 mb-5">
										  <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-center" >
										  <div class="card" style="width: 255px; height: 320px;">
										    <div class="d-felx justify-content-center">
										    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrh5aGdIDL0QBkRKzHK53gF4MaE-fSsMH54A&usqp=CAU" 
										    class="rounded mx-auto d-block" alt="..." style="width: 250px; height: 250px;">
										      <div class="card-body">
										        <h6 class="card-title text-body-secondary mb-1">기본 티셔츠</h6>
										        <p class="card-text mb-2">10,000원</p>
										        <div class="text-center">
										        </div></div></div>
										    </div><button type="button" class="btn btn-outline-secondary rounded-pill btn-sm mt-4" style="width: 250px;">C</button>
										      </div>
										  </div>
										  
										  <div class="col-md-6 mt-2 mb-5">
										  <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-center" >
										  <div class="card" style="width: 255px; height: 320px;">
										    <div class="d-felx justify-content-center">
										    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTd-KkEW4Y-4Ys91kGSucRD6TBmYUKWypARIQ&usqp=CAU" 
										    class="rounded mx-auto d-block" alt="..." style="width: 250px; height: 250px;">
										      <div class="card-body">
										        <h6 class="card-title text-body-secondary mb-1">나이키 티셔츠</h6>
										        <p class="card-text mb-2">40,000원</p>
										        <div class="text-center">
										        </div></div></div>
										    </div><button type="button" class="btn btn-outline-secondary rounded-pill btn-sm mt-4" style="width: 250px;">D</button>
										      </div>
										  </div>
										 </div>
										<%-- 내용카드 --%>
										
										
										<%-- 해시태그 --%>
										<div class="mt-3">
											<button type="button" class="btn btn-outline-secondary rounded-pill btn-sm">#해시태그</button>
											<button type="button" class="btn btn-outline-secondary rounded-pill btn-sm">#해시태그</button>
											<button type="button" class="btn btn-outline-secondary rounded-pill btn-sm">#해시태그</button>	
										</div>
										<%-- 해시태그 --%>
									</div>
								</div>
								<%-- 골라줘요 항목 foreach --%>
						
						<%-- 좋아요 
						<br>
						<div style="text-align: center; font-size: 18px;">
						 <button onclick='location.href="/safari/community/pick/insertPickLikeProcess/${map.pickDto.id}"' style="background: none; border: none; padding: 0;">
							<i id="likeIcon" class="bi-heart${PickBoardLikeCount > 0 ? "-fill" : ""}" style="color: red;"></i>
 							 </button>
						<span style="color: grey;">${PickBoardLikeCount}</span>
						</div>--%>
						<%-- 좋아요 --%>
						
						<div class="align-middle ms-4 me-4 mb-2" style="text-align:start"><hr></div>
						
						
						<%-- 목록으로 버튼 --%>
						<div class="row">
							<div class="col text-end d-grid align-middle ms-4 me-4 mb-4">
								<a href="/safari/community/pick/mainPage" class="nav-link px-2 text-body-secondary"> 목록으로 </a>  
							</div>
						</div>
						<%-- 목록으로 버튼 --%>
					
								<%-- 댓글작성 --%>
								<div class="row">
								<div class="col">
								
								</div>
								</div>
								<%-- 댓글작성 --%>
								
								<div class="align-middle ms-4 me-4 mb-4" style="text-align:start">
								<%-- 댓글 폼 --%>
								<form action="/safari/community/pick/writeCommentProcess/${map.pickDto.id}" method="post">
									<%-- <input type="hidden" name="user_id" value="${sessionUser.id}">--%>
									<input type="hidden" name="pick_id" value="${map.pickDto.id}">
									
									
									<div class="row mt-2">
									<div class="col-1 text-center">
										<c:if test="${!empty sessionUser}">
								          <a href="#" class="d-block link-body-emphasis text-decoration-none" aria-expanded="false">
								            <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle">
								          </a>		        	
							        	</c:if>
									</div>
									<div class="col-10">
										<input type="text" class="form-control" name="content">
									</div>
										<div class="col d-grid">
											<button class="btn btn-secondary" type="submit"><i class="bi bi-chat-text"></i></button>
											</div>
									</div>
								</form>
								<%-- 댓글 폼 --%>
								
								<%-- 댓글 조회 --%>
								<div class="row">
								<div class="col mx-2">
								<br>
								
								<c:forEach items="${pickCommentsList}" var="pickCommentDto">
								<form action="/safari/community/pick/deleteCommentProcess/${pickCommentDto.pickCommentDto.id}" method="post">
									
									<%-- 댓글 프로필 --%>
									<div class="d-flex align-items-center">
										<a href="#" class="d-block link-body-emphasis text-decoration-none ml-2 me-1" aria-expanded="false">
									    <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle">
									    </a>&nbsp;
									<span class="fw-bold ml-2" style="font-size: 15px">${pickCommentDto.userDto.nickname}</span>&nbsp;
									
									<span class="text-muted ml-2 mb-1" style="color: grey; font-size: 12px; font-family: 'Noto Sans', sans-serif;">|&nbsp;<fmt:formatDate value="${pickCommentDto.pickCommentDto.reg_date}" pattern="yyyy.MM.dd HH:mm"/>
									</span>
									</div>
									<%-- 댓글 프로필 --%>
									
									<input type="hidden" value="${pickCommentDto.pickCommentDto.id}" name="id"> <%-- 댓글의 ID --%>
									<input type="hidden" value="${map.pickDto.id}" name="pick_id"> <%-- 게시글의 ID --%>
									
									<%-- 임시
									<div style="display: flex; align-items: center; margin-left: 28px; white-space: normal;">
									  <input type="text" class="form-control border-0 bg-transparent" value="${pickCommentDto.pickCommentDto.content}" style="box-shadow: none; caret-color: transparent; flex-grow: 1; margin-right: -5px;">
									  <button style="background: none; border: none; padding: 0; margin-right: 10px;margin-right: 10px;"> <i class="bi bi-backspace-fill" style="color: black;"></i> </button>
									</div>--%>
									
									<div style="display: flex; align-items: center; margin-left: 28px; word-wrap: break-word;">
  <input type="text" class="form-control border-0 bg-transparent" value="${pickCommentDto.pickCommentDto.content}" style="box-shadow: none; caret-color: transparent; flex-grow: 1; margin-right: -5px;">
  <button style="background: none; border: none; padding: 0; margin-right: 10px;"> <i class="bi bi-backspace-fill" style="color: black;"></i> </button>
</div>


									<hr>
									
								</form>
								</c:forEach>
								</div>
								</div>
								<%-- 댓글 조회 --%>
								</div>
								
							
								
						</div>	
					</div>	
					<%-- pickBoardList --%>
						
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