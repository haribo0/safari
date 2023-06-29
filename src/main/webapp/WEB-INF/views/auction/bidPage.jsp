<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<link rel="stylesheet" href="/safari/resources/style/common.css" type="text/css">
<link rel="stylesheet" href="/safari/resources/style/auction.css" type="text/css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">


<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 메타 섹션 -->
<jsp:include page="../common/meta.jsp"></jsp:include>
<!-- 메타 섹션 -->

</head>
<body>
	
	<div class="row mt-2">
		<div class="col"></div>
	</div>
	
	<div class="row">
		<div class="col-11 bidBox fw-bold text-white">
			&nbsp;경매입찰
		</div>
	</div>
	
	<div class="row mt-2">
		<div class="col text-danger fw-bold">
			&nbsp;입찰 상품 정보
		</div>
	</div>
	
	<div class="row mt-2">
		<div class="col">
			<table class="table" style="border-top: 1px solid #E2E3E5;">
				<tr>
					<td class="table-secondary text-center align-middle">상품명</td>
					<td>
						<span class="fw-bold">${bidProduct.auctionDto.title}</span>
					</td>
				</tr>	
				<tr>
					<td class="table-secondary text-center align-middle">경매마감일</td>
					<td>
					<fmt:formatDate value="${bidProduct.auctionDto.end_date}"  pattern="yyyy-MM-dd HH:mm:ss"  />
					</td>
				</tr>
				<tr>
					<td class="table-secondary text-center align-middle">최대구매수량</td>
					<td>
					1개
					</td>
				</tr>
				<tr>
					<td class="table-secondary text-center align-middle">판매지역</td>
					<td>
					전국
					</td>
				</tr>													
			</table>
		</div>
	</div>
	
	<div class="row mt-2">
		<div class="col fw-bold text-danger">
			&nbsp;입찰하기
		</div>
	</div>
	
	<div class="row mt-2">
		<div class="col">
			<table class="table" style="border-top: 1px solid #E2E3E5;">
				<tr>
					<td class="table-secondary text-center align-middle">현재가격</td>
					
					<td><span class="text-danger fw-bold">
					<fmt:formatNumber value="${bidProduct.auctionDto.start_price}" pattern="#,###"/>원 
					</span></td>
					<td class="table-secondary text-center align-middle">즉시낙찰가격</td>
					
					<td><fmt:formatNumber value="${bidProduct.auctionDto.max_price}" pattern="#,###"/>원</td>
				</tr>
			
				<tr>
					<td class="table-secondary text-center align-middle">입찰금액</td>	
					<td>
						<div class="row">
							<div class="col">
								현재 <span class="text-danger fw-bold">
								<fmt:formatNumber value="${bidProduct.auctionDto.start_price}" pattern="#,###"/>원 
								</span>부터 입찰하실 수 있습니다.
							</div>
						</div>
						<div class="row mt-2">
							<div class="col">
								<input type="text" id = "bidPrice"
								style="width: 180px; height: 30px;
												  border-radius: 3px;
    											border: 1px solid #bfbfbf;">&nbsp;원
							</div>
						
						</div>
					</td>
					<th>
					</th>
					<td>
					</td>			
				
			</table>
		</div>
	</div>
	
	<div class="row mt-2">
		<div class="col text-center">
			<input type="button" class="btn btn-danger fw-bold" value="입찰하기"
			onclick="return bidRequest()">
		</div>
	</div>
	
	<div class="row mt-5">
		<div class="col noticeBox">
			&nbsp;• 경매 낙찰 후 주문 취소를 하게 되면 구매 거부가 되어 경매 패널티 점수 5점이 부여됩니다. <br>
			&nbsp;• 최근 한 달 동안의 경매 패널티 점수가 15점이 되면 한 달 동안 경매 이벤트에 참여하실 수 없습니다.
			
		</div>
	</div>
	
	<div class="row mt-4">
		<div class="col text-center">
			<input type="button" class="btn btn-light" value="창닫기" onclick="return closeTabClick()">
		</div>
	</div>
<script>
function  closeTabClick() {
	window.close();
}

const path = window.location.pathname;

//경로에서 변수 부분 추출
const parts = path.split('/');
const auctionItemId = parts[parts.length - 1];

let sessionId = null;

function getSessionId() {
		
    const xhr = new XMLHttpRequest();
    
    
    xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status == 200){
            const response = JSON.parse(xhr.responseText);

            if(response.result == "success") {
                sessionId = response.id;
            }
            
        }
    }	

  
    xhr.open("get", "/safari/auction/getUserId",false);
    xhr.send();

    
}

/* 입찰하기 */
function bidRequest() {
	
	const xhr = new XMLHttpRequest();
	
	const bidPriceBox = document.getElementById("bidPrice");
    xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status == 200){
            const response = JSON.parse(xhr.responseText);
        	if (response.result == "success") {
        		//window.opener.location.reload();
        		window.open('/safari/auction/bidComplete/'+ auctionItemId,
        				'pop_up','width=800, height=600, menubar=no, status=no, toolbar=no')
 	       
			}
            
        }
    }
  /*  const bidPrice = parseInt(bidPriceBox.value);
    const startPrice = parseInt("${bidProduct.auctionDto.start_price}");
    
    if (bidPrice < startPrice) {
        alert(startPrice + '원보다 낮은 가격으로 입찰하실 수 없습니다.');
        return;
    }*/

    xhr.open("post", "/safari/auction/bidRequest/"+auctionItemId);
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); 
    xhr.send("&userId=" + sessionId + "&bid_price=" +  bidPriceBox.value);
	
	
}
/*입찰 기록 리스트 출력*/
function reloadBidList() {
    const xhr = new XMLHttpRequest();
    
    xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status == 200){
            const response = JSON.parse(xhr.responseText);

            const bidListBox = document.getElementById("bidListBox");
            bidListBox.innerHTML = "";

            
            for(data of response.bidList) {
            	const row1 = document.createElement("div");
            	row1.classList.add("row");
            	
            	const colBidBox = document.createElement("div");
            	colBidBox.classList.add("col");
            	colBidBox.innerText = data.userDto.nickname+ "님이 " + data.auctionBidDto.bid_price + "원으로 입찰하였습니다."
            	
            	row1.appendChild(colBidBox);
            	bidListBox.appendChild(row1);
            }
     
        }
    }	
    
    xhr.open("get", "/safari/auction/getBidList?auctionItemId=" + auctionItemId);
    xhr.send();

}

/* 입찰 메시지 띄우기 */


window.addEventListener("DOMContentLoaded", function(){
    //사실상 시작 시점...
    getSessionId();
    reloadBidList();
});



</script>	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>