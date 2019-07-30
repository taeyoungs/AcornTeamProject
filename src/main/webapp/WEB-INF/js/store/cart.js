$(function(){
//	$(".round-checkbox-input_input").prop("checked", true); 
//	allCheck();
	
	changePriceTxt();
	
	console.log($(".round-checkbox-input_input").prop("checked"));

	// 장바구니 X 버튼으로 물품 삭제하기
	$(document).on('click', '.carted-product_delete', function(){
		var isDelete = confirm("해당 물품을 삭제하시겠습니까?");
		var prod_no = $(this).attr("data-p-id");
		var removeLi = $(this).parents(".commerce-cart_content_group-item");
		
		if(isDelete) {
			deleteCartProd(prod_no, removeLi);
		}
	});
	
	// 장바구니 옵션 X 버튼으로 물품 삭제하기
	// -> 원래 옵션을 삭제하는 기능인데 옵션을 구현하기 힘들어서 위와 동일한 삭제 기능으로 구현
	$(document).on('click', '.selling-option-item_delete', function(){
		var isDelete = confirm("해당 물품을 삭제하시겠습니까?");
		var prod_no = $(this).attr("data-p-id");
		var removeLi = $(this).parents(".commerce-cart_content_group-item");
		
		if(isDelete) {
			deleteCartProd(prod_no, removeLi);
		}
	});
	
	
	// 선택 삭제 이벤트
	$(document).on('click', '.commerce-cart_header_delete', function(){
		
		var checkCnt = $(".round-checkbox-input_input").get();
		var prodNoList = "";
		
		for (var i = 0; i < checkCnt.length; i++) {
			if($(".round-checkbox-input_input").eq(0).prop("checked")) {
				if(i != 0) {
					prodNoList += $(".carted-product_delete").eq(i-1).attr("data-p-id")+",";
				}
				console.log(prodNoList);
			} else {

				if($(".round-checkbox-input_input").eq(i).prop("checked")) {
					prodNoList += $(".round-checkbox-input_input").eq(i).parents(".carted-product").find(".carted-product_delete").attr("data-p-id")+",";
					console.log($(".round-checkbox-input_input").eq(i).parents(".carted-product").find(".carted-product_delete"));
					console.log(prodNoList);
				}
			}
		}
		
		prodNoList = prodNoList.substring(0, prodNoList.length-1);
		
		var checkLen = $("input[type=checkbox]:checked").length;
		var checkboxCnt = $("input[type=checkbox]").length;
		
		if($("input[type=checkbox]:checked").length == 0) {
			alert("선택된 상품이 없습니다.");
		} else if(checkLen == checkboxCnt){
			var isDelete = confirm("선택된 "+(parseInt(checkLen)-1)+"개의 상품을 삭제하시겠습니까?");
			$("input[type=checkbox]:checked").parents(".commerce-cart_content_group-item").remove();
			deleteCartProd2(prodNoList);
		} else {
			var isDelete = confirm("선택된 "+(parseInt(checkLen))+"개의 상품을 삭제하시겠습니까?");
			$("input[type=checkbox]:checked").parents(".commerce-cart_content_group-item").remove();
			deleteCartProd2(prodNoList);
		}
		
	});
	
	// 전체 선택 or 해체 이벤트
	$('.commerce-cart_header_left').click(function(){
		var isCheck = $(this).parent().find(".round-checkbox-input_input");

		if(isCheck.prop("checked")) {

//			$(isCheck).removeAttr("checked"); 
			$("input[type=checkbox]").prop("checked",false); 
			$(".round-checkbox-input_icon img").attr("src", "/image/common/empty.png");
			$('span.number').eq(0).text("0");
			$('span.number').eq(2).text("-0");
			$('span.number').eq(3).text("0");
			$(".commerce-cart_side-bar_order_btn").text("구매하기");

		} else {

//			$(isCheck).attr("checked", "checked"); 
			$("input[type=checkbox]").prop("checked",true); 
			$(".round-checkbox-input_icon img").attr("src", "/image/common/checked.png");
			
			changePriceTxt();
			
			var cartProdCnt = $(".commerce-cart_content_group-item").get();
			$(".commerce-cart_side-bar_order_btn").text(cartProdCnt.length+"개 상품 구매하기");
		}
	});
	
	// 선택 해제
	$(".round-checkbox-input_icon").on('click', function(){
		var th = $(this);
	
		if($(".round-checkbox-input_icon").eq(0) != th) {

			if($(this).prev().prop("checked")) {
				
				// 전체 선택 해제
				$(".round-checkbox-input_icon").eq(0).prev().prop("checked", false);
				$(".round-checkbox-input_icon").eq(0).find(".check").attr("src", "/image/common/empty.png");
				console.log($(".round-checkbox-input_icon").eq(0));
				
				$(this).prev().prop("checked", false);
				$(this).find(".check").attr("src", "/image/common/empty.png");
				var prod = $(this).parents(".carted-product").find(".prod_prices").val();
				var discount = $(this).parents(".carted-product").find(".discount_prices").val();
				discount = parseInt(discount);
				prod = parseInt(prod);
				
				var totalPrice = $('span.number').eq(0).text();
				totalPrice = totalPrice.replace(",", "");
				var totalP = parseInt(totalPrice);
				$('span.number').eq(0).text((totalP-prod).format());
				
				var discountPrice = $('span.number').eq(2).text();
				discountPrice = discountPrice.replace("-", "");
				discountPrice = discountPrice.replace(",", "");
				var discountP = parseInt(discountPrice);
				$('span.number').eq(2).text("-"+(discountP-discount).format());
				
				$('span.number').eq(3).text((totalP-discountP-prod+discount).format());
				
				var cartProdCnt = $("input[type=checkbox]:checked").length;
	
				if(cartProdCnt == 0) {
					$(".commerce-cart_side-bar_order_btn").text("구매하기");
				} else {
					$(".commerce-cart_side-bar_order_btn").text((cartProdCnt)+"개 상품 구매하기");
				}
				
			} else {
				$(this).prev().prop("checked", true);
				$(this).find(".check").attr("src", "/image/common/checked.png");
				var prod = $(this).parents(".carted-product").find(".prod_prices").val();
				var discount = $(this).parents(".carted-product").find(".discount_prices").val();
				discount = parseInt(discount);
				prod = parseInt(prod);
				
				var totalPrice = $('span.number').eq(0).text();
				totalPrice = totalPrice.replace(",", "");
				var totalP = parseInt(totalPrice);
				$('span.number').eq(0).text((totalP+prod).format());
				
				var discountPrice = $('span.number').eq(2).text();
				discountPrice = discountPrice.replace("-", "");
				discountPrice = discountPrice.replace(",", "");
				var discountP = parseInt(discountPrice);
				$('span.number').eq(2).text("-"+(discountP+discount).format());
				
				$('span.number').eq(3).text((totalP-discountP+prod-discount).format());
				
				var checkedCnt = $("input[type=checkbox]:checked").length;
				var checkboxCnt = $("input[type=checkbox]").length-1;
				
				if(checkedCnt == checkboxCnt) {
					$(".round-checkbox-input_icon").eq(0).prop("checked", true);
					$(".round-checkbox-input_icon").eq(0).find(".check").attr("src", "/image/common/checked.png");
				}
				
				var cartProdCnt = $("input[type=checkbox]:checked").length;

				$(".commerce-cart_side-bar_order_btn").text((cartProdCnt)+"개 상품 구매하기");
	
			}
		} else if($(".round-checkbox-input_icon").eq(0) == th){
			console.log("여기");
			$('.commerce-cart_header_left').click();
		}
	});

	var cartProdCnt = $(".commerce-cart_content_group-item").get();
	$("span.caption").text("모두선택 ("+cartProdCnt.length+"개)");
	$(".commerce-cart_side-bar_order_btn").text(cartProdCnt.length+"개 상품 구매하기");
	
	// 수량 변경
	$("select.form-control").on('change', function(){
		var amount = $(this).find("option:selected").val();
		var prod_price = $(this).parents(".carted-product").find(".prod_prices").val();
		var discount = $(this).parents(".carted-product").find(".discount_prices").val();
		discount = parseInt(discount);
		prod_price = parseInt(prod_price);
		
		$(this).parents(".carted-product").find(".carted-product_subtotal_number").text(((prod_price-discount)*(parseInt(amount)+1)).format());
		$(this).parents(".selling-option-item_quantity").next().text(((prod_price-discount)*(parseInt(amount)+1)).format());
		
		var prod_no = $(this).parents(".carted-product").find(".carted-product_delete").attr("data-p-id");
		
		updateCounts(prod_no, parseInt(amount)+1);
	});
	
	// 구매하기 -> 결제(preorder.do)
	$(".commerce-cart_side-bar_order_btn").click(function(){
		
		setProdList();
		
		if($(".preorderList").val() == "") {
			alert("선택한 상품이 없습니다.");
		} else {
			$(".button-submit").click();
		}
	})
});

