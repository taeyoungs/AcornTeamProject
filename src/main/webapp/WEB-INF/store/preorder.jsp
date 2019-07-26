<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<link rel="stylesheet" type="text/css" href="/css/store/preorder.css">
<body>
<div id="body" class="orders pre_order">
    <div id="pre_order" class="bucket">
        <form id="edit_order" class="edit_order" method="POST">
            <div id="title">  주문/결제
                <div id="open_order_productions">주문 상품 닫기</div>
            </div>
            <table id="order_production" cellpadding="0">
                <tbody>
                    <tr class="production">
                        <td>
                            <div class="information">
                                <img src="#">
                                <div>
                                    <div class="name"></div>
                                    <div class="option"></div>
                                    <div class="cost_count">
                                        <div class="cost"></div>
                                        <div class="divider"></div>
                                        <div class="count"></div>
                                    </div>
                                </div>
                            </div>
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
                            <input type="text" id="order_recipient" class="can_copy half" name="dev_receiver">
                            <input type="hidden" id="order_received_name">
                        </div>
                    </div>
                    <div class="field">
                        <div class="label">우편번호</div>
                        <div class="input">
                            <input type="text" id="order_received_zip_code" class="non_edit quarter" readonly="readonly"
                                name="dev_address">
                            <span id="find_address">우편번호</span>
                        </div>
                    </div>
                    <div class="field">
                        <div class="label">주소</div>
                        <div class="input vertical">
                            <input type="text" id="order_received_at" class="non_edit full" readonly="readonly"
                                name="dev_address">
                            <input type="text" id="order_received_at_detail" class="full" autocomplete="off"
                                name="dev_address_detail">
                        </div>
                    </div>
                    <div class="field">
                        <div class="label">휴대전화</div>
                        <div class="input phone">
                            <input type="text" id="order_received_phone_number" name="dev_hp">
                        </div>
                    </div>
                    <div class="field">
                        <div class="label vertical">배송메모</div>
                        <div class="input vertical">
                            <input type="text" id="delivery_message" class="delivery_memo donot_check_before_payment full view_delivery_preset"
                            autocomplete="off" name="dev_comment">
                            <div id="delivery_messages" style="display:none;"></div>
                            <div id="delivery_message_presets" style="top: 697.8px; display: none;">
                                <div class="preset">배송 전에 미리 연락주세요</div>
                                <div class="preset">집에 아무도 없으면 문앞에 놔주세요</div>
                                <div class="preset">경비실에 맡겨주세요</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel">
                <div class="title">최종 결제 금액</div>
                <div class="cost">
                    <div class="cost_panel">
                        <div class="title">총 상품 금액</div>
                        <div id="preview_product_cost" class="amount">원</div>
                    </div>
                    <div class="cost_panel">
                        <div class="title">배송비</div>
                        <div id="preview_delivery_cost" class="amount">0원</div>
                    </div>
                    <div class="total cost_panel">
                        <div class="title">총 결제금액</div>
                        <div id="preview_selling_cost" class="amount">원</div>
                    </div>
                </div>
            </div>
            <div id="do_payment"></div>
        </form>
    </div>
</div>
</body>
</html>