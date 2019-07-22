$(function(){
	//정렬 설정 HOVER - 인기순/최신순/가격높은순/가격낮은순
	$(".filter-bar-order-button").hover(
		function(){$("#select_menu .animated-popout").addClass("open open-active")},
		function(){$("#select_menu .animated-popout").removeClass("open open-active")}
	);
	
	$("#select_menu .popout").hover(
			function(){$("#select_menu .animated-popout").addClass("open open-active")},
			function(){$("#select_menu .animated-popout").removeClass("open open-active")}
	);
	
	//가격 설정 HOVER
	$(".filter-bar-control__button").hover(
			function(){$("#select_price .animated-popout").addClass("open open-active")},
			function(){$("#select_price .animated-popout").removeClass("open open-active")}
	);
	
	$("#select_price .popout").hover(
			function(){$("#select_price .animated-popout").addClass("open open-active")},
			function(){$("#select_price .animated-popout").removeClass("open open-active")}
	);
	
	
	//공통
	$(".panel-entry-list__item-wrap").hover(
			function(){$(this).addClass("selected")},
			function(){$(this).removeClass("selected")
	});
	
	$(".panel-entry-list__item").hover(
			function(){$(this).addClass("selected")},
			function(){$(this).removeClass("selected")
	});
	
});