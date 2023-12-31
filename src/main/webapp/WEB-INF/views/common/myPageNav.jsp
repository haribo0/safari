<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-2 text-start mb-5">
		<div style="border-bottom: 2px solid #222; height: 48px;">
			<a href="./myPage" class="btn p-0"><h4 class="fw-bold mb-3" style="letter-spacing: -0.8px;">MY PAGE</h4></a>	
		</div>
		<ul class="list-group mt-3">
		<li class="list-group-item border border-0 pb-0 ps-0">
			<a class="btn text fw-bolder py-1 ps-0" href="#" style="pointer-events: none;">회원정보</a></li>
		  	<div class="" id="">
				<ul class="list-group">
					<li class="list-group-item border-0 py-1 ps-0"><a href="../user/checkPassword" class="btn py-0 text-body-secondary ps-0 fs-nav-small">회원정보수정</a></li>
					<li class="list-group-item border-0 py-1 ps-0"><a href="../user/myCoinPage" class="btn py-0 text-body-secondary ps-0 fs-nav-small">코인관리</a></li>
					<li class="list-group-item border-0 py-1 ps-0"><a href="../user/myAddressPage" class="btn py-0 text-body-secondary ps-0 fs-nav-small">배송지관리</a></li>
					<!-- <li class="list-group-item border-0 py-1 ps-0"><a href="#" class="btn py-0 text-body-secondary ps-0 fs-nav-small">찜</a></li> -->
					<li class="list-group-item border-0 py-1 ps-0"><a href="../user/myInquiryPage" class="btn py-0 text-body-secondary ps-0 fs-nav-small">1:1문의</a></li>
					<!-- <li class="list-group-item border-0 py-1 ps-0"><a href="#" class="btn py-0 text-body-secondary ps-0 fs-nav-small">리뷰관리</a></li> -->
				</ul>
			</div>
			
		
		  <li class="list-group-item border border-0 pb-0 ps-0">
		  <a class="btn text fw-bolder py-1 ps-0 mt-2" href="#collapse1" style="pointer-events: none;">중고</a></li>
		  	<div class="" id="">
				<ul class="list-group">
					<li class="list-group-item border-0 py-1 ps-0"><a href="/safari/user/selectMySellList" class="btn py-0 text-body-secondary ps-0 fs-nav-small">판매내역</a></li>
					<li class="list-group-item border-0 py-1 ps-0"><a href="/safari/user/selectMyBuyList" class="btn py-0 text-body-secondary ps-0 fs-nav-small">구매내역</a></li>
					<li class="list-group-item border-0 py-1 ps-0"><a href="/safari/user/wishList" class="btn py-0 text-body-secondary ps-0 fs-nav-small">좋아요</a></li>
				</ul>
			</div>
			
		  <li class="list-group-item border border-0 pb-0 ps-0">
		  <a class="btn text fw-bolder py-1 ps-0 mt-2" href="#" style="pointer-events: none;">대여</a></li>
		  	<div class="" id="">
				<ul class="list-group">
					<li class="list-group-item border-0 py-1 ps-0"><a href="./myOrderListPage" class="btn py-0 text-body-secondary ps-0 fs-nav-small">주문내역</a></li>
					<li class="list-group-item border-0 py-1 ps-0"><a href="./myRentalLikePage" class="btn py-0 text-body-secondary ps-0 fs-nav-small">좋아요</a></li>
				</ul>
			</div>
			
		  <li class="list-group-item border border-0 pb-0 ps-0">
		  <a class="btn text fw-bolder py-1 ps-0 mt-2" href="#" style="pointer-events: none;">경매</a></li>
		  	<div class="" id="">
				<ul class="list-group">
					<li class="list-group-item border-0 py-1 ps-0"><a href="/safari/auction/bidList" class="btn py-0 text-body-secondary ps-0 fs-nav-small">입찰내역</a></li>
					<li class="list-group-item border-0 py-1 ps-0"><a href="/safari/auction/successBidList" class="btn py-0 text-body-secondary ps-0 fs-nav-small">낙찰내역</a></li>
					<li class="list-group-item border-0 py-1 ps-0"><a href="/safari/auction/wishList" class="btn py-0 text-body-secondary ps-0 fs-nav-small">찜</a></li>
					<li class="list-group-item border-0 py-1 ps-0"><a href="/safari/auction/uploadAuctionList" class="btn py-0 text-body-secondary ps-0 fs-nav-small">판매내역</a></li>
			
				</ul>
			</div>
			
		  <li class="list-group-item border border-0 pb-0 ps-0">
		  <a class="btn text fw-bolder py-1 ps-0 mt-2" href="#" style="pointer-events: none;">커뮤니티</a></li>
		  	<div class="" id="">
				<ul class="list-group">
					<li class="list-group-item border-0 py-1 ps-0"><a href="./myAllCommunityPostListPage" class="btn py-0 text-body-secondary ps-0 fs-nav-small">내가쓴게시글</a></li>
					<li class="list-group-item border-0 py-1 ps-0"><a href="./myCommunityLikesListPage" class="btn py-0 text-body-secondary ps-0 fs-nav-small">좋아요</a></li>
				</ul>
			</div>
		</ul>
		
		<div class="row my-5">
	    	<div class="col">
    			&nbsp;
	    	</div>
    	</div>
    	
	</div>
	