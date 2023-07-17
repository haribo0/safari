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
<style>
.orangeButton{
	background: #ff6f0f;
	font-weight: bold;
	color: white;
}
a {
	list-style: none;
	color: inherit;
}
</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>

	<!-- 헤더 섹션 -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- 헤더 섹션 -->
	
	<!-- 마이페이지 상단 블럭 -->
	<jsp:include page="../common/myPageTop.jsp"></jsp:include>
	<!-- 마이페이지 상단 블럭 -->

	<div class="container d-flex mt-5 px-0">
		<div class="row w-100">
		<!-- 마이페이지 nav -->
		<jsp:include page="../common/myPageNav.jsp"></jsp:include>
		<!-- 마이페이지 nav -->
			
		<div class="col ms-4">
			<div class="row" style="border-bottom: 2px solid #222; height: 48px;">
				<div class="col p-0">
					<h5>주문/결제</h5>						
				</div>
			</div>
			
			<div class="row mt-4">
				<div class="col fw-bold fs-5">
					
				</div>
			</div>
			
			<div class="row">
      		
   		<div class="col">
   		
   			<div class="row">
   				<div class="col">
   				
   				
   					<div class="row">
   					
   						<div class="col">
   						
   						
   						
   						   <div class="row mt-3">
    							<div class="col">
		      						<div class="row mt-1">
		      							<div class="col fw-bold fs-5">
		      								주문 상품 정보
		      							</div>
		      						</div>
		     						
		      						<div class="row mt-2">
		      							<div class="col">
		      								
		      								<input type="hidden" id="bid" value="${orderInfo.id}">
		      								<input type="hidden" id="user_id" value="${sessionUser.id}">
		      								<input type="hidden" id="title" value="${orderInfo.title}">
		      								<input type="hidden" id="bid_price" value="${orderInfo.bid_price}">
		      								
		      								
		      								<table class="table">
		      									<thead class="table-light">
		      										<tr class="text-center">
		      											<td>상품정보</td>
		      											<td>낙찰가</td>
		      											<td>수량</td>
		      											<td>구매가</td>
		      										</tr>
		      									</thead>
		      									<tbody>
		      										<tr>
		      											<td>
		      												<div class="row p-1 align-middle">
		      													<div class="col-auto">
		      														<a href="/safari/auction/productDetail/${orderInfo.auction_item_id}">
																		<img 
																		src="/auctionFiles/${orderInfo.auction_item_img_link}" style="
																		width: 120px; height: 120px;"></a>
		      													</div>
		      													<div class="col-8">
		      														<div class="row mt-3">
		      															<div class="col">
		      																${orderInfo.main_category_name} > ${orderInfo.sub_category_name}
		      															</div>
		      														</div>
		      														<div class="row">
		      															<div class="col fw-bold" style="font-size: 18px;">
		      																<a href="/safari/auction/productDetail/${orderInfo.auction_item_id}">
		      																	${orderInfo.title}
		      																</a>	
		      															</div>
		      														</div>
		      													</div>
		      												</div>
		      											
		      											</td>
		      											<td class="text-center">
			      											<div class="row mt-5" style="position: relative; bottom: 4px;">
			      												<div class="col">
				      												<span class="fw-bold" style="font-size: 18px;">
				      													<fmt:formatNumber value="${orderInfo.bid_price}"  pattern="#,###"/>
				      												</span>	원
			      												</div>
			      											 </div>
		      												
		      											</td>
		      											<!-- <td class="text-center"></td> -->
		      											<td class="text-center align-middle">
		      												<span style="position: relative; bottom: 6px;">1</span>
		      											</td>
		      											<td class="text-center">
		      												<div class="row mt-5" style="position: relative; bottom: 4px;">
			      												<div class="col">
				      												<span class="fw-bold text-danger" style="font-size: 18px;">
				      													<fmt:formatNumber value="${orderInfo.bid_price}"  pattern="#,###"/>
				      												</span>	원
			      												</div>
			      											 </div>
		      											
		      											</td>
		      										</tr>
		      									</tbody>
		      								</table>
		      							</div>
		      						</div>
	    						</div>
    						</div>
   						
   						
   						
   						<div class="row mt-3">
	   						<div class="col-8">
	   							<div class="row">
		     						<div class="col fw-bold fs-5">
		     							배송지 정보
		     						</div>
	    						</div>
    						
	    						<div class="row mt-2 me-3">
	    							<div class="col">
	    								<table class="table">
	    									<tr>
	    										<td class="table-light align-middle text-center" style="width: 150px;"> 배송지선택 </td>
	    										<td>
	    											<div class="row mt-1 ms-1">
	    												<div class="col">
	    													
	    													<input class="form-check-input me-2" type="radio" id="radioAddress" name="radioAddress" value="existingAddress">
														  <label class="form-check-label me-4" for="radioAddress">
														    	기존 배송지
														  </label>	
														  
	    													<input class="form-check-input me-2" type="radio" id="radioAddress" name="radioAddress" value="newAddress">
														  <label class="form-check-label me-4" for="radioAddress">
														    	신규 배송지
														  </label>																	  
	    													
	    												</div>
	    											</div>
	    											
	    											<div class="row mt-2 ms-1">
	    												<div class="col-4">
	    													<select class="form-select" aria-label="Default select example" id="addressListDropdown">
															 
															</select>
	    												</div>
	    											</div>
	    											
	    											
	    										</td>
	    									</tr>
	    									
	    									<tr>
	    										<td class="table-light align-middle text-center" style="width: 150px;"> 배송지명 </td>
	    										<td>
	    											<div class="row mt-1 ms-2">
	    												<div class="col" id="addressName">
	    													
	    												</div>
	    											</div>
	    										</td>
	    									</tr>
	    									
	    									<tr>
	    										<td class="table-light align-middle text-center" style="width: 150px;"> 연락처 </td>
	    										<td>
	    											<div class="row mt-1">
	    												<div class="col-auto">
	    													<span class="text-danger"
	    													style="position: relative; left: 3px;">•</span>
	    												</div>
	    												<div class="col px-0">
	    													 <input type="text" class="form-control" oninput="oninputPhone(this)" maxlength="14" id="phone"
		                     						style="width: 200px; height: 30px;" id="addressPhone">
	    												</div>
	    											</div>
	    										</td>
	    									</tr>
	    									
	    									<tr>
	    										<td class="table-light align-middle text-center" style="width: 150px;"> 주소 </td>
	    										<td>
	    										<div class="row">
	    												<div class="col-auto">
	    													<span class="text-danger" style="position: relative; left: 3px; top:3px;">• </span>
	    												</div>
	      										<div class="col px-0">
	      											<div class="row mt-1">
							       						<div class="col-auto">
							       							<input type="text" class="form-control" id="postcode" style="width: 150px; height: 30px;">
							       						</div>
							       						<div class="col px-0">
							       							<input type="button" class="btn btn-sm btn-outline-success" value="우편번호 찾기"
							       							onclick="daumPost()" > 
							       						</div>
							       					</div>
							       					
							       					<div class="row mt-2">
							       						<div class="col">
							       							<input type="text" id="address" class="form-control" style= "height: 50px;">
							       						</div>
							       					</div>
							       					
							       					<div class="row mt-2">
							       						<div class="col">
							       							<input type="text" id="detail_address" class="form-control" style="height: 30px;">
							       						</div>
							       					</div>
							       				  </div>
						       					</div>
	    										
	    										</td>
	    									</tr>
	    									
	    									
	    								</table>
	    							</div>
	    						</div>
    						</div>
    						<%-- 결제 창 --%>
    						<div class="col">
    							
    							<div class="row">
    								<div class="col">
    								
    									<div class="row">
    										<div class="col px-0 fw-bold fs-5">
    											최종 결제정보
    										</div>
    									</div>
    									
    									<div class="row mt-2">
    										<div class="col border border-1" style="border-color: black!important;" >
    										
    											<div class="row p-2">
    											
    												<div class="col">
    												<div class="row">
    												<!--  -->
    												<div class="col">
    													<div class="row">
    														<div class="col">
    														
    															<div class="row mt-1">
    																<div class="col">
    																	총 상품금액
    																</div>
    															</div>
    															
    															<div class="row mt-1">
    																<div class="col">
    																	포인트 할인금액
    																</div>
    															</div>
    															
    															<div class="row mt-3">
    																<div class="col">
    																	총 배송비 
    																	<span class="ms-2">
    																		<input type="button" class="btn btn-outline-secondary btn-sm" value="상세보기">
    																	</span>
    																</div>
    															</div>
    															
    															<div class="row mt-4">
    																<div class="col fw-bold fs-5">
    																	최종 결제금액
    																</div>
    															</div>
    														
    														
    														</div>
    														<div class="col text-end">
    														
    															<div class="row mt-1">
    																<div class="col fw-bold">
    																	<span class="fw-bold" style="font-size: 18px;">
				      													<fmt:formatNumber value="${orderInfo.bid_price}"  pattern="#,###"/>
				      												</span>	원
    																</div>
    															</div>
    															
    															<div class="row mt-1">
    																<div class="col text-danger opacity-75">
    																	0원
    																</div>
    															</div>
    															
    															<div class="row mt-3">
    																<div class="col fw-bold">
    																	0원
    																</div>
    															</div>
    															
    															<div class="row mt-3">
    																<div class="col fw-bold">
    																	<span class=" fs-4 text-danger">
				      													<fmt:formatNumber value="${orderInfo.bid_price}"  pattern="#,###"/>
				      												</span>	원
    																</div>
    															</div>
    										
    														</div>
    													
    													</div>
    													
   			
					    													
    												</div>
    												</div>
    												
   													<div class="row mt-3">
														<div class="col d-grid fs-4">
															<input type="button" class="btn btn-lg orangeButton pe-0 ps-0" value="결제하기"
															onclick="kakaoPayModal()">
														</div>
													</div>
													
													<div class="row mt-2">
														<div class="col"></div>
													</div>
    												<!--  -->
    												</div>
    											</div>
    																					
    										
    										</div>
    									</div>
    									
    									<div class="row mt-2">
    										<div class="col bg-light p-2">
    											
    											<div class="row">
    												<div class="col ms-1" >
    													주문 상품정보 및 결제대행 서비스 이용약관에
    												</div>
    											</div>
    											
    											<div class="row">
    												<div class="col ms-1">
    													 모두 동의하십니까?
    												</div>
    											</div>
    											
    											<div class="row mt-2 ms-2">
    												<div class="col form-check" style="position: relative; right: 5px;">
													  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
													  <label class="form-check-label" for="flexCheckDefault">
													    <span class="fw-bold">모두 동의</span>
													  </label>
													</div>
    											</div>
    										</div>
    									
    									</div>
    								
    								
									
										
						
    								
    								
    								</div>
    							</div>
    							
    							
    							
    							
    							
    						</div>
    						<%-- 결제 창 --%>
    						</div>
    						

    						
    						
   						</div>
   					
   					
   					</div>
   				
 	
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

