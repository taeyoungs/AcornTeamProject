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
												<span class="caption"></span>
											</div>
										</div>
									</span>
									<span class="commerce-cart_header_right">
										<button class="commerce-cart_header_delete" type="button">선택삭제</button>
									</span>
								</div>
							</div>
							<ul class="commerce-cart_content_group-list">
							<c:forEach var="cavo" items="${calist}">
								<li class="commerce-cart_content_group-item">
									<article class="commerce-cart_group">
										<h1 class="commerce-cart_group_header">${cavo.prod_seller} 배송</h1>
										<ul class="commerce-cat_group_item-list">
											<li class="commerce-cart_group_item">
												<article class="commerce-cart_delivery-group">
													<ul class="commerce-cart_delivery-group_product-list">
														<li class="commerce-cart_delivery-group_product-item">
															<article class="carted-product">
																<div class="round-checkbox-input round-checkbox-input-blue carted-product_select">
																	<div class="round-checkbox-input_label">
																		<input type="checkbox" class="round-checkbox-input_input" autocomplete="off" 
																			checked aria-label="[${cavo.prod_seller}] ${cavo.prod_title}">
																		<span class="round-checkbox-input_icon">
																			<img src="/image/common/checked.png" class="check">
																		</span>
																	</div>
																</div>
																<a class="product-small-item product-small-item-clickable" href="selling.do?prodNo=${cavo.prod_no}" target="_blank">
																	<div class="product-small-item_image">
																		<img src="${cavo.prod_img}">
																	</div>
																	<div class="product-small-item_content">
																		<h1 class="product-small-item_title">
																		[${cavo.prod_seller}] ${cavo.prod_title}
																		</h1>
																		<p class="product-small-item_caption">무료배송 | 일반택배</p>
																	</div>
																</a>
																<button type="button" class="carted-product_delete" aria-label="삭제" data-p-id="${cavo.prod_no}">
																	<img src="/image/common/cart-delete-4242.png">
																</button>
																<ul class="carted-product_option-list">
																	<li class="carted-product_option-list_item">
																		<article class="selling-option-item">
																			<h1 class="selling-option-item_name">${cavo.prod_title}</h1>
																			<button type="button" class="selling-option-item_delete" aria-label="삭제" data-p-id="${cavo.prod_no}">
																				<img src="/image/common/cart-delete-7575.png">
																			</button>
																			<div class="selling-option-item_controls">
																				<div class="selling-option-item_quantity">
																					<div class="input-group select-input option-count-input">
																						<select class="form-control">
																							<option value="0" ${cavo.counts == 1 ? 'selected' : ''}>1</option>
																							<option value="1" ${cavo.counts == 2 ? 'selected' : ''}>2</option>
																							<option value="2" ${cavo.counts == 3 ? 'selected' : ''}>3</option>
																							<option value="3" ${cavo.counts == 4 ? 'selected' : ''}>4</option>
																							<option value="4" ${cavo.counts == 5 ? 'selected' : ''}>5</option>
																							<option value="5" ${cavo.counts == 6 ? 'selected' : ''}>6</option>
																							<option value="6" ${cavo.counts == 7 ? 'selected' : ''}>7</option>
																							<option value="7" ${cavo.counts == 8 ? 'selected' : ''}>8</option>
																							<option value="8" ${cavo.counts == 9 ? 'selected' : ''}>9</option>
																							<option value="9" ${cavo.counts >= 10 ? 'selected' : ''}>10+</option>
																						</select>
																						<span class="select-input_icon">
																							<img src="/image/common/button.png" class="icon">
																						</span>
																					</div>
																				</div>
																				<p class="selling-option-item_price">
																					<span class="selling-option-item_price_number">
																					<fmt:formatNumber value="${(cavo.prod_price-(cavo.prod_price*(cavo.discount_rate/100)))*cavo.counts}" pattern="#,###"/>
																					</span>원
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
																		<span class="carted-product_subtotal_number">
																		<fmt:formatNumber value="${(cavo.prod_price-(cavo.prod_price*(cavo.discount_rate/100)))*cavo.counts}" pattern="#,###"/>
																		</span>원
																		<input type="hidden" value="${cavo.prod_price}" class="prod_prices">
																		<input type="hidden" value="${cavo.prod_price*(cavo.discount_rate/100)}" class="discount_prices">
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
							</c:forEach>
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
											<span class="number"></span>원
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
											<span class="number"></span>원
										</dd>
									</div>
									<div class="commerce-cart_summary_row commerce-cart_summary_row-total">
										<dt>결제금액</dt>
										<dd>
											<span class="number"></span>원
										</dd>
									</div>
								</dl>
								<div class="commerce-cart_side-bar-order">
									<form action="preorderList.do" method="post">
										<input type="hidden" name="prodList" value="" class="preorderList">
										<button class="button button-color-blue button-size-50 button-shape-4 commerce-cart_side-bar_order_btn">
										</button>
										<button class="button-submit" type="submit" style="display: none;"></button>		
									</form>
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