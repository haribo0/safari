<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.btn-qna{position: fixed; bottom: 80px; right: 70px; background-color: #f5f5f5; width: 68px; height: 68px; border-radius: 50%; display: flex; justify-content: center; align-items: center; font-size: 3rem; cursor: pointer;}
.coin-box{position: relative;}
.coin-box::before {content: ''; width:1px; height: 60%; background: #5e5e5e; display:block; position: absolute; top: 50%; transform:translateY(-50%); left: 0px;}
</style>
	<div class="container">
		<div class="row justify-content-between px-4" style="height:160px; background: #343b46; color: #fff;">
			<div class="col d-flex align-items-center">
				<div class="row w-100">
					<div class="col-2 d-flex justify-content-center">
						<div class="border border-white rounded-circle" style="width: 80px; height: 80px;"></div>	
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
				<p class="fw-bold mb-0 fs-4">5,000</p> 
			</div>
		</div>
	</div>