<%-- 주소 등록 modal --%>
<div class="modal" id="registerAddrModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered"> 
    <div class="modal-content">
      <div class="modal-header">
     	 <div class="row mb-0">
      			<div class="col ms-4 fs-5 fw-bold">배송지 등록</div>
      		</div>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
      	
      	<div class="row text-center fw-bold fs-5">
    		
       </div>
       
       <div class="row mt-3">
       		<div class="col"></div>
       			<div class="col-11">
		       		
		       		<table class="table" style="border-top: 1px solid #E2E3E5;">
		       			<tr>
		       				<td class="table table-light align-middle text-center " style="width: 150px;">배송지명</td>
		       				<td class="align-middle"> 
		       					<div class="row">
		       						<div class="col">
		       							 <input type="text" class="form-control ms-2" style="width: 200px; height: 30px;"
		       							 id="address_name" > 
		       							
		       						</div>
		       					</div>
		       				</td>
		       			</tr>	
		       			<tr>
							<td class="table table-light align-middle text-center" style="width: 150px;">연락처</td>
		       				<td class="align-middle">
		       					  <div class="row">
				                    <div class="col">
				                       <input type="text" class="form-control ms-2" oninput="oninputPhone(this)" maxlength="14" id="phone"
				                      style="width: 200px; height: 30px;">
				                    </div>
				                  </div>
		       				</td>		       				
		       			</tr>
						<tr>
							<td class="table table-light align-middle text-center" style="width: 150px;">주소</td>
		       				<td>
		       					<div class="row mt-1">
		       						<div class="col-auto">
		       							<input type="text" class="form-control ms-2" id="postcode" style="width: 150px; height: 30px;">
		       						</div>
		       						<div class="col">
		       							<input type="button" class="btn btn-sm btn-outline-secondary" value="우편번호 찾기"
		       							onclick="daumPost()" > 
		       						</div>
		       					</div>
		       					
		       					<div class="row mt-2">
		       						<div class="col">
		       							<input type="text" id="address" class="form-control ms-2" style= "height: 50px;">
		       						</div>
		       					</div>
		       					
		       					<div class="row mt-2">
		       						<div class="col">
		       							<input type="text" id="detail_address" class="form-control ms-2" style="height: 30px;">
		       						</div>
		       					</div>
		       				</td>		       				
		       			</tr>		       			
		       		</table>
		       
		  
		      </div>
     	    <div class="col"></div>
      </div>
      
      <div class="row mt-4">
      	<div class="col"></div>
      </div>
      
      <div class="modal-footer">
      	<input type="button" class="btn orangeButton" value="등록하기" onclick="addUserAddress()">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창닫기</button>
      </div>      
   
    </div>
  </div>
