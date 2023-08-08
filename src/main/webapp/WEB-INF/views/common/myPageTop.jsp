<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div class="container">
		<div class="row justify-content-between px-4 text-start" style="height:160px; background: #343b46; color: #fff;">
			<div class="col d-flex align-items-center">
				<div class="row w-100">
					<div class="col-2 d-flex justify-content-center position-relative">
					  <div class="border border-white rounded-circle" style="width: 100px; height: 100px; overflow: hidden;" id="profileImage">
					    
					  </div>
					  <a href="#" class="btn position-absolute border border-white bg-dark" style="bottom: -8px; right:16px; border-radius: 50%;">
					    <i class="bi bi-pencil-square text-white" style="font-size: 18px;"></i>
					  </a>
					</div>
					<div class="col d-flex flex-column justify-content-center">
						<span><b class="fs-4">${sessionUser.nickname}님</b> 반갑습니다.</span>
						<p class="mb-0">오늘도 좋은 하루 보내세요!</p>
					</div>
				</div>
			</div>
			
			<div class="col-4 d-flex flex-column justify-content-center align-items-center coin-box">
				<p class="mb-0"><i class="bi bi-coin"></i></p>
				<p class="mb-0">보유 코인 </p>
				<p class="fw-bold mb-0 fs-4" id="userCoinBalance"> </p> 
			</div>
		</div>
	</div>
	
<script>

// 프사 조회
function getUserProfileImage() {
	
	const profileImage = document.querySelector("#profileImage");
	profileImage.innerHTML = "";
	
	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			if (!response.profile_img_link) {
				return;
			} else {
			
				const image = document.createElement("img");
				image.src = "/auctionFiles/" + response.profile_img_link;
				image.style.width = "100%";
				image.style.height = "100%";
	
				console.log(response.profile_img_link);
				
				profileImage.appendChild(image);
				}
			
			}
			
		}
	
	xhr.open("get", "/safari/user/getUserProfileImage");
	xhr.send();		
}



// 회원의 현재 보유 코인 조회
function getUserCoinBalance() {
	
		const xhr = new XMLHttpRequest();
		
		const coinBalance = document.getElementById("userCoinBalance");
	
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				const response = JSON.parse(xhr.responseText);
				if(response.result == "success"){
					
					
					coinBalance.innerText = new Intl.NumberFormat('ko-KR').format(response.coins);
				}
			}
		}
		
		xhr.open("get", "/safari/user/getUserCoinBalance");
		xhr.send();		
	
}



window.addEventListener("DOMContentLoaded", function(){
	//getSessionId();
	getUserCoinBalance(); 
	getUserProfileImage();
	
});


</script>	