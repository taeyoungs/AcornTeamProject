$(function(){
	// 글쓰기 버튼 hover 이벤트
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
	// 장바구니 버튼 hover 이벤트
    $(".navi-primary_cart-btn").hover(function(){
        $(this).css({
            "background-color": "#35C5F0"
        });
        $(this).children("img").attr("src", "/image/common/cart white.png");
    }, function(){
        $(this).css({
            "background-color": "transparent",
            "border": "none"
        });
        $(this).children("img").attr("src", "/image/common/cart gray.png");
    });
    // 로그인 후 알림 버튼 hover 이벤트
    $(".navi-primary_notification-btn").hover(function(){
        $(this).css({
            "background-color": "#35C5F0"
        });
        $(this).children("img").attr("src", "/image/common/notification white.png");
    }, function(){
        $(this).css({
            "background-color": "transparent",
            "border": "none"
        });
        $(this).children("img").attr("src", "/image/common/notification gray.png");
    });
    $(".navi-primary_user_header").hover(function(){
        $(this).find("img:eq(0)").css({
            "border-color": "#35C5F0"
        });
        $(this).find("img.navi-primary_user-btn").attr("src", "/image/common/button hover.png");
    }, function(){
        $(this).find("img:eq(0)").css({
            "border-color": "transparent"
        });
        $(this).find("img.navi-primary_user-btn").attr("src", "/image/common/button.png");
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
    // 상단 메뉴 hover 이벤트 때 active 클래스 지정
    $("ul.navi-menu li").hover(function(){
        $(this).siblings().removeClass("active");
        $(this).addClass("active");
        if($(this).find("div").hasClass("community")) {
        	$(".navi-secondary_menu").eq(0).css("display", "block");
        	$(".navi-secondary_menu").eq(1).css("display", "none");
        } else if($(this).find("div").hasClass("store")) {
        	$(".navi-secondary_menu").eq(1).css("display", "block");
        	$(".navi-secondary_menu").eq(0).css("display", "none");
        }
    });
    // 상단 메뉴 영역 나갔을 때 current 클래스를 가지고 있는 세컨더리 메뉴가 표시되도록
    $("#navi").mouseleave(function(){
    	 var current = $(".navi-menu_primary").siblings(".current");
    	 if($(current).find("div").hasClass("community")) {
         	$(".navi-secondary_menu").eq(0).css("display", "block");
         	$(".navi-secondary_menu").eq(1).css("display", "none");
         } else if($(current).find("div").hasClass("store")) {
         	$(".navi-secondary_menu").eq(1).css("display", "block");
         	$(".navi-secondary_menu").eq(0).css("display", "none");
         }
    	 $(".navi-menu_primary").siblings().removeClass("active");
    	 $(current).addClass("active");
    });
    
    // 스크롤 움직였을 때 상단메뉴 fixed
    var secondaryTop = $(".navi-secondary_container").attr("data-offset");
    $(window).scroll(function(){
        var height = $(this).scrollTop();
        if(height == 0 && secondaryTop != -51) {
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
            if(secondaryTop != -51) {
            	$(".navi-primary-wrap").css("height", "81px");  
            }	
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
    
    // 세컨더리 메뉴 라인
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
    
    // 글쓰기 리스트 페이지 이동 후 세컨더리 메뉴 숨기기
    secondaryTop = parseInt(secondaryTop);
    if(secondaryTop == -51) {
    	$(".navi-secondary_container").css({
    		"position": "fixed",
    		"top": secondaryTop,
    		"bottom": "auto"
    	});
    	$(".navi-primary_menu").removeClass("open");
    	$(".navi-menu li").removeClass("active");
    	$(".navi-menu li").removeClass("current");
    }
});

//function sendWPage(name) {
//	console.log(name);
//	if(name == '사진') {
//		alert(name);
//		$.ajax({
//			url: "../photo/photolist.do",
//			type: "POST",
//			dataType: "json",
//			data: JSON.stringify({"myCondition": name}),
//			contentType : 'application/json; charset=UTF-8',
//			success: function(redata) {
//				alert("성공")
//			}
//		});
//	}
//}