</div>
</div>
<%-- 주소 등록 modal --%>


<%-- 주소 수정 modal --%>
<div class="modal" id="modifyAddrModal"  data-id="" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered"> 
    <div class="modal-content">
      <div class="modal-header">
      		<div class="row mb-0">
      			<div class="col ms-4 fs-5 fw-bold">배송지 수정</div>
      		</div>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
      	
      	<div class="row text-center fw-bold fs-5">
    		<div class="col"></div>
       </div>
       
       <div class="row mt-3">
       		<div class="col"></div>
       			<div class="col-11">
		       		
		       		<table class="table" style="border-top: 1px solid #E2E3E5;">
		       			<tr>
		       				<td class="table table-light align-middle text-center " style="width: 150px;">배송지명</td>
		       				<td class="align-middle"> 
		       					<div class="row">
		       						<div class="col">
		       							 <input type="text" class="form-control ms-2" style="width: 200px; height: 30px;"
		       							 id="address_name" > 
		       							
		       						</div>
		       					</div>
		       				</td>
		       			</tr>	
		       			<tr>
							<td class="table table-light align-middle text-center" style="width: 150px;">연락처</td>
		       				<td class="align-middle">
		       					  <div class="row">
				                    <div class="col">
				                      <input type="text" class="form-control ms-2" oninput="oninputPhone(this)" maxlength="14" id="original_phone"
				                      style="width: 200px; height: 30px;">
				                    </div>
				                  </div>
		       				</td>		       				
		       			</tr>
						<tr>
							<td class="table table-light align-middle text-center" style="width: 150px;">주소</td>
		       				<td>
		       					<div class="row mt-1">
		       						<div class="col-auto">
		       							<input type="text" class="form-control ms-2" id="original_postcode" style="width: 150px; height: 30px;">
		       						</div>
		       						<div class="col">
		       							<input type="button" class="btn btn-sm btn-outline-secondary" value="우편번호"
		       							onclick="daumPost()"> 
		       						</div>
		       					</div>
		       					
		       					<div class="row mt-2">
		       						<div class="col">
		       							<input type="text" id="original_address" class="form-control ms-2" style= "height: 50px;">
		       						</div>
		       					</div>
		       					
		       					<div class="row mt-2">
		       						<div class="col">
		       							<input type="text" id="original_detail_address" class="form-control ms-2" style="height: 30px;">
		       						</div>
		       					</div>
		       				</td>		       				
		       			</tr>		       			
		       		</table>
		       
		  
		      </div>
     	    <div class="col"></div>
      </div>
      
      <div class="row mt-4">
      	<div class="col"></div>
      </div>
      
      <div class="modal-footer">
      	<input type="button" class="btn orangeButton" value="등록하기" onclick="modifyUserAddress()">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창닫기</button>
      </div>      
   
    </div>
  </div>
