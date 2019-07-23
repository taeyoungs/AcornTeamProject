//상품 수량 옵션
$(function(){
	$('div.amount span.down').click(function(){
		minus();
	});
	$('div.amount span.up').click(function(){
		plus();
	});
	
	$('li').click(function(){
		var dataTarget = $(this).attr('data-target');
		if (dataTarget != null) {
			location.href = '#' + dataTarget;
		}
	})
});

//Number Format
function formatNumber(price) {
	  return price.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');
}

function minus() {
	var count = Number($('div.amount input').val());
	if (count > 1) {
		count--;
		$('div.amount input').val(count);

		var price = $('#salePrice').val() * count;
		$('.text-heading-2').text(formatNumber(price));
		$('span.amount').text(formatNumber(price));
	}
}

function plus() {
	var count = Number($('div.amount input').val());
	if (count < 10) {
		count++;
		$('div.amount input').val(count);
		
		var price = $('#salePrice').val() * count;
		$('.text-heading-2').text(formatNumber(price));
		$('span.amount').text(formatNumber(price));
	}
}
