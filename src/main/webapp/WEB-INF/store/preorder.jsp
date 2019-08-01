<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Document</title>
</head>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<script type="text/javascript" src="/js/store/preorder.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" type="text/css" href="/css/store/preorder.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
<body>
<div id="body" class="orders pre_order">
    <div id="pre_order" class="bucket">
        <form action="orderResult.do" id="edit_order" class="edit_order" method="POST" accept-charset="UTF-8">
            <div id="title">  주문/결제
                <div id="open_order_productions" data-click-state=1>주문 상품 닫기</div>
            </div>
            <table id="order_productions">
                <tbody>
                    <tr class="production">
                        <td>
                        	<c:if test="${pvo ne null }">
                            <div class="information">
                                <img src="${pvo.prodImage }">
                                <div>
                                    <div class="name">${pvo.prodTitle }</div>
                                    <div class="cost_count">
                                        <div class="cost"><fmt:formatNumber value="${pvo.prodPrice}" pattern="#,###"/>원</div>
                                        <div class="divider">|</div>
                                        <div class="count">${counts }개</div>
                                    </div>
                                </div>
                            </div>
                            </c:if>
                           	<c:if test="${calist ne null }">
                           	<c:forEach items="${calist }" var="ca">
                            <div class="information">
                                <img src="${ca.prod_img }">
                                <div>
                                    <div class="name">${ca.prod_title }</div>
                                    <div class="cost_count">
                                        <div class="cost"><fmt:formatNumber value="${ca.prod_price}" pattern="#,###"/>원</div>
                                        <div class="divider">|</div>
                                        <div class="count">${ca.counts }개</div>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                            <input type="hidden" class="prod_list" name="prodList" value="${prodList}">
                            </c:if>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="panel">
                <div class="title">
                    <div class="title">배송지 정보</div>
                </div>
                <div class="input">
                    <div class="field">
                        <div class="label">받는분</div>
                        <div class="input">
                            <input type="text" id="order_recipient" class="can_copy half" name="order_customer">
                        </div>
                    </div>
                    <div class="field">
                        <div class="label">우편번호</div>
                        <div class="input">
                            <input type="text" id="order_received_zip_code" class="non_edit quarter" readonly="readonly"
                                name="order_address">
                            <span id="find_address">우편번호</span>
                        </div>
                    </div>
                    <div class="field">
                        <div class="label">주소</div>
                        <div class="input vertical">
                            <input type="text" id="order_received_at" class="non_edit full" readonly="readonly"
                                name="order_address">
                            <input type="text" id="order_received_at_detail" class="full" autocomplete="off"
                                name="order_address">
                        </div>
                    </div>
                    <div class="field">
                        <div class="label">휴대전화</div>
                        <div class="input phone">
                            <input type="text" id="order_received_phone_number" name="order_contact">
                        </div>
                    </div>
                    <div class="field">
                        <div class="label vertical">배송메모</div>
                        <div class="input vertical">
                            <input type="text" id="delivery_message" class="delivery_memo donot_check_before_payment full view_delivery_preset"
                            autocomplete="off" name="order_comment" value="">
                            <div id="delivery_messages" style="display:none;"></div>
                            <div id="delivery_message_presets" style="display: none;">
                                <div class="preset">배송 전에 미리 연락주세요</div>
                                <div class="preset">집에 아무도 없으면 문앞에 놔주세요</div>
                                <div class="preset">경비실에 맡겨주세요</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <c:if test="${pvo ne null }">
            <div class="panel">
                <div class="title">최종 결제 금액</div>
                <div class="cost">
                    <div class="cost_panel">
                        <div class="title">총 상품 금액</div>
                        <div id="preview_product_cost" class="amount"><fmt:formatNumber value="${pvo.prodPrice*counts}" pattern="#,###"/>원</div>
                    </div>
                    <div class="cost_panel">
                        <div class="title">할인 금액</div>
                        <div id="preview_delivery_cost" class="amount"><fmt:formatNumber value="${(pvo.prodPrice*counts)*pvo.discountRate/100}" pattern="#,###"/>원</div>
                    </div>
                    <div class="cost_panel">
                        <div class="title">배송비</div>
                        <div id="preview_delivery_cost" class="amount">무료</div>
                    </div>
                    <div class="total cost_panel">
                        <div class="title">총 결제금액</div>
                        <div id="preview_selling_cost" class="amount"><fmt:formatNumber value="${(pvo.prodPrice*counts)-((pvo.prodPrice*counts)*pvo.discountRate/100)}" pattern="#,###"/>원</div>
                    </div>
                   <input type="hidden" class="total_amount" name="order_price" value="${(pvo.prodPrice*counts)-((pvo.prodPrice*counts)*pvo.discountRate/100)}">
                   <input type="hidden" class="prod_no" name="prod_no" value="${prod_No}">
                   <input type="hidden" class="prod_counts" name="counts" value="${counts }">
                   <input type="hidden" class="prod_title" name="prodTitle" value="${pvo.prodTitle }">
                </div>
            </div>
            </c:if>
            <c:if test="${calist ne null }">
            <div class="panel">
                <div class="title">최종 결제 금액</div>
                <div class="cost">
                    <div class="cost_panel">
                        <div class="title">총 상품 금액</div>
                        <div id="preview_product_cost" class="amount"><fmt:formatNumber value="${totalPrice}" pattern="#,###"/>원</div>
                    </div>
                    <div class="cost_panel">
                        <div class="title">할인 금액</div>
                        <div id="preview_delivery_cost" class="amount"><fmt:formatNumber value="${totalDiscountPrice}" pattern="#,###"/>원</div>
                    </div>
                    <div class="cost_panel">
                        <div class="title">배송비</div>
                        <div id="preview_delivery_cost" class="amount">무료</div>
                    </div>
                    <div class="total cost_panel">
                        <div class="title">총 결제금액</div>
                        <div id="preview_selling_cost" class="amount"><fmt:formatNumber value="${totalPriceAfterDiscount}" pattern="#,###"/>원</div>
                    </div>
                </div>
            </div>
            </c:if>
            <button type="submit" id="do_payment">결제하기</button>
        </form>
    </div>
</div>
</body>
</html>