</div>
</div>
<%-- 주소 수정 modal --%>


<%-- 주소 등록 alert --%>
<div class="modal" id="addrValidateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered"> 
    <div class="modal-content">
      <div class="modal-header">
      	
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
      	
      	<div class="row text-center">
    		<div class="col" id="validateContent"> </div>
       </div>
  
      </div>
      
      <div class="modal-footer">
      	
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창닫기</button>
      </div>      
   
    </div>
  </div>
</div>
<%-- 주소 등록 alert --%>


<%-- 주소 삭제 alert --%>
<div class="modal" id="removeAddrModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered"> 
    <div class="modal-content">
      <div class="modal-header">
      		<h5 class="modal-title">주소 삭제</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
      	
      	<div class="row text-center">
    		<div class="col"> 
    			선택한 배송지를 삭제하시겠습니까?
    		</div>
       </div>
  
      </div>
      
      <div class="modal-footer">
      	<input type="button" class="btn orangeButton" value="확인" onclick="removeUserAddress()">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>      
   
    </div>
  </div>
</div>
<%-- 주소 삭제 alert --%>


<%-- 결제 모두 동의 체크 박스 alert --%>
<div class="modal" id="checkBoxModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered"> 
    <div class="modal-content">
      <div class="modal-header">
      		<h5 class="modal-title"></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
      	
      	<div class="row text-center">
    		<div class="col"> 
    			이용약관에 모두 동의하여야 결제하실 수 있습니다.
    		</div>
       </div>
  
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창닫기</button>
      </div>      
   
    </div>
  </div>
