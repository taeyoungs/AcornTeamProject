<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="root" value="<%=request.getContextPath()%>"/>
<link rel="stylesheet" type="text/css" href="${root}/css/store/cart.css">
<script type="text/javascript" src="${root}/js/store/cart.js"></script>
<title>Insert title here</title>
</head>
<body>
<main role="main" id="root">
	<div class="page">
		<div class="commerce-cart-wrap">
			<div class="container">
				<div class="commerce-cart row">
					<div class="commerce-cart_content-wrap col-12 col-md-7 col-lg-8">
						<div class="commerce-cart_content">
							<div class="sticky-container commerce-cart_header-wrap">
								<div class="sticky-child commerce-cart_header" style="position: relative;">
									<span class="commerce-cart_header_left">
										<div class="round-checkbox-input round-checkbox-input-blue">
											<div class="round-checkbox-input_label">
												<input type="checkbox" class="round-checkbox-input_input" autocomplete="off" checked>
												<span class="round-checkbox-input_icon">
													<img src="/image/common/checked.png" class="check">
												</span>
												<span class="caption">모두선택 (?개)</span>
											</div>
										</div>
									</span>
									<span class="commerce-cart_header_right">
										<button class="commerce-cart_header_delete" type="button">선택삭제</button>
									</span>
								</div>
							</div>
							<ul class="commerce-cart_content_group-list">
								<li class="commerce-cart_content_group-item">
									<article class="commerce-cart_group">
										<h1 class="commerce-cart_group_header">에이트리스 배송</h1>
										<ul class="commerce-cat_group_item-list">
											<li class="commerce-cart_group_item">
												<article class="commerce-cart_delivery-group">
													<ul class="commerce-cart_delivery-group_product-list">
														<li class="commerce-cart_delivery-group_product-item">
															<article class="carted-product">
																<div class="round-checkbox-input round-checkbox-input-blue carted-product_select">
																	<div class="round-checkbox-input_label">
																		<input type="checkbox" class="round-checkbox-input_input" autocomplete="off" 
																			checked aria-label="[에어트리스] 무소음 디자인 벽시계">
																		<span class="round-checkbox-input_icon">
																			<img src="/image/common/checked.png" class="check">
																		</span>
																	</div>
																</div>
																<a class="product-small-item product-small-item-clickable">
																	<div class="product-small-item_image">
																		<img src="/image/furniture/furnitureA_001.jpg">
																	</div>
																	<div class="product-small-item_content">
																		<h1 class="product-small-item_title">
																		[에어트리스] 무소음 디자인 벽시계
																		</h1>
																		<p class="product-small-item_caption">무료배송 | 일반택배</p>
																	</div>
																</a>
																<button type="button" class="carted-product_delete" aria-label="삭제">
																	<img src="/image/common/cart-delete-4242.png">
																</button>
																<ul class="carted-product_option-list">
																	<li class="carted-product_option-list_item">
																		<article class="selling-option-item">
																			<h1 class="selling-option-item_name">콘크리트</h1>
																			<button type="button" class="selling-option-item_delete" aria-label="삭제">
																				<img src="/image/common/cart-delete-7575.png">
																			</button>
																			<div class="selling-option-item_controls">
																				<div class="selling-option-item_quantity">
																					<div class="input-group select-input option-count-input">
																						<select class="form-control">
																							<option value="0">1</option>
																							<option value="1">2</option>
																							<option value="2">3</option>
																							<option value="3">4</option>
																							<option value="4">5</option>
																							<option value="5">6</option>
																							<option value="6">7</option>
																							<option value="7">8</option>
																							<option value="8">9</option>
																							<option value="9">10+</option>
																						</select>
																						<span class="select-input_icon">
																							<img src="/image/common/button.png" class="icon">
																						</span>
																					</div>
																				</div>
																				<p class="selling-option-item_price">
																					<span class="selling-option-item_price_number">9,900</span>원
																				</p>
																			</div>
																		</article>
																	</li>
																</ul>
																<div class="carted-product_footer">
																	<span class="carted-product_footer_left">
																		<button class="carted-product_order-btn">바로구매</button>
																	</span>
																	<span class="carted-product_subtotal">
																		<span class="carted-product_subtotal_number">9,900</span>원
																	</span>
																</div>
															</article>
														</li>
													</ul>
													<footer class="commerce-cart_delivery-group_footer">
														<p class="commerce-cart_delivery-group_total">배송비 무료</p>
													</footer>
												</article>
											</li>
										</ul>
									</article>
								</li>
							</ul>
						</div>
					</div>
					<div class="commerce-cart_side-bar-wrap col-12 col-md-5 col-lg-4">
						<div class="sticky-container commerce-cart_side-bar-container" style="position: sticky; top:0px;">
							<div class="sticky-child commerce-cart_side-bar" style="position: relative;">
								<dl class="commerce-cart_summary commerce-cart_side-bar_summary">
									<div class="commerce-cart_summary_row">
										<dt>총 상품금액</dt>
										<dd>
											<span class="number">9,900</span>원
										</dd>
									</div>
									<div class="commerce-cart_summary_row">
										<dt>총 배송비</dt>
										<dd>
											<span class="number">+0</span>원
										</dd>
									</div>
									<div class="commerce-cart_summary_row">
										<dt>총 할인금액</dt>
										<dd>
											<span class="number">-0</span>원
										</dd>
									</div>
									<div class="commerce-cart_summary_row commerce-cart_summary_row-total">
										<dt>결제금액</dt>
										<dd>
											<span class="number">9,900</span>원
										</dd>
									</div>
								</dl>
								<div class="commerce-cart_side-bar-order">
									<button class="button button-color-blue button-size-50 button-shape-4 commerce-cart_side-bar_order_btn">
									?개 상품 구매하기
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>
</body>
</html>