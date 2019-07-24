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
<link rel="stylesheet" type="text/css" href="${root}/css/store/application.css">
<link rel="stylesheet" type="text/css" href="${root}/css/store/production.css">
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
								<c:if test="${login == 'login'}">
								<a class="production-review__info__write" onclick="openReviewPopUp(event)">리뷰쓰기</a>
								</c:if>
								<c:if test="${login != 'login'}">
								<a class="production-review__info__write" href="/member/gotoSignin">리뷰쓰기</a>
								</c:if>
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
								<div class="production-review__filter">
									<div class="production-review__filter-wrap">
										<ul class="production-review__filter__order">
											<li class="production-review__filter__order__list production-review__filter__order__list--active">베스트순</li>
											<li class="production-review__filter__order__list">
												최신순<span class="line"></span>
											</li>
											<li class="production-review__filter__order__list">사진리뷰
												<svg class="production-review__filter__order__list__icon" width="18" height="18" viewBox="0 0 18 18" preserveAspectRatio="xMidYMid meet">
													<path fill="currentColor" d="M15.821 3a.67.67 0 0 1 .679.672v10.656a.67.67 0 0 1-.679.672H2.18a.67.67 0 0 1-.679-.672V3.672c0-.375.3-.672.679-.672H15.82zm-.679 1.344H2.858v8.14L7.01 7.781c.094-.125.284-.125.394 0l2.321 2.657c.048.046.063.109.048.156l-.3 1.375c-.016.11.11.172.173.094l2.369-2.579a.202.202 0 0 1 .284 0l2.842 3.094V4.344zm-2.526 3.61a1.1 1.1 0 0 1-1.105-1.095 1.1 1.1 0 0 1 1.105-1.093 1.1 1.1 0 0 1 1.105 1.093 1.1 1.1 0 0 1-1.105 1.094z"></path>
												</svg>
											</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="production-review-item__list">
								<!-- 리뷰 내용 -->
								<div class="production-review-item__container">
									<article class="production-review-item">
										<div class="production-review-item__writer">
											<a href="">
												<img class="production-review-item__writer__img" src="">
											</a>
											<div class="production-review-item__writer__info">
												<p class="production-review-item__writer__info__name">회원닉네임</p>
												<button class="production-review-item__writer__info__total-star-wrap" type="button">
													<span class="production-review-item__writer__info__total-star" aria-label="별점 5.0점">
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
												</button>
												<span class="production-review-item__writer__info__date">구매날짜 구매</span>
											</div>
										</div>
										<p class="production-review-item__name"></p>
										<button class="production-review-item__img__btn">
											<img class="production-review-item__img" src="">
										</button>
										<p class="production-review-item__description">내용</p>
										<div class="production-review-item__help">
											<button type="button" class="production-review-item__help__btn">도움이 돼요</button>
										</div>
									</article>
								</div>
								<!-- 리뷰 내용 -->
							</div>
							<ul class="list-paginator production-review__paginator"></ul>
						</section>
					</section>
					<!-- 리뷰 -->
					
					<!-- 교환/환불 -->
					<section id="product-shipping" class="contents">
						<section>
							<h4 class="bold text-black">배송 관련 안내</h4>
							<table class="line-height-normal">
								<tbody>
									<tr>
										<th>배송</th>
										<td>일반택배배송</td>
									</tr>
									<tr>
										<th>배송비</th>
										<td>전체 상품 무료</td>
									</tr>
									<tr>
										<th>배송불가 지역</th>
										<td><div>배송불가 지역이 없습니다.</div></td>
									</tr>
								</tbody>
							</table>
						</section>
						<section>
				      		<h4 class="bold text-black">교환 및 환불</h4>
			      			<table cellspacing="0" class="line-height-normal">
			      				<tbody>
			      					<tr>
			      						<th>반품배송비</th>
			      						<td>CASE BY CASE</td>
							        </tr>
							        <tr>
							        	<th>교환배송비</th>
							        	<td>CASE BY CASE</td>
							        </tr>
							        <tr>
							        	<th>보내실 곳</th>
							        	<td colspan="3">
							            	<div>(08801) 서울 관악구 솔밭로4길 10</div>
							          </td>
							        </tr>
								</tbody>
							</table>
							<section class="text-caption-2 refund">
						        <p class="text-body-2 bold">반품/교환 사유에 따른 요청 가능 기간</p>
						        <p class="text-gray-light">반품 시 먼저 판매자와 연락하셔서 반품 관련 내용 협의 후 반품상품을 발송해 주시기 바랍니다.</p>
						        <ol class="line-height-normal">
							        <li>
								        <span>1</span>
								            구매자 단순 변심은 상품 수령 후 7일 이내
								        <small>(구매자 반품배송비 부담)</small>
							        </li>
							        <li>
								        <span>2</span>
								            표시/광고와 상이, 상품하자의 경우 상품 수령 후 3개월 이내 혹은 표시/광고와 다른 사실을 안 날로부터 30일이내.<br>둘 중 하나 경과 시 반품/교환 불가
								        <small>(판매자 반품배송비 부담)</small>
							        </li>
						        </ol>
							</section>
							<section class="text-caption-2 refund">
						        <p class="text-body-2 bold">반품/교환 불가능 사유</p>
						        <p class="text-gray-light">아래와 같은 경우 반품/교환이 불가능합니다.</p>
						        <ol class="line-height-normal">
									<li>
										<span>1</span>
										반품요청기간이 지난 경우
									</li>
									<li>
										<span>2</span>
										구매자의 책임 있는 사유로 상품 등이 멸실 또는 훼손된 경우
										<small>(단, 상품의 내용을 확인하기 위하여 포장 등을 훼손한 경우는 제외)</small>
									</li>
									<li>
										<span>3</span>
										포장을 개봉하였으나 포장이 훼손되어 상품가치가 현저히 상실된 경우
										<small>(예: 식품, 화장품)</small>
									</li>
									<li>
										<span>4</span>
										구매자의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우
										<small>(라벨이 떨어진 의류 또는 태그가 떨어진 명품관 상품인 경우)</small>
									</li>
									<li>
										<span>5</span>
										시간의 경과에 의하여 재판매가 곤란할 정도로 상품 등의 가치가 현저히 감소한 경우
										<small>(예: 식품, 화장품)</small>
									</li>
									<li>
										<span>6</span>
										고객주문 확인 후 상품제작에 들어가는 주문제작상품
									</li>
									<li>
										<span>7</span>
										복제가 가능한 상품 등의 포장을 훼손한 경우
										<small>(CD/DVD/GAME/도서의 경우 포장 개봉 시)</small>
									</li>
						        </ol>
					      </section>
					</section>
					<!-- 교환/환불 -->
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
<!-- 리뷰쓰기 팝업 [S] -->
<div class="popup new ui-popup ui-editing-popup"><!-- style="display: block;" -->
	<div class="close_popup">
		<div class="pop_extra">
			<div class="pop_container">
				<div id="production_review_pop">
					<div class="title">리뷰쓰기</div>
					<form id="production_review_form" class="new_production_review" action="/store/insertReview.do" enctype="multipart/form-data">
						<!-- 상품 정보 -->
						<div class="select_production field">
							<div class="product_image" style="background-image: url('${product.prodImage}')"></div>
							<div class="product_info">
								<div class="brand_name">${product.prodSeller}</div>
								<div class="name">${product.prodTitle}</div>
							</div>
						</div>
						<input type="hidden" name="memberNo" id="memberNo">
						<input type="hidden" name="prodNo" id="prodNo">
						<!-- 별점 -->
						<div class="select_star field">
							<div class="title">별점을 눌러 만족도를 알려주세요</div>
							<div class="star">
								<div class="star_title">만족도</div>
								<div class="star_image">
				                    <div class="star avg_star empty"></div>
				                    <div class="star avg_star empty"></div>
				                    <div class="star avg_star empty"></div>
				                    <div class="star avg_star empty"></div>
				                    <div class="star empty avg_star"></div>
				                    <div class="star_msg" style="color: rgb(66, 66, 66);"></div>
			               		</div>
							</div>
						</div>
						<!-- 사진 등록 -->
						<div class="select_card field">
					        <div class="title">
					            	사진을 등록해주세요.<span class="caption">(선택)</span>
					        </div>
					        <div class="guide">
					          <strong>상품 관련 사진 등록하기</strong>
					        </div>
					        <div id="upload_panel">
					            <img id="previewImage"/>
					            <div id="delete_review_card">사진 삭제하기</div>
					        </div>
					        <div id="add_review_card">새로운 사진 업로드
					            <input type="file" name="image" id="card_uploader" accept="image/*">
					        </div>
					
					        <input type="hidden" name="" id="production_review_card_id">
    					</div>
						<!-- 리뷰 내용 -->
						<div class="select_comment field">
					        <div class="title"> 리뷰를 작성해주세요.</div>
					        <div class="guide">이 제품을 사용하면서 느꼈던 장점과 단점을 솔직하게 알려주세요.</div>
					        <div class="counting">
					            <span id="comment_count">0</span>자 | 최소 20자
					        </div>
					
					        <textarea placeholder="이 제품을 사용하면서 느꼈던 장점과 단점을 솔직하게 알려주세요." name="production_review[comment]" id="production_review_comment"></textarea>
					
					        <div class="refer">
					            *해당 상품과 무관한 내용이나 동일 문자의 반복 등 부적합한 내용은 삭제될 수 있습니다.
					        </div>
					    </div>
						<!-- 취소 & 등록 버튼 -->
						<div class="actions">
					        <div class="guide">*감사합니다.</div>
					        <input type="submit" name="commit" value="등록하기" id="submit" class="submit" data-disable-with="등록">
					        <div class="close_popup cancel">취소하기</div>
					    </div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 리뷰쓰기 팝업 [E] -->
</body>
</html>