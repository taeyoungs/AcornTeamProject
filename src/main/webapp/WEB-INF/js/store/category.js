$(function(){
	$(".filter-bar-order-button").hover(
		function(){$(".animated-popout").addClass("open open-active")},
		function(){$(".animated-popout").removeClass("open open-active")}
	);
	
	$(".popout").hover(
			function(){$(".animated-popout").addClass("open open-active")},
			function(){$(".animated-popout").removeClass("open open-active")}
	);
	
/*	$(".filter-bar-order-button").mouseenter(function(){
		$(this).find(".drop-down-panel").css({
			"visibility": "visible",
    		"opacity": "1",
    		"transform": "none",
    		"transition": "opacity 0.1s, transform 0.1s"
		});
	});
	
	$(".filter-bar-order-button").mouseleave(function(){
		$(this).find(".drop-down-panel").css({
			"visibility": "hidden"
		});
	});*/
	
	$(".panel-entry-list__item-wrap").hover(
			function(){$(this).addClass("selected")},
			function(){$(this).removeClass("selected")
	});
	
	$(".panel-entry-list__item").hover(
			function(){$(this).addClass("selected")},
			function(){$(this).removeClass("selected")
	});
	
});