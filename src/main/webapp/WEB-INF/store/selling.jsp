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
					<a href="#product-review">
						<div class="cover__info__review__stars">
						<c:forEach begin="0" end="4" varStatus="loop">
						    <c:if test="${loop.index+1 <= product.starGrade/product.reviewCnt}">
						    	<span class="icon icon-etc-star-fill-sm"></span>
						    </c:if>
						    <c:if test="${loop.index+1 > product.starGrade/product.reviewCnt}">
						    	<span class="icon icon-etc-star-empty-sm"></span>
						    </c:if>
							<!-- <span class="icon icon icon-etc-star-half-sm"></span> -->
						</c:forEach>
						</div>
						<div>${product.reviewCnt} 개 리뷰</div>
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
								<input type="hidden" id="salePrice" value="${product.prodPrice-(product.prodPrice*product.discountRate/100)}">
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
			<div id="selling-helper" class="sticky-content row absolute open"
				data-sticky-enabled="false" style="position: absolute;" data-offset="132">
				<section class="col-12">
					<nav id="product-contents-tab" style="font-size: 15px;">
						<ul class="row align-flex-end">
							<li class="col active" data-target="product-info">상품정보</li>
							<li class="col" data-target="product-review" role="button">리뷰(${product.reviewCnt})</li>
							<li class="col" onclick="location.href='/member/writelist'" role="button">문의</li>
							<li class="col" data-target="product-shipping" role="button">배송/교환/환불</li>
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
					
					<!-- 리뷰 -->
					<section id="product-review" class="contents">
						<section class="production-review">
							<div class="production-review__info">
								<h1 class="production-review__info__title">리뷰
									<span class="production-review__info__title__number"></span>
								</h1>
								<a class="production-review__info__write">리뷰쓰기</a>
								<!-- 별 -->
								<div class="production-review__info__star">
									<div class="production-review__info__star__avg">별점</div>
									<span class="production-review__info__star__rating"> 
										<svg fill="#35C5F0" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 16 16">
											<defs>
												<path id="star-path-1.000" d="M8 13.54l-4.37 1.85c-.5.22-.88-.06-.83-.6l.4-4.73L.1 6.47c-.37-.41-.22-.85.32-.98l4.62-1.07L7.48.36c.29-.48.75-.47 1.04 0l2.44 4.06 4.62 1.07c.54.13.68.57.32.98l-3.1 3.59.4 4.72c.05.55-.33.83-.83.61L8 13.54z"></path>
												<clipPath id="star-clip-1.000">
													<rect x="0" y="0" width="16" height="16"></rect>
												</clipPath>
											</defs>
											<use xlink:href="#star-path-1.000" fill="#DBDBDB"></use>
											<use clip-path="url(#star-clip-1.000)" xlink:href="#star-path-1.000"></use>
										</svg>
									</span>
								</div>
								<!-- 별 -->
							</div>
							
							<div class="filter production-review__filter__options__list">
								<div class="production-review__filter"></div>
								<ul class="production-review__filter__tag__list"></ul>
							</div>
							<div class="production-review-item__list">
								<div class="production-review__filter-wrap">
									<ul class="production-review__filter__order">
										<li class="production-review__filter__order__list production-review__filter__order__list--active">베스트순</li>
										<li class="production-review__filter__order__list">
											<span class="line">최신순</span>
										</li>
										<li class="production-review__filter__order__list">사진리뷰
											<svg class="production-review__filter__order__list__icon" width="18" height="18" viewBox="0 0 18 18" preserveAspectRatio="xMidYMid meet">
												<path fill="currentColor" d="M15.821 3a.67.67 0 0 1 .679.672v10.656a.67.67 0 0 1-.679.672H2.18a.67.67 0 0 1-.679-.672V3.672c0-.375.3-.672.679-.672H15.82zm-.679 1.344H2.858v8.14L7.01 7.781c.094-.125.284-.125.394 0l2.321 2.657c.048.046.063.109.048.156l-.3 1.375c-.016.11.11.172.173.094l2.369-2.579a.202.202 0 0 1 .284 0l2.842 3.094V4.344zm-2.526 3.61a1.1 1.1 0 0 1-1.105-1.095 1.1 1.1 0 0 1 1.105-1.093 1.1 1.1 0 0 1 1.105 1.093 1.1 1.1 0 0 1-1.105 1.094z"></path>
											</svg>
										</li>
									</ul>
									<div class=""></div>
									<ul class=""></ul>
								</div>
							</div>
							<ul class="list-paginator production-review__paginator"></ul>
						</section>
					</section>
					<!-- 리뷰 -->
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
<script src="${root}/js/store/selling.js"></script>	
</body>
</html>