</div>
<%-- alert --%>




<script>

let selectedAddressId = null;


// 로그인된 세션 초기화
let mySessionId = null;
// 세션가져오기
function getSessionId(){
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			if(response.result == "success"){
				mySessionId = response.id; 
			}
		}
	}
	
	xhr.open("get", "../user/getMyId", false);
	xhr.send();		
}

//주문 시 기본 배송지 정보들 가져오기
function getMyAddressListInOrderPage() {
	
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
	
			
			getMyAddressList(response.addressList);
	
		}
	}
	xhr.open("get", "/safari/user/getUserAddress");
	xhr.send();	
}

// 주소 리스트 가져오기
function getMyAddressList(addressList) {
	
    const addressListDropdown = document.getElementById('addressListDropdown');
    addressListDropdown.innerHTML = '';

    addressList.forEach(function(addr) {
        const option = document.createElement('option');
        option.value = addr.id;
        option.text = addr.address_name;
        option.text1 = addr.phone;
        option.text2 = addr.address;
        
        console.log(option.text1);
  

        // 옵션 선택 시 주소명 설정
        addressListDropdown.addEventListener('change', function() {
            const selectedOption = addressListDropdown.options[addressListDropdown.selectedIndex];
            
            const selectedAddressName = document.querySelector("#addressName");
            selectedAddressName.textContent = selectedOption.text;
            
            /* const phone = document.querySelector("#addressPhone");
            phone.value = selectedOption.text1;
            
            const address = document.querySelector("#address");
            address.value = selectedOption.text2; */
        });
        
        
        
        addressListDropdown.appendChild(option);
    });
}