// 선택한 장바구니 물품 hidden에 저장하기
function setProdList() {
	var checkCnt = $(".round-checkbox-input_input").get();
	var prodNoList = "";
	
	for (var i = 0; i < checkCnt.length; i++) {
		if($(".round-checkbox-input_input").eq(0).prop("checked")) {
			if(i != 0) {
				prodNoList += $(".carted-product_delete").eq(i-1).attr("data-p-id")+",";
			}
		} else {

			if($(".round-checkbox-input_input").eq(i).prop("checked")) {
				prodNoList += $(".round-checkbox-input_input").eq(i).parents(".carted-product").find(".carted-product_delete").attr("data-p-id")+",";
			}
		}
	}
	
	prodNoList = prodNoList.substring(0, prodNoList.length-1);
	$(".preorderList").val(prodNoList);
	
}

// 수량 변경 ajax
function updateCounts(prod_no, amount) {
	$.ajax({
		url: 'updateCounts',
		type: 'post',
		dataType: 'json',
		data: {
			'prod_no' : prod_no,
			'counts' : amount
		},
		error:function(request,status,error){
		    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		},
		success: function(redata){
			var totalPrice = 0;
			var totalDiscount = 0;
			
			for (var i = 0; i < redata.length; i++) {
				totalPrice += redata[i].prod_price*redata[i].counts;
				totalDiscount += parseInt(redata[i].prod_price*(redata[i].discount_rate/100))*redata[i].counts;
			}
			$('span.number').eq(0).text(totalPrice.format());
			$('span.number').eq(2).text("-"+totalDiscount.format());
			$('span.number').eq(3).text((totalPrice-totalDiscount).format());
			
		}
	});
}

