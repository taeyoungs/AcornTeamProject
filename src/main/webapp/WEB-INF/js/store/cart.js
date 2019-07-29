$(function(){
//	$(".round-checkbox-input_input").prop("checked", true); 
//	allCheck();
	console.log($(".round-checkbox-input_input").prop("checked"));

	// 장바구니 X 버튼으로 물품 삭제하기
	$(document).on('click', '.carted-product_delete', function(){
		var isDelete = confirm("해당 물품을 삭제하시겠습니까?");
	});
	
	// 장바구니 옵션 X 버튼으로 물품 삭제하기
	// -> 원래 옵션을 삭제하는 기능인데 옵션을 구현하기 힘들어서 위와 동일한 삭제 기능으로 구현
	$(document).on('click', '.selling-option-item_delete', function(){
		var isDelete = confirm("해당 물품을 삭제하시겠습니까?");
	});
	
	$(document).on('click', '.commerce-cart_header_delete', function(){
//		var checkedCnt = $(".round-checkbox-input_input").prop("checked", true).length;
//		if(parseInt(checkedCnt)-1 < 0) {
//			alert("선택된 상품이 없습니다.");
//		} else {
//			var isDelete = confirm("선택된 "+(parseInt(checkedCnt)-1)+"개의 상품을 삭제하시겠습니까?");
//		}
		alert("선택된 상품이 없습니다.");
	});
	
//	$('.commerce-cart_header_left').one('click', function(){
//		console.log("1111111111");
//	});
	
//	$(document).on('click', '.commerce-cart_header_left', function(){
	$('.commerce-cart_header_left').click(function(){
		var isCheck = $(this).parent().find(".round-checkbox-input_input");
		
		console.log(isCheck);
//		console.log(isCheck.prop("checked"));
//		console.log(isCheck.attr("checked"));
//		isCheck.attr("checked") == "checked"
//		isCheck.prop("checked") == true
		if(isCheck.prop("checked")) {
			console.log("true");
//			$(isCheck).removeAttr("checked"); 
			$(isCheck).prop("checked", false);
			$(this).parent().find(".round-checkbox-input_icon img").attr("src", "/image/common/empty.png");
		} else {
			console.log("false");
//			$(isCheck).attr("checked", "checked"); 
			$(isCheck).prop("checked", true);
			$(this).parent().find(".round-checkbox-input_icon img").attr("src", "/image/common/checked.png");
		}
	});
	
//	var caption = $(".caption").prev();
//	console.log(caption);
//	$(document).on('click', caption, function() {
//		
//		var isCheck = $(this).prev();
//		
//		if(isCheck.attr("checked") == "checked") {
//			console.log("true");
//			$(isCheck).removeAttr("checked"); 
////			$(isCheck).prop("checked", false);
//			$(this).find(".check").attr("src", "/image/common/empty.png");
//		} else {
//			console.log("false");
//			$(isCheck).attr("checked", "checked"); 
////			$(isCheck).prop("checked", true);
//			$(this).find(".check").attr("src", "/image/common/checked.png");
//		}
//	});
	
	
	
	//만약 전체 선택 체크박스가 체크된상태일경우 
//	if($("#allCheck").prop("checked")) { 
//		//해당화면에 전체 checkbox들을 체크해준다 
//		$("input[type=checkbox]").prop("checked",true); 
//		// 전체선택 체크박스가 해제된 경우 
//		} else { 
//			//해당화면에 모든 checkbox들의 체크를해제시킨다. 
//		$("input[type=checkbox]").prop("checked",false); 
//	}
	
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
	
	var cartProdCnt = $(".commerce-cart_content_group-item").get();
	$("span.caption").text("모두선택 ("+cartProdCnt.length+"개)");
	$(".commerce-cart_side-bar_order_btn").text(cartProdCnt.length+"개 상품 구매하기");
	
	
});

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