// 다음 주소 api
function daumPost(){
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
            
            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById('address').value = addr;
            document.getElementById('detail_address').focus();
        }
    }).open();
}


// 주소 등록 모달 열기
function registerAddrPage() {
	
	const registerAddrModal = bootstrap.Modal.getOrCreateInstance("#registerAddrModal");
	
	registerAddrModal.show();
}


//주소 수정 모달 열기
function modifyAddrPage(id) {
	
	const xhr = new XMLHttpRequest();	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
	
	
			const modifyAddrModal = bootstrap.Modal.getOrCreateInstance("#modifyAddrModal");
			modifyAddrModal._element.dataset.id = id; // id 값을 data-id 속성에 설정
			modifyAddrModal.show();
		}
	}
	xhr.open("get", "/safari/user/getAddressInfoByPk?id=" +id);
	xhr.send();	
	
}

// 전화번호 형식 변경 함수
function oninputPhone(target) {
    target.value = target.value
        .replace(/[^0-9]/g, '')
        .replace(/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
}

// 주소 등록
function addUserAddress() {
	
	const address_name = document.getElementById("address_name");
	const phone = document.getElementById("phone");
	const postcode = document.getElementById("postcode");
	const address = document.getElementById("address");
	const detail_address = document.getElementById("detail_address");
	
	if (address_name.value == "" || phone.value == "" || address.value == "") {
		
		const content = document.getElementById("validateContent");
		content.innerHTML = "";
		
		const validateModal = bootstrap.Modal.getOrCreateInstance("#addrValidateModal");
		if (address_name.value == "") {
			content.innerText = "배송지명을 입력하세요";
		} else if (phone.value == "") {
			content.innerText = "연락처를 입력하세요";
		} else if (address.value == "") {
			content.innerText = "주소를 입력하세요";
		}
		
		validateModal.show();
		
		setTimeout(function() {
			validateModal.hide();
		}, 1000);
		
		return;
	}
	
	
	
	const xhr = new XMLHttpRequest();	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			const registerAddrModal = bootstrap.Modal.getOrCreateInstance("#registerAddrModal");
			registerAddrModal.hide();
			
			address_name.value = "";
			phone.value = "";
			postcode.value = "";
			address.value = "";
			detail_address.value ="";
			
			getMyaddressList();
			
		}
	}
	xhr.open("post", "/safari/user/addUserAddress");
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
	xhr.send("address_name=" + address_name.value + "&phone=" + phone.value + "&address=" + address.value + "  " + detail_address.value);	
}

// 주소 수정
function modifyUserAddress(id) {
	
	const address_name = document.getElementById("original_address_name");
	const phone = document.getElementById("original_phone");
	const postcode = document.getElementById("original_postcode");
	const address = document.getElementById("original_address");
	const detail_address = document.getElementById("original_detail_address");
	
	if (address_name.value == "" || phone.value == "" || address.value == "") {
		
		const content = document.getElementById("validateContent");
		content.innerHTML = "";
		
		const validateModal = bootstrap.Modal.getOrCreateInstance("#addrValidateModal");
		if (address_name.value == "") {
			content.innerText = "배송지명을 입력하세요";
		} else if (phone.value == "") {
			content.innerText = "연락처를 입력하세요";
		} else if (address.value == "") {
			content.innerText = "주소를 입력하세요";
		}
		
		validateModal.show();
		
		setTimeout(function() {
			validateModal.hide();
		}, 1000);
		
		return;
	}
	
	
	
	const xhr = new XMLHttpRequest();	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			const modifyAddrModal = bootstrap.Modal.getOrCreateInstance("#modifyAddrModal");
			modifyAddrModal.hide();
			
			address_name.value = "";
			phone.value = "";
			postcode.value = "";
			address.value = "";
			detail_address.value ="";
			
			getMyaddressList();
		}
	}
			
	xhr.open("post", "/safari/user/modifyUserAddress");
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
	xhr.send("address_name=" + address_name.value + "&phone=" + phone.value + "&address=" + address.value +
			  " " + detail_address.value + "&id=" + id);
	
	
}


