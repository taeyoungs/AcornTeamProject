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
        $(this).children("img").attr("src", "/image/cart white.png");
    }, function(){
        $(this).css({
            "background-color": "transparent",
            "border": "none"
        });
        $(this).children("img").attr("src", "/image/cart gray.png");
    });
    $(".navi-primary_notification-btn").hover(function(){
        $(this).css({
            "background-color": "#35C5F0"
        });
        $(this).children("img").attr("src", "/image/notification white.png");
    }, function(){
        $(this).css({
            "background-color": "transparent",
            "border": "none"
        });
        $(this).children("img").attr("src", "/image/notification gray.png");
    });
    $(".navi-primary_user_header").hover(function(){
        $(this).find("img:eq(0)").css({
            "border-color": "#35C5F0"
        });
        $(this).find("img.navi-primary_user-btn").attr("src", "/image/button hover.png");
    }, function(){
        $(this).find("img:eq(0)").css({
            "border-color": "transparent"
        });
        $(this).find("img.navi-primary_user-btn").attr("src", "/image/button.png");
    });
    // 로그인 후 유저 메뉴 클릭시 이벤트
    $(".navi-primary_user").click(function(){
    	$(this).find(".navi-primary_user_list").css({
    		"visibility": "visible",
    		"opacity": "1",
    		"transform": "none",
    		"transition": "opacity 0.1s, transform 0.1s"
    	});
    });
    // 유저 메뉴 숨기는 이벤트 (메뉴 외에 다른 영역 클릭)
    $(document).mouseup(function(e){
    	var container = $(".navi-primary_user");
    	
    	if(container.has(e.target).length == 0) {
    		container.find(".navi-primary_user_list").css({
    			"visibility": "hidden",
        		"opacity": "0",
        		"transform": "translateY(-20px)",
        		"transition": "visibility 0s ease 0.1s, opacity 0.1s, transform 0.1s"
    		});
    	}
    });
    // 유저 메뉴 hover 이벤트 (어디에 마우스가 위치해있는지 확인하는 이벤트)
    $("ul.navi-user-menu li").hover(function(){
    	$(this).find("a").css({
    		"color": "white",
    		"background-color": "#35C5F0",
    		"font-weight": "bold"
    	});
    }, function(){
    	$(this).find("a").css({
    		"color": "#424242",
    		"background-color": "transparent",
    		"font-weight": "normal"
    	});
    });
    // 상단 메뉴 hover 이벤트 때 active랑 current 클래스 지정
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
    
    // 스크롤 움직였을 때 상단메뉴 fixed
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
    
    // 스크롤 움직인 후 상단메뉴 hover -> 세컨더리 메뉴 노출 여부
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
    // 스크롤 움직인 후 상단메뉴 hover -> 세컨더리 메뉴 노출 여부
    $("div.navi-secondary").hover(function(){
        $(".navi-secondary_container").addClass("open");
        $(".navi-primary_menu").addClass("open");
        $(".navi-secondary_container.float").css({
            "top": "81px"
        });
    }, function(){
        $(".navi-secondary_container.float").css({
            "top": "30px"
        });
        
        if($(window).scrollTop() != 0) {
        	$(".navi-primary_menu").removeClass("open");
        }
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