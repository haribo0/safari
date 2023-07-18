<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <link rel="stylesheet" href="/safari/resources/style/sidemenu.css" />   
	<%-- 사이드 메뉴바시작 --%>	
	<div class="col">
		
		<div class="row mt-4 mb-2">
			<div class="col"></div>
		</div>
	
		<div class="row mt-5 fs-4 fw-bold">
			<div class="col">
				<a href="/safari/auction/mainPage">전체보기</a>
			</div>
		</div>
		

		 <div id="categoryList">
		 </div>
		

	</div>
	<%-- 사이드 메뉴바 끝 --%>
<script>

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