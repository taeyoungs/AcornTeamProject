$(function(){
	$(".filter-bar__control-list__item").click(function(){
		$(this).find(".photolist-drop-down-menu").css({
			"visibility": "visible",
    		"opacity": "1",
    		"transform": "none",
    		"transition": "opacity 0.1s, transform 0.1s"
		});
	});
});