//주소 리스트 불러오기
function getMyaddressList() {
	
	const xhr = new XMLHttpRequest();	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			const addrBox = document.querySelector("#userAddrRow");
			addrBox.innerHTML = "";
			
			if (response.addressCount == 0) {
				 
            	const row = document.createElement("div");
            	row.classList.add("row", "border-bottom",  'py-2');
            	
            	const col = document.createElement("div");
            	col.classList.add("col", "text-center");
            	col.setAttribute("colspan", "4");
            	col.innerText = "등록된 배송지가 없습니다.";
            	
            	row.appendChild(col);
     
            	addrBox.appendChild(row);
   
				
			}
			
			else {
			for (data of response.addressList) {
			
				const row = document.createElement("div");
				row.classList.add("row", "border-bottom", "py-2");
	
				// 배송지명
				const adNameCol = document.createElement("div");
				adNameCol.classList.add("col");
				
				const adNameRow = document.createElement("div");
				adNameRow.classList.add("row");
				
				const adCol = document.createElement("div");
				adCol.classList.add("col");
				adCol.style.fontSize = "18px";
				adCol.innerText = data.address_name; 
				
				adNameRow.appendChild(adCol);
				adNameCol.appendChild(adNameRow);
				
				row.appendChild(adNameCol);
				// 배송지명
				
				// 주소
				const addrCol = document.createElement("div");
				addrCol.classList.add("col-5");
				
				const addrRow = document.createElement("div");
				addrRow.classList.add("row");
				
				const aCol = document.createElement("div");
				aCol.classList.add("col");
				aCol.style.fontSize = "16px";
				aCol.innerText = data.address;
				
				addrRow.appendChild(aCol);
				addrCol.appendChild(addrRow);
				
				row.appendChild(addrCol);
				// 주소
				
				
				// 연락처
				const phoneCol = document.createElement("div");
				phoneCol.classList.add("col");
				
				const phoneRow = document.createElement("div");
				phoneRow.classList.add("row");
				
				const pCol = document.createElement("div");
				pCol.classList.add("col");
				pCol.style.fontSize = "18px";
				pCol.innerText = data.phone;
				
				phoneRow.appendChild(pCol);
				phoneCol.appendChild(phoneRow);
				
				row.appendChild(phoneCol);
				// 받는 사람
				
				// 관리
				const manageCol = document.createElement("div");
				manageCol.classList.add("col");
				
				const manageRow = document.createElement("div");
				manageRow.classList.add("row");
				
				
				const mCol = document.createElement("div");
				mCol.classList.add("col");
				
				const modifyButton = document.createElement("i");
				modifyButton.classList.add("bi", "bi-pencil-square", "fs-5", "text-secondary");
				modifyButton.style.cursor = "pointer";
				
				modifyButton.onclick = function (id) {
  	                return function () {
  	                	modifyAddrPage(id);
  	                };
  	              }(data.id);
				
				
				// onclick 이벤트 적기
				
				const deleteButton = document.createElement("i");
				deleteButton.classList.add("bi", "bi-trash3", "ms-4", "fs-5", "text-secondary");
				deleteButton.style.cursor = "pointer";
				
				deleteButton.onclick = function (id)  {
  	                return function () {
  	                	removeAddrPage(id);
  	                };
  	              }(data.id);
					
				
				// onclick 이벤트 적기
				
				mCol.appendChild(modifyButton)
				mCol.appendChild(deleteButton);
				

				manageRow.appendChild(mCol);
				manageCol.appendChild(manageRow);
				row.appendChild(manageCol);
				
				// 관리
				
				addrBox.appendChild(row);
			}
		  }
		}
	}
	
	xhr.open("get", "/safari/user/getUserAddress");
	xhr.send();	
}


