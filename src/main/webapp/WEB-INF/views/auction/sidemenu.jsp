<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <link rel="stylesheet" href="/safari/resources/style/sidemenu.css" />  
 
<style>
  .sticky{
       position:sticky;
       top:0px;
   }
</style>  
	<%-- 사이드 메뉴바시작 --%>	
	<div class="col mb-5" >
		
		<div class="row mt-2" style="position: relative; top: 5px">
			<div class="col" onclick="auctionModal()" style="cursor: pointer; font-size: 18px;">
				<i class="bi bi-exclamation-circle"></i> <span class="ms-1">경매 이용안내</span>
			</div>
		</div>
	
		<div class="row sticky">
			<div class="col">
				
				<div class="row mt-5 fs-4 fw-bold">
					<div class="col">
						<a href="/safari/auction/List">전체보기</a>
					</div>
				</div>
		

		 		<div id="categoryList">
		 		</div>
			</div>
		</div>
	</div>
	<%-- 사이드 메뉴바 끝 --%>

<%-- Modal --%>
<div class="modal" id="auctionModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered"> 
    <div class="modal-content">
      <div class="modal-header bg-light">
      		<div class="row">
      			<div class="col ms-2 fw-semibold" style="font-size: 19px">
      				경매 이용안내
      			</div>
      		</div>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> 
      <div class="modal-body">
      	
      	<div class="row mt-2">
      		<div class="col ms-4">
      		
      			<div class="row">
      				<div class="col">
      				
      					<div class="row">
      						<div class="col fw-semibold" style="font-size: 18px">
      							경매 등록 시 유의사항
      						</div>
      					</div>
      					
      					<div class="row mt-1 py-1">
      						<div class="col">
      							• &nbsp;시작가는 경매의 첫 최소입찰가격을 의미합니다.
      						</div>
      					</div>
      					
      					<div class="row py-1">
      						<div class="col">
      							• &nbsp;즉시낙찰가는 해당 가격으로 입찰 시, 지정된 종료 시간에 관계없이 낙찰 처리되는 가격을 의미합니다.
      						</div>
      					</div>      	
      				<!-- 	
      					<div class="row">
      						<div class="col">
      							<span class="ms-3" style=""> 가격을 의미합니다. </span>
      						</div>
      					</div>		 -->		
      					
      					<div class="row py-1">
      						<div class="col">
      							• &nbsp;경매가 시작된 후, 입찰이 1회라도 이루어질 경우 업로드한 경매를 수정하거나 취소하실 수 없습니다.
      						</div>
      					</div>
      					
      			
      				</div>
      			</div>
      			
      			
      			<div class="row mt-5">
      				<div class="col">
      				
      					<div class="row">
      						<div class="col fw-semibold" style="font-size: 18px">
      							경매 이용안내
      						</div>
      					</div>
      					
      					<div class="row mt-1 py-1">
      						<div class="col">
      							• &nbsp;각 경매의 <span class="fw-semibold">현재가는 <span class="text-danger">실시간으로</span> 업데이트</span>되고 있습니다.
      						</div>
      					</div>
      					
      					<div class="row py-1">
      						<div class="col">
      							• &nbsp;입찰과 관련된 내용은 상세페이지의 입찰안내 상세보기 화면을 참고해주세요.
      						</div>
      					</div>
      					
						<div class="row py-1">
      						<div class="col">
      							• &nbsp;경매 낙찰자는 <span class="fw-semibold">경매종료일로부터 <span class="text-danger">7일 이내</span>에 결제</span>하셔야 해당 물품을 수령하실 수 있습니다.
      						</div>
      					</div>      					
  	
      				</div>
      			</div>      			
      			
      			<div class="row mt-5">
      				<div class="col"></div>
      			</div>
      			
      		
      		
      		
      		</div>
      	</div>
      </div>
      
      
   
    </div>
  </div>
</div>
<%-- Modal --%>
	
	
	
	
<script>

// 이용안내 모달 화면 열기
function auctionModal() {
	
    const auctionModal = bootstrap.Modal.getOrCreateInstance("#auctionModal");
    auctionModal.show();
}




let mainCategoryId = null;
let subCategoryId = null;

// 카테고리 출력


// 대규모 카테고리 리스트
function getProductMainCategoriesForMenu() {
	
   const xhr = new XMLHttpRequest();

   xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
 
        	const response = JSON.parse(xhr.responseText);
        	
        	const categoryListBox = document.getElementById("categoryList");
        	categoryListBox.innerHTML = "";
        	
        	for(data of response.mainCategoryList) {
        		
        		const mainCategoryRow = document.createElement("div");
        		mainCategoryRow.classList.add("row", "mt-4","fs-5","fw-bold");
        		
        		const mainCategoryCol = document.createElement("div");
        		mainCategoryCol.classList.add("col");
        		mainCategoryCol.id = "mainCategory_" + data.id;
        		
        	    mainCategoryCol.onclick = (function(mainCategoryId) {
                	  return function() {
                	    reloadAuctionList(mainCategoryId, null);
                	  };
                	})(data.id);
        		
        		
        		mainCategoryCol.innerText = data.main_category_name;
        		mainCategoryCol.style.cursor = "pointer";
        		
        		mainCategoryRow.appendChild(mainCategoryCol);
        		
 
        		const subCategoryDiv = document.createElement("div");
        		subCategoryDiv.id = "mainCategories_" + data.id;
        		  		
        		getProductSubCategoriesForMenu(data.id, subCategoryDiv);
        		
        	    mainCategoryRow.appendChild(subCategoryDiv);

        	    categoryListBox.appendChild(mainCategoryRow);      	
        	    

        	}

        }
   };
    xhr.open("get", "/safari/auction/getProductMainCategoriesForMenu");
    xhr.send();
}



// 대규모 카테고리에 따른 소규모 카테고리 리스트
function getProductSubCategoriesForMenu(productMainCategoryId, subCategoryDiv) {
   
    const xhr = new XMLHttpRequest();
    
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
 
            const response = JSON.parse(xhr.responseText);
            
            const subCategoryBox = document.getElementById("mainCategories_" + productMainCategoryId);
            subCategoryBox.innerHTML = "";
            
            for(data of response.subCategories) {
            	
            	const subCategoryRow = document.createElement("div");
            	subCategoryRow.classList.add("row", "mt-2");
            	
            	const subCategoryCol = document.createElement("div");
            	subCategoryCol.classList.add("col", "fs-6", "fw-normal");
            	subCategoryCol.style.cursor = "pointer";

            	
            	subCategoryCol.id = "subCategory_" + data.id;
            
            	
            	subCategoryCol.innerText = data.sub_category_name;
            	
            	subCategoryRow.appendChild(subCategoryCol);
            	
                subCategoryDiv.appendChild(subCategoryRow);  
                
                subCategoryCol.onclick = (function(subCategoryId) {
                	  return function() {
                	    reloadAuctionList(null, subCategoryId);
                	  };
                	})(data.id);
 	
            }
           
        }
    };
    xhr.open("get", "/safari/auction/getProductSubCategories/" + productMainCategoryId);
    xhr.send();
}	





</script>	