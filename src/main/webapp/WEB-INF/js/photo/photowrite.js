$(function(){
	$('.Photo-Write-Form_photo-image-upload').click(function(){
		$(".file").click();
		var th = $(this);
		
		$(document).on('change','.file',function(){
			readURL(this, th);
		});
	});
	 
	$(".keyword-input_input-item").on("keydown",function(key){
		console.log(key.keycode);
		var hashtagList = `<div class="keyword-input_input-item" style="display:inline-block">
		<input class="keyword-input_input-item_input" value="" placeholder="해쉬태그" 
			style="box-sizing: context-box; width: 55px;">
		</div>`
		if(key.keyCode == 9){
			$(this).append(hashtagList);
		}
	});
	
	$(".card-collection-form__card-section__upload-button").click(function(e){
		$(".file").click();
		var th = $(this);
		$(document).one('change','.file',function(e){
			readURL2(this, th);
		});
	});
	
	$("#testbtn").click(function(){
		changeChar();
	});
	
});

function readURL(input, th){
	var temp = "";
	if (input.files && input.files[0]){
		var reader = new FileReader();
		reader.onload = function (e){
			temp = e.target.result;
			
			var imageWrap = `<div class="card-collection-form__card-image card-collection-form__card-item__image focused" style="padding-bottom: 88%; display:block;">
				<img class="card-collection-form__card-image__image" src="${temp}" style="display:block;"></div>`
				if($(".Photo-Write-Form_photo-section_list_item").length==1){
					$(th).parent().append(imageWrap);
				}
				$(th).remove();
							
				$(".card-collection-form__card-section__upload-button").insertAfter(".Photo-Write-Form_photo-section_list");
				$(".card-collection-form__card-section__upload-button").css("display","block");

		}
		reader.readAsDataURL(input.files[0]);

	}
}

function readURL2(input, th){
	var temp = "";
	if (input.files && input.files[0]){
		var reader = new FileReader();
		reader.onload = function (e){
			temp = e.target.result;
			var writeSection = `
				<li class="Photo-Write-Form_photo-section_list_item">
					<div class="Photo-Write-Form_photo-item">
						<div class="Photo-Write-Form_photo-item_image-wrap">
							<div class="card-collection-form__card-image card-collection-form__card-item__image focused" style="padding-bottom: 88%; display:block;">
								<img class="card-collection-form__card-image__image" src="${temp}" style="display:block;">
							</div>
						</div>
						<div class="Photo-Write-Form_photo-item_content">
							<div class="Photo-Write-Form_photo-item_content_row">
								<textarea class="form-control text-area-input" id="photo_content"
								placeholder="사진에 대해서 설명해주세요" style="height:160px;" name="photo_content_array"></textarea>
							</div>
							<div class="Photo-Write-Form_photo-item_content_row">
								<div class="keyword-input">
									<div class="keyword-input_input-item" style="display:inline-block">
										<input class="keyword-input_input-item_input" value="" placeholder="해쉬태그" name="hashtag"
										style="box-sizing: context-box; width: 55px;">
									</div>
								</div>
							</div>
						</div>
					</div>
				</li>`
			$(th).prev().append(writeSection);
		}
		reader.readAsDataURL(input.files[0]);
	}
}

function changeChar(){
	console.log("쿨락쿨락");
	console.log($("#photo_content").text());
	$("#photo_content").text("123213123123");
//	$(".text-area-input").text().replace(/,/gi, '|');
}

