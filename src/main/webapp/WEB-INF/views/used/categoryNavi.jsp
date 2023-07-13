<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
		<div class="row mt-4">
			<div class="col-2"></div>
			<div class="col-2">
				<select class="form-select" aria-label="Default select example" id="product_city">
				  <option value="0" selected>지역을 선택하세요</option>
				  <c:forEach items="${cityList }" var="ProductCityDto">
				  	<option value="${ProductCityDto.id }">${ProductCityDto.product_city_name }</option>
				  </c:forEach>
				</select>
			</div>
			<div class="col-2 pl-0">
				<select class="form-select" id="product_town" name="product_town_id" aria-label="Default select example">
				  <option value="0" selected>동네를 선택하세요</option>
				</select>
			</div>
			<div class="col"></div>
			<div class="col-2 text-end align-items-center"><a href="./productRegister" type="button" class="btn orangeButton">상품 등록</a></div>
		</div>
		<div class="row mt-1" style="display: flex; flex-direction: row;">
			<div class="col-2"></div>
			<div class="col-4">
			<ul class="order_list" style="display: flex; list-style: none; padding: 0; margin: 0;">
				<li class="order_item" data-sort-method="BEST">&nbsp;<div class="btn" id="recentOrder" onclick="getViewAll(0,0,0,0,0,-1)">최신순</div>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
				<li class="order_item" data-sort-method="NEW"><div class="btn" id="bestOrder" onclick="getViewAll(0,0,0,0,0,1)">인기순</div>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
				<li class="order_item" data-sort-method="MinPrice"><div class="btn" id="lowOrder" onclick="getViewAll(0,0,0,0,0,2)">낮은가격순</div>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
				<li class="order_item" data-sort-method="MaxPrice"><div class="btn" id="highOrder" onclick="getViewAll(0,0,0,0,0,3)">높은가격순</div></li>
			</ul>
			</div>
			<div class="col mt-2 m-0">
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
				  <label class="form-check-label" for="inlineCheckbox1">거래가능</label>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-2">
				<div class="col">
				<ul class="list-group">
				  <li class="list-group-item border border-0 p-0"><div class="btn fs-5 text fw-bold py-1 mt-3" id="viewAll" onclick="getViewAll(-1,-1,-1,-1,-1,-1)">전체보기</div></li>
				  <c:forEach items="${categoryList }" var="map">
				  <li class="list-group-item border border-0 p-0">
				  	<div class="btn fs-5 text fw-bold py-1" onclick="getViewAll(${map.productMainCategoryDto.id},-1,0,0,0,0)">${map.productMainCategoryDto.main_category_name }</div>
				  </li>
				  	<div class="row">
						<ul class="list-group me-0">
						<c:forEach items="${map.subCategoryDtoList }" var="ProductSubCategoryDto">
							<li class="list-group-item border-0">
							<div class="btn py-0 text-body-secondary" onclick="getViewAll(${map.productMainCategoryDto.id},${ProductSubCategoryDto.id},0,0,0,0)">${ProductSubCategoryDto.sub_category_name }</div>
							</li>
						</c:forEach>
						</ul>
					</div>
					</c:forEach>
				</ul>
			</div>
			</div>
			