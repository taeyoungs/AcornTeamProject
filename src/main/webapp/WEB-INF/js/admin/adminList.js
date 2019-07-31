$(function(){
	
	// 글쓰기 - 사진 hover 이벤트
	$("a.upload-types_item_photo").hover(function(){
		$(this).find(".upload-types_item_pictogram_contents>p").css("color", "white");
		$(this).find("p.upload-types_item_caption").css("color", "black");
		$(this).find(".upload-types_item_pictogram").toggleClass("changed");
		$(this).find(".upload-types_item_pictogram_contents>img").attr("src", "/image/common/camera white.png");
	}, function(){
		$(this).find(".upload-types_item_pictogram_contents>p").css("color", "black");
		$(this).find("p.upload-types_item_caption").css("color", "#bdbdbd");
		$(this).find(".upload-types_item_pictogram").toggleClass("changed");
		$(this).find(".upload-types_item_pictogram_contents>img").attr("src", "/image/common/camera.png");
	});
	// 글쓰기 - 집들이 hover 이벤트
	$("a.upload-types_item_project").hover(function(){
		$(this).find(".upload-types_item_pictogram_contents>p").css("color", "white");
		$(this).find("p.upload-types_item_caption").css("color", "black");
		$(this).find(".upload-types_item_pictogram").toggleClass("changed");
		$(this).find(".upload-types_item_pictogram_contents>img").attr("src", "/image/common/zipdle white.png");
	}, function(){
		$(this).find(".upload-types_item_pictogram_contents>p").css("color", "black");
		$(this).find("p.upload-types_item_caption").css("color", "#bdbdbd");
		$(this).find(".upload-types_item_pictogram").toggleClass("changed");
		$(this).find(".upload-types_item_pictogram_contents>img").attr("src", "/image/common/zipdle.png");
	});
	// 글쓰기 - 전문가 hover 이벤트
	$("a.upload-types_item_member").hover(function(){
		$(this).find(".upload-types_item_pictogram_contents>p").css("color", "white");
		$(this).find("p.upload-types_item_caption").css("color", "black");
		$(this).find(".upload-types_item_pictogram").toggleClass("changed");
		$(this).find(".upload-types_item_pictogram_contents>img").attr("src", "/image/common/member white.png");
	}, function(){
		$(this).find(".upload-types_item_pictogram_contents>p").css("color", "black");
		$(this).find("p.upload-types_item_caption").css("color", "#bdbdbd");
		$(this).find(".upload-types_item_pictogram").toggleClass("changed");
		$(this).find(".upload-types_item_pictogram_contents>img").attr("src", "/image/common/member.png");
	});
	// 글쓰기 - 질문하기 hover 이벤트
	$("a.upload-types_item_qna").hover(function(){
		$(this).find(".upload-types_item_pictogram_contents>p").css("color", "white");
		$(this).find("p.upload-types_item_caption").css("color", "black");
		$(this).find(".upload-types_item_pictogram").toggleClass("changed");
		$(this).find(".upload-types_item_pictogram_contents>img").attr("src", "/image/common/question mark white.png");
	}, function(){
		$(this).find(".upload-types_item_pictogram_contents>p").css("color", "black");
		$(this).find("p.upload-types_item_caption").css("color", "#bdbdbd");
		$(this).find(".upload-types_item_pictogram").toggleClass("changed");
		$(this).find(".upload-types_item_pictogram_contents>img").attr("src", "/image/common/question mark.png");
	});
	
});