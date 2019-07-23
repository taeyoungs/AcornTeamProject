$(function(){
	
	// 커버 이미지 파일 업로드, url 경로 저장
	$("input[name='cover_image_uploader']").change(function(){
		coverImg_readURL(this);
		$(".cover_icon").empty();
		var ti = "<div class='title' style='color:white;'>커버사진 변경</div>"
		$(".cover_icon").append(ti);
		
		var files = document.getElementById('cover_image_uploader').files;
		console.log(files.length);
		var formData = new FormData();
		for (var i = 0; i < files.length; i++) {
            formData.append("file" + i, files[i]);
        }
//	    formData.append('uploadFile', $('uploadFile')[0].files[0]);
	     
	    $.ajax({
	    	type: 'post',
	    	url: 'imageAjax',
	    	error: errorHandler,
	    	data: formData,
	    	contentType: false,
            processData: false,
            success: function(e) {
            	console.log(e);
            }
	    });
	});
	// 제목 글자수 제한
	$("#project_title").keyup(function(){
		var len = $(this).val().length;
		$("#title_count>span").text(len);
		
		if(len > 30	) {
			$(this).val($(this).val().substring(0, 40));
		}
	});
	// 지역 선택 시 두 번째 select 메뉴 출력
	$(".first_select").change(function(){
		if($(this).val() == "") {
			$(".second_select").css("display", "none");
		} else {
			$(".second_select").css("display", "block");
		}
	});
	
	$("#publish_submit").click(function(){
		var params = $("#project_form_wrap").serializeJSON();
		
		// 이놈을 통해서 데이터 출력
		console.log(params);
		
		// 이놈을 json 문자열 형태니까 ajax로 보내고
		console.log(JSON.stringify(params));
		var json = JSON.stringify(params);
		// json 문자열 -> json obejct 형태
//		console.log(JSON.parse(test));
		
		// upload ajax
		$.ajax({
			url:'uploadAjax',
			type: 'post',
			dataType: 'json',
			contentType: 'application/json',
			data: json,
			success: function(e){
				window.location.href = "/zipdle/gotoZipList";
			}, error:function(request,status,error){
			    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
		
	});
	
	// 추가하기 버튼 클릭할 때마다 파일 업로드 창 띄우기
	$(document).on('click', '.add_card_panel', function(){
		var th = $(this);
		$("#card_uploader").click();
		$("#card_uploader").one('change', function(){

			card_readURL(this, th);
		});
	});
	
	// 삭제 ajax
	$(document).on('click', '.delete', function(){
		
		var target = $(this).parent().next().find(".image_url").val();
		
		// delete ajax
		$.ajax({
			url:'deleteImageAjax',
			type: 'post',
			dataType: 'json',
			data: {
				"targetImage": target
			},
			success: function(){
			}
		});
			
		$(this).parent().parent().parent().remove();

	});
	
	// 한칸 올리기
	$(document).on('click', '.up', function() {
		var th = $(this).parent().parent().parent();
		var before = $(th).prev();
		if(!before.hasClass("first")) {
			
			$($(th).prev()).before($(th));
			
			var th2 = $(this).parent().parent().parent();
			var offset = th2.offset();

			$('html').animate({scrollTop : offset.top}, 200);
		} else {
			$("#flash_messages").css("display", "block");
			$("#flash_alert").text("맨 처음 컨텐츠입니다.");
			$("#flash_messages").delay(1500).fadeOut();
		}
	});
	
	// 한칸 내리기
	$(document).on('click', '.down', function() {
		var th = $(this).parent().parent().parent();
		var before = $(th).next();
		if(!before.hasClass("only_add_content")) {
			
			$($(th).next()).after($(th));
			
			var th2 = $(this).parent().parent().parent();
			var offset = th2.offset();

			$('html').animate({scrollTop : offset.top}, 200);
		} else {
			$("#flash_messages").css("display", "block");
			$("#flash_alert").text("맨 마지막 컨텐츠입니다.");
			$("#flash_messages").delay(1500).fadeOut();
		}
	});
	
//	$(".add_card_panel").on("click", function(){
//		console.log("가나다라");
//		var th = $(this);
//		$("#card_uploader").click();
//		$("#card_uploader").one('change', function(){
//			console.log("===========");
//			console.log($(th).parent());
//			console.log("===========");
//			card_readURL(this, th);
//		});
//	});
	
	// file 추가할 때마다 ajax로 컨트롤러 전송 -> 컨트롤러에서 파일 업로드
	$("#card_uploader").change(function(){
		var files = document.getElementById('card_uploader').files;
		console.log(files.length);
		var formData = new FormData();
		for (var i = 0; i < files.length; i++) {
            formData.append("file" + i, files[i]);
        }
//	    formData.append('uploadFile', $('uploadFile')[0].files[0]);
	     
	    $.ajax({
	    	type: 'post',
	    	url: 'imageAjax',
	    	error: errorHandler,
	    	data: formData,
	    	contentType: false,
            processData: false,
            success: function(e) {
            	console.log(e);
            }
	    });
	  
	});
});

function errorHandler(e) {
    alert("An error occurred");
}

function coverImg_readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
        	$("#cover_image_upload").css("background-image", "url('"+e.target.result+"')");
        	$("#project_cover_image_url").val("/uploadImage/zipdle/"+input.files[0].name);
        }
        reader.readAsDataURL(input.files[0]);
    }
}
let card_count = 0;
function card_readURL(input, th) {
	
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
//        	$("#cover_image_upload").css("background-image", "url('"+e.target.result+"')");
//        	$("#project_cover_image_url").val("/uploadImage/zipdle/cover_image"+input.files[0].name);
        	
        	var card_form = `
        				<div class="card_form upload_card_`+card_count+`">
        					<div class="add_card_panel">
								<div class="icon">
									<img src="/image/common/add.png" width="20">
								</div>
								<div class="text">이 곳에 사진 추가하기</div>
							</div>
							<div class="card_form_content">
								<textarea class="title" placeholder="제목이 필요하면 입력해주세요.(공백시 나타나지 않습니다.)" 
									name="data[zip_detail][`+card_count+`][sub_title]" id=""></textarea>
								<div class="move_delete_button">
									<div class="delete">
										<span class="icon">
											<img src="/image/common/cancel white.png" width="16">
										</span>
										<span class="text">삭제</span>
									</div>
									<div class="up">
										<span class="icon">
											<img src="/image/common/up-arrow2.png" width="16">
										</span>
										<span class="text">한칸<br>올리기</span>
									</div>
									<div class="down">
										<span class="icon">
											<img src="/image/common/down-arrow2.png" width="16">
										</span>
										<span class="text">한칸<br>내리기</span>
									</div>
								</div>
								<div class="content_panel">
									<div class="input">
										<input class="image_url" type="hidden" name="data[zip_detail][`+card_count+`][image_url]"
											id="cards_image_url" value="/uploadImage/images/`+input.files[0].name+`">
										<div class="image">
											<img src="`+e.target.result+`" class="image" style="height: initial;">
											<input class="source" placeholder="출처 URL이 있다면 입력해주세요.(http://를 꼭 붙여주세요.)"
												type="text" id="">
										</div>
										<div class="user_input">
											<div class="content_space" contenteditable="true"
											data-ph="사진에 대한 설명을 써주세요."></div>
										</div>
										<textarea class="description" name="data[zip_detail][`+card_count+`][content]" id="cards_content"
											style="display: none;"></textarea>
									</div>
								</div>
							</div>
        				</div>
        	`
			$(th).parent().before(card_form);
        	card_count++;
        }
        reader.readAsDataURL(input.files[0]);
    }
}