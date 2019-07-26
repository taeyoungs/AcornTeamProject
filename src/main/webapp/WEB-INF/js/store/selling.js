//상품 수량 옵션
$(function(){
	$('div.amount span.down').click(function(){
		minus();
	});
	$('div.amount span.up').click(function(){
		plus();
	});
	
	$('li').click(function(){
		var dataTarget = $(this).attr('data-target');
		if (dataTarget != null) {
			location.href = '#' + dataTarget;
		}
	})
	
	//별점 평가
	$('.starRev span').click(function(){
	     $(this).parent().children('span').removeClass('on');
	     $(this).addClass('on').prevAll('span').addClass('on');
	     var star_score =  $(this).text();
	     $("#star_score").val(star_score);
	     alert($("#star_score").val());
	     return false;
	 });
	
	//취소하기 버튼 클릭 시 confirm -> 리뷰 팝업창 CLOSE
	$(".cancel").click(function() {
		var result = confirm("작성 중인 내용이 사라집니다.");
		if(result){
			$(".ui-popup").css("display", "none");
		}
	});
});



//리뷰쓰기 버튼 클릭 시 팝업 
function openReviewPopUp(e) {
	e.preventDefault();
	$(".ui-popup").css("display", "block");
}

//Number Format
function formatNumber(price) {
	  return price.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');
}

function minus() {
	var count = Number($('div.amount input').val());
	if (count > 1) {
		count--;
		$('div.amount input').val(count);

		var price = $('#salePrice').val() * count;
		$('.text-heading-2').text(formatNumber(price));
		$('span.amount').text(formatNumber(price));
	}
}

function plus() {
	var count = Number($('div.amount input').val());
	if (count < 10) {
		count++;
		$('div.amount input').val(count);
		
		var price = $('#salePrice').val() * count;
		$('.text-heading-2').text(formatNumber(price));
		$('span.amount').text(formatNumber(price));
	}
}


//리뷰쓰기 - 별점평가
$('.select_star>.star>.star_image>.star.empty').mouseenter(function() {
	alert("선택");
	$('.star_image>.star.empty').removeClass('empty')
	$('.star_image>.star').addClass('filled')
});

//리뷰쓰기 - 업로드 파일 이미지 미리보기
var sel_file;

$(document).ready(function() {
	$("#card_uploader").on("change", handleImgFileSelect);
	
	$("#delete_review_card").click(function() {
		$('#previewImage').attr('src', '');
		
		if ($('#previewImage').attr('src') == '')
		{
			$("#upload_panel").css("display", "none");
		}else{
			$("#upload_panel").css("display", "block");
		}
	});
});

function handleImgFileSelect (e) {
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	filesArr.forEach(function (f) {
		if(!f.type.match("image.*")){
			alert("이미지 확장자만 가능");
			return;
		}
		
		sel_file = f;
		
		var reader = new FileReader();
		reader.onload = function(e) {
			$("#previewImage").attr("src", e.target.result);
			
			//리뷰 파일 선택 시 이미지 미리보기
			if ($('#previewImage').attr('src') != '')
			{
				$("#upload_panel").css("display", "block");
			}
		}
		reader.readAsDataURL(f);
	});
}



