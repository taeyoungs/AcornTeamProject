$(function(){
	$(".navi-primary_write-btn").hover(function(){
        $(this).css({
            "color": "white",
            "background-color": "#35C5F0"
        });
    }, function(){
        $(this).css({
            "color": "#09ADDB",
            "background-color": "transparent"
        });
    });
    $(".navi-primary_cart-btn").hover(function(){
        $(this).css({
            "background-color": "#35C5F0"
        });
        $(this).children("img").attr("src", "image/cart white.png");
    }, function(){
        $(this).css({
            "background-color": "transparent",
            "border": "none"
        });
        $(this).children("img").attr("src", "image/cart gray.png");
    });
    $("ul.navi-menu li").hover(function(){
        $(this).siblings().removeClass("active");
        $(this).addClass("active"); 
    }, function(){
        if(!$(this).hasClass("current")) {
            $(this).removeClass("active");
            $(this).siblings(".current").addClass("active");
        }
    });
    $("ul.navi-menu li").click(function(){
        $(this).siblings().removeClass("current");
        $(this).addClass("current");
        $(this).addClass("active");
        $(".navi-primary_menu").addClass("open");
    });
    $(window).scroll(function(){
        var height = $(this).scrollTop();
        if(height == 0) {
            $(".navi-secondary_container").css("top", "");
            $(".navi-secondary_container").addClass("open");
            $(".navi-primary_container").removeClass("float"); // float 클래스로 css fixed
            $(".navi-secondary_container").removeClass("float");
            $(".navi-primary_menu").addClass("open"); // open 클래스에 따라 메뉴 삼각형 표시
            $(".navi-primary-wrap").css("height", "auto");
            $(".navi-secondary-wrap").css("height", "auto");
        }
        if(height != 0) {
            $(".navi-secondary_container").removeClass("open");
            $(".navi-primary_container").addClass("float");
            $(".navi-secondary_container").addClass("float");
            $(".navi-primary_menu").removeClass("open");
            $(".navi-primary-wrap").css("height", "81px");   
            $(".navi-secondary-wrap").css("height", "51px");
        }
    });
    $(".navi-primary_container").hover(function(){
        $(".navi-secondary_container").addClass("open");
        $(".navi-primary_menu").addClass("open");
        $(".navi-secondary_container.float").css({
            "top": "81px"
        });
    }, function(){
        $(".navi-secondary_container.float").css({
            "top": "30px"
        });
    });
// 상세 메뉴 라인
    $(".navi-secondary_menu>ul li").hover(function(){
        $(this).children("a").css("color", "#35C5F0");
    }, function(){
        if(!$(this).hasClass("active")) {
            $(this).children("a").css("color", "black");
        }
    });
    $(".navi-secondary_menu>ul li").click(function(){
        $(this).siblings().find("a").css("color", "black");
        $(this).siblings().removeClass("active");
        $(this).addClass("active"); 
    });
});