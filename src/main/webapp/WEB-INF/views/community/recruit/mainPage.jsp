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
			<div class="col" >
				
			</div>
			<!-- 왼쪽 -->
			
			<!-- 가운데 -->
			<div class="col-9">
				<div class="align-items-center justify-content-center justify-content-lg-center"> 
					
					
					<%-- 카드 recruitBoardList sample--%>
					<div class="card mb-3" style="padding: 8px;">
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
								    	<div class="d-flex align-items-center">
											<!-- <span class="badge border border-primary text-primary me-1" style="font-size: 13px;">영업</span> -->
											<span class="badge rounded-pill mt-1 me-2" style="font-size: 12px; position: relative; top: -3px; color: #0095ff; background-color: transparent; border: 1px solid #0095ff;">영업</span>
											<span class="text-align-center mb-1">물류팀 직원구인 경력무관</span>
										</div>
										<span class="text-secondary mt-2" >인천 서구 · </span>
										<strong class="mt-1" style="color: #ff501b;"> 월 </strong>
										<strong class="text-secondary mt-1"> 250만원</strong>
									</p>
								</div></div>
								
								<div class="row">
						  		<div class="col d-flex align-items-center justify-content-start">
								    <a href="#" class="btn btn-primary">공고 지원하기 <i class="bi bi-box-arrow-up-right"></i></a>
								</div></div>
								
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
						  		<img class="img-fluid" src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBUIEhMUCBQUFBQTEhIVExQSFxQUFxcUJCAmHBcgFRcoLDokGyowKyIiLzwlLzAwQDU1LzBBRTs+PTo/NT0BCwsLEA4QGhISGzAkJCQwMDAwMD0wMDIwMDAwMD0yMzAyMjIyMDI9Mj0wMD0yMjIyMj0yPT0yPTIyMjIwPT0yPf/AABEIANYA1gMBIgACEQEDEQH/xAAcAAEAAwADAQEAAAAAAAAAAAAABQYHAQQIAwL/xABJEAACAQICBAgICwYFBQAAAAAAAQIDEQQFBhIhMQcTIkFRYYHRFjJTkZKxssEUFTNDUlRxcnOC0hc0QmJ0kyM1oaLhJIOjs/D/xAAaAQEAAgMBAAAAAAAAAAAAAAAAAwQBAgUG/8QAMBEAAgEDAgMGBgEFAAAAAAAAAAECAwQREjEhgbEFEzNBUdEyNFJhkcFxFBUiI6H/2gAMAwEAAhEDEQA/ANmAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM64S9IMTk1ShHLKrpqcJuSUYyu00lvTNFMm4YvlsL+HU9aJrdJ1EmbR3K94d5h9Zl6FL9I8Osw+sy9Cl+krTCOl3UPpRNpRZfDvMPrMvQpfpLPwfaTYvNsZxeYVnOHFTlquMFtVrO6RmZdeCn/MP+xU9aI61OChJpIxJLDNqAByyAAAAAAAEJpfjJ4DA4irg5ak4QTjKydndLc9hNle08/wAtxX3F7SNoLMkvuZW5k3h1mH1mXoUv0knkul2NxPGcfXk7atuTBdPUUgmtHfnfye8sdpxULaUorD4dTo2dOMqyTWd+hcPCXFeWl5o9xz4S4ry0vNHuIcHlO+qfU/ydz+mo/QvwiY8JcV5aXmj3Fr0NzGpmEarxk3PVlFRukrXvfcZ4Xng98Sv96n7yzaVJyqpNt7lLtChTjQbjFJ8PL7lyAB2DzwAAAAAAAAAMn4Y/lsL+HP2kawZPwx/LYX8KftIntvERtD4jOC06NaFVdIqLq4apThGNSVO09e90k77F/MVY2Tgj/cKn9VP2IF64m4QyvUlk8LKK3+yzE+Wo/wDk7if0N0IrZBiuOxNSnOPFzhaGve7t0rqL/c5KErick02RObYB1cdjaeXwc8bUhTgt8ptRX/P2FXr8I+BpStGdSfXCnK3+tiNRlLZZMJNlyBX8o0uwebyUcJWWu90Jpwk/up+N2XLAYaaeGYwADoZlmtHKoa+YVIU482s9r6orfLsMA75XtPP8txX3F7SOlHhDwEpavGzX8zpzt6j66YYunjcqxM8JONSEqatKDUk+UuckUJRlHKxxRslhowlE3o785+T3kIib0d+c/J7yftX5WfLqjp2Pjx59CZLJgtEamLpwqQnTSnFSSetfb2FbRrOQfuuH/Ch6jzVpRjVk1LyR0O0bidCEXB4yyo+A9bylL/d3Fg0YyWeTxqKvKMtdxa1b81+8nwdKnbU6ctUUcWrfVqsdE3w/g5BwLlgqHIBxcA5BwLgHIAABk/DH8thfw5+0jWDJuGL5bC/h1PWie28RG0NzOTsUMbVw6th6lSCve0Jzir9Nkzrg6mCc7vxrX8vW/u1O8vfB3nnwHD4+vmVSpOFJUGteUpu710lG73t2Rm59o4mUYSpxfInOE5LplFNR82tIjqUlOODDWUd/SDPqufVXUxktl3qU0+TTj0RXrfORTOUr7jW8g4N6EKCecqc6sopyjGbjGHUrb2udu5idSFFINqJkidtxrPBvpdLH/wDS5nLWqRjelUb2zgt8ZdLW+/Or9F3TNONF/BurHiZOVGqpODlvTXjRl071t5yBy/GSwFWnVw+ydOcZx+1O9n1Pc+oxOMa0OHINakegNIM3hkdCpXr7dVWjG9nOb8WK/wDtiuzBM3zWpnNWVXHS1pS3LmjHmjFcyRbeE7PVmc8PTwkr0o0oVn1ymtaOsuqNvSZRGR2tLEdT3ZrCOFkEjgM4q4KlXoxd6deGrOD3KV01KPQ9lutdhM5FoLis6pqrT4ulTl4jqOSc+uMUt3WyGzrJ6uSVXSx8bStdOLvGUemL5yfXCT05yzbKI4m9HfnPye8hCb0d+c/J7yl2r8rPl1RdsfHjz6EydiGLqQVoTmktyUpJI64PIJ4O+4p7nY+HVPKVPTl3kxl1Crj8NXnRnU16UoSS157Y2est/b2FfLzwfbYV/vU/eWLZa6mlvfPQpX2KdLVFLKa8l6lO+G1fKT9OXed/Js6ngK0ZVZznDxZxlJy5L32vzreffSvKvi+trUl/h1G5RtujL+KPvXUQJpLXSnjPFEsFSuKWUliSNmpVFWSlTd4tJprc1zGdaTZ1LGVmsLOUYQvGOpJrWfO9m/q6j8YPSKWHwk6G3Wvqwn9GD8Zd329RBFm5utcUo8/YpWVh3U5SnxxwXuff4bV8pP05d5oGiOBnQpcZipTlOpZpTberDm8+/wAxUdF8p+NKy41ciFpVOvoj2+q5qFrbiSxpN/5vl7kPalaK/wBUUvV/pHIAOkcYGTcMXy2F/DqetGsmT8Mfy2F/Cn7SJ7bxFz6G0NzODQdBNDsPn+FnVxzqKarSp8iUYrVUYvofSzPjZOCP9wqf1U/YgXbmTjDKfmSzeEfv9mOC+lX9OH6TK9JcHTwGLr0sFrcXTqai13d7FaV39tz0YedtLFq4/F3+s1vabRDazlKTy88DWm23xI/B4h4WpTqQSbp1ITSnti2ndKS50XP9qGN8nh/QqfqKTRpSryUaEZTk90YJyk/sS3nb+JcT9Wr/ANmp3FmcIS+LBI0nuSukWl9fSKnGnjoUkoTU06cZJ3s1a7b2bSuHe+JcT9Wr/wBmp3D4mxP1av8A2qncZjoisLCCSR06lR1Xeo7u0Y7ehJRiuxJI7WUYP4fiKNLylWnTbXMnJJvsR1ZwdJuNROLTaaas09zTXMTmg81DMsJxm7jUu1pqP+tjabxFtBm90aUaEYwpJRjGKjGK2JRWxJFI4WMvVfBwrJcqhUjt/klyWvPql9Krwku2WYi/TR/9kTk0nicX9yvHdGFIm9Hfnfye8hCb0d+d/J7yftX5WfLqjqWPjx59CZLzleilDF0KU6rnrTpxk7NWu1zbCjI1nIP3Wh+FD1HnLKEZyepZ4F3tSrOnCLg8cf0RfgZh/pVfSXcSWUZPTylSWGcuW03rO+7oJQHTjRpxeYxRw53FWa0yk2iOzrLo5pRlCe/fB/RnzMymtSlQnKFVWcW4yT5mbMzNNMqkKuJlxG+MVGo1uc/+FZFO/prSp+ex0eya0lJ0/J8f4ZAH7pU3Vko01fWaSS3t7kj8EzopWp0MVB4rnvGLe6M3si36u05sIqUknwydqtNwhKSWcIvuQ5asroxhs13ypvplz+bcSpwjk9FGKikl5HkJScm5SeWwADJqDJ+GP5bC/hT9pGsGT8Mfy2F/Cn7SJ7bxFz6G0PiM4Nk4I/3Cp/VVPYgY2bJwR/uFT+qn7EC3d+HzJKmxezCeEjCvDZlW2WVRQqR604pN+kpG7Gd8LGSvE0YYmgryo8ipbfxTex9j9bKltPTUX34GkHhmZ5FjvizFUK0t1OrCUrb3C/KS7LnoqjUjXjGVJqUZJSjJbU09qaZ5mLFk2mWLyeHF4WonTXixqR19X7r3r7C3cUHUw1ubzjk2TO9IsNkWp8aVNRz1tRKMpN2tfYls3ojP2hZf5aX9up3GM5rmlXN6jq4+bnNq3QlHmUVuSP1kmWyzfEU6FDfOaTf0Yb5S7FdkatIqOZMwqaxxOxpTqvGV54dtwq1OOg2nG8Ki4xOz+8R2CxMsHUp1KPjU6kKkb/Si7o0LhVyNYdUMRhY2hCEaE0t0UttJ+tX6kZuWKMlOmvwbxeUej8pzKnm1GFbCu8JxT60+dS6GtzKNwtZxGNKnhaUrylNVKiXNBJ6ql9r29hmuBzSvl9/gFWrT1t6hOUU+tpHWq1ZV5OVaTnKTvKUm5Nvpbe8hp2umaedjVQwz8E3o785+T3kITejvzn5PeRdq/Kz5dUX7Hx48+hMlkwWl1XCUoQp06bUIqKb1r2XaVsHkoVJQ4xeDt1aEKqSms4LX4cVvJ0v93eWDRjOZ5xGo68Yx1HFLVvz37jNC8aAS1addy2JSpt+Zly1r1J1UpPO5zb+1o06LlGOHwJvSLNFldFyXjy5NNfzdPZvMulLWd5bW3dt87JXSPNfjWs3H5OHJgurnfb3ESQ3VfvJ8Nlt7liwtu5p8fie/6Rwclseiz+Ba9nx/j6vPqW8W3Tbb9uwqZFUpSp41eaLFG4hWzoezwaZotmvxlRSqv/Ep2jPr6JdvruTxkuR5k8rrRmvF8WaXPDn7zVKVRVoxlTd4ySaa51zHXtK/eRw91uefv7buamVs9v2j7AAtFEGccJmQ4nN6tCWW0pVFCnNSacFZ3TW9o0cG8JuEtSMp4eTAvAjMPqs/Sp/qNN4OMrq5RhJ08wpunN4iclFuL5LjFJ7H1MuAJKleVRYZlzbB8a1KNeMoVkpRlFxlF7U4tWaa5z7AgNTE9MdB6mUTlVy6EquHbb5N5Tp9U1va/m85TLHp8ja+SYbEy1sRh6M5fSnTg357FyF20sSWSRVPU894HA1cxmqeBpzqTf8ADBX8/QutmzaC6JLR6Dni7SxE42k1tUI79WL5+t8+zoLRhcJTwi1cLThTj0QjGK8yOwR1bh1FjZGJTydPMsBDMqU6WLjrQqR1ZL1NdDW9PpMJ0o0YraPTarRcqTfIqpcmS5lL6L6megj5Vaca0XGqlKL2NSSaa60aUqzpv7GIyweZWXLIdC62NwtbEVKUtZ07Yam+TKUm1eW3crXtffv6L6tS0dwlKWvTwtBSTumqcNj6tmwltxPO7bWIrBs6noYH4EZh9Vn6VP8AUSuSaJY3D8Zx2HnG+rblQ6+s2gFe4quvTdOWzJKVzKlNTS2Mr8G8V5CXnh3nPg1i/Iy9KPeamDm/0FP1Zc/u1X0X/fcyvwbxXkJeeHeSGGy7F4XD1aNKjNOtKGs7w8RJ3W/n9VzRAZjZQjxTZrPtOpNYcVun5+XMyzwaxfkZeePeSej2jNTjoyzGDhGHKs3F60uZbH2mgAzGxpxafF4FTtSrOLjhLP5ODP8ASDRmoq0pZdBzhLlWTitWX8S2vtNBBNWoxqrEipb3E6EtUTLPBrF+Rl5495btE6dfDQdLMISjGO2nJuL2fR2PtLKCOlaRpS1RbJ7i/nXhplFAAFoogAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAH//Z" alt="...">
						  	</div>
						  	
						  	<div class="col d-grid">
						  	
							  	<div class="row">
						  		<div class="col">
								    <h5 class="card-title">${recruitDto.userDto.nickname}</h5>
								    <p class="card-text">
										${recruitDto.recruitDto.title}<br>
										<span class="text-secondary mt-1" >${recruitDto.recruitDto.location} · </span>
										<strong class="mt-1" style="color: #ff501b;"> 월 </strong>
										<strong class="text-secondary mt-1"> ${recruitDto.recruitDto.salary}만원</strong>
									</p>
								</div></div>
								
								<div class="row">
						  		<div class="col d-flex align-items-center ">
								    
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
			<div class="col" >
				<img class="img-fluid ms-3" src="https://apple.contentsfeed.com/RealMedia/ads/Creatives/jobkorea/230718_seoul_al_ssky/230718_seoul_120600.png" alt="...">
		
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