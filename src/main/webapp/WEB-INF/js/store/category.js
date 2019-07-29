$(function(){
	//정렬 설정 HOVER - 인기순/최신순/가격높은순/가격낮은순
	$(".filter-bar-order-button").hover(
		function(){
			$('#select_menu').css('display','block');
			$("#select_menu .animated-popout").addClass("open open-active")
		},
		function(){
			if ( $(".popout:hover").length == 0 ) {
				$('#select_menu').css('display','none');
				$("#select_menu .animated-popout").removeClass("open open-active");
			};
		}
	);
	
	$("#select_menu .popout").hover(
			function(){/*$("#select_menu .animated-popout").addClass("open open-active")*/},
			function(){
				if ( $(".filter-bar-order-button:hover").length == 0 ) {
					$('#select_menu').css('display','none');
					$("#select_menu .animated-popout").removeClass("open open-active");
				};
			}
	);
	
	
	//가격 설정 HOVER [S]
	$(".filter-bar-control__button").hover(
			function(){
				$('#select_price').css('display','block');
				$("#select_price .animated-popout").addClass("open open-active")
			},
			function(){
				if ( $(".popout:hover").length == 0 ) {
					$('#select_price').css('display','none');
					$("#select_price .animated-popout").removeClass("open open-active");
				}
			}
	);
	
	var initMinPrice = $("#minPrice").val();
	var initMaxPrice = $("#maxPrice").val();
	$("#select_price .popout").hover(
			function(){/*$("#select_price .animated-popout").addClass("open open-active")*/},
			function(){
				if ( $(".filter-bar-control__button:hover").length == 0 ) {
					$('#select_price').css('display','none');
					$("#select_price .animated-popout").removeClass("open open-active");
				};
				
				var currMinPrice = $("#minPrice").val();
				var currMaxPrice = $("#maxPrice").val();
				if (initMinPrice != currMinPrice || initMaxPrice != currMaxPrice) {
					var frm = $("#frm");
					$("#currentPage").val("1");
					frm.submit();
				}
			}
	);
	
	
	var sortingVal = $('#sorting').val();
	var txt = '';
	if (sortingVal == 'pop') {
		txt = '인기순';
	}else if(sortingVal == 'highPrice') {
		txt = '높은가격순';
	}else if(sortingVal == 'lowPrice') {
		txt = '낮은가격순';
	}else if(sortingVal == 'new') {
		txt = '최신순';
	}
	
	$('#sortBtnTxt').text(txt);

});

function submit() {
	var frm = $("#frm");
	$("#currentPage").val("1");
	frm.submit();
}
//가격 옵션 전체 리셋
function resetOptions() {
	$("#minPrice").val('');
	$("#maxPrice").val('');
	submit();
}

//가격 옵션 최소금액 리셋
function resetMinPrice() {
	$("#minPrice").val('');
	submit();
}

//가격 옵션 최대금액 리셋
function resetMaxPrice() {
	$("#maxPrice").val('');
	submit();
}

function changeSort(param){
	var sorting = $("#sorting");
	sorting.val(param);
	$("#currentPage").val("1");
	frm.submit();
}

//Number Format
function formatNumber(prodPrice) {
	  return prodPrice.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');
}

var doAjax = true;
var currentPage = 1;
function categoryAjax(){
	if (doAjax) {
		doAjax = false;
		currentPage++;
		$("#currentPage").val(currentPage);
		$.ajax({
			url:"/store/categoryAjax.do",
			type:"post",
			data:$('#frm').serialize(),
			dataType:"text",
			success:function(data){
				data = JSON.parse(data);
				var totalCount = data.totalCount;
				var prodList = JSON.parse(data.prodList);
				for(var i=0; i<prodList.length; i++){
					var prod = prodList[i];
					var html = '';
					html += '<li class="col-6 col-lg-4">';
					html += 	'<div class="product-item">';
					html += 		'<div class="product-item__image">';
					html += 			'<a href="/store/selling.do?prodNo='+prod.prodNo+'">';
					html += 				'<img class="image" src="'+prod.prodImage+'"/>';
					html += 			'</a>';
					html += 		'</div>';
					html += 		'<a href="/store/selling.do?prodNo='+prod.prodNo+'">';
					html += 			'<div class="product-item__info">';
					html += 				'<div class="product-item__info__title">';
					html += 					'<p class="product-item__info__title__brand">'+prod.prodSeller+'</p>';
					html += 					'<p>'+prod.prodTitle+'</p>';
					html += 				'</div>';
					html += 				'<div class="product-item__info__col">';
					html += 					'<div class="product-item__info__price">';
					html += 						'<span class="discount-rate">'+prod.discountRate+'%</span>';
					html += 						'<strong>'+formatNumber(prod.prodPrice)+'</strong>';
					html += 					'</div>';
					html += 				'</div>';
					html += 				'<div class="product-item__info__col">';
					html += 					'<div class="product-item__info__stats review">';
					if (prod.reviewCnt == 0){
						html +=						'조회 '+ prodList[i].prodHits;
					}
					if (prod.reviewCnt!= 0){
						html += 					'<svg width:"24" height="24" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet" style="color: rgb(53, 197, 240); width: 12px; height: 12px;">';
						html += 						'<path fill="currentColor" fill-rule="evenodd" d="M12 19.72l-5.677 2.405c-.76.322-1.318-.094-1.247-.906l.533-6.142-4.042-4.656c-.54-.624-.317-1.283.477-1.467l6.006-1.39L11.23 2.28c.426-.707 1.122-.699 1.542 0l3.179 5.282 6.006 1.391c.805.187 1.011.851.477 1.467l-4.042 4.656.533 6.142c.072.822-.497 1.224-1.247.906L12 19.72z"></path>';
						html += 					'</svg>';
						html += 					'<strong>'+prod.starGrade/prod.reviewCnt+'</strong>';
						html += 					'리뷰 '+prod.reviewCnt;						
					}
					html += 					'</div>';
					html += 				'</div>';
					html += 			'</div>';
					html += 		'</a>';
					html += 	'</div>';
					html += '</li>';
					$('ul.category-feed__content__content').append(html);
				}
				doAjax = true;
			},
			fail:function(error){
				console.log(error);
				doAjax = true;
			}
		});		
	}
}

$(window).scroll(function(){
	var scrollTop = $(window).scrollTop();
	var dh = $(document).height();
	var wh = $(window).height();
	var ch = (dh-wh)*0.8;
	//console.log(scrollTop+' : '+ch);
	if (scrollTop >= ch) {
		categoryAjax();
	}
});