//카카오페이 결제 창
function kakaoPayModal() {
	
   const agreeCheckbox = document.getElementById("flexCheckDefault");
  
   // 동의 체크박스를 누르지 않으면 결제 창 띄우지 못하게 방지
   if (!agreeCheckbox.checked) {
    
	   const checkBoxModal = bootstrap.Modal.getOrCreateInstance("#checkBoxModal"); 
	   checkBoxModal.show();
		
		setTimeout(function() { // 1초 뒤 모달 창 삭제
			checkBoxModal.hide();
		}, 2000);
     return;
   }		
	
	
   const cid = 'TC0ONETIME';
   const partner_order_id = document.getElementById("bid").value;
   const partner_user_id = document.getElementById("user_id").value;
   const item_name = document.getElementById("title").value;

   const quantity = 1;
   const total_amount = document.getElementById("bid_price").value;
   const tax_free_amount = 0;
   const approval_url = "http://localhost:8181/safari/auction/paymentProcess";
   const cancel_url = "http://localhost:8181/safari/auction/successBidList";
   const fail_url = "http://localhost:8181/safari/auction/successBidList";
   
   const xhr = new XMLHttpRequest();
   
   xhr.onreadystatechange = function() {
	   if (xhr.readyState === XMLHttpRequest.DONE) {
	   if (xhr.status === 200) {
           const response = JSON.parse(xhr.responseText);

           // tid 무조건 받아와야함.
           const tid = response.tid;
          	

            const width = 600;
            const height = 600;
            const left = (window.screen.width - width) / 2;
            const top = (window.screen.height - height) / 2;
            const windowFeatures = "width=" + width + ",height=" + height + ",top=" + top + ",left=" + left + ",location=no,status=no,scrollbars=yes";
            const paymentWindow = window.open(response.next_redirect_pc_url, "_blank", windowFeatures);
            
            if (paymentWindow) {
               // 팝업이 정상적으로 열린 경우
               paymentWindow.focus();
            } else {
               // 팝업이 차단되었을 경우
               alert("팝업 차단이 감지되었습니다. 결제를 진행하려면 팝업 차단을 해제해주세요.");
            }
         	
      
         	
            // tid를 세션에 저장
            saveAuctionTidToSession(cid, partner_order_id, partner_user_id, tid, item_name, response.next_redirect_pc_url);
           
       } else {
    	   
       }
	   }
   };	
   
   
   xhr.open("POST", "https://kapi.kakao.com/v1/payment/ready");
   xhr.setRequestHeader("Authorization", "KakaoAK 88927c6d047da3940394d71e197276c3");
   xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
   xhr.send("cid="+cid+"&partner_order_id="+partner_order_id+"&partner_user_id="+partner_user_id+"&item_name="+item_name+
		   "&quantity="+quantity+"&total_amount="+total_amount+"&tax_free_amount="+tax_free_amount+
		   "&approval_url="+approval_url+"&cancel_url="+cancel_url+"&fail_url="+fail_url);
 
}



// tid 세션에 저장
 function saveAuctionTidToSession(cid, partner_order_id, partner_user_id, tid, item_name, 
		 next_redirect_pc_url) {
	
	 	const xhr = new XMLHttpRequest();


	    xhr.onreadystatechange = function() {
	        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
	            
	        	
	        }
	    };
	    
	    xhr.open("post", "/safari/auction/saveAuctionTidToSession");
	    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	    xhr.send("cid="+cid+"&partner_order_id="+partner_order_id+"&partner_user_id="+partner_user_id+"&tid="+tid+"&item_name="+item_name);	
		
}



window.addEventListener("DOMContentLoaded", function(){
	getSessionId();
	getMyAddressListInOrderPage();
	
	
	 const existingAddressRadio = document.querySelector('input[name="radioAddress"][value="existingAddress"]');
	  const addressListDropdown = document.getElementById('addressListDropdown');
	  const addressName = document.getElementById('addressName');
	  
	  // 기존 배송지 라디오 버튼 체크
	  existingAddressRadio.checked = true;
	  
	  // 선택된 주소명 설정
	  //addressName.textContent = addressListDropdown.options[addressListDropdown.selectedIndex].text;
	//getMyaddressList();
});
</script>
</body>	
</html>