//총 상품금액, 할인금액 text 변경
function changePriceTxt() {
	// 총 상품금액 표시
	var prodPrices = $(".prod_prices").get();
	var totalPrice = 0;
	for (var i = 0; i < prodPrices.length; i++) {
		var temp = parseInt($(".prod_prices").eq(i).val());
		totalPrice += temp;
	}
	$('span.number').eq(0).text(totalPrice.format());
	
	// 총 할인금액 표시
	var discountPrices = $(".discount_prices").get();
	var totalDiscount = 0;
	for (var i = 0; i < discountPrices.length; i++) {
		var temp = parseInt($(".discount_prices").eq(i).val());
		totalDiscount += temp;
	}
	$('span.number').eq(2).text("-"+totalDiscount.format());
	
	$('span.number').eq(3).text((totalPrice-totalDiscount).format());
}

// X 버튼으로 장바구니 물품 삭제하는 ajax
function deleteCartProd(prod_no, removeLi) {
	$.ajax({
		url: 'deleteCartProd',
		type: 'post',
		dataType: 'json',
		data: {
			'prod_no' : prod_no
		},
		error:function(request,status,error){
		    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		},
		success: function(redata){
			$(removeLi).remove();
			var totalPrice = 0;
			var totalDiscount = 0;
			
			for (var i = 0; i < redata.length; i++) {
				totalPrice += redata[i].prod_price;
				totalDiscount += parseInt(redata[i].prod_price*(redata[i].discount_rate/100));
			}
			$('span.number').eq(0).text(totalPrice.format());
			$('span.number').eq(2).text("-"+totalDiscount.format());
			$('span.number').eq(3).text((totalPrice-totalDiscount).format());
			
			$("span.caption").text("모두선택 ("+redata.length+"개)");
			$(".commerce-cart_side-bar_order_btn").text(redata.length+"개 상품 구매하기");
		}
	});
}

// 선택 삭제로 장바구니 물품 삭제하는 ajax
function deleteCartProd2(prod_no) {
	$.ajax({
		url: 'deleteCartProd2',
		type: 'post',
		dataType: 'json',
		data: {
			'prod_no' : prod_no
		},
		error:function(request,status,error){
		    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		},
		success: function(redata){
			
			if($(".round-checkbox-input_input").eq(0).prop("checked")) {
				var totalPrice = 0;
				var totalDiscount = 0;
				
				for (var i = 0; i < redata.length; i++) {
					totalPrice += redata[i].prod_price;
					totalDiscount += parseInt(redata[i].prod_price*(redata[i].discount_rate/100));
				}
				$('span.number').eq(0).text(totalPrice.format());
				$('span.number').eq(2).text("-"+totalDiscount.format());
				$('span.number').eq(3).text((totalPrice-totalDiscount).format());
				
				$("span.caption").text("모두선택 ("+redata.length+"개)");
				$(".commerce-cart_side-bar_order_btn").text(redata.length+"개 상품 구매하기");
			} else {
				$('span.number').eq(0).text(0);
				$('span.number').eq(2).text("-"+0);
				$('span.number').eq(3).text(0);
				
				$("span.caption").text("모두선택 ("+redata.length+"개)");
				$(".commerce-cart_side-bar_order_btn").text("구매하기");
			}
			
		}
	});
}

function allCheck() {
	$(".round-checkbox-input_input").prop("checked", true); 
}

// js number format 함수 -> 숫자 타입
Number.prototype.format = function(){
    if(this==0) return 0;
 
    var reg = /(^[+-]?\d+)(\d{3})/;
    var n = (this + '');
 
    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
 
    return n;
};

//문자열 타입에서 쓸 수 있도록 format() 함수 추가
String.prototype.format = function(){
    var num = parseFloat(this);
    if( isNaN(num) ) return "0";
 
    return num.format();
};