<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${root}/css/store/commerce.css">
<link rel="stylesheet" type="text/css" href="${root}/css/store/button.css">
<link rel="stylesheet" type="text/css" href="${root}/css/store/selling.css">
<link rel="stylesheet" type="text/css" href="${root}/css/store/cover.css">
<link rel="stylesheet" type="text/css" href="${root}/css/common.css">
<link rel="stylesheet" type="text/css" href="${root}/css/main/main_media.css">
<link rel="stylesheet" type="text/css" href="${root}/css/main/bucket_ui.css">
<link rel="stylesheet" type="text/css" href="${root}/css/main/components.css">
</head>
<body>
<main role="main" id="root">
	<div id="product-data" class="hide" data-selling="true"></div>
	
	<!-- mobile [S] -->
	<section id="mobile-cover" class="mobile-cover">
	  <div class="mobile-cover__img-list" style="transform: translateX(0px);">
	    <div class="mobile-cover__img-wrap">
	      <img src="${product.prodImage}">
	    </div>
	      <div class="mobile-cover__img-wrap">
	        <img src="${product.prodImage}">
	      </div>
	  </div>
	    <p class="mobile-cover__img-page">
	      <span class="mobile-cover__img-page__current">1</span>/<span class="mobile-cover__img-page__total">2</span>
	    </p>
	</section>
	<!-- mobile [E] -->
	
	<div class="container">
		<div class="breadcrumb">
	      	<a href="/store/category?category=0&amp;order=popular">${currentCategory}</a>
	    	<span class="icon icon-pointer-angle-right-gray-sm" aria-hidden="true" style="margin: 0px 2px;"></span>
	      	<a href="/store/category?category=0_2&amp;order=popular">${secondList[0].codeNm}</a>
	       	<span class="icon icon-pointer-angle-right-gray-sm" aria-hidden="true" style="margin: 0px 2px;"></span>
 		</div>
		<div class="row">
			<div class="col-6 col-lg-7 images-lg">
				<div class="images">
					<div class="images__thumbnail-list">
						<div class="images__thumbnail-item active">
							<img src="${product.prodImage}">
						</div>
						<div class="images__thumbnail-item">
							<img src="${product.prodImage}">
						</div>
					</div>
					<div class="images__current">
						<img class="active" src="${product.prodImage}" data-index=""
							style="width: 100%;height: 100%;">
						<img src="" data-index="">
					</div>
				</div>
			</div>
			<div class="col cover__info">
				<div class="cover__info__brand">
					<a href="">${product.prodSeller}</a>
				</div>
				<div class="cover__info__name">
					<h1>${product.prodTitle}</h1>
				</div>
				<div class="cover__info__review cover__info__review--present">
					<a href="">
						<div class="cover__info__review__stars">
							<span class="icon icon-etc-star-fill-sm"></span>
							<span class="icon icon icon-etc-star-half-sm"></span>
						</div>
						<div>${prod.reviewCnt} 개 리뷰</div>
					</a>
				</div>
				<div class="cover__info__price">
					<div class="cover__info__price__discount-rate">
						<mark>${product.discountRate}</mark>
						<span>%</span>
					</div>
					<div class="cover__info__price__price">
						<small>${product.discountRate}</small>
						<del>
							<fmt:formatNumber value="${product.prodPrice}" pattern="#,###"></fmt:formatNumber>
						</del>
						<b>
							<mark>
								<fmt:formatNumber value="${product.prodPrice-(product.prodPrice*product.discountRate/100)}" pattern="#,###"/>
							</mark>
							<span>원</span>
						</b>
					</div>
				</div>
				<div class="cover__info__hr"></div>
				
				<div class="select-option--cover-lg">
	          		<div class="production-selling-option" data-production="135034">
					    <section>
					      <div class="select-wrap hide">
					        <select class="form-control production-option-depth-1">
					          <option value="0" disabled="" selected="">${product.prodSeller}</option>
					           <option value="seller">${product.prodSeller}</option>
					        </select>
					        <span class="icon icon-pointer-angle-down-gray-md-1" aria-hidden="true"></span>
					      </div>
					          <input type="hidden" name="select_pay_at" id="select_pay_at" value="1" class="select-pay-at">
					    </section>
					    
					    <section class="selected-options text-caption-1">
					    	<div class="item" data-index="0">
					        <p class="name">${product.prodSeller}</p>
						        <div class="detail">
						          <div class="amount">
						            <span class="icon icon-etc-button-minus btn-change-amount down" role="button"></span>
						            <input type="number" value="1">
						            <span class="icon icon-etc-button-plus btn-change-amount up" role="button"></span>
						          </div>
						          <p class="price bold"><span class="amount">
						          	<fmt:formatNumber value="${product.prodPrice-(product.prodPrice*product.discountRate/100)}" pattern="#,###"/>
						          </span>원</p>
						        </div>
					        <span class="icon icon-pointer-x-dark btn-remove hide" role="button" aria-hidden="false"></span>
					      	</div>
					      <div class="item hide">
					        <p class="name">text</p>
					        <div class="detail">
					          <div class="amount">
					            <span class="icon icon-etc-button-minus btn-change-amount down" role="button"></span>
					            <input type="number" value="1">
					            <span class="icon icon-etc-button-plus btn-change-amount up" role="button"></span>
					          </div>
					          <p class="price bold"><span class="amount">5,000</span>원</p>
					        </div>
					        <span class="icon icon-pointer-x-dark btn-remove hide" role="button" aria-hidden="false"></span>
					      </div>
					      <div class="item item-assembly-option hide">
					        <p class="name"><span class="amount">1</span>개 조립</p>
					        <p class="price bold"><span class="amount">0</span>원</p>
					        <span class="icon icon-pointer-x-dark btn-remove hide" role="button" aria-hidden="false"></span>
					      </div>
					    </section>
					    <p class="total-price">
					      <span style="font-size: 15px">주문금액</span>
					      <span class="text-black">
					      	<strong class="text-heading-2">
					      		<fmt:formatNumber value="${product.prodPrice-(product.prodPrice*product.discountRate/100)}" pattern="#,###"/>
					      	</strong>원</span>
					    </p>
					    
					  <div class="buttons">
			            <button class="btn btn-light bold signed btn-add-to-cart">장바구니 담기</button>
			            <a class="btn btn-priority bold btn-buy-now" data-remote="true" href="#">구매하기</a>
			            <button class="btn btn-priority bold signed btn-buy-now hide">구매하기</button>
					  </div>
					  
					</div>
				        </div>
        
			</div>
		</div>
	</div>
	
	
	
	<!-- content -->
	<section id="contents" class="container">
		<div id="selling-helper-wrap" class="sticky-top">
			<div id="selling-helper" class="sticky-content row absolute open float"
				data-sticky-enabled="true" style="position: fixed; bottom: auto; top: 81px;">
				<section class="col-12">
					<nav id="product-contents-tab" style="font-size: 15px;">
						<ul class="row align-flex-end">
							<li class="col active" data-target="product-info">상품정보</li>
							<li class="col" data-target="product-info">리뷰(${product.reviewCnt})</li>
							<li class="col" data-target="product-info">문의</li>
							<li class="col" data-target="product-info">배송/교환/환불</li>
						</ul>
					</nav>
				</section>
				
				<!-- 하단 우측 option fix [S] -->
				<div id="product-selling-option-wrap" class="col-4">
					<section id="product-selling-option">
						<h4 class="text-black bold">옵션선택</h4>
						<div class="production-selling-option" data-production="135034">
							<section>
								<div class="select-wrap hide">
									<select class="form-control production-option-depth-1">
										<option value="0" disabled="" selected="">${product.prodSeller}</option>
										<option value="${product.prodSeller}"></option>
									</select> 
										<span class="icon icon-pointer-angle-down-gray-md-1" aria-hidden="true"></span>
								</div>
								<input type="hidden" name="select_pay_at" id="select_pay_at" value="1" class="select-pay-at">
							</section>
							<section class="selected-options text-caption-1">
								<div class="item" data-index="0">
									<p class="name">${product.prodSeller}</p>
									<div class="detail">
										<div class="amount">
											<span class="icon icon-etc-button-minus btn-change-amount down"
												role="button"></span> <input type="number" value="1">
											<span class="icon icon-etc-button-plus btn-change-amount up"
												role="button"></span>
										</div>
										<p class="price bold">
											<span class="amount"> 
												<fmt:formatNumber value="${product.prodPrice-(product.prodPrice*product.discountRate/100)}"
													pattern="#,###" />
											</span>원
										</p>
									</div>
									<span class="icon icon-pointer-x-dark btn-remove hide"
										role="button" aria-hidden="false"></span>
								</div>
								<div class="item hide">
									<p class="name">text</p>
									<div class="detail">
										<div class="amount">
											<span
												class="icon icon-etc-button-minus btn-change-amount down"
												role="button"></span> <input type="number" value="1">
											<span class="icon icon-etc-button-plus btn-change-amount up"
												role="button"></span>
										</div>
										<p class="price bold">
											<span class="amount">5,000</span>원
										</p>
									</div>
									<span class="icon icon-pointer-x-dark btn-remove hide"
										role="button" aria-hidden="false"></span>
								</div>
								<div class="item item-assembly-option hide">
									<p class="name">
										<span class="amount">1</span>개 조립
									</p>
									<p class="price bold">
										<span class="amount">0</span>원
									</p>
									<span class="icon icon-pointer-x-dark btn-remove hide"
										role="button" aria-hidden="false"></span>
								</div>
							</section>

							<p class="total-price">
								<span style="font-size: 15px">주문금액</span> <span
									class="text-black"> 
									<strong class="text-heading-2">
										<fmt:formatNumber value="${product.prodPrice-(product.prodPrice*product.discountRate/100)}"
												pattern="#,###"></fmt:formatNumber>
									</strong>원
								</span>
							</p>
							<div class="buttons">
								<button class="btn btn-light bold signed btn-add-to-cart">장바구니
									담기</button>
								<a class="btn btn-priority bold btn-buy-now" data-remote="true"
									href="/sessions?from=product_detail">구매하기</a>
								<button class="btn btn-priority bold signed btn-buy-now hide">구매하기</button>
							</div>
						</div>
					</section>
				</div>
				<!-- 하단 우측 option fix [E] -->
			</div>
		</div>
		
		<div id="product-contents-wrap" class="row justify-center justify-lg-flex-start lg">
			<section id="product-contents" class="col-12 col-md-10 col-lg-8 selling-lg">
				<div class="selling-lg-wrap">
					<div id="product-info"></div>
					
					<!-- 상품 상세페이지 -->
					<section id="product-detail" class="contents">
						<button id="btn-show-product-detail"
							class="bold hide-md btn btn-priority">
							펼치기<span class="icon icon-pointer-angle-down-sm icon-caret"
								aria-hidden="true"></span>
						</button>
						<div class="product-detail__gradient-show"></div>
						<div id="product-detail-contents" class="product-detail-hidden">
							<p>
								<img src="${product.prodImage}"/>
								<img src="${product.prodImage}"/>
								<img src="${product.prodImage}"/>
								<img src="${product.prodImage}"/>
								<img src="${product.prodImage}"/>
								<img src="${product.prodImage}"/>
								<img src="${product.prodImage}"/>
							</p>
						</div>
						<section id="product-info-noti" class="product-noti-detail-hidden">
							
						</section>
					</section>
					<!-- 상품 상세페이지 -->
				</div>
			</section>
		</div>
	</section>
	
	<!-- 모바일 구매하기 버튼-->
	<nav id="production-selling-option-sm-buttons">
      <div class="production-toolbar">    
          <button class="btn production-toolbar__button--active production-toolbar__button--action btn-toggle-panel">구매하기</button>
          <button class="btn production-toolbar__button--disabled production-toolbar__button--hidden cart btn-toggle-panel"
          	style="border-style: none;">장바구니</button>
      </div>
    </nav>
	<!-- 모바일 구매하기 버튼-->
</main>
</body>
</html>